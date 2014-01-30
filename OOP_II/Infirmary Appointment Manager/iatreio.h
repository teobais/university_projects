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
