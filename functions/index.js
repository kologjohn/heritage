const functions = require('firebase-functions');
const axios = require('axios');
const cors = require('cors')({ origin: true });
const admin=require('firebase-admin');
admin.initializeApp();
exports.paystack=functions.https.onCall(async(datam,context)=>{
  try{
//  if(!context.auth)
//  {
//    throw new functions.https.HttpsError('unauthenticated','Not authenticated')
//  }
  const tid=datam.tid;
   //const email=context.auth.token.email;
   
   const email="info@gmmail.com";
   const amount=datam.amount;
   let intValue = Math.floor(amount)
   console.log("at: "+intValue);
   const authToken="sk_live_adf99a615f097ec8d09c24925f975698922ceeb7";
   const postdata={
     "amount": intValue,
     "email": email,
     "reference": tid,
     "currency": "GHS",
     "paymentChannel": [
       "mobile_money",
     ]
   };
   const config= {
     headers:
     {
       'Authorization': `Bearer ${authToken}`, 'Content-Type': 'application/json'  // Adjust content type based on your API requirements
     }
   };
   const sendapi=await axios.post('https://api.paystack.co/transaction/initialize',postdata,config)
   console.log(sendapi.data);
   return sendapi.data;

  }catch(e){
console.log(e)
return e;
  }

})

exports.currency=functions.https.onCall(async(datam,context)=>{
  try{
//  if(!context.auth)
//  {
//    throw new functions.https.HttpsError('unauthenticated','Not authenticated')
//  }
   const sendapi=await axios.get('https://open.er-api.com/v6/latest/USD')
   console.log(sendapi.data);
   return sendapi.data.rates.GHS;
  }catch(e){
console.log(e)
return e;
  }

})

exports.statuscheck=functions.https.onRequest((req,res)=>{
 // var url="https://api-txnstatus.hubtel.com/transactionshttps/2019542/status?clientReference=3jL2KlUy3vt216789"
  const url = "https://api.paystack.co/charge";
  const originalString = "Hello, World!";
  const clientId = "gZ17kpj";
  const clientSecret = "89b8a64e3e51459f8812b5446e45d576";
  const basic_auth_key = 'Basic ' + btoa(clientId +':' +clientSecret);
  const headers={
    "Authorization":basic_auth_key
  }
  const dataobject={

    "amount": 1000,

    "email": "customer@email.com",

    "currency": "GHS",

    "mobile_money": {

      "phone": "0552111770",

      "provider": "MTN"

    }

  };

// Define the API endpoint
// Make a GET request with Authorization header
axios.get(url, {
  headers: {
    'Authorization': basic_auth_key
  }
})
  .then(response => {
    console.log('Response:', response.data);
    res.send(response.data)
  })
  .catch(error => {
    console.error('Error:', error);
  });

 // axios.get(url,{""},{})

})
