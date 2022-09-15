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
   Quotation:'Deux choses sont infinies : l''Univers et la bàtise humaine. ' +
             'Mais en ce qui concerne l''Univers, je n''en ai pas encore ' +
             'acquis la certitude absolue.'),
  (Author:'Albert Einstein';
   Quotation:'Il est plus facile de dÇsintÇgrer un atome qu''un prÇjugÇ.'),
  (Author:'Albert Einstein';
   Quotation:'Je ne sais pas comment sera la troisiäme guerre mondiale, '+
              'mais ce dont je suis sñr, c''est que la quatriäme guerre '+
              'mondiale se rÇsoudra Ö coups de bÉtons et de silex.'),
  (Author:'Albert Einstein';
   Quotation:'L''Etat est notre serviteur et nous n''avons pas Ö en '+
             'àtre les esclaves.'),
  (Author:'Albert Einstein';
   Quotation:'L''obÇissance aveugle en l''autoritÇ est le plus grand '+
             'ennemi de la vÇritÇ.'),
  (Author:'Albert Einstein';
   Quotation:'La connaissance s''acquiert par l''expÇrience, '+
             'tout le reste n''est que de l''information.'),
  (Author:'Albert Einstein';
   Quotation:'La folie est de toujours se comporter de la màme maniäre '+
             'et de s''attendre Ö un rÇsultat diffÇrent.'),
  (Author:'Albert Einstein';
   Quotation:'Le progräs technique est comme une hache qu''on aurait '+
             'mis dans les mains d''un psychopathe.'),
  (Author:'Albert Einstein';
   Quotation:'Ne fais jamais rien contre ta conscience, màme si '+
             'l''Etat te le demande.'),
  (Author:'Albert Einstein';
   Quotation:'Nous aurons le destin que nous aurons mÇritÇ.'),
  (Author:'Albert Einstein';
   Quotation:'Quiconque prÇtend s''Çriger en juge de la vÇritÇ et du '+
             'savoir s''expose Ö pÇrir sous les Çclats de rire des dieux '+
             'puisque nous ignorons comment sont rÇellement les choses '+
             'et que nous n''en connaissons que la reprÇsentation que '+
             'nous en faisons.'),

  (Author:'Bruce Lee';
   Quotation:'Je ne crains pas l''homme qui a pratiquÇ 10 000 coups une '+
             'fois, mais je crains l''homme qui a pratiquÇ un coup 10 000 '+
             'fois.'),
  (Author:'Bruce Lee';
   Quotation:'La connaissance donne le pouvoir, mais la force '+
             'de caractäre entraåne le respect.'),

  (Author:'Charles-Maurice de Talleyrand-PÇrigord';
   Quotation:'Si cela va sans dire, cela ira encore mieux en le disant.'),

  (Author:'Jean de La Fontaine';
   Quotation:'L''avarice perd tout en voulant tout gagner.'),
  (Author:'Jean de La Fontaine';
   Quotation:'La mÇfiance est märe de la sñretÇ.'),

  (Author:'Miguel de Cervantäs';
   Quotation:'Qui perd la santÇ perd beaucoup ; Qui perd un ami perd '+
             'encore plus ; Mais celui qui perd le courage perd tout.'),

  (Author:'Moliäre';
   Quotation:'A vaincre sans pÇrils on triomphe sans gloire.'),
  (Author:'Moliäre';
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
             'Tromper moi deux fois, honte Ö toi.')
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
                      'cÇläbre.');
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
    WriteLn('Citation : Æ',StrPas(QuotationsList[J].Quotation),'Ø');
    WriteLn;
   End
    Else
   For J:=Low(QuotationsList)to High(QuotationsList)do Begin
    If Pos(StrToUpper(CurrExpr),StrToUpper(StrPas(QuotationsList[J].Quotation)))>0Then Begin
     WriteLn('Auteur: ',StrPas(QuotationsList[J].Author));
     WriteLn('Citation : Æ',StrPas(QuotationsList[J].Quotation),'Ø');
     WriteLn;
    End;
   End;
  End;
 End
  Else
 WriteLn('Paramätre requis !');
END.