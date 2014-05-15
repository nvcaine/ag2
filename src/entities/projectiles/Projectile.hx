package entities.projectiles;

import com.haxepunk.Entity;

import entities.DataEntity;
import entities.ships.Ship;

class Projectile extends DataEntity
{
	override public function update()
	{
		super.update();

		moveBy(0, -data.speed);

		if(data.targetTypes == null)
			return;

		checkCollision(data.targetTypes, onShipCollision);
	}

	override private function init(data:Dynamic)
	{
		super.init(data);

		if(data.flipped != null && data.flipped == true)
			data.speed = -data.speed;
	}

	private function checkCollision(entityTypes:Array<String>, handler:Entity->Void)
	{
		var entity:Entity = collideTypes(entityType, this.x, this.y);

		if(entity == null)
			return;

		handler(entity);
	}

	private function onShipCollision(e:Entity)
	{
		if(!Std.is(e, Ship)) // might need a more suitable "projectile target" class
			return;

		var ship:Ship = cast(e, Ship);

		ship.takeDamage({damage: data.damage});

		scene.remove(this);
	}
}