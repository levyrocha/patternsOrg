public with sharing class Lists {

    public static List<String> byFields ( List<SObject> records, List<String> fields ) {

        if ( isEmpty(records) || isEmpty(fields) ) return new List<String>();

        List<String> fieldsValues = new List<String>();

        for ( SObject record : records ) {

            for ( String field : fields ) {

                String fieldValue = getFieldValue( record, field );

                if ( fieldValue == null ) continue;

                fieldsValues.add( fieldValue );
            }
        }

        return fieldsValues;
    }

    public static List<String> byFields ( List<Object> records, Type objectType, List<String> fields ) {

        if ( isEmpty(records) || isEmpty(fields) ) return new List<String>();

        List<String> fieldsValues = new List<String>();

        for ( Object record : records ) {

            CObject coreRecord = new CObject(record);

            for ( String field : fields ) {

                if ( !coreRecord.containsKey( field ) ) continue;

                if ( coreRecord.get(field) == null ) continue;

                fieldsValues.add( '' + coreRecord.get(field) );
            }
        }

        return fieldsValues;
    }

    public static List<String> byCompositeKey ( List<SObject> records, List<String> keys, String splitValue ) {

        if( Lists.isEmpty(records) || Lists.isEmpty(keys) ) return new List<String>();  

        List<String> compositeKeys = new List<String>();
        
        for (SObject record : records) {
            List<String> keyParts = new List<String>();
            
            for (String key : keys) {
                String fieldValue = getFieldValue( record, key );

                if ( fieldValue == null ) continue;

                keyParts.add( fieldValue );
            }
        
            compositeKeys.add(String.join(keyParts, splitValue));
        }
        
        return compositeKeys;
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

    public static List<String> byField( List<Object> records, Type objectType, String field ) {
        return byFields( records, objectType, new List<String>{ field } );
    }

    public static List<String> byField( List<SObject> records, String field ) {
        return byFields( records, new List<String>{ field } );
    }

    public static Boolean isEmpty( List<Object> records ) {
        return records == null || records.isEmpty();
    }

    public static List<List<Object>> doPartions(List<Object> records, Integer size, Type destType){
        checkNotNull(records);
        checkArgument(size > 0);
        checkNotNull(destType);
        return new Partition(records, size, destType).doPartition();
    }

    private static void checkNotNull(Object reference) {
        if (reference == null) throw new NullPointerException();
    }

    private static void checkArgument(Boolean expression) {
        if (!expression) throw new IllegalArgumentException();
    }

    public static List<SObject> addAllFromMapAndKeys( Map<String,List<SObject>> objectsByKey, List<String> keys ) {
        List<SObject> result = new List<SObject>();

        for( String key : keys ) {
            result.addAll( objectsByKey.get( key ) );
        }

        return result;
    }

    public static List<String> byCompositeKeyIdTo15 ( List<SObject> records, List<String> keys, String splitValue ) {

        if( Lists.isEmpty(records) || Lists.isEmpty(keys) ) return new List<String>();  

        List<String> compositeKeys = new List<String>();
        
        for (SObject record : records) {
            List<String> keyParts = new List<String>();
            
            for (String key : keys) {
                String fieldValue = getFieldValue( record, key );
                fieldValue = fieldValue.substring(0, fieldValue.length() - 3 );

                if ( fieldValue == null ) continue;

                keyParts.add( fieldValue );
            }
        
            compositeKeys.add(String.join(keyParts, splitValue));
        }
        
        return compositeKeys;
    }

    private class Partition{
        private List<Object> items;
        private Integer splitSize;
        private Type destType;

        Partition(List<Object> records, Integer size, Type destType){
            this.items = records;
            this.splitSize = size;
            this.destType = destType;
        }

        List<List<Object>> doPartition(){

            List<List<Object>> result = (List<List<Object>>)destType.newInstance();

            List<Object> protoList = items.clone();

            protoList.clear();

            List<Object> tempList = protoList.clone();

            Integer index = 0, count = 0, size = items.size();

            while(index < size) {

                tempList.add(items.get(index++));

                ++count;

                if(count == splitSize) {
                    result.add(tempList);
                    tempList = protoList.clone();
                    count = 0;
                }
            }
            if(!tempList.isEmpty()) {
                result.add(tempList);
            }
            return result;
        }
    }

    public class IllegalArgumentException extends Exception {}
}