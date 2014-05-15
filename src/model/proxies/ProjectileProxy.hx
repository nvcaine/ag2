package model.proxies;

class ProjectileProxy
{
	public var projectileTemplates:Array<Dynamic>;

	private static var instance:ProjectileProxy;

	private function new()
	{
		projectileTemplates = [{
			 speed: 10,
			 asset: "gfx/projectiles/glontz.png",
			damage: 1 // player/weapon info
		}];
	}

	public static function cloneInstance():ProjectileProxy
	{
		if(instance == null)
			instance = new ProjectileProxy();

		return instance;
	}
}