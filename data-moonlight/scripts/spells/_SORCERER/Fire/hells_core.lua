local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 7)
	local max = (level / 5) + (maglevel * 13)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	tryElementalOverload(combat, creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:level(80)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
