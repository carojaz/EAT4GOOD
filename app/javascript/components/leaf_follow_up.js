const leafFollowUp = () => {
    const leafImg = document.querySelector(".leaf-empty > img")
    if (leafImg) {
      // subBtn.addEventListener("click", (event) => {

      // });
      const weekStatus = document.querySelector(".leaf-fill")
      console.log("oui je te vois");
      console.log(weekStatus.dataset.obj);

      if (weekStatus.dataset.obj == 0) {
        leafImg.classList.add("img-level0")
      } else if ( weekStatus.dataset.obj > 0 && weekStatus.dataset.obj < 10 ) {
          leafImg.classList.add("img-level0")
      } else if (weekStatus.dataset.obj > 10 && weekStatus.dataset.obj < 20) {
          leafImg.classList.add("img-level10")
      } else if (weekStatus.dataset.obj > 20 && weekStatus.dataset.obj < 30) {
          leafImg.classList.add("img-level20")
      } else if (weekStatus.dataset.obj > 30 && weekStatus.dataset.obj < 40) {
          leafImg.classList.add("img-level30")
      } else if (weekStatus.dataset.obj > 40 && weekStatus.dataset.obj < 50) {
          leafImg.classList.add("img-level40")
      } else if (weekStatus.dataset.obj > 50 && weekStatus.dataset.obj < 60) {
          leafImg.classList.add("img-level50")
      } else if (weekStatus.dataset.obj > 60 && weekStatus.dataset.obj < 70) {
          leafImg.classList.add("img-level60")
      } else if (weekStatus.dataset.obj > 70 && weekStatus.dataset.obj < 80) {
          leafImg.classList.add("img-level70")
      } else if (weekStatus.dataset.obj > 80 && weekStatus.dataset.obj < 90) {
          leafImg.classList.add("img-level80")
      } else if (weekStatus.dataset.obj > 90 && weekStatus.dataset.obj < 100) {
          leafImg.classList.add("img-level90")
      } else {
        leafImg.classList.add("img-level100")
      }
  }
}

export { leafFollowUp };
