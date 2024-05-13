using {com.finobankdigital as finobankdigital} from '../db/schema_contracts';

@path: 'user'
service ManageContracts {

    entity GetContracts
            @(restrict: [
        {
            grant: ['READ'],
            to   : ['UserViewer']
        },
        {
            grant: ['*'],
            to   : ['UserAdmin']
        }

    ]) as projection on finobankdigital.Contracts;

     entity CreateContract
            @(restrict: [
        {
            grant: ['READ'],
            to   : ['UserViewer']
        },
        {
            grant: ['*'],
            to   : ['UserAdmin']
        }

    ]) as projection on finobankdigital.Contracts;   

      entity UpdateContract
            @(restrict: [
        {
            grant: ['READ'],
            to   : ['UserViewer']
        },
        {
            grant: ['*'],
            to   : ['UserAdmin']
        }

    ]) as projection on finobankdigital.Contracts;    

      entity DeleteContract
            @(restrict: [
        {
            grant: ['READ'],
            to   : ['UserViewer']
        },
        {
            grant: ['*'],
            to   : ['UserAdmin']
        }

    ]) as projection on finobankdigital.Contracts;        

    annotate GetContracts with @odata.draft.enable;
    annotate CreateContract with @odata.draft.enable;
    annotate UpdateContract with @odata.draft.enable;
    annotate DeleteContract with @odata.draft.enable;        

}
