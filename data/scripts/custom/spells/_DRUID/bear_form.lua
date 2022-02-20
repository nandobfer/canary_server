local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		
    local form = player:getForm()
	
	--DESTRANSFORMAR
	if form then
		player:removeForm()
	else end

	 -- TRANSFORMAR --
	if form ~= "bear" then
		player:addForm("werebear", 300) -- (monstro, % bonus de fist)
	else end
	
    return true
end

spell:name("Bear Form")
spell:words("utevo bear")
spell:group("support")
spell:vocation("druid;true", "elder druid;true")
spell:id(38)
spell:cooldown(0 * 1000)
spell:groupCooldown(0 * 1000)
spell:level(20)
spell:mana(0)
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()

-- creature:setMaxHealth(creature:getStorageValue(Storage_.bear_bonus_life)) -- seta Hp máximo com valor da storage XXX
-- creature:addHealth(creature:getMaxHealth())