package entities.ships;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Ship extends Entity
{
	private var data:Dynamic;

	public function new(x:Float, y:Float, ?data:Dynamic)
	{
		super(x, y);

		if(data != null)
			this.data = data;
	}

	override public function added()
	{
		init(data);
	}

	override public function update()
	{
	}

	private function init(data:Dynamic)
	{
		graphic = getShipGraphic(data);
	}

	private function getShipGraphic(data:Dynamic)
	{
		var result:Image = new Image(data.asset);

		if(data.flipped == null || data.flipped != true)
			return result;

		result.originX = result.width;
		result.originY = result.height;
		result.angle = 180;

		return result;
	}
}