importScripts('https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js');

firebase.initializeApp({
    apiKey: "AIzaSyCftCQ0jn71j7aOdAGDGBrsCrgFERBBLGM",
    authDomain: "flutter-additionals-a5a90.firebaseapp.com",
    projectId: "flutter-additionals-a5a90",
    storageBucket: "flutter-additionals-a5a90.appspot.com",
    messagingSenderId: "679329586489",
    appId: "1:679329586489:web:e12185581374463accdce8"
});

const messaging = firebase.messaging();