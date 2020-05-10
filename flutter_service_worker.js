'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "a3cb27c9235767d771aab5903d01a1b3",
"/": "a3cb27c9235767d771aab5903d01a1b3",
"main.dart.js": "0a39de19cc71f6d674dcb2eebedca7f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "8beb638773273faa3e5a0ff1afc02e46",
"assets/LICENSE": "2ca64897489b5b22bc045a6b157caead",
"assets/AssetManifest.json": "35eecef3ef5da90383feeef398ba6f03",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/dice1.png": "5e0580134cde323cc6e2d54254b1a605",
"assets/assets/dice3.png": "683bc715f147a48b2e2dcabf2d573a05",
"assets/assets/dice2.png": "524559a3d0e61efa7b8a165bd2bad0da",
"assets/assets/dice6.png": "2d7642d5229bb083f5e59cf1cee4aa28",
"assets/assets/dice5.png": "ae4a1c88865e22a54c7aeb91f18db784",
"assets/assets/dice4.png": "3c7e0c5d05aeaa567bb90faf18f79f38"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
