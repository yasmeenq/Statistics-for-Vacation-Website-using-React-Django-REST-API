// src/components/TotalUsers.tsx
import React, { useEffect, useState } from 'react';
import { fetchTotalUsers } from '../../../Services/apiService';
import { TotalUsersType } from '../../../Services/types';

export function TotalUsers() {
    const [users, setUsers] = useState<TotalUsersType | null>(null);

    useEffect(() => {
        fetchTotalUsers()
            .then(setUsers)
            .catch((error) => {
                console.error("Error in TotalUsers component:", error);
            });
    }, []);

    return (
        <div>
            <h2>Total Users</h2>
            {users ? (
                <p>Total Users: {users.total_users}</p>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}
