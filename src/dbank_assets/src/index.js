import {dbank} from "../../declarations/dbank";

//add event listener
//make the funciton async so that the value can update
window.addEventListener("load", async function(){
  //checks the balance and assigns it into the constant
  //will await for the changes
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
});
