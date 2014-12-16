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
	obj = 
	{ 
		vway("next", "Click {here} to play.", 'hotelRoom') 
	}
};

hotelRoom = room 
{
	nam = 'Hotel Room',
	dsc = [[]],
}

hotelBathroom = room 
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

mrsVelmaODellHouse = room 
{
	nam = "Mrs. Velma O'Dell house",
	dsc = [[]]
}

subway = room 
{
	nam = "Subway",
	dsc = [[]]
}

subwayFlashback = room 
{
	nam = "Subway Flashback",
	dsc = [[]]
}

manhassetStation = room 
{
	nam = "Manhasset station",
	dsc = [[]]
}

taxi = room 
{
	nam = "Taxi",
	dsc = [[]]
}

countryRoad = room 
{
	nam = "Country Road",
	dsc = [[]]
}

concreteHighway = room 
{
	nam = "Concrete Highway",
	dsc = [[]]
}

janiceMorrowCar = room 
{
	nam = "Janice Morrow car",
	dsc = [[]]
}

inhabitantZone = room 
{
	nam = "Inhabitant Zone",
	dsc = [[]]
}

inhabitantZoneFlashback = room 
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

openGrave = room 
{
	nam = "Open Grave",
	dsc = [[]]
}
