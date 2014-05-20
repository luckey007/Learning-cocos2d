package com.crispygames;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.utils.Align;
import com.badlogic.gdx.scenes.scene2d.utils.TiledDrawable;
import com.crispygames.ui.CPButton;
import com.crispygames.ui.CPLabel;
import com.crispygames.ui.CPNode;

public class CPTopBar extends CPStageLayer {

	private Image base;
	private Image buyBg;
	private CPButton btnBuy;
	private CPNode buy;
	private CPLabel chips;
	private Image topBar;
	private CPButton btnCollect;
	private CPLabel bonus;
	private CPNode collect;
	private CPButton btnLobby;
	private Image levelBase;
	private Image progress;
	private CPLabel lblLevel;
	private int W;
	private int H;

	public CPTopBar() {
		W = CPGame.sharedGame().getWidth();
		H = CPGame.sharedGame().getHeight();
		
		TextureRegion region = new TextureRegion(
				CPTexture.getRegionForFile("topbar/tb_base.png"));
		
		base = new Image(new TiledDrawable(region));
		
		stage.addActor(base);
		
		topBar = new Image(CPTexture.getRegionForFile("topbar/top_bar.png"));
		btnCollect = new CPButton(CPTexture.getRegionForFile("topbar/tb_btn_blue.png"), 100);
		btnCollect.add(new CPLabel("Collect", "fonts/helvetica_bold.ttf", 16));
		bonus = new CPLabel("500", "fonts/helvetica_bold.ttf", 16);
		bonus.setAlignment(Align.right);
		
		collect = new CPNode();
		collect.setSize(topBar.getWidth(), topBar.getHeight());
		collect.addActor(topBar);
		collect.addActor(btnCollect);
		collect.addActor(bonus);
		btnCollect.setPosition(35, 22);
		collect.setPosition(W / 2, H / 2);
		bonus.setPosition(collect.getWidth() - 55, collect.getHeight() / 2 + 10);
		stage.addActor(collect);
		
		buyBg = new Image(CPTexture.getRegionForFile("topbar/tb_buybg.png"));
		btnBuy = new CPButton(CPTexture.getRegionForFile("topbar/tb_btn_green.png"), 100);
		btnBuy.add(new CPLabel("Buy Chips", "fonts/helvetica_bold.ttf", 16));
		chips = new CPLabel("2K", "fonts/helvetica_bold.ttf", 16);
		chips.setAlignment(Align.right);
		
		buy = new CPNode();
		buy.setSize(buyBg.getWidth(), buyBg.getHeight());
		buy.addActor(buyBg);
		buy.addActor(btnBuy);
		btnBuy.setPosition(50, 22);
		buy.addActor(chips);
		chips.setPosition(buyBg.getWidth() - 50, buy.getHeight() / 2 + 10);
		stage.addActor(buy);
		
		btnLobby = new CPButton(CPTexture.getRegionForFile("topbar/tb_btn_red.png"), 100);
		btnLobby.add(new CPLabel("Lobby", "fonts/helvetica_bold.ttf", 25));
		stage.addActor(btnLobby);
		
		levelBase = new Image(CPTexture.getRegionForFile("topbar/tb_levelbase.png"));
		stage.addActor(levelBase);
		
		progress = new Image(CPTexture.getRegionForFile("topbar/tb_progress.png"));
		stage.addActor(progress);
		
		lblLevel = new CPLabel("Level 1","fonts/helvetica_bold.ttf", 22);
		stage.addActor(lblLevel);
		
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
		base.setWidth(width);
		CPUniversal.position(base, width / 2, height, 0.5f, 1);
		CPUniversal.position(buy, 0, height, 0, 1);
		CPUniversal.position(collect, buy.getWidth() - 20, height, 0, 1);
		
		
		if (CPGame.sharedGame().isPortrait) {
			
			CPUniversal.position(btnLobby, width , height - 5, 1, 1);
			CPUniversal.position(levelBase, buy.getWidth() + collect.getWidth() -  25, height - 8, 0, 1);
			CPUniversal.position(progress, buy.getWidth() + collect.getWidth() -  25, height - 8, 0, 1);
			CPUniversal.position(lblLevel, buy.getWidth() + collect.getWidth() + 15, height - 12, 0, 1);
			
			
		}else {
			
			CPUniversal.position(btnLobby, width - 30, height - 5, 1, 1);
			CPUniversal.position(levelBase, buy.getWidth() + collect.getWidth(), height - 8, 0, 1);
			CPUniversal.position(progress, buy.getWidth() + collect.getWidth(), height - 8, 0, 1);
			CPUniversal.position(lblLevel, buy.getWidth() + collect.getWidth() + 35, height - 12, 0, 1);
			
		}
	}

	@Override
	public void update(float dt) {
		// TODO Auto-generated method stub
		super.update(dt);
	}
	
	
}
