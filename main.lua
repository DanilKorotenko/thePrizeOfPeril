-- $Name:The Prize of Peril$
-- $Version:1.0.0$

instead_version "1.3.0"

game.act = 'Action is undefined.';
game.inv = "Inventory is undefined";
game.use = 'Use is undefined';

main = room 
{
	nam = 'The Prize of Peril',
--	act = function() -- only one vobj, no check, just goto
--		goto('location');
--	end,
	dsc = "This game is based on Robert Shekley novell."..[[^^
	Implementation: Danil Korotenko (danil.korotenko@gmail.com).]],
--	obj = { vway("next", "Click {here} to play.", 'location') }
};
