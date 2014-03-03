package entities.projectiles;

import entities.DataEntity;

class Projectile extends DataEntity
{
	override public function added()
	{
		init(this.data);
	}

	override public function update()
	{
		moveBy(0, -data.speed);
	}

	private function init(data:Dynamic)
	{
		graphic = getGraphic(data);

		if(data.flipped)
			data.speed = -data.speed;
	}
}