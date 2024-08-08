pageextension 50223 CustomerCardExt extends "Customer Card"
{
    layout
    {
        modify(Name)
        {
            CaptionClass = '1,5,,' + WordCount;

            trigger OnAfterValidate()
            begin
                GetWordCount();
            end;
        }
    }

    var
        WordCount: Text;

    trigger OnAfterGetRecord()
    begin
        GetWordCount();
    end;

    local procedure GetWordCount()
    var
        Length: Integer;
        MaxLength: Integer;
    begin
        Length := StrLen(Rec.Name);
        MaxLength := MaxStrLen(Rec.Name);
        WordCount := Rec.FieldCaption(Name) + ' (' + Format(Length) + '/' + Format(MaxLength) + ')';
    end;
}
