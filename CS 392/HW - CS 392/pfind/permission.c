/*******************************************************************************
 * Name        : permission.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 3/16/2021
 * Description : implementation of the header functions of permission.h
 * 					and implementation of functions used in pfind.c
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <errno.h>
#include <string.h>
#include "permission.h"

int perms[] = {S_IRUSR, S_IWUSR, S_IXUSR,
               S_IRGRP, S_IWGRP, S_IXGRP,
               S_IROTH, S_IWOTH, S_IXOTH};

char* permission_string(struct stat *statbuf) {
    int permission_valid;
    char* res = (char*) malloc(10*sizeof(char));
    for(int i=0; i<9; i+=3) {
        permission_valid = statbuf->st_mode & perms[i];
        if(permission_valid) {
            strcat(res,"r");
        } else {
            strcat(res,"-");
        }
        permission_valid = statbuf->st_mode & perms[i+1];
        if(permission_valid) {
            strcat(res,"w");
        } else {
            strcat(res,"-");
        }
        permission_valid = statbuf->st_mode & perms[i+2];
        if(permission_valid) {
            strcat(res,"x");
        } else {
            strcat(res,"-");
        }
    }
	strcat(res,"\0");
    return res;
}

int findPerms(char *permline, char *full_filename, int pathlen) {
	DIR *dp;
	struct dirent *dent;
    struct stat sb;
	char ffn[PATH_MAX];
	int pl;
	

    // Unable to open directory
    if ((dp=opendir(full_filename))==NULL) {
		//
    	int len = strlen(full_filename);
    	full_filename[len-1] = '\0';
		fprintf(stderr,"Error: Cannot open directory '%s'. Permission denied.\n", full_filename);
		return 1;
    }
    while((dent=readdir(dp))!=NULL) {
        if (strcmp(dent->d_name,".")!= 0 && strcmp(dent->d_name,"..")!= 0) {

			strncpy(full_filename + pathlen, dent->d_name, PATH_MAX - pathlen);
			if (lstat(full_filename, &sb) < 0) {
				fprintf(stderr, "Error: Cannot stat file '%s'. %s\n",
						full_filename, strerror(errno));
				continue;
			}

			char *perms = permission_string(&sb);
			if(strcmp(permline,perms)==0) {
				printf("%s\n",full_filename);
			}
			free(perms);
			if(S_ISDIR(sb.st_mode)) {
				strcpy(ffn, full_filename);
				pl = strlen(ffn) + 1;
				ffn[pl - 1] = '/';
				ffn[pl] = '\0';
				findPerms(permline, ffn, pl);
			}
        }
    }
    closedir(dp);
	return 0;
}

