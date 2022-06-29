#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
char *state(bool current, char *state1, char *state2) {
    return !current ? state1 : state2;
}
int main(int argc, char **argv) {
    if (argc < 2 || argc > 2) {return EXIT_FAILURE;}
    fprintf(stdout, "%s", state((bool)atoi(*(argv + 1)), "%{\033[93m%}Pass", "%{\033[38;5;208m%}Fail"));
    return EXIT_SUCCESS;
}
