'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "24b9f188669d3f08554b9ecfc571f876",
"version.json": "305cc26fca4a2266b99a03c981ed0ae5",
"index.html": "17fe270ee647a62b29798a958409b441",
"/": "17fe270ee647a62b29798a958409b441",
"main.dart.js": "1b53935327b77d5be75ddc98e32ed47c",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "de2bc2a5aaa26edb4f1fdb6b20099010",
"icons/Icon-maskable-192.png": "de2bc2a5aaa26edb4f1fdb6b20099010",
"icons/fde7fa53": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "f53e5850ebd7467210aaee04e62292dc",
"manifest.json": "3f1cc28142bfc6d65fbced08c136301a",
"logo.jpeg": "4b12b8598a9d7d9ae36945a1d7215ec5",
"assets/AssetManifest.json": "8823d77941d646b8d0519ffa7240881e",
"assets/NOTICES": "1752db11bb0f9531f720c427201abac5",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "72b3a4972e67b11eccbf91b31514d528",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3209df7b763320717655f446621199e2",
"assets/fonts/MaterialIcons-Regular.otf": "3045d113172908922b42548fd8af83b5",
"assets/assets/svg/icons8-linkedin.svg": "56cd35e623f956eec8651693fbe8f3ae",
"assets/assets/svg/f_logo.svg": "6912a762a309d1810ce577dc70d166c8",
"assets/assets/svg/icons8-twitter.svg": "549a94c815fb58da319d79837ecb0cc2",
"assets/assets/svg/icons8-facebook.svg": "6b446a380e308ad3d84cf955d088f3be",
"assets/assets/svg/icons8-pinterest.svg": "5baca202404f99e947b07c7acaa5eabc",
"assets/assets/svg/facebook.svg": "2234d9713e4df03a578f733d3e4d3a12",
"assets/assets/svg/pinterest.svg": "393b01bf0cf356c4e373c26aec5b1321",
"assets/assets/svg/twitterbird.svg": "64c341fa98a5b20598ee33d2a7f3d8c4",
"assets/assets/svg/glogo.svg": "881123a021ce7ca23a4442585fe94a25",
"assets/assets/svg/gh.svg": "7f196daad6acbb1a2e38e41c625aa6b9",
"assets/assets/svg/linkedin.svg": "16978f0bf7260450464a5d45830c7848",
"assets/assets/svg/twitter.svg": "4390e8f6e1342ac1700db3ded1f32492",
"assets/assets/images/visa1.png": "39358745dc86374d0764cc551b0eaa75",
"assets/assets/images/ghana.png": "f778d62bed5baacc23a541e68d94b066",
"assets/assets/images/DSC_6131.jpg": "ead8d0da488679eb5082222e978d5faa",
"assets/assets/images/payout.png": "63c4184bda7c06da6769f74285dd1780",
"assets/assets/images/heritage22.png": "163ddc2df2640f7d8222c8546f76ffd8",
"assets/assets/images/DSC_0331.png": "d67af96847a0b9604a4bc14ecc6ede16",
"assets/assets/images/heritage5.png": "154a2c00ff2b5eaa81e59a8eb139cbdf",
"assets/assets/images/DSC_6146.jpg": "d8d9130bd7144bedd386485dc75b69e4",
"assets/assets/images/MasterCard1.png": "3aa787b7e88c14bb908fdb45af71eeb0",
"assets/assets/images/Lace%2520Basket%2520.jpg": "510a5520868001a9aed44812bb9e6783",
"assets/assets/images/Natural%2520Planter(1).jpg": "3c859aff39c117f68e97fe9ff94cb379",
"assets/assets/images/heritage44.png": "a57f1706cce2769765935f1a7f2d7675",
"assets/assets/images/heritage4.jpg": "06dc31a3c8b4c6cf8b1ab383fbe140fa",
"assets/assets/images/heritage6.png": "1323831d9f5c6fb8a6c694f9176081e6",
"assets/assets/images/DSC_6144.jpg": "9a1e1993547b09b0ed05e72c644f413e",
"assets/assets/images/visa.jpg": "857ae4311c6704f9cebd6da20c46d2ce",
"assets/assets/images/heritage7.png": "e782607516441471f439bb29eb72784f",
"assets/assets/images/heritage3.jpg": "3ac41bc4705dbce6c41053139c8a513f",
"assets/assets/images/Handwoven%2520Fan.jpg": "5e37732294752992187f9b44d6d5cecf",
"assets/assets/images/DSC_0242.png": "3007f5bab62b73c404560afddacd5f80",
"assets/assets/images/heritage2.jpg": "7c4495fca254217f4b3f49a510fabf6c",
"assets/assets/images/heritage1.jpg": "624792cb77af81ee78f3430812a74ea2",
"assets/assets/images/DSC_0259.png": "748a2cd35cd012572d0fdfbf62e72941",
"assets/assets/images/hats.png": "d3934c4abd4debe5a0776b001c49b83e",
"assets/assets/images/chair.png": "ddf59b9baf4156bd4d1174c3cfec2d43",
"assets/assets/images/image_0.png": "ddf59b9baf4156bd4d1174c3cfec2d43",
"assets/assets/images/eu.png": "afa70990aa35d1160b4dc94b8244962a",
"assets/assets/images/DSC_6148.jpg": "5f62e6b560fe1a16eda1e462f01b32c6",
"assets/assets/images/headphone.png": "bf7c96b85b05e02b5cc4cbeaa926836a",
"assets/assets/images/heritage8.png": "f8bf4004da4bb324bbf1b65675ae8a3a",
"assets/assets/images/Handwoven_Fan-removebg-preview.png": "22b86af679b50129414a1abcad313ef4",
"assets/assets/images/ushape.jpg": "bca3cf06676af33a770bb231942d65f2",
"assets/assets/images/MasterCard.png": "4cbdeeedd921a89dffe72073d6e86324",
"assets/assets/images/heritage11.png": "58bf16839646b29263cf4e69b120a321",
"assets/assets/images/PayPal.png": "f66c1d3f8382fdb5d292be12c77d94ba",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
