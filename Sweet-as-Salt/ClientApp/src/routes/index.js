import AboutScreen from 'components/AppScreens/AboutScreen';
import GameScreen from 'components/AppScreens/GameScreen';
import HomeScreen from 'components/AppScreens/HomeScreen';
import InstructionsScreen from 'components/AppScreens/InstructionsScreen';
import ScoreScreen from 'components/AppScreens/ScoreScreen';
import Porfolio from 'porfolio/index.js';
import AboutPorfolio from 'porfolio/About';
const appRoutes = [
  {
    exact: true,
    path: '/',
    component: Porfolio
  },
  {
    exact: false,
    path: '/oii-studio/about',
    component: AboutPorfolio
  },
  // {
  //   exact: true,
  //   path: '/',
  //   component: HomeScreen
  // }, 
  {
    exact: true,
    path: '/sweet-as-salt/home',
    component: HomeScreen
  },
  {
    exact: false,
    path: '/sweet-as-salt/instructions',
    component: InstructionsScreen
  },
  {
    exact: false,
    path: '/sweet-as-salt/about',
    component: AboutScreen
  },
  {
    exact: false,
    path: '/sweet-as-salt/score',
    component: ScoreScreen
  },
  {
    exact: false,
    path: '/sweet-as-salt/game',
    component: GameScreen
  }
]
export { appRoutes };
