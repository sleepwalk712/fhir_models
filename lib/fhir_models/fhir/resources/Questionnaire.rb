module FHIR
  class Questionnaire < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['code', 'context', 'context-quantity', 'context-type', 'date', 'definition', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'subject-type', 'title', 'url', 'version']
    MULTIPLE_TYPES = {
      'versionAlgorithm' => ['string', 'Coding']
    }
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Questionnaire.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Questionnaire.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Questionnaire.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Questionnaire.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Questionnaire.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Questionnaire.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Questionnaire.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Questionnaire.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Questionnaire.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Questionnaire.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'versionAlgorithmString' => {'type'=>'string', 'path'=>'Questionnaire.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
      'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'Questionnaire.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
      'name' => {'type'=>'string', 'path'=>'Questionnaire.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'Questionnaire.title', 'min'=>0, 'max'=>1},
      'derivedFrom' => {'type'=>'canonical', 'path'=>'Questionnaire.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Questionnaire.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'Questionnaire.experimental', 'min'=>0, 'max'=>1},
      'subjectType' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BiologicallyDerivedProduct', 'BodyStructure', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'CatalogEntry', 'ChargeItem', 'ChargeItemDefinition', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceDefinition', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EffectEvidenceSynthesis', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'InsurancePlan', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProduct', 'MedicinalProductAuthorization', 'MedicinalProductContraindication', 'MedicinalProductIndication', 'MedicinalProductIngredient', 'MedicinalProductInteraction', 'MedicinalProductManufactured', 'MedicinalProductPackaged', 'MedicinalProductPharmaceutical', 'MedicinalProductUndesirableEffect', 'MessageDefinition', 'MessageHeader', 'MolecularSequence', 'NamingSystem', 'NutritionOrder', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RelatedPerson', 'RequestGroup', 'ResearchDefinition', 'ResearchElementDefinition', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'RiskEvidenceSynthesis', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SubstanceSpecification', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestReport', 'TestScript', 'ValueSet', 'VerificationResult', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Questionnaire.subjectType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
      'date' => {'type'=>'dateTime', 'path'=>'Questionnaire.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Questionnaire.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'Questionnaire.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'Questionnaire.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'Questionnaire.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'Questionnaire.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'purpose' => {'type'=>'markdown', 'path'=>'Questionnaire.purpose', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'Questionnaire.copyright', 'min'=>0, 'max'=>1},
      'copyrightLabel' => {'type'=>'string', 'path'=>'Questionnaire.copyrightLabel', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'Questionnaire.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'Questionnaire.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'Questionnaire.effectivePeriod', 'min'=>0, 'max'=>1},
      'code' => {'valid_codes'=>{'http://loinc.org'=>['1-8', '10-9', '100-8', '1000-9', '10000-8', '10001-6', '10002-4', '10003-2', '10004-0', '10005-7', '10006-5', '10007-3', '10008-1', '10009-9', '1001-7', '10010-7', '10011-5', '10012-3', '10013-1', '10014-9', '10015-6', '10016-4', '10017-2', '10018-0', '10019-8', '1002-5', '10020-6', '10021-4', '10022-2', '10023-0', '10024-8', '10025-5', '10026-3', '10027-1', '10028-9', '10029-7', '1003-3', '10030-5', '10031-3', '10032-1', '10033-9', '10034-7', '10035-4', '10036-2', '10037-0', '10038-8', '10039-6', '1004-1', '10040-4', '10041-2', '10042-0', '10043-8', '10044-6', '10045-3', '10046-1', '10047-9', '10048-7', '10049-5', '1005-8', '10050-3', '10051-1', '10052-9', '10053-7', '10054-5', '10055-2', '10056-0', '10057-8', '10058-6', '10059-4', '1006-6', '10060-2', '10061-0', '10062-8', '10063-6', '10064-4', '10065-1', '10066-9', '10067-7', '10068-5', '10069-3', '1007-4', '10070-1', '10071-9', '10072-7', '10073-5', '10074-3', '10075-0', '10076-8', '10077-6', '10078-4', '10079-2', '1008-2', '10080-0', '10081-8', '10082-6', '10083-4', '10084-2', '10085-9', '10086-7', '10087-5', '10088-3', '10089-1', '1009-0', '10090-9', '10091-7', '10092-5', '10093-3', '10094-1', '10095-8', '10096-6', '10097-4', '10098-2', '10099-0', '101-6', '1010-8', '10100-6', '10101-4', '10102-2', '10103-0', '10104-8', '10105-5', '10106-3', '10107-1', '10108-9', '10109-7', '1011-6', '10110-5', '10111-3', '10112-1', '10113-9', '10114-7', '10115-4', '10116-2', '10117-0', '10118-8', '10119-6', '1012-4', '10120-4', '10121-2', '10122-0', '10123-8', '10124-6', '10125-3', '10126-1', '10127-9', '10128-7', '10129-5', '1013-2', '10130-3', '10131-1', '10132-9', '10133-7', '10134-5', '10135-2', '10136-0', '10137-8', '10138-6', '10139-4', '1014-0', '10140-2', '10141-0', '10142-8', '10143-6', '10144-4', '10145-1', '10146-9', '10147-7', '10148-5', '10149-3', '1015-7', '10150-1', '10151-9', '10152-7', '10153-5', '10154-3', '10155-0', '10156-8', '10157-6', '10158-4', '10159-2', '1016-5', '10160-0', '10161-8', '10162-6', '10163-4', '10164-2', '10165-9', '10166-7', '10167-5', '10168-3', '10169-1', '1017-3', '10170-9', '10171-7', '10172-5', '10173-3', '10174-1', '10175-8', '10176-6', '10177-4', '10178-2', '10179-0', '1018-1', '10180-8', '10181-6', '10182-4', '10183-2', '10184-0', '10185-7', '10186-5', '10187-3', '10188-1', '10189-9', '1019-9', '10190-7', '10191-5', '10192-3', '10193-1', '10194-9', '10195-6', '10196-4', '10197-2', '10198-0', '10199-8', '102-4', '1020-7', '10200-4', '10201-2', '10202-0', '10203-8', '10204-6', '10205-3', '10206-1', '10207-9', '10208-7', '10209-5', '1021-5', '10210-3', '10211-1', '10212-9', '10213-7', '10214-5', '10215-2', '10216-0', '10217-8', '10218-6', '10219-4', '1022-3', '10220-2', '10221-0', '10222-8', '10223-6', '10224-4', '10225-1', '10226-9', '10227-7', '10228-5', '10229-3', '1023-1', '10230-1', '10231-9', '10232-7', '10233-5', '10234-3', '10235-0', '10236-8', '10237-6', '10238-4', '10239-2', '1024-9', '10240-0', '10241-8', '10242-6', '10243-4', '10244-2', '10245-9', '10246-7', '10247-5', '10248-3', '10249-1', '1025-6', '10250-9', '10251-7', '10252-5', '10253-3', '10254-1', '10255-8', '10256-6', '10257-4', '10258-2', '10259-0', '1026-4', '10260-8', '10261-6', '10262-4', '10263-2', '10264-0', '10265-7', '10266-5', '10267-3', '10268-1', '10269-9', '1027-2', '10270-7', '10271-5', '10272-3', '10273-1', '10274-9', '10275-6', '10276-4', '10277-2', '10278-0', '10279-8', '1028-0', '10280-6', '10281-4', '10282-2', '10283-0', '10284-8', '10285-5', '10286-3', '10287-1', '10288-9', '10289-7', '1029-8', '10290-5', '10291-3', '10292-1', '10293-9', '10294-7', '10295-4', '10296-2', '10297-0', '10298-8', '10299-6', '103-2', '1030-6', '10300-2', '10301-0', '10302-8', '10303-6', '10304-4', '10305-1', '10306-9', '10307-7', '10308-5', '10309-3', '1031-4', '10310-1', '10311-9', '10312-7', '10313-5', '10314-3', '10315-0', '10316-8', '10317-6', '10318-4', '10319-2', '1032-2', '10320-0', '10321-8', '10322-6', '10323-4', '10324-2', '10325-9', '10326-7', '10327-5', '10328-3', '10329-1', '1033-0', '10330-9', '10331-7', '10332-5', '10333-3', '10334-1', '10335-8', '10336-6', '10337-4', '10338-2', '10339-0', '1034-8', '10340-8', '10341-6', '10342-4', '10343-2', '10344-0', '10345-7', '10346-5', '10347-3', '10348-1', '10349-9', '1035-5', '10350-7', '10351-5', '10352-3', '10353-1', '10354-9', '10355-6', '10356-4', '10357-2', '10358-0', '10359-8', '1036-3', '10360-6', '10361-4', '10362-2', '10363-0', '10364-8', '10365-5', '10366-3', '10367-1', '10368-9', '10369-7', '1037-1', '10370-5', '10371-3', '10372-1', '10373-9', '10374-7', '10375-4', '10376-2', '10377-0', '10378-8', '10379-6', '1038-9', '10380-4', '10381-2', '10382-0', '10383-8', '10384-6', '10385-3', '10386-1', '10387-9', '10388-7', '10389-5', '1039-7', '10390-3', '10391-1', '10392-9', '10393-7', '10394-5', '10395-2', '10396-0', '10397-8', '10398-6', '10399-4', '104-0', '1040-5', '10400-0', '10401-8', '10402-6', '10403-4', '10404-2', '10405-9', '10406-7', '10407-5', '10408-3', '10409-1', '1041-3', '10410-9', '10411-7', '10412-5', '10413-3', '10414-1', '10415-8', '10416-6', '10417-4', '10418-2', '10419-0', '1042-1', '10420-8', '10421-6', '10422-4', '10423-2', '10424-0', '10425-7', '10426-5', '10427-3', '10428-1', '10429-9', '1043-9', '10430-7', '10431-5', '10432-3', '10433-1', '10434-9', '10435-6', '10436-4', '10437-2', '10438-0', '10439-8', '1044-7', '10440-6', '10441-4', '10442-2', '10443-0', '10444-8', '10445-5', '10446-3', '10447-1', '10448-9', '10449-7', '1045-4', '10450-5', '10451-3', '10452-1', '10453-9', '10454-7', '10455-4', '10456-2', '10457-0', '10458-8', '10459-6', '1046-2', '10460-4', '10461-2', '10462-0', '10463-8', '10464-6', '10465-3', '10466-1', '10467-9', '10468-7', '10469-5', '1047-0', '10470-3', '10471-1', '10472-9', '10473-7', '10474-5', '10475-2', '10476-0', '10477-8', '10478-6', '10479-4', '1048-8', '10480-2', '10481-0', '10482-8', '10483-6', '10484-4', '10485-1', '10486-9', '10487-7', '10488-5', '10489-3', '1049-6', '10490-1', '10491-9', '10492-7', '10493-5', '10494-3', '10495-0', '10496-8', '10497-6', '10498-4', '10499-2', '105-7', '1050-4', '10500-7', '10501-5', '10502-3', '10503-1', '10504-9', '10505-6', '10506-4', '10507-2', '10508-0', '10509-8', '1051-2', '10510-6', '10511-4', '10512-2', '10513-0', '10514-8', '10515-5', '10516-3', '10517-1', '10518-9', '10519-7', '1052-0', '10520-5', '10521-3', '10522-1', '10523-9', '10524-7', '10525-4', '10526-2', '10527-0', '10528-8', '10529-6', '1053-8', '10530-4', '10531-2', '10532-0', '10533-8', '10534-6', '10535-3', '10536-1', '10537-9', '10538-7', '10539-5', '1054-6', '10540-3', '10541-1', '10542-9', '10543-7', '10544-5', '10545-2', '10546-0', '10547-8', '10548-6', '10549-4', '1055-3', '10550-2', '10551-0', '10552-8', '10553-6', '10554-4', '10555-1', '10556-9', '10557-7', '10558-5', '10559-3', '1056-1', '10560-1', '10561-9', '10562-7', '10563-5', '10564-3', '10565-0', '10566-8', '10567-6', '10568-4', '10569-2', '1057-9', '10570-0', '10571-8', '10572-6', '10573-4', '10574-2', '10575-9', '10576-7', '10577-5', '10578-3', '10579-1', '1058-7', '10580-9', '10581-7', '10582-5', '10583-3', '10584-1', '10585-8', '10586-6', '10587-4', '10588-2', '10589-0', '1059-5', '10590-8', '10591-6', '10592-4', '10593-2', '10594-0', '10595-7', '10596-5', '10597-3', '10598-1', '10599-9', '106-5', '1060-3', '10600-5', '10601-3', '10602-1', '10603-9', '10604-7', '10605-4', '10606-2', '10607-0', '10608-8', '10609-6', '1061-1', '10610-4', '10611-2', '10612-0', '10613-8', '10614-6', '10615-3', '10616-1', '10617-9', '10618-7', '10619-5', '1062-9', '10620-3', '10621-1', '10622-9', '10623-7', '10624-5', '10625-2', '10626-0', '10627-8', '10628-6', '10629-4', '1063-7', '10630-2', '10631-0', '10632-8', '10633-6', '10634-4', '10635-1', '10636-9', '10637-7', '10638-5', '10639-3', '1064-5', '10640-1', '10641-9', '10642-7', '10643-5', '10644-3', '10645-0', '10646-8', '10647-6', '10648-4', '10649-2', '1065-2', '10650-0', '10651-8', '10652-6', '10653-4', '10654-2', '10655-9', '10656-7', '10657-5', '10658-3', '10659-1', '1066-0', '10660-9', '10661-7', '10662-5', '10663-3', '10664-1', '10665-8', '10666-6', '10667-4', '10668-2', '10669-0', '1067-8', '10670-8', '10671-6', '10672-4', '10673-2', '10674-0', '10675-7', '10676-5', '10677-3', '10678-1', '10679-9', '1068-6', '10680-7', '10681-5', '10682-3', '10683-1', '10684-9', '10685-6', '10686-4', '10687-2', '10688-0', '10689-8', '1069-4', '10690-6', '10691-4', '10692-2', '10693-0', '10694-8', '10695-5', '10696-3', '10697-1', '10698-9', '10699-7', '107-3', '1070-2', '10700-3', '10701-1', '10702-9', '10703-7', '10704-5', '10705-2', '10706-0', '10707-8', '10708-6', '10709-4', '1071-0', '10710-2', '10711-0', '10712-8', '10713-6', '10714-4', '10715-1', '10716-9', '10717-7', '10718-5', '10719-3', '1072-8', '10720-1', '10721-9', '10722-7', '10723-5', '10724-3', '10725-0', '10726-8', '10727-6', '10728-4', '10729-2', '1073-6', '10730-0', '10731-8', '10732-6', '10733-4', '10734-2', '10735-9', '10736-7', '10737-5', '10738-3', '10739-1', '1074-4', '10740-9', '10741-7', '10742-5', '10743-3', '10744-1', '10745-8', '10746-6', '10747-4', '10748-2', '10749-0', '1075-1', '10750-8', '10751-6', '10752-4', '10753-2', '10754-0', '10755-7', '10756-5', '10757-3', '10758-1', '10759-9', '1076-9', '10760-7', '10761-5', '10762-3', '10763-1', '10764-9', '10765-6', '10766-4', '10767-2', '10768-0', '10769-8', '1077-7', '10770-6', '10771-4', '10772-2', '10773-0', '10774-8', '10775-5', '10776-3', '10777-1', '10778-9', '10779-7', '1078-5', '10780-5', '10781-3', '10782-1', '10783-9', '10784-7', '10785-4', '10786-2', '10787-0', '10788-8', '10789-6', '1079-3', '10790-4', '10791-2', '10792-0', '10793-8', '10794-6', '10795-3', '10796-1', '10797-9', '10798-7', '10799-5', '108-1', '1080-1', '10800-1', '10801-9', '10802-7', '10803-5', '10804-3', '10805-0', '10806-8', '10807-6', '10808-4', '10809-2', '1081-9', '10810-0', '10811-8', '10812-6', '10813-4', '10814-2', '10815-9', '10816-7', '10817-5', '10818-3', '10819-1', '1082-7', '10820-9', '10821-7', '10822-5', '10823-3', '10824-1', '10825-8', '10826-6', '10827-4', '10828-2', '10829-0', '1083-5', '10830-8', '10831-6', '10832-4', '10833-2', '10834-0', '10835-7', '10836-5', '10837-3', '10838-1', '10839-9', '1084-3', '10840-7', '10841-5', '10842-3', '10843-1', '10844-9', '10845-6', '10846-4', '10847-2', '10848-0', '10849-8', '1085-0', '10850-6', '10851-4', '10852-2', '10853-0', '10854-8', '10855-5', '10856-3', '10857-1', '10858-9', '10859-7', '1086-8', '10860-5', '10861-3', '10862-1', '10863-9', '10864-7', '10865-4', '10866-2', '10867-0', '10868-8', '10869-6', '1087-6', '10870-4', '10871-2', '10872-0', '10873-8', '10874-6', '10875-3', '10876-1', '10877-9', '10878-7', '10879-5', '1088-4', '10880-3', '10881-1', '10882-9', '10883-7', '10884-5', '10885-2', '10886-0', '10887-8', '10888-6', '10889-4', '1089-2', '10890-2', '10891-0', '10892-8', '10893-6', '10894-4', '10895-1', '10896-9', '10897-7', '10898-5']}, 'type'=>'Coding', 'path'=>'Questionnaire.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions'}},
      'item' => {'type'=>'Questionnaire::Item', 'path'=>'Questionnaire.item', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'linkId' => {'type'=>'string', 'path'=>'Item.linkId', 'min'=>1, 'max'=>1},
        'definition' => {'type'=>'uri', 'path'=>'Item.definition', 'min'=>0, 'max'=>1},
        'code' => {'valid_codes'=>{'http://loinc.org'=>['1-8', '10-9', '100-8', '1000-9', '10000-8', '10001-6', '10002-4', '10003-2', '10004-0', '10005-7', '10006-5', '10007-3', '10008-1', '10009-9', '1001-7', '10010-7', '10011-5', '10012-3', '10013-1', '10014-9', '10015-6', '10016-4', '10017-2', '10018-0', '10019-8', '1002-5', '10020-6', '10021-4', '10022-2', '10023-0', '10024-8', '10025-5', '10026-3', '10027-1', '10028-9', '10029-7', '1003-3', '10030-5', '10031-3', '10032-1', '10033-9', '10034-7', '10035-4', '10036-2', '10037-0', '10038-8', '10039-6', '1004-1', '10040-4', '10041-2', '10042-0', '10043-8', '10044-6', '10045-3', '10046-1', '10047-9', '10048-7', '10049-5', '1005-8', '10050-3', '10051-1', '10052-9', '10053-7', '10054-5', '10055-2', '10056-0', '10057-8', '10058-6', '10059-4', '1006-6', '10060-2', '10061-0', '10062-8', '10063-6', '10064-4', '10065-1', '10066-9', '10067-7', '10068-5', '10069-3', '1007-4', '10070-1', '10071-9', '10072-7', '10073-5', '10074-3', '10075-0', '10076-8', '10077-6', '10078-4', '10079-2', '1008-2', '10080-0', '10081-8', '10082-6', '10083-4', '10084-2', '10085-9', '10086-7', '10087-5', '10088-3', '10089-1', '1009-0', '10090-9', '10091-7', '10092-5', '10093-3', '10094-1', '10095-8', '10096-6', '10097-4', '10098-2', '10099-0', '101-6', '1010-8', '10100-6', '10101-4', '10102-2', '10103-0', '10104-8', '10105-5', '10106-3', '10107-1', '10108-9', '10109-7', '1011-6', '10110-5', '10111-3', '10112-1', '10113-9', '10114-7', '10115-4', '10116-2', '10117-0', '10118-8', '10119-6', '1012-4', '10120-4', '10121-2', '10122-0', '10123-8', '10124-6', '10125-3', '10126-1', '10127-9', '10128-7', '10129-5', '1013-2', '10130-3', '10131-1', '10132-9', '10133-7', '10134-5', '10135-2', '10136-0', '10137-8', '10138-6', '10139-4', '1014-0', '10140-2', '10141-0', '10142-8', '10143-6', '10144-4', '10145-1', '10146-9', '10147-7', '10148-5', '10149-3', '1015-7', '10150-1', '10151-9', '10152-7', '10153-5', '10154-3', '10155-0', '10156-8', '10157-6', '10158-4', '10159-2', '1016-5', '10160-0', '10161-8', '10162-6', '10163-4', '10164-2', '10165-9', '10166-7', '10167-5', '10168-3', '10169-1', '1017-3', '10170-9', '10171-7', '10172-5', '10173-3', '10174-1', '10175-8', '10176-6', '10177-4', '10178-2', '10179-0', '1018-1', '10180-8', '10181-6', '10182-4', '10183-2', '10184-0', '10185-7', '10186-5', '10187-3', '10188-1', '10189-9', '1019-9', '10190-7', '10191-5', '10192-3', '10193-1', '10194-9', '10195-6', '10196-4', '10197-2', '10198-0', '10199-8', '102-4', '1020-7', '10200-4', '10201-2', '10202-0', '10203-8', '10204-6', '10205-3', '10206-1', '10207-9', '10208-7', '10209-5', '1021-5', '10210-3', '10211-1', '10212-9', '10213-7', '10214-5', '10215-2', '10216-0', '10217-8', '10218-6', '10219-4', '1022-3', '10220-2', '10221-0', '10222-8', '10223-6', '10224-4', '10225-1', '10226-9', '10227-7', '10228-5', '10229-3', '1023-1', '10230-1', '10231-9', '10232-7', '10233-5', '10234-3', '10235-0', '10236-8', '10237-6', '10238-4', '10239-2', '1024-9', '10240-0', '10241-8', '10242-6', '10243-4', '10244-2', '10245-9', '10246-7', '10247-5', '10248-3', '10249-1', '1025-6', '10250-9', '10251-7', '10252-5', '10253-3', '10254-1', '10255-8', '10256-6', '10257-4', '10258-2', '10259-0', '1026-4', '10260-8', '10261-6', '10262-4', '10263-2', '10264-0', '10265-7', '10266-5', '10267-3', '10268-1', '10269-9', '1027-2', '10270-7', '10271-5', '10272-3', '10273-1', '10274-9', '10275-6', '10276-4', '10277-2', '10278-0', '10279-8', '1028-0', '10280-6', '10281-4', '10282-2', '10283-0', '10284-8', '10285-5', '10286-3', '10287-1', '10288-9', '10289-7', '1029-8', '10290-5', '10291-3', '10292-1', '10293-9', '10294-7', '10295-4', '10296-2', '10297-0', '10298-8', '10299-6', '103-2', '1030-6', '10300-2', '10301-0', '10302-8', '10303-6', '10304-4', '10305-1', '10306-9', '10307-7', '10308-5', '10309-3', '1031-4', '10310-1', '10311-9', '10312-7', '10313-5', '10314-3', '10315-0', '10316-8', '10317-6', '10318-4', '10319-2', '1032-2', '10320-0', '10321-8', '10322-6', '10323-4', '10324-2', '10325-9', '10326-7', '10327-5', '10328-3', '10329-1', '1033-0', '10330-9', '10331-7', '10332-5', '10333-3', '10334-1', '10335-8', '10336-6', '10337-4', '10338-2', '10339-0', '1034-8', '10340-8', '10341-6', '10342-4', '10343-2', '10344-0', '10345-7', '10346-5', '10347-3', '10348-1', '10349-9', '1035-5', '10350-7', '10351-5', '10352-3', '10353-1', '10354-9', '10355-6', '10356-4', '10357-2', '10358-0', '10359-8', '1036-3', '10360-6', '10361-4', '10362-2', '10363-0', '10364-8', '10365-5', '10366-3', '10367-1', '10368-9', '10369-7', '1037-1', '10370-5', '10371-3', '10372-1', '10373-9', '10374-7', '10375-4', '10376-2', '10377-0', '10378-8', '10379-6', '1038-9', '10380-4', '10381-2', '10382-0', '10383-8', '10384-6', '10385-3', '10386-1', '10387-9', '10388-7', '10389-5', '1039-7', '10390-3', '10391-1', '10392-9', '10393-7', '10394-5', '10395-2', '10396-0', '10397-8', '10398-6', '10399-4', '104-0', '1040-5', '10400-0', '10401-8', '10402-6', '10403-4', '10404-2', '10405-9', '10406-7', '10407-5', '10408-3', '10409-1', '1041-3', '10410-9', '10411-7', '10412-5', '10413-3', '10414-1', '10415-8', '10416-6', '10417-4', '10418-2', '10419-0', '1042-1', '10420-8', '10421-6', '10422-4', '10423-2', '10424-0', '10425-7', '10426-5', '10427-3', '10428-1', '10429-9', '1043-9', '10430-7', '10431-5', '10432-3', '10433-1', '10434-9', '10435-6', '10436-4', '10437-2', '10438-0', '10439-8', '1044-7', '10440-6', '10441-4', '10442-2', '10443-0', '10444-8', '10445-5', '10446-3', '10447-1', '10448-9', '10449-7', '1045-4', '10450-5', '10451-3', '10452-1', '10453-9', '10454-7', '10455-4', '10456-2', '10457-0', '10458-8', '10459-6', '1046-2', '10460-4', '10461-2', '10462-0', '10463-8', '10464-6', '10465-3', '10466-1', '10467-9', '10468-7', '10469-5', '1047-0', '10470-3', '10471-1', '10472-9', '10473-7', '10474-5', '10475-2', '10476-0', '10477-8', '10478-6', '10479-4', '1048-8', '10480-2', '10481-0', '10482-8', '10483-6', '10484-4', '10485-1', '10486-9', '10487-7', '10488-5', '10489-3', '1049-6', '10490-1', '10491-9', '10492-7', '10493-5', '10494-3', '10495-0', '10496-8', '10497-6', '10498-4', '10499-2', '105-7', '1050-4', '10500-7', '10501-5', '10502-3', '10503-1', '10504-9', '10505-6', '10506-4', '10507-2', '10508-0', '10509-8', '1051-2', '10510-6', '10511-4', '10512-2', '10513-0', '10514-8', '10515-5', '10516-3', '10517-1', '10518-9', '10519-7', '1052-0', '10520-5', '10521-3', '10522-1', '10523-9', '10524-7', '10525-4', '10526-2', '10527-0', '10528-8', '10529-6', '1053-8', '10530-4', '10531-2', '10532-0', '10533-8', '10534-6', '10535-3', '10536-1', '10537-9', '10538-7', '10539-5', '1054-6', '10540-3', '10541-1', '10542-9', '10543-7', '10544-5', '10545-2', '10546-0', '10547-8', '10548-6', '10549-4', '1055-3', '10550-2', '10551-0', '10552-8', '10553-6', '10554-4', '10555-1', '10556-9', '10557-7', '10558-5', '10559-3', '1056-1', '10560-1', '10561-9', '10562-7', '10563-5', '10564-3', '10565-0', '10566-8', '10567-6', '10568-4', '10569-2', '1057-9', '10570-0', '10571-8', '10572-6', '10573-4', '10574-2', '10575-9', '10576-7', '10577-5', '10578-3', '10579-1', '1058-7', '10580-9', '10581-7', '10582-5', '10583-3', '10584-1', '10585-8', '10586-6', '10587-4', '10588-2', '10589-0', '1059-5', '10590-8', '10591-6', '10592-4', '10593-2', '10594-0', '10595-7', '10596-5', '10597-3', '10598-1', '10599-9', '106-5', '1060-3', '10600-5', '10601-3', '10602-1', '10603-9', '10604-7', '10605-4', '10606-2', '10607-0', '10608-8', '10609-6', '1061-1', '10610-4', '10611-2', '10612-0', '10613-8', '10614-6', '10615-3', '10616-1', '10617-9', '10618-7', '10619-5', '1062-9', '10620-3', '10621-1', '10622-9', '10623-7', '10624-5', '10625-2', '10626-0', '10627-8', '10628-6', '10629-4', '1063-7', '10630-2', '10631-0', '10632-8', '10633-6', '10634-4', '10635-1', '10636-9', '10637-7', '10638-5', '10639-3', '1064-5', '10640-1', '10641-9', '10642-7', '10643-5', '10644-3', '10645-0', '10646-8', '10647-6', '10648-4', '10649-2', '1065-2', '10650-0', '10651-8', '10652-6', '10653-4', '10654-2', '10655-9', '10656-7', '10657-5', '10658-3', '10659-1', '1066-0', '10660-9', '10661-7', '10662-5', '10663-3', '10664-1', '10665-8', '10666-6', '10667-4', '10668-2', '10669-0', '1067-8', '10670-8', '10671-6', '10672-4', '10673-2', '10674-0', '10675-7', '10676-5', '10677-3', '10678-1', '10679-9', '1068-6', '10680-7', '10681-5', '10682-3', '10683-1', '10684-9', '10685-6', '10686-4', '10687-2', '10688-0', '10689-8', '1069-4', '10690-6', '10691-4', '10692-2', '10693-0', '10694-8', '10695-5', '10696-3', '10697-1', '10698-9', '10699-7', '107-3', '1070-2', '10700-3', '10701-1', '10702-9', '10703-7', '10704-5', '10705-2', '10706-0', '10707-8', '10708-6', '10709-4', '1071-0', '10710-2', '10711-0', '10712-8', '10713-6', '10714-4', '10715-1', '10716-9', '10717-7', '10718-5', '10719-3', '1072-8', '10720-1', '10721-9', '10722-7', '10723-5', '10724-3', '10725-0', '10726-8', '10727-6', '10728-4', '10729-2', '1073-6', '10730-0', '10731-8', '10732-6', '10733-4', '10734-2', '10735-9', '10736-7', '10737-5', '10738-3', '10739-1', '1074-4', '10740-9', '10741-7', '10742-5', '10743-3', '10744-1', '10745-8', '10746-6', '10747-4', '10748-2', '10749-0', '1075-1', '10750-8', '10751-6', '10752-4', '10753-2', '10754-0', '10755-7', '10756-5', '10757-3', '10758-1', '10759-9', '1076-9', '10760-7', '10761-5', '10762-3', '10763-1', '10764-9', '10765-6', '10766-4', '10767-2', '10768-0', '10769-8', '1077-7', '10770-6', '10771-4', '10772-2', '10773-0', '10774-8', '10775-5', '10776-3', '10777-1', '10778-9', '10779-7', '1078-5', '10780-5', '10781-3', '10782-1', '10783-9', '10784-7', '10785-4', '10786-2', '10787-0', '10788-8', '10789-6', '1079-3', '10790-4', '10791-2', '10792-0', '10793-8', '10794-6', '10795-3', '10796-1', '10797-9', '10798-7', '10799-5', '108-1', '1080-1', '10800-1', '10801-9', '10802-7', '10803-5', '10804-3', '10805-0', '10806-8', '10807-6', '10808-4', '10809-2', '1081-9', '10810-0', '10811-8', '10812-6', '10813-4', '10814-2', '10815-9', '10816-7', '10817-5', '10818-3', '10819-1', '1082-7', '10820-9', '10821-7', '10822-5', '10823-3', '10824-1', '10825-8', '10826-6', '10827-4', '10828-2', '10829-0', '1083-5', '10830-8', '10831-6', '10832-4', '10833-2', '10834-0', '10835-7', '10836-5', '10837-3', '10838-1', '10839-9', '1084-3', '10840-7', '10841-5', '10842-3', '10843-1', '10844-9', '10845-6', '10846-4', '10847-2', '10848-0', '10849-8', '1085-0', '10850-6', '10851-4', '10852-2', '10853-0', '10854-8', '10855-5', '10856-3', '10857-1', '10858-9', '10859-7', '1086-8', '10860-5', '10861-3', '10862-1', '10863-9', '10864-7', '10865-4', '10866-2', '10867-0', '10868-8', '10869-6', '1087-6', '10870-4', '10871-2', '10872-0', '10873-8', '10874-6', '10875-3', '10876-1', '10877-9', '10878-7', '10879-5', '1088-4', '10880-3', '10881-1', '10882-9', '10883-7', '10884-5', '10885-2', '10886-0', '10887-8', '10888-6', '10889-4', '1089-2', '10890-2', '10891-0', '10892-8', '10893-6', '10894-4', '10895-1', '10896-9', '10897-7', '10898-5']}, 'type'=>'Coding', 'path'=>'Item.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions'}},
        'prefix' => {'type'=>'string', 'path'=>'Item.prefix', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'Item.text', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/item-type'=>['group', 'display', 'question', 'boolean', 'decimal', 'integer', 'date', 'dateTime', 'time', 'string', 'text', 'url', 'coding', 'attachment', 'reference', 'quantity']}, 'type'=>'code', 'path'=>'Item.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/item-type'}},
        'enableWhen' => {'type'=>'Questionnaire::Item::EnableWhen', 'path'=>'Item.enableWhen', 'min'=>0, 'max'=>Float::INFINITY},
        'enableBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-enable-behavior'=>['all', 'any']}, 'type'=>'code', 'path'=>'Item.enableBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-enable-behavior'}},
        'disabledDisplay' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-disabled-display'=>['hidden', 'protected']}, 'type'=>'code', 'path'=>'Item.disabledDisplay', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-disabled-display'}},
        'required' => {'type'=>'boolean', 'path'=>'Item.required', 'min'=>0, 'max'=>1},
        'repeats' => {'type'=>'boolean', 'path'=>'Item.repeats', 'min'=>0, 'max'=>1},
        'readOnly' => {'type'=>'boolean', 'path'=>'Item.readOnly', 'min'=>0, 'max'=>1},
        'maxLength' => {'type'=>'integer', 'path'=>'Item.maxLength', 'min'=>0, 'max'=>1},
        'answerConstraint' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-answer-constraint'=>['optionsOnly', 'optionsOrType', 'optionsOrString']}, 'type'=>'code', 'path'=>'Item.answerConstraint', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answer-constraint'}},
        'answerValueSet' => {'type'=>'canonical', 'path'=>'Item.answerValueSet', 'min'=>0, 'max'=>1},
        'answerOption' => {'type'=>'Questionnaire::Item::AnswerOption', 'path'=>'Item.answerOption', 'min'=>0, 'max'=>Float::INFINITY},
        'initial' => {'type'=>'Questionnaire::Item::Initial', 'path'=>'Item.initial', 'min'=>0, 'max'=>Float::INFINITY},
        'item' => {'type'=>'Questionnaire::Item', 'path'=>'Item.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class EnableWhen < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'answer' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'time', 'string', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'EnableWhen.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'EnableWhen.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'EnableWhen.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'question' => {'type'=>'string', 'path'=>'EnableWhen.question', 'min'=>1, 'max'=>1},
          'operator' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-enable-operator'=>['exists', '=', '!=', '>', '<', '>=', '<=']}, 'type'=>'code', 'path'=>'EnableWhen.operator', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-enable-operator'}},
          'answerBoolean' => {'type'=>'boolean', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDecimal' => {'type'=>'decimal', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerInteger' => {'type'=>'integer', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDate' => {'type'=>'date', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerDateTime' => {'type'=>'dateTime', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerTime' => {'type'=>'time', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerString' => {'type'=>'string', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerCoding' => {'type'=>'Coding', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers'}},
          'answerQuantity' => {'type'=>'Quantity', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1},
          'answerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'EnableWhen.answer[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :question          # 1-1 string
        attr_accessor :operator          # 1-1 code
        attr_accessor :answerBoolean     # 1-1 boolean
        attr_accessor :answerDecimal     # 1-1 decimal
        attr_accessor :answerInteger     # 1-1 integer
        attr_accessor :answerDate        # 1-1 date
        attr_accessor :answerDateTime    # 1-1 dateTime
        attr_accessor :answerTime        # 1-1 time
        attr_accessor :answerString      # 1-1 string
        attr_accessor :answerCoding      # 1-1 Coding
        attr_accessor :answerQuantity    # 1-1 Quantity
        attr_accessor :answerReference   # 1-1 Reference(Resource)
      end

      class AnswerOption < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['integer', 'date', 'time', 'string', 'Coding', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AnswerOption.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AnswerOption.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'AnswerOption.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueInteger' => {'type'=>'integer', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers'}},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'AnswerOption.value[x]', 'min'=>1, 'max'=>1},
          'initialSelected' => {'type'=>'boolean', 'path'=>'AnswerOption.initialSelected', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueDate         # 1-1 date
        attr_accessor :valueTime         # 1-1 time
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueCoding       # 1-1 Coding
        attr_accessor :valueReference    # 1-1 Reference(Resource)
        attr_accessor :initialSelected   # 0-1 boolean
      end

      class Initial < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'time', 'string', 'uri', 'Attachment', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Initial.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Initial.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Initial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers'}},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Initial.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :valueBoolean      # 1-1 boolean
        attr_accessor :valueDecimal      # 1-1 decimal
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueDate         # 1-1 date
        attr_accessor :valueDateTime     # 1-1 dateTime
        attr_accessor :valueTime         # 1-1 time
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueUri          # 1-1 uri
        attr_accessor :valueAttachment   # 1-1 Attachment
        attr_accessor :valueCoding       # 1-1 Coding
        attr_accessor :valueQuantity     # 1-1 Quantity
        attr_accessor :valueReference    # 1-1 Reference(Resource)
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :linkId            # 1-1 string
      attr_accessor :definition        # 0-1 uri
      attr_accessor :code              # 0-* [ Coding ]
      attr_accessor :prefix            # 0-1 string
      attr_accessor :text              # 0-1 string
      attr_accessor :type              # 1-1 code
      attr_accessor :enableWhen        # 0-* [ Questionnaire::Item::EnableWhen ]
      attr_accessor :enableBehavior    # 0-1 code
      attr_accessor :enableDisplay     # 0-1 code
      attr_accessor :required          # 0-1 boolean
      attr_accessor :repeats           # 0-1 boolean
      attr_accessor :readOnly          # 0-1 boolean
      attr_accessor :maxLength         # 0-1 integer
      attr_accessor :answerConstraint  # 0-1 code
      attr_accessor :answerValueSet    # 0-1 canonical
      attr_accessor :answerOption      # 0-* [ Questionnaire::Item::AnswerOption ]
      attr_accessor :initial           # 0-* [ Questionnaire::Item::Initial ]
      attr_accessor :item              # 0-* [ Questionnaire::Item ]
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :url                    # 0-1 uri
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :versionAlgorithmString # 0-1 string
    attr_accessor :versionAlgorithmCoding # 0-1 Coding
    attr_accessor :name                   # 0-1 string
    attr_accessor :title                  # 0-1 string
    attr_accessor :derivedFrom            # 0-* [ canonical ]
    attr_accessor :status                 # 1-1 code
    attr_accessor :experimental           # 0-1 boolean
    attr_accessor :subjectType            # 0-* [ code ]
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :publisher              # 0-1 string
    attr_accessor :contact                # 0-* [ ContactDetail ]
    attr_accessor :description            # 0-1 markdown
    attr_accessor :useContext             # 0-* [ UsageContext ]
    attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
    attr_accessor :purpose                # 0-1 markdown
    attr_accessor :copyright              # 0-1 markdown
    attr_accessor :copyrightLabel         # 0-1 string
    attr_accessor :approvalDate           # 0-1 date
    attr_accessor :lastReviewDate         # 0-1 date
    attr_accessor :effectivePeriod        # 0-1 Period
    attr_accessor :code                   # 0-* [ Coding ]
    attr_accessor :item                   # 0-* [ Questionnaire::Item ]

    def resourceType
      'Questionnaire'
    end
  end
end
