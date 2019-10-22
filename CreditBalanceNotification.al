pageextension 50112 CreditBalanceNotification extends "Sales Order"
{

    trigger OnOpenPage()
    var
        Customer: Record Customer;
        CreditBalanceNotification: Notification;
        OpenCustomer: Text;
        Text003: TextConst ENU = 'The current balance exceeds the credit limit.';
        Text004: TextConst ENU = 'Change credit limit';
        i : Integer;
    begin
        i := 1;
        Customer.GET("Sell-to Customer No.");
        if Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" then begin
            CreditBalanceNotification.MESSAGE(Text003);
            CreditBalanceNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
            CreditBalanceNotification.SETDATA('CustNumber', Customer."No.");
            CreditBalanceNotification.ADDACTION(Text004, CODEUNIT::"ActionHandler", 'OpenCustomer');
            CreditBalanceNotification.SEND;
        end;
    end;
}