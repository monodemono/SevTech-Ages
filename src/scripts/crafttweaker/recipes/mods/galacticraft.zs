/*
    SevTech: Ages GalactiCraft Recipe Script

    This script handles the recipes for GalactiCraft.

    Note: These scripts are created and for the usage in SevTech: Ages and other
    modpacks curated by DarkPacks. You can use these scripts for reference and for
    learning but not for copying and pasting and claiming as your own.
*/
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.crafttweaker.utils;

/*
    Shaped Recipes
*/
static shapedRecipes as IIngredient[][][][IItemStack] = {
	<galacticraftcore:machine:12>: [
		[
			[metals.aluminum.plate, <minecraft:piston:0>, metals.aluminum.plate],
			[metals.aluminum.plate, <natura:netherrack_furnace:0>, metals.aluminum.plate],
			[<enderutilities:enderpart:2>, <betterwithmods:steel_anvil:0>, <enderutilities:enderpart:2>]
		]
	],
	<galacticraftcore:fuel_loader:0>: [
		[
			[<galacticraftcore:basic_item:6>, <galacticraftcore:basic_item:6>, <galacticraftcore:basic_item:6>],
			[<appliedenergistics2:material:22>, <galacticraftcore:canister:0>, <appliedenergistics2:material:24>],
			[<galacticraftcore:basic_item:7>, <pneumaticcraft:printed_circuit_board:0>, <galacticraftcore:basic_item:7>]
		]
	],
	<galacticraftcore:air_fan:0>: [
		[
			[<galacticraftcore:basic_item:9>, null, <galacticraftcore:basic_item:9>],
			[null, metals.invar.gear, null],
			[<galacticraftcore:basic_item:9>, null, <galacticraftcore:basic_item:9>]
		]
	],
	<galacticraftcore:machine2:8>: [
		[
			[<ore:compressedSteel>, <ore:compressedSteel>, <ore:compressedSteel>],
			[<ore:tankOxygenHeavy>, <ore:tankOxygenHeavy>, <ore:tankOxygenHeavy>],
			[<ore:compressedSteel>, <ore:compressedSteel>, <ore:compressedSteel>]
		]
	]
};

static namedShapedRecipes as IIngredient[][][][string][IItemStack] = {};

/*
    Mirrored Recipes
*/
static mirroredRecipes as IIngredient[][][][IItemStack] = {};

static namedMirroredRecipes as IIngredient[][][][string][IItemStack] = {};

/*
    Shapeless Recipes
*/
static shapelessRecipes as IIngredient[][][IItemStack] = {
	<galacticraftplanets:carbon_fragments:0> * 16 : [
		 [<minecraft:coal:1>, <minecraft:coal:1>, <minecraft:coal:1>, <minecraft:coal:1>]
	],
	<galacticraftplanets:carbon_fragments:0> * 32 : [
		[<minecraft:coal:0>, <minecraft:coal:0>, <minecraft:coal:0>, <minecraft:coal:0>]
	]
};

static namedShapelessRecipes as IIngredient[][][string][IItemStack] = {};

/*
	Furnace Recipes
*/
static furnaceRecipes as IIngredient[][IItemStack] = {
	<ore:ingotSpacePlatinum>.firstItem: [<ore:oreSpacePlatinum>],
	metals.titanium.ingot.firstItem: [<ore:oreIlmenite>, <ore:shardTitanium>]
};

/*
    Recipe Removals
*/
static removeRecipes as IIngredient[] = [
	<galacticraftcore:air_fan:0>,
	<galacticraftcore:fuel_loader:0>,
	<galacticraftcore:machine2:8>,
	<galacticraftcore:machine:12>,
	<galacticraftcore:rocket_workbench:0>,
	<galacticraftplanets:carbon_fragments:0>
];

static removeFurnace as IIngredient[] = [
	<galacticraftcore:basic_item:3>,
	<galacticraftcore:basic_item:5>,
	<galacticraftplanets:basic_item_venus:1>
];

function initParachuteRecipes() {
	for i in 0 to 16 {
		var parachute as IItemStack = <galacticraftcore:parachute:0>.definition.makeStack(i);
		if (i == 0) {
			recipes.removeByRecipeName("galacticraftcore:parachute_" ~ i ~ "_alt");
		} else {
			recipes.removeByRecipeName("galacticraftcore:parachute_" ~ i);
		}
		recipes.addShapeless(parachute, [<galacticraftcore:parachute:*>, oreDict.get("dye" ~ utils.capitalize(parachuteDyeIdTable[i]))]);
	}
}

function init() {
	// Un-named recipes
	var shapedRecipes as IIngredient[][][][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.shapedRecipes;
	var mirroredRecipes as IIngredient[][][][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.mirroredRecipes;
	var shapelessRecipes as IIngredient[][][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.shapelessRecipes;

	// Named recipes
	var namedShapedRecipes as IIngredient[][][][string][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.namedShapedRecipes;
	var namedMirroredRecipes as IIngredient[][][][string][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.namedMirroredRecipes;
	var namedShapelessRecipes as IIngredient[][][string][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.namedShapelessRecipes;

	// Furnace recipes
	var furnaceRecipes as IIngredient[][IItemStack] = scripts.crafttweaker.recipes.mods.galacticraft.furnaceRecipes;

	var removeRecipes as IItemStack[] = scripts.crafttweaker.recipes.mods.galacticraft.removeRecipes;
	var removeFurnace as IIngredient[] = scripts.crafttweaker.recipes.mods.galacticraft.removeFurnace;

	// Un-named recipes
	recipeUtil.process(shapedRecipes, false);
    recipeUtil.process(mirroredRecipes, true);
    recipeUtil.process(shapelessRecipes);

	// Named recipes
	recipeUtil.processNamed(namedShapedRecipes, false);
    recipeUtil.processNamed(namedMirroredRecipes, true);
    recipeUtil.processNamed(namedShapelessRecipes);

	// Furnace recipes
	recipeUtil.processFurnace(furnaceRecipes);

	recipeUtil.removeRecipes(removeRecipes);
	recipeUtil.removeFurnace(removeFurnace);

	// Create the parachute reicpes
	scripts.crafttweaker.recipes.mods.galacticraft.initParachuteRecipes();
}
