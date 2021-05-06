# pawn-ds
Data Structures implementations in PAWN language

# Documentation

## Stacks

```pawn
// new STACK:nameOfStack<lengthOfStack>;
new STACK:playerStack<10>;
```


### Stack_Size(stack)
This function returns a number, integer basically- which is the number of elements inside the stack.
```pawn
// Stack_Size(nameOfStack);
printf("Size of stack: %i", Stack_Size(playerStack));
```


### Stack_TotalSize(stack)
This function returns a number as well, the total length of the stack.
```pawn
// Stack_TotalSize(nameOfStack);
printf("Total size of stack: %i", Stack_TotalSize(playerStack));
```


### Stack_Push(stack, element)
This function pushes an element into the given stack, if the stack is full; it will force push at the end.
```pawn
// Stack_Push(nameOfStack, elementToBePushed);
public OnPlayerConnect(playerid) {
  Stack_Push(playersJoined, playerid);
}
```

### Stack_Pop(stack)
This function pops (deletes and returns) the last added element into the stack. Returns nothing if there isnt any element added in the stack.
```pawn
// Stack_Pop(nameOfStack);
printf("The last element added in the list, which is now deleted is: %i", Stack_Pop(stack));
```

