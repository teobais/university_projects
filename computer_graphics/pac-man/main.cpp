#include <iostream>
#include <GL/glut.h>
#include <cstdlib>
#include <cmath>
#include <windows.h>

#define PI 3.14159
#define	circlePoints 256

float k1= 23;
float k2= 36;
float k3;
float k4= 0;

int e= 0;
int t= 2;
int h= 0;
int rs= 1;

float x;
float y;

float s= 23;
float r= 40;
int ds= 0;
int ks= 0;
int fg= 0;

int S[360];
int R[360];

int theseis[200];

using namespace std;

void init()
{
}

void display()
{
	glClearColor(0,0,0,0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	int i;

	glFlush();
	glPointSize(4);

//drawing the table
glLineWidth(2);
glBegin(GL_LINE_STRIP);

glColor3f(10,0,9);

glVertex2f(-4,0);
glVertex2f(58,0);

//1st left turn
glVertex2f(58.5,0.20);
glVertex2f(58.55,0.25);
glVertex2f(58.6,0.3);

glVertex2f(58.7,0.4);


glVertex2f(59,1);
glVertex2f(59,25);

//2nd left turn
glVertex2f(58.75,25.1);
glVertex2f(58.7,25.15);
glVertex2f(58.65,25.2);
glVertex2f(58.6,25.25);
glVertex2f(58.55,25.3);
glVertex2f(58.5,25.35);
glVertex2f(58.45,25.4);
glVertex2f(58.4,25.45);

glVertex2f(50,25.45);

//1st right turn
glVertex2f(49.75,25.5);
glVertex2f(49.7,25.55);
glVertex2f(49.65,25.6);
glVertex2f(49.6,25.65);
glVertex2f(49.55,25.7);
glVertex2f(49.5,25.75);
glVertex2f(49.45,25.8);
glVertex2f(49.4,25.85);

glVertex2f(49.4,30.85);

//2nd right turn
glVertex2f(49.5,30.9);
glVertex2f(49.6,30.95);
glVertex2f(49.7,31);
glVertex2f(49.8,31.05);

glVertex2f(61,31.05);
glVertex2f(61,39.05);


glVertex2f(50.5,39.1);
glVertex2f(49.8,39.15);

glVertex2f(49.75,39.2);
glVertex2f(49.7,39.25);
glVertex2f(49.65,39.3);
glVertex2f(49.6,39.35);
glVertex2f(49.55,39.4);
glVertex2f(49.5,39.45);
glVertex2f(49.45,39.5);
glVertex2f(49.4,39.55);
glVertex2f(49.8,39.25);
glVertex2f(49.8,39.27);
glVertex2f(49.4,39.3);

glVertex2f(49.4,44.3);

glVertex2f(49.5,44.35);
glVertex2f(49.6,44.4);
glVertex2f(49.7,44.45);
glVertex2f(49.8,44.5);
glVertex2f(49.9,44.55);

glVertex2f(58.4,44.55);

glVertex2f(58.45,44.75);
glVertex2f(58.5,44.8);
glVertex2f(58.6,44.85);


glEnd();


glBegin(GL_LINE_LOOP);
glColor3f(0,0,1);


glVertex2i(18,41);
glVertex2i(33,41);
glVertex2i(33,30);
glVertex2i(18,30);


glEnd();
glPointSize(2);

//drawing pac-pills

glBegin(GL_POINTS);

 glColor3f(0, 17, 1);

  for (i= 1; i< 10; i= i++)
 {
  S[i]= s;
  R[i]= r+2*i;
 glVertex2f(S[i], R[i]);
 }
glEnd();

 glBegin(GL_POINTS);
 glColor3f(0, 17, 1);

  for (i= 10; i< 20; i= i++)
 {
  S[i]= 6;
  R[i]= r-2*i+4;
 glVertex2f(S[i], R[i]);
 }

 for (i= 20; i< 30; i++)
 {
 S[i]=2*i-34;
 R[i]= 26;
 glVertex2f(S[i], R[i]);
 }

 for (i= 30; i< 46; i++)
 {
 S[i]=2*i-52;
 R[i]= 6;
 glVertex2f(S[i], R[i]);
 }

glEnd();

glPointSize(1);

//eating pac-pills

if (ds == 1) {
  glPointSize(6);

glBegin(GL_POINTS);
 glColor3f(0, 0, 0);

for (i= 0; i< 60; i++)
{
 if (theseis[i]!= NULL) {
     glPointSize(2);

 glBegin(GL_POINTS);
 glColor3f(0, 0, 0);

 glVertex2f(S[theseis[i]], R[theseis[i]]);
 glEnd();
 }
}
glEnd();

glPointSize(1);
}

//drawing pac-man
int j;
glBegin(GL_POLYGON);

glColor3f(255, 215, 0);

for (i= 0; i< 360; i= i++)
 {
 x= 2.5*cos(i)+k1;
 y= 2.5*sin(i)+k2;

glVertex2f(x, y);
for (j= 0; j< 40; j++)
{
 if (x == S[j] && y == R[j]) {glPointSize(2);
 glBegin(GL_POINTS); glColor3f(0, 0, 0);

 glVertex2f(S[j], R[j]);
 glEnd();
 glPointSize(10);
 }
  }

glPointSize(1);
}
glEnd();

for (i= 0; i< 10; i++)
{
if (k1 == S[i] && k2 == R[i]) { glBegin(GL_POINTS);
 glColor3f(1, 0, 0);

 glVertex2f(S[j], R[j]);
 glEnd();
}
}

glPointSize(1);
for (j= 0; j< 60; j++)
 {
 if (k1+2.22 > S[j] && k1-2.22< S[j] && k2+2.22 > R[j] && k2-2.22<R[j])
 {
      ds= 1; theseis[j]= j;
 } }

if (fg == 45) {exit(-1);}
glPointSize(1);
glFlush();
glutSwapBuffers();
}

//creating exit menu

void keyboard(unsigned char key, int x, int y) {
	switch (key) {

	    case 'q':
		case 27:
		case GLUT_KEY_F1:

	     exit(0);// exit when "q"/Esc is pressed
	}
}

//defining pacman's movement arguments => keyboard arrows

void special_keyboard(int key, int x, int y)
{
   switch (key)
    {
   case GLUT_KEY_UP:
   k2= k2+1;
    break;

    case GLUT_KEY_DOWN:
    k2= k2-1;
    break;

    case GLUT_KEY_RIGHT:
    k1= k1+1;
    break;

    case GLUT_KEY_LEFT:
    k1= k1-1;
    break;
    }

// pacman cannot exit the specified area

    if(k1>61 && k2>=34 && k2<=36.55){k1=-8;} //making pacman to pass from right side-end to left side

    if(k1>47.5 && k2<=32.9 && k2>=24){k1=47.5;}
    if(k1>47.5 && k2>=37 && k2<=47){k1=47.5;}
   glutPostRedisplay();

   k3= k1;
   k4= k2;


}

int main(int argc, char** argv)
{
	glutInit(&argc,argv);
	glutInitWindowPosition(50,50);
	glutInitWindowSize(640,480);
	glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGB);
	glutCreateWindow("Pac-man");

	glMatrixMode(GL_PROJECTION);
	gluOrtho2D(-6,60,-6,62);
	glutDisplayFunc(display);
	glutKeyboardFunc(keyboard);
	glutSpecialFunc(special_keyboard);

	glutMainLoop();

	return 0;
}
