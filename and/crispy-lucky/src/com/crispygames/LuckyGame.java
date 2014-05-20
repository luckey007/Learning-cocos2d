package com.crispygames;

import com.crispygames.CPGame;
import com.crispygames.CPScene;
import com.crispygames.controller.CPSportArena;
import com.crispygames.controller.CPSportsAbstractGame;
import com.crispygames.controller.CPSportResult;

public class LuckyGame extends CPSportsAbstractGame {
	
	@Override
	public void startGame() {
		CPScene scene = new CPScene();
		scene.addLayer(new CPTopBar());
		setScreen(scene);
	}
	
	public static LuckyGame sharedGame() {
		return (LuckyGame) CPGame.sharedGame();
	}

	@Override
	public void launchOneplayerGame(int difficulty) {
		
	}

	@Override
	public void launchTwoplayerGame() {
		
	}

	@Override
	public void gameOver(CPSportArena arena, CPSportResult result) {
		
	}
}
