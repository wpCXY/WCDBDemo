# WCDBDemo
关于WCDB简单使用的Demo。

### 关于模型嵌套保存

思路一：将嵌套的模型分开保存到各自的表中，通过共用主键来关联起来(一对一)，或者通过保存子模型的主键来关联起来(一对多)。
例子：ModelAContainModelB

思路二：将嵌套的模型转换为json字符串来保存，取出后转换为模型。
例子：ModelCContainModelDs


