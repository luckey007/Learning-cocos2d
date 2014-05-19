package com.crispygames;

import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.crispygames.ui.CPButton;

public class HomeLayer extends CPStageLayer {

	private String strBg;
	private Image bg;
	private String strLogo;
	private Image logo;
	private CPButton rate;
	private CPButton play;
	private CPButton leaderboard;

	public HomeLayer() {
		
		strBg = CPFlappyClassicGame.sharedGame().backgroundSprite();
		strLogo = CPFlappyClassicGame.sharedGame().logoSprite();
		if (strBg != null) {
			bg = new Image(CPTexture.getRegionForFile(strBg));
		}
		
		if (strLogo != null) {
			logo = new Image(CPTexture.getRegionForFile(strLogo));
		}
		
		rate = new CPButton(CPTexture.getRegionForFile("items/rate_normal.png"),
				CPTexture.getRegionForFile("items/rate_clicked.png"));
		
		play = new CPButton(CPTexture.getRegionForFile("items/play_normal.png"),
				CPTexture.getRegionForFile("items/play_clicked.png"));
		
		leaderboard = new CPButton(CPTexture.getRegionForFile("items/leaderboard_normal.png"),
				CPTexture.getRegionForFile("items/leaderboard_clicked.png"));
		
		Table table = new Table();
		table.setFillParent(true);
		if(bg != null){
			
			table.setBackground(bg.getDrawable());
		}
		if (logo != null) {
			table.add(logo).pad(20.0f).center().colspan(2).expand();
		} else {
			table.add().expand().colspan(2);
		}
		table.row();
		table.add(rate).bottom().padBottom(40).expand().colspan(2);
		table.row();
		table.add(play).top().expand().colspan(1);
		table.add(leaderboard).top().expand();
		table.debug();
		stage.addActor(table);
	}
	
	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		super.dispose();
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		super.draw();
		Table.drawDebug(stage);
	}

	@Override
	public void onEnter() {
		// TODO Auto-generated method stub
		super.onEnter();
	}

	@Override
	public void onExit() {
		// TODO Auto-generated method stub
		super.onExit();
	}

	@Override
	public void setPosition(float x, float y) {
		// TODO Auto-generated method stub
		super.setPosition(x, y);
	}

	@Override
	public void setViewport(int width, int height) {
		// TODO Auto-generated method stub
		super.setViewport(width, height);
	}

	@Override
	public void update(float dt) {
		// TODO Auto-generated method stub
		super.update(dt);
	}
	
	
}