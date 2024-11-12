


class AppConfig {
    public readonly loginUrl = "http://localhost:3030/api/login/"
    // public readonly registerUrl = "http://localhost:3030/api/register/"
    public vacationStatsUrl = "http://localhost:3030/api/vacation-stats/"
    public totalLikesUrl = "http://localhost:3030/api/total-likes/"
    public totalUsersUrl = "http://localhost:3030/api/total-users/"
    public likesPerCountry = "http://localhost:3030/api/likes-per-country/"
}

export const appConfig = new AppConfig();
