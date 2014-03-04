package entities.ships;

import entities.DataEntity;
import entities.projectiles.Projectile;

class Ship extends DataEntity
{
	public function fire()
	{
		var projectile:Projectile = getProjectileInstance();

		scene.add(projectile);
	}

	private function getProjectileInstance()
	{
		var projectileData:Dynamic = {speed:10, asset: "gfx/projectiles/glontz.png"};

		if(data.flipped)
			projectileData.flipped = true;

		return new Projectile(this.x, this.y, projectileData);
	}
}