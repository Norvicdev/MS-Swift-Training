#  Combination Template

从 nn 个当中选 kk 个的所有方案对应的枚举是组合型枚举。在「方法一」中我们用递归来实现组合型枚举。

首先我们先回忆一下如何用递归实现二进制枚举（子集枚举），假设我们需要找到一个长度为 nn 的序列 aa 的所有子序列，代码框架是这样的：

```c++

vector<int> temp;
void dfs(int cur, int n) {
  if (cur == n + 1) {
  // 记录答案
  // ...
  return;
}
  // 考虑选择当前位置
  temp.push_back(cur);
  dfs(cur + 1, n, k);
  temp.pop_back();
  // 考虑不选择当前位置
  dfs(cur + 1, n, k);
}

```
