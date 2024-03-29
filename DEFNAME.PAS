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
   Origin:(Aucune,Anglais,Arabe,Bretonne,Espagnol,Germanique,Grecque,Latine,
   Francais,Hebraique,Irlandaise,Italienne,Perse);
 End;

Const
 NameList:Array[0..74]of NameRec=(
  (_Name:'Aaron';Def:'Celui qui vient de loin';Origin:Hebraique),
  (_Name:'Adam';Def:'Fait en terre rouge';Origin:Hebraique),
  (_Name:'Alba';Def:'Blanc';Origin:Latine),
  (_Name:'Alice';Def:'De noble race';Origin:Germanique),
  (_Name:'Ambre';Def:'Immortel';Origin:Arabe),
  (_Name:'Anna';Def:'Gr�ce';Origin:Hebraique),
  (_Name:'Antoine';Def:'Inestimable';Origin:Latine),
  (_Name:'Arthur';Def:'Ours, pierre ou l''aigle du dieu Thor';Origin:Francais),
  (_Name:'Aurel';Def:'Vient de �aurum� en grec et signifie �matin�e�.';Origin:Grecque),
  (_Name:'Augustin';Def:'V�n�rable';Origin:Latine),
  (_Name:'Ayden';Def:'Aider ou � un petit feu';Origin:Latine),
  (_Name:'Axel';Def:'P�re de la paix';Origin:Hebraique),
  (_Name:'Chlo�';Def:'Jeune pousse, herbe naissante';Origin:Grecque),
  (_Name:'D�mosth�ne';Def:'Force du peuple';Origin:Aucune),
  (_Name:'Eden';Def:'Prosp�rit� ou ourson';Origin:Anglais),
  (_Name:'Edmond';Def:'Illustre ou puissant protecteur';Origin:Aucune),
  (_Name:'Elio';Def:'Dieu est mon salut';Origin:Hebraique),
  (_Name:'Eliott';Def:'Dieu est Yahv�, Seigneur Dieu';Origin:Hebraique),
  (_Name:'Emma';Def:'Dieu est avec nous ou maison';Origin:Francais),
  (_Name:'Enzo';Def:'Maitre de maison';Origin:Italienne),
  (_Name:'Ethan';Def:'Fort, robuste ou imp�tueux';Origin:Hebraique),
  (_Name:'Eus�be';Def:'Pieux religieux';Origin:Aucune),
  (_Name:'Faramond';Def:'�tranger protecteur';Origin:Aucune),
  (_Name:'Gabin';Def:'Personne originaire de Gabii';Origin:Latine),
  (_Name:'Gabriel';Def:'Etre fort et dieu';Origin:Hebraique),
  (_Name:'Gaspard';Def:'Gardien du tr�sor';Origin:Perse),
  (_Name:'Hugo';Def:'Esprit, pens�e et intelligence';Origin:Germanique),
  (_Name:'Imr�n';Def:'Fleurissant ou �panoui';Origin:Arabe),
  (_Name:'Isaac';Def:'Rire';Origin:Hebraique),
  (_Name:'Jade';Def:'Flanc ou entrailles';Origin:Espagnol),
  (_Name:'Jules';Def:'Descend de Jupiter';Origin:Latine),
  (_Name:'L�o';Def:'Lion';Origin:Latine),
  (_Name:'L�na';Def:'Chaleur, �clat de soleil';Origin:Grecque),
  (_Name:'L�on';Def:'Lion';Origin:Latine),
  (_Name:'Liam';Def:'Volont� et casque';Origin:Irlandaise),
  (_Name:'Lina';Def:'Beaut� pr�cieuse (chinois), messager (grec) ou tendre (arabe)';Origin:Latine),
  (_Name:'Louis';Def:'Gloire et combat';Origin:Francais),
  (_Name:'Louise';Def:'Gloire et combat';Origin:Francais),
  (_Name:'Lucas';Def:'Blanc ou brillant';Origin:Grecque),
  (_Name:'Lyam';Def:'Volont� et casque';Origin:Hebraique),
  (_Name:'Ma�l';Def:'Prince, chef ou grand';Origin:Bretonne),
  (_Name:'Malo';Def:'Otage ou lumi�re';Origin:Bretonne),
  (_Name:'Marceau';Def:'Nom d''une famille Romaine.';Origin:Latine),
  (_Name:'Marius';Def:'Maritime ou mer';Origin:Latine),
  (_Name:'Martin';Def:'Mars, nom donn� dieu de la guerre chez les Romains';Origin:Latine),
  (_Name:'Mathis';Def:'Don de dieu';Origin:Hebraique),
  (_Name:'Mia';Def:'Cher ou aim�';Origin:Hebraique),
  (_Name:'Milo';Def:'Rival ou s�duisant';Origin:Latine),
  (_Name:'Mohamed';Def:'Lou�, digne de louanges ou combl� d''�loge';Origin:Arabe),
  (_Name:'Na�l';Def:'Celui dont le travail est fructueux';Origin:Arabe),
  (_Name:'Nathan';Def:'Don ou cadeau';Origin:Hebraique),
  (_Name:'Nino';Def:'Petit gar�on';Origin:Latine),
  (_Name:'Noah';Def:'Repos� ou apais�';Origin:Hebraique),
  (_Name:'No�';Def:'Consolation ou repos';Origin:Hebraique),
  (_Name:'Nolan';Def:'Jeune champion ou guerrier en char';Origin:Irlandaise),
  (_Name:'Paul';Def:'Petit';Origin:Latine),
  (_Name:'Pharamond';Def:'�tranger protecteur';Origin:Aucune),
  (_Name:'Rapha�l';Def:'Dieu gu�rit';Origin:Hebraique),
  (_Name:'Robin';Def:'Gloire illustre';Origin:Germanique),
  (_Name:'Romy';Def:'Fleur aim�e';Origin:Latine),
  (_Name:'Rose';Def:'Celui ayant un rang glorieux';Origin:Francais),
  (_Name:'Sacha';Def:'Prot�ger';Origin:Grecque),
  (_Name:'Salverte';Def:'Maison verte';Origin:Aucune),
  (_Name:'Samuel';Def:'Le nom de Dieu.';Origin:Hebraique),
  (_Name:'Sigismond';Def:'Vainqueur secourable';Origin:Aucune),
  (_Name:'Sophie';Def:'Signifie Sagesse.';Origin:Grecque),
  (_Name:'Sylvain';Def:'Fils de dieu romain gardien de la for�t.';Origin:Latine),
  (_Name:'Teodor';Def:'Perfectionniste';Origin:Aucune),
  (_Name:'Th�o';Def:'Don de Dieu';Origin:Grecque),
  (_Name:'Th�odore';Def:'Provient du terme grec theos signifiant "dieu".';Origin:Grecque),
  (_Name:'Tiago';Def:'Qui talonne ou que Dieu favorise';Origin:Hebraique),
  (_Name:'Tim�o';Def:'Honorer Dieu';Origin:Grecque),
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
      Anglais:WriteLn('Origine : Anglaise');
      Arabe:WriteLn('Origine : Arabe');
      Bretonne:WriteLn('Origine : Bretonne');
      Espagnol:WriteLn('Origine : Espagnol');
      Francais:WriteLn('Origine : Fran�ais');
      Germanique:WriteLn('Origine : Germanique');
      Grecque:WriteLn('Origine : Grecque');
      Latine:WriteLn('Origine : Latine');
      Hebraique:WriteLn('Origine : H�bra�que');
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
 WriteLn('Param�tre requis !');
END.
