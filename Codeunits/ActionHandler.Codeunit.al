codeunit 50112 ActionHandler
{

    procedure OpenCustomer(CreditBalanceNotification: Notification)
    var
        CustNumber: Text;
        CustNo: Text;
        CustRec: Record Customer;
        CustPage: Page "Customer Card";
    begin
        CustNo := CreditBalanceNotification.GETDATA(CustNumber);
        if CustRec.GET(CustNo) then begin
            CustPage.SETRECORD(CustRec);
            CustPage.RUN;
        end else begin
            ERROR('Could not find Customer: ' + CustNo);
        end;
    end;
}