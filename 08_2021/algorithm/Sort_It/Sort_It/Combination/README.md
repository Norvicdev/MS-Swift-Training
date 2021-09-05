#  Combination Template

从 n 个当中选 k 个的所有方案对应的枚举是组合型枚举。在「方法一」中我们用递归来实现组合型枚举。

首先我们先回忆一下如何用递归实现二进制枚举（子集枚举），假设我们需要找到一个长度为 n 的序列 a 的所有子序列，代码框架是这样的：

```c++

vector<int> temp;
void dfs(int cur, int n) {
  // 记录合法的答案
  if (temp.size() == k) {
    ans.push_back(temp);
    return;
  }
  
  // cur == n + 1 的时候结束递归
  if (cur == n + 1) {
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

1. 上面的代码中，dfs(cur, n) 参数表示当前位置是cur，原序列总长度为n
2. 原序列的每个位置在答案序列种的状态有被选中和不被选中两种，我们用 temp 数组存放已经被选出的数字
3. 在进入 dfs(cur, n) 之前 [1, cur - 1] 位置的状态是确定的，而 [cur, n] 内位置的状态是不确定的，
4. dfs(cur, n)需要确定 cur位置的状态，然后求解子问题 dfs(cur+1, n)
5. 组合枚举的代码框架可以借鉴二进制枚举。例如我们需要在 n 个元素选 k 个，在 dfs 的时候需要多传入一个参数 k, 即 dfs(cur, n, k)
6. 在每次进入这个 dfs 函数时，我们都去判断当前 temp 的长度是否为 k，如果为 k，就把 temp 加入答案并直接返回