'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "71ff113015586f2144e23af6e4a0fffe",
"assets/AssetManifest.bin.json": "23e065f82cd5954ae64eca1f99541ce5",
"assets/AssetManifest.json": "7a810e087ce43536f9daa46593791728",
"assets/assets/fonts/Montserrat-Black.ttf": "d414a87f1942b9c4ae40ef793f171dae",
"assets/assets/fonts/Montserrat-BlackItalic.ttf": "e11421af6f75c947f1d2837f4e534611",
"assets/assets/fonts/Montserrat-Bold.ttf": "c300fff4e4ae0ca994c58ac9f6639b19",
"assets/assets/fonts/Montserrat-BoldItalic.ttf": "4a2d6e65e13b83c26996da3990d4fcd0",
"assets/assets/fonts/Montserrat-ExtraBold.ttf": "8a50619755ab4ca7bc9433d892f43d49",
"assets/assets/fonts/Montserrat-ExtraBoldItalic.ttf": "1e928a19babcb4c39dc17e946e7413a3",
"assets/assets/fonts/Montserrat-ExtraLight.ttf": "985b2147a6b955ceea74741f3d70885f",
"assets/assets/fonts/Montserrat-ExtraLightItalic.ttf": "2ea0576ae2d6795e7786b364f39e54fe",
"assets/assets/fonts/Montserrat-Italic.ttf": "ba6062606d5a7342cbce5a5d4b391bc4",
"assets/assets/fonts/Montserrat-Light.ttf": "5cbf5cdcf7ec24681e0ea4adeadc2822",
"assets/assets/fonts/Montserrat-LightItalic.ttf": "4eacf0be3abf18d7e743598b0991554e",
"assets/assets/fonts/Montserrat-Medium.ttf": "9d496514aedf5c9bb3f689de8b094cd8",
"assets/assets/fonts/Montserrat-MediumItalic.ttf": "426a2f39048d24a78a94737908603fe3",
"assets/assets/fonts/Montserrat-Regular.ttf": "203d753a80557746c23ce95191fbf013",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "c1bd726715a688ead84c2dbf4c82f88d",
"assets/assets/fonts/Montserrat-SemiBoldItalic.ttf": "7e5c023c68d940a51ea9f9fcaeb711a7",
"assets/assets/fonts/Montserrat-Thin.ttf": "da2373e271b755f87874ba215a117b4a",
"assets/assets/fonts/Montserrat-ThinItalic.ttf": "8a84aafae4cb52c75074e12636fed0ca",
"assets/assets/projects/composer.jpg": "31fe9d642f4a25d39a90f95b3f27cc9f",
"assets/assets/projects/dasho.jpg": "0fae033ea7b823061ad03380ff2d5a34",
"assets/assets/projects/fino.png": "2e172de1aa9b7afce3eed2ec16338c17",
"assets/assets/projects/iot.jpg": "e95201542196cb26e077757670df66eb",
"assets/assets/projects/passman.png": "61c802bd3014f4d6acbca7771665064f",
"assets/assets/projects/quicknote.jpg": "6e6ec4fcf590b2cdf37e1a36f0b9d9b4",
"assets/assets/projects/retailx.jpg": "3b191db607c67c9241878c7144968c49",
"assets/assets/projects/spindle.jpg": "0e93d96c7e2f3df1cb98e5f456836636",
"assets/assets/svg/android-development.svg": "748146c2b5619420ab37447a9fbb7ea8",
"assets/assets/svg/android-studio.svg": "ff24d442dcbbca17064094500e2cd204",
"assets/assets/svg/c++.svg": "173764ea173db15c68665927dff37e99",
"assets/assets/svg/contact.svg": "17ccb85ac4493f5ab55c6a580c28ea22",
"assets/assets/svg/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/fireabse.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/assets/svg/flutter.svg": "749737f954a8acaae1b3d389b3fc857f",
"assets/assets/svg/git.svg": "395d8c6917b47ac4dcde3600673f6519",
"assets/assets/svg/iot.svg": "f595bc80ac0258d96e15ee76e90e21bb",
"assets/assets/svg/javascript.svg": "830791e93844f750d619e0839710261c",
"assets/assets/svg/kotlin.svg": "a7735a82bb1788b6356ba6f03f8ebfc3",
"assets/assets/svg/nginex.svg": "626cda1c876ff2b5a90693f77fc987d1",
"assets/assets/svg/node.js.svg": "6c43125ac646b8d613eb301e1b8490de",
"assets/assets/svg/paperplane.svg": "35239e279601a36d975af807bb9d1a65",
"assets/assets/svg/person.jpg": "e0fe50663d424e7e7e188015f2e6af7c",
"assets/assets/svg/profile.jpg": "fbf79e43c043044bac89d03ea186c200",
"assets/assets/svg/security.svg": "da0557fc716e1d18805f098da8a9e0dd",
"assets/assets/svg/social/github.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/svg/social/leetcode.svg": "7e6e46449b31301f4d41be0a49549086",
"assets/assets/svg/social/linkedin.svg": "e6add312cdbb5b132099a07bdbdd0dd4",
"assets/assets/svg/test.jpeg": "9eaf932c3cbdb312d3192d5472ce0fbb",
"assets/assets/svg/test1.jpeg": "1e50552207e184ff2ce640003e6205c0",
"assets/assets/svg/typescript.svg": "f5d15ff420f1d5793b460351b368e4be",
"assets/assets/svg/ui.jpg": "ffa5ecb9d47e2511365475571b3b80eb",
"assets/assets/svg/windows.svg": "4175ad2ef3c0188c22ab59650e8127a3",
"assets/FontManifest.json": "3b7eaeea43e738ed4a7c6d491621e187",
"assets/fonts/MaterialIcons-Regular.otf": "65d77a4e55adaba24ef2e1174523e9b8",
"assets/NOTICES": "5b9b2d57ce7e86bee22153087a4193f7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "afb345eaf7b7ddd5e413da7c82160113",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "88fc7a577bac91567c65183e24e46fee",
"icons/icon-192.png": "2e90c32941cd4b5feeb6f509518545c7",
"icons/icon-512.png": "837dc442f2613fb43dfa04316a0045a1",
"icons/icon-maskable-192.png": "2e90c32941cd4b5feeb6f509518545c7",
"icons/icon-maskable-512.png": "837dc442f2613fb43dfa04316a0045a1",
"index.html": "deab1d028709fb8b7e6bd5979bf92171",
"/": "deab1d028709fb8b7e6bd5979bf92171",
"loader.html": "5e62e9580e113cd235c43bae0b9ceadd",
"load_wasm.js": "6c46b8c1b07bf84dfb712ada03bdb43c",
"main.dart.js": "ad55abf909ee68091f5adb2253598300",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
