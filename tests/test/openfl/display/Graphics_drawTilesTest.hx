package openfl.display;
import flash.geom.Point;
import massive.munit.Assert;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;

/**
 * ...
 * @author damrem
 */
class Graphics_drawTilesTest
{
	var context:Sprite;
	var holder:Shape;
	var img:BitmapData;
	var ts:Tilesheet;
	
	@BeforeClass
	public function beforeClass():Void
	{
		img = new BitmapData(32, 32);
		ts = new Tilesheet(img);
	}
	
	@AfterClass
	public function afterClass():Void
	{
		img.dispose();
		img = null;
		
		ts = null;
	}
	
	@Before
	public function setup():Void
	{
		context = new Sprite();
		holder = new Shape();
		context.addChild(holder);
	}
	
	@After
	public function tearDown():Void
	{
		context.removeChild(holder);
		context = null;
		
		holder.graphics.clear();
		holder = null;
	}
	
	@Test 
	public function noFlag()
	{
		ts.addTileRect(new Rectangle(0, 0, 32, 32));
		holder.graphics.drawTiles(ts, [0, 0, 0]);
		
		var b = holder.getBounds(holder);
		trace(b);
		Assert.areEqual(0, b.x);
		Assert.areEqual(0, b.y);
		Assert.areEqual(32, b.width);
		Assert.areEqual(32, b.height);
	}
	
	@Test 
	public function noFlagWithTileCenter()
	{
		ts.addTileRect(new Rectangle(0, 0, 32, 32), new Point(16,16));
		holder.graphics.drawTiles(ts, [0, 0, 0]);
		
		var b = holder.getBounds(context);
		trace(b);
		Assert.areEqual(0, b.x);
		Assert.areEqual(0, b.y);
		Assert.areEqual(32, b.width);
		Assert.areEqual(32, b.height);
	}
	
	@Test public function useRect()
	{
		holder.graphics.drawTiles(ts, [0, 0, 0, 0, 32, 32], false, Tilesheet.TILE_RECT);
		
		var b = holder.getBounds(holder);
		trace(b);
		Assert.areEqual(0, b.x);
		Assert.areEqual(0, b.y);
		Assert.areEqual(32, b.width);
		Assert.areEqual(32, b.height);
	}
	
	
	
	
	
}