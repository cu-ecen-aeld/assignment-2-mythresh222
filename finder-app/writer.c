#include <stdio.h>
#include <syslog.h>
int main(int argc, char *argv[]) {
  openlog("my_app", LOG_PID | LOG_CONS, LOG_USER);

    if(argc <2)
    {
        syslog(LOG_ERR, "writefile is not specified");
        return 1;
    }

    if(argc <3)
    {
        syslog(LOG_ERR, "writestr is not specified");
        return 1;
    }
    const char *writefile = argv[1];
    const char *writestr = argv[2];
    FILE *fd = fopen(writefile,"w");
    if(fd == NULL)
    {
        syslog(LOG_ERR, "Failed to open file %s for writing", writefile);
        return 1;
    }
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    fprintf(fd, "%s", writestr);
    fclose(fd);
    closelog();
    return 0;
}