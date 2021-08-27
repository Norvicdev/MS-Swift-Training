#  Divide&Conquer Template

```swift

func divide_conquer(problem, param1, param2...)
  // recursion terminator
  if problem == nil
    process_result
    return

  // prepare data
  data = prepare_data(problem)
  subproblems = split_problem(problem, data)
  
  // conquer subproblems
  subresult1 = self.divide_conquer(subproblems[0], param1...)
  subresult2 = self.divide_conquer(subproblems[1], param1...)
  ...

  // process and generate final result
  result = process_result(subresult1, subresult2...)
```
