#include <stdio.h>

char* white_spaceify(char str[], int size) {
    int length = sizeof *str / sizeof str[0];
    char temp[length];
    short k = 0;
    for (int i = 0; i < length; i++) {
        if (i > size) {
        	break;
        }
    	if (str[i] == ' ') {
            temp[i] = '%';
            temp[i + 1] = '2';
            temp[i + 2] = '0';
    	}
    }
    return temp;
}

main() {
	char* answer = white_spaceify("Mr John Smith     ", 13);
    printf("Mr John Smith : (%s)\n", answer);
}