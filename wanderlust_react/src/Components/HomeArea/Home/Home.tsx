import css from "./Home.module.css";
import charts2 from "../../../Assets/images/charts2.jpg";

export function Home(): JSX.Element {
  return (
    <div className={css.Home}>
      <h1>Wanderlust Statistics</h1>
      <img src={charts2} alt="Statistics Charts" className={css.BackgroundImage} />
      <h3>your go-to platform for exploring and analyzing vacation data!</h3>
    </div>
  );
}
