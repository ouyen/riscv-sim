#include "lib.h"

#define BUF_SIZE 20

void display(int array[], int maxlen) {
    int i;

    for (i = 0; i < maxlen; i++) {
        print_num(array[i]);
        print_char(' ');
    }
    print_char('\n');

    return;
}

void QuickSort(int* arr, int low, int high) {
    if (low < high) {
        int i = low;
        int j = high;
        int k = arr[low];
        while (i < j) {
            while (i < j && arr[j] >= k)
                j--;

            if (i < j)
                arr[i++] = arr[j];

            while (i < j && arr[i] < k)
                i++;

            if (i < j)
                arr[j--] = arr[i];
        }

        arr[i] = k;

        QuickSort(arr, low, i - 1);
        QuickSort(arr, i + 1, high);
    }
}

int main() {
    int array[BUF_SIZE] = {8, 12, 3, 5, 2,  45, 0,  14, 2,  9,
                           1, 7,  6, 4, 19, 11, 17, 15, -1, -18};
    int maxlen = BUF_SIZE;
    
    print_string("prev: ");
    display(array, maxlen);

    QuickSort(array, 0, maxlen - 1);
    print_string("after: ");
    display(array, maxlen);

    return 0;
}