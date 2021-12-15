'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"main.dart.js": "bc5cb1ad7a7c41aa8c11433fde246131",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/NOTICES": "a85a95c1eb362372f11baafe889ad78d",
"assets/AssetManifest.json": "327858c6448011a8f440c65eb0904a73",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/assets/pages/charts.json": "e48813b9bfb70a16fc91d405217d060d",
"assets/assets/charts/time_series/simple_time_series.json": "8c81629b3a36d746e497e697e6467422",
"assets/assets/charts/bar/grouped_stacked_bar_chart.json": "dbb0c9ebf1ae96cacfa9fe725aa27ec9",
"assets/assets/charts/bar/grouped_target_line_bar_chart.json": "a91e659a34ee3fd21821d770a13866fd",
"assets/assets/charts/bar/grouped_fill_color_bar_chart.json": "8c7db30c66e257b3e100f13a210af012",
"assets/assets/charts/bar/horizontal_bar_chart.json": "b222d4504ed6376ff2e321df932bf93b",
"assets/assets/charts/bar/spark_bar_chart.json": "95d870329fc047e1b177132716077825",
"assets/assets/charts/bar/pattern_forward_hatch_bar_chart.json": "cc552c7d2e965ab1ef2766775aa0772d",
"assets/assets/charts/bar/horizontal_pattern_forward_hatch_bar_chart.json": "3b55e98b64e9c61f226e20522eb3c229",
"assets/assets/charts/bar/vertical_label_bar_chart.json": "e95e75e440c87ecdc2c6f54b268eedaa",
"assets/assets/charts/bar/stacked_fill_color_bar_chart.json": "680a8615fe21fb2a513b36da98764819",
"assets/assets/charts/bar/grouped_stacked_weight_pattern_bar_chart.json": "78fb1ddbb54caf2d0733b4cad05bb65d",
"assets/assets/charts/bar/grouped_bar_chart.json": "df361aad4dfea3fbecbab12457f89957",
"assets/assets/charts/bar/custom_rounded_bar_chart.json": "41f76b311df7cc4969e3b7fa577218ac",
"assets/assets/charts/bar/horizontal_label_bar_chart.json": "6023c22458f104cf16717d58d20df685",
"assets/assets/charts/bar/stacked_bar_chart.json": "ac39e6b8ade94f762eb13b23fd6657c8",
"assets/assets/charts/bar/stacked_target_line_bar_chart.json": "a6628c44ba6d1a0f96afb6b5d15791bb",
"assets/assets/charts/bar/stacked_horizontal_bar_chart.json": "5547409b3168a9bf5ea9b7763c82f478",
"assets/assets/charts/bar/simple_bar_chart.json": "8602c9947f77aec9d3088dd3ffcaac05",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"index.html": "14fe11c31006007a482e9b10c77d958a",
"/": "14fe11c31006007a482e9b10c77d958a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
