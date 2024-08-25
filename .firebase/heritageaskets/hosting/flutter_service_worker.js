'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "4bc4b8bb5c96b709e9cebf9fd55a18cf",
"version.json": "305cc26fca4a2266b99a03c981ed0ae5",
"index.html": "7a013d9be4fd5a52f96ccfb680454ea6",
"/": "7a013d9be4fd5a52f96ccfb680454ea6",
"main.dart.js": "bfe927560642c280b02a6a373683121b",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "f378f66cda2fc0d27ca82b31684f2312",
"icons/Icon-192.png": "de2bc2a5aaa26edb4f1fdb6b20099010",
"icons/Icon-maskable-192.png": "de2bc2a5aaa26edb4f1fdb6b20099010",
"icons/fde7fa53": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/img.png": "d4753271bc56bf6873ac89086e94ed2a",
"icons/Icon-maskable-512.png": "f53e5850ebd7467210aaee04e62292dc",
"manifest.json": "d5a245391b9ba7e257cbe048db5fb4bd",
"logo.jpeg": "4b12b8598a9d7d9ae36945a1d7215ec5",
"assets/AssetManifest.json": "43b9bd28ead3cfb32862f0875f51eb7a",
"assets/NOTICES": "6d54d64b5b2758d929dfb5181d8945b2",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "5f7b56f55e2c9b60ce626f49b3deb555",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/packages/country_state_city_picker/lib/assets/country.json": "11b8187fd184a2d648d6b5be8c5e9908",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "19b3d349d0d0721150484cfe3d7e5fe6",
"assets/fonts/MaterialIcons-Regular.otf": "fcb125e5d9f960269e8bae66e03e0d7a",
"assets/assets/svg/icons8-linkedin.svg": "56cd35e623f956eec8651693fbe8f3ae",
"assets/assets/svg/instagram.svg": "73a21058cf6e54d04e445860824c53a8",
"assets/assets/svg/f_logo.svg": "6912a762a309d1810ce577dc70d166c8",
"assets/assets/svg/icons8-twitter.svg": "549a94c815fb58da319d79837ecb0cc2",
"assets/assets/svg/icons8-facebook.svg": "6b446a380e308ad3d84cf955d088f3be",
"assets/assets/svg/icons8-pinterest.svg": "5baca202404f99e947b07c7acaa5eabc",
"assets/assets/svg/fairtrade.svg": "a5cec8ee31d63a8ff99b2b2f9b09d531",
"assets/assets/svg/facebook.svg": "2234d9713e4df03a578f733d3e4d3a12",
"assets/assets/svg/pinterest.svg": "393b01bf0cf356c4e373c26aec5b1321",
"assets/assets/svg/whatsapp.svg": "acfe02ac1df0dc214f18125047fab467",
"assets/assets/svg/twitterbird.svg": "64c341fa98a5b20598ee33d2a7f3d8c4",
"assets/assets/svg/glogo.svg": "881123a021ce7ca23a4442585fe94a25",
"assets/assets/svg/gh.svg": "7f196daad6acbb1a2e38e41c625aa6b9",
"assets/assets/svg/linkedin.svg": "16978f0bf7260450464a5d45830c7848",
"assets/assets/svg/twitter.svg": "4390e8f6e1342ac1700db3ded1f32492",
"assets/assets/images/visa1.png": "39358745dc86374d0764cc551b0eaa75",
"assets/assets/images/slide3.jpg": "2daaf094c68ba2f474bbf1584ca4fcd1",
"assets/assets/images/ghana.png": "f778d62bed5baacc23a541e68d94b066",
"assets/assets/images/DSC_6131.jpg": "ead8d0da488679eb5082222e978d5faa",
"assets/assets/images/slide2.jpg": "f2fcb7538e89c338299c32f0a24987bf",
"assets/assets/images/payout.png": "63c4184bda7c06da6769f74285dd1780",
"assets/assets/images/slide1.jpg": "803ce656cf95365e7ccf687fcb7a314b",
"assets/assets/images/slide5.jpg": "41eb93e10a10875bfd568a5d0d4ac760",
"assets/assets/images/slide4.jpg": "f3fb656b9714c7ca9ef71a65809f6d43",
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
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
