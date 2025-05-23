public virtual class CObject {

    Object record;
    Integer count;

    public CObject (Object record) {
        this.record = record;
        this.count = 0;
    }

    public Object get( String fieldName ) {

        List<String> fieldRelations = fieldName.split( '\\.' );

        while( fieldRelations.size() - 1 != this.count ) {
            
            this.record = this.getUntypedInstance().get( fieldRelations[this.count] );
            
            this.count++;
            
        }

        return this.getUntypedInstance().get( fieldRelations[this.count] );
    }

    public Boolean containsKey ( String fieldName ) {

        List<String> fieldRelations = fieldName.split( '\\.' );

        while( fieldRelations.size() - 1 != this.count ) {
            
            this.record = this.getUntypedInstance().get( fieldRelations[this.count] );
            
            this.count++;
            
        }

        return this.getUntypedInstance().containsKey( fieldRelations[this.count] );
    }

    private Map<String, Object> getUntypedInstance () {

        String payload = JSON.serialize( this.record );

        Map<String, Object> untypedInstance = ( Map<String, Object> ) JSON.deserializeUntyped( payload );

        return untypedInstance;
    }

}