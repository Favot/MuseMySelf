// Show tabs for user_journeys#index

const displayTab = (event) => {
  const tabButtons = document.querySelectorAll(".tab-button");
  const tabContents = document.querySelectorAll(".tab-content");

  const id = event.target.dataset.id;

  if (id) {
    tabButtons.forEach((button) => {
      button.classList.remove("btn-active");
    });
    event.target.classList.add("btn-active");

    tabContents.forEach((content) => {
      content.classList.remove("show");
      if (content.id == id) {
        const hiddenContent = document.getElementById(id);
        hiddenContent.classList.add("show");
      }
    });
  }
};

export { displayTab };
