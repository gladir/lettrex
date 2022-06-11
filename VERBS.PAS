{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program VERBS;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function Left(S:String;Num:Byte):String;Begin
 Left:=Copy(S,1,Num);
End;

Procedure InsStr(Var S:String;Pos:Byte;Const Ins:String);Begin
 S:=Left(S,Pos-1)+Ins+Copy(S,Pos,255)
End;

Function CmpRight(Const S,Cmp:String):Boolean;Begin
 CmpRight:=Copy(S,1+Length(S)-Length(Cmp),Length(Cmp))=Cmp;
End;

Procedure PutVerb(Const Verbe:String);
Var
 Auxiliere:(avoir,etre);
 ParticipePasse,T1,E:String;
 Temps:(PasseCompose,PlusQueParfait,PasseAnterieur,FuturAnterieur,
        SubPasse,SubPlusQueParfait,Imperatif,CondPasse);
Const
 PronomPer:Array[0..7]of String[5]=(
  'je',
  'tu',
  'il',
  'elle',
  'nous',
  'vous',
  'ils',
  'elles'
 );

  Procedure AddItem(X:Byte;Const Verbe:String);
  Var
   S,S2,ST:String;
  Begin
   If(Temps=Imperatif)Then S:=''
                      Else S:=PronomPer[X];
   Case(X)of
    0:Begin
	If Verbe[1]in['a','e','h','i','o','u','y']Then S:='j''';
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='ai'
                                Else S2:='suis';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avais'
                                  Else S2:='‚tais';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eus'
                                  Else S2:='fus';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='aurai'
                                  Else S2:='serai';
SubPasse:If(Auxiliere=avoir)Then S2:='aie'
                            Else S2:='sois';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eusse'
                                     Else S2:='fusse';
Imperatif:S2:='';
CondPasse:If(Auxiliere=avoir)Then S2:='aurais'Else S2:='serais';
	End;
	If(Auxiliere=avoir)Then	ST:='j'''
                           Else ST:='je';
	If(Temps)in[SubPasse,SubPlusQueParfait]Then ST:='Que '+ST;
	S2:=PadRight(ST,10)+S2;
       End;
    1:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='as'
                                Else S2:='es';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avais'
                                  Else S2:='‚tais';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eus'
                                  Else S2:='fus';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='auras'
                                  Else S2:='seras';
SubPasse:If(Auxiliere=avoir)Then S2:='aies'
                            Else S2:='sois';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eusses'
                                     Else S2:='fusse';
Imperatif:If(Auxiliere=avoir)Then S2:='aie'
                             Else S2:='sois';
CondPasse:If(Auxiliere=avoir)Then S2:='aurais'
                             Else S2:='serais';
	End;
       End;
    2:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='a'
                                Else S2:='est';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avait'
                                  Else S2:='‚tait';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eut'
                                  Else S2:='fut';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='aura'
                                  Else S2:='sera';
SubPasse:If(Auxiliere=avoir)Then S2:='ait'
                            Else S2:='soit';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='e–t'
                                     Else S2:='f–t';
Imperatif:S2:='';
CondPasse:If(Auxiliere=avoir)Then S2:='aurait'
                             Else S2:='serait';
	End;
       End;
    3:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='a'
                                Else S2:='est';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avait'
                                  Else S2:='‚tait';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eut'
                                  Else S2:='fut';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='aura'
                                  Else S2:='sera';
SubPasse:If(Auxiliere=avoir)Then S2:='ait'
                            Else S2:='soit';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='e–t'
                                     Else S2:='f–t';
Imperatif:S2:='';
CondPasse:If(Auxiliere=avoir)Then S2:='aurait'
                             Else S2:='serait';
	End;
       End;
    4:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='avons'
                                Else S2:='sommes';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avions'
                                  Else S2:='‚tions';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='e–mes'
                                  Else S2:='f–mes';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='aurons'
                                  Else S2:='serons';
SubPasse:If(Auxiliere=avoir)Then S2:='ayons'
                            Else S2:='soyons';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eussions'
                                     Else S2:='fussions';
Imperatif:If(Auxiliere=avoir)Then S2:='ayons'
                             Else S2:='soyons';
CondPasse:If(Auxiliere=avoir)Then S2:='aurions'
                             Else S2:='serions';
	End;
       End;
    5:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='avez'
                                Else S2:='ˆtes';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='aviez'
                                  Else S2:='‚tiez';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='e–tes'
                                  Else S2:='f–tes';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='aurez'
                                  Else S2:='serez';
SubPasse:If(Auxiliere=avoir)Then S2:='ayez'
                            Else S2:='soyez';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eussiez'
                                     Else S2:='fussiez';
Imperatif:If(Auxiliere=avoir)Then S2:='ayons'
                             Else S2:='soyez';
CondPasse:If(Auxiliere=avoir)Then S2:='auriez'
                             Else S2:='seriez';
	End;
       End;
    6:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='ont'
                                Else S2:='sont';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avaient'
                                  Else S2:='‚taient';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eurent'
                                  Else S2:='furent';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='auront'
                                  Else S2:='seront';
SubPasse:If(Auxiliere=avoir)Then S2:='aient'
                            Else S2:='soient';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eussent'
                                     Else S2:='fussent';
Imperatif:S2:='';
CondPasse:If(Auxiliere=avoir)Then S2:='auraient'
                             Else S2:='seraient';
	End;
       End;
    7:Begin
	Case(Temps)of
PasseCompose:If(Auxiliere=avoir)Then S2:='ont'
                                Else S2:='sont';
PlusQueParfait:If(Auxiliere=avoir)Then S2:='avaient'
                                  Else S2:='‚taient';
PasseAnterieur:If(Auxiliere=avoir)Then S2:='eurent'
                                  Else S2:='furent';
FuturAnterieur:If(Auxiliere=avoir)Then S2:='auront'
                                  Else S2:='seront';
SubPasse:If(Auxiliere=avoir)Then S2:='aient'
                            Else S2:='soient';
SubPlusQueParfait:If(Auxiliere=avoir)Then S2:='eussent'
                                     Else S2:='fussent';
Imperatif:S2:='';
CondPasse:If(Auxiliere=avoir)Then S2:='auraient'Else S2:='seraient';
	End;
       End;
   End;
   If(Temps)in[SubPasse,SubPlusQueParfait]Then Case(X)of
    0,1,4,5:InsStr(S,1,'Que ');
    Else InsStr(S,1,'Qu''');
   End;
   If X>0Then Begin
    If(Temps=Imperatif)Then ST:=''
                       Else ST:=PadRight(S,10);
    ST:=ST+S2;
    S2:=ST;
   End;
   If(Auxiliere=etre)Then Case(X)of
    3:S2:=S2+'e';
    4,5,6:S2:=S2+'s';
    7:S2:=S2+'es';
   End;
   If(Temps=Imperatif)Then ST:=PadRight(Verbe,30)+PadRight(S2,10)+ParticipePasse
   Else ST:=PadRight(S,10)+PadRight(Verbe,20)+PadRight(S2,20)+ParticipePasse;
   WriteLn(ST);
  End;

  Procedure SetPasseCompose;Begin
   WriteLn('INDICATIF');
   WriteLn;
   WriteLn('Pr‚sent',' ':23,'Pass‚ compos‚');
   Temps:=PasseCompose;
  End;

Begin
 Auxiliere:=avoir;
 If Verbe='avoir'Then Begin
  ParticipePasse:='eu';
  SetPasseCompose;
  AddItem(0,'ai');
  AddItem(1,'as');
  AddItem(2,'a');
  AddItem(3,'a');
  AddItem(4,'avons');
  AddItem(5,'avez');
  AddItem(6,'ont');
  AddItem(7,'ont');
  WriteLn;
  WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=PlusQueParfait;
  AddItem(0,'avais');
  AddItem(1,'avais');
  AddItem(2,'avait');
  AddItem(3,'avait');
  AddItem(4,'avions');
  AddItem(5,'aviez');
  AddItem(6,'avaient');
  AddItem(7,'avaient');
  WriteLn;
  WriteLn;
  WriteLn('Pass‚ simple',' ':18,'Pass‚ ant‚rieur');
  Temps:=PasseAnterieur;
  AddItem(0,'eus');
  AddItem(1,'eus');
  AddItem(2,'eut');
  AddItem(3,'eut');
  AddItem(4,'e–mes');
  AddItem(5,'e–tes');
  AddItem(6,'eurent');
  AddItem(7,'eurent');
  WriteLn;
  WriteLn;
  WriteLn('Futur simple',' ':18,'Futur ant‚rieur');
  Temps:=FuturAnterieur;
  AddItem(0,'aurai');
  AddItem(1,'auras');
  AddItem(2,'aura');
  AddItem(3,'aura');
  AddItem(4,'aurons');
  AddItem(5,'aurez');
  AddItem(6,'auront');
  AddItem(7,'auront');
  WriteLn;
  WriteLn;
  WriteLn;
  WriteLn('SUBJONCTIF');
  WriteLn;
  WriteLn('Pr‚sent'+' ':23,'Pass‚');
  Temps:=SubPasse;
  AddItem(0,'aie');
  AddItem(1,'aies');
  AddItem(2,'ait');
  AddItem(3,'ait');
  AddItem(4,'ayons');
  AddItem(5,'ayez');
  AddItem(6,'aient');
  AddItem(7,'aient');
  WriteLn;WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=SubPlusQueParfait;
  AddItem(0,'eusse');
  AddItem(1,'eusses');
  AddItem(2,'e–t');
  AddItem(3,'e–t');
  AddItem(4,'eussions');
  AddItem(5,'eussiez');
  AddItem(6,'eussent');
  AddItem(7,'eussent');
  WriteLn;
  WriteLn;
  WriteLn;
  WriteLn('IMPRATIF');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  Temps:=Imperatif;
  AddItem(1,'aie');
  AddItem(4,'ayons');
  AddItem(5,'ayez');
  WriteLn;WriteLn;WriteLn;
  WriteLn('CONDITIONNEL');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  WriteLn;
  Temps:=SubPasse;
  AddItem(0,'aurais');
  AddItem(1,'aurais');
  AddItem(2,'aurait');
  AddItem(3,'aurait');
  AddItem(4,'aurions');
  AddItem(5,'auriez');
  AddItem(6,'auraient');
  AddItem(7,'auraient');
 End
  Else
 If(Verbe='ˆtre')or(Verbe=#234+'tre')or(Verbe=#136+'tre')or(Verbe='etre')Then Begin
  ParticipePasse:='‚t‚';
  SetPasseCompose;
  AddItem(0,'suis');
  AddItem(1,'es');
  AddItem(2,'est');
  AddItem(3,'est');
  AddItem(4,'sommes');
  AddItem(5,'ˆtes');
  AddItem(6,'sont');
  AddItem(7,'sont');
  WriteLn;
  WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=PlusQueParfait;
  AddItem(0,'avais');
  AddItem(1,'avais');
  AddItem(2,'avait');
  AddItem(3,'avait');
  AddItem(4,'avions');
  AddItem(5,'aviez');
  AddItem(6,'avaient');
  AddItem(7,'avaient');
  WriteLn;
  WriteLn;
  WriteLn('Pass‚ simple',' ':18,'Pass‚ ant‚rieur');
  Temps:=PasseAnterieur;
  AddItem(0,'fus');
  AddItem(1,'fus');
  AddItem(2,'fut');
  AddItem(3,'fut');
  AddItem(4,'f–mes');
  AddItem(5,'f–tes');
  AddItem(6,'furent');
  AddItem(7,'furent');
  WriteLn;
  WriteLn;
  WriteLn('Futur simple',' ':18,'Futur ant‚rieur');
  Temps:=FuturAnterieur;
  AddItem(0,'aurai');
  AddItem(1,'auras');
  AddItem(2,'aura');
  AddItem(3,'aura');
  AddItem(4,'aurons');
  AddItem(5,'aurez');
  AddItem(6,'auront');
  AddItem(7,'auront');
  WriteLn;
  WriteLn;
  WriteLn;
  WriteLn('SUBJONCTIF');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  Temps:=SubPasse;
  AddItem(0,'sois');
  AddItem(1,'sois');
  AddItem(2,'soit');
  AddItem(3,'soit');
  AddItem(4,'soyons');
  AddItem(5,'soyez');
  AddItem(6,'soient');
  AddItem(7,'soient');
  WriteLn;WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=SubPlusQueParfait;
  AddItem(0,'eusse');
  AddItem(1,'eusses');
  AddItem(2,'e–t');
  AddItem(3,'e–t');
  AddItem(4,'eussions');
  AddItem(5,'eussiez');
  AddItem(6,'eussent');
  AddItem(7,'eussent');
  WriteLn;
  WriteLn;
  WriteLn;
  WriteLn('IMPRATIF');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  Temps:=Imperatif;
  AddItem(1,'sois');
  AddItem(4,'soyons');
  AddItem(5,'soyez');
  WriteLn;WriteLn;WriteLn;
  WriteLn('CONDITIONNEL');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  WriteLn;
  Temps:=SubPasse;
  AddItem(0,'serais');
  AddItem(1,'serais');
  AddItem(2,'serait');
  AddItem(3,'serait');
  AddItem(4,'serions');
  AddItem(5,'seriez');
  AddItem(6,'seraient');
  AddItem(7,'seraient');
 End
  Else
 If CmpRight(Verbe,'er')Then Begin
  T1:=Left(Verbe,Length(Verbe)-2);
  ParticipePasse:=T1+'‚';
  E:=T1;
  Case T1[Length(T1)]of
   'c':E[Length(E)]:=#135;
   'g':E:=E+'e';
  End;
  SetPasseCompose;
  AddItem(0,T1+'e');
  AddItem(1,T1+'es');
  AddItem(2,T1+'e');
  AddItem(3,T1+'e');
  AddItem(4,E+'ons');
  AddItem(5,T1+'ez');
  AddItem(6,T1+'ent');
  AddItem(7,T1+'ent');
  WriteLn;
  WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=PlusQueParfait;
  AddItem(0,E+'ais');
  AddItem(1,E+'ais');
  AddItem(2,E+'ait');
  AddItem(3,E+'ait');
  AddItem(4,T1+'ions');
  AddItem(5,T1+'iez');
  AddItem(6,E+'aient');
  AddItem(7,E+'aient');
  WriteLn;
  WriteLn;
  WriteLn('Pass‚ simple',' ':18,'Pass‚ ant‚rieur');
  Temps:=PasseAnterieur;
  AddItem(0,E+'ai');
  AddItem(1,E+'as');
  AddItem(2,E+'a');
  AddItem(3,E+'a');
  AddItem(4,E+'ƒmes');
  AddItem(5,E+'ƒtes');
  AddItem(6,T1+'Šrent');
  AddItem(7,T1+'Šrent');
  WriteLn;
  WriteLn;
  WriteLn('Futur simple',' ':18,'Futur ant‚rieur');
  Temps:=FuturAnterieur;
  AddItem(0,Verbe+'ai');
  AddItem(1,Verbe+'as');
  AddItem(2,Verbe+'a');
  AddItem(3,Verbe+'a');
  AddItem(4,Verbe+'ons');
  AddItem(5,Verbe+'ez');
  AddItem(6,Verbe+'ont');
  AddItem(7,Verbe+'ont');
  WriteLn;WriteLn;WriteLn;
  WriteLn('SUBJONCTIF');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  WriteLn;
  Temps:=SubPasse;
  AddItem(0,T1+'e');
  AddItem(1,T1+'es');
  AddItem(2,T1+'e');
  AddItem(3,T1+'e');
  AddItem(4,T1+'ions');
  AddItem(5,T1+'iez');
  AddItem(6,T1+'ent');
  AddItem(7,T1+'ent');
  WriteLn;WriteLn;
  WriteLn('Imparfait',' ':21,'Plus-que-parfait');
  Temps:=SubPlusQueParfait;
  AddItem(0,E+'asse');
  AddItem(1,E+'asses');
  AddItem(2,E+'ƒt');
  AddItem(3,E+'ƒt');
  AddItem(4,E+'assions');
  AddItem(5,E+'assiez');
  AddItem(6,E+'assent');
  AddItem(7,E+'assent');
  WriteLn;WriteLn;WriteLn;
  WriteLn('IMPRATIF');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  Temps:=Imperatif;
  AddItem(1,T1+'e');
  AddItem(4,E+'ons');
  AddItem(5,T1+'ez');
  WriteLn;WriteLn;WriteLn;
  WriteLn('CONDITIONNEL');
  WriteLn;
  WriteLn('Pr‚sent',' ':23,'Pass‚');
  WriteLn;
  Temps:=SubPasse;
  AddItem(0,Verbe+'ais');
  AddItem(1,Verbe+'ais');
  AddItem(2,Verbe+'ait');
  AddItem(3,Verbe+'ait');
  AddItem(4,Verbe+'ions');
  AddItem(5,Verbe+'iez');
  AddItem(6,Verbe+'aient');
  AddItem(7,Verbe+'aient');
 End
  Else
 Begin
  WriteLn('Je suis sincŠrement d‚sol‚, j''ignore comment le conjuguer!');
 End;
End;

Var
 I:Integer;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('VERBS : Cette commande permet d''afficher ',
                      'les conjugaisons d''un verbe.');
  WriteLn;
  WriteLn('Syntaxe : VERBS verbe');
  WriteLn;
  WriteLn(' verbe  Ce parametre permet d''indiquer le verbe a conjuguer');
 End
  Else
 If ParamCount>0Then Begin
  For I:=1 to ParamCount do PutVerb(ParamStr(I));
 End
  Else
 WriteLn('Verbe requis');
END.