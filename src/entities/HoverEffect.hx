package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

class HoverEffect extends Entity
{
	private var g:Spritemap;

	override public function added()
	{
		g = new Spritemap("menu/lightning_spritemap.png", 200, 32);

		g.add("lightning", [1, 2, 3, 4], 15);

		g.scaleX = g.scaleY = 3;

		graphic = g;
	}

	override public function update()
	{
		g.play("lightning");
	}
}