program wpack;

uses Classes, FileUtil, bufstream, sysutils;

{
;; header
;; name (255)
;; size (string in base10) (14)
;; mtime (12)
;; prefix (4096)
}

function RelativeDir(Base: String; Path: String): String;
begin
  if Base = Path then Result := ''
  else Result := ExtractRelativePath(Base, Path);
end;

procedure WritePadded(S: String; Len: Integer; O: TStream);
var
  I: Integer;
begin
  Dec(Len, Length(S));
  o.WriteBuffer(S[1], Length(S));
  for I := 0 to Len-1 do
    O.WriteByte(0);
end;

var
  O: TBufferedFileStream;
  Input: TFileStream;
  S: String;
  I: Integer;
begin
  O := TBufferedFileStream.Create(ParamStr(2), fmCreate);
  for S in FindAllFiles(ParamStr(1)) do begin
    writeln('Processing ', ExtractFileName(S), ' ', RelativeDir(ParamStr(1), ExtractFileDir(S)));
    Input := TFileStream.Create(S, fmOpenRead);

    WritePadded(ExtractFileName(S), 255, O);
    WritePadded(IntToStr(Input.Size), 14, O);
    for I := 0 to 12-1 do O.WriteByte(0);
    WritePadded(RelativeDir(ParamStr(1), ExtractFileDir(S)), 4096, O);

    O.CopyFrom(Input, Input.Size);

    Input.Free;
  end;
  for I := 0 to 4377-1 do O.WriteByte(0);
  O.Free;
end.

