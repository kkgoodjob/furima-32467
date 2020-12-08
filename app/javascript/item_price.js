window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const addProfitDom = document.getElementById("profit")
    let addTaxDomTemporary = Math.ceil(inputValue * .1)
    addTaxDom.innerHTML = addTaxDomTemporary
    addProfitDom.innerHTML = inputValue - addTaxDomTemporary
  })
});
