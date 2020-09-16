window.addEventListener("load", function(){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('input',function(){
    const tax = 10;
    let price = document.getElementById("item-price").value;
    let priceFee = document.getElementById("add-tax-price");
    let priceProfit = document.getElementById("profit");
    let fee = ((price * tax)/100);
    let profit = (price - fee);
    priceFee.innerHTML = fee;
    priceProfit.innerHTML = profit;
  })
})