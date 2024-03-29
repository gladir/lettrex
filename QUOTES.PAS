{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program QUOTES;

Uses Strings;

Type
 QuotationsRec=Record
  Author,Quotation:PChar;
 End;

Const
 QuotationsList:Array[0..22]of QuotationsRec=(
  (Author:'Albert Einstein';
   Quotation:'Deux choses sont infinies : l''Univers et la b�tise humaine. ' +
             'Mais en ce qui concerne l''Univers, je n''en ai pas encore ' +
             'acquis la certitude absolue.'),
  (Author:'Albert Einstein';
   Quotation:'Il est plus facile de d�sint�grer un atome qu''un pr�jug�.'),
  (Author:'Albert Einstein';
   Quotation:'Je ne sais pas comment sera la troisi�me guerre mondiale, '+
              'mais ce dont je suis s�r, c''est que la quatri�me guerre '+
              'mondiale se r�soudra � coups de b�tons et de silex.'),
  (Author:'Albert Einstein';
   Quotation:'L''Etat est notre serviteur et nous n''avons pas � en '+
             '�tre les esclaves.'),
  (Author:'Albert Einstein';
   Quotation:'L''ob�issance aveugle en l''autorit� est le plus grand '+
             'ennemi de la v�rit�.'),
  (Author:'Albert Einstein';
   Quotation:'La connaissance s''acquiert par l''exp�rience, '+
             'tout le reste n''est que de l''information.'),
  (Author:'Albert Einstein';
   Quotation:'La folie est de toujours se comporter de la m�me mani�re '+
             'et de s''attendre � un r�sultat diff�rent.'),
  (Author:'Albert Einstein';
   Quotation:'Le progr�s technique est comme une hache qu''on aurait '+
             'mis dans les mains d''un psychopathe.'),
  (Author:'Albert Einstein';
   Quotation:'Ne fais jamais rien contre ta conscience, m�me si '+
             'l''Etat te le demande.'),
  (Author:'Albert Einstein';
   Quotation:'Nous aurons le destin que nous aurons m�rit�.'),
  (Author:'Albert Einstein';
   Quotation:'Quiconque pr�tend s''�riger en juge de la v�rit� et du '+
             'savoir s''expose � p�rir sous les �clats de rire des dieux '+
             'puisque nous ignorons comment sont r�ellement les choses '+
             'et que nous n''en connaissons que la repr�sentation que '+
             'nous en faisons.'),

  (Author:'Bruce Lee';
   Quotation:'Je ne crains pas l''homme qui a pratiqu� 10 000 coups une '+
             'fois, mais je crains l''homme qui a pratiqu� un coup 10 000 '+
             'fois.'),
  (Author:'Bruce Lee';
   Quotation:'La connaissance donne le pouvoir, mais la force '+
             'de caract�re entra�ne le respect.'),

  (Author:'Charles-Maurice de Talleyrand-P�rigord';
   Quotation:'Si cela va sans dire, cela ira encore mieux en le disant.'),

  (Author:'Jean de La Fontaine';
   Quotation:'L''avarice perd tout en voulant tout gagner.'),
  (Author:'Jean de La Fontaine';
   Quotation:'La m�fiance est m�re de la s�ret�.'),

  (Author:'Miguel de Cervant�s';
   Quotation:'Qui perd la sant� perd beaucoup ; Qui perd un ami perd '+
             'encore plus ; Mais celui qui perd le courage perd tout.'),

  (Author:'Moli�re';
   Quotation:'A vaincre sans p�rils on triomphe sans gloire.'),
  (Author:'Moli�re';
   Quotation:'Qui veut noyer son chien l''accuse de la rage.'),

  (Author:'Platon';
   Quotation:'L''amour est aveugle'),

  (Author:'Saint Matthieu';
   Quotation:'Si un aveugle conduit un autre aveugle, ils tomberont tous '+
             'les deux dans un trou.'),

  (Author:'Socrate';
   Quotation:'Je sais que je ne sais rien.'),

  (Author:'Virginia Foxx';
   Quotation:'Trompez-moi une fois, honte sur vous. '+
             'Tromper moi deux fois, honte � toi.')
 );

Var
 I,J:Integer;
 CurrExpr:String;

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
  WriteLn('QUOTES : Cette commande permet de rechercher des citations ',
                      'c�l�bre.');
  WriteLn;
  WriteLn('Syntaxe : QUOTES expression');
  WriteLn('          QUOTES /RANDOM');
  WriteLn;
  WriteLn('expression  Indique une expression a rechercher dans une citation');
  WriteLn('   /RANDOM  Sort une citation au hasard.');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   CurrExpr:=ParamStr(I);
   If StrToUpper(CurrExpr)='/RANDOM'Then Begin
    Randomize;
    J:=Random(High(QuotationsList));
    WriteLn('Auteur: ',StrPas(QuotationsList[J].Author));
    WriteLn('Citation : �',StrPas(QuotationsList[J].Quotation),'�');
    WriteLn;
   End
    Else
   For J:=Low(QuotationsList)to High(QuotationsList)do Begin
    If Pos(StrToUpper(CurrExpr),StrToUpper(StrPas(QuotationsList[J].Quotation)))>0Then Begin
     WriteLn('Auteur: ',StrPas(QuotationsList[J].Author));
     WriteLn('Citation : �',StrPas(QuotationsList[J].Quotation),'�');
     WriteLn;
    End;
   End;
  End;
 End
  Else
 WriteLn('Param�tre requis !');
END.