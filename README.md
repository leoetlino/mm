# Majora's Mask resources

i like to muck around in this game's memory.

## spreadsheets

i put together some sheets to see if glitches could have desirable results.

* [Memory Addresses][gs_addrs]
  updates more frequently than [MM addrs.lua.][noice]

* [Get Item Manipulation][gim]  
  mzxrules did the original OoT one, i just jammed in MM's data for the item table and chest contents.
  *spoilers:* no desirable results besides light arrows, if it were even possible.
  potential crashes are not taken account for.

* [Entrance Data][ed]  
  this is a huge laggy mess that brings google docs to its knees.
  enter an "exit value" in hex and it'll figure out exactly where it takes you.
  the three known wrong warps are in bold.

[gs_addrs]: https://docs.google.com/spreadsheets/d/1HD8yZM1Jza3O8zO28n3k_Rjwdx58RSMA03915l51oDA/edit?usp=sharing
[noice]: /MM%20addrs.lua
[gim]: https://docs.google.com/spreadsheets/d/17LsLbF6aRePVRxisui8azPtDBfPmjugWIf91wPuXTsY
[ed]: https://docs.google.com/spreadsheets/d/1e9kDyAW0gxXHFWS-GNEtVIo-rp39wQJJOtf3B0ehhqY

## memory

link's struct begins at 801EF670 (US 1.0), and is some length long.
i just pretend it's 0x4000 in size, since that's the most you can jam in a save file.

two regions of 0x960 bytes are allocated for all the scene flags in the game.
the first (801EFAE0 US 1.0) is loaded from save files, the second (801F35D8 US 1.0) is used for in-game changes.
basically, edit the first for save hacking, and the second for in-game hacking.

[each area in the game][areas] uses 0x14 bytes of scene flags.
this implies there's 0x78 possible areas: 0x78\*0x14 = 0x960.

[areas]: https://docs.google.com/spreadsheets/d/1e9kDyAW0gxXHFWS-GNEtVIo-rp39wQJJOtf3B0ehhqY/edit#gid=2120585358

## save files

save files are just memory dumps of link's struct.
regular SoT saves are 0x2000 in size, owl saves are 0x4000.
owls use the extra space primarily (exclusively?) to store the pictograph picture.

note that some values don't get copied when reading/writing save files, even owl saves.

the game checks a checksum, and for the text "ZELDA3".
each slot has one backup copy of itself, though they don't seem to be used?
if a slot is corrupted, it will show up as empty in the menu.

the checksum is a 16-bit sum of all bytes up to that point, allowing overflows.
i've written [a checksum-fixing program][chksum] in python for bizhawk savefiles.

owl saves always have 0x24 added to their checksum for some reason.

[chksum]: /chksum.py

save files are ordered as such, offset from the first:

* 0x00000 - slot 1
* 0x02000 - slot 1 backup
* 0x04000 - slot 2
* 0x06000 - slot 2 backup
* 0x08000 - slot 1 (owl)
* 0x0C000 - slot 1 backup (owl)
* 0x10000 - slot 2 (owl)
* 0x14000 - slot 2 backup (owl)

bizhawk save files, at the time of writing, have the first file offset to 0x20800.
also, their byte order is wrong.

here's my usual process for hacking on save files:
```
alias revend='objcopy -I binary -O binary --reverse-bytes=4'
s="Legend of Zelda, The - Majora's Mask (USA).SaveRAM"
x=mm-save.xxd
revend "$s"
xxd "$s" > $x
$EDITOR $x
xxd -r $x > "$s"
./chksum.py $s
revend "$s"
```

## save files (for download)

because no one likes first cycle.

sometime i'll bother checking what the bombers/lottery codes are for these.

* [Bizhawk US 1.0 race file](https://dl.dropboxusercontent.com/u/9602837/temp/MM%20US%20Race%20File%20for%20Bizhawk.zip )
* [mupen64plus US 1.0 race file](https://dl.dropboxusercontent.com/u/9602837/temp/Legend%20of%20Zelda%2C%20The%20-%20Majora%27s%20Mask%20%28U%29%20%5B%21%5D.zip)
* [Bizhawk US 1.0 tampered](https://dl.dropboxusercontent.com/u/9602837/temp/bizhawk%20saves.zip )  
  one slot with a bunch of 00s, another with a bunch of FFs.

## bitfields

### link's flags

here's [an incomplete document on some of link's bitfields][linkfields] for JP 1.0.

[linkfields]: /mm-bitflags.txt 
