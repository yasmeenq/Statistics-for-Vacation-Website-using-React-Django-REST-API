// src/Redux/state.ts
import { configureStore, createSlice } from "@reduxjs/toolkit";
import { VacationStatsType, TotalUsersType, TotalLikesType, LikesPerCountryType } from "../Services/types";
import { initVacations, initUsers, initLikes, initLikesPerCountry } from "./reducers";
import { UserModel } from "../Models/UserModel";
import { login, logout } from "./reducers";

export type AppState = {
    vacations: VacationStatsType[];
    users: TotalUsersType | null;
    likes: TotalLikesType | null;
    likesPerCountry: LikesPerCountryType[];
    user: UserModel | null; // Allowing null when user is not authenticated
};

// Vacations slice
const vacationsSlice = createSlice({
    name: "vacations",
    initialState: [] as VacationStatsType[],
    reducers: { initVacations },
});
export const vacationsActions = vacationsSlice.actions;
export const vacationsReducer = vacationsSlice.reducer;

// Likes slice
const likesSlice = createSlice({
    name: "likes",
    initialState: null as TotalLikesType | null,
    reducers: { initLikes },
});
export const likesActions = likesSlice.actions;
export const likesReducer = likesSlice.reducer;

// Total Users slice
const usersSlice = createSlice({
    name: "users",
    initialState: null as TotalUsersType | null,
    reducers: { initUsers },
});
export const usersActions = usersSlice.actions;
export const usersReducer = usersSlice.reducer;

// Likes per Country slice
const likesPerCountrySlice = createSlice({
    name: "likesPerCountry",
    initialState: [] as LikesPerCountryType[],
    reducers: { initLikesPerCountry },
});
export const likesPerCountryActions = likesPerCountrySlice.actions;
export const likesPerCountryReducer = likesPerCountrySlice.reducer;

// User / Authentication slice
const userSlice = createSlice({
    name: "users",
    initialState: null as UserModel | null, // Explicitly setting null for initial state
    reducers: { login, logout},
});
export const userActions = userSlice.actions;
export const userReducer = userSlice.reducer;

export const store = configureStore<AppState>({
    reducer: {
        vacations: vacationsReducer,
        users: usersReducer,
        likes: likesReducer,
        likesPerCountry: likesPerCountryReducer,
        user: userReducer,
    },
});
