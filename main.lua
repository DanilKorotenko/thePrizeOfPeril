-- $Name:The Prize of Peril$
-- $Version:1.0.0$

instead_version "1.3.0"

game.act = 'Action is undefined.';
game.inv = "Inventory is undefined";
game.use = 'Use is undefined';

main = room 
{
	nam = 'The Prize of Peril',
	dsc = "This game is based on Robert Shekley novell."..[[^^
	Implementation: Danil Korotenko (danil.korotenko@gmail.com).]],
	obj = { vway("next", "Click {here} to play.", 'hotel_room') }
};

hotel_room = room 
{
	nam = 'Hotel Room',
	dsc = [[]],
}

hotel_bathroom = room 
{
	nam = 'Hotel Bathroom',
	dsc = [[]]
}

courtyard = room 
{
	nam = 'Courtyard',
	dsc = [[]]
}

street = room 
{
	nam = '63rd Street',
	dsc = [[]]
}

mrs_velma_o_dell_house = room 
{
	nam = "Mrs. Velma O'Dell house",
	dsc = [[]]
}

subway = room 
{
	nam = "Subway",
	dsc = [[]]
}

subway_flashback = room 
{
	nam = "Subway Flashback",
	dsc = [[]]
}

manhasset_station = room 
{
	nam = "Manhasset station",
	dsc = [[]]
}

manhasset_station = room 
{
	nam = "Manhasset station",
	dsc = [[]]
}

taxi = room 
{
	nam = "Taxi",
	dsc = [[]]
}

country_road = room 
{
	nam = "Country Road",
	dsc = [[]]
}

concrete_highway = room 
{
	nam = "Concrete Highway",
	dsc = [[]]
}

janice_morrow_car = room 
{
	nam = "Janice Morrow car",
	dsc = [[]]
}

inhabitant_zone = room 
{
	nam = "Inhabitant Zone",
	dsc = [[]]
}

inhabitant_zone_flashback = room 
{
	nam = "Inhabitant Zone Flashback",
	dsc = [[]]
}

church = room 
{
	nam = "Church",
	dsc = [[]]
}

graveyard = room 
{
	nam = "Graveyard",
	dsc = [[]]
}

open_grave = room 
{
	nam = "Open Grave",
	dsc = [[]]
}
