// src/components/Dashboard.tsx
import "./Dashboard.css";
import React, { useEffect, useState } from "react";
import { VacationStats } from "../VacationStatsChart/VacationStats"; 
import { UsersChart } from "../UsersChart/UsersChart";
import { LikesChart } from "../LikesChart/LikesChart";
import { LikesPerCountry } from "../LikesPerCountryChart/LikesPerCountry"; 
import { fetchTotalLikes, fetchTotalUsers } from "../../../Services/apiService";
import { TotalLikesType } from "../../../Services/types";
import { TotalUsersType } from "../../../Services/types";

export function Dashboard() {
  const [totalLikes, setTotalLikes] = useState<TotalLikesType | null>(null);
  const [totalUsers, setTotalUsers] = useState<TotalUsersType | null>(null);

  useEffect(() => {
    fetchTotalLikes()
      .then(setTotalLikes)
      .catch((error) => {
        console.error("Error fetching total likes:", error);
      });

    fetchTotalUsers()
      .then(setTotalUsers)
      .catch((error) => {
        console.error("Error fetching total users:", error);
      });
  }, []);

  return (
    <div style={{ padding: "30px" }}>
      <h1 style={{ marginBottom: "50px" }}>Statistics Dashboard</h1>

      <div style={{ marginBottom: "100px" }}>
        <VacationStats /> 
      </div>


      <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "100px" }}>
        <div style={{ flex: 1, marginRight: "40px" }}>
          <h3>Total Users Count:</h3>
          {totalUsers ? ( 
            <UsersChart totalUsers={totalUsers.total_users} />
          ) : (
            <p>Loading...</p> 
          )}
        </div>
        <div style={{ flex: 1 }}>
          <h3>Total Likes Count:</h3>
          {totalLikes ? ( 
            <LikesChart totalLikes={totalLikes.total_likes} />
          ) : (
            <p>Loading...</p> 
          )}
        </div>
      </div>

      <div>
        <LikesPerCountry /> 
      </div>
    </div>
  );
}
