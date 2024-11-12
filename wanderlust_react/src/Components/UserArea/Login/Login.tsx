import { useContext, useState } from "react";
import { UserModel } from "../../../Models/UserModel";
import {CredentialModel} from "../../../Models/CredentialModel"
import css from "./Login.module.css";
import { notify } from "../../../Utils/Notify";
import { Navigate, useNavigate } from "react-router";
import { userService } from "../../../Services/UserService";
import { AuthContext } from "../../../hooks/authContext";

export function Login(): JSX.Element {
    const {login} = useContext(AuthContext);
    const [user, setUser] = useState<CredentialModel>(new CredentialModel())
    const navigate = useNavigate();
    function userChange(event:any){
        console.log(event.target.value); 
        if(event.target.name==="email"){
            user.email = event.target.value;
        }
        else if(event.target.name==="password"){
            user.password = event.target.value;
        }
        setUser({...user});
    }

    async function submit(){
        try{
            console.log(user);
            await login(user);
            notify.success("Welcome back"); 
            navigate("/home")
        }
        catch(err:any){
            console.log(err)
            notify.error(err); 
        }   
    }
    return (
        <div className={css.Login}>
            <h2>Login:</h2>
			<form>
                <label>Email:</label>
                <input type="email" name="email" onChange={userChange}/> 
                <label>Password:</label>
                <input type="password" name="password" onChange={userChange}/> 
            </form>
            <button onClick={submit}>Login</button>
        </div>
    );
}
