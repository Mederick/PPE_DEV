<?php

$connexion=mysql_connect("localhost","root","");

$db=mysql_query("CREATE DATABASE monsite");

$db=mysql_select_db("monsite", $connexion);

$tbl=mysql_query("CREATE TABLE mespages (nompage VARCHAR(40) NOT NULL, adressepage VARCHAR(40) NOT NULL, PRIMARY KEY (nompage))");

$saisie=mysql_query("INSERT INTO mespages(nompage,adressepage) VALUES('Acceuil','acceuil.php')");

$saisie=mysql_query("INSERT INTO mespages(nompage,adressepage) VALUES('Historiques','historique.php')");

$saisie=mysql_query("INSERT INTO mespages(nompage,adressepage) VALUES('Photos','photos.php')");

$saisie=mysql_query("INSERT INTO mespages(nompage,adressepage) VALUES('Inscription','inscription.php')");

$saisie=mysql_query("INSERT INTO mespages(nompage,adressepage) VALUES('Email','email.php')");

