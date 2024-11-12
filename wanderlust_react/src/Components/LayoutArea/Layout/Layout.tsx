import css from "./Layout.module.css";
import {Header} from "../Header/Header"
import {Footer} from "../Footer/Footer"
import {Menu} from "../Menu/Menu"
import {Routing} from "../../RoutingArea/Routing/Routing"
export function Layout(): JSX.Element {
    return (
        <div className={css.Layout}>
            <header> 
                <Header/>
            </header>
            <aside>
                <Menu/>
            </aside>
            <main>
                <Routing/>
            </main>

            <footer>
                <Footer/>
            </footer>
        </div>
    );
}
