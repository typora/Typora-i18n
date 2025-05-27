# Translating Typora

If you want to help translate Typora into other languages, we would very appreciate that.

### Improve existing translations

- Just fork this project, change text resources and make a pull request

#### Find missing text labels

When we upgrade Typora, we could add new text labels for `.strings` files under `Base.lproj`, to checkout missing text labels under your `{locale}.lproj`, you can try following commands (Thanks to [@BrainCrumbz](https://github.com/BrainCrumbz)), which takes `it-IT.lproj/Welcome.strings` as an example:

```shell
gawk 'BEGIN { FS=" = " } { print $1 }' Base.lproj/Welcome.strings > base-keys
gawk 'BEGIN { FS=" = " } { print $1 }' it-IT.lproj/Welcome.strings > it-keys
```

#### Automatically update text labels

The script [update-translation.py](update-translation.py) can be used to automatically add missing text labels to the `.strings` files. The translated strings will be empty and have to be edited manually. Removed strings will be commented out and moved to the end of the file.

**Note:** All comments, except for the top one and the ones at the bottom of each file **will be removed**. 

```
usage: update-translation.py [-h] LOCALE

Update translation strings to match base. Removed strings are commented out and moved to the end of the file.

positional arguments:
  LOCALE      locale identifier (e.g. es-ES)

options:
  -h, --help  show this help message and exit
```

#### Find translation progress and all missing labels

[@Hayao0819](https://github.com/Hayao0819) also made a script <https://github.com/typora/Typora-i18n/blob/master/tools.sh> to quickly find untranslated labels and translation process of given languages. You can refer to [#382](https://github.com/typora/Typora-i18n/issues/382) for more details.

### Add a new language Interface

1. Check our issue list to see if there are already someone else translating the text recourse to your language. If not, open an issue to tell others that you doing the translation, in order to avoid duplicate work.
2. Fork this repo.
3. Create a folder named `{locale}.lproj`, `local` code should be picked from [locale-identifiers.csv](locale-identifiers.csv).
4. Copy `*.strings` files from `Base.lproj` to `{locale}.lproj`.
5. Open `*.strings` with any text/code editor, do the translation. Please also check the translation rules.
6. Make a pull request to us.
7. We could also appreciate if you leave any contact method, like email, in issues or in `*.strings` file after your translation, so we can reach you and, at least, give free license as rewards after we come out of beta. You could also email us directly if you do not want your email address go public in Github.

### Translation rules

- Translations in `Menu.strings` should follow <https://github.com/martnst/localize-mainmenu>.
- If translation in <https://github.com/martnst/localize-mainmenu> is not proper on Windows/Linux, add the proper one in `Menu-electron.strings`. (see zh-Hans.lproj as one example).
  - To search the translation of terms for Windows machines you can use Microsoft's Terminology Search at <[https://www.microsoft.com/en-us/language](https://learn.microsoft.com/en-us/globalization/reference/microsoft-terminology)>. Other useful resources can be found at the Microsoft Language Toolbox at <https://www.microsoft.com/en-us/language/Toolbox>.
- Comment style `/* some words */` is supported, `// comment` is **NOT** supported.

## FAQ

> Can I test my translations?

Sorry… We do not support that. If you are not sure about the context of the some original English text resource or have doubts about your translation, please feel free to contact us.

## Contact

Feel free to contact us via <hi@typora.io>

## Reference

- Menu items on macOS → https://github.com/martnst/localize-mainmenu
- Terminology for Windows → https://learn.microsoft.com/en-us/globalization/reference/microsoft-terminology

## Other Language
[简体中文](Readme-zh.md)

## Credits

- Simplified Chinese by [abnerlee](https://github.com/abnerlee), [NoDotCat](https://github.com/NoDotCat), [HowardTangHw](https://github.com/HowardTangHw),  [Emphasia](https://github.com/Emphasia), [DHclly](https://github.com/DHclly), [Mornwind](https://github.com/Mornwind), [iamtwz](https://github.com/iamtwz)
- Traditional Chinese by [cyberrob](https://github.com/cyberrob), [pan93412](https://github.com/pan93412), [Meowcolm024](https://github.com/Meowcolm024), [ralphchung](https://github.com/ralphchung), [pjchender](https://github.com/pjchender), [anemology](https://github.com/anemology), [Chiahong](https://github.com/ChiahongHong/)
- Polish by  [iriusturar](https://github.com/iriusturar), [Vegebutcher](https://github.com/Vegebutcher)
- Korean by  [ryush00](https://github.com/ryush00),  [marigold9124](https://github.com/marigold9124), [vreality64](https://github.com/vreality64), [yuririri](https://github.com/yuririri), [Third9](https://github.com/Third9), [ksundong](https://github.com/ksundong), [zfanta](https://github.com/zfanta), [cozyplanes](https://github.com/cozyplanes), [cog25](https://github.com/cog25), [wookayin](https://github.com/wookayin), [Corea](https://github.com/Corea), [LimeCake](https://github.com/LimeCake)
- Italian by  [starise](https://github.com/starise), [jethro17](https://github.com/jethro17), [Boia11](https://github.com/Boia11)
- Spanish by  [thepiratejester](https://github.com/thepiratejester), [rgomez90](https://github.com/rgomez90), [iiiGerardoiii](https://github.com/iiiGerardoiii)
- French by [MOrdinateur](https://github.com/MOrdinateur), [cnovel](https://github.com/cnovel), [m0wh](https://github.com/m0wh), [Arnaud Ligny](https://github.com/ArnaudLigny)
- Russian by [Bugo](https://github.com/dragomano)
- Japanese by [tomochan001](https://github.com/tomochan001), [gageas](https://github.com/gageas), [7ma7X](https://github.com/7ma7X), [shuuji3](https://github.com/shuuji3), [ScratchBuild](https://github.com/ScratchBuild), [Hayao0819](https://github.com/Hayao0819)
- Portuguese (Brazil) by [teuscard](https://github.com/teuscard), [akz92](https://github.com/akz92), [dgsnunes](https://github.com/dgsnunes), [jlimadev](https://github.com/jlimadev)
- German by [rcvd](https://github.com/rcvd), Gert Massheimer, [Indeximal](https://github.com/Indeximal), [tobiasvonarx](https://github.com/tobiasvonarx), [jheschl17](https://github.com/Jheschl17/)
- German (Switzerland) by [Indeximal](https://github.com/Indeximal)
- Czech by [byDave251](https://github.com/byDave251), [psimacek](https://github.com/psimacek), [AlexKratky](https://github.com/AlexKratky), [bydavenet](https://github.com/bydavenet), [petrsvag](https://github.com/petrsvag)
- Greek by [kiriakosv](https://github.com/kiriakosv)
- Croatian by [diomed](https://github.com/diomed), [hrvoj3e](https://github.com/hrvoj3e)
- Hungarian by [mocsa](https://github.com/mocsa)
- Portuguese (Portugal) by [jcamilo93](https://github.com/jcamilo93)
- Galician by [nunhes](https://github.com/nunhes)
- Indonesia by [snatalius](https://github.com/snatalius)
- Vietnamese by [mwolfinspace](https://github.com/mwolfinspace)
- Swedish by [Sandskär](https://github.com/passar), [FelixZY](https://github.com/FelixZY), [MorganAntonsson](https://github.com/MorganAntonsson)
- Catalan by [jmigual](https://github.com/jmigual)
- Danish by [archfrog](https://github.com/archfrog)
- Persian by [sadra](https://github.com/sadra)
- Indonesian by [snatalius](https://github.com/snatalius), [Kylamber](https://github.com/Kylamber), [nashrullahalifauzi](https://github.com/nashrullahalifauzi)
- Dutch by Melle Dijkstra, [vidavidorra](https://github.com/vidavidorra), [andredelft](https://github.com/andredelft)
- Slovak by Petr Mátl
- Ukrainian by [oleksavyshnivsky](https://github.com/oleksavyshnivsky)
- Hebrew by [RealA10N](https://github.com/RealA10N)
- Romanian by [Mooyeee](https://github.com/Mooyeee)
- Malay (Malaysia) by [MLukman](https://github.com/MLukman)
- Turkish by [serhattsnmz](https://github.com/serhattsnmz)
- Slovenian by [sponka9](https://github.com/sponka9/)
- Arabic by [Conceit LLC](https://github.com/hiconceit/), [ahmedelq](https://github.com/ahmedelq/)
