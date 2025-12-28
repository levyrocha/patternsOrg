public without sharing class Example2Service extends TriggerBase implements ITriggerService {

    public Example2Service() {}

    public void execute() {
        System.debug('#### Example2Service');
    }
}