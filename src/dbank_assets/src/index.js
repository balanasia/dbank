import { QueryCallRejectedError } from "@dfinity/agent";
import {dbank} from "../../declarations/dbank";

//add event listener
//make the funciton async so that the value can update
window.addEventListener("load", async function(){
  update();
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();
  console.log("Submitted.");

  const button = event.target.querySelector("#submit-btn");

  //get the input value and withrdaw amount
  const inputAmount = parseFloat(Number(document.getElementById("input-amount").value));
  const withdrawalAmount = parseFloat(Number(document.getElementById("withdrawal-amount").value));
 
  //add different styling to let user know
  //that the button is not in use
  button.setAttribute("disabled", true);

  if (inputAmount) {
    await dbank.topUp(inputAmount);
    document.getElementById("input-amount").value = "";
  }
  if (withdrawalAmount) {
    await dbank.withdraw(withdrawalAmount);
    document.getElementById("withdrawal-amount").value = "";
  }

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  //add comput interest to the total value
  await dbank.compound();

  update();

  //remove styling once value is added
  button.removeAttribute("disabled");
});

//checks the balance and assigns it into the constant
//will await for the changes
async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}
