({
    performValidation: function(component, profileName) {
        // Perform your validation logic here using the profileName
        if (profileName != 'Asistentes service autos' && component.get("v.simpleRecord.Amount") == null)
            {
                component.set("v.mensaje", 'Esta Oportunidad no tiene establecido un Importe!');
                return;
            }
    }
})