package entities;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import entities.ships.Player;

class PlayerController
{
	private var entity:Player;
	private var scene:Scene;

	public function new(scene:Scene)
	{
		defineInput();

		this.scene = scene;

		entity = new Player(100, 500, {asset: "gfx/ships/nava2.png"});
		this.scene.add(entity);
	}

	public function checkInput()
	{
		handleAcceleration();
	}

	private function defineInput()
	{
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("shoot", [Key.X]);
		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("right", [Key.RIGHT, Key.D]);
		Input.define("regen", [Key.Z]);
	}

	private function handleAcceleration()
	{
		var xAcc:Int = 0, yAcc:Int = 0;

		if(Input.check("up"))
			yAcc = -1;			

		if(Input.check("down"))
			yAcc = 1;

		if(Input.check("left"))
			xAcc = -1;

		if(Input.check("right"))
			xAcc = 1;

		entity.setAcceleration(xAcc, yAcc);
	}

}