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

  let quizBtns = document.querySelectorAll('.quiz-next-btn');
  let quizContainer = document.querySelectorAll('.quiz-container');
  // Hide all questions
  quizContainer.forEach((quiz) => {
    quiz.classList.add('hide-quiz');
  });
  // Show only first one
  quizContainer[0].classList.remove("hide-quiz");

  quizBtns.forEach((btn) => {
    btn.addEventListener('click', function (e) {
      let numb = btn.id.match(/\d/g);
      numb = numb.join("");
      numb = parseInt(numb, 10);
      let containerToHide = document.getElementById(`quiz-container-${numb-1}`);
      let containerToShow = document.getElementById(`quiz-container-${numb}`);

      containerToHide.classList.add("fade-out");

      setTimeout(function(){
        containerToHide.classList.add("hide-quiz");
       }, 800);

      containerToShow.classList.add("fade-in");
      containerToShow.classList.remove("hide-quiz");

    });
  })
};

export {displayNextQuestion}
