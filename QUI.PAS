{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/lettrex)
  @abstract(Target: Turbo Pascal 7, Free Pascal)
}

Program QUI;

Uses Strings;

Type
 TraductionRec=Record
  OldWord,NewWord:PChar;
 End;

Const
 TraductionWord:Array[1..47]of TraductionRec=(
   (OldWord:'qui a';NewWord:'ayant'),
   (OldWord:'qui accŠde';NewWord:'acc‚dant'),
   (OldWord:'qui acc‚lŠre';NewWord:'acc‚l‚rant'),
   (OldWord:'qui affiche';NewWord:'affichant'),
   (OldWord:'qui appartient';NewWord:'appartenant'),
   (OldWord:'qui appel';NewWord:'appelant'),
   (OldWord:'qui charge';NewWord:'chargeant'),
   (OldWord:'qui clignote';NewWord:'clignotant'),
   (OldWord:'qui commence';NewWord:'commen‡ant'),
   (OldWord:'qui contient';NewWord:'contenant'),
   (OldWord:'qui contr“le';NewWord:'contr“lant'),
   (OldWord:'qui correspond';NewWord:'correspondant'),
   (OldWord:'qui demande';NewWord:'demandant'),
   (OldWord:'qui d‚place';NewWord:'d‚pla‡ant'),
   (OldWord:'qui d‚termine';NewWord:'d‚terminant'),
   (OldWord:'qui d‚veloppe';NewWord:'d‚veloppant'),
   (OldWord:'qui divise';NewWord:'divisant'),
   (OldWord:'qui dure';NewWord:'durant'),
   (OldWord:'qui effectue';NewWord:'effectuant'),
   (OldWord:'qui est';NewWord:'‚tant'),
   (OldWord:'qui existe';NewWord:'existant'),
   (OldWord:'qui fabrique';NewWord:'fabriquant'),
   (OldWord:'qui fait';NewWord:'faisant'),
   (OldWord:'qui figure';NewWord:'figurant'),
   (OldWord:'qui implique';NewWord:'impliquant'),
   (OldWord:'qui indique';NewWord:'indiquant'),
   (OldWord:'qui lit';NewWord:'lisant'),
   (OldWord:'qui modifie';NewWord:'modifiant'),
   (OldWord:'qui offre';NewWord:'offrant'),
   (OldWord:'qui passe';NewWord:'passant'),
   (OldWord:'qui permet';NewWord:'permettant'),
   (OldWord:'qui peut';NewWord:'pouvant'),
   (OldWord:'qui pointe';NewWord:'pointant'),
   (OldWord:'qui prend';NewWord:'prenant'),
   (OldWord:'qui produise';NewWord:'produisant'),
   (OldWord:'qui remplisse';NewWord:'remplissant'),
   (OldWord:'qui repr‚sente';NewWord:'repr‚sentant'),
   (OldWord:'qui reste';NewWord:'restant'),
   (OldWord:'qui r‚sulte';NewWord:'r‚sultant'),
   (OldWord:'qui signale';NewWord:'signalant'),
   (OldWord:'qui signifie';NewWord:'signifiant'),
   (OldWord:'qui suit';NewWord:'suivant'),
   (OldWord:'qui transmet';NewWord:'transmettant'),
   (OldWord:'qui travaille';NewWord:'travaillant'),
   (OldWord:'qui utilise';NewWord:'utilisant'),
   (OldWord:'qui va';NewWord:'allant'),
   (OldWord:'qui vient';NewWord:'venant')
 );

Var
 BeginWord,I,J:Integer;
 FoundMultiWord:Boolean;
 SourceFile:Text;
 FileName,CurrLine,CurrWord:String;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in ['‚','ˆ','Š',#232,#233,#234]Then S[I]:='E' Else
  If S[I] in ['…','ƒ',#224,#226]Then S[I]:='A'Else
  IF S[I] in ['“',#244]Then S[I]:='O'Else
  If S[I] in ['‡',#231]Then S[I]:='C' Else
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

Function IsLetter(Chr:Char):Boolean;Begin
 IsLetter:=Chr in ['A'..'Z','a'..'z','‚','ˆ','Š','…','ƒ','“','‡'];
End;

Function IsMAJ(Chr:Char):Boolean;Begin
 IsMAJ:=Chr in ['A'..'Z'];
End;

Function TranslateWord:Boolean;
Var
 FoundWord,SkipWord:Boolean;
Begin
 FoundWord:=False;
 For J:=Low(TraductionWord) to High(TraductionWord) do Begin
  If StrToUpper(StrPas(TraductionWord[J].OldWord))=StrToUpper(CurrWord)Then Begin
   FoundWord:=True;
   If(BeginWord=1)or(IsMAJ(CurrWord[1]))Then Begin
    Write(StrToUpper(Copy(StrPas(TraductionWord[J].NewWord),1,1)),
                     Copy(StrPas(TraductionWord[J].NewWord),2,255));
   End
    Else
   Write(StrPas(TraductionWord[J].NewWord));
   Break;
  End;
 End;
 If Not(FoundWord)Then Begin
  Write(CurrWord);
 End;
 TranslateWord:=FoundWord;
End;

Procedure ParseLine;Begin
 CurrWord:='';
 BeginWord:=1;
 For I:=1 to Length(CurrLine)do Begin
  If(IsLetter(CurrLine[I]))Then CurrWord:=CurrWord+CurrLine[I]
   Else
  Begin
   FoundMultiWord:=False;
   For J:=Low(TraductionWord) to High(TraductionWord) do Begin
    If(StrLen(TraductionWord[J].OldWord)>Length(CurrWord))and
      (StrToUpper(StrPas(TraductionWord[J].OldWord))=
      StrToUpper(Copy(CurrLine,BeginWord,StrLen(TraductionWord[J].OldWord))))Then Begin
     FoundMultiWord:=True;
     Break;
    End;
   End;
   If(FoundMultiWord)Then Begin
    CurrWord:=CurrWord+CurrLine[I]
   End
    Else
   Begin
    TranslateWord;
    Write(CurrLine[I]);
    CurrWord:='';
    BeginWord:=I+1;
   End;
  End;
 End;
 TranslateWord;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')Then Begin
  WriteLn('QUI : Cette commande permet de remplacer '+
                   'un mot QUI par un participe pr‚sent.');
  WriteLn;
  WriteLn('Syntaxe : QUI "message"');
  WriteLn('          QUI /FILE:fichier');
 End
  Else
 If ParamCount>0Then Begin
  FileName:='';
  CurrLine:='';
  For I:=1 to ParamCount do Begin
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
    ReadLn(SourceFile,CurrLine);
    ParseLine;
    WriteLn;
   End;
   Close(SourceFile);
  End
   Else
  ParseLine;
 End;
END.
