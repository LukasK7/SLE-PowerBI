query 70429755 "PBI Pardavimai VE"
{
    // NUOMA16 SBU-2257 AS190920 - removed 'Posting Date' filter on DataItem


    elements
    {
        dataitem(Value_Entry; "Value Entry")
        {
            DataItemTableFilter = "Item Ledger Entry Type" = CONST(Sale),
            "Document Type" = FILTER("Sales Credit Memo" | "Sales Invoice");
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
            column(Quantity; "Invoiced Quantity")
            {
            }
            column(Amount; "Sales Amount (Actual)")
            {
            }
            column(Salesperson_Code; "Salespers./Purch. Code")
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(Cost_Amount_Actual; "Cost Amount (Actual)")
            {
            }
            column(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
            {
            }
            column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
            {
            }
            column(External_Document_No; "External Document No.")
            {
            }
            column(Document_Type; "Document Type")
            {
            }
            column(Discount_Amount; "Discount Amount")
            {
            }
        }
    }
}
