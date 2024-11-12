import { createContext, PropsWithChildren, useEffect, useState } from "react";
import { UserModel } from "../Models/UserModel";
import { CredentialModel } from "../Models/CredentialModel";
import Cookies from "js-cookie";
import axios from "axios";
import { jwtDecode } from "jwt-decode";

type TauthContext = {
  user: UserModel | null;
  login: (credentials: CredentialModel) => Promise<void>;
  logout: () => void;
};

function getUser(): UserModel | null{
    const fromStorage = localStorage.getItem("user");
    if(!fromStorage || fromStorage == "null"){
        return null
    } else{
        return JSON.parse(fromStorage)
    }
}

export const AuthContext = createContext<TauthContext>({
  user: getUser(),
  login: () => Promise.resolve(),
  logout: () => {},
});

export function AuthContextProvider(props: PropsWithChildren<{}>) {
  const [user, setUser] = useState<UserModel | null>(getUser());
    useEffect(()=>{
        localStorage.setItem("user", JSON.stringify(user))
    }, [user])

  async function login(credentials: CredentialModel): Promise<void> {
    try {
      const csrfToken = Cookies.get("csrftoken");
      const { data } = await axios.post(
        "http://localhost:8000/api/login",
        credentials,
        {
          headers: {
            "X-CSRFToken": csrfToken,
          },
        }
      );

      console.log("Login response:", data);
      const accessToken = data.access;
      console.log("Access Token:", accessToken);

      const dbUser = data.user;
      console.log("Decoded User:", dbUser);

      setUser(dbUser);

      localStorage.setItem("access_token", accessToken);
      localStorage.setItem("refresh_token", data.refresh);
    } catch (error) {
      console.error("Login failed:", error);
      throw error;
    }
  }
  function logout() {
    setUser(null);
  }
  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {props.children}
    </AuthContext.Provider>
  );
}
