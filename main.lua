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
	},
};

watch = obj
{
	nam = "Watch",
	inv = function(s)
		if here() == hotelRoom then --hotelBathroom
			return 'You have nearly eight hours to go.';
		elseif here() == courtyard then
			return 'You have seven and a half hours to go.';
		elseif here() == street then
			return 'You have seven hours to go.';
		elseif here() == mrsVelmaODellHouse then
			return 'You have six and a half hours to go.'
		elseif here() == subway then
			return 'You have five hours to go.'
		elseif here() == manhassetStation then --taxi
			return 'You have four and a half hours to go.'
		elseif here() == countryRoad then --concreteHighway
			return 'You have four hours to go.'
		elseif here() == janiceMorrowCar then
			return 'You have three hours to go.'
		elseif here() == inhabitantZone then
			return 'You have nearly two hours to go.'
		elseif here() == church then
			return 'You have one hour to go.'
		elseif here() == graveyard then --openGrave
			return  'You have few minutes to go.'
		end
	end,
}

hotelRoom = room
{
	nam = 'Hotel Room',
	dsc = [[]],
	obj =
	{
		vway("wayToBathroom", "Go to {bathroom}.", 'hotelBathroom')
	}
}

hotelBathroom = room
{
	nam = 'Hotel Bathroom',
	dsc = [[]],
	obj =
	{
		vway("wayToCourtyard", "Go to {courtyard}.", 'courtyard')
	},
}

courtyard = room
{
	nam = 'Courtyard',
	dsc = [[]],
	obj =
	{
		vway("wayToStreet", "Go to {street}.", 'street')
	}
}

street = room
{
	nam = '63rd Street',
	dsc = [[]],
	obj =
	{
		vway("wayToMrsVelmaODellHouse", "Go to {Mrs. Velma O'Dell house}.", 'mrsVelmaODellHouse')
	}
}

mrsVelmaODellHouse = room
{
	nam = "Mrs. Velma O'Dell house",
	dsc = [[]],
	obj =
	{
		vway("wayToSubway", "Go to {Subway}.", 'subway')
	}
}

subway = room
{
	nam = "Subway",
	dsc = [[]],
	obj =
	{
		vway("wayToSubwayFlashback", "Go to {Subway Flashback}.", 'subwayFlashback')
	}
}

subwayFlashback = room
{
	nam = "Subway Flashback",
	dsc = [[]],
	obj =
	{
		vway("wayToManhassetStation", "Go to {Manhasset station}.", 'manhassetStation')
	}
}

manhassetStation = room
{
	nam = "Manhasset station",
	dsc = [[]],
	obj =
	{
		vway("wayToTaxi", "Go to {taxi}.", 'taxi')
	}
}

taxi = room
{
	nam = "Taxi",
	dsc = [[]],
	obj =
	{
		vway("wayToCountryRoad", "Go to {country road}.", 'countryRoad')
	}
}

countryRoad = room
{
	nam = "Country Road",
	dsc = [[]],
	obj =
	{
		vway("wayToConcreteHighway", "Go to {Concrete Highway}.", 'concreteHighway')
	}
}

concreteHighway = room
{
	nam = "Concrete Highway",
	dsc = [[]],
	obj =
	{
		vway("wayToJaniceMorrowCar", "Go to {Janice Morrow car}.", 'janiceMorrowCar')
	}
}

janiceMorrowCar = room
{
	nam = "Janice Morrow car",
	dsc = [[]],
	obj =
	{
		vway("wayToInhabitantZone", "Go to {Inhabitant Zone}.", 'inhabitantZone')
	}
}

inhabitantZone = room
{
	nam = "Inhabitant Zone",
	dsc = [[]],
	obj =
	{
		vway("wayToInhabitantZoneFlashback", "Go to {Inhabitant Zone Flashback}.", 'inhabitantZoneFlashback')
	}
}

inhabitantZoneFlashback = room
{
	nam = "Inhabitant Zone Flashback",
	dsc = [[]],
	obj =
	{
		vway("wayToChurch", "Go to {church}.", 'church')
	}
}

church = room
{
	nam = "Church",
	dsc = [[]],
	obj =
	{
		vway("wayToGraveyard", "Go to {graveyard}.", 'graveyard')
	}
}

graveyard = room
{
	nam = "Graveyard",
	dsc = [[]],
	obj =
	{
		vway("wayToOpenGrave", "Go to {open grave}.", 'openGrave')
	}
}

openGrave = room
{
	nam = "Open Grave",
	dsc = [[]]
}
