package entities.level;

import com.haxepunk.Entity;

import entities.DataEntity;
import entities.ships.Ship;

class GroundElement extends DataEntity
{
	public function new(x:Float, y:Float, ?data:Dynamic)
	{
		super(x, y, data);

		this.type = "ground-entity";
	}

	override public function moveCollideX(e:Entity):Bool
	{
		bounceTarget(data.speed, 0);

		return true;
	}

	override public function moveCollideY(e:Entity):Bool
	{
		bounceTarget(0, data.speed);

		return true;
	}

	override public function update()
	{
		super.update();

		moveBy(0, data.speed, "player");
	}

	private function bounceTarget(e:Entity, xSpeed:Float, ySpeed:Float)
	{
		if(!Std.is(e, Ship)) // might need a more suitable "projectile target" class
			return;

		var ship:Ship = cast(e, Ship);

		ship.bounce(xSpeed, ySpeed);
	}
}