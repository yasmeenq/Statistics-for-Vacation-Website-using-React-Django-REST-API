import css from "./Header.module.css";
import {UserMenu} from "../../UserArea/UserMenu/UserMenu"

export function Header(): JSX.Element {
    return (
        <div className={css.Header}>
			<p>Wanderlust</p>
            <UserMenu />
        </div>
    );
}
