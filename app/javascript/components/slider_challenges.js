const sliderChallenges = () => {
  const valueChallenge = document.querySelector("#challenge_nb_days_veggie");
  const target = document.querySelector("#target-veggies-days");
  if (valueChallenge) {
    target.insertAdjacentHTML('beforeend', `${valueChallenge.value}` );
    $("#challenge_nb_days_veggie").on("input change", () => {
      target.innerText = "";
      target.insertAdjacentHTML('beforeend', `${valueChallenge.value}` );
    });
  }
}

export { sliderChallenges };
