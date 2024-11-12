import css from "./PageNotFound.module.css";
import pagenotfound from "../../../Assets/images/pagenotfound.png"
export function PageNotFound(): JSX.Element {
    return (
        <div className={css.PageNotFound}>
            <img src={pagenotfound}/>
        </div>
    );
}
