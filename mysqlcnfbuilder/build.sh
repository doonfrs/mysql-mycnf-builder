#!/bin/sh
rm -rf ../assets ../canvaskit ../icons/ ../favicon.png ../flutter_service_worker.js ../index.html ../main.dart.js ../manifest.json ../version.json
flutter build web --release
cp -r build/web/* ../docs/
sed -i '/<base href="\/">/d' ../docs/index.html