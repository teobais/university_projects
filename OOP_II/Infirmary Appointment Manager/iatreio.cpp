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
