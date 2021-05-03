#include <a_samp>


// Stack 

#define STACK:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Stack_Size(%1) _len_%1

#define Stack_TotalSize(%1) _size_%1

#define Stack_Push(%1,%2) Stack_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Stack_Pop(%0) Stack_InternalRemove(%0, _current_%0, _len_%0, _size_%0)

#define Stack_Peek(%0) Stack_InternalPeek(%0, _current_%0, _len_%0, _size_%0)

//////////////////////////////////////////////////////////////////////

// Queue

#define QUEUE:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Queue_Size(%1) _len_%1

#define Queue_TotalSize(%1) _size_%1

#define Queue_Enqueue(%1,%2) Queue_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Queue_Dequeue(%1) Queue_InternalRemove(%1, _current_%1, _len_%1, _size_%1)

#define Queue_Show(%1) Queue_InternalShow(%1, _current_%1, _len_%1, _size_%1)

////////////////////////////////////////////////////////////////////

main() {
    new QUEUE:queue<10>;
    Queue_Enqueue(queue, 5);
    Queue_Enqueue(queue, 6);
    printf("%i", Queue_Size(queue));
}


/*
////////////////////////////////////////////////////////////

INTERNAL FUNCS

////////////////////////////////////////////////////////////
*/

Stack_InternalAdd(stack[], obj, & index, & len, size) {
    if (index >= size) {
        index = size - 1; // forcing it at the end of the array
        len--;
    }
    stack[index] = obj;
    index++;
    len++;
}

Stack_InternalRemove(stack[], & index, & len, size) {
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


// Queue Internal Funcs

Queue_InternalAdd(queue[], obj, &index, &len, size) {
    if(index >= size) {
        index = size -1;
        len--;
    }
    queue[index] = obj;
    index++;
    len++;
}

Queue_InternalRemove(queue[], &index, &len, size) {
    if(len <= 0) return print("Nothing to remove.");
    new tmp = queue[0];
    for(new i = 1; i < len; i++) {
        queue[i-1] = queue[i];
    }
    len--;
    index--;
    return tmp;
}

Queue_InternalShow(queue[], index, len, size) {
    if(len <= 0) print("Nothing to show.");
    else return queue[0];
}
