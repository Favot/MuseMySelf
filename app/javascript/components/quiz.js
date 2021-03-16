// Show next question quiz_questions#index

const displayNextQuestion = () => {
  const nextBtn = document.getElementById("nextBtn");
  const endBtn = document.getElementById("endBtn");
  const backBtn = document.getElementById("backBtn");

  if (event.target == nextBtn){
    console.log(nextBtn);
  }

  if (event.target == endBtn){
    console.log(endBtn);
  }

  if (event.target == backBtn){
    console.log(backBtn);
  }

};

export {displayNextQuestion}
