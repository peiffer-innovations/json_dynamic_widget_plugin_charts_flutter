'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"main.dart.js": "3636c41d665d3ae9b3116ba4a3d52148",
"assets/AssetManifest.json": "b97d25056a3ab0415453fe73e632dcd5",
"assets/assets/pages/charts.json": "3b5f5a335147c5efe3b95e0e9b78f273",
"assets/assets/charts/bar/stacked_target_line_bar_chart.json": "2a320b4c1449cc2ec8cab9d1cbbdcf15",
"assets/assets/charts/bar/horizontal_label_bar_chart.json": "a3bccdaa3c887ffb862e671a200cb722",
"assets/assets/charts/bar/grouped_stacked_weight_pattern_bar_chart.json": "cccf406caf79d1503db2330b9cf9f6cb",
"assets/assets/charts/bar/simple_bar_chart.json": "9e2461601097144647bf1d2783b2beac",
"assets/assets/charts/bar/grouped_stacked_bar_chart.json": "5ac99216a1f2f41e482b3eaaaee3422b",
"assets/assets/charts/bar/grouped_target_line_bar_chart.json": "b2ff754ed57faa298f21cb7c460ca093",
"assets/assets/charts/bar/spark_bar_chart.json": "11d96b7ef9b2fd5ed8c1cfdc93031aa9",
"assets/assets/charts/bar/pattern_forward_hatch_bar_chart.json": "16041abea1a5380805304b5b6a76a976",
"assets/assets/charts/bar/horizontal_pattern_forward_hatch_bar_chart.json": "5f03bd326c8df8b3d32d9452bfc6ea46",
"assets/assets/charts/bar/grouped_fill_color_bar_chart.json": "70478022ae997407fc96583f5c4eae6a",
"assets/assets/charts/bar/stacked_fill_color_bar_chart.json": "3945a41eef0e1964a1a550b5cdea6f62",
"assets/assets/charts/bar/stacked_bar_chart.json": "b3671fdc07b13d0c6fd013486fca91a2",
"assets/assets/charts/bar/stacked_horizontal_bar_chart.json": "7ce50cb2204599f8e18401f5cca951df",
"assets/assets/charts/bar/grouped_bar_chart.json": "3ce8ba4b5ee437ea99161a96f2d954bf",
"assets/assets/charts/bar/vertical_label_bar_chart.json": "44d51610e3761595739215ad7c4c3ebb",
"assets/assets/charts/bar/custom_rounded_bar_chart.json": "8768e92911976bdcfb968a1d82c52d48",
"assets/assets/charts/bar/horizontal_bar_chart.json": "d6d87f48cd1b252d9614e8d32548cfc8",
"assets/assets/charts/legend/legend_custom_symbol.json": "de7f973053e5dea4f160ed5986fa5ef9",
"assets/assets/charts/legend/simple_series_legend.json": "8775c00546ce9091314c73cefcdde56b",
"assets/assets/charts/legend/default_hidden_series_legend.json": "86e0d1d226a4730204cc46306b0f18c5",
"assets/assets/charts/legend/simple_datum_legend.json": "c528799f4d6255154cd481054f9da1a5",
"assets/assets/charts/legend/series_legend_with_measures.json": "2f3040e7535e16298716bc9888962e2c",
"assets/assets/charts/legend/series_legend_options.json": "90745f6f552b85da9b7ffab6a517abeb",
"assets/assets/charts/legend/datum_legend_options.json": "7fcc648e1c2653c42797cf6bb390fef9",
"assets/assets/charts/legend/datum_legend_with_measures.json": "3af3e2432cec2e0cf80d1e84ad5a2929",
"assets/assets/charts/axis/measure_axis_label_alignment.json": "4ed990708de2296c4389ef3119cef690",
"assets/assets/charts/axis/hidden_ticks_and_labels.json": "155f7ddb2d3e837b8ed64d9b3b296c35",
"assets/assets/charts/axis/nonzero_bound_measure_axis.json": "396f8be96d9093096339cbba537bdaa3",
"assets/assets/charts/axis/line_disjoint_axis.json": "2e4ca456ac11ac7841059c2f4d84bd76",
"assets/assets/charts/axis/short_tick_length_axis.json": "7753ae858ee82bda218884ee26861b14",
"assets/assets/charts/axis/integer_only_measure_axis.json": "bf05c398f292bea114433f6fe700b3b5",
"assets/assets/charts/axis/numeric_initial_viewport.json": "6b1c5f7e82224dc28f2da36ff90cf6c6",
"assets/assets/charts/axis/gridline_dash_pattern.json": "a30ae0e0ec896d48c9aac7f633b61983",
"assets/assets/charts/axis/custom_font_size_and_color.json": "da04bb6936c452186c3fa10494ea3997",
"assets/assets/charts/axis/bar_secondary_axis.json": "4a5ac405a7098c285e36f04a20c3367a",
"assets/assets/charts/axis/ordinal_initial_viewport.json": "c4a0f5e399d05e15eafa3fa87a91c72e",
"assets/assets/charts/axis/bar_second_axis_only.json": "39a8799b95853b9f39b53b9e6fbf453c",
"assets/assets/charts/axis/custom_axis_tick_formatters.json": "4932d84150407c574922e9ea95287233",
"assets/assets/charts/axis/flipped_vertical_axis.json": "e0b5315945f4605d6766c0c6843a858f",
"assets/assets/charts/axis/statically_provided_ticks.json": "8a89644db697c2aeebb75ccd33fb4418",
"assets/assets/charts/axis/custom_measure_tick_count.json": "a7aaf7d352d3c8b7e8ffc3b37fad349d",
"assets/assets/charts/axis/horizontal_bar_secondary_axis.json": "e7c05886f89e6bfe77ac664a0b92dc7e",
"assets/assets/charts/behavior/percent_of_domain.json": "bbf078799e1803bc745fad63832f34ad",
"assets/assets/charts/behavior/chart_title.json": "a7b61fbeb1f5f4e6893efd7a144c1003",
"assets/assets/charts/behavior/percent_of_series.json": "10f714d17fc15a17475140ddbf1d9bb3",
"assets/assets/charts/behavior/percent_of_domain_by_category.json": "0a347597696044a4de413da3825b9e5f",
"assets/assets/charts/behavior/selection_line_highlight.json": "09085bd59b2d16c548a2fbf936d89dcd",
"assets/assets/charts/behavior/initial_selection.json": "7ec4a0fbe4d967e0312aadd1e890b8f7",
"assets/assets/charts/behavior/sliding_viewport_on_selection.json": "03a202d4f4297348aa29f13e75e19cb9",
"assets/assets/charts/behavior/selection_bar_highlight.json": "8068d7f7bc78c4ab0409e5454b2db345",
"assets/assets/charts/behavior/initial_hint_animation.json": "00fb31a49f7274d3acc863bde0d22a94",
"assets/assets/charts/behavior/selection_callback_example.json": "1f6d375dc886ae83fde8ef84149b6de4",
"assets/assets/charts/behavior/slider.json": "1254c2967473edb5971c1e699562c2ff",
"assets/assets/charts/scatter_plot/comparison_points_scatter_plot_chart.json": "3f80baf6ff223f1ef5817ee523766845",
"assets/assets/charts/scatter_plot/shapes_scatter_plot_chart.json": "a6980a792030b1ccc5145a4510b61349",
"assets/assets/charts/scatter_plot/simple_scatter_plot_chart.json": "6e1a623a3ced8f8a22e3611ae4cf0fa4",
"assets/assets/charts/scatter_plot/bucketing_axis_scatter_plot_chart.json": "528e1c6155e7b795135057bfe28053e6",
"assets/assets/charts/line/simple_nulls_line_chart.json": "1cc3b0bce5c2dd1e43a150e159dace30",
"assets/assets/charts/line/points_line_chart.json": "1612641e4ebe13bb338bd964d316fd9d",
"assets/assets/charts/line/area_and_line_line_chart.json": "4cc37048d85ee58459e8228489eb4971",
"assets/assets/charts/line/stacked_area_line_chart.json": "54ecd0154b7db3ce23c68a953f2bc375",
"assets/assets/charts/line/simple_line_chart.json": "e5aae7b4c205a6d9521dda5659726581",
"assets/assets/charts/line/stacked_area_custom_color_line_chart.json": "8cf409099a8cbe244a04004594d5009c",
"assets/assets/charts/line/dash_pattern_line_chart.json": "6f59548516557a537a1de4e092a571da",
"assets/assets/charts/line/stacked_area_nulls_line_chart.json": "4489c47c48c7ca2181835402b3107305",
"assets/assets/charts/pie/auto_label_pie_chart.json": "f0aac543e87e9f433fdefb82f9088cea",
"assets/assets/charts/pie/gauge_pie_chart.json": "dc21e248510d7478e21317144f19892b",
"assets/assets/charts/pie/partial_pie_chart.json": "6bd2c680614d8b6823fa7003e483f14e",
"assets/assets/charts/pie/simple_pie_chart.json": "0c8a5830341fcc8e76d08e3d61add602",
"assets/assets/charts/pie/inside_label_pie_chart.json": "74cdd621e79b44c2829ef8a0145f2710",
"assets/assets/charts/pie/donut_pie_chart.json": "7e1f8e8590ec87462c4fee7824b45891",
"assets/assets/charts/time_series/confidence_interval_time_series.json": "85f42e2c6514b7ad3b6749ddb30b8490",
"assets/assets/charts/time_series/with_bar_renderer_time_series.json": "6e948831383ae5fe200e19322160c949",
"assets/assets/charts/time_series/line_annotation_time_series.json": "6150154d39f8425cac5a2703b8981063",
"assets/assets/charts/time_series/symbol_annotation_time_series.json": "9bb0cf3b6cf823cd7bdb0301e824b47e",
"assets/assets/charts/time_series/range_annotation_time_series.json": "229efb8a58dce3c92fde11912f4e45f6",
"assets/assets/charts/time_series/end_points_axis_time_series.json": "c5741c999c50205b971eafa54e619a06",
"assets/assets/charts/time_series/simple_time_series.json": "38edcaa565a09ee6767f716448f4a004",
"assets/assets/charts/time_series/range_annotation_margin_time_series.json": "1d89ea014a957d6ff3293b8aa7a303d3",
"assets/assets/charts/combo/date_time_line_point_combo_chart.json": "58f8e4c5a09c531ec0fb20fe230326fc",
"assets/assets/charts/combo/ordinal_bar_line_combo_chart.json": "9a8c275406e616df584ef5c824bfc145",
"assets/assets/charts/combo/scatter_plot_line_combo_chart.json": "8d9277f12259f0ed87a1b4d7ddad0517",
"assets/assets/charts/combo/numeric_line_point_combo_chart.json": "aac682ab223b5aad51704b8a4e708bd7",
"assets/assets/charts/combo/numeric_line_bar_combo_chart.json": "84778eae296385c67a05250b4eb97901",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "59f1e52ba59fd6c96cc822ff3e5a3de9",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "03335e5f27e21bfb5700093a59e43487",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "ee6dd4b1df45658860c692049aecfe74",
"/": "ee6dd4b1df45658860c692049aecfe74",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
