const loadLeft = (target) => {
  const io = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const contentTarget = entry.target;

        contentTarget.classList.add("animation-contend-left");

        observer.disconnect();
      }
    });
  });

  io.observe(target);
};

const loadRight = (target) => {
  const io = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const contentTarget = entry.target;

        contentTarget.classList.add("animation-contend-right");

        observer.disconnect();
      }
    });
  });

  io.observe(target);
};

const loadSvg = (target) => {
  const io = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const contentTarget = entry.target;

        contentTarget.classList.add("svg-show");

        observer.disconnect();
      }
    });
  });

  io.observe(target);
};

export const animationContentCard = () => {
  const animatedContentLeft = document.querySelectorAll(
    ".animated-contend-left"
  );

  animatedContentLeft.forEach(loadLeft);

  const animatedContentRight = document.querySelectorAll(
    ".animated-contend-right"
  );

  animatedContentRight.forEach(loadRight);

  const animatedSvg = document.querySelectorAll(".svg-animated");

  animatedSvg.forEach(loadSvg);
};
