import { PayloadAction } from "@reduxjs/toolkit";
import { VacationStatsType, TotalUsersType, TotalLikesType, LikesPerCountryType } from "../Services/types";
import { UserModel } from "../Models/UserModel";

// Vacations Reducers
export function initVacations(currentState: VacationStatsType[], action: PayloadAction<VacationStatsType[]>): VacationStatsType[] {
    return action.payload; // Initialize or update vacations data
}

// Users Reducers
export function initUsers(currentState: TotalUsersType, action: PayloadAction<TotalUsersType>): TotalUsersType {
    return action.payload; // Initialize or update users data
}

// Likes Reducers
export function initLikes(currentState: TotalLikesType, action: PayloadAction<TotalLikesType>): TotalLikesType {
    return action.payload; // Initialize or update likes data
}

// Likes Per Country Reducer
export function initLikesPerCountry(currentState: LikesPerCountryType[], action: PayloadAction<LikesPerCountryType[]>): LikesPerCountryType[] {
    return action.payload; // Initialize or update likes per country data
}


//-------------------------------------------
export function login(currentState:UserModel, action:PayloadAction<UserModel>):UserModel{
    const newState = action.payload;
    return newState; 
}

export function logout(currentState:UserModel, action:PayloadAction<UserModel>):UserModel{
    return null; 
}

