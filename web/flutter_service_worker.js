'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"main.dart.js": "18fa35c2956d4758c633f1da359d4568",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/NOTICES": "195017d11a905592cee73b9b4b8137ff",
"assets/AssetManifest.json": "b97d25056a3ab0415453fe73e632dcd5",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/assets/pages/charts.json": "307dedadd247309c32318797a3c6fc06",
"assets/assets/charts/combo/scatter_plot_line_combo_chart.json": "efb56a7d93f4662aad8a1cef9931d7d3",
"assets/assets/charts/combo/numeric_line_point_combo_chart.json": "9c0e5747604710a7aa72988e14e3bdf2",
"assets/assets/charts/combo/numeric_line_bar_combo_chart.json": "d72cfdd82a3f31465c588b302a61488f",
"assets/assets/charts/combo/date_time_line_point_combo_chart.json": "45ab271ab61dc84ce874b655750939cf",
"assets/assets/charts/combo/ordinal_bar_line_combo_chart.json": "5f4ede3d1ef3a1533a43c6e201a972d7",
"assets/assets/charts/axis/ordinal_initial_viewport.json": "5bd7db1941b63f500868004c4e3f5795",
"assets/assets/charts/axis/integer_only_measure_axis.json": "097f18f1e5c07d2aa729dbaa1df48d8b",
"assets/assets/charts/axis/hidden_ticks_and_labels.json": "afee5430cb53e14c4347fb991e31a123",
"assets/assets/charts/axis/numeric_initial_viewport.json": "a051882fa684d862d0a9114586fd65de",
"assets/assets/charts/axis/flipped_vertical_axis.json": "fc08be0129ab19b712a715f1b9df3e72",
"assets/assets/charts/axis/gridline_dash_pattern.json": "6357c856d2a2d6defbea52ff11f623e2",
"assets/assets/charts/axis/bar_secondary_axis.json": "305e3e309ab36b69d3e17edadd0cbfdc",
"assets/assets/charts/axis/custom_font_size_and_color.json": "c733a66be01c18dae9d1c9a1346499c2",
"assets/assets/charts/axis/measure_axis_label_alignment.json": "9aea3d8ff02697d6a8f243db6e3852a6",
"assets/assets/charts/axis/custom_measure_tick_count.json": "12aef9bde173b092a80b86d867796190",
"assets/assets/charts/axis/custom_axis_tick_formatters.json": "338b798cadcc41e89a350d549b35c402",
"assets/assets/charts/axis/bar_second_axis_only.json": "48ca635274df99fadd01ec30a82a41b7",
"assets/assets/charts/axis/statically_provided_ticks.json": "453b4174b0545d3a2762c05ab7be37d5",
"assets/assets/charts/axis/horizontal_bar_secondary_axis.json": "555e1f005587501a32254eecd05b3732",
"assets/assets/charts/axis/short_tick_length_axis.json": "c664c858c7d18bf45af39cbc30e3cd61",
"assets/assets/charts/axis/nonzero_bound_measure_axis.json": "c95a09b54f6f61616c05fcfaa3998c1e",
"assets/assets/charts/axis/line_disjoint_axis.json": "d50420ae75665b5735d964a8f4bc39e7",
"assets/assets/charts/time_series/confidence_interval_time_series.json": "9fbf74ffcbedf2e7c7797973aadcb402",
"assets/assets/charts/time_series/end_points_axis_time_series.json": "8eb328ca3bc08971099d9185d365afef",
"assets/assets/charts/time_series/simple_time_series.json": "699c6f55f01691f56538ca3f5087e5a8",
"assets/assets/charts/time_series/symbol_annotation_time_series.json": "5ac9397aa18bbae56cb117d25add5c49",
"assets/assets/charts/time_series/line_annotation_time_series.json": "80e6cfbd8e39fcc084feade955385a01",
"assets/assets/charts/time_series/range_annotation_margin_time_series.json": "4e7fbcc3c7fc221043850060bb37fb12",
"assets/assets/charts/time_series/range_annotation_time_series.json": "6a89efcacbd941d5cb924e461ba63aa8",
"assets/assets/charts/time_series/with_bar_renderer_time_series.json": "8109aa146a8dc03c1151fcde6a0369d1",
"assets/assets/charts/pie/donut_pie_chart.json": "96dc165ffd6c8105f2c9c92de42f5b5c",
"assets/assets/charts/pie/inside_label_pie_chart.json": "a10c53c6a37efe9a3ecd9048ab6a6d35",
"assets/assets/charts/pie/auto_label_pie_chart.json": "629c0de3ac60f358227179da4d369049",
"assets/assets/charts/pie/simple_pie_chart.json": "c8b1b8cea5dc298c31dfbf6e4385358c",
"assets/assets/charts/pie/partial_pie_chart.json": "bc9cac9b82531f53f6dc7236040d9d27",
"assets/assets/charts/pie/gauge_pie_chart.json": "712bcf009a844e3acf4ead4d4fa7175f",
"assets/assets/charts/line/stacked_area_nulls_line_chart.json": "0f8a393850bf7f2decf6a203daf0163a",
"assets/assets/charts/line/stacked_area_custom_color_line_chart.json": "004627d2b8f3acb0f011348731d0a250",
"assets/assets/charts/line/simple_line_chart.json": "ce7661b6108eb91e54c33d38432ba4db",
"assets/assets/charts/line/stacked_area_line_chart.json": "d881c329b53ab89583c607b6149e562d",
"assets/assets/charts/line/dash_pattern_line_chart.json": "3368a13480ec4ab8f3e1ed25c0b42ac7",
"assets/assets/charts/line/points_line_chart.json": "c00314b8a416c9a993cf1e6ecf773cbc",
"assets/assets/charts/line/simple_nulls_line_chart.json": "5a21799bfd61160ab925ffcb6391e06d",
"assets/assets/charts/line/area_and_line_line_chart.json": "3f030b7758fea249e3d33b58e8a90d39",
"assets/assets/charts/behavior/sliding_viewport_on_selection.json": "81487e719367a778e73ab707ff077df7",
"assets/assets/charts/behavior/chart_title.json": "309b33bbaf509253f4e45b78f7786bb6",
"assets/assets/charts/behavior/percent_of_domain.json": "eecfa6ac06ca15a8f415346e1382c94d",
"assets/assets/charts/behavior/selection_callback_example.json": "636f9b342a687b0a34042e50124983b5",
"assets/assets/charts/behavior/selection_line_highlight.json": "baba6aa58ab5be5da7086dfeb990cc4f",
"assets/assets/charts/behavior/initial_hint_animation.json": "f4783909c408490aa78380f4d49b9068",
"assets/assets/charts/behavior/slider.json": "38f96e67babff7039c2c398b0ee7fcb0",
"assets/assets/charts/behavior/selection_bar_highlight.json": "df2cacf0b3737f1d9d32fcb79f02a79d",
"assets/assets/charts/behavior/percent_of_series.json": "26d02cbf46df4d0bfc4a11bffea37534",
"assets/assets/charts/behavior/initial_selection.json": "b48a225bffa7d55be2d47d2b238c632a",
"assets/assets/charts/behavior/percent_of_domain_by_category.json": "7360f13897178cfb276887653329fb2e",
"assets/assets/charts/bar/grouped_stacked_bar_chart.json": "258ad299bc3ee7873ba43425b9faf71e",
"assets/assets/charts/bar/grouped_target_line_bar_chart.json": "a91e659a34ee3fd21821d770a13866fd",
"assets/assets/charts/bar/grouped_fill_color_bar_chart.json": "8c7db30c66e257b3e100f13a210af012",
"assets/assets/charts/bar/horizontal_bar_chart.json": "b222d4504ed6376ff2e321df932bf93b",
"assets/assets/charts/bar/spark_bar_chart.json": "95d870329fc047e1b177132716077825",
"assets/assets/charts/bar/pattern_forward_hatch_bar_chart.json": "cc552c7d2e965ab1ef2766775aa0772d",
"assets/assets/charts/bar/horizontal_pattern_forward_hatch_bar_chart.json": "3b55e98b64e9c61f226e20522eb3c229",
"assets/assets/charts/bar/vertical_label_bar_chart.json": "e95e75e440c87ecdc2c6f54b268eedaa",
"assets/assets/charts/bar/stacked_fill_color_bar_chart.json": "680a8615fe21fb2a513b36da98764819",
"assets/assets/charts/bar/grouped_stacked_weight_pattern_bar_chart.json": "f304df9c8e139908dfcbad6ef743cc88",
"assets/assets/charts/bar/grouped_bar_chart.json": "df361aad4dfea3fbecbab12457f89957",
"assets/assets/charts/bar/custom_rounded_bar_chart.json": "41f76b311df7cc4969e3b7fa577218ac",
"assets/assets/charts/bar/horizontal_label_bar_chart.json": "6023c22458f104cf16717d58d20df685",
"assets/assets/charts/bar/stacked_bar_chart.json": "ac39e6b8ade94f762eb13b23fd6657c8",
"assets/assets/charts/bar/stacked_target_line_bar_chart.json": "a6628c44ba6d1a0f96afb6b5d15791bb",
"assets/assets/charts/bar/stacked_horizontal_bar_chart.json": "5547409b3168a9bf5ea9b7763c82f478",
"assets/assets/charts/bar/simple_bar_chart.json": "8602c9947f77aec9d3088dd3ffcaac05",
"assets/assets/charts/legend/datum_legend_options.json": "7cb6b921dc26a3d0d04aaf18fbda98c6",
"assets/assets/charts/legend/series_legend_options.json": "8be7b3c4b010e5f8a36c1b66ad0be736",
"assets/assets/charts/legend/default_hidden_series_legend.json": "b5008a67415a7f9925d1e54a8f6dcf15",
"assets/assets/charts/legend/simple_datum_legend.json": "7130c0d5881f0435fa9ed7b667eb934e",
"assets/assets/charts/legend/legend_custom_symbol.json": "0680adc7972b505921c0962b57d7df93",
"assets/assets/charts/legend/datum_legend_with_measures.json": "ab98120e029fff2d79332d35dec21cbe",
"assets/assets/charts/legend/series_legend_with_measures.json": "6015d3ddc0d5507e6fe778297b3eb83b",
"assets/assets/charts/legend/simple_series_legend.json": "6ca3a5ed8c61f60a8124472f9ea8127a",
"assets/assets/charts/scatter_plot/bucketing_axis_scatter_plot_chart.json": "9bc1ba7757be6e801b116852599b247b",
"assets/assets/charts/scatter_plot/comparison_points_scatter_plot_chart.json": "723f8db85bcbbed19caf9b4fb64b1c97",
"assets/assets/charts/scatter_plot/shapes_scatter_plot_chart.json": "b5f854dc194045afb3460cd687ff1d22",
"assets/assets/charts/scatter_plot/simple_scatter_plot_chart.json": "7bede91c56cc15efe927fa632be9801a",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"index.html": "8d0ea2d83e70b5eb769317318ea7e4ac",
"/": "8d0ea2d83e70b5eb769317318ea7e4ac",
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
