import axios from "axios";
import Cookies from "js-cookie"; // Import the js-cookie package
import { CredentialModel } from "../Models/CredentialModel";
import { UserModel } from "../Models/UserModel";
import { store, userActions } from "../Redux/state";
import { jwtDecode } from "jwt-decode"; // Use named import
import {appConfig} from "../Utils//AppConfig"

class UserService {

    public async login(credentials: CredentialModel): Promise<void> {
        try {
            const csrfToken = Cookies.get('csrftoken');
            const { data } = await axios.post("http://localhost:8000/api/login", credentials, {
                headers: {
                    "X-CSRFToken": csrfToken,
                },
            });

            console.log("Login response:", data);
            const accessToken = data.access;
            console.log("Access Token:", accessToken);

            const dbUser = jwtDecode<{ user: UserModel }>(accessToken).user; // Decode the access token
            console.log("Decoded User:", dbUser);

            store.dispatch(userActions.login(dbUser));
            localStorage.setItem("access_token", accessToken);
            localStorage.setItem("refresh_token", data.refresh);
        } catch (error) {
            console.error("Login failed:", error);
            throw error;
        }
    }

    public logout(): void {
        store.dispatch(userActions.logout());
        localStorage.removeItem("access_token");
        localStorage.removeItem("refresh_token");
    }

    public loadUserFromToken(): void {
        const token = localStorage.getItem("access_token");
        if (!token) return;

        const dbUser = jwtDecode<{ user: UserModel }>(token).user; 
        store.dispatch(userActions.login(dbUser));
    }

}

export const userService = new UserService();
