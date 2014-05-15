package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class DataEntity extends Entity
{
	public var isOutOfBounds(get_isOutOfBounds, null):Bool;
	public var imageAsset(get_imageAsset, null):Image;

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
		if(isOutOfBounds)
			destroy();
	}

	private function getGraphic(data:Dynamic)
	{
		var result:Image = new Image(data.asset);

		if(data.flipped == null || data.flipped != true)
			return result;

		return flipImage(result);
	}

	private function init(data:Dynamic)
	{
		graphic = getGraphic(data);

		setHitbox(imageAsset.width, imageAsset.height);
	}

	private function flipImage(target:Image):Image
	{
		var result:Image = target;

		result.originX = result.width;
		result.originY = result.height;
		result.angle = 180;

		return result;		
	}

	private function get_isOutOfBounds()
	{
		return (x + imageAsset.width < 0) || (x > HXP.width) || (y + imageAsset.height < 0) || (y > HXP.height);
	}

	private function get_imageAsset():Image
	{
		var asset:Image = cast(graphic, Image);

		return asset;
	}

	private function destroy()
	{
		imageAsset.destroy();

		scene.remove(this);
	}
}