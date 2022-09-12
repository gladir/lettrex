{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program DefName;

Uses Strings;

Type
 NameRec=Record
  _Name,Def:PChar;
   Origin:(Aucune,Arabe,Bretonne,Germanique,Grecque,Latine,
   Francais,Hebraique,Irlandaise,Italienne,Perse);
 End;

Const
 NameList:Array[0..42]of NameRec=(
  (_Name:'Antoine';Def:'Inestimable';Origin:Latine),
  (_Name:'Aurel';Def:'Vient de ÆaurumØ en grec et signifie ÆmatinÇeØ.';Origin:Grecque),
  (_Name:'Augustin';Def:'VÇnÇrable';Origin:Latine),
  (_Name:'Ayden';Def:'Aider ou Ö un petit feu';Origin:Latine),
  (_Name:'Axel';Def:'Päre de la paix';Origin:Hebraique),
  (_Name:'DÇmosthäne';Def:'Force du peuple';Origin:Aucune),
  (_Name:'Edmond';Def:'Illustre ou puissant protecteur';Origin:Aucune),
  (_Name:'Elio';Def:'Dieu est mon salut';Origin:Hebraique),
  (_Name:'Eliott';Def:'Dieu est YahvÇ, Seigneur Dieu';Origin:Hebraique),
  (_Name:'Enzo';Def:'Maitre de maison';Origin:Italienne),
  (_Name:'Ethan';Def:'Fort, robuste ou impÇtueux';Origin:Hebraique),
  (_Name:'Eusäbe';Def:'Pieux religieux';Origin:Aucune),
  (_Name:'Faramond';Def:'êtranger protecteur';Origin:Aucune),
  (_Name:'Gabriel';Def:'Etre fort et dieu';Origin:Hebraique),
  (_Name:'Gaspard';Def:'Gardien du trÇsor';Origin:Perse),
  (_Name:'ImrÉn';Def:'Fleurissant ou Çpanoui';Origin:Arabe),
  (_Name:'Jules';Def:'Descend de Jupiter';Origin:Latine),
  (_Name:'Lyam';Def:'VolontÇ et casque';Origin:Hebraique),
  (_Name:'Louis';Def:'Gloire et combat';Origin:Francais),
  (_Name:'Malo';Def:'Otage ou lumiäre';Origin:Bretonne),
  (_Name:'Marceau';Def:'Nom d''une famille Romaine.';Origin:Latine),
  (_Name:'Marius';Def:'Maritime ou mer';Origin:Latine),
  (_Name:'Martin';Def:'Mars, nom donnÇ dieu de la guerre chez les Romains';Origin:Latine),
  (_Name:'Mathis';Def:'Don de dieu';Origin:Hebraique),
  (_Name:'Milo';Def:'Rival ou sÇduisant';Origin:Latine),
  (_Name:'Mohamed';Def:'LouÇ, digne de louanges ou comblÇ d''Çloge';Origin:Arabe),
  (_Name:'Nino';Def:'Petit garáon';Origin:Latine),
  (_Name:'Nolan';Def:'Jeune champion ou guerrier en char';Origin:Irlandaise),
  (_Name:'Pharamond';Def:'êtranger protecteur';Origin:Aucune),
  (_Name:'Robin';Def:'Gloire illustre';Origin:Germanique),
  (_Name:'Salverte';Def:'Maison verte';Origin:Aucune),
  (_Name:'Samuel';Def:'Le nom de Dieu.';Origin:Hebraique),
  (_Name:'Sigismond';Def:'Vainqueur secourable';Origin:Aucune),
  (_Name:'Sophie';Def:'Signifie Sagesse.';Origin:Grecque),
  (_Name:'Sylvain';Def:'Fils de dieu romain gardien de la foràt.';Origin:Latine),
  (_Name:'Teodor';Def:'Perfectionniste';Origin:Aucune),
  (_Name:'ThÇo';Def:'Don de Dieu';Origin:Grecque),
  (_Name:'ThÇodore';Def:'Provient du terme grec theos signifiant "dieu".';Origin:Grecque),
  (_Name:'Tiago';Def:'Qui talonne ou que Dieu favorise';Origin:Hebraique),
  (_Name:'TimÇo';Def:'Honorer Dieu';Origin:Grecque),
  (_Name:'Tom';Def:'Jumeau';Origin:Hebraique),
  (_Name:'Valentin';Def:'Fort, robuste et vigoureux';Origin:Latine),
  (_Name:'Victor';Def:'Vaincre';Origin:Latine)

 );

Var
 I,J:Integer;
 CurrName:String;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
  If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('DEFNAME : Cette commande permet d''indiquer la signification d''un ',
                      'nom propres.');
  WriteLn;
  WriteLn('Syntaxe : DEFNAME nom');
  WriteLn;
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   CurrName:=ParamStr(I);
   For J:=Low(NameList)to High(NameList)do Begin
    If StrToUpper(CurrName)=StrToUpper(StrPas(NameList[J]._Name))Then Begin
     WriteLn('Nom: ',StrPas(NameList[J]._Name));
     Case NameList[J].Origin of
      Arabe:WriteLn('Origine : Arabe');
      Bretonne:WriteLn('Origine : Bretonne');
      Francais:WriteLn('Origine : Franáais');
      Germanique:WriteLn('Origine : Germanique');
      Grecque:WriteLn('Origine : Grecque');
      Latine:WriteLn('Origine : Latine');
      Hebraique:WriteLn('Origine : HÇbraãque');
      Irlandaise:WriteLn('Origine : Irlandaise');
      Italienne:WriteLn('Origine : Italienne');
      Perse:WriteLn('Origine : Perse');
     End;
     WriteLn('Signification : ',StrPas(NameList[J].Def));
     WriteLn;
     Break;
    End;
   End;
  End;
 End
  Else
 WriteLn('Paramätre requis !');
END.