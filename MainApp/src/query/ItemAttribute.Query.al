query 70429752 "PBI Item Attribute"
{

    elements
    {
        dataitem(Item_Attribute_Value_Mapping; "Item Attribute Value Mapping")
        {
            DataItemTableFilter = "Table ID" = CONST(27);
            column(No; "No.")
            {
            }
            dataitem(Item_Attribute_Value; "Item Attribute Value")
            {
                DataItemLink = ID = Item_Attribute_Value_Mapping."Item Attribute Value ID";
                SqlJoinType = LeftOuterJoin;
                column(Attribute; "Attribute Name")
                {
                }
                column(Attribute_value; Value)
                {
                }
            }
        }
    }
}
