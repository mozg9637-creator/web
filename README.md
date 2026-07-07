# Chigur iOS app

Этот проект создаёт простое iOS-приложение, которое открывает сайт https://chiguredder.tiiny.site/ внутри веб-оболочки на WKWebView.

## Что сделано
- SwiftUI-приложение для iOS
- Веб-оболочка через WKWebView
- Шаблон Xcode-проекта
- Скрипт для сборки IPA на macOS

## Как собрать IPA
1. Откройте проект в Xcode:
   - [ChigurApp.xcodeproj](ChigurApp.xcodeproj)
2. В [exportOptions.plist](exportOptions.plist) замените `YOUR_TEAM_ID` на ваш Team ID Apple Developer.
3. На macOS запустите:

```bash
chmod +x build-ipa.sh
./build-ipa.sh
```

IPA будет создан в папке `build/`.

## Примечание
В этой среде нет Xcode и средств сборки iOS, поэтому я не смог сгенерировать готовый `.ipa` прямо здесь. Проект уже подготовлен для сборки на Mac.
