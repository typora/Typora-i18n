# Translating Typora

If you want to help translate Typora into other languages, we would very appreciate that.

### Improve existing translations

- Just fork this project, change text resources and make a pull request

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
- Comment style `/* some words */` is supported, `// comment` is **NOT** supported.
- To search the translation of terms for Windows machines you can use Microsoft's Terminology Search at <https://www.microsoft.com/en-us/language>. Other useful resources can be found at the Microsoft Language Toolbox at <https://www.microsoft.com/en-us/language/Toolbox>.

## Updates:

01/25/2018 Add missing text resouces: [#04218fa42](https://github.com/typora/Typora-i18n/commit/04218fa423fc29054c5dea5a24b8b9e3a82266fb)

02/16/2018 Add missing text resouces: [#7ae85cf42](https://github.com/typora/Typora-i18n/commit/7ae85cf42cfeda2573d930be504f0a13bcc05e78)

03/10/2018 Add missing text resouces: [#a636f57f1](https://github.com/typora/Typora-i18n/commit/a636f57f1a2e35af90d1f46dd4a0d920d257cbf7)

03/17/2018 Add text resource for images related function: [#ce636bae9](https://github.com/typora/Typora-i18n/commit/ce636bae9eb68e7f443e3b4a17dec0db8e1f14cb)

## FAQ

> Can I test my translations?

Sorry… We do not support that. If you are not sure about the context of the some original English text resource or have doubts about your translation, please feel free to contact us.

## Contact

Feel free to contact us via <hi@typora.io>



