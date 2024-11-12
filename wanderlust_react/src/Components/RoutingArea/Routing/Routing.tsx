import "./Routing.css";
import { Routes, Route } from "react-router-dom"
import { Home } from "../../HomeArea/Home/Home"
import { About } from "../../AboutArea/About/About"
import { Dashboard } from "../../ChartsArea/Dashboard/Dashboard";
import { PageNotFound } from "../PageNotFound/PageNotFound"
import {Login} from "../../UserArea/Login/Login"
import { useContext } from "react";
import { AuthContext } from "../../../hooks/authContext";

export function Routing(): JSX.Element {
    const {user} = useContext(AuthContext)
    return (
        <div className="Routing">
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/home" element={<Home />} />
                <Route path="/about" element={<About />} />
                {user != null && <Route path="/dashboard" element={<Dashboard />} /> }
                {user == null && <><Route path="/login" element={<Login />} /> </>} 
                <Route path="*" element={<PageNotFound />} />
            </Routes>
        </div>
    );
}
