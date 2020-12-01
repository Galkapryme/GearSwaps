-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','TA','Acc','FullAcc','Fodder','PDT')
    state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','LowBuff')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	
	gear.stp_jse_back = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Evasion+10','"Store TP"+10','"Regen"+5',}}
	gear.wsd_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Taming Sari"}
	sets.weapons.LowBuff = {main="Aeneas",sub="Blurred Knife +1"}
	
	Herc = {}
	HercFeet = {}
    HercHead = {}
	HercGloves = {}
    HercLegs = {}
    HercVest = {}
	
	HercHead.MAB = { name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','AGI+12','"Mag.Atk.Bns."+9',}}
	HercHead.MWSD = { name="Herculean Helm", augments={'Mag. Acc.+18','Weapon skill damage +5%','"Mag.Atk.Bns."+13',}}
	HercHead.TH = { name="Herculean Helm", augments={'Accuracy+4 Attack+4','Attack+11','"Treasure Hunter"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
    HercVest.TH = { name="Herculean Vest", augments={'Magic dmg. taken -2%','Accuracy+5','"Treasure Hunter"+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}
    HercGloves.MAB = { name="Herculean Gloves", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +3%','Mag. Acc.+13',}}
	HercGloves.TA = { name="Herculean Gloves", augments={'Accuracy+25','"Triple Atk."+4','DEX+2','Attack+9',}}
    HercLegs.MAB = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+16','"Conserve MP"+2','Accuracy+4 Attack+4','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	HercLegs.TH = { name="Herculean Trousers", augments={'INT+8','Attack+3','"Treasure Hunter"+1','Accuracy+6 Attack+6','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
    HercFeet.MAB = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+27','STR+6','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
	HercFeet.FC = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+5','"Fast Cast"+6','STR+9','Mag. Acc.+6',}}   

	sets.TreasureHunter = {head=HercHead.TH,body=HercVest.TH,legs=HercLegs.TH,waist="Chaac Belt"}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}
	sets.precast.JA['Trance'] = {head="Horos Tiara +3"}
	sets.precast.JA['Fan Dance'] = {hands="Horos Bangles +3"}
	

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
	ammo="Yamarang", -- 5%
    head="Horos Tiara +3", -- 15%
	neck="Etoile Gorget +2", -- 10%
	ear1="Enchntr. Earring +1",
	ear2="Thureous Earring",
    body="Maxixi Casaque +1", -- 15%/Rec. 6%
	hands="Horos Bangles +3",
	ring1="Regal Ring",
	ring2="Titan Ring +1",
    back=gear.stp_jse_back,
	waist="Chaac Belt",
	legs="Dashing Subligar", -- 10%
	feet="Horos T. Shoes +3",
	}
		
	sets.Self_Waltz = set_combine(sets.precast.Waltz, {ring2="Asklepian Ring",head="Mummu Bonnet +2"})
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {back=gear.stp_jse_back,head="Maxixi Tiara +1"}

    sets.precast.Jig = {legs="Horos Tights +3",feet="Maxixi Toe Shoes +1"}
	
    sets.precast.Step = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Etoile Gorget +2",ear1="Telos Earring",ear2="Mache Earring +1",
        body="Malignance Tabard",hands="Maxixi Bangles +1",ring1="Regal Ring",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.Step['Feather Step'] = set_combine(sets.precast.Step, {feet="Maculele Toeshoes"})
		
    sets.Enmity = {ammo="Yamarang",
    head="Turms Cap +1",
    body="Emet Harness +1",
    hands={ name="Horos Bangles +3", augments={'Enhances "Fan Dance" effect',}},
    legs="Turms Subligar +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Kasiri Belt",
    left_ear="Impreg. Earring",
    right_ear="Friomisi Earring",
    left_ring="Provocare Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
		
    sets.precast.JA['Provoke'] = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Etoile Gorget +2",ear1="Hermetic Earring",ear2="Enchntr. Earring +1",
        body="Horos Casaque +3",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.stp_jse_back,waist="Skrymir Cord +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = set_combine(sets.precast.Flourish1['Violent Flourish'], {body="Malignance Tabard"})

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle",hands="Maculele Bangles +1"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Maculele Casaque +1"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +1"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
		head=HercHead.MAB,neck="Etoile Gorget +2",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		legs="Rawhide Trousers",feet=HercFeet.FC}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Aurgelmir Orb +1",
        head="Malignance Chapeau",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia belt",legs="Horos Tights +3",feet="Malignance Boots"}

	sets.precast.WS.SomeAcc = {}
	sets.precast.WS.Acc = {}
	sets.precast.WS.FullAcc = {}
	sets.precast.WS.Fodder = {}
	sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	-- Rudra's Storm (Adds Gravity)
	-- Physical (Darkness/Distortion)
	-- 80% DEX
    sets.precast.WS["Rudra's Storm"] = {
	ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body="Mummu Jacket +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Mummu Kecks +2",
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Chiner's Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ramuh Ring +1",
    back=gear.wsd_jse_back,
}
	sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring"})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].Proc = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {})
	
	-- Shark Bite
	-- Physial
	-- 40% DEX/40% AGI
    sets.precast.WS['Shark Bite'] = sets.precast.WS["Rudra's Storm"]	
    sets.precast.WS['Shark Bite'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS['Shark Bite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Shark Bite'].Fodder = set_combine(sets.precast.WS['Shark Bite'], {})
	sets.precast.WS['Shark Bite'].Proc = set_combine(sets.precast.WS['Shark Bite'].Fodder, {})
	
	
	-- Evisceration
	-- Physical
	-- 50% DEX
    sets.precast.WS['Evisceration'] = sets.precast.WS["Rudra's Storm"]
	sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration'].Proc = set_combine(sets.precast.WS['Evisceration'].Fodder, {})
	
    
	-- Aeolian Edge
	-- Magical
	-- 40% DEX/40% INT
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS["Rudra's Storm"], {head=HercHead.MAB,body="Horos Casaque +3",hands=HercGloves.MAB,legs=HercLegs.MAB,feet=HercFeet.MAB})

	
    sets.Skillchain = {hands="Macu. Bangles +1",feet="Maxixi Tights +1"}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = sets.precast.FC
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

    
    -- Sets to return to when not performing an action.
    
    -- Idle sets

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Sheltered Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
    
    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Impreg. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = sets.defense.PDT
		
	sets.defense.MEVA = sets.defense.PDT

    sets.Kiting = {feet="Tandava Crackows"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	-- Balanced
    sets.engaged = {
    main={ name="Setan Kober", augments={'Path: A',}},
    sub={ name="Setan Kober", augments={'Path: C',}},
    ammo="Yamarang",
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Moonlight Ring",
    back=gear.stp_jse_back,
}

		
    sets.engaged.TA = {
    ammo="Yamarang",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Horos Casaque +3", augments={'Enhances "No Foot Rise" effect',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Meg. Chausses +2",
    feet="Turms Leggings +1",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Gere Ring",
    back=gear.stp_jse_back,
}
    
	sets.engaged.Acc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Etoile Gorget +2",ear1="Telos Earring",ear2="Mache Earring +1",
        body="Adhemar Jacket +1",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Regal Ring",
        back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.FullAcc = {}

    sets.engaged.Fodder = {}

    sets.engaged.PDT = set_combine(sets.engaged.Acc, {ring1="Moonlight Ring",ring2="Moonlight Ring",back="Moonbeam Cape"})

    sets.engaged.TA.PDT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Horos Casaque +3",hands="Adhemar Wrist. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Turms Leggings +1"}
		


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs="Horos Tights +3"}
    sets.buff['Climactic Flourish'] = {ammo="Yamarang",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"} --head="Charis Tiara +2"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(10, 9)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(9, 9)
    elseif player.sub_job == 'THF' then
        set_macro_page(8, 9)
    else
        set_macro_page(10, 9)
    end
end