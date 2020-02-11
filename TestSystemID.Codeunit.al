codeunit 50100 "TTT-TestSystemID"
{
    trigger OnRun()
    var
        lr_Cust: Record Customer;
        lr_Item: Record Item;
        lr_SL: Record "Sales Line";
    begin
        // ShowSystemIDNo();
        // message(GetSIDCode20(18, 1, '10000'));

        // lr_Cust.get('10000');
        // GetSIDWithRecID(18, lr_Cust.RecordId);
        // lr_Cust.get('20000');
        // GetSIDWithRecID(18, lr_Cust.RecordId);
        lr_Item.get('1896-S');
        GetSIDWithRecID(27, lr_Item.RecordId);
        lr_Item.get('1000');
        GetSIDWithRecID(27, lr_Item.RecordId);
        lr_Item.get('1001');
        GetSIDWithRecID(27, lr_Item.RecordId);

        // lr_SL.get(lr_SL."Document Type"::Order, '101001', 10000);
        // GetSIDWithRecID(37, lr_SL.RecordId);
    end;

    local procedure ShowSystemIDNo()
    var
        lr_RR: Recordref;
        lv_FilterFR01: FieldRef;
        lv_FR01: FieldRef;
        lv_FR02: FieldRef;
        lv_SystemIdFieldNo: Integer;
        Text000: Label 'SystemID = %1\No. = %2';
    begin
        lr_RR.OPEN(DATABASE::Customer);

        lv_FilterFR01 := lr_RR.Field(1);
        lv_FilterFR01.SetRange(10000);
        if lr_RR.FindFirst() then begin
            lv_FR01 := lr_RR.Field(1);
            lv_SystemIdFieldNo := lr_RR.SystemIdNo();
            lv_FR02 := lr_RR.Field(lv_SystemIdFieldNo);
        end;
        Message(Text000, Format(lv_FR02), format(lv_FR01));
    end;

    procedure GetSIDCode20(pTableID: Integer; pFieldNo: Integer; pCode20: Code[20]): Guid;
    var
        lr_RR: Recordref;
        lv_FilterFR01: FieldRef;
        lv_FR01: FieldRef;
        lv_SystemIdFieldNo: Integer;
    begin
        lr_RR.OPEN(pTableID);
        lv_FilterFR01 := lr_RR.Field(pFieldNo);
        lv_FilterFR01.SetRange(pCode20);
        if lr_RR.FindFirst() then begin
            exit(format(lr_RR.Field(lr_RR.SystemIdNo())));
        end;
    end;

    procedure GetSIDWithRecID(pTableID: Integer; pRecID: RecordId): Guid;
    var
        lr_RR: Recordref;
        lv_FilterFR01: FieldRef;
        lv_FR01: FieldRef;
        lv_SystemIdFieldNo: Integer;
    begin
        // message(format(pRecID));
        lr_RR := pRecID.GetRecord();
        // if lr_RR.FindFirst() then
        if lr_RR.FindLast() then
            Message('RecID = %1\SID = %2', format(pRecID), format(lr_RR.Field(lr_RR.SystemIdNo())));


        // lr_RR.OPEN(pTableID);
        // lv_FilterFR01 := lr_RR.Field(pFieldNo);
        // lv_FilterFR01.SetRange(pNo);
        // if lr_RR.FindFirst() then
        //     exit(format(lr_RR.Field(lr_RR.SystemIdNo())));
    end;

}