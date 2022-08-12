{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program SUFFIX;

Var
 I:Integer;

Function Right(Const S:String;L:Byte):String;Begin
 Right:=Copy(S,Length(S)-L+1,L);
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
 SuffixRec=Record
  SuffixName:String[20];
  Sens:String[35];
  Origin:(Grecque,Latine,Francais);
 End;
Const
 SuffixList:Array[0..43]of SuffixRec=(
  (SuffixName:'algie';Sens:'douleur';Origin:Grecque),
  (SuffixName:'archie';Sens:'commandement';Origin:Grecque),
  (SuffixName:'arque';Sens:'commandant';Origin:Grecque),
  (SuffixName:'bare';Sens:'pression';Origin:Grecque),
  (SuffixName:'blaste';Sens:'germe';Origin:Grecque),
  (SuffixName:'bole';Sens:'lan‡ant';Origin:Grecque),
  (SuffixName:'carpe';Sens:'fruit';Origin:Grecque),
  (SuffixName:'cŠne';Sens:'r‚cent';Origin:Grecque),
  (SuffixName:'c‚phale';Sens:'tˆte';Origin:Grecque),
  (SuffixName:'coque';Sens:'graine';Origin:Grecque),
  (SuffixName:'cosme';Sens:'monde';Origin:Grecque),
  (SuffixName:'crate';Sens:'pouvoir, force';Origin:Grecque),
  (SuffixName:'cratie';Sens:'pouvoir, force';Origin:Grecque),
  (SuffixName:'cycle';Sens:'roue';Origin:Grecque),
  (SuffixName:'cyte';Sens:'cellule';Origin:Grecque),
  (SuffixName:'crate';Sens:'pouvoir, force';Origin:Grecque),
  (SuffixName:'dactyle';Sens:'ayant des doigts';Origin:Grecque),
  (SuffixName:'doxe';Sens:'opinion';Origin:Grecque),
  (SuffixName:'drome';Sens:'course';Origin:Grecque),
  (SuffixName:'Šdre';Sens:'face, base';Origin:Grecque),
  (SuffixName:'‚mie';Sens:'sang';Origin:Grecque),
  (SuffixName:'game';Sens:'engendrant';Origin:Grecque),
  (SuffixName:'gamie';Sens:'mariage, union';Origin:Grecque),
  (SuffixName:'gŠne';Sens:'engendrant';Origin:Grecque),
  (SuffixName:'gone';Sens:'angle';Origin:Grecque),
  (SuffixName:'gramme';Sens:'un ‚crit';Origin:Grecque),
  (SuffixName:'graphe';Sens:'‚crivant';Origin:Grecque),
  (SuffixName:'graphie';Sens:'art d''‚crire';Origin:Grecque),
  (SuffixName:'gyne';Sens:'femme';Origin:Grecque),
  (SuffixName:'hydre';Sens:'eau';Origin:Grecque),
  (SuffixName:'iatre';Sens:'soignant';Origin:Grecque),
  (SuffixName:'lƒtrie';Sens:'adoration';Origin:Grecque),
  (SuffixName:'lithe';Sens:'pierre';Origin:Grecque),
  (SuffixName:'lite';Sens:'pierre';Origin:Grecque),
  (SuffixName:'logie';Sens:'science, ‚tude';Origin:Grecque),
  (SuffixName:'logue';Sens:'‚tudiant, sp‚cialiste';Origin:Grecque),
  (SuffixName:'mancie';Sens:'divination';Origin:Grecque),
  (SuffixName:'mane';Sens:'ayant la passion, la manie de';Origin:Grecque),
  (SuffixName:'manie';Sens:'passion, obsession';Origin:Grecque),
  (SuffixName:'mŠtre';Sens:'mesure';Origin:Grecque),
  (SuffixName:'m‚trie';Sens:'pierre';Origin:Grecque),
  (SuffixName:'nome';Sens:'r‚glant, loi';Origin:Grecque),
  (SuffixName:'nomie';Sens:'art de mesurer';Origin:Grecque),
  (SuffixName:'o‹de';Sens:'ayant la forme';Origin:Grecque)
 );
Var
 I:Integer;
Begin
 ParseWord:=False;
 For I:=Low(SuffixList)to High(SuffixList)do Begin
  If(StrToUpper(SuffixList[I].SuffixName)=StrToUpper(Right(Wd,Length(SuffixList[I].SuffixName))))Then Begin
   WriteLn('Suffixes : -',SuffixList[I].SuffixName);
   WriteLn('Sens : ',SuffixList[I].Sens);
   Write('Origine : ');
   Case SuffixList[I].Origin of
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
  WriteLn('SUFFIX : Cette commande permet de retourner le sens d''un suffixe.');
  WriteLn;
  WriteLn('Syntaxe : SUFFIX mot');
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