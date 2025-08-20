'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "3b7d239f94991c8d2eed2d2c1de2f9e1",
".git/config": "291a83f35b460d551f2d4b3fac769f08",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "87abb2627eb4e34556fdea8b6b0eb384",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "5a151f382b8d94311e59d317ff586846",
".git/logs/refs/heads/gh-pages": "5a151f382b8d94311e59d317ff586846",
".git/logs/refs/remotes/origin/gh-pages": "f9d0cb81417514bdbe9bfe7fd1d441ba",
".git/objects/00/e1f72c33114a9e651cab41e591b052d4ac0af5": "90645e398dce6d61034d67fd0bf1cdfa",
".git/objects/03/5dae1f46c31937b3622ddce6786293bd7d13a9": "32c951cc1ca7efd1008a5035ca0d052a",
".git/objects/0f/f015c291ad59b9a3ff23306954a38810315952": "0062525083c366f65eaacaee475357f4",
".git/objects/16/d05a43201a0ed7f5333612ec4c452d8d6adbec": "dd56884e06d806ed780b631a7b6ec755",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1b/3491a69a87183348cb2470b7d1f9f088341871": "3bf9d8bff250b8d70d4562b5d6db75d0",
".git/objects/25/298868b16a255b697dbbc973789b95468918f1": "7b8079184a0ec8eb727ef11204cab36a",
".git/objects/2f/ed86d192cd9e863a4c084a1ccab16932c45582": "94bb14a0c43b05641dfd4b69c40f48c3",
".git/objects/31/88709e72b5d18a65d242b6c1f3ccde07e1374c": "670db59e3b2bcb521b3a337affbfb180",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/46/7961350cd20bf759a66f9d84f13bf586ab16d1": "2482d93495d38016d956b1f5fa4748b7",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/55/155d8fce1e4963ed5ac4afcea5ec1f5d6fc648": "f38cffb53a0cfa95dfcba2c497b8badd",
".git/objects/5e/5dc665669be9e123fd5c273b888b852a16df72": "3a2fe6813c1d91a3876886a607430b50",
".git/objects/6e/a34f520376347b0a54000af6f25bd850bc3dab": "7fd05ace6c2605e6ce97bef857a28d45",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/78/fe668343075568152f0678b2437be9c18e0849": "0cabd82e279e322868c54ff4194f7c38",
".git/objects/7d/e88faf2eb77721e812eeb38363927ef92aa49b": "22ef072531c73654ae643550f0d67ad4",
".git/objects/81/2d2dd2bad7b66d33feabd892a40bfbb4959817": "00033022358a25901e43ef99cd270dd6",
".git/objects/84/4f22ad471c36e99066890d0daa72ba716b4690": "0036ee278265e831c75df1a2e33eb667",
".git/objects/85/a784daeecdff6b24155615712e5b527872f0f0": "99e7c5a27545f65a661d3a7df363183d",
".git/objects/85/e5b9a6cad401010b5c57df3192e7102d5a3a94": "cc0df3f0fdc6295cfe9513cf3821a40b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/f8cb8a899de3c7d1182b117707637a453bf95f": "0c70b64e9678a2d9dd183031c59bbd5c",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/93/df942337cd725748f01d80afa2c0cf3e77c31f": "d29ccc65516003cdc453687871c76c7b",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/a7/0e1c13a967dfd598e6d0813e8d077f952cb10c": "4a5aaf0657d81405b737f3932ce3aad6",
".git/objects/a8/69a4eb5a633bb29035a023ae7f56d5154acb44": "df984c358d6a26840383d670f2fa1cda",
".git/objects/ab/2e217be3f62be8d1215c27eea8bacaa587da4a": "a91719036d078ff4721d33647b9b8e46",
".git/objects/b2/c36b648a369967cd9d9e177a6e4544ad4cc190": "4241030036d64258380ec9313f34e013",
".git/objects/b5/ed610556ecf35d33ce5732d059d6eb94df0dd1": "a91297b667e55da49acdf79df5830ba5",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/c6/c34c3c35ee91d556ba3025269ec8a170016152": "0372a982ba6e06157c78cd6d13201c2f",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/d0/0af1d1f83946c743aa41c0c7dab59de7d690c0": "aacc063eb1f5f48dec0595296c807868",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/da/fed9678cf38892557250d9627f4b15899e0694": "26930cfa655e7d1ced801d53de58b69f",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/df/8c6ed293e51bd853ab786532db9521ba1e0d97": "3c1b19a3b4ed584831efe60235bf39f5",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/5a9be809ac72f264ac2409b0689e6a7ea3b575": "e63c9da679f01996091c396044fba52d",
".git/objects/f1/068835fd38a4129551e485034eddaed92fea9f": "06176cf4599446981cb50e3c9eed07c4",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f4/e036a5ddcc44a66391b127fba8172a4341fd82": "5cfdfa7c2b216926a29e50565e547d45",
".git/objects/f6/fe92d5b3f06711d19b2ba62ffa40940e83e2d4": "5b8515e13b992c0ea6be234746b2fbaf",
".git/objects/fd/1a68de97a0d1714b8f84b0dce1c6dabbb3b0cd": "13eee114307cfd737b422cf4eca00ef1",
".git/objects/fe/fdb85222fbe09ced704eff75d0fba2f988598a": "fce06be59dd144150b48ec6de4ea1cd8",
".git/refs/heads/gh-pages": "079cbfbf15031074b00663b2c39a35bf",
".git/refs/remotes/origin/gh-pages": "3cea7b1c99e8f1eab3c054e7d5360026",
"assets/AssetManifest.bin": "75707d3344db1ff26d48703d5a21b5b0",
"assets/AssetManifest.bin.json": "ec668ff2fb07c7198c64279ce4e0fc34",
"assets/AssetManifest.json": "531f3c1a59a81e38060e8fbc36991137",
"assets/assets/images/image1.png": "bd142a161b8941395540ecf10377fe23",
"assets/assets/images/image10.png": "b53c59d0c1eb0fe4f743268df88d73bd",
"assets/assets/images/image11.jpg": "e33956527d753187dfe9397f17653ce8",
"assets/assets/images/image2.png": "0367f4fe40b29e4ae102edc8aedb0c67",
"assets/assets/images/image3.png": "5c533c30bb846bbe724111a1314c1cb6",
"assets/assets/images/image4.png": "a9267b0e9a85e467db0daa732b50d4e3",
"assets/assets/images/image5.png": "15b4e9c4f811356c743d15d9090ecb77",
"assets/assets/images/image6.png": "57c2f59e5020cba6e4f3c8ecb872a7b3",
"assets/assets/images/image7.png": "88900dd527ca80b2d482a02fb154a931",
"assets/assets/images/image8.png": "2a678fb39d43f91703d42daf3ef7ac27",
"assets/assets/images/image9.png": "9e9bb5a7a8d8eb4e485fe05296faaf45",
"assets/assets/sounds/page_flip.wav": "039436ae8d747ba3da862fae94cf0b37",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "e9d529c9456934738d124338c7711d94",
"assets/NOTICES": "4fa90ab1e00be4f3d959c54e1b0c97a7",
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
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "e65ffffd3b0858e87f751ece86c61395",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2842972ffe72b8e87e1f1695fbc4c3e7",
"/": "2842972ffe72b8e87e1f1695fbc4c3e7",
"main.dart.js": "497fb60b40c3f3aecc12d00982d047d7",
"manifest.json": "e1275d7436717bf03b1d7ff974627886",
"version.json": "89834932864de84c2929c3d73df0ee17"};
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
