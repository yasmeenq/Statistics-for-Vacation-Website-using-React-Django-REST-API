// src/components/LikesPerCountry.tsx
import React, { useEffect, useState } from 'react';
import { fetchLikesPerCountry } from '../../../Services/apiService';
import { LikesPerCountryType } from '../../../Services/types';
import { LikesPerCountryChart } from "./LikesPerCountryChart"; // Import the updated chart component

export function LikesPerCountry() {
    const [likesData, setLikesData] = useState<LikesPerCountryType[]>([]);

    useEffect(() => {
        fetchLikesPerCountry()
            .then(setLikesData)
            .catch(console.error);
    }, []);

    return (
        <div>
            <h2>Likes Per Country:</h2>
            {likesData.length > 0 ? (
                <LikesPerCountryChart data={likesData} />
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}
