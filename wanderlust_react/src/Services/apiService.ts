import axios from 'axios';
import { LoginCredentials, LoginResponse, VacationStatsType, TotalLikesType, TotalUsersType, LikesPerCountryType } from './types';


const BASE_URL = 'http://localhost:8000/api';


export const fetchTotalLikes = async (): Promise<TotalLikesType> => {
    try {
        const response = await axios.get<TotalLikesType>(`${BASE_URL}/total-likes`);
        console.log("Fetched Total Likes:", response.data);
        return response.data;
    } catch (error) {
        console.error("Error fetching total likes:", error);
        throw error;
    }
};

export const fetchVacationStats = async (): Promise<VacationStatsType> => {
    try {
        const response = await axios.get<VacationStatsType>(`${BASE_URL}/vacation-stats`);
        console.log("Fetched Vacation Stats:", response.data);
        return response.data;
    } catch (error) {
        console.error("Error fetching vacation stats:", error);
        throw error;
    }
};

export const fetchTotalUsers = async (): Promise<TotalUsersType> => {
    try {
        const response = await axios.get<TotalUsersType>(`${BASE_URL}/total-users`);
        console.log("Fetched Total Users:", response.data);
        return response.data;
    } catch (error) {
        console.error("Error fetching total users:", error);
        throw error;
    }
};

export const fetchLikesPerCountry = async (): Promise<LikesPerCountryType[]> => {
    try {
        const response = await axios.get<LikesPerCountryType[]>(`${BASE_URL}/likes-per-country`);
        console.log("Fetched Likes Per Country:", response.data);
        return response.data;
    } catch (error) {
        console.error("Error fetching likes per country:", error);
        throw error;
    }
};

//----------------------------------------------------


export const loginUser = async (credentials: LoginCredentials): Promise<LoginResponse> => {
    const response = await axios.post<LoginResponse>(`${BASE_URL}/login`, credentials);
    return response.data;
};


export const setAuthToken = (token: string) => {
    axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
};
