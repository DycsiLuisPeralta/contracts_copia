const cds = require("@sap/cds");
const req = require("express/lib/request");
const { Contracts } = cds.entities("com.finobankdigital");
module.exports = (srv) => {
  //***************READ*****************//
  srv.on("READ", "GetContracts", async (req) => {
    if (req.data.Ranl1 !== undefined) {
        return await SELECT.from`com.finobankdigital.Contracts`
        .where`Ranl1 = ${req.data.Ranl1}`;
    }  
    return await SELECT.from(Contracts);
  });
  //***************CREATE***************//
  srv.on("CREATE", "CreateContract", async (req) => {
    let returnData = await cds
      .transaction(req)
      .run(
        INSERT.into(Contracts).entries({
          Ranl1: req.data.Ranl1,
        })
      )
      .then((resolve, reject) => {
        console.log("Resolve", resolve);
        console.log("Reject", reject);

        if (typeof resolve !== "undefined") {
          return req.data;
        } else {
          req.error(409, "Record Not Inserted");
        }
      })
      .catch((err) => {
        console.log(err);
        req.error(err.code, err.message);
      });
    console.log("Before End", returnData);
    return returnData;
  });
};  

