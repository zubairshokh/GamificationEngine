# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GamificationEng.Repo.insert!(%GamificationEngine.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

## Activity
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Activity{
    name: "New User",
    description: "User has Just Joined",
    points: 10,

})

GamificationEngine.Repo.insert!(%GamificationEngine.Model.Activity{
    name: "Upload Photo",
    description: "User has Uploaded a photo",
    points: 100,

})
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Activity{
    name: "Social Share",
    description: "User has Shared a photo",
    points: 20,

})
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Activity{
    name: "Like Photo",
    description: "User has liked a photo",
    points: 15,

})
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Activity{
    name: "Followed User",
    description: "User has Uploaded a photo",
    points: 50,

})

## Badge Category
## Badge
GamificationEngine.Repo.insert!(%GamificationEngine.Model.BadgeCategory{
    name: "Start",
    description: "New User",
    badge: [%GamificationEngine.Model.Badge{
        name: "Naive",
        description: "New User Badge/ complimentary 10 points given",
        awardpoints: 0,
        condition: 0
    }]
})

GamificationEngine.Repo.insert!(%GamificationEngine.Model.BadgeCategory{
    name: "Followers",
    description: "Following Users Catgory",
    badge: [%GamificationEngine.Model.Badge{
        name: "Popular Photography Badge",
        description:  "Photograper will be awarded 50 points with condition that he has followed 50 other users",
        awardpoints: 50,
        condition: 50
    },
    %GamificationEngine.Model.Badge{
        name: "Famous Photography Badge",
        description:  "Photograper will be awarded 50 points with condition that he has followed 100 other users",
        awardpoints: 50,
        condition: 100
    }]
})

GamificationEngine.Repo.insert!(%GamificationEngine.Model.BadgeCategory{
    name: "Likers",
    description: "Liking User pictures Catgory",
    badge: [%GamificationEngine.Model.Badge{
        name: "Popular Liker Badge",
        description:  "Photograper will be awarded 40 points with condition that he has Liked 500 other pictures",
        awardpoints: 40,
        condition: 500
    },
    %GamificationEngine.Model.Badge{
        name: "Picture Lover Badge",
        description: "Photograper will be awarded 100 points with condition that he has Liked 2000 other pictures",
        awardpoints: 100,
        condition: 2000
    }]
})
    
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Level{
    name: "Novice",
    description: "Beginner Photographer",
    points_range_start: 0,
    points_range_end: 100
})
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Level{
    name: "Expert",
    description: "Intermediate Photographer",
    points_range_start: 101,
    points_range_end: 1000
})
GamificationEngine.Repo.insert!(%GamificationEngine.Model.Level{
    name: "Professional",
    description: "Professional Photographer",
    points_range_start: 1001,
    points_range_end: 10000
})


#default user
GamificationEngine.Repo.insert!(%GamificationEngine.Model.User{
    id: 0,
    total_points: 0,
    badge: GamificationEngine.Repo.get(GamificationEngine.Model.Badge,1),
    level: GamificationEngine.Repo.get(GamificationEngine.Model.Level,1)
})
