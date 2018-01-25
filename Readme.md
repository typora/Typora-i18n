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

## Upddates:

01/25/2018 Add missing text resouces: #fd8b6de5181ed6e236b22c99826be4a60c2a1052

## FAQ

> Can I test my translations?

Sorry… We do not support that. If you are not sure about the context of the some original English text resource or have doubts about your translation, please feel free to contact us.

## Contact

Feel free to contact us via <hi@typora.io>



