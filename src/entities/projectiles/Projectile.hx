package entities.projectiles;

import entities.DataEntity;

class Projectile extends DataEntity
{
	override public function update()
	{
		super.update();

		moveBy(0, -data.speed);
	}

	override private function init(data:Dynamic)
	{
		super.init(data);

		if(data.flipped)
			data.speed = -data.speed;
	}
}