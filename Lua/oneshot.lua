-- gimme gimme gimme
local addrs = require "addrs"
require "item values"
local inv = addrs.inventory
local masks = addrs.masks
local counts = addrs.counts
_=addrs.target_style and addrs.target_style(1)
--addrs.buttons_enabled   (0)
--addrs.infinite_sword(1)
addrs.zeroth_day    (1)
addrs.sot_count     (0)
_=addrs.bubble_timer and addrs.bubble_timer(0)
--
addrs.sword_shield  (0x23)
addrs.quiver_bag    (0x1B)
addrs.hearts        (16*20)
addrs.max_hearts    (16*20)
addrs.owls_hit      (0xFFFF)
addrs.map_visible   (0xFFFF)
addrs.map_visited   (0xFFFF)
addrs.wallet_size   (32)
addrs.rupees        (999)
addrs.banked_rupees (9999)
addrs.magic         (0x60)
--addrs.has_magic     (1)
addrs.has_normal_magic(1)
addrs.has_double_magic(1)
addrs.chateau_romani(8)
addrs.quest_items   (0x00FFFFFF)

addrs.lottery_code_1(1*10000 + 2*0x100 + 3)
addrs.lottery_code_2(4*10000 + 5*0x100 + 6)
addrs.lottery_code_3(7*10000 + 8*0x100 + 9)
addrs.spider_mask_color_1(0)
addrs.spider_mask_color_2(0)
addrs.spider_mask_color_3(0)
addrs.spider_mask_color_4(0)
addrs.spider_mask_color_5(0)
addrs.bombers_code_1(1)
addrs.bombers_code_2(2)
addrs.bombers_code_3(3)
addrs.bombers_code_4(4)
addrs.bombers_code_5(5)

addrs.items_wft(7)
addrs.items_sht(7)
addrs.items_gbt(7)
addrs.items_stt(7)
addrs.keys_wft(69)
addrs.keys_sht(69)
addrs.keys_gbt(69)
addrs.keys_stt(69)
addrs.fairies_wft(69)
addrs.fairies_sht(69)
addrs.fairies_gbt(69)
addrs.fairies_stt(69)

--inv.b_button        (0x4F) -- don't really need this
inv.ocarina         (0x00)
inv.bow             (0x01)
inv.fire_arrows     (0x02)
inv.ice_arrows      (0x03)
inv.light_arrows    (0x04)
inv.bombs           (0x06)
inv.bombchu         (0x07)
inv.deku_stick      (0x08)
inv.deku_nut        (0x09)
inv.magic_beans     (0x0A)
inv.powder_keg      (0x0C)
inv.pictograph      (0x0D)
inv.lens_of_truth   (0x0E)
inv.hookshot        (0x0F)
inv.fairy_sword     (0x10)
inv.bottle_1        (0x12)
inv.bottle_2        (0x1B)
inv.bottle_3        (0x1A)
inv.bottle_4        (0x18)
inv.bottle_5        (0x16)
inv.bottle_6        (0x25)
--addrs.event_1       (0x05)
--addrs.event_2       (0x0B)
--addrs.event_3       (0x11)

local mv = mask_values
if version == "JP10" or version == "JP11" then
    mv = mask_values_early
end

masks.postman       (mv.postman      )
masks.all_night     (mv.all_night    )
masks.blast         (mv.blast        )
masks.stone         (mv.stone        )
masks.great_fairy   (mv.great_fairy  )
masks.deku          (mv.deku         )
masks.keaton        (mv.keaton       )
masks.bremen        (mv.bremen       )
masks.bunny         (mv.bunny        )
masks.don_gero      (mv.don_gero     )
masks.scents        (mv.scents       )
masks.goron         (mv.goron        )
masks.romani        (mv.romani       )
masks.troupe_leader (mv.troupe_leader)
masks.kafei         (mv.kafei        )
masks.couples       (mv.couples      )
masks.truth         (mv.truth        )
masks.zora          (mv.zora         )
masks.kamaro        (mv.kamaro       )
masks.gibdo         (mv.gibdo        )
masks.garos         (mv.garos        )
masks.captains      (mv.captains     )
masks.giants        (mv.giants       )
masks.fierce_deity  (mv.fierce_deity )

counts.arrows       (69)
counts.bombs        (69)
counts.bombchu      (69)
counts.sticks       (69)
counts.nuts         (69)
counts.beans        (69)
counts.kegs         (69)
