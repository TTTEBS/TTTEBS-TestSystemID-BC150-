report 50100 TestReport
{
    UsageCategory = Lists;
    ApplicationArea = All;
    ProcessingOnly = true;

    trigger OnPostReport()
    begin
        c_TestSystemID.Run();
    end;

    var
        c_TestSystemID: Codeunit "TTT-TestSystemID";
}