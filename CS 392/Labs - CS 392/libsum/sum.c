#include "sum.h"

/**
 * TODO:
 * Takes in an array of integers and its length.
 * Returns the sum of integers in the array.
 */
int sum_array(int *array, const int length) {
    int sum = 0;
    /* Indexing */
//    for(int i=0; i<length; i++) {
//        sum+=array[i];
//    }
    /* Pointer Arith */
    for (int i=0; i<length; i++) {
        sum = sum + *(array + i);
    }
    return sum;
}
