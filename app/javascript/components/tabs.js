// Adding .active on clicked tab for user_journeys#index

const displayTab = () => {
  // console.log(event.target)

  const tabs = document.querySelector("#myTabs");
  const tabButton = document.querySelectorAll(".tab-button");
  const contents = document.querySelectorAll(".tab-content");

  const id = event.target.id;
  if (id) {
    tabButton.forEach((button) => {
      button.classList.remove("btn-active");
    });
    event.target.classList.add("btn-active");

    contents.forEach((content) => {
      content.classList.remove("active");
    });
    const hiddenContent = document.getElementById(id);
    hiddenContent.classList.add("active");
  }
};

export {displayTab}
