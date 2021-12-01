# 翻译Typora

如果您想帮助我们将Typora翻译成其他语言，我们将不胜感激。

### 改进现有的翻译

- 只需要fork这个项目，更改文本资源并发起一个拉取（PullRequest）请求

### 添加一个新的语言界面

1. 检查我们的议题（issue）列表，确认是否已经有人将文本资源翻译成了您的语言。如果没有，新开一个议题（issue）告诉其他人你在做翻译，以免重复劳动。
2. fork这个仓库。
3. 创建一个名为`{位置}.lproj`, `位置`代码应该从[locale-identifiers.csv](locale-identifiers.csv)中选取。
4. 将`*.strings`文件从`Base.lproj`复制到`{locale}.lproj`。
5. 用任何文本/代码编辑器打开`*.strings`，进行翻译。另请检查翻译规则。
6. 向我们发起一个拉取（PullRequest）请求。
7. 对于您的辛苦付出我们深表感谢！在您翻译完成后，可以在议题（issue）或`*.strings`中留下您的任何联系方式，这样我们就可以联系到您，至少可以在正式版发布后，可以为您提供免费许可作为奖励。如果您不希望您的电子邮件地址在Github中公开，您也可以直接给我们发送电子邮件。

### 翻译规则

- `Menu.strings`中的翻译应该遵循<https://github.com/martnst/localize-mainmenu>.
- 如果<https://github.com/martnst/localize-mainmenu>中的翻译在Windows/Linux上显示不正确，请在`Menu-electron.strings`添加正确的翻译。（可以以zh-Hans.lproj为例）。
  - 要搜索Windows机器的术语翻译，您可以使用位于<https://www.microsoft.com/en-us/language>的微软术语搜索。其他有用的资源可以在位于<https://www.microsoft.com/en-us/language/Toolbox>的微软语言工具箱中找到。
- 支持评论风格`/* 某些词 */`，`// 评论` **不支持**。

## 常见问题

> 如何测试我的翻译？

对不起...我们不支持。如果您对某些英文原文资源的上下文不确定，或对您的翻译有疑问，请随时与我们联系。

## 联系我们

可随时通过<hi@typora.io>联系我们。

## 参考

- macOS上的菜单项 → https://github.com/martnst/localize-mainmenu
- Windows术语 → https://www.microsoft.com/en-us/language/

## 其他语言
[English](Readme.md)

## 贡献者

- 简体中文 [abnerlee](https://github.com/abnerlee), [NoDotCat](https://github.com/NoDotCat), [HowardTangHw](https://github.com/HowardTangHw),  [Emphasia](https://github.com/Emphasia), [DHclly](https://github.com/DHclly), [Mornwind](https://github.com/Mornwind), [iamtwz](https://github.com/iamtwz)
- 繁体中文 [cyberrob](https://github.com/cyberrob), [pan93412](https://github.com/pan93412), [Meowcolm024](https://github.com/Meowcolm024), [ralphchung](https://github.com/ralphchung), [pjchender](https://github.com/pjchender), [anemology](https://github.com/anemology)
- 波兰语  [iriusturar](https://github.com/iriusturar), [Vegebutcher](https://github.com/Vegebutcher)
- 韩文  [ryush00](https://github.com/ryush00),  [marigold9124](https://github.com/marigold9124), [vreality64](https://github.com/vreality64), [yuririri](https://github.com/yuririri), [Third9](https://github.com/Third9), [ksundong](https://github.com/ksundong), [zfanta](https://github.com/zfanta), [cozyplanes](https://github.com/cozyplanes), [cog25](https://github.com/cog25)
- 意大利语  [starise](https://github.com/starise), [jethro17](https://github.com/jethro17), [Boia11](https://github.com/Boia11)
- 西班牙语  [thepiratejester](https://github.com/thepiratejester), [rgomez90](https://github.com/rgomez90), [iiiGerardoiii](https://github.com/iiiGerardoiii)
- 法语 [MOrdinateur](https://github.com/MOrdinateur), [cnovel](https://github.com/cnovel), [m0wh](https://github.com/m0wh), [Arnaud Ligny](https://github.com/ArnaudLigny)
- 俄语 [dragomano](https://github.com/dragomano)
- 日语 [tomochan001](https://github.com/tomochan001), [gageas](https://github.com/gageas), [7ma7X](https://github.com/7ma7X), [shuuji3](https://github.com/shuuji3), [ScratchBuild](https://github.com/ScratchBuild)
- 葡萄牙语（巴西） [teuscard](https://github.com/teuscard) [akz92](https://github.com/akz92), [dgsnunes](https://github.com/dgsnunes)
- 德语 [rcvd](https://github.com/rcvd), Gert Massheimer, [Indeximal](https://github.com/Indeximal), [tobiasvonarx](https://github.com/tobiasvonarx)
- 德语（瑞士） [Indeximal](https://github.com/Indeximal)
- 捷克语 [byDave251](https://github.com/byDave251), [psimacek](https://github.com/psimacek), [AlexKratky](https://github.com/AlexKratky), [bydavenet](https://github.com/bydavenet), [petrsvag](https://github.com/petrsvag)
- 希腊语 [kiriakosv](https://github.com/kiriakosv)
- 克罗地亚语 [diomed](https://github.com/diomed), [hrvoj3e](https://github.com/hrvoj3e)
- 匈牙利语 [mocsa](https://github.com/mocsa)
- 葡萄牙语（葡萄牙） [jcamilo93](https://github.com/jcamilo93)
- 加利西亚语 [nunhes](https://github.com/nunhes)
- 印尼语 [snatalius](https://github.com/snatalius)
- 越南语 [mwolfinspace](https://github.com/mwolfinspace)
- 瑞典语 [Sandskär](https://github.com/passar), [FelixZY](https://github.com/FelixZY)
- 加泰罗尼亚语 [jmigual](https://github.com/jmigual)
- 丹麦语 [archfrog](https://github.com/archfrog)
- 波斯语 [sadra](https://github.com/sadra)
- 印度尼西亚语 [snatalius](https://github.com/snatalius)
- 荷兰语 Melle Dijkstra, [vidavidorra](https://github.com/vidavidorra), [andredelft](https://github.com/andredelft)
- 斯洛伐克语 Petr Mátl
- 乌克兰语 [oleksavyshnivsky](https://github.com/oleksavyshnivsky)
- 希伯来语 [RealA10N](https://github.com/RealA10N)
- 罗马尼亚语 [Mooyeee](https://github.com/Mooyeee)
