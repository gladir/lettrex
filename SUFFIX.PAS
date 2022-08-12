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
 SuffixList:Array[0..146]of SuffixRec=(
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
  (SuffixName:'o‹de';Sens:'ayant la forme';Origin:Grecque),
  (SuffixName:'lithe';Sens:'pierre';Origin:Grecque),
  (SuffixName:'ome';Sens:'maladie, tumeur';Origin:Grecque),
  (SuffixName:'onyme';Sens:'portant le nom';Origin:Grecque),
  (SuffixName:'pathe';Sens:'maladie de';Origin:Grecque),
  (SuffixName:'pathie';Sens:'maladie de';Origin:Grecque),
  (SuffixName:'p‚die';Sens:'‚ducation';Origin:Grecque),
  (SuffixName:'phage';Sens:'manger';Origin:Grecque),
  (SuffixName:'phagie';Sens:'manger';Origin:Grecque),
  (SuffixName:'phane';Sens:'brillant';Origin:Grecque),
  (SuffixName:'phile';Sens:'aimer';Origin:Grecque),
  (SuffixName:'philie';Sens:'aimer';Origin:Grecque),
  (SuffixName:'phobe';Sens:'craindre';Origin:Grecque),
  (SuffixName:'phobie';Sens:'craindre';Origin:Grecque),
  (SuffixName:'phone';Sens:'voix, son';Origin:Grecque),
  (SuffixName:'phonie';Sens:'voix, son';Origin:Grecque),
  (SuffixName:'phore';Sens:'portant';Origin:Grecque),
  (SuffixName:'phone';Sens:'voix, son';Origin:Grecque),
  (SuffixName:'pithŠque';Sens:'singe';Origin:Grecque),
  (SuffixName:'pode';Sens:'pied';Origin:Grecque),
  (SuffixName:'pole';Sens:'ville, vendre';Origin:Grecque),
  (SuffixName:'ptŠre';Sens:'aile';Origin:Grecque),
  (SuffixName:'saure';Sens:'l‚zard';Origin:Grecque),
  (SuffixName:'scope';Sens:'voir, vision';Origin:Grecque),
  (SuffixName:'scopie';Sens:'voir, vision';Origin:Grecque),
  (SuffixName:'sphŠre';Sens:'globe';Origin:Grecque),
  (SuffixName:'taphe';Sens:'tombeau';Origin:Grecque),
  (SuffixName:'technie';Sens:'science, art';Origin:Grecque),
  (SuffixName:'thŠque';Sens:'armoire, boite';Origin:Grecque),
  (SuffixName:'th‚rapie';Sens:'traitement m‚dical';Origin:Grecque),
  (SuffixName:'therme';Sens:'chaleur';Origin:Grecque),
  (SuffixName:'thermie';Sens:'chaleur';Origin:Grecque),
  (SuffixName:'tomie';Sens:'action de couper';Origin:Grecque),
  (SuffixName:'type';Sens:'impression';Origin:Grecque),
  (SuffixName:'typie';Sens:'impression';Origin:Grecque),
  (SuffixName:'urie';Sens:'urine';Origin:Grecque),

  (SuffixName:'cide';Sens:'tuant';Origin:Latine),
  (SuffixName:'cole';Sens:'culture, habitant';Origin:Latine),
  (SuffixName:'culteur';Sens:'cultiver';Origin:Latine),
  (SuffixName:'culture';Sens:'cultiver';Origin:Latine),
  (SuffixName:'fŠre';Sens:'portant';Origin:Latine),
  (SuffixName:'fique';Sens:'produisant';Origin:Latine),
  (SuffixName:'forme';Sens:'ayant la forme de';Origin:Latine),
  (SuffixName:'fuge';Sens:'fuir';Origin:Latine),
  (SuffixName:'grade';Sens:'marchant';Origin:Latine),
  (SuffixName:'lingue';Sens:'langue';Origin:Latine),
  (SuffixName:'pare';Sens:'enfantant';Origin:Latine),
  (SuffixName:'pŠde';Sens:'pied';Origin:Latine),
  (SuffixName:'vore';Sens:'se nourrissant';Origin:Latine),

  (SuffixName:'ace';Sens:'pr‚joratif';Origin:Francais),
  (SuffixName:'asse';Sens:'pr‚joratif';Origin:Francais),
  (SuffixName:'ade';Sens:'action, collectif';Origin:Francais),
  (SuffixName:'age';Sens:'action, collectif';Origin:Francais),
  (SuffixName:'aie';Sens:'plantation de v‚g‚taux';Origin:Francais),
  (SuffixName:'ail';Sens:'instrument';Origin:Francais),
  (SuffixName:'aille';Sens:'action, collectif';Origin:Francais),
  (SuffixName:'ain';Sens:'origine';Origin:Francais),
  (SuffixName:'aine';Sens:'origine, collectif';Origin:Francais),
  (SuffixName:'aire';Sens:'agent';Origin:Francais),
  (SuffixName:'aison';Sens:'action';Origin:Francais),
  (SuffixName:'ion';Sens:'action';Origin:Francais),
  (SuffixName:'ison';Sens:'action';Origin:Francais),
  (SuffixName:'sion';Sens:'action';Origin:Francais),
  (SuffixName:'tion';Sens:'action';Origin:Francais),
  (SuffixName:'ance';Sens:'r‚sultat de l''action';Origin:Francais),
  (SuffixName:'ard';Sens:'p‚joratif';Origin:Francais),
  (SuffixName:'at';Sens:'profession, ‚tat';Origin:Francais),
  (SuffixName:'ƒtre';Sens:'p‚joratif';Origin:Francais),
  (SuffixName:'ature';Sens:'action, instrument';Origin:Francais),
  (SuffixName:'ure';Sens:'action, instrument';Origin:Francais),
  (SuffixName:'aud';Sens:'p‚joratif';Origin:Francais),
  (SuffixName:'cule';Sens:'diminutif';Origin:Francais),
  (SuffixName:'ule';Sens:'diminutif';Origin:Francais),
  (SuffixName:'eau';Sens:'diminutif';Origin:Francais),
  (SuffixName:'elle';Sens:'diminutif';Origin:Francais),
  (SuffixName:'ille';Sens:'diminutif';Origin:Francais),
  (SuffixName:'‚e';Sens:'contenu';Origin:Francais),
  (SuffixName:'ement';Sens:'action';Origin:Francais),
  (SuffixName:'ment';Sens:'action';Origin:Francais),
  (SuffixName:'er';Sens:'agent';Origin:Francais),
  (SuffixName:'ier';Sens:'agent';Origin:Francais),
  (SuffixName:'iŠre';Sens:'agent';Origin:Francais),
  (SuffixName:'erie';Sens:'local, qualit‚';Origin:Francais),
  (SuffixName:'esse';Sens:'d‚faut, qualit‚';Origin:Francais),
  (SuffixName:'et';Sens:'diminutif';Origin:Francais),
  (SuffixName:'ette';Sens:'diminutif';Origin:Francais),
  (SuffixName:'et‚';Sens:'qualit‚';Origin:Francais),
  (SuffixName:'t‚';Sens:'qualit‚';Origin:Francais),
  (SuffixName:'it‚';Sens:'qualit‚';Origin:Francais),
  (SuffixName:'eur';Sens:'agent';Origin:Francais),
  (SuffixName:'ateur';Sens:'agent';Origin:Francais),
  (SuffixName:'ie';Sens:'‚tat';Origin:Francais),
  (SuffixName:'ien';Sens:'profession, origine';Origin:Francais),
  (SuffixName:'en';Sens:'profession, origine';Origin:Francais),
  (SuffixName:'is';Sens:'r‚sultat d''une action';Origin:Francais),
  (SuffixName:'ise';Sens:'d‚faut, qualit‚';Origin:Francais),
  (SuffixName:'isme';Sens:'doctrine, ‚cole';Origin:Francais),
  (SuffixName:'iste';Sens:'exer‡ant un m‚tier';Origin:Francais),
  (SuffixName:'ite';Sens:'‚tat maladif';Origin:Francais),
  (SuffixName:'itude';Sens:'qualit‚';Origin:Francais),
  (SuffixName:'oir';Sens:'instrument';Origin:Francais),
  (SuffixName:'oire';Sens:'instrument';Origin:Francais),
  (SuffixName:'ole';Sens:'diminutif';Origin:Francais),
  (SuffixName:'eron';Sens:'diminutif';Origin:Francais)
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
   If Not ParseWord(ParamStr(I))Then WriteLn('Aucun suffixe trouv‚');
  End;
 End;
END.