#  Recursion Template

```swift

func recursion(leve, param1, param2...)
  // recursion terminator
  if level > MAX_LEVEL
    process_result
    return
  
  // process logic in current level
  process(level, data...)
  
  // drill down
  self.recursion(level+1, param1, param2...)
  
  // reverse the current level status if possbile

```

