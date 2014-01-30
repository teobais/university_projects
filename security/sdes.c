#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <time.h>
int l[4],r[4],keys[2][8],ct[8],pt[8]; //these are like global variables, so we have not to define them again
void sbox(int sip[],int p[],int sbno,int i)
{
	int sbox[2][4][4]={1,0,3,2,3,2,1,0,0,2,1,3,3,1,3,2,0,1,2,3,2,0,1,3,3,0,1,0,2,1,0,3};
	int rw,c,sop;
	rw = sip[3]+sip[0]*2;
	c = sip[2]+sip[1]*2;
	sop = sbox[sbno][rw][c]; //sop gives decimal value of S-Box Output
	for(;sop!=0;sop/=2)
		p[i--]=sop%2;
}

/*__________________________________________________________________________________________________________*/

void cmp_fun(int round)
{
	int EP[]={4,1,2,3,2,3,4,1},i,epd[8];
	int slip[4],srip[4];
	int p[4]={0},p4[]={2,4,3,1},np[4];
	for(i=0;i<8;i++)                             // E/P Permutation
		epd[i]=r[EP[i]-1];
	for(i=0;i<8;i++)                              //Performing XOR with Key
		if(i<4)
			slip[i] = epd[i]^keys[round][i];       // Using Key _ 1=>0
		else
			srip[i-4] = epd[i]^keys[round][i];
	sbox(slip,p,0,1);                           //Calling SBox 1, 0->SBOX 1
	sbox(srip,p,1,3);                             //Calling SBox 1, 1->SBOX 2
	for(i=0;i<4;i++)                              //P4 permutation
		np[i]=p[p4[i]-1];
	for(i=0;i<4;i++)
		l[i] = l[i]^np[i];
}

/*____________________________________________________________________________________________________*/

/* We decided to make a shifting function, as we 'll use shifting more than once */
void left_shift(int keyip[],int shifts)
{
	int t1,t2,i;
	while(shifts>0)
	{
		t1=keyip[0],t2=keyip[5];       //splitting the key in two parts
		for(i=0;i<9;i++)
			if(i<4)
				keyip[i] =keyip[i+1];  //shifting the initial key(1st part)
			else if(i>4)
				keyip[i] = keyip[i+1]; //shifting the initial key(2nd part)
		keyip[4]=t1,keyip[9]=t2;       //after all shiftings are done,the value of the last position 
		shifts--;                      //of each part is the initial value of parts t1 and t2 respectively
	}
}
/* ------------------- end of shifting function ---------------------------- */


/* ---------------- Generation of keys k1 and k2 ---------------------- */
void gen_keys()
{
	int key[10];
    int i;
    int keyip[10];
	int p10[]={3,5,2,7,4,10,1,9,8,6}; //values of p10
    int p8[]={6,3,7,4,8,5,10,9};      //values of p8
	printf("Enter Key :");
	for(i=0;i<10;i++)
		scanf("%d", &key[i]);         //getting the key
	for(i=0;i<10;i++)                 // Permutation P10
		keyip[i] = key[p10[i]-1];
	left_shift(keyip,1);              // Left Shifting (Array,number of shifts)
printf("\nKey1 :");
	for(i=0;i<8;i++){ 			      //Permutation P8 
	 keys[0][i] = keyip[p8[i]-1];     //key1 generated
	 printf("%d",keys[0][i]);
	}
	left_shift(keyip,2);              //Generating key2(we need 2 shifts here)
	printf("\nKey2 :");
	for(i=0;i<8;i++){
		keys[1][i] = keyip[p8[i]-1];  //key2 generated
		printf("%d",keys[1][i]);
	}
/* ------------------------ end of gen_keys() function --------------------- */


}
void En_De(int pt[],int c)
{
		int ip[]={2,6,3,1,4,8,5,7},ipi[]={4,1,3,5,7,2,8,6},t[8],i;
	for(i=0;i<8;i++)                                              // Performing Permutation on input bits
		if(i<4)                                                   //splitting plain text in 2 parts
			l[i]=pt[ip[i]-1];                                     //giving values to the left part
		else
			r[i-4] = pt[ip[i]-1];                                 //giving values to the right part
	cmp_fun(c);//Round 0+1 using key 0+1
	for(i=0;i<4;i++) //Swapping left & right
		r[i]=l[i]+r[i],l[i]=r[i]-l[i],r[i]=r[i]-l[i];             //swapping left with right
	printf("\n\n");
	cmp_fun(!c); // Round 1+1 wid key1+1 wid swapped bits
	for(i=0;i<8;i++)
		if(i<4)	t[i]=l[i];
		else	t[i]=r[i-4];
	for(i=0;i<8;i++)
		ct[i] = t[ipi[i]-1];
}






/*---------------------------------- Main program ------------------------------------*/
int main()
{
time_t start,end;   
int t,option;
void encryption();
void decryption();
void bruteforce();         
printf("Choose:\n1.Encryption\n2.Decryption\n3.Bruteforce\n");
scanf("%d",&option);
if(option==1)
             encryption();
             else if(option==2)
                  decryption();
                  else if(option==3)
                  {start=time(NULL);
                       bruteforce();
                      
                       end=time(NULL);double mean;
                       mean=(end-start)/t;    //mean time of successful searching=end time-start time divided by number of trials
printf("Mesos xronos:%f\n",mean/10);
printf("Prospa9eies: %d \n",t);
                   }    else
                            printf("Den edwses egkuro xaraktira.\n");
    
      system("PAUSE");			
	return 0;
    }			
/*---------------------------------- Main program ------------------------------------*/		
		
    
    
    
    
    
    
    
    
/*===================ENCRYPTION FUNCTION=========================*/    
    void encryption(){
    int pt[8]={0},i;        //initialization of plain text table
	printf("Enter your plain text in 8 binary bits:");
	for(i=0;i<8;i++)
		scanf("%d",&pt[i]);  //getting the 8-bit plain text
	gen_keys();              // function calling to generate key1 & key2
	En_De(pt,0);             //function calling to encrypte the plain pext
		printf("\nCipher Text :");
			for(i=0;i<8;i++)
				printf("%d",ct[i]);     //printing the generated cipher text

    /*So far, we have analyzed the encryption of a plain text.Now, we are going 
    to decrypte a cipher text*/
    
    printf("\nEncryption done.\n");
    }
/*===================ENCRYPTION FUNCTION ENDS=========================*/    
    
    
    
    
    
    
    
    
    
    
/*===================DECRYPTION FUNCTION=========================*/    
    void decryption(){
     
    printf("Enter your cipher text in 8 binary bits:");
    int i;
    for(i=0;i<8;i++)
		scanf("%d",&ct[i]);        //getting the 8-bit cipher text
	gen_keys();                    // function calling to generate key1 & key2
	En_De(ct,1);                   ////function calling to decrypte the cipher pext

	printf("\nPlain text:");
         for(i=0;i<8;i++)
				printf("%d",ct[i]);           //printing the generated plain text
				
    printf("\nDecryption done.\n");
}
/*===================DECRYPTION FUNCTION ENDS=========================*/








/*===================BRUTE_FORCE FUNCTION=========================*/
void bruteforce(){
   
int t=0,n,l,z,x,c,v,b,m,j,k,K[10];
int pt[8],cti[8],i;
    printf("Enter your plain text in 8 binary bits:");
    for(i=0;i<8;i++)
                     scanf("%d",&pt[i]);
printf("Enter your cipher text in 8 binary bits:");
    for(i=0;i<8;i++)
                     scanf("%d",&cti[i]);  
t=t+1;
//Generating all possible keys

for(i=0;i<2;i++){
K[0]=i;

for(j=0;j<2;j++){
K[1]=j;

for(k=0;k<2;k++){
K[2]=k;

for(l=0;l<2;l++){
K[3]=l;

for(z=0;z<2;z++){
K[4]=z;

for(x=0;x<2;x++){
K[5]=x;

for(c=0;c<2;c++){
K[6]=c;

for(v=0;v<2;v++){
K[7]=v;

for(b=0;b<2;b++){
K[8]=b;

for(n=0;n<2;n++){
K[9]=n;



/*===========Generating keys  for the initial plain text==========*/
int key[10];
    int a;
    int keyip[10];
	int p10[]={3,5,2,7,4,10,1,9,8,6}; //values of p10
    int p8[]={6,3,7,4,8,5,10,9};      //values of p8

	for(a=0;a<10;a++)
		key[a]=K[a];         //getting the key
	for(i=0;i<10;i++)                 // Permutation P10
		keyip[i] = key[p10[i]-1];
	left_shift(keyip,1);              // Left Shifting (Array,number of shifts)

	for(i=0;i<8;i++){ 			      //Permutation P8 
	 keys[0][i] = keyip[p8[i]-1];     //key1 generated

	}
	left_shift(keyip,2);              //Generating key2(we need 2 shifts here)

	for(i=0;i<8;i++){
		keys[1][i] = keyip[p8[i]-1];  //key2 generated
		}
/*===========Keys generated==========*/     
	En_De(pt,0);  //encrypting the plain text
	int r=0,counter=0;
	for(r=0;r<8;r++){
                     if(ct[r]==cti[r]){
                                      counter=counter+1;}  //key check
                                      }
     if(counter==7){
                   
                   printf("Key found\n");
                   for(m=0;m<10;m++){    
                   printf("%d",K[m]);}   //printing all possible keys
                   
  }  
                                      

}}}}}
}}}}}

}  
/*=========================BRUTEFORCE FUNCTION ENDS===========================*/              