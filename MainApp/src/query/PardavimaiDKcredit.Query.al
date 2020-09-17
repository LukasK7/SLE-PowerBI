query 70429757 "PBI Pardavimai DK credit"
{
    // NUOMA16 SBU-2257 AS190920 - removed 'Posting Date' filter on DataItem


    elements
    {
        dataitem(Sales_Cr_Memo_Line; "Sales Cr.Memo Line")
        {
            DataItemTableFilter = Type = CONST("G/L Account");
            column(Item_No; "No.")
            {
            }
            column(Source_No; "Sell-to Customer No.")
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
            column(Amount; Amount)
            {
            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(Line_Discount_Amount; "Line Discount Amount")
            {
            }
            column(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
            {
            }
            column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
            {
            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {
            }
            dataitem(Sales_Cr_Memo_Header; "Sales Cr.Memo Header")
            {
                DataItemLink = "No." = Sales_Cr_Memo_Line."Document No.";
                SqlJoinType = InnerJoin;
                column(Posting_Date; "Posting Date")
                {
                }
                column(External_Document_No; "External Document No.")
                {
                }
                column(Salesperson_Code; "Salesperson Code")
                {
                }
            }
        }
    }
}