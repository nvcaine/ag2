package entities.level;

import com.haxepunk.Entity;

import entities.DataEntity;

class GroundElement extends DataEntity
{
	public function new(x:Float, y:Float, ?data:Dynamic)
	{
		super(x, y, data);

		this.type = "ground-entity";
	}

	override public function update()
	{
		super.update();

		checkPlayerCollision(onPlayerCollision);

		moveBy(0, 1.5);
	}

	private function checkPlayerCollision(handler:Entity->Void)
	{
		var entity:Entity = collideTypes("player", this.x, this.y);

		if(entity == null)
			return;

		handler(entity);
	}

	private function onPlayerCollision(e:Entity)
	{
		trace("collided with player");
	}
}