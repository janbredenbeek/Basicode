10 GOTO 1000:REM Basicode-2 subroutines
20 CLEAR:IN$=" ":SR=0:SR$="":CT=0:CN=0:OHT%=80:OVT%=24
22 KEY OFF:SCREEN 0:WIDTH OHT%:COLOR 7,0,0:CLS:RANDOMIZE TIMER*100
29 GOTO 1010
100 CLS:RETURN
110 GOSUB 111:LOCATE OVE%+1,OHO%+1:RETURN
111 OVE%=INT(VE):OHO%=INT(HO)
112 IF OVE%<0 THEN OVE%=0 ELSE IF OVE%>=OVT% THEN OVE%=OVT%-1
113 IF OHO%<0 THEN OHO%=0 ELSE IF OHO%>=OHT% THEN OHO%=OHT%-1
114 RETURN
120 HO=POS(0)-1:VE=CSRLIN-1:RETURN
200 IN$=INKEY$:RETURN
210 IN$=INPUT$(1):RETURN
250 BEEP:RETURN
260 RV=RND:RETURN
270 FR=FRE(""):RETURN
300 SR$=MID$(STR$(ABS(SR)),2):IF LEFT$(SR$,1)="." THEN SR$="0"+SR$
301 IF SR<0 THEN SR$="-"+SR$
302 RETURN
310 O#=ABS(SR)+.5*10^-CN:O!=INT(O#):O#=1+O#-O!:O$=""
311 IF CN THEN O$="."+STRING$(CN,48):IF O#>1 THEN MID$(O$,1)=MID$(STR$(O#),3)
312 O$=MID$(STR$(O!),2)+O$:IF VAL(O$)>0 AND SR<0 THEN O$="-"+O$
313 IF LEN(O$)<=CT THEN SR$=SPACE$(CT-LEN(O$))+O$:RETURN
314 SR$=STRING$(CT,42):RETURN
350 LPRINT SR$;:RETURN
360 LPRINT:RETURN
 1000 A=500:GOTO 20:REM"FLITS"
 1010 DIM L$(8):AA=ASC("A"):KA=ASC("a")
 1020 SD=20
 1030 FF=100:REM>> FLITSDUUR <<
 1040 GOSUB 100
 1050 PRINT:PRINT
 1060 PRINT"   F L I T S":PRINT"   =========":PRINT
 1070 PRINT"Dit programma laat in een flits"
 1080 PRINT"een getal, een woord of een"
 1090 PRINT"auto-nummer zien."
 1100 PRINT"Dat moet je precies na typen."
 1110 PRINT"Maar als je dat goed doet, wordt"
 1120 PRINT"de volgende flits iets korter!"
 1130 PRINT"Als het niet goed gaat, dan wordt"
 1140 PRINT"de flits juist weer wat langer."
 1150 PRINT"Onder op het scherm staat de"
 1160 PRINT"TIJDFACTOR."
 1170 PRINT"Maak die zo klein mogelijk!"
 1180 PRINT:PRINT:PRINT"Tik op een toets";:GOSUB 210:GOSUB 100
 1190 PRINT:PRINT
 1200 PRINT"   K E U Z E":PRINT"   =========":PRINT
 1210 PRINT"Wil je GETALLEN,":PRINT"       WOORDEN,"
 1220 PRINT"       AUTO-NUMMERS ?":PRINT
 1230 PRINT"tik G, W of A";
 1235 GOSUB 210:GOSUB 3000
 1240 IF(IN$="A") OR(IN$="G") OR(IN$="W") THEN 1250
 1245 GOTO 1235
 1250 PRINT:PRINT:K1=1:IF IN$="W" THEN K1=2
 1260 IF IN$="A" THEN K1=3:K2=8
 1270 ON K1 GOTO 1280,1290,1330
 1280 PRINT"GETALLEN van HOEVEEL CIJFERS?":GOTO 1300
 1290 PRINT"WOORDEN van HOEVEEL LETTERS?"
 1300 PRINT"Tik 1, 2, 3, 4 of 5 ";:GOSUB 210
 1310 IF(IN$<"1") OR(IN$>"5") THEN PRINT:GOTO 1300
 1320 K2=VAL(IN$)
 1330 GOSUB 100:HO=0:VE=10:GOSUB 110
 1340 FOR N=0 TO 39:PRINT"-";:NEXT N
 1350 W$="  ":FOR N=1 TO K2:W$=W$+" ":NEXT N
 1360 REM===HOOFDPROGRAMMA===
 1370 ON K1 GOTO 1390,1470,1660
 1380 REM---getallengenerator---
 1390 GOSUB 260:ON K2 GOTO 1400,1410,1420,1430,1440
 1400 SR=INT(RV*10):GOTO 1450
 1410 SR=10+INT(RV*90):GOTO 1450
 1420 SR=100+INT(RV*900):GOTO 1450
 1430 SR=1000+INT(RV*9000):GOTO 1450
 1440 SR=10000+INT(RV*90000)
 1450 GOSUB 300:X$=SR$:GOTO 1710
 1460 REM---woordengenerator---
 1470 ON K2 GOTO 1490,1490,1530,1560,1610
 1480 REM---1 letter ---
 1490 GOSUB 260:X=AA+INT(RV*26):X$=CHR$(X):IF K2=1 THEN 1710
 1500 REM---2 letters---
 1510 GOSUB 260:X=AA+INT(RV*26):X$=X$+CHR$(X):GOTO 1710
 1520 REM---3 letters---
 1530 RESTORE:GOSUB 260:FOR N=1 TO INT(RV*50)+1:READ X$:NEXT N
 1540 GOTO 1710
 1550 REM---4 letters---
 1560 RESTORE
 1570 READ X$:IF X$<>"W4" THEN 1570
 1580 GOSUB 260:FOR N=1 TO INT(RV*50)+1:READ X$:NEXT N
 1590 GOTO 1710
 1600 REM---5 letters---
 1610 RESTORE
 1620 READ X$:IF X$<>"W5" THEN 1620
 1630 GOSUB 260:FOR N=1 TO INT(RV*50)+1:READ X$:NEXT N
 1640 GOTO 1710
 1650 REM--- autonummergenerator---
 1660 FOR N=1 TO 4:GOSUB 260:L$(N)=CHR$(AA+INT(RV*26)):NEXT N
 1670 FOR N=5 TO 8
 1675 GOSUB 260:SR=INT(RV*10):GOSUB 300:L$(N)=SR$:NEXT N
 1680 X$=L$(1)+L$(2)+"-"+L$(5)+L$(6)+"-"+L$(3)+L$(4)
 1690 REM 1-4=letters, 5-8=cijfers, hier dus LL-CC-LL
 1700 REM---print de flitsduur---
 1710 HO=0:VE=22:GOSUB 110:PRINT;SD;" "
 1720 REM---print de flits---
 1730 Z$=" "+X$+" "
 1735 HO=18:VE=10:GOSUB 110:PRINT Z$
 1740 FOR N=1 TO SD*FF:NEXT N:REM>> FLITSDUUR <<
 1750 GOSUB 110:PRINT W$
 1760 REM---input antwoord---
 1770 HO=22:VE=17:GOSUB 110:INPUT Y$:GOSUB 2000
 1780 VE=19:GOSUB 110
 1790 IF X$=Y$ THEN PRINT"GOED !":GOTO 1810
 1800 HO=6:GOSUB 110:PRINT"JAMMER, het was ";X$
 1810 HO=22:VE=20:GOSUB 110:PRINT"Tik SPATIEBALK";:GOSUB 210
 1815 IF IN$<>" " THEN 1810
 1820 VE=17:GOSUB 110:PRINT"            "
 1830 HO=6:VE=19:GOSUB 110:PRINT"                        "
 1840 HO=22:VE=20:GOSUB 110:PRINT"              "
 1850 SD=SD+1:IF X$=Y$ THEN SD=SD-2:IF SD=0 THEN SD=1
 1860 GOTO 1370
 2000 REM---converteer invoerstring---
 2010 SR$="":IF Y$="" THEN RETURN
 2020 FOR I=1 TO LEN(Y$)
 2030 IN$=MID$(Y$,I,1):GOSUB 3000
 2040 SR$=SR$+IN$
 2050 NEXT I
 2060 Y$=SR$:RETURN
 3000 REM---verander in hoofdletter---
 3010 IF(IN$<"a") OR(IN$>"z") THEN RETURN
 3020 IN$=CHR$(ASC(IN$)-KA+AA)
 3030 RETURN
24990 REM---woorden---
25000 DATA"DAK","HOK","MAN","SAP","VIS"
25010 DATA"LAK","MIS","UIT","BOS","TAK"
25020 DATA"KAT","UIL","BOK","TOR","RAT"
25030 DATA"VAT","VET","PAN","WAS","ZOT"
25040 DATA"TIK","REM","POP","KAR","BUS"
25050 DATA"LEK","HIJ","WIJ","WEI","MEI"
25060 DATA"KOU","KOM","DUS","KAM","LAM"
25070 DATA"DAS","SOK","ELF","ZES","MES"
25080 DATA"KEI","EIK","IEP","GEK","DUN"
25090 DATA"BOL","MUG","SIP","KOE","OEF"
25100 DATA"W4"
25110 DATA"HALT","HOUT","JONG","MUIS","PLOF"
25120 DATA"HOOP","KIST","PLAK","BALK","KURK"
25130 DATA"HARK","BANG","SLAK","GOED","MOOI"
25140 DATA"HOOI","OLIE","OPEN","LAAT","VLUG"
25150 DATA"KOEK","WESP","VIER","VUUR","HAND"
25160 DATA"BOEK","TIJD","ZWAK","MIER","DOEK"
25170 DATA"BIJL","ZEIL","STER","REUS","NEUS"
25180 DATA"KNIE","FLES","TAAL","TAAK","KAAL"
25190 DATA"RAND","WENS","SNEL","TOUW","HIER"
25200 DATA"ZALM","BEER","KRUK","VOUW","DEUR"
25210 DATA"W5"
25220 DATA"NEGEN","LEVER","BEEST","KATER","STANG"
25230 DATA"VLIEG","KEVER","METER","SLANG","GROND"
25240 DATA"BOTER","ANKER","LEPEL","BETER","PLONS"
25250 DATA"RATEL","LATER","ZEKER","KOPER","REGEL"
25260 DATA"MOTOR","KAPOT","STUUR","WAGON","KRUIK"
25270 DATA"KRAAN","WATER","GROEN","VADER","BROER"
25280 DATA"TANTE","GROEP","GELUK","JARIG","TAART"
25290 DATA"LENTE","BLOEM","TAFEL","STRIK","BOTER"
25300 DATA"BOVEN","KRIJT","BLAUW","HOPEN","KAART"
25310 DATA"LUCHT","KRAAI","LOKET","TYPEN","KLAAR"
29990 REM
30000 REM FLITSDUUR AANPASSEN MET DE
30010 REM VARIABELE FF IN REGEL 1030
30020 REM
30030 REM Gemaakt op BBC-computer
30040 REM januari 1989
30050 REM
30060 REM Ch.W.Brederode
30070 REM Von Bonninghausenlaan 33
30080 REM 2161 ES  LISSE
30090 REM
30100 REM Copyright NOS Hilversum
