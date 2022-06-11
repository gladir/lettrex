{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program FindName;

Uses Strings;

Const
 NameList:Array[0..33]of PChar=(
  'Adrien','Anicet','Antoine','Chantal','Chantale','Claude',
  'Desroches','Fernand','Fernande','Gagnon','Isma‰l','Jacques',
  'Jean','J‚sus','Jocelyne','John','Joseph','Julien','Laurent',
  'Maltais','Maxime','Mohamed','Normand','Paul','Pauline','Pierre',
  'Romuald','Sonia','Sylvain','Sylvie','Th‚odore','Tremblay',
  'Xavier','Yanick'
 );

Var
 LineNumber:LongInt;
 Option:Set of (_Lines);
 BeginWord,I,J:Integer;
 FoundMultiWord:Boolean;
 SourceFile:Text;
 FileName,CurrLine,CurrWord:String;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

Function IsLetter(Chr:Char):Boolean;Begin
 IsLetter:=Chr in ['A'..'Z','a'..'z','‚','ˆ','Š','…','ƒ','“','‡'];
End;

Procedure CompileWord;
Var
 I:Integer;
Begin
 For I:=Low(NameList) to High(NameList) do Begin
  If StrToUpper(StrPas(NameList[I]))=StrToUpper(CurrWord)Then Begin
   If FileName<>''Then Begin
    If(_Lines in Option)Then Begin
     WriteLn('Nom trouve dans la ligne numero ',LineNumber,' :');
    End;
   End;
   WriteLn(StrPas(NameList[I]));
   Exit;
  End;
 End;
End;

Procedure ParseLineDetectName;
Var
 J:Integer;
Begin
 CurrWord:='';
 BeginWord:=1;
 For I:=1 to Length(CurrLine)do Begin
  If(IsLetter(CurrLine[I]))Then CurrWord:=CurrWord+CurrLine[I]
   Else
  Begin
   FoundMultiWord:=False;
   For J:=Low(NameList) to High(NameList) do Begin
    If(StrLen(NameList[J])>Length(CurrWord))and
      (StrToUpper(StrPas(NameList[J]))=
      StrToUpper(Copy(CurrLine,BeginWord,StrLen(NameList[J]))))Then Begin
     FoundMultiWord:=True;
     Break;
    End;
   End;
   If(FoundMultiWord)Then Begin
    CurrWord:=CurrWord+CurrLine[I]
   End
    Else
   Begin
    CompileWord;
    CurrWord:='';
    BeginWord:=I+1;
   End;
  End;
 End;
 CompileWord;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('FINDNAME : Cette commande permet de detecter les nom propres ',
                      'mentionne dans un texte.');
  WriteLn;
  WriteLn('Syntaxe : FINDNAME "message"');
  WriteLn('          FINDNAME /FILE:fichier [/LINES]');
  WriteLn;
  WriteLn(' /FILE:  Ce parametre permet d''indiquer le fichier a analyser');
  WriteLn(' /LINES  Ce parametre permet d''afficher le numero de ligne');
 End
  Else
 Begin
  Option:=[];
  LineNumber:=0;
  FileName:='';
  CurrLine:='';
  For I:=1 to ParamCount do Begin
   If StrToUpper(ParamStr(I))='/LINES'Then Include(Option,_Lines);
   If StrToUpper(Copy(ParamStr(I),1,6))='/FILE:'Then Begin
    FileName:=Copy(ParamStr(I),7,255);
   End
    Else
   Begin
    If CurrLine=''Then CurrLine:=ParamStr(I)
                  Else CurrLine:=CurrLine+' '+ParamStr(I);
   End;
  End;
  If FileName<>''Then Begin
    Assign(SourceFile,FileName);
    Reset(SourceFile);
    While Not EOF(SourceFile)do Begin
     Inc(LineNumber);
     ReadLn(SourceFile,CurrLine);
     ParseLineDetectName;
    End;
    Close(SourceFile);
   End
    Else
   ParseLineDetectName;
 End;
END.
