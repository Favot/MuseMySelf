// Save user answer quiz_questions#index

const saveUserAnswer = () => {
  const answers = document.querySelectorAll(".for-checkbox-answers");

  answers.forEach((answer) => {
    if (event.target == answer){
      const userAnswer = answer.innerHTML
      console.log(userAnswer);

      if (localStorage) {
          localStorage.answer = userAnswer;
      }
      console.log(localStorage);
    }
  });
};

export {saveUserAnswer}
