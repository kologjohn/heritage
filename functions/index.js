const functions = require('firebase-functions/v2'); // Use v2 for 2nd Gens
const axios = require('axios');
const admin = require('firebase-admin');

admin.initializeApp();

exports.fetchCartByCartId = functions.https.onCall(async (data, context) => {
    // Optionally, check for authentication
//    if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'The user must be authenticated to call this function.');
//    }

    try {
        // Reference to the items collection
        let email =data.data.email;
        const itemsRef = admin.firestore().collection('cart').where('email', '==', email);
        // Fetch the items
        const snapshot = await itemsRef.get();

        // Check if the collection is empty
        if (snapshot.empty) {
            return { items: [] };
        }

        // Map the documents to an array
        const items = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data(),
        }));

        return { items };
    } catch (error) {
        console.error('Error fetching items:', error);
        throw new functions.https.HttpsError('internal', 'Unable to fetch items');
    }
});
exports.fetchCart = functions.https.onCall(async (data, context) => {
    // Optionally, check for authentication
//    if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'The user must be authenticated to call this function.');
//    }

    try {
        // Reference to the items collection
        let email =data.data.email;
        let cartidnumber =data.data.cartidnumber;
        const itemsRef = admin.firestore().collection('cart').where('email', '==', email).where('cartidnumber', '==', cartidnumber);
        // Fetch the items
        const snapshot = await itemsRef.get();

        // Check if the collection is empty
        if (snapshot.empty) {
            return { items: [] };
        }

        // Map the documents to an array
        const items = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data(),
        }));

        return { items };
    } catch (error) {
        console.error('Error fetching items:', error);
        throw new functions.https.HttpsError('internal', 'Unable to fetch items');
    }
});
exports.fetchCategory = functions.https.onCall(async (data, context) => {
    // Optionally, check for authentication
//    if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'The user must be authenticated to call this function.');
//    }

    try {
        // Reference to the items collection
        const itemsRef = admin.firestore().collection('category');

        // Fetch the items
        const snapshot = await itemsRef.get();

        // Check if the collection is empty
        if (snapshot.empty) {
            return { items: [] };
        }

        // Map the documents to an array
        const items = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data(),
        }));

        return { items };
    } catch (error) {
        console.error('Error fetching items:', error);
        throw new functions.https.HttpsError('internal', 'Unable to fetch items');
    }
});
exports.fetchItems = functions.https.onCall(async (data, context) => {
    // Optionally, check for authentication
//    if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'The user must be authenticated to call this function.');
//    }

    try {
        // Reference to the items collection
        const itemsRef = admin.firestore().collection('items');

        // Fetch the items
        const snapshot = await itemsRef.get();

        // Check if the collection is empty
        if (snapshot.empty) {
            return { items: [] };
        }

        // Map the documents to an array
        const items = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data(),
        }));

        return { items };
    } catch (error) {
        console.error('Error fetching items:', error);
        throw new functions.https.HttpsError('internal', 'Unable to fetch items');
    }
});

exports.paystack2 = functions.https.onCall(async (datam, context) => {
    try {
      // Check if the user is authenticated
//      if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'Not authenticated');
//      }

      // Validate input data
      const { tid, amount } = datam.data;
//      if (!tid || typeof amount !== 'number' || amount <= 0) {
//        throw new functions.https.HttpsError('invalid-argument', 'Missing or invalid transaction ID or amount');
//      }

      const email = "ddd@gmail.com" // Get the user's email
     // const email = context.auth.token.email; // Get the user's email
      const totalAmount = Math.ceil(amount); // Round up the amount
      console.log("Processing amount: " + totalAmount);

      const checkoutDoc = await admin.firestore().collection('checkout').doc(tid).get();
      if (!checkoutDoc.exists) {
        throw new functions.https.HttpsError('not-found', 'Transaction not found');
      }

      const { ghshipping, ghtotal } = checkoutDoc.data();
      //console.log(`Shipping: ${ghshipping}, Total: ${ghtotal}`);

      let totalPayment = Number(ghshipping) + Number(ghtotal);
      let formattedNum = totalPayment.toFixed(2)*100;
      console.log(`Shipping: ${formattedNum}, Total: ${ghtotal}`);
  //   return;
      const postdata = {
        amount: formattedNum,
        email: email,
        reference: tid,
        currency: "GHS",
        paymentChannel: ["mobile_money"]
      };
      //const authToken = functions.config().paystack.secret; // Use environment variable
      const authToken = "sk_live_adf99a615f097ec8d09c24925f975698922ceeb7"; // Paystack API token
      const config = {
        headers: {
          'Authorization': `Bearer ${authToken}`,
          'Content-Type': 'application/json'
        }
      };

      let sendapi;
      try {
        sendapi = await axios.post('https://api.paystack.co/transaction/initialize', postdata, config);
      } catch (apiError) {
        console.error('Paystack API error:', apiError);
        throw new functions.https.HttpsError('internal', 'Paystack API error'+apiError);
      }

      console.log('Paystack response:', sendapi.data);

      return {
        success: true,
        status: sendapi.data.status,
        message: sendapi.data.message,
        data: {
          shipping: ghshipping,
          total: ghtotal,
          paymentUrl: sendapi.data.data.authorization_url
        }
      };
    } catch (e) {
      console.error('Error details:', e);
      throw new functions.https.HttpsError('internal', e.message || 'Something went wrong');
    }
  }
);

exports.currency2 = functions.https.onCall(
  async (datam, context) => {
    try {
      const sendapi = await axios.get('https://open.er-api.com/v6/latest/USD');
      console.log(sendapi.data);
      return sendapi.data.rates.GHS;
    } catch (e) {
      console.error(e);
      throw new functions.https.HttpsError('internal', 'Failed to fetch currency rates');
    }
  }
);

exports.paystackcall2 = functions.https.onRequest(
  async (req, res) => {
    const responsedata = req.body;
    const { event, data } = responsedata;
    const reference = data.reference;

    // Update Firestore documents
    try {
      await admin.firestore().collection("userstest").doc(reference).set({ code: responsedata });
      await admin.firestore().collection("checkout").doc(reference).update({ status: true });
      res.status(200).send('Success: ' + reference);
    } catch (error) {
      console.error('Error updating Firestore:', error);
      res.status(500).send('Error updating data');
    }
  }
);

exports.chat2 = functions.https.onCall(
  async (data, context) => {
    // You can uncomment this if you want to enforce authentication
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('unauthenticated', 'Request had no authentication.');
    // }

    const requestData = JSON.stringify({
      "contents": [
        {
          "parts": [
            { "text": data.text }
          ]
        }
      ]
    });

    const config = {
      method: 'post',
      url: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=YOUR_API_KEY',
      headers: {
        'Content-Type': 'application/json'
      },
      data: requestData
    };

    try {
      const response = await axios.request(config);
      return response.data;
    } catch (error) {
      console.error('Chat API error:', error);
      throw new functions.https.HttpsError('internal', 'Unable to generate content');
    }
  }
);
// HTTP function to send push notifications
exports.sendPushNotification = functions.https.onCall(async (data, context) => {
    // Check for user authentication
//    if (!context.auth) {
//        throw new functions.https.HttpsError('unauthenticated', 'User not authenticated');
//    }

    const { title, body, token,imageUrl} = data.data; // Expecting title, body, and token in the request
console.log(imageUrl)
    const message = {
        notification: {
            title: title || 'Default Title',
            body: body || 'Default Body',
            image: imageUrl || null // Optional image URL
        },
        token: "epNPpRUcTL643evAQZz-eH:APA91bEI8Q5b0hdoXVpmnxk1DHYYubvXgVTtFRnL3XOcp74nlIMYJYufCOPGdWwYuEJ95Aj2I9aQSfGAjf54c-GojGGcR62hnfamFRu3lJhQVUmWV8ayIvc", // Device token
    };

    try {
        const response = await admin.messaging().send(message);
        return { success: true, response };
    } catch (error) {
        console.error('Error sending notification:', error);
        throw new functions.https.HttpsError('internal', 'Unable to send notification');
    }
});