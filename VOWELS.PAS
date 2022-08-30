{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program Vowels;

Var
 LineNumber:LongInt;
 Option:Set of (_Lines);
 BeginWord,I,J:Integer;
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

Function IsVowels(C:Char):Boolean;Begin
 IsVowels:=UpCase(C)in ['A','E','I','O','U','‚','Š','ˆ','…','ƒ','“']
End;

Procedure ParseLineVowels;
Var
 I:Integer;
Begin
 If(_Lines in Option)Then WriteLn(LineNumber,':');
 WriteLn(CurrLine);
 For I:=1 to Length(CurrLine)do Begin
  If(IsVowels(CurrLine[I]))Then Write('^')
                           Else Write(' ');
 End;
 WriteLn;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('VOWELS : Cette commande permet d''indiquer les voyelles ',
                      'mentionn‚ dans un texte.');
  WriteLn;
  WriteLn('Syntaxe : VOWELS "message"');
  WriteLn('          VOWELS /FILE:fichier [/LINES]');
  WriteLn;
  WriteLn(' /FILE:  Ce parametre permet d''indiquer le fichier … analyser');
  WriteLn(' /LINES  Ce parametre permet d''afficher le num‚ro de ligne');
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
    ParseLineVowels;
   End;
   Close(SourceFile);
  End
   Else
  ParseLineVowels;
 End;
END.
