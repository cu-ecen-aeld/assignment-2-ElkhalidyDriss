#include <stdio.h>
#include <syslog.h>
#include <string.h> // Added for strlen()

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);
    
    if (argc <= 2) {
        syslog(LOG_ERR, "Not all the arguments are specified");
        closelog();
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    if (strlen(writestr) == 0) { // Use strlen() to check if the string is empty
        syslog(LOG_ERR, "writestr is not specified");
        closelog();
        return 1;
    }

    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "File couldn't be created");
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "writing %s to %s ", writestr, writefile);
    fprintf(file, "%s\n", writestr); // Add a newline at the end
    fclose(file);
    closelog();
    return 0;
}
