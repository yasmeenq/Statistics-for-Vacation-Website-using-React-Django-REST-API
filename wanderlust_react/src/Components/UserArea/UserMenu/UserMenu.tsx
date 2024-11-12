import { useSelector } from "react-redux";
import css from "./UserMenu.module.css";
import { UserModel } from "../../../Models/UserModel";
import { AppState } from "../../../Redux/state";
import { NavLink, useNavigate } from "react-router-dom";
import { userService } from "../../../Services/UserService";
import { notify } from "../../../Utils/Notify";
import { useContext } from "react";
import { AuthContext } from "../../../hooks/authContext";

export function UserMenu(): JSX.Element {

    // const user = useSelector<AppState, UserModel | null>(store => store.user);
    const {user, logout:authLogout} = useContext(AuthContext);
    const navigate = useNavigate();

    function logout() {
        authLogout();
        notify.success("Bye user");
        navigate("/home");
    }
    
    return (
        <div className={css.UserMenu}>
            {
                user === null ? (
                    <div>
                        Hello Guest |
                        <NavLink to="/login"> Login  </NavLink> 
                    </div>
                ) : (
                    <div>
                        Hello {user.firstName} {user.lastName} |
                        <NavLink to="" onClick={logout}>  Logout  </NavLink>
                    </div>
                )
            }
        </div>
    );
}
