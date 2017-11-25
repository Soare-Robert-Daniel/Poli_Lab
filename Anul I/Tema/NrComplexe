// NrComplexe.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
using namespace std;

ifstream in("date.txt");

struct nrcom
{
	float r = 0, i = 0;
};

struct MCom
{
	nrcom **m = NULL;
	int c = 0, l = 0;
};

//------------------------Functii auxiliare------------------------
void CitireNr(nrcom &nr);
void CitireM(nrcom **m, int &l, int &c);
void AlocareM(nrcom **&m, int &l, int &c);
void AfisareM(nrcom **m, int &l, int &c);
nrcom AdunareNr(nrcom &a, nrcom &b);

//------------------------Functii principale-----------------------
void citire(MCom &m);
void afisare(MCom &m);
MCom adunare(MCom &a, MCom &b);

int main()
{
	MCom a, b, c;
	
	citire(a);
	citire(b);
	c = adunare(a, b);
	afisare(c);

	in.close();
	_getch();
    return 0;
}

void CitireNr(nrcom &nr)
{	
	in >> nr.r >> nr.i;
}

void CitireM(nrcom **m, int &l, int &c)
{
	for (int i = 0; i < l; ++i)
		for (int j = 0; j < c; ++j)
			CitireNr(m[i][j]);
}

void AlocareM(nrcom **&m, int &l, int &c)
{
	m = (nrcom **)calloc(l , sizeof(nrcom*));
	for(int i = 0; i < l; ++i)
		m[i] = (nrcom *)calloc(c , sizeof(nrcom));
}

void AfisareM(nrcom **m, int &l, int &c)
{
	for (int i = 0; i < l; ++i)
	{
		for (int j = 0; j < c; ++j)
			cout << m[i][j].r << " + i(" << m[i][j].i << ")  ";
		cout << endl;
	}
}

nrcom AdunareNr(nrcom &a, nrcom &b)
{
	nrcom c;
	c.r = a.r + b.r;
	c.i = a.i + b.i;
	return c;
}

void citire(MCom &m)
{
	in >> m.l >> m.c;
	AlocareM(m.m, m.l, m.c);
	CitireM(m.m, m.l, m.c);
}

void afisare(MCom &m)
{
	AfisareM(m.m, m.l, m.c);
}

MCom adunare(MCom &a, MCom &b)
{
	MCom c;
	c.l = a.l;
	c.c = a.c;
	AlocareM(c.m, c.l, c.c);
	for (int i = 0; i < c.l; ++i)
		for (int j = 0; j < c.c; ++j)
				c.m[i][j] = AdunareNr(a.m[i][j], b.m[i][j]);
	return c;
}
