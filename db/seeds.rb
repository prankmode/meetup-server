# frozen_string_literal: true

Meetup.destroy_all
User.destroy_all
u  = User.create({email: "maud", password: "maud", password_confirmation: "maud"})
u2 = User.create({email: "harriet", password: "harriet", password_confirmation: "harriet"})
Meetup.create! [
{name: "Monday Morning Mah Jongg", plain_text_description: "<p>Advanced Players welcome to join us for a fun game of mah jongg. We play quickly, chit chat, joke around and play a mean game of mah jongg. </p> <p>Bring your current card and your wallet. Be prepared to win and win even when you lose.</p> <p>$4 pie.</p>", event_id: "", short_link: "https://www.meetup.com/Mah-Jongg-in-Cambridge-Somerville/events/239871584/",user_id: u.id },
{name: "Dads and Kiddos Social - Coolidge Corner", plain_text_description: "<p>Hey Dads - join us for a low-key social at Panera. We will be meeting at the big table. Plenty of highchairs and a changing table in men's room. </p> <p>This event is every Monday. We strongly encourage RSVPs early if you know you'll be there so newcomers are confident other dads will be attending before they RSVP.</p> <p>Expectant dads and dads who can flex their schedule, but have their kiddo in daycare are welcome to join us!</p>", event_id: "", short_link: "https://www.meetup.com/BostonDadsGroup/events/240161731/",user_id: u.id },
{name: "Sivananda Yoga Cambridge", plain_text_description: "<p>Sivananda Yoga is not just a workout </p>", event_id: "", short_link: "https://www.meetup.com/Boston-Sivanada-Yoga-Meetup-Group/events/240591377/",user_id: u.id },
{name: "Evidence-based entrepreneurship in healthcare", plain_text_description: "<p>As healthcare relies on evidence-based </p>", event_id: "", short_link: "https://www.meetup.com/boston-young-professionals/events/240592538/",user_id: u.id },
{name: "Pathfinder Society Gaming at Knight Moves Cafe (Teele Square)", plain_text_description: "<p>The Boston Lodge of The Pathfinder Society </p>", event_id: "", short_link: "https://www.meetup.com/roleplaying-fellowship-of-greater-boston/events/240458785/",user_id: u.id },
{name: "Bitcoin Meetup", plain_text_description: "<p>We're getting together for a meetup. Come by and talk bitcoin.</p>", event_id: "", short_link: "https://www.meetup.com/Cambridge-Bitcoin-Meetup/events/239135985/",user_id: u.id },
{name: "Meet on Monday, June 12, 6-7pm", plain_text_description: "<p>It's easy to get to Workbar from the MBTA - take the red line to Central Square. </p>", event_id: "", short_link: "https://www.meetup.com/American-English-Pronunciation-Q-A/events/240210501/",user_id: u.id },
{name: "Improv Games and Scenework", plain_text_description: "<p>We'll do some warm-ups, then do improv games and scenes. Bring yourself and your sense of humor!</p>", event_id: "", short_link: "https://www.meetup.com/Home-by-10/events/240522784/",user_id: u.id },
{name: "Community Games, Beer, and Ethiopian Food!", plain_text_description: "hello", event_id: "", short_link: "https://www.meetup.com/Somerville-Board-Games-and-Beer/events/240552142/",user_id: u.id },
{name: "Pickup Game (Monday) at TUFTS TRIANGLE PARK", plain_text_description: "<p><b>PLEASE NOTE THE LOCATION CHANGE TO TUFTS.</b></p>", event_id: "", short_link: "https://www.meetup.com/Davis-Square-Ultimate-Pickup-Frisbee/events/240456881/",user_id: u.id },
{name: "Prospect Hill Run-4 miles", plain_text_description: "<p>**Jack Murphy will be hosting this event.**</p>", event_id: "", short_link: "https://www.meetup.com/Waltham-Trail-Runners/events/240593708/",user_id: u.id },
{name: "Watertown Acoustic Guitar 2nd Pilot Meetup", plain_text_description: "<p>We're so happy that you've found us</p>", event_id: "", short_link: "https://www.meetup.com/Watertown-Acoustic-Guitar-Meetup/events/239609851/",user_id: u.id },
{name: "Intermediate Armizare -- Swordplay, Dagger, Grappling", plain_text_description: "<p>Fiore dei Liberi's <i>L'Arte di Armizare</i> (The Art of Bearing Arms, c. 1410) </p>", event_id: "", short_link: "https://www.meetup.com/BosArm/events/240581957/",user_id: u.id },
{name: "Beginner Armizare -- Fundamentals of Fiore (Week 1/2)", plain_text_description: "hello", event_id: "", short_link: "https://www.meetup.com/BosArm/events/240182183/",user_id: u.id },
{name: "Board Game Night", plain_text_description: "<p>Running another game night at Christopher's in Porter Square.</p>", event_id: "", short_link: "https://www.meetup.com/BoardGame-Empire-Cambridge/events/240399363/",user_id: u.id },
{name: "On Fleece", plain_text_description: "<p>Hopefully y'all are keeping is 100 with this gloomy spring. </p>", event_id: "", short_link: "https://www.meetup.com/The-Boston-Drunken-Knitwits/events/240638260/",user_id: u.id },
{name: "Humanist Hub Discussion Group", plain_text_description: "<p>Connect with Humanists, Atheists, and Agnostics through friendly, thoughtful, moderated discussion. </p>", event_id: "", short_link: "https://www.meetup.com/HarvardHumanist/events/240594163/",user_id: u.id },
{name: "Laser Cutter 101", plain_text_description: "<p>This training is designed for people with no experience using the laser cutter who would like to operate the machine on a frequent basis. </p>", event_id: "", short_link: "https://www.meetup.com/Makers-of-HATCH-Makerspace/events/240004970/",user_id: u.id },
]
