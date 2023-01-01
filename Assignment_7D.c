//----------------------------wait and exit system calls--------------------
#include<stdlib.h>
#include<errno.h>
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
int main()
{
	int pid;
	int rv;
	switch(pid=fork())
	{
			
		case -1:
			printf("error");
			exit(1);
		case 0:
			printf("\n CHILD: This is the child process!\n");
			fflush(stdout);
			printf("\n CHILD: My PID is %d\n",getpid());
			printf("\n CHILD: My parent's PID is %d\n",getppid());
			printf("\n CHILD: Enter my exit status(make it small):\n");
			printf("\n Child: I'm outta here!\n");
			scanf("%d",&rv);
			printf("\n PARENT : I'm now waiting for my child to exit()...\n");
			fflush(stdout);
			printf("\n PARENT : My child's exit status is : %d\n",(rv));
			printf("\n PARENT : I'm outta here!\n");
			
		default :
			exit(rv);
	}
}
