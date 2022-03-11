#!/bin/sh
rm -rf ../docs/*
flutter build web --release --web-renderer html
cp -r build/web/* ../docs/
sed -i '/<base href="\/">/d' ../docs/index.html