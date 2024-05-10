using {com.finobankdigital as finobankdigital} from '../db/schema_contracts';

@path: 'user'
service ManageContracts {

    entity Contracts @(restrict: [
        {
            grant: ['READ'],
            to   : ['UserViewer']
        },
        {
            grant: ['*'],
            to   : ['UserAdmin']
        }
    ]) as projection on finobankdigital.Contracts;

    annotate Contracts with @odata.draft.enable;

}
