#include <cstdlib>
#include <iostream>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int num1,num2,num3,num4=0;

class grammateia
{
private:
char username[200];
char password[200];

public:
void set_pass_grammateia();
void check_pass_grammateia();
};

class rantevou
{
private:
char wra[200];
char imera[20];
char asthenis[160];
char giatros[120];
char yphresia[120];

public:
void set_rantevou();
void write_rantevou();
void provolh_ana_imera();
void provolh_ana_giatro();
void edit_rantevou();
};

class yphresia
{
private:
int diarkeia;
char giatros[120];
char perigrafh[160];

public:
void set_yphresia();
};

class asthenis
{
private:
int AM;
char onoma[200];
char hmeromhnia[160];
char hmeromhnia_eisagwghs[50];
char diagnwsh[60];
char giatros[60];

public:
void set_asthenis();
void write_asthenis();
void edit_asthenis(int, string, string);

friend class giatros;
};

class giatros
{
private:
char username[200];
char password[200];
char onoma[200];
char hmeromhnia[200];
char yphresia[200];

public:
void set_giatros();
void write_giatros();
void set_kwdikoi_giatros();
void elegxos_pass_giatros();
void view_asthenis();
void provolh_ana_imera();
void edit_giatros();
};






void rantevou::set_rantevou()
{
cout<<"Dwse wra rantevou"<<endl;
cin>>wra;

cout<<"Dwse imera rantevou"<<endl;
cin>>imera;

cout<<"Dwse asthenh"<<endl;
cin>>asthenis;

cout<<"Dwse giatro"<<endl;
cin>>giatros;

cout<<"Dwse yphresia"<<endl;
cin>>yphresia;
}

void rantevou::write_rantevou()
{
fstream fs("rantevou.txt", ios::in | ios::out |  ios::ate);

fs<<wra<<"___"<<imera<<"___"<<asthenis<<"___"<<giatros<<"___"<<yphresia<<"/"<<endl;
}



void rantevou::provolh_ana_imera()
{
ifstream fs("rantevou.txt");
string line;

int found;
int num1= 0;
int num2= 0;

cout<<"Dwse imera"<<endl;
cin>>imera;

while(!fs.eof())
{
getline(fs, line);

found= line.find(imera);
if(found != string::npos) {cout<<line<<endl; num2= 1;}
}
}


void rantevou::provolh_ana_giatro()
{
ifstream fs("rantevou.txt");

string line;

int found;

cout<<"Dwse giatro"<<endl;

cin>>giatros;

while(!fs.eof())
{
getline(fs, line);


found= line.find(giatros);

if(found != string::npos) {cout<<line<<endl;}

}



}

void rantevou::edit_rantevou()
{
ifstream fs("rantevou.txt");

ofstream fs2;

fs2.open("rantevou2.txt");

string line;
int i= 1;
int s= 1;
int d;


cout<<"Dwse grammh poy theleis na alla3eis"<<endl;
cin>>d;

cout<<"Dwse wra rantevou"<<endl;
cin>>wra;

cout<<"Dwse imera rantevou"<<endl;
cin>>imera;

cout<<"Dwse asthenh"<<endl;
cin>>asthenis;

cout<<"Dwse giatro"<<endl;
cin>>giatros;

cout<<"Dwse yphresia"<<endl;
cin>>yphresia;

while (!fs.eof())
{

getline(fs, line);
if (d == i) {
fs2<<wra<<"___"<<imera<<"___"<<asthenis<<"___"<<giatros<<"___"<<yphresia<<"/"<<endl;
}

else {fs2<<line<<endl;}

i= i+1;
}

remove("rantevou.txt");

rename("rantevou2.txt", "rantevou.txt");
}


void yphresia::set_yphresia()
{
cout<<"Dwse diarkeia"<<endl;
cin>>diarkeia;

cout<<"Dwse giatro"<<endl;
cin>>giatros;

cout<<"Dwse perigrafh"<<endl;
cin>>perigrafh;
}

void asthenis::set_asthenis()
{
cout<<"Dwse AM"<<endl;
cin>>AM;

cout<<"Dwse onoma"<<endl;
cin>>onoma;

cout<<"Dwse hmeromhnia gennhshs"<<endl;
cin>>hmeromhnia;

cout<<"Dwse hmeromhnia eggrafhs"<<endl;
cin>>hmeromhnia_eisagwghs;

cout<<"Dwse diagnwsh"<<endl;
cin>>diagnwsh;

cout<<"Dwse giatro poy ton epivlepei"<<endl;
cin>>giatros;
}

void asthenis::write_asthenis()
{
fstream fs("asthenis.txt", ios::in | ios::out |  ios::ate);

fs<<AM<<"___"<<onoma<<"___"<<hmeromhnia<<"___"<<hmeromhnia_eisagwghs<<"___"<<diagnwsh<<"___"<<giatros<<"/"<<endl;
}

void asthenis::edit_asthenis(int s, string r, string h)
{
char R[200];
char S[200];
int i= 1;
int d= 0;
int k;
string line;
char c;

ifstream fs("asthenis.txt");
ofstream fs2;

fs2.open("asthenis2.txt");

cout<<"Dwse ti grammh poy theleis na alla3eis"<<endl;
cin>>k;

cout<<"Dwse AM"<<endl;
cin>>AM;

cout<<"Dwse onoma"<<endl;
cin>>onoma;

cout<<"Dwse hmeromhnia gennhshs"<<endl;
cin>>hmeromhnia;

cout<<"Dwse hmeromhnia eggrafhs"<<endl;
cin>>hmeromhnia_eisagwghs;

cout<<"Dwse diagnwsh"<<endl;
cin>>diagnwsh;

cout<<"Dwse giatro poy ton epivlepei"<<endl;
cin>>giatros;

while (!fs.eof())
{
getline(fs, line);

if (k == i) {
fs2<<AM<<"___"<<onoma<<"___"<<hmeromhnia<<"___"<<hmeromhnia_eisagwghs<<"___"<<diagnwsh<<"___"<<giatros<<"/"<<endl;
}

else {fs2<<line<<endl;}
i= i+1;
}

remove("asthenis.txt");
rename("asthenis2.txt", "asthenis.txt");
}

void giatros::view_asthenis()
{
string line;
string line2;
char onoma[200];
int found;
size_t found2;
int i= 0;
int s;
int num1;
ifstream fn("asthenis.txt");
ifstream fs("onoma_pass.txt");

while(!fs.eof())
{
getline(fs, line2);
found= line2.find(username);

if (found!= string::npos)
{
found2= line2.find(' ');
line2.copy(onoma, found2, 0);
}
}


while(!fn.eof())
{
getline(fn, line);
found= line.find(onoma);

if (found!= string::npos) {cout<<line; cout<<endl;}
}
}

void giatros::set_giatros()
{
cout<<"Dwse onoma"<<endl;
cin>>onoma;

cout<<"Dwse hmeromhnia gennhshs"<<endl;
cin>>hmeromhnia;

cout<<"Dwse yphresia"<<endl;
cin>>yphresia;

cout<<"Dwse username"<<endl;
cin>>username;

cout<<"Dwse password"<<endl;
cin>>password;
}


void giatros::write_giatros()
{
fstream fs("giatros.txt", ios::in | ios::out |  ios::ate);

fs<<onoma<<"___"<<hmeromhnia<<"___"<<yphresia<<"/"<<endl;
fs<<endl;

fstream fuser("username_giatrwn.txt", ios::in | ios::out |  ios::ate);

fuser<<username<<endl;

fstream fpass("password_giatrwn.txt", ios::in | ios::out |  ios::ate);

fpass<<password<<endl;

fstream fname("onoma_pass.txt", ios::in | ios::out |  ios::ate);

fname<<onoma<<" "<<username<<endl;
}

void giatros::set_kwdikoi_giatros()
{
cout<<"Dwse username"<<endl;
cin>>username;

cout<<"Dwse password"<<endl;
cin>>password;
}

void giatros::elegxos_pass_giatros()
{
string line,line2;
int found;

ifstream fuser("username_giatrwn.txt");
ifstream fpass("password_giatrwn.txt");

while(!fuser.eof())
{
getline(fuser, line);

found= line.compare(username);

if (found == 0) {cout<<"Correct username"<<endl; num1= 1; break;}
else {num1= 0;}
}

while(!fpass.eof())
{
getline(fpass, line2);

found= line2.compare(password);

if (found == 0) {cout<<"Correct password"<<endl; num2= 1; break;}
else {num2= 0;}
}
cout<<endl;
}

void grammateia::set_pass_grammateia()
{
cout<<"Dwse username"<<endl;
cin>>username;

cout<<"Dwse password"<<endl;
cin>>password;
}

void grammateia::check_pass_grammateia()
{
string line,line2;
size_t found;


ifstream fuser("username_grammateias.txt");
ifstream fpass("password_grammateias.txt");

while(!fuser.eof())
{
getline(fuser, line);
found= line.compare(username);

if (found == 0) {cout<<"Correct username"<<endl; num3= 1; break;}
else {num3= 0;}
}

while(!fpass.eof())
{
getline(fpass, line2);
found= line2.compare(password);
if (found == 0) {cout<<"Correct password"<<endl; num4= 1; break;}
else {num4= 0;}
}
cout<<endl;
}

void giatros::provolh_ana_imera()
{
ifstream fs("onoma_pass.txt");
ifstream fs2("rantevou.txt");
string line2;
string line;
string imera;
int found;
int found2;
char onoma[200];

while(!fs.eof())
{
getline(fs, line2);
found= line2.find(username);


if (found!= string::npos)
{
found2= line2.find(' ');
line2.copy(onoma, found2, 0);
}
}

cout<<"Dwse imera"<<endl;
cin>>imera;

while(!fs2.eof())
{
getline(fs2, line);
found= line.find(onoma);
found2= line.find(imera);

if (found!= string::npos && found2!= string::npos) {cout<<line<<endl;}
}
}

void giatros::edit_giatros()
{
ifstream fs("giatros.txt");
ofstream fs2;

fs2.open("giatros2.txt");

int found;
int k;
string line;
int i= 1;

cout<<"Dwse arithmo grammhs poy theleis na alla3eis"<<endl;
cin>>k;

cout<<"Dwse onoma"<<endl;
cin>>onoma;

cout<<"Dwse hmeromhnia gennhshs"<<endl;
cin>>hmeromhnia;

cout<<"Dwse yphresia"<<endl;
cin>>yphresia;

while (!fs.eof())
{
getline(fs, line);
if (k == i) {

fs2<<onoma<<"___"<<hmeromhnia<<"___"<<yphresia<<"/"<<endl;
}

else {fs2<<line<<endl;}
i= i+1;
}

remove("giatros.txt");

rename("giatros2.txt", "giatros.txt");


}



int main (void)
{
int s;
int d;
int k;
int j= 1;
int rs= 1;
string f,h;
rantevou r;
yphresia a;
asthenis c;
giatros gs;
grammateia gr;

cout<<"1---Giatros"<<endl<<"2---Grammateas"<<endl;
cin>>s;

while (s< 1 || s> 2)
{
cout<<"Edwses lathos arithmo"<<endl;
cin>>s;
}

if (s == 1) {
while(num1!= 1 || num2!= 1)
{
gs.set_kwdikoi_giatros();
gs.elegxos_pass_giatros();

if (num1!= 1 || num2!= 1) {cout<<"Wrong username or password"<<endl;}
}

while(rs == 1)
{
cout<<"1-Probolh proswpikwn stoixeiwn asthenh"<<endl<<"2-Eisagwgh neas diagnwshs"<<endl<<"3-Probolh ranteboy ana imera"<<endl<<"4-Probolh ranteboy ana xroniko diasthma"<<endl; cin>>d;

while (d< 1 || d> 4)
{
cout<<"Invalid choice"<<endl;
cin>>d;
}
if (d == 1) {gs.view_asthenis();}
if (d == 2) {c.set_asthenis(); c.write_asthenis();}
if (d == 3) {gs.provolh_ana_imera();}
}
}

if (s == 2) {
while(num3!= 1 || num4!= 1)
{
gr.set_pass_grammateia();
gr.check_pass_grammateia();

if (num3!= 1 || num4!= 1) {cout<<"Wrong username or password"<<endl;}
}

while(rs == 1)
{
cout<<"1)Eisagwgh stoixeiwn asthenh"<<endl<<"2)Epe3ergasia stoixeiwn asthenh"<<endl<<"3)Eisagwgh stoixeiwn giatroy"<<endl<<"4)Epe3ergasia stoixeiwn giatroy"<<endl<<"5)Eisagwgh neoy rantevoy"<<endl<<"6)Probolh ranteboy ana imera"<<endl<<"7)Provolh rantevoy ana giatro"<<endl<<"8)Provolh rantevoy ana hmeromhnia"<<endl<<"9)Epe3ergasia rantevoy"<<endl;
cin>>d;

while(d<1 || d>9)
{
cout<<"Invalid choice"<<endl;
cin>>d;
}

if (d == 1) {
c.set_asthenis();
c.write_asthenis();
}
if (d == 2) {c.edit_asthenis(k, f, h);}
if (d == 3) {gs.set_giatros(); gs.write_giatros();}
if (d == 4) {gs.edit_giatros();}
if (d == 5) {r.set_rantevou(); r.write_rantevou();}
if (d == 6) {r.provolh_ana_imera();}
if (d == 7) {r.provolh_ana_giatro();}
if (d == 9) {r.edit_rantevou();}
}}

return 0;
}
