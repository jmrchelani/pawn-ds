#include <a_samp>


// Stack 

#define STACK:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Stack_Size(%1) _len_%1

#define Stack_TotalSize(%1) _size_%1

#define Stack_Push(%1,%2) Stack_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Stack_Pop(%0) Stack_InternalRemove(%0, _current_%0, _len_%0, _size_%0)

#define Stack_Peek(%0) Stack_InternalPeek(%0, _current_%0, _len_%0, _size_%0)

#define Stack_Contains(%0,%1) Stack_InternalSearch(%0, %1, _current_%0, _len_%0, _size_%0) 

#define Stack_ToString(%0) Stack_InternalGetString(%0, _current_%0, _len_%0, _size_%0)

//////////////////////////////////////////////////////////////////////

// Queue

#define QUEUE:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Queue_Size(%1) _len_%1

#define Queue_TotalSize(%1) _size_%1

#define Queue_Enqueue(%1,%2) Queue_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Queue_Dequeue(%1) Queue_InternalRemove(%1, _current_%1, _len_%1, _size_%1)

#define Queue_Show(%1) Queue_InternalShow(%1, _current_%1, _len_%1, _size_%1)

#define Queue_Contains(%1,%2) Queue_InternalSearch(%1, %2, _current_%1, _len_%1, _size_%1)

#define Queue_ToString(%0) Queue_InternalGetString(%0, _current_%0, _len_%0, _size_%0)

////////////////////////////////////////////////////////////////////

// Collections

#define COLLECTION:%1<%2> %1[%2], _current_%1 = 0, _len_%1 = 0, _size_%1 = %2

#define Collection_Add(%1,%2) Collection_InternalAdd(%1, %2, _current_%1, _len_%1, _size_%1)

#define Collection_Remove(%1,%2) Collection_InternalRemove(%1, %2, _current_%1, _len_%1, _size_%1)

#define Collection_Contains(%1,%2) Collection_InternalSearch(%1, %2, _current_%1, _len_%1, _size_%1)

#define Collection_Size(%1) _len_%1

#define Collection_TotalSize(%1) _size_%1

#define Collection_ToString(%0) Collection_InternalGetString(%0, _current_%0, _len_%0, _size_%0)

////////////////////////////////////////////////////////////////////

main() {
    new COLLECTION:coll<10>;
    Collection_Add(coll, 1);
    Collection_Add(coll, 100);
    printf("has: %i", Collection_Remove(coll, 100));
    printf("has : %i", Collection_Contains(coll, 100));
    printf("%i", Collection_Size(coll));
    printf("%s", Collection_ToString(coll));
    Collection_Add(coll, 1000);
    printf("%s", Collection_ToString(coll));
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

Stack_InternalSearch(const stack[], obj, index, len, size) {
    for(new i = 0; i < len; ++i) {
        if(stack[i] == obj) return 1;
    }
    return 0;
}

Stack_InternalGetString(const stack[], index, len, size) {
    new str[1000];
    new tmpstr[10];
    strcat(str, "[ ")
    for(new i = 0; i<len; ++i) {
        format(tmpstr, sizeof tmpstr, "%i ", stack[i]);
        strcat(str, tmpstr);
    }
    strcat(str, "]");
    return str;
}

////////////////////////////////////////////////////////////////////
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

Queue_InternalSearch(const queue[], obj, index, len, size) {
    for(new i = 0; i < len; ++i) {
        if(queue[i] == obj) return 1;
    }
    return 0;
}

Queue_InternalGetString(const queue[], index, len, size) {
    new str[1000];
    new tmpstr[10];
    strcat(str, "[ ")
    for(new i = 0; i<len; ++i) {
        format(tmpstr, sizeof tmpstr, "%i ", queue[i]);
        strcat(str, tmpstr);
    }
    strcat(str, "]");
    return str;
}

//////////////////////////////////////////////////////////////

// Collection internal funcs

Collection_InternalAdd(collection[], obj, &index, &len, size) {
    if(len >= size) {
        index = size-1;
        len--;
    }
    collection[index] = obj;
    index++;
    len++;
}

Collection_InternalRemove(collection[], obj, &index, &len, size) {
    for(new i = 0; i < len; ++i) {
        if(collection[i] == obj) {
            for(new j = i+1; j < len; j++) {
                collection[j-1] = collection[j];
            }
            len--;
            index--;
            return 1;
        }
    }
    return 0;
}

Collection_InternalSearch(const collection[], obj, index, len, size) {
    for(new i = 0; i < len; ++i) {
        if(collection[i] == obj) return 1;
    }
    return 0;
}

Collection_InternalGetString(const collection[], index, len, size) {
    new str[1000];
    new tmpstr[10];
    strcat(str, "[ ");
    for(new i = 0; i<len; ++i) {
        format(tmpstr, sizeof tmpstr, "%i ", collection[i]);
        strcat(str, tmpstr);
    }
    strcat(str, "]");
    return str;
}
