// src/components/TotalLikes.tsx
import React, { useEffect, useState } from 'react';
import { fetchTotalLikes } from '../../../Services/apiService';
import { TotalLikesType } from '../../../Services/types'; 
import { LikesChart } from './LikesChart';

export function TotalLikes() {
    const [likes, setLikes] = useState<TotalLikesType | null>(null);

    useEffect(() => {
        fetchTotalLikes()
            .then(setLikes)
            .catch((error) => {
                console.error("Error in TotalLikes component:", error);
            });
    }, []);

    return (
        <div>
            <h2>Total Likes</h2>
            {likes ? (
                <div>
                    <p>Total Likes: {likes.total_likes}</p>
                    <LikesChart totalLikes={likes.total_likes} /> {/* Pass the total likes to the chart */}
                </div>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}
