echo "rs.initiate(
   {
      _id: \"rs0\",
      version: 1,
      members: [
         { _id: 0, host: \"mongodb1:27017\" },
         { _id: 1, host: \"mongodb2:27017\" },
         { _id: 2, host: \"mongodb3:27017\" },
	      { _id: 3, host: \"mongodb4:27017\" }
      ]
   }
)" | mongosh "mongodb://localhost:27017" | exit