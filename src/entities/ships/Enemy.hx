package entities.ships;

import com.haxepunk.HXP;

class Enemy extends Ship
{
	private var fireDelay:Float = 3;

	override public function added()
	{
		super.added();
	}

	override public function update()
	{
		fireDelay -= HXP.elapsed;

		if(fireDelay <= 0)
		{
			fire();
			fireDelay = 3;
		}
	}
}