const leafFollowUp = () => {
    const leafImg = document.querySelector(".leaf-empty > img")
    if (leafImg) {
      // subBtn.addEventListener("click", (event) => {

      // });
      const weekStatus = document.querySelector(".leaf-fill")
      console.log("oui je te vois");
      console.log(typeof(weekStatus.dataset.obj));
      const weekStatusInt = Number.parseInt(weekStatus.dataset.obj, 10);
      console.log(weekStatusInt);

      if (weekStatusInt == 0) {
        leafImg.classList.add("img-level0");
      } else if ( weekStatusInt > 0 && weekStatusInt < 10 ) {
          leafImg.classList.add("img-level0");
      } else if (weekStatusInt >= 10 && weekStatusInt < 20) {
          leafImg.classList.add("img-level10");
      } else if (weekStatusInt >= 20 && weekStatusInt < 30) {
          leafImg.classList.add("img-level20");
      } else if (weekStatusInt >= 30 && weekStatusInt < 40) {
          leafImg.classList.add("img-level30");
      } else if (weekStatusInt >= 40 && weekStatusInt < 50) {
          leafImg.classList.add("img-level40");
      } else if (weekStatusInt >= 50 && weekStatusInt < 60) {
          leafImg.classList.add("img-level50");
          console.log("ça fait 50%");
      } else if (weekStatusInt >= 60 && weekStatusInt < 70) {
          leafImg.classList.add("img-level60");
      } else if (weekStatusInt >= 70 && weekStatusInt < 80) {
          leafImg.classList.add("img-level70");
      } else if (weekStatusInt >= 80 && weekStatusInt < 90) {
          leafImg.classList.add("img-level80");
      } else if (weekStatusInt >= 90 && weekStatusInt < 100) {
          leafImg.classList.add("img-level90");
      } else {
        leafImg.classList.add("img-level100");
      }
  }
}

export { leafFollowUp };
