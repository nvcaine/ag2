package entities.ships;

import com.haxepunk.HXP;

import entities.DataEntity;
import entities.projectiles.Projectile;

import model.proxies.ProjectileProxy;

class Ship extends DataEntity
{
	private var fireDelayCounter:Float = 0;

	public function new(x:Float, y:Float, ?data:Dynamic)
	{
		super(x, y, data);

		this.type = "ship-entity"; // make const

		//add entity collision type to projectile data
	}

	override public function update()
	{
		super.update();

		if(fireDelayCounter > 0)
			fireDelayCounter -= HXP.elapsed;
	}

	public function takeDamage(projectileInfo:Dynamic)
	{
		//trace("took " + projectileInfo.damage + " damage");
	}

	public function fire()
	{
		if(fireDelayCounter > 0)
			return;

		scene.add(getProjectileInstance());

		if(data.fireDelay == null || data.fireDelay <= 0)
			return;

		fireDelayCounter = data.fireDelay;
	}

	private function getProjectileInstance()
	{
		var proxy:ProjectileProxy = ProjectileProxy.cloneInstance();
		var projectileData:Dynamic = Reflect.copy(proxy.projectileTemplates[0]);

		if(data.flipped)
			projectileData.flipped = true;

		if(data.targets != null)
			projectileData.targetTypes = data.targets;

		return new Projectile(this.x, this.y, projectileData);
	}
}