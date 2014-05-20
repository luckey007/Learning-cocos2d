package com.crispygames;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.utils.TiledDrawable;

public class GameLayer extends CPStageLayer {

	private Image topLeft;
	private Image bottomLeft;
	private Image redVerticalLeft;
	private Image greenVerticalRight;
	private Image topRight;
	private Image redVerticalRight;
	private Image bottomRight;
	private Image greenVerticalLeft;
	private Image redRoundLeft;
	private Image redRoundRight;
	private Image greenRoundLeft;
	private Image greenRoundRight;
	private Image redTopHorizontal;
	private Image greenTopHorizontal;
	private Image greenBottomHorizontal;
	private Image redBottomHorizontal;
	private Image redRoundTopHorizontal;
	private Image greenRoundTopHorizontal;
	private Image greenRoundBottomHorizontal;
	private Image redRoundBottomHorizontal;

	public GameLayer() {
		drawFrame("redgreen_frame.png", 100);
	}

	private void drawFrame(String frameImage, float goalWidth) {
		int W = CPGame.sharedGame().getWidth();
		int H = CPGame.sharedGame().getHeight();

		TextureRegion region = new TextureRegion(
				CPTexture.getRegionForFile(frameImage));
		
		topLeft = new Image(new TextureRegion(region, 0, 0, 64, 64));
		topLeft.setPosition(0, H - 64);
		stage.addActor(topLeft);
		
		topRight = new Image(new TextureRegion(region, 193, 0, 64, 64));
		topRight.setPosition(W - 64, H - 64);
		stage.addActor(topRight);
		
		bottomLeft = new Image(new TextureRegion(region, 0, 193, 64, 64));
		bottomLeft.setPosition(0, 0);
		stage.addActor(bottomLeft);
	
		bottomRight = new Image(new TextureRegion(region, 193, 193, 64, 64));
		bottomRight.setPosition(W - 64, 0);
		stage.addActor(bottomRight);
		
		redVerticalLeft = new Image(new TiledDrawable(new TextureRegion(region, 0, 50, 64, 64)));
		redVerticalLeft.setHeight(H / 2 - 64);
		redVerticalLeft.setWidth(64);
		redVerticalLeft.setPosition(0, H /2);
		stage.addActor(redVerticalLeft);
		
		redRoundLeft = new Image(new TextureRegion(region, 0, 64, 64, 64));
		redRoundLeft.setPosition(0, redVerticalLeft.getY());
		stage.addActor(redRoundLeft);
		
		redVerticalRight = new Image(new TiledDrawable(new TextureRegion(region, 193, 150, 64, 64)));
		redVerticalRight.setHeight(H / 2 - 64);
		redVerticalRight.setWidth(64);
		redVerticalRight.setPosition(W - 64, bottomRight.getHeight());
		stage.addActor(redVerticalRight);
		
		redRoundRight = new Image(new TextureRegion(region, 193, 128, 64, 64));
		redRoundRight.setPosition(W - 64, redVerticalRight.getHeight());
		stage.addActor(redRoundRight);
		
		greenVerticalRight = new Image(new TiledDrawable(new TextureRegion(region, 193, 50, 64, 64)));
		greenVerticalRight.setHeight(H / 2 - 64);
		greenVerticalRight.setWidth(64);
		greenVerticalRight.setPosition(W - 64, H /2);
		stage.addActor(greenVerticalRight);
		
		greenRoundRight = new Image(new TextureRegion(region, 193, 64, 64, 64));
		greenRoundRight.setPosition(W - 64,H / 2);
		stage.addActor(greenRoundRight);

		greenVerticalLeft = new Image(new TiledDrawable(new TextureRegion(region, 0, 140, 64, 64)));
		greenVerticalLeft.setHeight(H / 2 - 64);
		greenVerticalLeft.setWidth(64);
		greenVerticalLeft.setPosition(0, bottomLeft.getHeight());
		stage.addActor(greenVerticalLeft);
		
		greenRoundLeft = new Image(new TextureRegion(region, 0, 130, 64, 64));
		greenRoundLeft.setPosition(0, greenVerticalLeft.getHeight());
		stage.addActor(greenRoundLeft);
		
		redTopHorizontal = new Image(new TiledDrawable(new TextureRegion(region, 50, 0, 64, 64)));
		redTopHorizontal.setHeight(64);
		redTopHorizontal.setWidth(W / 2 - 150);
		redTopHorizontal.setPosition(64, H - 64);
		stage.addActor(redTopHorizontal);
		
		greenTopHorizontal = new Image(new TiledDrawable(new TextureRegion(region, 150, 0, 64, 64)));
		greenTopHorizontal.setHeight(64);
		greenTopHorizontal.setWidth(W / 2 - 150);
		greenTopHorizontal.setPosition(W - topRight.getWidth() - greenTopHorizontal.getWidth(), H - 64);
		stage.addActor(greenTopHorizontal);
		
		greenBottomHorizontal = new Image(new TiledDrawable(new TextureRegion(region, 50, 193, 64, 64)));
		greenBottomHorizontal.setHeight(64);
		greenBottomHorizontal.setWidth(W / 2 - 150);
		greenBottomHorizontal.setPosition(64, 0);
		stage.addActor(greenBottomHorizontal);
		
		redBottomHorizontal = new Image(new TiledDrawable(new TextureRegion(region, 150, 193, 64, 64)));
		redBottomHorizontal.setHeight(64);
		redBottomHorizontal.setWidth(W / 2 - 150);
		redBottomHorizontal.setPosition(W - bottomRight.getWidth() - redBottomHorizontal.getWidth() , 0);
		stage.addActor(redBottomHorizontal);
		
		redRoundTopHorizontal = new Image(new TextureRegion(region, 64, 0, 64, 64));
		redRoundTopHorizontal.setPosition(W / 2 - 150, H - 64);
		stage.addActor(redRoundTopHorizontal);
		
		greenRoundTopHorizontal = new Image(new TextureRegion(region, 128, 0, 64, 64));
		greenRoundTopHorizontal.setPosition(greenTopHorizontal.getX(), H - 64);
		stage.addActor(greenRoundTopHorizontal);
		
		greenRoundBottomHorizontal = new Image(new TextureRegion(region, 64, 193, 64, 64));
		greenRoundBottomHorizontal.setPosition(greenBottomHorizontal.getWidth(), 0);
		stage.addActor(greenRoundBottomHorizontal);
		
		redRoundBottomHorizontal = new Image(new TextureRegion(region, 128, 193, 64, 64));
		redRoundBottomHorizontal.setPosition(redBottomHorizontal.getX(), 0);
		stage.addActor(redRoundBottomHorizontal);
		
		
		System.out.print(bottomRight.getX());
		
		
	}

	@Override
	public void dispose() {
		super.dispose();
	}
}
