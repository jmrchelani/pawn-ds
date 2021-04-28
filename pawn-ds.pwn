#include <a_samp>

#define STACK:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Stack_Size(%1) _len_%1

#define Stack_TotalSize(%1) _size_%1

#define Stack_Push(%1,%2) Stack_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Stack_Pop(%0) Stack_InternalRemove(%0, _current_%0, _len_%0, _size_%0)

#define Stack_Peek(%0) Stack_InternalPeek(%0, _current_%0, _len_%0, _size_%0)

main() {
    new STACK:stack < 10 > ;
    printf("Size: %i", Stack_Size(stack));
    Stack_Push(stack, 1234);
    Stack_Push(stack, 2111);
    Stack_Push(stack, 10);
    if (Stack_Size(stack) > 0)
        printf("Size: %i", Stack_Size(stack));
    printf("Total Size: %i", Stack_TotalSize(stack));
    if (Stack_Size(stack) > 0)
        printf("Peek: %i", Stack_Peek(stack));
    if (Stack_Size(stack) > 0)
        printf("Pop: %i", Stack_Pop(stack));
    if (Stack_Size(stack) > 0)
        printf("Peek: %i", Stack_Peek(stack));
    if (Stack_Size(stack) > 0)
        printf("Pop: %i", Stack_Pop(stack));
    if (Stack_Size(stack) > 0)
        printf("Peek: %i", Stack_Peek(stack));
    if (Stack_Size(stack) > 0)
        printf("Pop: %i", Stack_Pop(stack));
    printf("Size: %i", Stack_Size(stack));
    if (Stack_Size(stack) > 0)
        printf("Size: %i", Stack_Size(stack));
    if (Stack_Size(stack) > 0)
        printf("Peek: %i", Stack_Peek(stack));
    if (Stack_Size(stack) > 0)
        printf("Pop: %i", Stack_Pop(stack));
    if (Stack_Size(stack) > 0)
        printf("Peek: %i", Stack_Peek(stack));
    if (Stack_Size(stack) > 0)
        printf("Size: %i", Stack_Size(stack));


}

Stack_InternalAdd(stack[], obj, & index, & len, & size) {
    if (index >= size) {
        index = size - 1; // forcing it at the end of the array
        len--;
    }
    stack[index] = obj;
    index++;
    len++;
}

Stack_InternalRemove(stack[], & index, & len, & size) {
    if (len <= 0) return print("Nothing to remove");
    --index;
    new tmp = stack[index];
    stack[index] = 0;
    --len;
    return tmp;
}

Stack_InternalPeek(const stack[], index, len, size) {
    if (len <= 0) { print("Nothing to peek"); } else return stack[--index];
}
