import React from "react";
import css from "./About.module.css";

export function About(): JSX.Element {
    return (
        <div className={css.About}>
            <h1>About Me</h1>
            <p>
                Hello! <br></br>
                My name is Yasmeen. I am a Full Stack Developer based in Jerusalem, Israel. <br></br>
                I am dedicated to creating impactful web applications.
            </p>
            <h2>My Skills</h2>
            <ul>
                <li>Python</li>
                <li>JavaScript</li>
                <li>HTML & CSS</li>
                <li>Flask</li>
                <li>Django</li>
                <li>React & TypeScript</li>
                <li>REST API</li>
                <li>MySQL Workbench</li>
                <li>Docker</li>
            </ul>
            <h2>Contact Me</h2>
            <p>If you'd like to get in touch, feel free to reach out through my email me at yasmeen.qawasmy@gmail.com</p>
        </div>
    );
}
