rm -rf ../assets ../canvaskit ../icons/ ../favicon.png ../flutter_service_worker.js ../index.html ../main.dart.js ../manifest.json ../version.json
flutter build web --release
cp build/web/* ../