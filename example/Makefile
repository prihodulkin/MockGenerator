.PHONY: build

analyze:
	flutter analyze

build:
	flutter build

genall:
	flutter gen-l10n
	flutter pub run build_runner build --delete-conflicting-outputs

generatelocale:
	flutter gen-l10n

generate:
	flutter pub run build_runner build --delete-conflicting-outputs

generateicon:
	flutter pub run flutter_launcher_icons:main

generatesplash:
	flutter pub run flutter_native_splash:create

clean:
	flutter clean

.DEFAULT_GOAL:= build