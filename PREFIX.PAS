{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program PREFIX;

Var
 I:Integer;

Function Left(Const S:String;L:Byte):String;Begin
 Left:=Copy(S,1,L);
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I]in['‚','Š','ˆ',#233]Then S[I]:='E'Else
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

Function ParseWord(Wd:String):Boolean;
Type
 PrefixRec=Record
  PrefixName:String[20];
  Sens:String[35];
  Origin:(Grecque,Latine,Francais);
 End;
Const
 PrefixList:Array[0..142]of PrefixRec=(
  (PrefixName:'acanth';Sens:'‚pine';Origin:Grecque),
  (PrefixName:'acro';Sens:'‚lev‚';Origin:Grecque),
  (PrefixName:'actino';Sens:'rayon';Origin:Grecque),
  (PrefixName:'ad‚no';Sens:'glande';Origin:Grecque),
  (PrefixName:'a‚ro';Sens:'air';Origin:Grecque),
  (PrefixName:'agro';Sens:'champ';Origin:Grecque),
  (PrefixName:'allo';Sens:'autre';Origin:Grecque),
  (PrefixName:'amphibi';Sens:'autour ou doublement';Origin:Grecque),
  (PrefixName:'ana';Sens:'de bas en haut; en arriŠre, … rebours';Origin:Grecque),
  (PrefixName:'andro';Sens:'homme';Origin:Grecque),
  (PrefixName:'an‚mo';Sens:'vent';Origin:Grecque),
  (PrefixName:'angi';Sens:'vaisseau; capsule';Origin:Grecque),
  (PrefixName:'anth';Sens:'fleur';Origin:Grecque),
  (PrefixName:'anthrac';Sens:'charbon';Origin:Grecque),
  (PrefixName:'anthropo';Sens:'homme';Origin:Grecque),
  (PrefixName:'anti';Sens:'contre';Origin:Grecque),
  (PrefixName:'ap';Sens:'hors de; … partir de; loin de';Origin:Grecque),
  (PrefixName:'arch‚o';Sens:'ancien';Origin:Grecque),
  (PrefixName:'arch';Sens:'au plus haut degr‚; commandant';Origin:Grecque),
  (PrefixName:'arithm';Sens:'nombre';Origin:Grecque),
  (PrefixName:'art‚rio';Sens:'arriŠre';Origin:Grecque),
  (PrefixName:'arthr';Sens:'arthiculation';Origin:Grecque),
  (PrefixName:'ast‚r';Sens:'astre, ‚toile';Origin:Grecque),
  (PrefixName:'astro';Sens:'astre, ‚toile';Origin:Grecque),
  (PrefixName:'auto';Sens:'de soi-mˆme';Origin:Grecque),
  (PrefixName:'bact‚ri';Sens:'bƒton';Origin:Grecque),
  (PrefixName:'baro';Sens:'pesant';Origin:Grecque),
  (PrefixName:'bary';Sens:'lourd';Origin:Grecque),
  (PrefixName:'biblio';Sens:'livre';Origin:Grecque),
  (PrefixName:'bio';Sens:'vie';Origin:Grecque),
  (PrefixName:'blastro';Sens:'germe';Origin:Grecque),
  (PrefixName:'bl‚phar';Sens:'paupiŠre';Origin:Grecque),
  (PrefixName:'brachy';Sens:'court';Origin:Grecque),
  (PrefixName:'brady';Sens:'lent';Origin:Grecque),
  (PrefixName:'brom';Sens:'puanteur';Origin:Grecque),
  (PrefixName:'bact‚ri';Sens:'bƒton';Origin:Grecque),
  (PrefixName:'bronch';Sens:'bronches';Origin:Grecque),
  (PrefixName:'bryo';Sens:'mousse';Origin:Grecque),
  (PrefixName:'butyr';Sens:'beurre';Origin:Grecque),
  (PrefixName:'cach';Sens:'mauvais';Origin:Grecque),
  (PrefixName:'caco';Sens:'mauvais';Origin:Grecque),
  (PrefixName:'calli';Sens:'beau';Origin:Grecque),
  (PrefixName:'carcin';Sens:'cancer';Origin:Grecque),
  (PrefixName:'cardi';Sens:'coeur';Origin:Grecque),
  (PrefixName:'cata';Sens:'de haut en bas, en dessous';Origin:Grecque),
  (PrefixName:'c‚n';Sens:'commun';Origin:Grecque),
  (PrefixName:'c‚phal';Sens:'tˆte';Origin:Grecque),
  (PrefixName:'chalco';Sens:'cuivre';Origin:Grecque),
  (PrefixName:'ch‚ir';Sens:'main';Origin:Grecque),
  (PrefixName:'chir';Sens:'main';Origin:Grecque),
  (PrefixName:'chlor';Sens:'vert';Origin:Grecque),
  (PrefixName:'chol';Sens:'bile';Origin:Grecque),
  (PrefixName:'chondr';Sens:'cartilage';Origin:Grecque),
  (PrefixName:'chrom';Sens:'temps';Origin:Grecque),
  (PrefixName:'chron';Sens:'temps';Origin:Grecque),
  (PrefixName:'chrys';Sens:'or';Origin:Grecque),
  (PrefixName:'cin‚mat';Sens:'mouvement';Origin:Grecque),
  (PrefixName:'cin‚';Sens:'creux';Origin:Grecque),
  (PrefixName:'cin‚t';Sens:'creux';Origin:Grecque),
  (PrefixName:'coel';Sens:'creux';Origin:Grecque),
  (PrefixName:'coeli';Sens:'ventre';Origin:Grecque),
  (PrefixName:'conch';Sens:'coquille';Origin:Grecque),
  (PrefixName:'copro';Sens:'excr‚ment';Origin:Grecque),
  (PrefixName:'cosm';Sens:'monde';Origin:Grecque),
  (PrefixName:'cosmo';Sens:'monde';Origin:Grecque),
  (PrefixName:'cryo';Sens:'froid';Origin:Grecque),
  (PrefixName:'crypt';Sens:'cach‚';Origin:Grecque),
  (PrefixName:'crypto';Sens:'cach‚';Origin:Grecque),
  (PrefixName:'cyan';Sens:'bleu';Origin:Grecque),
  (PrefixName:'cyano';Sens:'bleu';Origin:Grecque),
  (PrefixName:'cyan';Sens:'bleu';Origin:Grecque),
  (PrefixName:'cyber';Sens:'gouverner';Origin:Grecque),
  (PrefixName:'cycl';Sens:'cercle';Origin:Grecque),
  (PrefixName:'cyclo';Sens:'cercle';Origin:Grecque),
  (PrefixName:'cyto';Sens:'cellule';Origin:Grecque),
  (PrefixName:'dactyl';Sens:'doigt';Origin:Grecque),
  (PrefixName:'dactylo';Sens:'doigt';Origin:Grecque),
  (PrefixName:'d‚ca';Sens:'dix';Origin:Grecque),
  (PrefixName:'d‚mo';Sens:'peuple';Origin:Grecque),
  (PrefixName:'d‚m';Sens:'peuple';Origin:Grecque),
  (PrefixName:'derm';Sens:'peau';Origin:Grecque),
  (PrefixName:'dermato';Sens:'s‚par‚ de; … travers';Origin:Grecque),
  (PrefixName:'dia';Sens:'s‚par‚ de; … travers';Origin:Grecque),
  (PrefixName:'didact';Sens:'enseigner';Origin:Grecque),
  (PrefixName:'diplo';Sens:'double';Origin:Grecque),
  (PrefixName:'di';Sens:'s‚par‚ de; … travers';Origin:Grecque),
  (PrefixName:'dod‚ca';Sens:'douze';Origin:Grecque),
  (PrefixName:'dolicho';Sens:'long';Origin:Grecque),
  (PrefixName:'dynamo';Sens:'force';Origin:Grecque),
  (PrefixName:'dynam';Sens:'force';Origin:Grecque),
  (PrefixName:'dys';Sens:'difficult‚, mauvais ‚tat';Origin:Grecque),
  (PrefixName:'‚chin';Sens:'h‚risson';Origin:Grecque),
  (PrefixName:'ecto';Sens:'en dehors';Origin:Grecque),
  (PrefixName:'electro';Sens:'ambre jaune';Origin:Grecque),
  (PrefixName:'electr';Sens:'ambre jaune';Origin:Grecque),
  (PrefixName:'embryo';Sens:'foetus';Origin:Grecque),
  (PrefixName:'en';Sens:'dans';Origin:Grecque),
  (PrefixName:'enc‚phal';Sens:'cerveau';Origin:Grecque),
  (PrefixName:'endo';Sens:'… l''int‚rieur';Origin:Grecque),
  (PrefixName:'end';Sens:'… l''int‚rieur';Origin:Grecque),
  (PrefixName:'ent‚ro';Sens:'entrailles';Origin:Grecque),
  (PrefixName:'ent‚r';Sens:'entrailles';Origin:Grecque),
  (PrefixName:'entomo';Sens:'insecte';Origin:Grecque),
  (PrefixName:'‚o';Sens:'aurore';Origin:Grecque),
  (PrefixName:'‚pi';Sens:'sur';Origin:Grecque),
  (PrefixName:'‚pist‚mo';Sens:'science';Origin:Grecque),
  (PrefixName:'‚pist‚m';Sens:'science';Origin:Grecque),
  (PrefixName:'erg';Sens:'action; travail';Origin:Grecque),
  (PrefixName:'ethno';Sens:'peuple';Origin:Grecque),
  (PrefixName:'ethn';Sens:'peuple';Origin:Grecque),
  (PrefixName:'‚tho';Sens:'caractŠre';Origin:Grecque),
  (PrefixName:'eu';Sens:'bien';Origin:Grecque),
  (PrefixName:'exo';Sens:'au-dehors';Origin:Grecque),
  (PrefixName:'galact';Sens:'lait';Origin:Grecque),
  (PrefixName:'gam';Sens:'mariage';Origin:Grecque),
  (PrefixName:'gastro';Sens:'ventre';Origin:Grecque),
  (PrefixName:'g‚o';Sens:'terre';Origin:Grecque),
  (PrefixName:'g‚ront';Sens:'vieillard';Origin:Grecque),
  (PrefixName:'gloss';Sens:'langue';Origin:Grecque),
  (PrefixName:'gluc';Sens:'doux, sucr‚';Origin:Grecque),
  (PrefixName:'glyc‚ro';Sens:'‚crire';Origin:Grecque),
  (PrefixName:'glyc';Sens:'‚crire';Origin:Grecque),
  (PrefixName:'gyn‚co';Sens:'femme';Origin:Grecque),
  (PrefixName:'gyn';Sens:'femme';Origin:Grecque),
  (PrefixName:'gyro';Sens:'cercle';Origin:Grecque),
  (PrefixName:'hapl';Sens:'simple';Origin:Grecque),
  (PrefixName:'hecto';Sens:'cent';Origin:Grecque),
  (PrefixName:'hect';Sens:'cent';Origin:Grecque),
  (PrefixName:'h‚lio';Sens:'soleil';Origin:Grecque),
  (PrefixName:'h‚li';Sens:'soleil';Origin:Grecque),
  (PrefixName:'h‚mato';Sens:'sang';Origin:Grecque),
  (PrefixName:'h‚mat';Sens:'sang';Origin:Grecque),
  (PrefixName:'h‚mo';Sens:'demi, moiti‚';Origin:Grecque),
  (PrefixName:'h‚mi';Sens:'demi, moiti‚';Origin:Grecque),
  (PrefixName:'h‚pato';Sens:'foie';Origin:Grecque),
  (PrefixName:'h‚pat';Sens:'foie';Origin:Grecque),
  (PrefixName:'hepta';Sens:'sept';Origin:Grecque),
  (PrefixName:'hept';Sens:'sept';Origin:Grecque),
  (PrefixName:'h‚t‚ro';Sens:'autre';Origin:Grecque),
  (PrefixName:'hexa';Sens:'six';Origin:Grecque),
  (PrefixName:'hex';Sens:'six';Origin:Grecque),
  (PrefixName:'hi‚ro';Sens:'sacr‚';Origin:Grecque),
  (PrefixName:'hi‚r';Sens:'sacr‚';Origin:Grecque)

 );
Var
 I:Integer;
Begin
 ParseWord:=False;
 For I:=Low(PrefixList)to High(PrefixList)do Begin
  If(StrToUpper(PrefixList[I].PrefixName)=StrToUpper(Left(Wd,Length(PrefixList[I].PrefixName))))Then Begin
   WriteLn('Pr‚fixes : ',PrefixList[I].PrefixName,'-');
   WriteLn('Sens : ',PrefixList[I].Sens);
   Write('Origine : ');
   Case PrefixList[I].Origin of
    Grecque:WriteLn('Grecque');
    Latine:WriteLn('Latine');
    Francais:WriteLn('Fran‡aise');
   End;
   ParseWord:=True;
   Exit;
  End;
 End;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('PREFIX : Cette commande permet de retourner le sens d''un pr‚fixe.');
  WriteLn;
  WriteLn('Syntaxe : PREFIX mot');
  WriteLn;
  WriteLn(' mot   Ce paramŠtre permet d''indiquer le mot … analyser.');
 End
  Else
 If ParamCount>0Then Begin
  For I:=1 to ParamCount do Begin
   If Not ParseWord(ParamStr(I))Then WriteLn('Aucun pr‚fixe trouv‚');
  End;
 End;
END.