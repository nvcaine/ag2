package entities.ships;

import com.haxepunk.HXP;

import entities.DataEntity;
import entities.projectiles.Projectile;

class Ship extends DataEntity
{
	private var fireDelayCounter:Float = 0;

	override public function update()
	{
		super.update();

		if(fireDelayCounter > 0)
			fireDelayCounter -= HXP.elapsed;
	}
	public function fire()
	{
		if(fireDelayCounter > 0)
			return;

		var projectile:Projectile = getProjectileInstance();

		scene.add(projectile);

		if(data.fireDelay == null || data.fireDelay <= 0)
			return;

		fireDelayCounter = data.fireDelay;

	}

	private function getProjectileInstance()
	{
		var projectileData:Dynamic = {speed:10, asset: "gfx/projectiles/glontz.png"};

		if(data.flipped)
			projectileData.flipped = true;

		return new Projectile(this.x, this.y, projectileData);
	}
}