package entities;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;

import entities.ships.Player;

import model.consts.PlayerConsts;

class PlayerController
{
	private var entity:Player;
	private var scene:Scene;

	public function new(scene:Scene)
	{
		defineInput(PlayerConsts.INPUT);

		this.scene = scene;

		entity = new Player(100, 500, {asset: "gfx/ships/nava2.png", speed: 5, fireDelay: 0.5});
		this.scene.add(entity);
	}

	public function checkInput()
	{
		handleAcceleration();
	}

	private function defineInput(nameKeyPairs:Array<Dynamic>)
	{
		var pair:Dynamic;

		for(pair in nameKeyPairs)
			Input.define(pair.name, pair.keys);
	}

	private function handleAcceleration()
	{
		var xAcc:Int = 0, yAcc:Int = 0;

		if(Input.check(PlayerConsts.UP_INPUT))
			yAcc = -1;			

		if(Input.check(PlayerConsts.DOWN_INPUT))
			yAcc = 1;

		if(Input.check(PlayerConsts.LEFT_INPUT))
			xAcc = -1;

		if(Input.check(PlayerConsts.RIGHT_INPUT))
			xAcc = 1;

		if(Input.check(PlayerConsts.FIRE_INPUT))
			entity.fire();

		entity.setAcceleration(xAcc, yAcc);
	}
}