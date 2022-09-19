##################################################################################
# NETWORKING
##################################################################################

### ROUTE TABLE ASSOCIATIN

### Publics subnets
resource "aws_route_table_association" "pub1_rta" {
    # The subnet id to create an association
    subnet_id = aws_subnet.pubsubnet1.id

    # The id of the routine table to associathe with
    route_table_id = aws_route_table.pubrt.id
}

resource "aws_route_table_association" "pub2_rta" {
    # The subnet id to create an association
    subnet_id = aws_subnet.pubsubnet2.id

    # The id of the routine table to associathe with
    route_table_id = aws_route_table.pubrt.id
}

### Private subnets

resource "aws_route_table_association" "prv1_rta" {
    # The subnet id to create an association
    subnet_id = aws_subnet.prvsubnet1.id

    # The id of the routine table to associathe with
    route_table_id = aws_route_table.prvrt1
}

resource "aws_route_table_association" "prv2_rta" {
    # The subnet id to create an association
    subnet_id = aws_subnet.prvsubnet2.id

    # The id of the routine table to associathe with
    route_table_id = aws_route_table.prvrt2
}