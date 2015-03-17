-- TODO: work out "Blue Target Spot" versus "Blue Tatl Target"
-- TODO: work out Thing (Place) versus Place Thing
-- TODO: work out & versus /
local unset="unset"
return {
    [0x000]="Link",
    [0x001]="Wall Punch / Ground Pound Effect",
    [0x002]="Store Item",
    [0x003]="?",
    [0x004]="Flame Prop", -- also ice?
    [0x005]="Wooden Door",
    [0x006]="Treasure Chest",
    [0x007]="Gekko (Miniboss)",
    [0x008]="Octorok",
    [0x009]="Bomb",
    [0x00A]="Wallmaster",
    [0x00B]="Dodongo",
    [0x00C]="Keese",
    [0x00D]="Epona (Cutscene)",
    [0x00E]="Collectables",
    [0x00F]="Arrow Details", -- arrows, steam, flames... deku bubble?
    [0x010]="Tatl",
    [0x011]="Cucco",
    [0x012]="Tektite",
    [0x013]=unset,
    [0x014]="Peahat",
    [0x015]="Butterfly",
    [0x016]="Bug",
    [0x017]="Fish",
    [0x018]="Room Transition Plane",
    [0x019]="Dinolfos",
    [0x01A]="Flagpole",
    [0x01B]="? Child Zelda",
    [0x01C]="En_Viewer", -- some in Snowhead Temple, one in Woodfall Temple
    [0x01D]="Shabom",
    [0x01E]="Dungeon Door", -- Studded Lifting Door
    [0x01F]=unset,
    [0x020]="Fin Boomerang",
    [0x021]="Emptiness Statue",
    [0x022]="Frog",
    [0x023]=unset,
    [0x024]="Skulltula",
    [0x025]=unset,
    [0x026]="Directional Sign",
    [0x027]="? STT Flip",
    [0x028]="Environmental Noise",
    [0x029]=unset,
    [0x02A]="Trading Post Owner", -- Storefront? also bomb shop owner
    [0x02B]=unset,
    [0x02C]=unset,
    [0x02D]="Death Armos",
    [0x02E]=unset,
    [0x02F]="Bomb Flower",
    [0x030]=unset,
    [0x031]=unset,
    [0x032]="Armos",
    [0x033]="Deku Baba",
    [0x034]="Deku Nuts",
    [0x035]="Spin Attack/Sword Beam",
    [0x036]="?", -- Blacksmith Smoke, also in goron village and field skullkid cutscene -- Barn Roof -- a lot of things apparently
    [0x037]=unset,
    [0x038]="Blue Warp",
    [0x039]="Torch",
    [0x03A]="Heart Container",
    [0x03B]="Mad Scrub",
    [0x03C]="Red Bubble",
    [0x03D]="Hookshot",
    [0x03E]="Blue Bubble",
    [0x03F]="Fountain Water",
    [0x040]=unset,
    [0x041]="Foliage",
    [0x042]=unset,
    [0x043]="Gomess",
    [0x044]="Gomess Bats",
    [0x045]=unset,
    [0x046]=unset,
    [0x047]="Beamos",
    [0x048]="Demo_Effect", -- Sun Block disappearing effect?
    [0x049]="Environment Sparkles", -- Various Environment Effects
    [0x04A]="Floormaster",
    [0x04B]=unset,
    [0x04C]="Redead / Gibdo",
    [0x04D]="Grey Stone Elevator",
    [0x04E]="Golden Gauntlets Rock",
    [0x04F]="Group of Bugs/Fish/Butterflies",
    [0x050]="Skullwalltula",
    [0x051]="?fvo3", -- seen: frozen mountain village, field skullkid cutscene
    [0x052]=unset,
    [0x053]=unset,
    [0x054]="Child Epona",
    [0x055]="Grotto Hole",
    [0x056]=unset,
    [0x057]=unset,
    [0x058]=unset,
    [0x059]=unset,
    [0x05A]=unset,
    [0x05B]="En_Encount1",
    [0x05C]="Opening Chest Effect",
    [0x05D]=unset,
    [0x05E]=unset,
    [0x05F]="Majora Balloon (Observatory)",
    [0x060]="Light Rock",
    [0x061]="Twisting Corridor",
    [0x062]="Mirror Shield Face / Light Ray",
    [0x063]=unset,
    [0x064]="Shellblade",
    [0x065]="Mad Jelly",
    [0x066]="Wilted/Mini Deku Baba",
    [0x067]="Gorman Brothers",
    [0x068]=unset,
    [0x069]="Ruto",
    [0x06A]="Bombchu (active)",
    [0x06B]="? Arrow / Posts / Splatter",
    [0x06C]="Like Like",
    [0x06D]=unset,
    [0x06E]=unset,
    [0x06F]=unset,
    [0x070]=unset,
    [0x071]=unset,
    [0x072]=unset,
    [0x073]="En_Fr (Cutscene)",
    [0x074]=unset,
    [0x075]=unset,
    [0x076]=unset,
    [0x077]=unset,
    [0x078]=unset,
    [0x079]="Fishing Pond Owner",
    [0x07A]="Pushable Block", -- snowhead temple
    [0x07B]="Charging Spin Attack Particles",
    [0x07C]="Horse Jumping Fence", -- also Epona path nodes?
    [0x07D]="Fire Arrow",
    [0x07E]="Ice Arrow",
    [0x07F]="Light Arrow",
    [0x080]="Items Misc.",
    [0x081]="Small Wooden Crate",
    [0x082]="Pot",
    [0x083]=unset,
    [0x084]="Iron Knuckle",
    [0x085]=unset,
    [0x086]=unset,
    [0x087]=unset,
    [0x088]=unset,
    [0x089]="Demo_Shd",
    [0x08A]="Deku Servant",
    [0x08B]="Tatl Message Prompt (b)",
    [0x08C]="En_Honotrap",
    [0x08D]="Possessed Pot",
    [0x08E]="Sparkle",
    [0x08F]="Freezard",
    [0x090]="Grass",
    [0x091]="Floating Bean Plant",
    [0x092]="Bombable Rock",
    [0x093]="Floor Switch",
    [0x094]=unset,
    [0x095]="Brown Elevator (Dampé)",
    [0x096]="Stone Hookshot Pillar",
    [0x097]="En_Okarina_Tag",
    [0x098]=unset,
    [0x099]="Rolling Boulder/Snowball",
    [0x09A]=unset,
    [0x09B]=unset,
    [0x09C]="Carpenter",
    [0x09D]="Cucco Chick",
    [0x09E]="Item_Inbox", -- lock-on-able
    [0x09F]="Gerudo Lieutenant",
    [0x0A0]="Pushable Block Stop Effect", -- snowhead temple
    [0x0A1]="Dynamic Shadow",
    [0x0A2]="Explosion Smoke",
    [0x0A3]=unset,
    [0x0A4]="Gorman",
    [0x0A5]="Bean Seller",
    [0x0A6]="Grog",
    [0x0A7]="Swamp Tour Boat",
    [0x0A8]="Sign", -- Square Signpost
    [0x0A9]=unset,
    [0x0AA]="Angry Cucco",
    [0x0AB]=unset,
    [0x0AC]=unset,
    [0x0AD]=unset,
    [0x0AE]="Marine Researcher",
    [0x0AF]="Kaepora Gaebora",
    [0x0B0]="Rock",
    [0x0B1]="Graveyard Flower",
    [0x0B2]="Sun Switch",
    [0x0B3]="Rock/Grass Cluster",
    [0x0B4]=unset,
    [0x0B5]="Honey & Darling (a)",
    [0x0B6]=unset,
    [0x0B7]=unset,
    [0x0B8]="Water Spout",
    [0x0B9]="Rock Sirloin",
    [0x0BA]=unset,
    [0x0BB]=unset,
    [0x0BC]="? En_Weather_Tag", -- seen: anywhere frozen mountain village, atop clock tower
    [0x0BD]="Part-Timer", -- Kakariko roof guy
    [0x0BE]=unset,
    [0x0BF]="Moon child",
    [0x0C0]=unset,
    [0x0C1]=unset,
    [0x0C2]=unset,
    [0x0C3]=unset,
    [0x0C4]="Song of Storms Effect (a)",
    [0x0C5]="Title Logo",
    [0x0C6]="Green Tatl Target", -- pirate boards, mirrors
    [0x0C7]="Floating Stone Platform",
    [0x0C8]=unset,
    [0x0C9]=unset,
    [0x0CA]="Scarecrow", -- Pierre
    [0x0CB]="? Make Push & Pull",
    [0x0CC]="Sun's Song Effect",
    [0x0CD]=unset,
    [0x0CE]="? Treasure Chest",
    [0x0CF]=unset,
    [0x0D0]="? Shot_Sun",
    [0x0D1]=unset,
    [0x0D2]=unset,
    [0x0D3]="On-screen Timer",
    [0x0D4]="Cursed Skulltula Man",
    [0x0D5]=unset,
    [0x0D6]="Song of Time Effect", -- Zelda's Lullaby as well
    [0x0D7]="Song of Storms Effect (b)",
    [0x0D8]="? Obj_Demo",
    [0x0D9]="Mad Jelly - Jelly Droplets", -- TODO: verify
    [0x0DA]="Deku Nut Projectile",
    [0x0DB]=unset,
    [0x0DC]=unset,
    [0x0DD]=unset,
    [0x0DE]=unset,
    [0x0DF]="Epona's Song Effect",
    [0x0E0]="Saria's Song Effect",
    [0x0E1]=unset,
    [0x0E2]="Dog",
    [0x0E3]="Gold Skulltula Token",
    [0x0E4]="Honeycomb",
    [0x0E5]="Large Wooden Crate",
    [0x0E6]=unset,
    [0x0E7]="Blue Tatl Target", -- Related to En_Hs Grog?
    [0x0E8]="Rupee Cluster",
    [0x0E9]="Honey & Darling (b)",
    [0x0EA]=unset,
    [0x0EB]=unset,
    [0x0EC]="Wolfos",
    [0x0ED]="Stalchild",
    [0x0EE]=unset,
    [0x0EF]="Gossip Stone",
    [0x0F0]="Ambient Noises",
    [0x0F1]="Guay",
    [0x0F2]=unset,
    [0x0F3]="Cow",
    [0x0F4]=unset,
    [0x0F5]=unset,
    [0x0F6]="Scarecrow's Song Effect",
    [0x0F7]=unset,
    [0x0F8]="Walking Zora", -- Zora
    [0x0F9]=unset,
    [0x0FA]="Aveil (Gerudo)",
    [0x0FB]=unset,
    [0x0FC]="Bronze Boulder",
    [0x0FD]="? Crash",
    [0x0FE]="Postman's Letter", -- to self
    [0x0FF]=unset,
    [0x100]="Dungeon Spiral Stairs",
    [0x101]=unset,
    [0x102]="Pushable Majora Block",
    [0x103]="Blade Trap",
    [0x104]=unset,
    [0x105]="Armos Statue",
    [0x106]="Green Bumper",
    [0x107]=unset,
    [0x108]=unset,
    [0x109]="Dragonfly",
    [0x10A]=unset,
    [0x10B]="? Obj_Grass", -- probably just some helper code
    [0x10C]="? Obj_Grass_Carry", -- two per area with grass, one follows link when carrying grass
    [0x10D]="Grass Cluster", -- used for loading
    [0x10E]=unset,
    [0x10F]=unset,
    [0x110]="Proximity Fire Wall (a)",
    [0x111]="? Crash",
    [0x112]="Circle of Light", -- TODO: verify
    [0x113]="Garo Master",
    [0x114]="Collapsing Stone Bridge",
    [0x115]="Windows & Skeletons", -- Igos du Ikana. TODO: verify
    [0x116]="Warp to Start", -- moon challenges?
    [0x117]="Dog Lady (Mamamu Yan)",
    [0x118]="Blue Target Spot (a)",
    [0x119]="Blue Target Spot (b)",
    [0x11A]="Blue Target Spot (c)",
    [0x11B]="? Keeta Encounter Script", -- rename
    [0x11C]="? Bomber", -- seen: first part of first time playing SoT cutscene (TODO: wtf, verify?)
    [0x11D]="Swamp Shooting Gallery Manager",
    [0x11E]=unset,
    [0x11F]="Icicle",
    [0x120]="Shooting Gallery Guay",
    [0x121]="Blue Target Spot (d)",
    [0x122]="? nothing",
    [0x123]="? nothing",
    [0x124]="Shikashi",
    [0x125]="Spiderweb",
    [0x126]=unset,
    [0x127]=unset,
    [0x128]="? En_Mt_tag", -- used in Goron Racetrack?
    [0x129]="Odolwa",
    [0x12A]="Twinmold",
    [0x12B]="Gyorg",
    [0x12C]="Wart",
    [0x12D]="Bio Deku Baba",
    [0x12E]="? Igos du Ikana", -- TODO: verify
    [0x12F]="Majora",
    [0x130]="Great Fairy",
    [0x131]=unset,
    [0x132]="Blue Target Spot (e)",
    [0x133]=unset,
    [0x134]=unset,
    [0x135]="Bomb Shop Owner", -- TODO: verify
    [0x136]=unset,
    [0x137]=unset,
    [0x138]="Goron",
    [0x139]=unset,
    [0x13A]="Carnivorous Lilypad",
    [0x13B]="Smoke (STT)", -- Early Stone Tower Temple
    [0x13C]="Elevator (Woodfall)",
    [0x13D]="Wooden Flower", -- Woodfall Temple
    [0x13E]="Potted Plant",
    [0x13F]="Horizontal Spike Log",
    [0x140]="Remains",
    [0x141]="Shooting Gallery Wolfos",
    [0x142]="Pushable Ice Block",
    [0x143]="Frozen Enemy Ice Block",
    [0x144]="Snapper (Miniboss)", -- Gekko & Snapper
    [0x145]="Shooting Gallery Deku Scrub",
    [0x146]="Tatl Info Spot (a)", -- Tatl Message - Pops Up
    [0x147]="Frog",
    [0x148]="Tree Trunk (Cutscene)",
    [0x149]="? Crash",
    [0x14A]="Chuchu",
    [0x14B]="Desbreko",
    [0x14C]="Clocktower Spotlight", -- other things as well, or..?
    [0x14D]="2D Chimney Backdrop",
    [0x14E]="Inn Bell",
    [0x14F]="Shooting Gallery Octorok",
    [0x150]=unset,
    [0x151]="Bank Shutter", -- hi keeta
    [0x152]="Child Zelda",
    [0x153]="Stray Fairy Group",
    [0x154]="? nothing", -- opening area? (first time SOT cutscene)
    [0x155]="Nejiron",
    [0x156]="Vertical Spike Log",
    [0x157]="Smoke (Ranch)",
    [0x158]="?lcsht", -- seen: lens climb, middle sht room
    [0x159]="Kafei",
    [0x15A]="Three-Day Timer", -- in loading-zone positions for some reason
    [0x15B]="Bad Bat",
    [0x15C]="Song Pedestal / Mikau's Grave",
    [0x15D]="Wizzrobe",
    [0x15E]="Warp Platform (Wizzrobe)",
    [0x15F]="Fire Attack (Wizzrobe)",
    [0x160]="Camera Focus (Statue Spawning Effect)",
    [0x161]="Beam of Light (Elegy Statue)", -- TODO: verify
    [0x162]="Circle of Flames",
    [0x163]="Ladder",
    [0x164]="Boe",
    [0x165]="? Demo_Getitem",
    [0x166]=unset,
    [0x167]="Deku Nut Projectile",
    [0x168]="Boat Cruise Closed (Target)",
    [0x169]="Mad Scrub (cutscene)",
    [0x16A]="Deku King",
    [0x16B]=unset,
    [0x16C]="Tall Spiked Iron Fence",
    [0x16D]="Boulder Blocking Racetrack", -- also ranch?
    [0x16E]="Yellow Target Spot",
    [0x16F]="Real Bombchu",
    [0x170]="Water Droplets", -- or falling lava blocks in STT
    [0x171]="Bush (Keaton)",
    [0x172]="Proximity Fire Wall (b)",
    [0x173]=unset,
    [0x174]="Great Bay Temple Gears",
    [0x175]="Healing Beam of Light", -- reword?
    [0x176]="Tingle",
    [0x177]="Bank Teller",
    [0x178]="Telescope (Pirate's)",
    [0x179]="Drifting Ice Platform",
    [0x17A]="Deku Palace Guard",
    [0x17B]="3 Bugs",
    [0x17C]="Moon / Moon Stuff",
    [0x17D]="Postman (Home)",
    [0x17E]="Deku Shrine Closing Door",
    [0x17F]="Deku Butler",
    [0x180]="Skullfish",
    [0x181]="Skullfish (Defeated)",
    [0x182]="? Garo Master Dupe", -- spinout: Makes you walk away
    [0x183]="Deku Flower",
    [0x184]="Eyegore",
    [0x185]="Spiked Bomb Trap",
    [0x186]="? Obj_Purify", -- affects bottled water maybe?
    [0x187]="Koume on Broom", -- TODO: verify
    [0x188]="Kotake",
    [0x189]=unset,
    [0x18A]=unset,
    [0x18B]="? En_Test5", -- southern swamp region
    [0x18C]="SoT Effect Circles?", -- seen: SoT cutscene -- spinout: Night/Day Change
    [0x18D]="Beaver Brothers",
    [0x18E]="Rubble (Eyegore)",
    [0x18F]="Central Pillar (Snowhead)", -- TODO: verify
    [0x190]="Opening Cutscene Object", -- spinout: Big square of grass
    [0x191]="Skullkid", -- cutscene?
    [0x192]="Tatl / Tael (Cutscene)",
    [0x193]="Woodfall Temple Rises (Cutscene)",
    [0x194]="Clock Tower Roof", -- TODO: verify
    [0x195]="Happy Mask Salesman (Cutscene)",
    [0x196]="Tatl / Tael (Cutscene) (Early)",
    [0x197]="Mask (Cutscene)",
    [0x198]="Mountain Village Thawing (Cutscene)", -- TODO: verify
    [0x199]="Indigo-Go's Milk Bar Stage (Cutscene)",
    [0x19A]="Turtle (Cutscene)",
    [0x19B]="Giant Bee (Cutscene)",
    [0x19C]="Clock / Light Beam",
    [0x19D]=unset,
    [0x19E]="Monkey",
    [0x19F]="Eyegore Block", -- unused
    [0x1A0]="Deku Palance Entrance Guard",
    [0x1A1]="Bombable Wall (Snowhead)",
    [0x1A2]="Clock Tower Door",
    [0x1A3]="Punchable Central Pole Inserts (Snowhead)", -- rename..
    [0x1A4]="Romani",
    [0x1A5]="Collectable Ring (Beaver Race)",
    [0x1A6]="Poe Balloon (Ranch)",
    [0x1A7]="? En_Door_Etc",
    [0x1A8]="Big Octo",
    [0x1A9]="Ice Platform (Ice Arrows)",
    [0x1AA]="Elevator Triforce Texture",
    [0x1AB]="? En_Time_Tag", -- rug in inn?
    [0x1AC]="Wooden Deku Door",
    [0x1AD]="Reflectable Spotlight",
    [0x1AE]="Platform (H&D)",
    [0x1AF]="Pouring Water (Bottle)",
    [0x1B0]="Stray Fairy",
    [0x1B1]="Stray Fairy in Bubble",
    [0x1B2]=unset,
    [0x1B3]="Target (H&D)",
    [0x1B4]="Basket (H&D)",
    [0x1B5]="Happy Mask Salesman",
    [0x1B6]="Watermill", -- or is the correct term "gear" ?
    [0x1B7]="Kotake on Broom",
    [0x1B8]="Top Clock Tower Door",
    [0x1B9]="Lilypad",
    [0x1BA]="Snapper",
    [0x1BB]="Treasure Chest Game Wall",
    [0x1BC]="Water (H&D)",
    [0x1BD]="Business Scrub Flower", -- Business Scrub (Flying)
    [0x1BE]="Deku Jail Ivy",
    [0x1BF]=unset,
    [0x1C0]="Invisible Ice Platform",
    [0x1C1]="Treasure Chest Game Girl",
    [0x1C2]="Fisherman (Greay Bay)",
    [0x1C3]="Early Potion Shop Owner", -- Ocarina of Time -- TODO: it's not unused apparently, so what is it?
    [0x1C4]="Curiosity Shop Owner",
    [0x1C5]="Swamp Tourist Center Guide", -- spoilers: Tingle's dad
    [0x1C6]=unset,
    [0x1C7]="Town Soldier (Guarding)",
    [0x1C8]="Ice Block",
    [0x1C9]="Scrub Playground Deku",
    [0x1CA]="Dampé",
    [0x1CB]=unset,
    [0x1CC]="West Clock Town Stairs",
    [0x1CD]="Scrub Playground Elevator",
    [0x1CE]="Song of Soaring Cutscene",
    [0x1CF]="Sun Block",
    [0x1D0]="Spotlight",
    [0x1D1]="Dexihand",
    [0x1D2]="Large Rupee (a)", -- TODO: verify unused?
    [0x1D3]="Elevator & Stairs (Dampé's)",
    [0x1D4]="Snowy Tree",
    [0x1D5]="Postman (Town)",
    [0x1D6]="Termina Field Song Wall",
    [0x1D7]="? Elf_Msg4",
    [0x1D8]="? Elf_Msg5", -- goron roll spot in SHT?
    [0x1D9]="Piece of Heart", -- unused?
    [0x1DA]="Gibdo (Well)",
    [0x1DB]="Giant",
    [0x1DC]="Large Snowball",
    [0x1DD]="Goht",
    [0x1DE]="Ghost Hut Owner",
    [0x1DF]="? Music Monkey", -- spinout: Invisible speaking spot
    [0x1E0]="Goron Shrine Gate",
    [0x1E1]="? En_Tag_Obj",
    [0x1E2]="Dampé's House Facade", -- in Stone Tower too?
    [0x1E3]="Gravestone",
    [0x1E4]="Goron Pound Switch",
    [0x1E5]=unset,
    [0x1E6]="Eeno",
    [0x1E7]="? TG_Sw",
    [0x1E8]="Poe Sisters",
    [0x1E9]="Hiploop",
    [0x1EA]="Kicked Up Rocks (Goht)",
    [0x1EB]="Fireworks", -- TODO: verify
    [0x1EC]="? Obj_Dowsing",
    [0x1ED]="Wind Funnel",
    [0x1EE]="Racing Dog",
    [0x1EF]="Swordsman (Dojo)",
    [0x1F0]="Gatepost (Keeta)",
    [0x1F1]="Laboratory Fish",
    [0x1F2]="Postbox",
    [0x1F3]="Poe",
    [0x1F4]="Tent-shaped Spider Web",
    [0x1F5]="Zora Egg",
    [0x1F6]="Zubora (Blacksmith)",
    [0x1F7]="Darmani (Grave)",
    [0x1F8]="Practice Log (Dojo)",
    [0x1F9]="Small Snowball",
    [0x1FA]="Darmani",
    [0x1FB]="Darmani's Gravestone",
    [0x1FC]="Deku Princess",
    [0x1FD]="Biggoron",
    [0x1FE]="Hot Spring Water",
    [0x1FF]="Gabora (Assistant)",
    [0x200]="Invader Poe", -- aliens?
    [0x201]="Goron Elder's Son",
    [0x202]="Anju",
    [0x203]=unset,
    [0x204]="Giant Bee",
    [0x205]="Seahorse",
    [0x206]="Deep Python",
    [0x207]="Gong (Dojo)",
    [0x208]="Big Poe",
    [0x209]="Board (Dojo)",
    [0x20A]="Cow Figurine",
    [0x20B]="Apprentice Target",
    [0x20C]="? Deep Sea - Wall",
    [0x20D]="Flat's Tomb Curtain",
    [0x20E]="Bombable Wall (Oceanside)",
    [0x20F]="Fireplace Grate (Oceanside)",
    [0x210]="Skullkid Painting (Oceanside)",
    [0x211]="Drawers / Bookshelf (Oceanside)",
    [0x212]="Circle of Stalchildren",
    [0x213]="Goron Elder",
    [0x214]="Koume on Broom",
    [0x215]="Cremia's Cart",
    [0x216]="Leever",
    [0x217]="Milk Bar Chair",
    [0x218]="Rotating Room Pushblock (STT)",
    [0x219]="Mirror (STT)",
    [0x21A]="Rotating Room (STT)",
    [0x21B]="See-Saw (GBT)",
    [0x21C]="Water Spout (GBT)",
    [0x21D]="Gerudo Pirate",
    [0x21E]="Pirate Guard", -- or is Gerudo Guard better?
    [0x21F]="Romani",
    [0x220]="Cremia",
    [0x221]="Carnival Platform", -- "String of Flags"
    [0x222]="Elevator (GBT)",
    [0x223]="Owl Statue",
    [0x224]="Mikau",
    [0x225]="Rotating Platform (Trial)",
    [0x226]="Goron Elder's Drum",
    [0x227]="Twinmold's Lair",
    [0x228]="Zora (Land)",
    [0x229]="Three-branched Tree",
    [0x22A]="Mesh Elevator", -- ??
    [0x22B]="Pirates' Interior Door",
    [0x22C]="Pirate Boat",
    [0x22D]="Barrel", -- also pirate boards
    [0x22E]="Switch-Activated Geyser", -- TODO: verify
    [0x22F]="Boat Cruise Target", -- koume
    [0x230]="Mirror Shield Light Ray",
    [0x231]="Japas (Bassist)",
    [0x232]="? Elf_Msg6", -- SCT
    [0x233]="Sakon's Hideout Object", -- I guess
    [0x234]="Toto (Manager)",
    [0x235]="Circle Gibdo",
    [0x236]="Bomb Shop Owner's Mom",
    [0x237]="Sakon",
    [0x238]="Tijo (Drummer)",
    [0x239]="Lottery Shop Kiosk",
    [0x23A]="Don Gero Goron",
    [0x23B]="Mushroom Scent",
    [0x23C]="Palm Tree",
    [0x23D]="Moths (WFT)",
    [0x23E]="Wart Bubble", -- TODO: verify
    [0x23F]="Gyorg's Fish", -- TODO: verify
    [0x240]="Goron Chandelier",
    [0x241]="Evan (Pianist)",
    [0x242]="Goron",
    [0x243]="Anju's Grandmother",
    [0x244]="Juggler",
    [0x245]="Monkey-Faced Elegy Block",
    [0x246]="Elegy of Emptiness Switch",
    [0x247]="Composer Brother",
    [0x248]="Guru-Guru (Music Box)",
    [0x249]="Sonata of Awakening Effect",
    [0x24A]="Shiro (Soldier)",
    [0x24B]="Song of Soaring Effect",
    [0x24C]="Business Scrub (Telescope)",
    [0x24D]="Guay (Telescope)",
    [0x24E]="Song of Healing Effect",
    [0x24F]="Turtle Tsunami",
    [0x250]="Pamela's Father (Normal)",
    [0x251]="Pamela's Father (Gibdo)",
    [0x252]="Lulu (Vocalist)",
    [0x253]="Madame Dotour",
    [0x254]="Music Box House Cupboard Door",
    [0x255]="Bombable Floor / Wall (STT)",
    [0x256]="Light Ray (STT)", -- TODO: verify?
    [0x257]="Lattice Door (STT)",
    [0x258]="Bombable Wall (Grave)",
    [0x259]="Flat's Tomb",
    [0x25A]="Large Rotating Rupee",
    [0x25B]="Sharp's Cave",
    [0x25C]="Ikana Waterwheel", -- used for other ikana objects too?
    [0x25D]="Pamela",
    [0x25E]="Ikana Tree Stump",
    [0x25F]="Sleeping Deku Scrub",
    [0x260]="Swimming Zora",
    [0x261]="Sign / Checkable Spot",
    [0x262]="Madame Aroma",
    [0x263]="Mr. Barten",
    [0x264]="Bomb Shop Bag",
    [0x265]="Clock Town Props",
    [0x266]="Circling Guay",
    [0x267]="Seagull",
    [0x268]="? En_Tanron5", -- "Related to object_Boss_02, Twinmold."
    [0x269]="Flock of Giant Bees",
    [0x26A]="Carpenter with Pickaxe",
    [0x26B]="Mutoh", -- who?
    [0x26C]="Captain Viscen", -- who??
    [0x26D]="Mayor's House Soldier",
    [0x26E]="Soldier (Cutscene)",
    [0x26F]="Mayor Dotour",
    [0x270]="Laundry Pool Sign & Bell",
    [0x271]="Cremia & Romani's Dinner", -- 6 PM
    [0x272]="Moon Crashing Into Clock Town Effect", --  TODO: verify
    [0x273]="Ikana Castle Pillar Segments",
    [0x274]="Business Scrub",
    [0x275]="?sotct3", -- skull kid glowing eyes perhaps?
    [0x276]="Link-goro",
    [0x277]="Racetrack Goron",
    [0x278]="Igos du Ikana's Henchman", -- TODO: verify
    [0x279]="? Skulltula House 2", -- loaded in termina field
    [0x27A]="Kamaro",
    [0x27B]="Rosa Sister",
    [0x27C]="Rupee",
    [0x27D]="Hand in Toilet",
    [0x27E]="Bomber (Jim) (a)",
    [0x27F]="Bomber (Jim) (b)",
    [0x280]="Bomber (Generic)",
    [0x281]="Bomber (Guard)",
    [0x282]="Outdoor Majora Balloon",
    [0x283]="Moon's Tear",
    [0x284]="? Obj_Mu_Pict", -- pictobox?
    [0x285]="Inner Ikana Object", -- ?
    [0x286]="Blue Spotlight Effect",
    [0x287]="Gorman Track Buildings",
    [0x288]="Barn Roof",
    [0x289]="Deku Butler's Son",
    [0x28A]="Metal Portcullis", -- how is this is one of the few words spinout _did_ know?
    [0x28B]="Chateau Romani Delivery Bottle",
    [0x28C]="Keaton",
    [0x28D]="Bombable Wall (Hideout)",
    [0x28E]="Hot Checkered Ceiling", -- spinout: floor
    [0x28F]="Captain Keeta",
    [0x290]="Mayor's Receptionist",
    [0x291]="Takkuri",
    [0x292]="Jumping Game Fisherman",
    [0x293]="Jumping Game Torch",
    [0x294]="Inn Window",
    [0x295]="Ikana Curse Lifting Effect",
    [0x296]="Moon (Cutscene)",
    [0x297]="Hookshot Pillar",
    [0x298]="Bombable Wall (Trial)",
    [0x299]="Anju in Wedding Dress",
    [0x29A]="Invader Poe (Cutscene)", -- aliens.
    [0x29B]="Elevator (Shrine) (SHT)",
    [0x29C]="Falling Moon",
    [0x29D]="Madame Aroma (Cutscene)",
    [0x29E]="Blue Target Spot",
    [0x29F]="Anju's Mother (Cutscene)",
    [0x2A0]="Anju's Grandmother (Cutscene)",
    [0x2A1]="Wedding Dress Mannequin",
    [0x2A2]="Mayor Dotour (Cutscene)",
    [0x2A3]="Tingle (Cutscene)",
    [0x2A4]="Confetti (Cutscene)",
    [0x2A5]="Stalchild (Oceanside)",
    [0x2A6]="Hole in Inn Wall",
    [0x2A7]="Brown Bird",
    [0x2A8]="Vissen (Cutscene)",
    [0x2A9]="Mutoh (Cutscene)",
    [0x2AA]="Cheering Soldier (Cutscene)",
    [0x2AB]="Bedazzled Carpenter (Cutscene)",
    [0x2AC]="? Crash (Cutscene)",
    [0x2AD]="Blue Target Spot",
    [0x2AE]="Magic Bean, etc.", -- TODO: verify and move to sheet
    [0x2AF]="Invisible Rupee",
    [0x2B0]="Epilogue Object",
    [0x2B1]="Bomb Shop Owner (Cutscene)",
}
