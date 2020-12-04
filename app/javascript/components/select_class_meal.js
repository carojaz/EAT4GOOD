const selectClassMeal = () => {
    const cardFoodType = document.querySelector(".cardfoodtype");
    if (cardFoodType) {
      const breakfastVeggie = document.querySelector(".bveggie");
      const breakfastMeat = document.querySelector(".bmeat");
      const breakfastMilk = document.querySelector(".bmilk");
      const breakfastFish = document.querySelector(".bfish");
      const breakfastFasting = document.querySelector(".bfasting");

      const lunchVeggie = document.querySelector(".lveggie");
      const lunchMeat = document.querySelector(".lmeat");
      const lunchMilk = document.querySelector(".lmilk");
      const lunchFish = document.querySelector(".lfish");
      const lunchFasting = document.querySelector(".lfasting");

      const dinnerVeggie = document.querySelector(".dveggie");
      const dinnerMeat = document.querySelector(".dmeat");
      const dinnerMilk = document.querySelector(".dmilk");
      const dinnerFish = document.querySelector(".dfish");
      const dinnerFasting = document.querySelector(".dfasting");

      breakfastVeggie.addEventListener("click", (event) => {
        breakfastVeggie.classList.add("selected");
        breakfastMeat.classList.remove("selected");
        breakfastMilk.classList.remove("selected");
        breakfastFish.classList.remove("selected");
        breakfastFasting.classList.remove("selected");
    });
      breakfastMeat.addEventListener("click", (event) => {
        breakfastVeggie.classList.remove("selected");
        breakfastMeat.classList.add("selected");
        breakfastMilk.classList.remove("selected");
        breakfastFish.classList.remove("selected");
        breakfastFasting.classList.remove("selected");
    });
      breakfastMilk.addEventListener("click", (event) => {
        breakfastVeggie.classList.remove("selected");
        breakfastMeat.classList.remove("selected");
        breakfastMilk.classList.add("selected");
        breakfastFish.classList.remove("selected");
        breakfastFasting.classList.remove("selected");
    });
      breakfastFish.addEventListener("click", (event) => {
        breakfastVeggie.classList.remove("selected");
        breakfastMeat.classList.remove("selected");
        breakfastMilk.classList.remove("selected");
        breakfastFish.classList.add("selected");
        breakfastFasting.classList.remove("selected");
    });
      breakfastFasting.addEventListener("click", (event) => {
        breakfastVeggie.classList.remove("selected");
        breakfastMeat.classList.remove("selected");
        breakfastMilk.classList.remove("selected");
        breakfastFish.classList.remove("selected");
        breakfastFasting.classList.add("selected");
    });


      lunchVeggie.addEventListener("click", (event) => {
        console.log("ok");
        lunchVeggie.classList.add("selected");
        lunchMeat.classList.remove("selected");
        lunchMilk.classList.remove("selected");
        lunchFish.classList.remove("selected");
        lunchFasting.classList.remove("selected");
    });
      lunchMeat.addEventListener("click", (event) => {
        lunchVeggie.classList.remove("selected");
        lunchMeat.classList.add("selected");
        lunchMilk.classList.remove("selected");
        lunchFish.classList.remove("selected");
        lunchFasting.classList.remove("selected");
    });
      lunchMilk.addEventListener("click", (event) => {
        lunchVeggie.classList.remove("selected");
        lunchMeat.classList.remove("selected");
        lunchMilk.classList.add("selected");
        lunchFish.classList.remove("selected");
        lunchFasting.classList.remove("selected");
    });
      lunchFish.addEventListener("click", (event) => {
        lunchVeggie.classList.remove("selected");
        lunchMeat.classList.remove("selected");
        lunchMilk.classList.remove("selected");
        lunchFish.classList.add("selected");
        lunchFasting.classList.remove("selected");
    });
      lunchFasting.addEventListener("click", (event) => {
        lunchVeggie.classList.remove("selected");
        lunchMeat.classList.remove("selected");
        lunchMilk.classList.remove("selected");
        lunchFish.classList.remove("selected");
        lunchFasting.classList.add("selected");
    });

      dinnerVeggie.addEventListener("click", (event) => {
        console.log("ok");
        dinnerVeggie.classList.add("selected");
        dinnerMeat.classList.remove("selected");
        dinnerMilk.classList.remove("selected");
        dinnerFish.classList.remove("selected");
        dinnerFasting.classList.remove("selected");
    });
      dinnerMeat.addEventListener("click", (event) => {
        dinnerVeggie.classList.remove("selected");
        dinnerMeat.classList.add("selected");
        dinnerMilk.classList.remove("selected");
        dinnerFish.classList.remove("selected");
        dinnerFasting.classList.remove("selected");
    });
      dinnerMilk.addEventListener("click", (event) => {
        dinnerVeggie.classList.remove("selected");
        dinnerMeat.classList.remove("selected");
        dinnerMilk.classList.add("selected");
        dinnerFish.classList.remove("selected");
        dinnerFasting.classList.remove("selected");
    });
      dinnerFish.addEventListener("click", (event) => {
        dinnerVeggie.classList.remove("selected");
        dinnerMeat.classList.remove("selected");
        dinnerMilk.classList.remove("selected");
        dinnerFish.classList.add("selected");
        dinnerFasting.classList.remove("selected");
    });
      dinnerFasting.addEventListener("click", (event) => {
        dinnerVeggie.classList.remove("selected");
        dinnerMeat.classList.remove("selected");
        dinnerMilk.classList.remove("selected");
        dinnerFish.classList.remove("selected");
        dinnerFasting.classList.add("selected");
    });
  }
}

export { selectClassMeal };
