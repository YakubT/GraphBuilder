unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus,Math;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Shape1: TShape;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SaveDialog1: TSaveDialog;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    N7: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ColorDialog1: TColorDialog;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Button2: TButton;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    N14: TMenuItem;
    N15: TMenuItem;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Edit3: TEdit;
    N16: TMenuItem;
    N17: TMenuItem;
    Timer1: TTimer;
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  rebro = class
  public
  a,b:word;
  len:longint;
end;
var
   Form1: TForm1;
  resz,helps,per:boolean;
  n:word;
  pmas:array [1..300,1..2] of longint;
  matrsum:array [1..300,1..300] of word;
  matrsumor:array [1..300,1..300] of Word;
  vaga:array [1..300,1..300] of longint;
  colormas:array [1..300] of longint;
  Textversh:array [1..300] of string;
  nadpis:array[1..300] of string;
  colorrebr:array [1..300,1..300] of longint;
  osnovcvet,raz:longint;
  cvetvid:longint;
  p:array [1..400] of word;
 Nomer:Word;pfirst,psecond,startovaversh:word;
 f:text;
 wassave,showinganimation,bfsbool,dfsbool,eyler,deykstra:boolean;
 put:string;

implementation

{$R *.dfm}
function stepenvershini (num:Integer):Integer;
var i,knt:Word;
begin
knt:=0;
for i:=1 to N do
  if (matrsum[num][i]=1) then
    inc(knt);
stepenvershini:=knt;
end;
function is_sviazniy():Boolean;
var flagok:boolean;i:word;visited : array [1..300] of boolean;stack: array [0..300] of word;zapominlast: array [0..300] of word;
begin
for i:=1 to N do
  begin
  zapominlast[i]:=0;
  visited[i]:=false;
  end;
stack[0]:=1;
stack[1]:=1;
while (stack[0]>0) do
  begin
  flagok:=false;
  visited[stack[stack[0]]]:=true;
    for i:=zapominlast[stack[stack[0]]]+1 to N do
      begin
        zapominlast[stack[stack[0]]]:=i;
        if ((matrsum[stack[stack[0]]][i]=1) and (visited[i]=false)) then
          begin
          inc(stack[0]);
          stack[stack[0]]:=i;
          flagok:=true;
          break;
          end;
      end;
      if (flagok=false) then
        dec(stack[0]);
  end;
flagok:=True;
for i:=1 to N do
 if (visited[i]=False) then
  flagok:=False;
is_sviazniy:=flagok;
end;
function caneyler ():Boolean;
var i,knt:Word;
begin
if ((is_sviazniy=False) or (N=1)) then
caneyler:=False
else
begin
  knt:=0;
for i:=1 to N do
  if (stepenvershini(i) mod 2 = 1 ) then
    Inc(knt);
if (knt>2) then caneyler:=False
else
caneyler:=True;
end;
end;
procedure makerebro(i,j:word);
var rad,len,tolsh:word;ix,iy,x2,y2,xk1,yk1,xk2,yk2:longint;
begin
form1.PaintBox1.Canvas.MoveTo(pmas[i][1],pmas[i][2]);
form1.PaintBox1.Canvas.LineTo(pmas[j][1],pmas[j][2]);
rad:=10*Form1.Width div 800;
if (Form1.RadioButton2.Checked=true) then
  begin
  len:=round(sqrt((pmas[j][1]-pmas[i][1])*(pmas[j][1]-pmas[i][1])+(pmas[j][2]-pmas[i][2])*(pmas[j][2]-pmas[i][2])));
  if (len<>0) then begin
  ix:=pmas[i][1]+round((len-rad)/len*(pmas[j][1]-pmas[i][1]));
  iy:=pmas[i][2]+round((len-rad)/len*(pmas[j][2]-pmas[i][2]));
  tolsh:=3*Form1.Width div 800;
  x2:=pmas[i][1]+round((len-2*rad)/len*(pmas[j][1]-pmas[i][1]));
  y2:=pmas[i][2]+round((len-2*rad)/len*(pmas[j][2]-pmas[i][2]));
  xk1:=x2+round(tolsh/len*(pmas[i][2]-pmas[j][2]));
  yk1:=y2+round(tolsh/len*(pmas[j][1]-pmas[i][1]));
  xk2:=x2-round(tolsh/len*(pmas[i][2]-pmas[j][2]));
  yk2:=y2-round(tolsh/len*(pmas[j][1]-pmas[i][1]));
  form1.PaintBox1.Canvas.MoveTo(xk1,yk1);
  Form1.PaintBox1.Canvas.LineTo(ix,iy);
  form1.PaintBox1.Canvas.MoveTo(xk2,yk2);
  Form1.PaintBox1.Canvas.LineTo(ix,iy);
  end;

  end;
if (Form1.CheckBox1.Checked=true) then
  begin
    Form1.PaintBox1.Canvas.Brush.Color:=clwhite;
   Form1.paintbox1.Canvas.Textout((pmas[i][1]+pmas[j][1]) div 2 ,(pmas[i][2]+pmas[j][2])div 2- rad div 2, inttostr(vaga[i][j]));
  end;
end;
// автор програми Якубишин Анатолій
procedure pereresovka();
var i,j:word;rad,x,y:longint;
begin
Form1.paintbox1.Refresh();
Form1.Paintbox1.Canvas.Font.Size:=8*Form1.Width div 800;
Form1.PaintBox1.Canvas.Pen.Width:=3*Form1.Height div 450;
 //????????? ?????????
  if (resz=true) then
  For i:=1 to N do
  begin
    if (Form1.Width>800) then
    begin
    pmas[i][1]:=pmas[i][1]*Form1.Width div 800;
    pmas[i][2]:=pmas[i][2]*Form1.Width div 800;
    end
    else
    begin
    pmas[i][1]:=pmas[i][1]*Form1.Width div Screen.Width;
    pmas[i][2]:=pmas[i][2]*Form1.Width div Screen.Width;
    end;
   end;
// ????????? ?????????
    FOR I:=1 TO n DO
    for j:=1 to N do
    begin
    if (((matrsum[i][j]=1) and (Form1.RadioButton1.Checked=true)) or ((matrsumor[i][j]=1) and (Form1.RadioButton2.Checked=true)))  then
    begin
      if (showinganimation=true) then
      Form1.PaintBox1.Canvas.pen.Color:=colorrebr[i][j]
      else
        Form1.PaintBox1.Canvas.pen.Color:=clblack;
    makerebro(i,j);
    end;
    end;
    Form1.PaintBox1.Canvas.pen.Color:=clblack;
   Form1.PaintBox1.Canvas.Pen.Width:=1*Form1.Height div 450;
  if (showinganimation=false) then
  for i:=1 to N do
  begin
  Form1.paintbox1.Canvas.Brush.Color:=osnovcvet;
  if (i=pfirst) then
    Form1.paintbox1.Canvas.Brush.Color:=cvetvid;
  rad:=10*Form1.Width div 800;
  Form1.paintbox1.Canvas.Ellipse(pmas[i][1]-rad,pmas[i][2]-rad,pmas[i][1]+rad,pmas[i][2]+rad);
  Form1.paintbox1.Canvas.Textout(pmas[i][1]-rad div 2,pmas[i][2]-rad div 2-rad div 3,inttostr(i));
  end
  else
     for i:=1 to N do
  begin
  Form1.paintbox1.Canvas.Brush.Color:=colormas[i];
  rad:=10*Form1.Width div 800;
  Form1.paintbox1.Canvas.Ellipse(pmas[i][1]-rad,pmas[i][2]-rad,pmas[i][1]+rad,pmas[i][2]+rad);
  if (length(Textversh[i])<=2) then
    Form1.paintbox1.Canvas.Textout(pmas[i][1]-rad div 2,pmas[i][2]-rad div 2-rad div 3,Textversh[i])
    else
     Form1.paintbox1.Canvas.Textout((pmas[i][1]-rad div 2)-3,pmas[i][2]-rad div 2-rad div 3,Textversh[i]);
    Form1.PaintBox1.Canvas.Brush.Color:=clwhite;
   Form1.paintbox1.Canvas.Textout(pmas[i][1]+rad,pmas[i][2]-rad,nadpis[i]);

  end;

end;

procedure Delay (dwMilliseconds: Longint);
var
iStart, iStop: DWORD;
begin
 iStart := GetTickCount;
 repeat
 iStop := GetTickCount;
 Sleep(1);
 Application.ProcessMessages;
 until (iStop - iStart) >= dwMilliseconds;
end;
procedure animacia_poshiku_v_shyrinu (start:Word);
var it,i,cursor:word;visited : array [1..300] of boolean; cherga : array [0..300] of word;curcvet:longint;
begin
  curcvet:=0+50000;
  colormas[start]:=50000;
  //Form1.Menu:=nil;
  //pfirst:=start;
  pereresovka();
  for i:=1 to N do
    visited[i]:=false;
  cherga[0]:=1;
  cherga[1]:=start;
  cursor:=1;
  visited[start]:=true;
  while (cursor<=cherga[0]) do
    begin
    curcvet:=curcvet+500000;
    if ((curcvet=osnovcvet) or (curcvet=clblack)) then
      curcvet:=curcvet+500000;
    for i:=1 to N do
      if ((matrsum[cherga[cursor]][i]=1) and (visited[i]=false)) then
        begin
        inc(cherga[0]);
        cherga[cherga[0]]:=i;
        colormas[i]:=curcvet;
        visited[i]:=true;
        delay(2000);
        pereresovka();
        end;
    inc(cursor);
    end;
    Form1.Button2.Show;

end;
procedure miganie (numv:word);
begin
colormas[numv]:=cvetvid;
pereresovka();
delay(500);
colormas[numv]:=osnovcvet;
pereresovka();
delay(500);
colormas[numv]:=cvetvid;
pereresovka();
delay(1300);
end;
procedure animacia_poshuku_v_glubinu (start:word);
var flagok:boolean;i:word;visited : array [1..300] of boolean;stack: array [0..300] of word;zapominlast: array [0..300] of word;
begin
for i:=1 to N do
  begin
  zapominlast[i]:=0;
  visited[i]:=false;
  end;
stack[0]:=1;
stack[1]:=start;
while (stack[0]>0) do
  begin
  flagok:=false;
  visited[stack[stack[0]]]:=true;
  miganie(stack[stack[0]]);
    for i:=zapominlast[stack[stack[0]]]+1 to N do
      begin
        zapominlast[stack[stack[0]]]:=i;
        if ((matrsum[stack[stack[0]]][i]=1) and (visited[i]=false)) then
          begin
          inc(stack[0]);
          stack[stack[0]]:=i;
          flagok:=true;
          break;
          end;
      end;
      if (flagok=false) then
        dec(stack[0]);
  end;
Form1.Button2.Show;
end;

procedure animacia_eyler (start:word);
var flagok:boolean;i,j:word;visited:array [1..300,1..300] of boolean;stack:array [0..9000] of word;
begin
for i:=1 to N do
  colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    visited[i][j]:=false;
pereresovka();
stack[0]:=1;
stack[1]:=start;
while (stack[0]<>0) do
  begin
  miganie(stack[stack[0]]);
  flagok:=false;
  for i:=1 to N do
      if ((matrsum[stack[stack[0]]][i]=1) and (visited[stack[stack[0]]][i]=false)) then
        begin
        visited[stack[stack[0]]][i]:=true;
        visited[i][stack[stack[0]]]:=true;
        colorrebr[stack[stack[0]]][i]:=clMoneyGreen;
        colorrebr[i][stack[stack[0]]]:=clMoneyGreen;
        inc(stack[0]);
        stack[stack[0]]:=i;
        flagok:=true;
        break;
        end;
   if (flagok=false) then
   begin

    if (Form1.Label1.Caption='') then
   Form1.Label1.Caption:=inttostr(stack[stack[0]])
   else
     Form1.Label1.Caption:=Form1.Label1.Caption+'-'+inttostr(stack[stack[0]]);
    dec(stack[0]);
   end;

  end;

Form1.Button2.Show;
end;
function acikl ():boolean;
var res,flagok:boolean;i,j:word;color : array [1..300] of word;stack: array [0..300] of word;zapominlast: array [0..300] of word;
begin
res:=true;
for i:=1 to N do
  begin
  zapominlast[i]:=0;
  color[i]:=0;
  end;
  for j:=1 to N do
  begin
  if (res=false) then
    break;
  if (color[j]=0) then
    begin
    stack[0]:=1;
    stack[1]:=j;
    end;
 while (stack[0]>0) do
  begin
  if (res=false) then
  break;
  flagok:=false;
  color[stack[stack[0]]]:=1;
    for i:=zapominlast[stack[stack[0]]]+1 to N do
      begin
      if (res=false) then
      break;
        zapominlast[stack[stack[0]]]:=i;
        if ((matrsumor[stack[stack[0]]][i]=1) and (color[i]=1)) then
             res:=false;
        if ((matrsumor[stack[stack[0]]][i]=1) and (color[i]=0)) then
          begin
          inc(stack[0]);
          stack[stack[0]]:=i;
          flagok:=true;
          break;
          end;
      end;
      if (flagok=false) then
      begin
      color[stack[stack[0]]]:=2;
        dec(stack[0]);
      end;
  end;
  end;
acikl:=res;
end;
procedure topsort();
var u,kntr,i:word;stack:array[0..300] of word;visited:array[1..300] of boolean;otvet:array[1..300] of word;flagok:boolean;zapominlast: array [0..300] of word;
begin
kntr:=N;
if (acikl=false) then
  showmessage('Граф містить цикл - топопологічне сортування неможливе')
  else
  begin
  for i:=1 to N do
  begin
  zapominlast[i]:=0;
  visited[i]:=false;
  end;
  for u:=1 to N do
  begin
  if (visited[u]=false) then
    begin
    stack[0]:=1;
    stack[1]:=u;
    end;
   while (stack[0]>0) do
  begin
  flagok:=false;
  visited[stack[stack[0]]]:=true;
  miganie(stack[stack[0]]);
    for i:=zapominlast[stack[stack[0]]]+1 to N do
      begin
        zapominlast[stack[stack[0]]]:=i;
        if ((matrsumor[stack[stack[0]]][i]=1) and (visited[i]=false)) then
          begin
          inc(stack[0]);
          stack[stack[0]]:=i;
          flagok:=true;
          break;
          end;
      end;
      if (flagok=false) then
        begin
        otvet[kntr]:=stack[stack[0]];
        Textversh[stack[stack[0]]]:= Textversh[stack[stack[0]]]+'/'+inttostr(kntr);
        pereresovka();
        dec(kntr);
        dec(stack[0]);
        end;
  end;
  end;
  for u:=1 to N do
    Form1.Label1.Caption:=Form1.Label1.Caption+inttostr(otvet[u])+' ';
  end;
Form1.Button2.Show;
end;
procedure poshukmostiv();
var u,kntr,i,timer,zp:longint;stack,tin,fup,pred:array[0..300] of longint;visited:array[1..300] of boolean;otvet:array[1..300] of word;flagok:boolean;zapominlast: array [0..300] of word;
begin
timer:=0;
  for i:=1 to N do
  begin
  zapominlast[i]:=0;
  fup[i]:=30000;
  visited[i]:=false;
  end;
  for u:=1 to N do
  begin
  if (visited[u]=false) then
    begin
    stack[0]:=1;
    stack[1]:=u;
    end;
   pred[stack[1]]:=-1;
   while (stack[0]>0) do
  begin
  zp:=stack[stack[0]];
  if (visited[stack[stack[0]]]=false) then
  begin
  inc(timer);
  tin[stack[stack[0]]]:=timer;
  nadpis[stack[stack[0]]]:=inttostr(timer)+'/';
  end;
  flagok:=false;
  visited[stack[stack[0]]]:=true;
  miganie(stack[stack[0]]);
    for i:=zapominlast[stack[stack[0]]]+1 to N do
      begin
        zapominlast[stack[stack[0]]]:=i;
        if ((matrsum[stack[stack[0]]][i]=1) and (visited[i]=false)) then
          begin
          pred[i]:=zp;
          inc(stack[0]);
          stack[stack[0]]:=i;
          flagok:=true;
          break;
          end;
      end;
      if (flagok=false) then
        begin
        fup[stack[stack[0]]]:=tin[stack[stack[0]]];
        for i:=1 to N do
        begin
        if ((matrsum[stack[stack[0]]][i]=1) and (i<>pred[stack[stack[0]]])) then
        fup[stack[stack[0]]]:=min(fup[stack[stack[0]]],min(tin[i],fup[i]));
        end;
        nadpis[stack[stack[0]]]:=nadpis[stack[stack[0]]]+inttostr(fup[stack[stack[0]]]);
        if ((pred[stack[stack[0]]]<>-1) and (fup[stack[stack[0]]]=tin[stack[stack[0]]])) then
        begin
          colorrebr[stack[stack[0]]][pred[stack[stack[0]]]]:=clpurple;
          colorrebr[pred[stack[stack[0]]]][stack[stack[0]]]:=clpurple;
        end;
         colormas[stack[stack[0]]]:=clyellow;
        pereresovka();
         dec(stack[0]);
        end;
  end;
  end;
Form1.Button2.Show;
end;
procedure animacia_deykstra (start:word);
var i,j,minim:longint;masdlin:array[1..300] of longint;used:array[1..300] of boolean;
begin
for i:=1 to N do
  begin
  nadpis[i]:='inf';
  used[i]:=false;
  masdlin[i]:=1000000;
  end;
nadpis[start]:='0';
masdlin[start]:=0;
colormas[start]:=cvetvid;
pereresovka();
for i:=1 to N do
  begin
    minim:=-1;
    for j:=1 to N do
        if (used[j]=false) and ((minim=-1) or (masdlin[minim]>masdlin[j])) then
          minim:=j;
  if (minim<>-1) then
    used[minim]:=true;
  delay(1500);
  colormas[minim]:=clyellow;
  pereresovka();
  for j:=1 to N do
    if (matrsum[minim][j]=1) then
      if (masdlin[j]>masdlin[minim]+vaga[minim][j]) then
        begin
        Delay(1500);
        colormas[j]:=clgray;
        masdlin[j]:=masdlin[minim]+vaga[minim][j];
        nadpis[j]:=inttostr(masdlin[minim]+vaga[minim][j]);
        pereresovka();
        end;
  delay(1300);
  colormas[minim]:=cvetvid;
  pereresovka()
  end;
Form1.Button2.Show;
end;
function check(x,y:longint):word;
  var i,rad,nom:word;
  begin
  rad:=10*Form1.Width div 800;
  nom:=0;
  for i:=1 to N do
    begin
     if ((x-pmas[i][1])*(x-pmas[i][1])+(y-pmas[i][2])*(y-pmas[i][2])<=4*rad*rad) then
      begin
      nom:=i;
      end;
    end;
  check:=nom;
  end;
procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var rad,pnomer:word;
  begin
  if (showinganimation=False) then 
  begin
  if (Button=mbLeft) then
  begin
  Nomer:=Check(X,Y);

    if (Nomer=0) then
    begin
    inc(n);
    rad:=10*Form1.Width div 800;
    pmas[N][1]:=X;
    pmas[N][2]:=Y;
    paintbox1.Canvas.Brush.Color:=osnovcvet;
    Paintbox1.Canvas.Font.Size:=8*Form1.Width div 800;
    paintbox1.Canvas.Ellipse(X-rad,Y-rad,X+rad,Y+rad);
    paintbox1.Canvas.Textout(X-rad div 2,Y-rad div 2-rad div 3,inttostr(n));
    end;
  end;

  if (Button=mbRight) then
  begin
  pnomer:=Check(X,Y);
    if (pnomer<>0) then
    begin
    if (pnomer=pfirst) then
  begin
   rad:=10*Form1.Width div 800;
   Form1.PaintBox1.Canvas.Brush.Color:=osnovcvet;
   Form1.paintbox1.Canvas.Ellipse(pmas[pfirst][1]-rad,pmas[pfirst][2]-rad,pmas[pfirst][1]+rad,pmas[pfirst][2]+rad);
   Form1.paintbox1.Canvas.Textout(pmas[pfirst][1]-rad div 2,pmas[pfirst][2]-rad div 2-rad div 3,inttostr(pfirst));
   pfirst:=0;
  end
  else
  begin

    if (pfirst<1) then
      begin
        rad:=10*Form1.Width div 800;
        pfirst:=pnomer;
        Form1.PaintBox1.Canvas.Brush.Color:=cvetvid;
        Form1.paintbox1.Canvas.Ellipse(pmas[pfirst][1]-rad,pmas[pfirst][2]-rad,pmas[pfirst][1]+rad,pmas[pfirst][2]+rad);
        Form1.paintbox1.Canvas.Textout(pmas[pfirst][1]-rad div 2,pmas[pfirst][2]-rad div 2-rad div 3,inttostr(pfirst));
      end
      else
      begin
      matrsumor[pfirst][pnomer]:=1;
      matrsum[pfirst][pnomer]:=1;
      matrsum[pnomer][pfirst]:=1;
      pfirst:=0;
      pereresovka();

      end;

    end;
    end;
  end;
  end
  else
  begin
  if (startovaversh=0) then
    begin
    startovaversh:=check(X,Y);
    if (startovaversh<>0) then
        if (bfsbool=true) then
          animacia_poshiku_v_shyrinu(startovaversh)
          else
            if (deykstra=true) then
              animacia_deykstra(startovaversh)
              else
            IF (dfsbool=true) then
            animacia_poshuku_v_glubinu(startovaversh)
            else
              if ((colormas[startovaversh]=cvetvid) and (eyler=true)) then
                animacia_eyler(startovaversh);
    end;
  end;
end;
procedure newfile ();
var i,j:integer;
begin
wassave:=false;
put:='';
Form1.PaintBox1.Parent.DoubleBuffered:=true;
Form1.PaintBox1.Refresh;
N:=0;
resz:=false;
pfirst:=0;
psecond:=0;
for i:=1 to 300 do
for j:=1 to 300 do
begin
matrsum[i][j]:=0;
matrsumor[i][j]:=0;
vaga[i][j]:=0;
end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.DoubleBuffered:=true;
raz:=-1;
per:=false;
Form1.RadioButton1.checked:=true;
Label1.Caption:='';
startovaversh:=0;
showinganimation:=false;
bfsbool:=false;
dfsbool:=false;
eyler:=false;
Form1.SaveDialog1.InitialDir:= GetCurrentDir;
Form1.OpenDialog1.InitialDir:= GetCurrentDir;
Form1.Button2.Hide;
helps:=false;
newfile();
osnovcvet:=clgreen;
cvetvid:=clred;
end;

procedure TForm1.FormResize(Sender: TObject);
var HRect:Trect;FindHandle:HWND;WindowPlacement:TWindowPlacement;
begin

end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (showinganimation=false) then
nomer:=0;
end;
function rastoy (X1,Y1,X2,Y2:real):real;
begin
rastoy:=sqrt((X1-X2)*(X1-X2)+(Y1-Y2)*(Y1-Y2));
end;
function isnalazit (ixik,iyik:word):boolean;
var i,rad:word;
begin
  rad:=10*Form1.Width div 800;
  isnalazit:=false;
  for i:=1 to N do
  begin
  if (i<>nomer) then
  if (rastoy(pmas[i][1],pmas[i][2],ixik,iyik)<=2*rad) then
    isnalazit:=true;
  end;
end;
procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var rad:word;
  begin
  rad:=10*Form1.Width div 800;
if (showinganimation=false) then
begin
if (((nomer<>0) and (not isnalazit(X,Y))) and ((X>rad) and (X<Form1.PaintBox1.Width-rad)) and ((Y>rad) and (Y<Form1.PaintBox1.Height-rad)))  then
  begin
  pmas[nomer][1]:=X;
  pmas[nomer][2]:=Y;
  pereresovka();
  end;
end;
end;
procedure deleting (ver:word);
var i,j:longint;
begin
for i:=1 to N do
begin
  matrsum[i][ver]:=0;
  matrsumor[i][ver]:=0;
end;
  for i:=ver to N-1 do
  begin
  pmas[i][1]:=pmas[i+1][1];
  pmas[i][2]:=pmas[i+1][2];
  end;

  for  i:=ver to N-1 do
    for j:=1 to N do
      begin
       matrsum[i][j]:=matrsum[i+1][j];
       matrsumor[i][j]:=matrsumor[i+1][j]
      end;
  for i:=1 to n do
  begin
  matrsum[N][i]:=0;
  matrsumor[N][i]:=0;
  end;
  for  i:=1 to N do
    for j:=ver to N do
    begin
    matrsum[i][j]:=matrsum[i][j+1];
    matrsumor[i][j]:=matrsumor[i][j+1];
    end;
 dec(N);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (pfirst<>0) then
begin
  if (key=46) then
  begin
  deleting(pfirst);
   pfirst:=0;
  pereresovka();

  end;
end;
end;

function isnumber(s:string):boolean;
var flag:boolean;i:integer;
begin
flag:=true;
if (s='') then
  flag:=false;
for i:=1 to length(s) do
if (not ( ( ord(s[i])<=ord('9')) and  ( ord(s[i])>=ord('0')) ) ) then
flag:=false;
isnumber:=flag;
end;
procedure TForm1.Button1Click(Sender: TObject);
var num1,num2:word;
begin
if (isnumber(Edit1.Text) And isnumber(Edit2.Text)) then
  begin
  num1:=strtoint(Edit1.Text);
  num2:=strtoint(Edit2.Text);
  if ((((num1<1) and (num1>N)) or ((num2<1) and (num2>N))) or ( matrsum[num1][num2]=0))  then
   ShowMessage('Некоректні дані')
   else
   begin
  if (form1.RadioButton1.Checked=true) then
  begin
  matrsum[num1][num2]:=0;
  matrsum[num2][num1]:=0;
  matrsumor[num1][num2]:=0;
  matrsumor[num2][num1]:=0;
  end
  else
  begin
  matrsumor[num1][num2]:=0;
  if (matrsumor[num2][num1]=0) then
    begin
    matrsum[num1][num2]:=0;
    matrsum[num2][num1]:=0;
    end;
  end;

  pereresovka();
  end;
  end
  else
  ShowMessage('Некоректні дані');
Edit1.Text:='';
Edit2.Text:='';
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form1.Caption:='Новий проект';
newfile();
end;
procedure save();
var i,j:word;x,y:longint;
begin
AssignFile(f,put);
Rewrite(f);
Writeln(f,n);
For i:=1 to N do
begin
if (Form1.Width>800) then
    begin
    x:=pmas[i][1]*800 div Form1.Width;
    y:=pmas[i][2]*800 div Form1.Width;
    end;
Write(f,x);
Write(f,' ');
Writeln(f,y);
end;
for i:=1 to N do
begin
for j:=1 to N-1 do
  begin
  write(f,matrsum[i][j]);
  write(f,' ');
  end;
writeln(f,matrsum[i][N]);
end;
for i:=1 to N do
begin
for j:=1 to N-1 do
  begin
  write(f,matrsumor[i][j]);
  write(f,' ');
  end;
writeln(f,matrsumor[i][N]);
end;
for i:=1 to N do
begin
for j:=1 to N-1 do
  begin
  write(f,vaga[i][j]);
  write(f,' ');
  end;
writeln(f,vaga[i][N]);
end;
CloseFile(f);
Form1.Caption:=put;
end;
procedure TForm1.N5Click(Sender: TObject);
begin
Form1.SaveDialog1.Execute;
put:=saveDialog1.FileName;
if (put<>'') then
begin
wassave:=True;
save();
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (wassave=true) then
  save()
  else
  begin
  Form1.SaveDialog1.Execute;
  put:=saveDialog1.FileName;
  if (put<>'') then
  begin
  wassave:=True;
  save();
  end;
end;
end;
procedure open ();
var razm,i,j:word;
begin
wassave:=false;
resz:=false;
pfirst:=0;
psecond:=0;
Form1.Caption:=put;
AssignFile(f,put);
Reset(f);
Readln(f,N);
for i:=1 to 300 do
    for j:=1 to 300 do
      matrsum[i][j]:=0;
for i:=1 to N do
  begin
  read(f,pmas[i][1]);
  readln(f,pmas[i][2]);
  end;

for i:=1 to N do
begin
    for j:=1 to N-1 do
      read(f,matrsum[i][j]);
readln(f,matrsum[i][N]);
end;
for i:=1 to N do
begin
    for j:=1 to N-1 do
      read(f,matrsumor[i][j]);
readln(f,matrsumor[i][N]);
end;
for i:=1 to N do
begin
    for j:=1 to N-1 do
      read(f,vaga[i][j]);
readln(f,vaga[i][N]);
end;
if (Form1.Width<=800)  then
resz:=false
else
resz:=true;
pereresovka();
resz:=false;
Closefile(f);
end;
procedure TForm1.N3Click(Sender: TObject);
begin
OpenDialog1.Execute();
if (OpenDialog1.FileName <> '') then
  begin
  put:=OpenDialog1.FileName;
  open();
  wassave:=true;
  end;


end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form1.ColorDialog1.Execute;
osnovcvet:=Form1.ColorDialog1.Color;
pereresovka();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Form1.ColorDialog1.Execute;
cvetvid:=Form1.ColorDialog1.Color;
pereresovka();
end;

procedure TForm1.N6Click(Sender: TObject);
begin
with Application do
   begin
      MessageBox('Для виділення вершини треба натиснусти на неї правою клавішою миші. Для видалення вершини натисність на неї правою клавішою, потім натисніть delete. Для створення ребра натисність правою клавішою на вершини (кінці ребра).','Довідка', MB_OK);
   end;

end;


procedure TForm1.N11Click(Sender: TObject);
var i,j:word;
begin
if (showinganimation=false) then
begin
Form1.RadioButton1.Checked:=true;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=false;
Form1.Button1.Enabled:=False;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pfirst:=0;
pereresovka();
ShowMessage('Виберіть вершину старту');
Form1.RadioButton1.Checked:=true;
bfsbool:=true;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:word;
begin
startovaversh:=0;
Form1.CheckBox1.Enabled:=true;
showinganimation:=false;
Form1.Button1.Enabled:=true;
Form1.RadioButton1.Enabled:=true;
Form1.RadioButton2.Enabled:=true;
Form1.Button2.Hide;

for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';

pereresovka();
bfsbool:=false;
dfsbool:=false;
eyler:=false;
deykstra:=false;
Label1.Caption:='';
end;

procedure TForm1.N12Click(Sender: TObject);
var i,j:word;
begin
if (showinganimation=false) then
begin
Form1.RadioButton1.Checked:=true;
Form1.Button1.Enabled:=False;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=false;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pfirst:=0;
pereresovka();
ShowMessage('Виберіть вершину старту');
dfsbool:=true;
end;
end;
procedure find_start_eyler(var start1:longint;var start2:longint);
var i:word;
begin
for i:=1 to N do
  if ((stepenvershini(i) mod 2) = 1) then
    if (start1=-1) then
      start1:=i
    else
      start2:=i;
end;
procedure TForm1.N13Click(Sender: TObject);
var i,j,start1,start2:Longint;
begin
if (showinganimation=false) then
begin
Form1.RadioButton1.Checked:=true;
Form1.Button1.Enabled:=False;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=true;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pfirst:=0;
pereresovka();
if (caneyler()=True) then
begin
start2:=-1;
start1:=-1;
find_start_eyler(start1,start2);
if (start1=-1) then
for i:=1 to N do
  colormas[i]:=cvetvid
else
  begin
  colormas[start1]:=cvetvid;
  colormas[start2]:=cvetvid;
  end;
pereresovka();
ShowMessage('Виберіть вершину з якої розпочати алгоритм (з підсвічених)');
eyler:=true;
end
  else
  begin
  ShowMessage('Ейлерового шляху не існує');
  showinganimation:=false;
  eyler:=false;
  Form1.Button1.Enabled:=true;
  Form1.RadioButton2.Enabled:=true;
  end;



end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
pereresovka();
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
pereresovka();
end;

procedure TForm1.N14Click(Sender: TObject);
var i,j:word;
begin
  if (showinganimation=false) then
  begin
Form1.RadioButton2.Checked:=true;
Form1.Button1.Enabled:=False;
Form1.RadioButton2.SetFocus;
Form1.RadioButton1.Enabled:=false;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pfirst:=0;
pereresovka();
topsort();
  end;

end;

procedure TForm1.N15Click(Sender: TObject);
var i,j:word;
begin
  if (showinganimation=false) then
  begin
 Form1.RadioButton1.Checked:=true;
Form1.Button1.Enabled:=False;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=false;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pfirst:=0;
pereresovka();
poshukmostiv();
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
pereresovka();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if ((isnumber(Form1.Edit1.Text)=true) and ((isnumber(Form1.Edit2.Text)=true) and (isnumber(Form1.Edit3.Text)=true))) then
  begin
  if (matrsum[strtoInt(Form1.Edit1.Text)][Strtoint(Form1.Edit2.Text)]=1) then
  BEGIN
  vaga[strtoInt(Form1.Edit1.Text)][Strtoint(Form1.Edit2.Text)]:=strtoint(Form1.Edit3.Text);
  vaga[strtoint(Form1.Edit2.Text)][strtoint(Form1.Edit1.Text)]:=strtoint(Form1.Edit3.Text);
  end;
  END;
  Form1.Edit3.Text:='';
pereresovka();
end;

procedure TForm1.N16Click(Sender: TObject);
var i,j:word;
begin
 if (showinganimation=false) then
  begin
Form1.RadioButton1.Checked:=true;
Form1.CheckBox1.Checked:=true;
Form1.CheckBox1.Enabled:=false;
Form1.Button1.Enabled:=False;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=false;
showinganimation:=true;
for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
pereresovka();
ShowMessage('Виберіть вершину з якої розпочати алгоритм');
deykstra:=true;
end;
end;

function getpr (v:word):word;
begin
if (p[v]=v) then
  getpr:=v
else
  p[v]:=getpr(p[v]);
colormas[v]:=colormas[p[v]];
getpr:=p[v];
end;
procedure bsort (var mas:array of rebro;m:longint);
var i,j:word;c:rebro;
begin
c:=rebro.Create;
for i:=1 to  m do
  for j:=0 to m-2 do
    if (mas[j].len>mas[j+1].len) then
       begin
       c:=mas[j+1];
       mas[j+1]:=mas[j];
       mas[j]:=c;
       //swap(mas[j],mas[j+1]);
      end;
end;
procedure seperate (a,b:word);
var c,g:word;
begin
c:=getpr(a);
g:=getpr(b);
p[g]:=c;
end;
procedure kraskal ();
var i,j,k:word;rebr:array [1..90001] of rebro;m,col,knt:longint;fl:boolean;visited:array [1..90001] of boolean;cvet:array [1..30] of longint;
begin
  fl:=is_sviazniy();
  m:=0;
  for i:=1 to N do
    p[i]:=i;
  for i:=1 to N do
    for j:=i+1 to N do
      if (matrsum[i][j]=1) then
        begin
        inc(m);
        colorrebr[i][j]:=clSilver;
        colorrebr[j][i]:=clSilver;
        rebr[m]:=rebro.Create;
        rebr[m].a:=i;
        rebr[m].b:=j;
        rebr[m].len:=vaga[i][j];
        end;
    cvet[1]:=clyellow;
    cvet[2]:=clblue;
    cvet[3]:=clfuchsia;
    cvet[4]:=claqua;
    cvet[5]:=clolive;
    cvet[6]:=clteal;
    for i:=1 to N do
      if (i<=6) then
      colormas[i]:=cvet[i]
        ELSE
         colormas[i]:=cvet[6]+(i-6)*300000;
      pereresovka();
      knt:=0;
      bsort(rebr,m);
      delay(300);
      for i:=1 to m do
        begin

         if ((fl=true) and (knt=n-1)) then break;
         if (getpr(rebr[i].a)=getpr(rebr[i].b)) then
          begin
          delay(1000);
          visited[i]:=false;
           colorrebr[rebr[i].a][rebr[i].b]:=clred;
            colorrebr[rebr[i].b][rebr[i].a]:=clred;
           pereresovka();
           Delay(750);
           colorrebr[rebr[i].a][rebr[i].b]:=clsilver;
            colorrebr[rebr[i].b][rebr[i].a]:=clsilver;
           pereresovka();
           Delay(750);
           colorrebr[rebr[i].a][rebr[i].b]:=clred;
            colorrebr[rebr[i].b][rebr[i].a]:=clred;
           pereresovka();
           Delay(750);
           colorrebr[rebr[i].a][rebr[i].b]:=clsilver;
            colorrebr[rebr[i].b][rebr[i].a]:=clsilver;
           pereresovka();
          end
          else
          begin
          inc(knt);
          visited[i]:=true;
          Delay(2000);
            seperate(rebr[i].a,rebr[i].b);
          for j:=1 to n do
            getpr(j);
          //colorrebr[rebr[i].a][rebr[i].b]:=clblack;
           //colorrebr[rebr[i].b][rebr[i].a]:=clblack;
           for j:=1 to i do
            if (visited[j]=true) then
              begin
                colorrebr[rebr[j].a][rebr[j].b]:=colormas[rebr[j].a];
                colorrebr[rebr[j].b][rebr[j].a]:=colormas[rebr[j].a];
              end;
          pereresovka();
        end;
      end;
      Form1.Button2.Show;
end;
procedure TForm1.N17Click(Sender: TObject);
var i,j:word;
begin
 if (showinganimation=false) then
  begin
  Form1.CheckBox1.Checked:=true;
Form1.CheckBox1.Enabled:=false;
 for i:=1 to N do
    colormas[i]:=osnovcvet;
for i:=1 to N do
  for j:=1 to N do
    colorrebr[i][j]:=clblack;
for i:=1 to N do
  Textversh[i]:=inttostr(i);
for i:=1 to N do
  nadpis[i]:='';
  
Form1.RadioButton1.Checked:=true;
Form1.Button1.Enabled:=False;
Form1.RadioButton1.SetFocus;
Form1.RadioButton2.Enabled:=false;
showinganimation:=true;
kraskal();
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var HRect:Trect;FindHandle:HWND;WindowPlacement:TWindowPlacement;
begin
GetwindowRect(FindHandle,Hrect);
if ((raz<>-1) and (HRECt.Left+Hrect.Top+Hrect.Right+Hrect.Bottom>180))  then
begin

//Getwindowplacement(Findhandle,@WindowPlacement);
if (raz <> Form1.Width) then
resz:=true;
if (resz=true) then
begin
Form1.PaintBox1.Width:=640*Form1.Width div 800;
Form1.PaintBox1.Height:=360*Form1.Height div 450;
Form1.Shape1.Width:=657*Form1.Width div 800;
Form1.Shape1.Height:=377*Form1.Height div 450;
Form1.PaintBox1.Left:=24*Form1.Width div 800;
Form1.PaintBox1.Top:=16*Form1.Height div 450;
Form1.Shape1.Left:=16*Form1.Width div 800;
Form1.Shape1.Top:=8*Form1.Height div 450;

Form1.Edit1.Width:=81*Form1.Width div 800;
Form1.Edit1.Height:=21*Form1.Height div 450;
Form1.Edit1.Left:=680*Form1.Width div 800;
Form1.Edit1.Top:=184*Form1.Height div 450;
Form1.Edit2.Width:=81*Form1.Width div 800;
Form1.Edit2.Height:=21*Form1.Height div 450;
Form1.Edit2.Left:=680*Form1.Width div 800;
Form1.Edit2.Top:=216*Form1.Height div 450;

Form1.Edit3.Width:=81*Form1.Width div 800;
Form1.Edit3.Height:=21*Form1.Height div 450;
Form1.Edit3.Left:=680*Form1.Width div 800;
Form1.Edit3.Top:=276*Form1.Height div 450;

Form1.Button1.Width:=97*form1.Width div 800;
Form1.Button1.Height:=25*form1.Height div 450;
Form1.Button1.Top:=247*form1.Height div 450;
Form1.Button1.Left:=680*form1.Width div 800;

Form1.Button3.Width:=97*form1.Width div 800;
Form1.Button3.Height:=25*form1.Height div 450;
Form1.Button3.Top:=300*form1.Height div 450;
Form1.Button3.Left:=680*form1.Width div 800;

Form1.StaticText1.Width:=80*form1.Width div 800;
Form1.StaticText1.Height:=20*form1.Height div 450;
Form1.StaticText1.Top:=160*form1.Height div 450;
Form1.StaticText1.Left:=680*form1.Width div 800;
Form1.Edit1.Font.Size:=8*Form1.Width div 450;
Form1.Edit2.Font.Size:=8*Form1.Width div 450;
Form1.Edit3.Font.Size:=6*Form1.Width div 450;

Form1.Button2.Width:=97*form1.Width div 800;
Form1.Button2.Height:=65*form1.Height div 450;
Form1.Button2.Top:=330*form1.Height div 450;
Form1.Button2.Left:=680*form1.Width div 800;

Form1.Label1.Width:=625*Form1.Width div 800;
Form1.Label1.Height:=33*Form1.Height div 450;
Form1.Label1.Top:=328*Form1.Height div 450;
Form1.Label1.Left:=32*form1.Width div 800;
Form1.Label1.Font.Size:=12*Form1.Width div 450;

Form1.RadioButton1.Width:=97*Form1.Width div 800;
Form1.RadioButton1.Height:=17*Form1.Height div 450;
Form1.RadioButton1.Left:=680*Form1.Width div 800;
Form1.RadioButton1.Top:=104*Form1.Height div 450;
Form1.RadioButton1.Font.Size:=8*Form1.Height div 450;

Form1.RadioButton2.Width:=97*Form1.Width div 800;
Form1.RadioButton2.Height:=17*Form1.Height div 450;
Form1.RadioButton2.Left:=680*Form1.Width div 800;
Form1.RadioButton2.Top:=128*Form1.Height div 450;
Form1.RadioButton2.Font.Size:=8*Form1.Height div 450;

Form1.CheckBox1.Width:=97*Form1.Width div 800;
Form1.CheckBox1.Height:=17*Form1.Height div 450;
Form1.CheckBox1.Left:=680*Form1.Width div 800;
Form1.CheckBox1.Top:=80*Form1.Height div 450;
Form1.CheckBox1.Font.Size:=8*Form1.Height div 450;
end;
Form1.AlphaBlend:=true;
pereresovka();
resz:=false;
end;
if (HRECt.Left+Hrect.Top+Hrect.Right+Hrect.Bottom>180) then
  BEGIN
  raz:=Form1.Width;
  per:=true;
  END
  else per:=false;
end;

end.



