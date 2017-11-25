// Restaurant.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <string.h>
#include <ctype.h>
#include <conio.h>
using namespace std;

static int id = 0;
struct comanda
{
	int id = 0;
	int lista[4];
};
enum Meniu
{
	Piure = 1,
	Ciorba,
	Pulpe
};

void init(comanda &c);
void adaugaMeniu(comanda &c, char idMeniu[]);
void creareComanda(comanda &c);
void afisareComanda(comanda &c);

int main()
{
	comanda c;
	init(c);
	creareComanda(c);
	afisareComanda(c);

	_getch();
    return 0;
}

void init(comanda &c)
{
	for (int i = 1; i <= 3; ++i)
	{
		c.lista[i] = 0;
	}

	cout << "Oferta zilei:\n";
	cout << "	Piure  - 2.5 lei\n";
	cout << "	Ciorba - 3.0 lei\n";
	cout << "	Pulpe  - 4.0 lei:\n";
	
}

void adaugaMeniu(comanda &c, char idMeniu[])
{
	int meniu = 0, cantitate = 0;
	for (unsigned int i = 0; i < strlen(idMeniu); ++i)
		idMeniu[i] = tolower(idMeniu[i]);
	if (strcmp(idMeniu, "piure") == 0)
		meniu = Piure;
	else if(strcmp(idMeniu, "ciorba") == 0)
		meniu = Ciorba;
	else if (strcmp(idMeniu, "pulpe") == 0)
		meniu = Pulpe;
	else
	{
		cout << "Meniu gresit!\n";
		return;
	}
	cout << "Portii: ";
	cin >> cantitate;
	if (cantitate <= 0)
	{
		cantitate = 1;
		cout << "O portie a fost adaugata!\n";
	}
	c.lista[meniu] += cantitate;
}
void creareComanda(comanda &c)
{
	c.id = id++;
	int nr = 0;
	char meniu[20];
	do
	{
		cout << "Alege un meniu: ";
		cin >> meniu;
		adaugaMeniu(c, meniu);
		cout << "Doriti sa comandati si alt meniu (da/nu)? ";
		char ans[3];
		cin >> ans;
		if (strcmp(ans, "nu") == 0)
			break;
	} while (true);
}

void afisareComanda(comanda &c)
{
	cout << "\n\nComanda dumneavoastra:\n";
	double total = 0;
	for (int i = 1; i <= 3; ++i)
	{
		if (c.lista[i] == 0) continue;

		double cost = 0;
		switch (i)
		{
		case Piure:
			cout << "#   Piure x";
			cost = 2.5 * c.lista[i];
			break;
		case Ciorba:
			cout << "#   Ciorba x";
			cost = 3.0 * c.lista[i];
			break;
		case Pulpe:
			cout << "#   Pulpe x";
			cost = 4.0 * c.lista[i];
			break;
		default:
			break;
		}
		cout << c.lista[i] << " = " << cost << " lei\n";
		total += cost;
	}
	cout << "+---------------------+\n";
	cout << "Total comanda: " << total << " lei\n";
}