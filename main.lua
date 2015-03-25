-- $Name:The Prize of Peril$
-- $Version:1.0.0$

instead_version "1.8.2"
require "hideinv"

game.act = "Action is undefined.";
game.inv = "Inventory is undefined";
game.use = "Use is undefined";

game.forcedsc = true;

main = room
{
	nam = "The Prize of Peril",
	dsc = "This game is based on Robert Shekley novell."..[[^^
	Implementation: Danil Korotenko (danil.korotenko@gmail.com).]],
	obj =
	{
		vway("next", "Click {here} to play.", 'hotelRoom')
	},
};

watch = obj
{
	nam = "Look at the Watch",
	inv = function(s)
		if here() == hotelRoom or here() == hotelBathroom then
			return 'You have nearly eight hours to go.';
		elseif here() == courtyard then
			return 'You have seven and a half hours to go.';
		elseif here() == street then
			return 'You have seven hours to go.';
		elseif here() == subway then
			return 'You have five hours to go.'
		elseif here() == manhassetStation then
			return 'You have four and a half hours to go.'
		elseif here() == countryRoad or here() == concreteHighway then
			return 'You have four hours to go.'
		elseif here() == inhabitantZone then
			return 'You have nearly two hours to go.'
		elseif here() == church then
			return 'You have one hour to go.'
		elseif here() == graveyard then --openGrave
			return  'You have few minutes to go.'
		end
	end,
}

hotelBathroomTVSet = dlg
{
	nam = "Listen to TV Set",
    hideinv = true;
    entered = [[You took the tiny television set from your pocket. The picture was blurred, and you didn't bother to adjust it. The audio was clear and precise.^^

		You listened to the well-modulated voice of Mike Terry addressing his vast audience.^^

		- "... terrible spot," Terry was saying.^
		- "Yes, folks, Jim Raeder is in a truly terrible predicament. He had been hiding, you'll remember, in a third-rate Broadway hotel under an assumed name. It seemed safe enough. But the bellhop recognized him, and gave that information to the Thompson gang."^^

		The door creaked under repeated blows. You clutched the little television set and listened.^^

		- "Jim Raeder just managed to escape from the hotel! Closely pursued, he entered a brownstone at one fifty-six West End Avenue. His intention was to go over the roofs. And it might have worked, folks, it just might have worked. But the roof door was locked. It looked like the end ... But Raeder found that apartment seven was unoccupied and unlocked. He entered ..."^^

		Terry paused for emphasis, then cried:^
		— "and now he's trapped there, trapped like a rat in a cage! The Thompson gang is breaking down the door! The fire escape is guarded! Our camera crew, situated in a nearby building, is giving you a close-up now. Look, folks, just look! Is there no hope for Jim Raeder?"^^

		Is there no hope? You silently echoed, perspiration pouring from you as you stood in the dark, stifling little bathroom, listening to the steady thud against the door.^^

		- "Wait a minute!" Mike Terry cried. "Hang on, Jim Raeder, hang on a little longer. Perhaps there is hope! I have an urgent call from one of our viewers, a call on the Good Samaritan Line! Here's someone who thinks he can help you, Jim. Are you listening, Jim Raeder?"^^

		You are waiting, and hearing the hinges tearing out of rotten wood.^^

		- "Go right ahead, sir," said Mike Terry. "What is your name, sir?"^^

		- "Er—Felix Bartholemow"^^

		- "Don't be nervous, Mr. Bartholemow. Go right ahead"^^

		- "Well, okay. Mr. Raeder," said an old man's shaking voice, "I used to live at one five six West End Avenue. Same apartment you're trapped in, Mr. Raeder fact! Look, that bathroom has got a window, Mr. Raeder. It's been painted over, but it has got a—....."]];
    phr = 
    {
        { 1, [[Push the television set into your pocket.]], 
            [[You pushed the television set into your pocket.]], 
            [[
				objs(hotelBathroom):add('windowOutlines');
				walk(hotelBathRoom);
			]] 
        };
    }
}

-- TODO: TV Set in hotel room.
TVSet = obj
{
	nam = "Listen to TV Set",
	inv = function(s)
		if here() == hotelBathroom then
			walk(hotelBathroomTVSet);
		elseif here() == courtyard then

			return [[You could hear Mike Terry's frenzied voice over the TV set in your pocket:^^

			- "Now run for it!" Terry was screaming. "Run, Jim Raeder, run for your life. Run now, while the killers' eyes are filled with smoke. And thank Good Samaritan Sarah Winters, of three four one two Edgar Street, Brockton, Mass., for donating five smoke bombs and employing the services of a man to throw them!" In a quieter voice, Terry continued. "You've saved a man's life today, Mrs. Winters. Would you tell our audience how it—..."^^
		
			You are unable to hear any more.]];

		elseif here() == street then
			return 'You have seven hours to go.';
		elseif here() == subway then
			return 'You have five hours to go.'
		elseif here() == manhassetStation then --taxi
			return 'You have four and a half hours to go.'
		elseif here() == countryRoad then --concreteHighway
			return 'You have four hours to go.'
		elseif here() == inhabitantZone then
			return 'You have nearly two hours to go.'
		elseif here() == church then
			return 'You have one hour to go.'
		elseif here() == graveyard then --openGrave
			return  'You have few minutes to go.'
		end
	end,
}

hotelWindow = obj
{
    nam = 'Hotel window';
	var 
	{
		isObserved = false
	},

    dsc = function(s)
		return [[Look out of the {window}.^]];
	end;

    act = function(s)
		if s.isObserved == true then
			return [[You don't want to look out of the window oncemore. It is dangerous.]];
		else
			s.isObserved = true;
			hotelRoom.isBulletHolePresent = true;
	        p [[You lifted your head cautiously above the windowsill.^
				You see the fire-escape, and below it a narrow alley. There was a weather-beaten baby carriage in the alley and three garbage cans. As you watched, a black-sleeved arm moved from behind the furthest can, with something shiny in its fist. You ducked down. A bullet smashed through the window above your head and punctured the ceiling, showering you with plaster.^^

				Now you know about the alley. It is guarded]];
			if door.isObserved == true then
				p [[, just like the door.]];
			else
				p [[.]];
			end;
		end;
    end;
};

-- He was a tall man with bloodshot eyes and a two-day stubble. Grime and fatigue had etched lines into his face. Fear had touched his features, tightening a muscle here and twitching a nerve there. The results were startling. His face had character now, for it was reshaped by the expectation of death.^^

-- There was a gunman in the alley and two on the stairs. He was trapped. He was dead.^^

-- Sure, Raeder thought, he still moved and breathed, but that was only because of death's inefficiency. Death would take care of him in a few minutes. Death would poke holes in his face and body, artistically dab his clothes with blood, arrange his limbs in some grotesque position of the graveyard ballet .. .^^

-- Raeder bit his lip sharply. He wanted to live. There had to be a way.^^

--He rolled onto his stomach and surveyed the dingy cold-water apartment into which the killers had driven him. 

door = obj
{
    nam = 'Door';
	var 
	{ 
		isObserved = false
	},
    dsc = function(s)
		return [[Try to go out through the {door}.^]];
	end;

    act = function(s)
		if s.isObserved == true then
			return [[The door is watched by killers, and there is no sence to touch the door.]];
		else
			s.isObserved = true;
			return [[Cautiosly, you looked out of the door.^^

				- "Here is he!!!!!", cried someone of two killers from the stairs.^^
				
				Quickly you hided back to room, and two bullets overshot you.]];
		end;
	end;
};

doorToBathroom = obj
{
    nam = 'Door to Bathroom';
    dsc = [[Сrawl to the {bathroom}.^]];
    act = function(s)
        walk(hotelBathroom);
    end;
};

-- TODO: More description for hotel room. Need to explain story background. Player very quickly come to the trap.
hotelRoom = room
{
	nam = 'Hotel Room',
	var 
	{ 
		enterFirstly = true,
		isBulletHolePresent = false
	},
	enter = function(s,f)
		if s.enterFirstly == true then
			inv():add('watch');
			inv():add('TVSet');
			s.enterFirstly = false;
		end
	end,
	dsc = function(s)
		p [[You are laying at full length on the cracked linoleum,]];
		if s.isBulletHolePresent == true then
			p [[staring at the bullet hole in the ceiling,]];
		end;
		p [[listening to the sounds outside the door. It is a perfect little one-room coffin.]];
	end;
	obj =
	{
        hotelWindow,
        door,
        doorToBathroom
	}
}

holeOnTheCeiling = obj
{
    nam = 'Ragged hole';
    dsc = [[There was a ragged {hole} in the ceiling, almost four inches wide. If you could enlarge it, crawl through into the apartment above...]];
    act = [[You studied the hole in the ceiling. No use even considering it. You could never enlarge it in time.^^

		But surely someone would help you!]];
}

windowOutlines = obj
{
    nam = 'Outlines of the window';
    dsc = [[You can see tiny {outlines} of the window.]];
    act = function(s)
        p [[You located the outlines of the window and kicked. Glass shattered, and daylight poured startlingly in. You cleared the jagged sill and quickly peered down.^^

        Below was a long drop to a concrete courtyard.^^

        The hinges tore free. You heard the door opening.]];
        
        walk(courtyard);
        
        return;
    end;
}

hotelBathroom = room
{
	nam = 'Hotel Bathroom',
	dsc = [[A tiny windowless bathroom.^^

		You hear a muffled thud. The killers are impatient. They are beginning to break down the door.^^

		They are smashing against the door, grunting each time they struck. Soon the lock would tear out, or the hinges would pull out of the rotting wood. The door would go down, and the two blank-faced men would enter, dusting off their jackets ...]],

    enter = [[You crawled to the bathroom and stood up.]];
    obj = 
    {
        holeOnTheCeiling
    };
}

courtyard = room
{
	nam = 'Courtyard',
	dsc = [[Quickly you climbed through the window, hung by your fingertips for a moment, and dropped.^^

		The shock was stunning. Groggily you stood up. A face appeared at the bathroom window.^^

		- "Tough luck," said the man, leaning out and taking careful aim with a snub-nosed .38.^^

		At that moment a smoke bomb exploded inside the bathroom.^^

		The killer's shot went wide. He turned, cursing. More smoke bombs burst in the courtyard, obscuring Raeder's figure.]],

	obj =
	{
		vway("wayToStreet", "You are running through the smoke-filled courtyard, past clotheslines, into the open {street}.", 'street')
	}
}

street = room
{
	nam = '63rd Street',
	dsc = [[You walking down 63rd Street, slouching to minimize your height, staggering slightly from exertion, dizzy from lack of food and sleep.^^

		- "Hey, you!"^^

		You turned. A middle-aged woman was sitting on the steps of a brownstone, frowning at him.^^

		- "You're Raeder, aren't you? The one they're trying to kill?"^^

		You started to walk away.^^

		- "Come inside here, Raeder," the woman said.^^

		Perhaps it was a trap. But you knew that you had to depend upon the generosity and good-heartedness of the people. You was their representative, a projection of themselves, an average guy in trouble. Without them, you was lost. With them, nothing could harm you.^^

		Trust in the people, Mike Terry had told him. They'll never let you down.]],

	obj =
	{
		vway("wayToMrsVelmaODellHouse", "Go to {house}.", 'missisHouseDialog')
	}
}

missisHouseDialog = dlg
{
    nam = "Mrs. Velma O'Dell house";

    hideinv = true;

    entered = [[You followed the woman into her parlor. She told you to sit down and left the room, returning almost immediately with a plate of stew. She stood watching you while you ate, as one would watch an ape in the zoo eat peanuts.^^

		Two children came out of the kitchen and stared at you.^^

		Three overalled men came out of the bedroom and focused a television camera on you. There was a big television set in the parlor. As you gulped your food, you watched the image of Mike Terry and listened to the man's strong, sincere, worried voice.^^

		- "There he is, folks," Terry was saying. "There's Jim Raeder now, eating his first square meal in two days. Our camera crews have really been working to cover this for you! Thanks, boys ... Folks, Jim Raeder has been given a brief sanctuary by Mrs. Velma O'Dell, of three forty-three Sixty-Third Street. Thank you, Good Samaritan O'Dell! It's really wonderful how people from all walks of life have taken Jim Raeder to their hearts!"^^

		- "You better hurry," Mrs. O'Dell said.]];

    phr = 
    {
        { 1, 
			[["Yes, ma'am," You said.]], 
    	    [[- "I don't want no gunplay in my apartment."]], 
			code [[ pon(2) ]] 
        };
        { 2, false, 
			[["I'm almost finished, ma'am."]], 
			[[One of the children asked, `Aren't they going to kill him?"^^

			- "Shut up," said Mrs. O'Dell.^^

			- "Yes, Jim," chanted Mike Terry. "You'd better hurry. Your killers aren't far behind. They aren't stupid men, Jim. Vicious, warped insane yes! But not stupid. They're following a trail of blood—blood from your torn hand, Jim!"^^

			You hadn't realized until now that you'd cut your hand on the windowsill.^^

			- "Here, I'll bandage that," Mrs. O'Dell said. Raeder stood up and let her bandage his hand. Then she gave him a brown jacket and a gray slouch hat.^^

			- "My husband's stuff," she said.^^

			- "He has a disguise, folks!" Mike Terry cried delightedly. "This is something new! A disguise! With seven hours to go until he's safe!"^^

			- "Now get out of here," Mrs. O'Dell said.]],
			code [[ pon(3) ]] 
		};
		{3, false,
			[["I'm going, ma'am," You said. "Thanks."]],
			[[- "I think you're stupid," she said. "I think you're stupid to be involved in this."]],
			[[pon(4)]]
		};
		{4, false,
			[["Yes, ma'am."]],
			[[- "It just isn't worth it."^^
			
			You thanked her and left. You walked to Broadway, caught a subway to 59th Street, then an uptown local to 86th. There you bought a newspaper and changed for the Manhasset through-express.^^

			You glanced at your watch. You had six and a half hours to go.]],
			[[walk(subway)]]
		}
    }
}

subway = room
{
	nam = "Subway",
	dsc = [[The subway roared under Manhattan. You dozed, your bandaged hand concealed under the newspaper, the hat pulled over his face. Had you been recognized yet? Had you shaken the Thompson gang? Or was someone telephoning them now?^^

		Dreamily you wondered if you had escaped death, or was you still a cleverly animated corpse, moving around because of death's inefficiency? (My dear, death is so laggard these days! Jim Raeder walked about for hours after he died and actually answered people's questions before he could be decently buried!)^^

		Your eyes snapped open. You had dreamed something ... unpleasant. You couldn't remember what.]],
	obj =
	{
		vway("wayToSubwayFlashback", "You closed your eyes again and remembered, with mild astonishment, a time when you had been in {no trouble}.", 'subwayFlashback')
	}
}

subwayFlashback = room
{
	nam = "Subway Flashback",
	dsc = [[That was two years ago. You had been a big, pleasant young man working as a truck driver's helper. You had no talents. You was too modest to have dreams.^^

		The tight-faced little truck driver had the dreams for you.^
		- "Why not try for a television show, Jim? I would if I had your looks. They like nice, average guys with nothing much on the ball. As contestants. Everybody likes guys like that. Why not look into it?"^^

		So you had looked into it. The owner of the local television store had explained it further.^^

		- "You see, Jim, the public is sick of highly trained athletes with their trick reflexes and their professional courage. Who can feel for guys like that? Who can identify? People want to watch exciting things, sure, but not when some joker is making it his business for fifty thousand a year. That's why organized sports are in a slump. That's why the thrill shows are booming."^^

		- "I see," said you.^^

		- "Six years ago, Jim, Congress passed the Voluntary Suicide Act. Those old senators talked a lot about free will and self-determinism at the time. But that's all crap. You know what the Act really means? It means the amateurs can risk their lives for the big loot, not just professionals. In the old days you had to be a professional boxer or footballer or hockey player if you wanted your brains beaten out legally for money. But now that opportunity is open to ordinary people like you, Jim."^^

		- "I see," you said again.^^

		- "It's a marvelous opportunity. Take you. You're no better than anyone, Jim. Anything you can do, anyone can do. You're average. I think the thrill shows would go for you"^^

		You permitted yourself to dream. Television shows looked like a sure road to riches for a pleasant young fellow with no particular talent or training. He wrote a letter to a show called Hazard and enclosed a photograph of himself.^^

		Hazard was interested in you. The JBC network investigated, and found that he was average enough to satisfy the wariest viewer. His parentage and affiliations were checked. At last he was summoned to New York and interviewed by Mr. Moulain.^^

		Moulain was dark and intense, and chewed gum as he talked. "You'll do," he snapped. "But not for Hazard. You'll appear on Spills. It's a half-hour daytime show on Channel Three"^^

		- "Gee," said you.^^

		- "Don't thank me. There's a thousand dollars if you win or place second, and a consolation prize of a hundred dollars if you lose. But that's not important."^^

		- "No, sir."^^

		- "Spills is a little show. The JBC network uses it as a testing ground. First and second-place winners on Spills move on to Emergency. The prizes are much bigger on Emergency."^^

		- "I know they are, sir."^^

		- "And if you do well on Emergency, there are the first-class thrill shows, like Hazard and Underwater Perils, with their nationwide coverage and enormous prizes. And then comes the really big time. How far you go is up to you."^^

		- "I'll do my best, sir," Raeder said.^^

		Moulain stopped chewing gum for a moment and said, almost reverently, "You can do it, Jim. Just remember. You're the people, and the people can do anything."^^

		The way he said it made Raeder feel momentarily sorry for Mr. Moulain, who was dark and frizzy-haired and popeyed, and was obviously not the people.^^

		They shook hands. Then Raeder signed a paper absolving the JBC of all responsibility should he lose his life, limbs, or reason during the contest. And he signed another paper exercising his rights under the Voluntary Suicide Act. The law required this, and it was a mere formality.^^

		In three weeks, he appeared on Spills.^^

		The program followed the classic form of the automobile race. Untrained drivers climbed into powerful American and European competition cars and raced over a murderous twenty-mile course. Raeder was shaking with fear as he slid his big Maserati into the wrong gear and took off.^^

		The race was a screaming, tire-burning nightmare. Raeder stayed back, letting the early leaders smash themselves up on the counterbanked hairpin turns. He crept into third place when a Jaguar in front of him swerved against an Alfa-Romeo and the two cars roared into a plowed field. Raeder gunned for second place on the last three miles, but couldn't find passing room. An S-curve almost took him, but he fought the car back on the road, still holding third. Then the lead driver broke a crankshaft in the final fifty yards, and Jim ended in second place.^^

		He was now a thousand dollars ahead. He received four fan letters, and a lady in Oshkosh sent him a pair of argyles. He was invited to appear on Emergency.^^

		Unlike the others, Emergency was not a competition-type program. It stressed individual initiative. For the show, Raeder was knocked out with a nonhabit-forming narcotic. He awoke in the cockpit of a small airplane, cruising on autopilot at ten thousand feet. His fuel gauge showed nearly empty. He had no parachute. He was supposed to land the plane.^^

		Of course, he had never flown before.^^

		He experimented gingerly with the controls, remembering that last week's participant had recovered consciousness in a submarine, had opened the wrong valve, and had drowned.^^

		Thousands of viewers watched spellbound as this average man, a man just like themselves, struggled with the situation just as they would do. Jim Raeder was them. Anything he could do, they could do. He was representative of the people.^^

		Raeder managed to bring the ship down in some semblance of a landing. He flipped over a few times, but his seat belt held. And the engine, contrary to expectation, did not burst into flames.^^

		He staggered out with two broken ribs, three thousand dollars, and a chance, when he healed, to appear on Torero.^^

		At last, a first-class thrill show! Torero paid ten thousand dollars. All you had to do was kill a black Miura bull with a sword, just like a real, trained matador.^^

		The fight was held in Madrid, since bullfighting was still illegal in the United States. It was nationally televised.^^

		Raeder had a good cuadrilla. They liked the big, slow-moving American. The picadors really leaned into their lances, trying to slow the bull for him. The banderilleros tried to run the beast off his feet before driving in their banderillas. And the second matador, a mournful man from Algiceras, almost broke the bull's neck with fancy cape-work.^^

		But when all was said and done, it was Jim Raeder on the sand, a red muleta clumsily gripped in his left hand, a sword in his right, facing a ton of black, blood-streaked, wide-horned bull.^^

		Someone was shouting, "Try for the lung, hombre. Don't be a hero, stick him in the lung." But Jim only knew what the technical advisor in New York had told him: Aim with the sword and go in over the horns.^^

		Over he went. The sword bounced off bone, and the bull tossed him over its back. He stood up, miraculously un-gouged, took another sword and went over the horns again with his eyes closed. The god who protects children and fools must have been watching, for the sword slid in like a needle through butter, and the bull looked startled, stared at him unbelievingly, and dropped like a deflated balloon.^^

		They paid him ten thousand dollars, and his broken collarbone healed in practically no time. He received twenty-three fan letters, including a passionate invitation from a girl in Atlantic City, which he ignored. And they asked him if he wanted to appear on another show.^^

		He had lost some of his innocence. He was now fully aware that he had been almost killed for pocket money. The big loot lay ahead. Now he wanted to be almost killed for something worthwhile.^^

		So he appeared on Underwater Perils, sponsored by Fairlady's Soap. In face mask, respirator, weighted belt, flippers and knife, he slipped into the warm waters of the Caribbean with four other contestants, followed by a cage-protected camera crew. The idea was to locate and bring up a treasure which the sponsor had hidden there.^^

		Mask diving isn't especially hazardous. But the sponsor had added some frills for public interest. The area was sown with giant clams, moray eels, sharks of several species, giant octopuses, poison coral, and other dangers of the deep.^^

		It was a stirring contest. A man from Florida found the treasure in a deep crevice, but a moray eel found him. Another diver took the treasure, and a shark took him. The brilliant blue-green water became cloudy with blood, which photographed well on color TV. The treasure slipped to the bottom, and Raeder plunged after it, popping an eardrum in the process. He plucked it from the coral, jettisoned hisweighted belt and made for the surface. Thirty feet from the top he had to fight another diver for the treasure.^^

		They feinted back and forth with their knives. The man struck, slashing Raeder across the chest. But Raeder, with the self-possession of an old contestant, dropped his knife and tore the man's respirator out of his mouth.^^

		That did it. Raeder surfaced and presented the treasure at the standby boat. It turned out to be a package of Fair-lady's Soap—"The Greatest Treasure of All."^^

		That netted him twenty-two thousand dollars in cash and prizes, and three hundred and eight fan letters, and an interesting proposition from a girl in Macon, which he seriously considered. He received free hospitalization for his knife slash and burst eardrum, and injections for coral infection.^^

		But best of all, he was invited to appear on the biggest of the thrill shows. The Prize of Peril.]],
	obj =
	{
		vway("wayToSubwayAgain", "And that was when the {real trouble began...}.", 'subwayAgain')
	}
}

subwayAgain = room
{
	nam = "Subway",
	dsc = [[The subway came to a stop, jolting him out of his reverie. Raeder pushed back his hat and observed, across the aisle, a man staring at him and whispering to a stout woman. Had they recognized him?^^

		He stood up as soon as the doors opened, and glanced at his watch. He had five hours to go.]],
	obj =
	{
		vway("wayToManhassetStation", "Go to {Manhasset station}.", 'taxidlg')
	}
}

taxidlg = dlg
{
    nam = 'In the Taxi';
    hideinv = true;
    entered = [[At the Manhasset station, you stepped into a taxi and told the driver to take you to New Salem.^^

        "New Salem?" the driver asked, looking at you in the rear-vision mirror.]];
    phr = 
    {
        { 1, [[That's right.]], 
            [[The driver snapped on his radio.^^
             - "Fare to New Salem. Yep, that's right. New Salem." They drove off.^^
             You frowned, wondering if it had been a signal. It was perfectly usual for taxi drivers to report to their dispatchers, of course. But something about the man's voice ...]], 
             code [[ pon(2) ]] 
        };
        { 2, false, always = true, [[Let me off here.]], [[- "No problem.", the driver reported.]],[[walk(countryRoad)]]}
    }
}

countryRoad = room
{
	nam = "Country Road",
	dsc = [[He paid the driver and began walking down a narrow country road that curved through sparse woods. The trees were too small and too widely separated for shelter. Raeder walked on, looking for a place to hide. ^^
    
		There was a heavy truck approaching. He kept on walking, pulling his hat low on his forehead. But as the truck drew near, he heard a voice from the television set in his pocket. It cried, "Watch out!"^^

		He flung himself into the ditch. The truck careened past, narrowly missing him, and screeched to a stop. The driver was shouting, "There he goes! Shoot, Harry, shoot!"^^

		Bullets clipped leaves from the trees as Raeder sprinted into the woods.^^

		- "It's happened again!" Mike Terry was saying, his voice high-pitched with excitement. "I'm afraid Jim Raeder let himself be lulled into a false sense of security. You can't do that, Jim! Not with your life at stake! Not with killers pursuing you! Be careful, Jim, you still have four and a half hours to go!"^^

		The driver was saying, "Claude, Harry, go around with the truck. We got him boxed."^^

		- "They've got you boxed, Jim Raeder!" Mike Terry cried. "But they haven't got you yet! And you can thank Good Samaritan Susy Peters of twelve Elm Street, South Orange, New Jersey, for that warning shout just when the truck was bearing down on you. We'll have little Susy on stage in just a moment ... Look, folks, our studio helicopter has arrived on the scene. Now you can see Jim Raeder running, and the killers pursuing, surrounding him ..."]],

	obj =
	{
		vway("wayToConcreteHighway", "You ran through a hundred yards of woods and found yourself on a {concrete highway}, with open woods beyond.", 'concreteHighway')
	}
}

concreteHighway = room
{
	nam = "Concrete Highway",
	dsc = [[One of the killers was trotting through the woods behind him. The truck had driven to a connecting road and was now a mile away, coming toward him.^^

		A car was approaching from the other direction. Raeder ran into the highway, waving frantically.]],

	obj =
	{
		vway("wayToCarDialog", "{The car} came to a stop.", 'carDialog')
	}
}

carDialog = dlg
{
	nam = "Janice Morrow car",
    hideinv = true;
    entered = [[- "Hurry!" cried the blond young woman driving it.^^
    
        You dived in.^^
    
        The woman made a U-turn on the highway. A bullet smashed through the windshield. She stamped on the accelerator, almost running down the lone killer who stood in the way.^^
        
        The car surged away before the truck was within firing range.^^

        Raeder leaned back and shut his eyes tightly. The woman concentrated on her driving, watching for the truck in her rear-vision mirror.^^

		- "It's happened again!" cried Mike Terry, his voice ecstatic.^^

		- "Jim Raeder has been plucked again from the jaws of death, thanks to Good Samaritan Janice Morrow of four three three Lexington Avenue, New York City. Did you ever see anything like it, folks? The way Miss Morrow drove through a fusillade of bullets and plucked Jim Raeder from the mouth of doom! Later we'll interview Miss Morrow and get her reactions. Now, while Jim Raeder speeds away—perhaps to safety, perhaps to further peril—we'll have a short announcement from our sponsor. Don't go away! Jim's got four hours and ten minutes until he's safe: Anything can happen!"^^

		- "Okay," the girl said. "We're off the air now. Raeder, what in the hell is the matter with you?"]];
 
    phr = 
    {
        {1, 
            [["Eh?" Raeder asked. The girl was in her early twenties. She looked efficient, attractive, untouchable. Raeder noticed that she had good features, a trim figure. And he noticed that she seemed angry.^^

			- "Miss," he said, "I don't know how to thank you for—"]],

            [[ - "Talk straight," Janice Morrow said. "I'm no Good Samaritan. I'm employed by the JBC network."]], 

            [[pon(2)]]
        };
        {2, false,
            [["So the program had me rescued!"]],
            [[ - "Cleverly reasoned," she said.]],
            [[pon(3)]]
        };
        {3, false,
            [["But why?"]],
            [[- "Look, this is an expensive show, Raeder. We have to turn in a good performance. If our rating slips, we'll all be in the street selling candy apples. 	And you aren't cooperating."]],
            [[pon(4)]]
        };
        {4, false,
            [["What? Why?"]],

            [[ - "Because you're terrible," the girl said bitterly.^
			- "You're a flop, a fiasco. Are you trying to commit suicide? Haven't you learned anything about survival?"]],

            [[pon(5)]]
        };
        {5, false,
            [["I'm doing the best I can."]],
            [[- "The Thompsons could have had you a dozen times by now. We told them to take it easy, stretch it out. But it's like shooting a clay pigeon six feet tall. The Thompsons are cooperating, but they can only fake so far. If I hadn't come along, they'd have had to kill you—air-time or not."^^

			Raeder stared at her, wondering how such a pretty girl could talk that way. She glanced at him, then quickly looked back to the road.^^

			- "Don't give me that look!" she said. "You chose to risk your life for money, buster. And plenty of money! You knew the score. Don't act like some 	innocent little grocer who finds the nasty hoods are after him. That's a different plot."]],

            [[pon(6)]]
        };
        {6, false,
            [["I know," Raeder said.]],
            [[- "If you can't live well, at least try to die well."]],
            [[pon(7)]]
        };
        {7, false,
            [["You don't mean that," Raeder said.]],

            [[- "Don't be too sure ... You've got three hours and forty minutes until the end of the show. If you can stay alive, fine. The boodle's yours. But if you 	can't, at least try to give them a run for the money."]],
            [[pon(8)]]
        };
        {8, false,
            [[Raeder nodded, staring intently at her.]],
            [[- "In a few moments we're back on the air. I develop engine trouble, let you off. The Thompsons go all out now. They kill you when and if they can, as 	soon as they can. Understand?"]],

            [[pon(9)]]
        };
        {9, false,
            [["Yes," Raeder said. "If I make it, can I see you some time?"]],
            [[- She bit her lip angrily. "Are you trying to kid me?"]],
            [[pon(10)]]
        };
        {10, false,
            [["No. I'd like to see you again. May I?"]],

            [[- She looked at him curiously. "I don't know. Forget it. We're almost on. I think your best bet is the woods to the right. Ready?"]],
            [[pon(11)]]
        };
        {11, false,
            [["Yes. Where can I get in touch with you? Afterward, I mean."]],
            [[- "Oh, Raeder, you aren't paying attention. Go through the woods until you find a washed-out ravine. It isn't much, but it'll give you some cover."]],

            [[pon(12)]]
        };
        {12, false,
            [["Where can I get in touch with you?" Raeder asked again.]],
            [[- "I'm in the Manhattan telephone book." She stopped the car. "Okay, Raeder, start running."]],

            [[pon(13)]]
        };
        {
            13, false,
            [[He opened the door.]],
            [[- "Wait" She leaned over and kissed him on the lips. "Good luck, you idiot. Call me if you make it."^^

			And then he was on foot, running into the woods.]],

            [[walk(inhabitantZone)]]
        };
    }
}

inhabitantZone = room
{
	nam = "Inhabitant Zone",
	dsc = [[HE ran through birch and pine, past an occasional split-level house with staring faces at the big picture windows. Some occupant of those houses must have called the gang, for they were close behind him when he reached the washed-out little ravine. Those quiet, mannerly, law-abiding people didn't want him to escape, Raeder thought sadly. They wanted to see a killing. Or perhaps they wanted to see him narrowly escape a killing.^^

		It came to the same thing, really.^^

		He entered the ravine, burrowed into the thick underbrush and lay still. The Thompsons appeared on both ridges, moving slowly, watching for any movement. Raeder held his breath as they came parallel to him.^^

		He heard the quick explosion of a revolver. But the killer had only shot a squirrel. It squirmed for a moment, then lay still.^^

		Lying in the underbrush, Raeder heard the studio helicopter overhead. He wondered if any cameras were focused on him. It was possible. And if someone were watching, perhaps some Good Samaritan would help.^^

		So looking upward, toward the helicopter, Raeder arranged his face in a reverent expression, clasped his hands and prayed. He prayed silently, for the audience didn't like religious ostentation. But his lips moved. That was every man's privilege.^^

		And a real prayer was on his lips. Once, a lipreader in the audience had detected a fugitive pretending to pray, but actually just reciting multiplication tables. No help for that man!^^

		Raeder finished his prayer. Glancing at his watch, he saw that he had nearly two hours to go.^^

		And he didn't want to die. It wasn't worth it, no matter how much they paid! He must have been crazy, absolutely insane to agree to such a thing...]],

	obj =
	{
		vway("wayToInhabitantZoneFlashback", "But he knew that wasn't true. And he remembered just how sane you {had been...}", 'inhabitantZoneFlashback')
	}
}

inhabitantZoneFlashback = room
{
	nam = "Inhabitant Zone Flashback",
	dsc = [[ONE week ago, he had been on The Prize of Peril stage, blinking in the spotlight, and Mike Terry had shaken his hand.^^

		- "Now, Mr. Raeder," Terry had said solemnly, "do you understand the rules of the game you are about to play?" Raeder nodded.^^

		- "If you accept, Jim Raeder, you will be a hunted man for a week. Killers will follow you, Jim. Trained killers, men wanted by the law for other crimes, granted immunity for this single killing under the Voluntary Suicide Act. They will be trying to kill you, Jim. Do you understand?"^^

		- "I understand," Raeder said. He also understood the two hundred thousand dollars he would receive if he could live out the week.^^

		- "I ask you again, Jim Raeder. We force no man to play for stakes of death."^^

		- "I want to play," Raeder said.^^

		Mike Terry turned to the audience. "Ladies and gentlemen, I have here a copy of an exhaustive psychological test which an impartial psychological testing firm made on Jim Raeder at our request. Copies will be sent to anyone who desires them for twenty-five cents to cover the cost of mailing. The test shows that Jim Raeder is sane, well-balanced and fully responsible in every way." He turned to Raeder.^^

		- "Do you still want to enter the contest, Jim?"^^

		- "Yes, I do."^^

		- "Very well!" cried Mike Terry. "Jim Raeder, meet your would-be killers!"^^

		The Thompson gang moved onstage, booed by the audience.^^

		- "Look at them, folks," said Mike Terry, with undisguised contempt. "Just look at them! Antisocial, thoroughly vicious, completely amoral. These men have no code but the criminal's warped code, no honor but the honor of the cowardly hired killer. They are doomed men, doomed by our society, which will not sanction their activities for long, fated to an early and unglamorous death."^^

		The audience shouted enthusiastically.^^

		- "What have you to say, Claude Thompson?" Terry asked.^^

		Claude, the spokesman of the Thompsons, stepped up to the microphone. He was a thin, clean-shaved man, conservatively dressed.^^

		- "I figure," Claude Thompson said hoarsely, "I figure we're no worse than anybody. I mean, like soldiers in a war: They kill. And look at the graft in government, and the unions. Everybody's got their graft."^^

		That was Thompson's tenuous code. But how quickly, with what precision, Mike Terry destroyed the killer's rationalizations! Terry's questions pierced straight to the filthy soul of the man.^^

		At the end of the interview, Claude Thompson was perspiring, mopping his face with a silk handkerchief and casting quick glances at his men.^^

		Mike Terry put a hand on Raeder's shoulder. "Here is the man who has agreed to become your victim—if you can catch him."^^

		- "We'll catch him," Thompson said, his confidence returning.^^

		- "Don't be too sure," said Terry. "Jim Raeder has fought wild bulls—now he battles jackals. He's an average man. He's the people—who mean ultimate doom to you and your kind."^^

		- "We'll get him," Thompson said.^^

		- "And one thing more," Terry said, very softly. "Jim Raeder does not stand alone. The folks of America are for him. Good Samaritans from all corners of our great nation stand ready to assist him. Unarmed, defenseless, Jim Raeder can count on the aid and goodheartedness of the people, whose representative he is. So don't be too sure, Claude Thompson! The average men are for Jim Raeder—and there are a lot of average men!"]],

	obj =
	{
		vway("wayToInhabitantZoneAgain", "Go to {Inhabitant Zone}.", 'inhabitantZoneAgain')
	}
}

inhabitantZoneAgain = room
{
	nam = "Inhabitant Zone",
	dsc = [[RAEDER thought about it, lying motionless in the underbrush. Yes, the people had helped him. But they had helped the killers, too.^^

		A tremor ran through him. He had chosen, he reminded himself. He alone was responsible. The psychological test had proved that.^^

		And yet, how responsible were the psychologists who had given him the test? How responsible was Mike Terry for offering a poor man so much money? Society had woven the noose and put it around his neck, and he was hanging himself with it and calling it free will.^^

		Whose fault?^^

		- "Aha!" someone cried.^^

		Raeder looked up and saw a portly man standing near him.^^

		The man wore a loud tweed jacket. He had binoculars around his neck and a cane in his hand.^^

		- "Mister," Raeder whispered, "please don't tell!"^^

		- "Hi!" shouted the portly man, pointing at Raeder with his cane. "Here he is!"^^

		A madman, thought Raeder. The damned fool must think he's playing Hare and Hounds.^^

		- "Right over here!" the man screamed.^^

		Cursing, Raeder sprang to his feet and began running. He carne out of the ravine and saw a white building in the distance. He turned toward it. Behind him he could still hear the man.^^

		- "That way, over there. Look, you fools, can't you see him yet?"^^

		The killers were shooting again. Raeder ran, stumbling over uneven ground, past three children playing in a tree house.^^

		- "Here he is!" the children screamed. "Here he is!" Raeder groaned and ran on. ]],

	obj =
	{
		vway("wayToChurch", "He reached the steps of the building and saw that it was a {church}.", 'church')
	}
}

church = room
{
	nam = "Church",
	dsc = [[As he opened the door, a bullet struck him behind the right kneecap.^^

		He fell, and crawled inside the church.^^

		The television set in his pocket was saying, "What a finish, folks, what a finish! Raeder's been hit! He's been hit, folks, he's crawling now, he's in pain, but he hasn't given up! NOT Jim Raeder!"^^

		Raeder lay in the aisle near the altar. He could hear a child's eager voice saying, "He went in there, Mr. Thompson. Hurry, you can still catch him!"^^

		Wasn't a church considered a sanctuary? Raeder wondered.^^

		Then the door was flung open, and Raeder realized that the custom was no longer observed.]],

	obj =
	{
		vway("wayToGraveyard", "He gathered himself together and crawled past the altar, out of the {back door} of the church.", 'graveyard')
	}
}

graveyard = room
{
	nam = "Graveyard",
	dsc = [[He was in an old graveyard. He crawled past crosses and stars, past slabs of marble and granite, past stone tombs and rude wooden markers. A bullet exploded on a tombstone near his head, showering him with fragments. He crawled to the edge of an open grave.^^

		They had deceived him, he thought. All of those nice, average, normal people. Hadn't they said he was their representative? Hadn't they sworn to protect their own? But no, they loathed him. Why hadn't he seen it? Their hero was the cold, blank-eyed gunman: Thompson, Capone, Billy the Kid, Young Lochinvar, El Cid, Cuchulain, the man without human hopes or fears. They worshipped him, that dead, implacable robot gunman, and lusted to feel his foot in their face.]],
	obj =
	{
		vway("wayToOpenGrave", "Raeder tried to move, and slid helplessly into the {open grave}.", 'openGrave')
	}
}

openGrave = room
{
	nam = "Open Grave",
	dsc = [[He lay on his back, looking at the blue sky. Presently a black silhouette loomed above him, blotting out the sky. Metal twinkled. The silhouette slowly took aim.^^

		And Raeder gave up all hope forever.^^

		- "Wait, Thompson!" roared the amplified voice of Mike Terry. The revolver wavered.^^

		- "It is one second past five o'clock! The week is up! JIM RAEDER HAS WON!"^^

		There was pandemonium of cheering from the studio audience.^^

		The Thompson gang, gathered around the grave, looked sullen.^^

		- "He's won, friends, he's won!" Mike Terry cried. "Look, look on your screen! The police have arrived, they're taking the Thompson away from their victim—the victim they could not kill. And all this is thanks to you, Good Samaritans of America. Look folks, tender hands are lifting Jim Raeder from the open grave that was his final refuge. Good Samaritan Janice Morrow is there. Could this be the beginning of a romance? Jim seems to have fainted, friends; they're giving him a stimulant. He's won two hundred thousand dollars! Now we'll have a few words from Jim Raeder!"^^

		There was a short silence.^^

		- "That's odd," said Mike Terry. "Folks, I'm afraid we can't hear from Jim just now. The doctors are examining him. Just one moment ..."^^

		There was a silence. Mike Terry wiped his forehead and smiled.^^

		- "It's the strain, folks, the terrible strain. The doctor tells me ... Well, folks, Jim Raeder is temporarily not himself. But it's only temporary! JBC is hiring the best psychiatrists and psychoanalysts in the country. We're going to do everything humanly possible for this gallant boy. And entirely at our own expense."^^

		Mike Terry glanced at the studio clock. "Well, it's about time to sign off, folks. Watch for the announcement of our next great thrill show. And don't worry, I'm sure that very soon we'll have Jim Raeder back with us."^^

		Mike Terry smiled, and winked at the audience. "He's bound to get well, friends. After all, we're all pulling for him! "^^
^^
^^
THE END.]]
}
