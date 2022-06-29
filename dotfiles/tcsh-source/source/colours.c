#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define height 51
#define width 2
typedef struct _colours {size_t size; char *colour[height][width];} _colours;

_colours c = {
    .colour = {
        /* Set */
        {"%bold", "%{\033[1m%}"},
        {"%bright", "%{\033[1m%}"},
        {"%bold/bright", "%{\033[1m%}"},
        {"%dim", "%{\033[2m%}"},
        {"%underlined", "%{\033[4m%}"},
        {"%blink", "%{\033[5m%}"},
        {"%invert", "%{\033[7m%}"},
        {"%hidden", "%{\033[8m%}"},
        {"%default", "%{\033[39m%}"},
        
        /* Reset */
        {"%reset", "%{\033[0m%}"},
        {"%reset/bold", "%{\033[1m%}%{\033[21m%}"},
        {"%reset/bright", "%{\033[1m%}%{\033[21m%}"},
        {"%reset/dim", "%{\033[2m%}%{\033[22m%}"},
        {"%reset/underlined", "%{\033[4m%}%{\033[24m}"},
        {"%reset/blink", "%{\033[5m%}%{\033[25m%}"},
        {"%reset/invert", "%{\033[7m%}%{\033[27m%}"},
        {"%reset/hidden", "%{\033[8m%}%{\033[28m%}"},

        /* 8/16 Colours Foreground */
        {"%default", "%{\033[39m%}"},
        {"%black", "%{\033[30m%}"},
        {"%red", "%{\033[31m%}"},
        {"%green", "%{\033[32m%}"},
        {"%yellow", "%{\033[33m%}"},
        {"%blue", "%{\033[34m%}"},
        {"%magenta", "%{\033[35m%}"},
        {"%cyan", "%{\033[36m%}"},
        {"%lightgrey", "%{\033[37m%}"},
        {"%darkgrey", "%{\033[90m%}"},
        {"%lightred", "%{\033[91m%}"},
        {"%lightgreen", "%{\033[92m%}"},
        {"%lightyellow", "%{\033[93m%}"},
        {"%lightblue", "%{\033[94m%}"},
        {"%lightmagenta", "%{\033[95m%}"},
        {"%lightcyan", "%{\033[96m%}"},
        {"%white", "%{\033[97m%}"},

        /* 8/16 Colours Background */
        {"bg/default", "%{\033[49m%}"},
        {"bg/black", "%{\033[40m%}"},
        {"bg/red", "%{\033[41m%}"},
        {"bg/green", "%{\033[42m%}"},
        {"bg/yellow", "%{\033[43m%}"},
        {"bg/blue", "%{\033[44m%}"},
        {"bg/magenta", "%{\033[45m%}"},
        {"bg/cyan", "%{\033[46m%}"},
        {"bg/lightgrey", "%{\033[47m%}"},
        {"bg/darkgrey", "%{\033[100m%}"},
        {"bg/lightred", "%{\033[101m%}"},
        {"bg/lightgreen", "%{\033[102m%}"},
        {"bg/lightyellow", "%{\033[103m%}"},
        {"bg/lightblue", "%{\033[104m%}"},
        {"bg/lightmagenta", "%{\033[105m%}"},
        {"bg/lightcyan", "%{\033[106m%}"},
        {"bg/white", "%{\033[107m%}"}

    }
};
char *colour(_colours *c, char *string) {
    register size_t i, j;
    for (i = 0; i < height; i++){
        for (j = 0; j < width; j++) {
            if (strcmp(string, c -> colour[i][0]) == 0) {
                return c -> colour[i][j + 1];
            }
        }
    }
    return string;
}
int main(int argc, char **argv) {
    if (argc < 2) {return EXIT_FAILURE;}
    register int i;
    for (i = 1; i < argc; i++) {
        fprintf(stdout, "%s", colour(&c, argv[i]));
    }
    //fprintf(stdout, "%s", colour(&c, argv[1]));
    return EXIT_SUCCESS;
}
