#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Número incorrecto de argumentos. Uso: %s <archivo> <texto>", argv[0]);
        fprintf(stderr, "Uso: %s <archivo> <texto>\n", argv[0]);
        closelog();
        return 1;
    }

    const char *filepath = argv[1];
    const char *text = argv[2];

    FILE *fp = fopen(filepath, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "No se pudo abrir el archivo %s", filepath);
        perror("Error abriendo el archivo");
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", text) < 0) {
        syslog(LOG_ERR, "Error escribiendo en el archivo %s", filepath);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);
    syslog(LOG_DEBUG, "Escribiendo %s en %s", text, filepath);

    closelog();
    return 0;
}
