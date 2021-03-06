import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;

import scripts.crafttweaker.stages.stageTutorial;
import scripts.crafttweaker.stages.stageZero;
import scripts.crafttweaker.stages.stageDisabled;

static stagedItems as IIngredient[][string] = {
	stageTutorial.stage: [
		<immcraft:chest:0>,
		<immcraft:rock:0>
	],

	stageZero.stage: [
		<immcraft:bookshelf:0>,
		<immcraft:cupboard:0>,
		<immcraft:shelf:0>
	]
};

static hiddenItems as IIngredient[] = [
	<immcraft:bookstand:0>,
	<immcraft:chisel:0>,
	<immcraft:dummybook:0>,
	<immcraft:furnace:0>,
	<immcraft:in_world_placer:0>,
	<immcraft:in_world_vertical_placer:0>,
	<immcraft:manual:0>,
	<immcraft:saw:0>,
	<immcraft:sticks:0>,
	<immcraft:workbench:0>,
	<immcraft:workbench_sec:0>
];

static hiddenItems as IIngredient[] = [
	<immcraft:dummybook:0>,
	<immcraft:in_world_placer:0>,
	<immcraft:in_world_vertical_placer:0>,
	<immcraft:sticks:0>,
	<immcraft:workbench_sec:0>,
	<immcraft:workbench:0>
];

static hiddenRemove as IIngredient[] = [
	<immcraft:bookstand:0>,
	<immcraft:chisel:0>,
	<immcraft:furnace:0>,
	<immcraft:manual:0>,
	<immcraft:saw:0>
];

function init() {
	for stageName, items in scripts.crafttweaker.staging.itemsAndRecipes.mods.immcraft.stagedItems {
		ZenStager.getStage(stageName).addIngredients(items);
	}
	recipeUtil.hideItems(scripts.crafttweaker.staging.itemsAndRecipes.mods.immcraft.hiddenItems as IIngredient[]);
	recipeUtil.hideItems(scripts.crafttweaker.staging.itemsAndRecipes.mods.immcraft.hiddenRemove as IIngredient[], true);
}
