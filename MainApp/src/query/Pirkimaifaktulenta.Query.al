query 70429771 "PBI Pirkimai faktu lenta"
{

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Entry Type" = CONST(Purchase);
            column(Entry_No; "Entry No.")
            {
            }
            column(Item_No; "Item No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Source_No; "Source No.")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(Open; Open)
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(External_Document_No; "External Document No.")
            {
            }
            column(Cost_Amount_Actual; "Cost Amount (Actual)")
            {
            }
        }
    }
}
