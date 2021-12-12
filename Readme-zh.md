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

[贡献者](Readme.md#Credits)