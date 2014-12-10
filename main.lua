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
	obj = { vway("next", "Click {here} to play.", 'hotel') }
};

hotel = room 
{
	nam = 'Hotel',
	dsc = [[RAEDER lifted his head cautiously above the windowsill. He saw the fire-escape, and below it a narrow alley. There was a weather-beaten baby carriage in the alley and three garbage cans. As he watched, a black-sleeved arm moved from behind the furthest can, with something shiny in its fist. Raeder ducked down. A bullet smashed through the window above his head and punctured the ceiling, showering him with plaster.
Now he knew about the alley. It was guarded, just like the door.
He lay at full length on the cracked linoleum, staring at the bullet hole in the ceiling, listening to the sounds outside the door. He was a tall man with bloodshot eyes and a two-day stubble. Grime and fatigue had etched lines into his face. Fear had touched his features, tightening a muscle here and twitching a nerve there. The results were startling. His face had character now, for it was reshaped by the expectation of death.
There was a gunman in the alley and two on the stairs. He was trapped. He was dead.
Sure, Raeder thought, he still moved and breathed, but that was only because of death's inefficiency. Death would take care of him in a few minutes. Death would poke holes in his face and body, artistically dab his clothes with blood, arrange his limbs in some grotesque position of the graveyard ballet .. .
Raeder bit his lip sharply. He wanted to live. There had to be a way.
He rolled onto his stomach and surveyed the dingy cold-water apartment into which the killers had driven him. It was a perfect little one-room coffin. It had a door,
which was watched, and a fire escape, which was watched. And it had a tiny windowless bathroom.
He crawled to the bathroom and stood up. There was a ragged hole in the ceiling, almost four inches wide. If he could enlarge it, crawl through into the apartment above...
He heard a muffled thud. The killers were impatient. They were beginning to break down the door.
He studied the hole in the ceiling. No use even considering it. He could never enlarge it in time.
They were smashing against the door, grunting each time they struck. Soon the lock would tear out, or the hinges would pull out of the rotting wood. The door would go down, and the two blank-faced men would enter, dusting off their jackets .. .
But surely someone would help him! He took the tiny television set from his pocket. The picture was blurred, and he didn't bother to adjust it. The audio was clear and precise.
He listened to the well-modulated voice of Mike Terry addressing his vast audience.
.. terrible spot," Terry was saying. "Yes, folks, Jim Raeder is in a truly terrible predicament. He had been hiding, you'll remember, in a third-rate Broadway hotel under an assumed name. It seemed safe enough. But the bellhop recognized him, and gave that information to the Thompson gang."
The door creaked under repeated blows. Raeder clutched the little television set and listened.
"Jim Raeder just managed to escape from the hotel! Closely pursued, he entered a brownstone at one fifty-six West End Avenue. His intention was to go over the roofs. And it might have worked, folks, it just might have worked. But the roof door was locked. It looked like the end ... But Raeder found that apartment seven was unoccupied and unlocked. He entered ..."
Terry paused for emphasis, then cried—"and now he's trapped there, trapped like a rat in a cage! The Thompson
gang is breaking down the door! The fire escape is guarded! Our camera crew, situated in a nearby building, is giving you a close-up now. Look, folks, just look! Is there no hope for Jim Raeder?"
Is there no hope? Raeder silently echoed, perspiration pouring from him as he stood in the dark, stifling little bathroom, listening to the steady thud against the door.
"Wait a minute!" Mike Terry cried. "Hang on, Jim Raeder, hang on a little longer. Perhaps there is hope! I have an urgent call from one of our viewers, a call on the Good Samaritan Line! Here's someone who thinks he can help you, Jim. Are you listening, Jim Raeder?"
Raeder waited, and heard the hinges tearing out of rotten wood.
"Go right ahead, sir," said Mike Terry. "What is your name, sir?"
"Er—Felix Bartholemow"
"Don't be nervous, Mr. Bartholemow. Go right ahead"
"Well, okay. Mr. Raeder," said an old man's shaking voice, "I used to live at one five six West End Avenue. Same apartment you're trapped in, Mr. Raeder fact! Look, that bathroom has got a window, Mr. Raeder. It's been painted over, but it has got a—"
Raeder pushed the television set into his pocket. He located the outlines of the window and kicked. Glass shattered, and daylight poured startlingly in. He cleared the jagged sill and quickly peered down.
Below was a long drop to a concrete courtyard.
The hinges tore free. He heard the door opening.]],
}
