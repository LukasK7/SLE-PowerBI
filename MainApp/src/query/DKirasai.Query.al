query 70429760 "PBI DK irasai"
{

    elements
    {
        dataitem(G_L_Account; "G/L Account")
        {
            column(No; "No.")
            {
            }
            column(Account_Category; "Account Category")
            {
            }
            column(Name; Name)
            {
            }
            dataitem(G_L_Entry; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = G_L_Account."No.";
                SqlJoinType = InnerJoin;
                column(Posting_Date; "Posting Date")
                {
                }
                column(Document_No; "Document No.")
                {
                }
                column(Posting_time; "Posting Date")
                {
                }
                // column(AM_Employee_No; "AM Employee No.")
                // {
                // }
                column(External_Document_No; "External Document No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Amount; Amount)
                {
                }
                column(Debit_Amount; "Debit Amount")
                {
                }
                column(Credit_Amount; "Credit Amount")
                {
                }
                column(Business_Unit_Code; "Business Unit Code")
                {
                }
                column(Gen_Posting_Type; "Gen. Posting Type")
                {
                }
                column(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
                {
                }
                column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
                {
                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Dimension_Set_ID; "Dimension Set ID")
                {
                }
                column(Source_No; "Source No.")
                {
                }
                dataitem(General_Ledger_Setup; "General Ledger Setup")
                {
                    DataItemLink = "Primary Key" = G_L_Account."No. 2";
                    SqlJoinType = LeftOuterJoin;
                    dataitem(Dim3; "Dimension Set Entry")
                    {
                        DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                        "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 3 Code";
                        column(Shortcut_Dimension_3_Code; "Dimension Value Code")
                        {
                        }
                        dataitem(Dim4; "Dimension Set Entry")
                        {
                            DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                            "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 4 Code";
                            column(Shortcut_Dimension_4_Code; "Dimension Value Code")
                            {
                            }
                            dataitem(Dim5; "Dimension Set Entry")
                            {
                                DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                                "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 5 Code";
                                column(Shortcut_Dimension_5_Code; "Dimension Value Code")
                                {
                                }
                                dataitem(Dim6; "Dimension Set Entry")
                                {
                                    DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                                    "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 6 Code";
                                    column(Shortcut_Dimension_6_Code; "Dimension Value Code")
                                    {
                                    }
                                    dataitem(Dim7; "Dimension Set Entry")
                                    {
                                        DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                                        "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 7 Code";
                                        column(Shortcut_Dimension_7_Code; "Dimension Value Code")
                                        {
                                        }
                                        dataitem(dim8; "Dimension Set Entry")
                                        {
                                            DataItemLink = "Dimension Set ID" = G_L_Entry."Dimension Set ID",
                                            "Dimension Code" = General_Ledger_Setup."Shortcut Dimension 8 Code";
                                            column(Shortcut_Dimension_8_Code; "Dimension Value Code")
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
