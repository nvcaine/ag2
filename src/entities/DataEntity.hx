package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class DataEntity extends Entity
{
	private var data:Dynamic;

	public function new(x:Float, y:Float, ?data:Dynamic)
	{
		super(x, y);

		if(data != null)
			this.data = data;
	}

	private function getGraphic(data:Dynamic)
	{
		var result:Image = new Image(data.asset);

		if(data.flipped == null || data.flipped != true)
			return result;

		return flipImage(result);
	}

	private function flipImage(target:Image):Image
	{
		var result:Image = target;

		result.originX = result.width;
		result.originY = result.height;
		result.angle = 180;

		return result;		
	}
}