const sliderValue = () => {
  const value = document.querySelector("#objective_veggies_days");
  const target = document.querySelector("#target-veggies-days");
  if (value) {
    target.insertAdjacentHTML('beforeend', `${value.value}` );
    $("#objective_veggies_days").on("input change", () => {
      target.innerText = "";
      target.insertAdjacentHTML('beforeend', `${value.value}` );
    });
  }
}

export { sliderValue };
