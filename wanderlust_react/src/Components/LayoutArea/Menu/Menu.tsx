import { NavLink } from "react-router-dom";
import css from "./Menu.module.css";
import { useContext } from "react";
import { AuthContext } from "../../../hooks/authContext";

export function Menu(): JSX.Element {
    const {user} = useContext(AuthContext)
    return (
        <div className={css.Menu}>
            <div className={css.MenuLabel}>Menu</div> 
            <NavLink to="/home">home</NavLink>
            <NavLink to="/about">About</NavLink>
            {user == null && <> <NavLink to="/login">Login</NavLink></>}

            {user != null &&  <NavLink to="/dashboard">Dashboard</NavLink>}

        </div>
    );
}