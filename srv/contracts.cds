using {com.finobankdigital as finobankdigital} from '../db/schema_contracts';

service ManageContracts {

    entity GetContracts   as projection on finobankdigital.Contracts;
    entity CreateContract as projection on finobankdigital.Contracts;
    entity UpdateContract as projection on finobankdigital.Contracts;
    entity DeleteContract as projection on finobankdigital.Contracts;
}
