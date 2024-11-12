

export interface LoginCredentials {
    email: string;
    password: string;
}

export interface LoginResponse {
    token: string;
}

//-------------------------------------------


export interface VacationStatsType {
    past_vacations: number;
    ongoing_vacations: number;
    future_vacations: number;
}

export interface TotalUsersType {
    total_users: number;
}

export interface TotalLikesType {
    total_likes: number;
}

export interface LikesPerCountryType {
    country: string;
    likes: number;
}