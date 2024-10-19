#include <string.h>
#include "revert_string.h"

void RevertString(char *str)
{
	int len = strlen(str);
    int i = 0;
    int j = len - 1;

    while (i < j) {
        
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;

        i++;
        j--;
    }
}

