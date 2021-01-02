//-----------------------------------Adults----------------------------------------//
// setting default attribute to disabled of minus btn
document.querySelector('.minus-adults').setAttribute("disabled","disabled");
// talking value to increment or decrement value
var valueCount
// plus btn
document.querySelector('.plus-adults').addEventListener("click", function(){
    // getting value of input
    valueCount = document.getElementById('quantity-adults').value;
    // input value increment by 1
    valueCount++;
    // setting increment input value
    document.getElementById('quantity-adults').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount > 1){
        document.querySelector('.minus-adults').removeAttribute('disabled');
        document.querySelector('.minus-adults').classList.remove('disabled');
    }
})
// minus btn
document.querySelector('.minus-adults').addEventListener("click", function(){
    // getting value of input
    valueCount = document.getElementById('quantity-adults').value;
    // input value increment by 1
    valueCount--;
    //setting increment input value
    document.getElementById('quantity-adults').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount==1){
        document.querySelector('.minus-adults').setAttribute('disabled','disabled');
    }
})
//-----------------------------------Childrens----------------------------------------//
document.querySelector('.minus-childrens').setAttribute("disabled","disabled");
var valueCount
document.querySelector('.plus-childrens').addEventListener("click", function(){
    valueCount = document.getElementById('quantity-childrens').value;
    valueCount++;
    document.getElementById('quantity-childrens').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount > 0){
        document.querySelector('.minus-childrens').removeAttribute('disabled');
        document.querySelector('.minus-childrens').classList.remove('disabled');
    }
})
document.querySelector('.minus-childrens').addEventListener("click", function(){
    valueCount = document.getElementById('quantity-childrens').value;
    valueCount--;
    document.getElementById('quantity-childrens').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount==0){
        document.querySelector('.minus-childrens').setAttribute('disabled','disabled');
    }
})
//-----------------------------------Infants----------------------------------------//
document.querySelector('.minus-infants').setAttribute("disabled","disabled");
var valueCount
document.querySelector('.plus-infants').addEventListener("click", function(){
    valueCount = document.getElementById('quantity-infants').value;
    valueCount++;
    document.getElementById('quantity-infants').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount > 0){
        document.querySelector('.minus-infants').removeAttribute('disabled');
        document.querySelector('.minus-infants').classList.remove('disabled');
    }
})
document.querySelector('.minus-infants').addEventListener("click", function(){
    valueCount = document.getElementById('quantity-infants').value;
    valueCount--;
    document.getElementById('quantity-infants').value = valueCount;
    // setting passenger input value
    document.getElementById('quantity-passengers').value = parseInt(document.getElementById('quantity-adults').value)
        + parseInt(document.getElementById('quantity-childrens').value)
        + parseInt(document.getElementById('quantity-infants').value) + ' Passengers'
    if(valueCount==0){
        document.querySelector('.minus-infants').setAttribute('disabled','disabled');
    }
})
//-----------------------------------Select Travel Class----------------------------------------//
document.getElementById('travel-class-all').addEventListener("click", function () {
    document.getElementById('travelClass').value = ''
})
document.getElementById('travel-class-economy').addEventListener("click", function () {
    document.getElementById('travelClass').value = 'economy'
})
document.getElementById('travel-class-business').addEventListener("click", function () {
    document.getElementById('travelClass').value = 'business'
})
//-----------------------------------Setting css----------------------------------------//
