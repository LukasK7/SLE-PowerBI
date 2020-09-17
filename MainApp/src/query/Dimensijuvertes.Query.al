query 70429773 "PBI Dimensiju vertes"
{

    elements
    {
        dataitem(Dimension_Value;"Dimension Value")
        {
            column(Dimension_Code;"Dimension Code")
            {
            }
            column("Code";"Code")
            {
            }
            column(Name;Name)
            {
            }
            column(Global_Dimension_No;"Global Dimension No.")
            {
                ColumnFilter = Global_Dimension_No=FILTER(>0);
            }
        }
    }
}
