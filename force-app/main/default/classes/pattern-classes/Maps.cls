public without sharing class Maps {

    public static Map<String, SObject> indexBy ( String fieldName, List<SObject> records ) {

        if ( Lists.isEmpty(records) ) return new Map<String, SObject>();

        Map<String, SObject> values = newEmptyMap(records);

        for ( SObject record : records ) {

            String value = (String) record.get( fieldName );

            if ( value == null ) continue;

            values.put( value, record );
        }

        return values;
    }

    public static Map<String, Object> indexBy ( String fieldName, List<Object> records, Type objectType ) {

        if ( Lists.isEmpty(records) ) return new Map<String, List<SObject>>();

        Map<String, Object> values = newEmptyMap(records, objectType);

        for ( Object record : records ) {

            CObject coreRecord = new CObject(record);

            if ( !coreRecord.containsKey( fieldName ) ) continue;

            String value = (String) coreRecord.get( fieldName );

            if ( value == null ) continue;

            values.put( value, record);
        }

        return values;
    }

    public static Map<String,SObject> indexByCompositeKeyWithDuplicated ( List<SObject> records, List<String> fieldsToBuildCompositeKey ) {

        if( records.isEmpty() ) return new Map<String,SObject>();

        Map<String, SObject> values = newEmptyMap( records );

        for( SObject record : records ) {

            List<String> compositeKeyValues = new List<String>();

            for( String fieldToBuildCompositeKey : fieldsToBuildCompositeKey ) {

                String value = (String) getFieldValue( record, fieldToBuildCompositeKey );

                if( value == null ) value = '';

                compositeKeyValues.add( value );
            }

            String compositeKey = String.join( compositeKeyValues, ',' );

            if( values.containsKey( compositeKey ) ) continue;

            values.put( compositeKey, record );

        }

        return values;

    }

    public static Map<String,List<SObject>> groupByCompositeKey ( List<SObject> records, List<String> fieldsToBuildCompositeKey ) {

        if( records.isEmpty() ) return new Map<String,List<SObject>>();

        Map<String, List<SObject>> values = newEmptyGroupedMap( records );

        for( SObject record : records ) {

            List<String> compositeKeyValues = new List<String>();

            for( String fieldToBuildCompositeKey : fieldsToBuildCompositeKey ) {

                String value = (String) getFieldValue( record, fieldToBuildCompositeKey );

                if( value == null ) value = '';

                compositeKeyValues.add( value );
            }

            String compositeKey = String.join( compositeKeyValues, ',' );

            if ( !values.containsKey( compositeKey ) ) {
                values.put( compositeKey, new List<SObject>() );
            }

            values.get( compositeKey ).add( record ); 
        }

        return values;

    }

    public static Map<String,Map<String,SObject>> indexByDoubleKey( List<SObject> records, String firstField, String secondField ) {

        if( records.isEmpty() ) return new Map<String,Map<String,SObject>>();

        Map<String,Map<String,SObject>> value = newEmptyDoubleKeyMap( records );

        for( SObject record : records ) {

            String firstKey = getFieldValue( record, firstField );

            if( String.isBlank( firstKey ) ) continue;

            String secondKey = getFieldValue( record, secondField );

            if( String.isBlank( secondKey ) ) continue;

            if( !value.containsKey( firstKey ) ) {
                value.put( firstKey, newEmptyMap( records ) );
            }

            value.get( firstKey ).put( secondKey, record );
        }

        return value;
    }

    public static Map<String,Object> indexByCompositeKey ( List<Object> records, List<String> fieldsToBuildCompositeKey, Type objectType, String splitValue ) {
                        
        if( records.isEmpty() ) return new Map<String,Object>();

        Map<String, Object> values = newEmptyMap( records, objectType );

        for( Object record : records ) {

            List<String> compositeKeyValues = new List<String>();

            CObject cobject = new CObject( record );

            for( String fieldToBuildCompositeKey : fieldsToBuildCompositeKey ) {

                String value = (String) cobject.get( fieldToBuildCompositeKey );

                if( value == null ) value = '';

                compositeKeyValues.add( value );
            }

            String compositeKey = String.join( compositeKeyValues, splitValue );

            values.put( compositeKey, record );

        }

        return values;

    }

    private static String getFieldValue( SObject record, String field ) {

        List<String> splitedField = field.split('\\.');

        for ( Integer i = 0; i < splitedField.size(); i++ ) {

            if( i == splitedField.size() - 1 ) {
                return (String) record.get( splitedField[i] );
            }

            record = record.getSObject( splitedField[i] );

            if( record == null ) return null;
        }

        return '';

    }

    public static Map<String, Decimal> indexFieldBy ( String fieldName, String fieldName2, List<SObject> records) {

        if ( Lists.isEmpty(records) ) return new Map<String, Decimal>();

        Map<String, Decimal> values = new Map<String, Decimal>();

        for ( SObject record : records ) {

            String value = (String) record.get( fieldName );

            if ( value == null ) continue;

            values.put( value, (Decimal) record.get( fieldName2 ) );
        }

        return values;
    }

    /*
     * @description: Works with SObjects and Custom Metadatas objects
    */
    public static Map<String, Object> indexByFieldAndValue ( List<Object> records, String indexedField, String field, Object value ) {

        if ( Lists.isEmpty(records) ) return null;

        Map<String, Object> recordsByField = new Map<String, Object>();

        for ( Object record : records ) {

            CObject coreRecord = new CObject(record);

            if ( !coreRecord.containsKey(field) ) continue;

            if ( coreRecord.get(field) != value ) continue;

            recordsByField.put( (String) coreRecord.get(indexedField), record);
        }

        return recordsByField;
    }

    public static Map<String, List<SObject>> groupBy ( String fieldName, List<SObject> records ) {

        if ( Lists.isEmpty( records ) ) return new Map<String, List<SObject>>();

        Map<String, List<SObject>> values = newEmptyGroupedMap( records );

        for ( SObject record : records ) {

            String value = (String) getFieldValue( record, fieldName );

            if ( value == null ) continue;

            if ( !values.containsKey( value ) ) {
                values.put( value, new List<SObject>() );
            }

            values.get( value ).add( record );
        }

        return values;
    }

    public static Map<String, List<Object>> groupBy ( String fieldName, List<Object> records, Type objectType ) {

        if ( Lists.isEmpty(records) ) return new Map<String, List<SObject>>();

        Map<String, List<Object>> values = newEmptyGroupedMap(records, objectType);

        for ( Object record : records ) {

            CObject coreRecord = new CObject(record);

            if ( !coreRecord.containsKey( fieldName ) ) continue;

            String value = (String) coreRecord.get( fieldName );

            if ( value == null ) continue;

            if ( !values.containsKey( value ) ) {
                values.put( value, newEmptyList( objectType ) );
            }

            values.get( value ).add( record );
        }

        return values;
    }
    
    public static Map<String, SObject> indexByCompositeKey ( List<SObject> records, List<String> keys, String splitValue ) {
        if( Lists.isEmpty(records) || Lists.isEmpty(keys) ) return new Map<String, SObject>();  
        
        Map<String, SObject> recordByCompositeKey = newEmptyMap(records);

        for (SObject record : records) {
            List<String> keyParts = new List<String>();
            
            for (String key : keys) {
                String fieldValue = getFieldValue( record, key );

                if ( fieldValue == null ) continue;

                keyParts.add( fieldValue );
            }

            recordByCompositeKey.put( String.join( keyParts, splitValue ), record);
        }
        
        return recordByCompositeKey;
    }

    private static Map<String,Map<String,SObject>> newEmptyDoubleKeyMap( List<SObject> records ) {

        if ( Lists.isEmpty(records) ) return null;

        Schema.DescribeSObjectResult describer = records.get(0).getSObjectType().getDescribe();

        String sobjectName = describer.getName();

        Type sobjectType = Type.forName( 'Map<String,Map<String,' + sobjectName + '>>' );

        return (Map<String,Map<String,SObject>>) sobjectType.newInstance();
    }

    private static Map<String, List<SObject>> newEmptyGroupedMap ( List<SObject> records ) {

        if ( Lists.isEmpty(records) ) return null;

        Schema.DescribeSObjectResult describer = records.get(0).getSObjectType().getDescribe();

        String sobjectName = describer.getName();

        Type sobjectType = Type.forName( 'Map<String, List<' + sobjectName + '>>' );

        return (Map<String, List<SObject>>) sobjectType.newInstance();
    }

    private static Map<String, List<Object>> newEmptyGroupedMap ( List<Object> records, Type objectType ) {

        if ( Lists.isEmpty(records) ) return null;

        Type groupedObjectType = Type.forName( 'Map<String, List<' + objectType + '>>' );

        return (Map<String, List<Object>>) groupedObjectType.newInstance();
    }

    private static Map<String, SObject> newEmptyMap (List<SObject> records) {

        if ( Lists.isEmpty(records) ) return null;

        Schema.DescribeSObjectResult describer = records.get(0).getSObjectType().getDescribe();

        String sobjectName = describer.getName();

        Type sobjectType = Type.forName( 'Map<String, ' + sobjectName + '>' );

        return (Map<String, SObject>) sobjectType.newInstance();
    }

    private static Map<String, Object> newEmptyMap ( List<Object> records, Type objectType ) {

        if ( Lists.isEmpty(records) ) return null;

        Type sobjectType = Type.forName( 'Map<String, ' + objectType + '>' );

        return (Map<String, Object>) sobjectType.newInstance();
    }

    private static List<Object> newEmptyList ( Type objectType ) {

        Type listType = Type.forName( 'List<' + objectType + '>' );

        return (List<Object>) listType.newInstance();
    }

    public static Map<String, List<SObject>> groupByLookupField ( String lookup, String lookupFieldName, List<SObject> records ) {

        if ( Lists.isEmpty(records) ) {
            return new Map<String, List<SObject>>();
        }

        Map<String, List<SObject>> values = newEmptyGroupedMap(records);

        for ( SObject record : records ) {

            SObject lookupRecord = record.getSObject( lookup );

            if ( lookupRecord == null ) {
                continue;
            }

            String value = (String) lookupRecord.get( lookupFieldName );

            if ( value == null ) {
                continue;
            }

            if ( !values.containsKey( value ) ) {
                values.put( value, new List<SObject>() );
            }

            values.get( value ).add( record );
        }

        return values;
    }

    public static List<SObject> aggregateValues(Map<String, List<SObject>> mapToConvert){

        List<List<SObject>> recordsList = mapToConvert.values();

        List<SObject> aggregatedRecords = new List<SObject>();

        for(List<SObject> records : recordsList){

            aggregatedRecords.addAll(records);
        }

        return aggregatedRecords;
    }
}