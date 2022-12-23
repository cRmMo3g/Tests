import React, { useState, useEffect } from "react";
import Axios from "axios";
import ProgressBar from "../node_modules/react-bootstrap/ProgressBar";
import "./App.css";

function App() {
  const url = "http://localhost/DB/question.php"; // Jautājumu izvade.
  const url2 = "http://localhost/DB/category.php"; // Kategoriju izvade
  const url3 = "http://localhost/DB/answer.php"; // Nospiesto jautājumu ievade serverī
  const url4 = "http://localhost/DB/complete.php"; // Rezultāta ievade datubāzē

  // piešķiram mainīgajiem sākumvērtības. (izveidojam mainīgos)
  const [data, setData] = useState([]);
  const [data2, setData2] = useState([]);
  const [category, setCategory] = useState([]);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [score, setScore] = useState(0);
  const [showScore, setShowScore] = useState(false);
  const [name, setName] = useState("");
  const [firstName, setFirstName] = useState("");
  const [getCategory, setGetCategory] = useState();
  const [question, setQuestion] = useState();
  const [point, setPoint] = useState("punkta");

  // Datu iegūšana no servera. (MySql)
  useEffect(() => {
    const fetchData = async () => {
      try {
        setData(await (await fetch(url)).json());
        setData2(await (await fetch(url2)).json());
      } catch (error) {
        console.log("error", error);
      }
    };

    fetchData();
  }, []);

  // Datu nosūtīšana uz serveri (mysql). Par katru izvēlēto lietotāja atbildi (Vārds, Kategorija, Jautājumms, vai pareizi atbildējis)
  const questionToAnswer = (q) => {
    let fData = new FormData();
    fData.append("firstName", firstName);
    fData.append("category", getCategory);
    fData.append("question", question[currentQuestion].question);
    fData.append("answer", q.answer);
    fData.append("correct", q.isValidate);
    Axios.post(url3, fData);

    // pārbaudam ieguto punktu daudzskaitli
    if (1 > currentQuestion) {
      setPoint("punkta");
    } else {
      setPoint("punktiem");
    }

    if (q.isValidate) {
      setScore(score + 1);
    }

    const nextQuestion = currentQuestion + 1;

    // Pārbaudam vai testu jautājumi beigušies (parbaudam vai jautājummu secība nepārsniedz, jautājumu esamības daudzumu), un vai varam tos nosūtīt uz serveri.
    if (nextQuestion < question.length) {
    } else {
      let complete = new FormData();
      complete.append("firstName", firstName);
      complete.append("category", getCategory);
      complete.append("correct", score);
      Axios.post(url4, complete);
    }

    // Pārbaudām vai tests ir noslēdzies, atrādam atbilžu skaitli (pārbaudām vai jautājumu secība nepārsniedz jautājumu esamības daudzumu)
    if (nextQuestion < question.length) {
      setCurrentQuestion(nextQuestion);
    } else {
      setShowScore(true);
    }
  };

  // Atgriežam datus noklusējuma vērtībās, kad tests ir izpildīts
  const refresh = () => {
    setCurrentQuestion(0);
    setScore(0);
    setShowScore(false);
    setName("");
  };

  // Iegūst testa lietotāju, kategoriju pārvērš no string uz number vērtību, iestatām kategoriju pēc kuras atlasam jautājumus
  const handleSubmit = (event) => {
    setName(firstName);
    setCategory(category);
    setQuestion(data.filter((data) => data.group_id === Number(getCategory)));
  };

  // Pārbaudam vai vārds ir uzrakstīts atbilstoši atļautajiem simboliem, paziņojums ja nav korekta ievade
  const firstNameValidation = (event) => {
    const regex = new RegExp(/^[A-Za-z\-āčēģīķļņšūžĀČĒĢĪĶĻŅŠŪŽ]*$/);
    if (regex.test(event)) {
      setFirstName(event);
    } else {
      alert(
        "Pielietot var tikai rakstzīmes piemērs: Vārds (a-Z), bez atstarpēm."
      );
    }
  };

  // Progresbar - Jautājumus un to skaitu procentos.
  function Bar() {
    const count = 100 / question.length;
    const now = (currentQuestion + 1) * count;
    return <ProgressBar now={now} />;
  }

  // Pārbaudi veicam pēc tā vai ievadīts vārds
  if (!name) {
    return (
      <div className="content">
        <div className="main_box">
          <span>Sveicināts, jūs varat uzsākt testa izpildi</span>
        </div>
        <div className="second_box">
          <form onSubmit={handleSubmit}>
            <h1>Aizpildiet nepieciešamos laukus</h1>
            <div className="second_box_item_input">
              <label>Ievadi savu vārdu:</label>
              <input
                onInvalid={(e) => e.target.setCustomValidity("Ievadi vārdu")}
                onInput={(e) => e.target.setCustomValidity("")}
                placeholder="ievadiet savu vārdu"
                type="text"
                value={firstName}
                onChange={(e) => firstNameValidation(e.target.value)}
                required
              />
            </div>
            <div className="second_box_item_select">
              <label>Izvēlieties testu:</label>
              <select
                onInvalid={(e) =>
                  e.target.setCustomValidity("Izvēlies kategoriju")
                }
                onInput={(e) => e.target.setCustomValidity("")}
                onChange={(e) => setGetCategory(e.target.value)}
                required
              >
                <option value="">-- Izvēlies kategoriju --</option>
                {data2.map((category) => (
                  <option key={category.id} value={category.id}>
                    {category.category}
                  </option>
                ))}
              </select>
            </div>
            <button type="submit">Sākt pildīt testu</button>
          </form>
        </div>
      </div>
    );
  }
  // Pēc vārda un kategorijas atlases dodamies uz nāko soli, Jautājumi.
  else
    return (
      <div className="content">
        {showScore ? (
          <div className="second_box">
            <div className="answer_box">
              <h1>Paldies, {name}!</h1>
              <h2>
                Jūs ieguvāt {score} no {question.length} {point} !
              </h2>
            </div>

            <button className="back" onClick={refresh}>
              Atgriezties uz sākumu
            </button>
          </div>
        ) : (
          // pārbaudam vai uz visiem jautājummiem saņēmām atbildi, atrādam rezultātu
          <>
            <div className="main_box">
              <span>{question[currentQuestion].question}</span>
            </div>
            <div className="second_box">
              <div className="question_box">
                {question[currentQuestion].answers.map((q, index) => {
                  return (
                    <button
                      type="button"
                      key={index}
                      onClick={() => questionToAnswer(q)}
                    >
                      {q.answer}
                    </button>
                  );
                })}
              </div>
              <h1>
                <Bar />
              </h1>
            </div>
          </>
        )}
      </div>
    );
}

export default App;
