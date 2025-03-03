module FHIR
  class Composition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['attester', 'author', 'category', 'date', 'encounter', 'entry', 'event-code', 'event-reference', 'identifier', 'patient', 'period', 'type', 'related', 'section', 'section-code-text', 'section-text', 'status', 'subject', 'title', 'type', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Composition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Composition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Composition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Composition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Composition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Composition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Composition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Composition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Composition.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Composition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'Composition.version', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/composition-status'=>['registered', 'partial', 'preliminary', 'final', 'amended', 'corrected', 'appended', 'cancelled', 'entered-in-error', 'deprecated', 'unknown']}, 'type'=>'code', 'path'=>'Composition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/composition-status'}},
      'type' => {'valid_codes'=>{'http://loinc.org'=>['11485-0', '11486-8', '11488-4', '11490-0', '11492-6', '11494-2', '11495-9', '11496-7', '11497-5', '11498-3', '11499-1', '11500-6', '11502-2', '11503-0', '11504-8', '11505-5', '11506-3', '11507-1', '11508-9', '11509-7', '11510-5', '11512-1', '11514-7', '11515-4', '11516-2', '11517-0', '11518-8', '11519-6', '11520-4', '11521-2', '11522-0', '11523-8', '11524-6', '11525-3', '11526-1', '11527-9', '11528-7', '11529-5', '11534-5', '11536-0', '11538-6', '11539-4', '11540-2', '11541-0', '11542-8', '11543-6', '15507-7', '15508-5', '17787-3', '18762-5', '18763-3', '18764-1', '18765-8', '18766-6', '18841-7', '18842-5', '18594-2', '18733-6', '18734-4', '18735-1', '18736-9', '18737-7', '18738-5', '18739-3', '18740-1', '18741-9', '18742-7', '18743-5', '18744-3', '18745-0', '18746-8', '18747-6', '18748-4', '18749-2', '18750-0', '18751-8', '18752-6', '18753-4', '18754-2', '18755-9', '18756-7', '18757-5', '18758-3', '18759-1', '18760-9', '18761-7', '18776-5', '18823-5', '18824-3', '18825-0', '18826-8', '18836-7', '19002-5', '19003-3', '19004-1', '24600-9', '24601-7', '24602-5', '24603-3', '24604-1', '25054-8', '25055-5', '25056-3', '25057-1', '24673-6', '24674-4', '24675-1', '24676-9', '24677-7', '24678-5', '24787-4', '24788-2', '24789-0', '24790-8', '24840-1', '24841-9', '24842-7', '24843-5', '24844-3', '24965-6', '24967-2', '24968-0', '24969-8', '25022-5', '25023-3', '25024-1', '24531-6', '24532-4', '24533-2', '24534-0', '24535-7', '24536-5', '24537-3', '24538-1', '24539-9', '24540-7', '24541-5', '24542-3', '24543-1', '24544-9', '24545-6', '24546-4', '24547-2', '24548-0', '24549-8', '24550-6', '24551-4', '24552-2', '24553-0', '24554-8', '24555-5', '24556-3', '24557-1', '24558-9', '24559-7', '24560-5', '24561-3', '24562-1', '24563-9', '24564-7', '24566-2', '24567-0', '24568-8', '24569-6', '24570-4', '24571-2', '24572-0', '24573-8', '24574-6', '24575-3', '24576-1', '24577-9', '24578-7', '24579-5', '24580-3', '24581-1', '24582-9', '24583-7', '24584-5', '24585-2', '24586-0', '24587-8', '24588-6', '24589-4', '24590-2', '24591-0', '24593-6', '24761-9', '24762-7', '24764-3', '24765-0', '24766-8', '24767-6', '24769-2', '24770-0', '24943-3', '24944-1', '24945-8', '24946-6', '24947-4', '24948-2', '24963-1', '24964-9', '25061-3', '25062-1', '25063-9', '25064-7', '25065-4', '25066-2', '25067-0', '25068-8', '25069-6', '24594-4', '24595-1', '24596-9', '24597-7', '24598-5', '24599-3', '24605-8', '24606-6', '24609-0', '24610-8', '24611-6', '24612-4', '24613-2', '24614-0', '24615-7', '24616-5', '24617-3', '24619-9', '24620-7', '24621-5', '24622-3', '24623-1', '24624-9', '24625-6', '24626-4', '24627-2', '24628-0', '24629-8', '24630-6', '24631-4', '24632-2', '24634-8', '24635-5', '24636-3', '24637-1', '24638-9', '24639-7', '24640-5', '24641-3', '24642-1', '24643-9', '24644-7', '24645-4', '24646-2', '24647-0', '24648-8', '24649-6', '24650-4', '24651-2', '24652-0', '24653-8', '24654-6', '24655-3', '24656-1', '24657-9', '24658-7', '24659-5', '24660-3', '24661-1', '24662-9', '24663-7', '24664-5', '24665-2', '24666-0', '24667-8', '24668-6', '24669-4', '24670-2', '24671-0', '24672-8', '24679-3', '24680-1', '24681-9', '24682-7', '24683-5', '24684-3', '24685-0', '24686-8', '24687-6', '24688-4', '24689-2', '24690-0', '24691-8', '24692-6', '24693-4', '24694-2', '24695-9', '24696-7', '24697-5', '24698-3', '24699-1', '24700-7', '24702-3', '24703-1', '24704-9', '24705-6', '24706-4', '24707-2', '24708-0', '24709-8', '24710-6', '24711-4', '24712-2', '24713-0', '24714-8', '24715-5', '24716-3', '24717-1', '24718-9', '24719-7', '24720-5', '24721-3', '24722-1', '24723-9', '24724-7', '24725-4', '24726-2', '24727-0', '24728-8', '24729-6', '24730-4', '24731-2', '24732-0', '24733-8', '24734-6', '24735-3', '24740-3', '24745-2', '24746-0', '24747-8', '24748-6', '24750-2', '24751-0', '24752-8', '24753-6', '24754-4', '24755-1', '24756-9', '24757-7', '24760-1', '24771-8', '24772-6', '24773-4', '24776-7', '24778-3', '24779-1', '24780-9', '24781-7', '24782-5', '24783-3', '24784-1', '24792-4', '24793-2', '24794-0', '24795-7', '24796-5', '24797-3', '24798-1', '24799-9', '24800-5', '24801-3', '24802-1', '24803-9', '24804-7', '24805-4', '24806-2', '24807-0', '24808-8', '24809-6', '24811-2', '24812-0', '24813-8', '24814-6', '24815-3', '24816-1', '24817-9', '24818-7', '24819-5', '24820-3', '24821-1', '24822-9', '24823-7', '24824-5', '24825-2', '24826-0', '24827-8', '24828-6', '24829-4', '24830-2', '24831-0', '24832-8', '24833-6', '24834-4', '24835-1', '24836-9', '24837-7', '24838-5', '24839-3', '24845-0', '24846-8', '24848-4', '24849-2', '24850-0', '24851-8', '24852-6', '24853-4', '24854-2', '24855-9', '24856-7', '24857-5', '24858-3', '24859-1', '24860-9', '24861-7', '24862-5', '24863-3', '24864-1', '24865-8', '24866-6', '24867-4', '24868-2', '24869-0', '24870-8', '24871-6', '24872-4', '24873-2', '24874-0', '24875-7', '24876-5', '24877-3', '24878-1', '24879-9', '24880-7', '24881-5', '24882-3', '24883-1', '24884-9', '24885-6', '24887-2', '24888-0', '24889-8', '24891-4', '24892-2', '24893-0', '24894-8', '24896-3', '24899-7', '24900-3', '24901-1', '24902-9', '24903-7', '24904-5', '24905-2', '24906-0', '24907-8', '24908-6', '24909-4', '24910-2', '24911-0', '24912-8', '24913-6', '24914-4', '24915-1', '24916-9', '24917-7', '24918-5', '24919-3', '24920-1', '24921-9', '24922-7', '24923-5', '24924-3', '24925-0', '24926-8', '24927-6', '24928-4', '24929-2', '24930-0', '24931-8', '24932-6', '24933-4', '24934-2', '24935-9', '24936-7', '24937-5', '24938-3', '24939-1', '24940-9', '24941-7', '24942-5', '24970-6', '24971-4', '24972-2', '24973-0', '24974-8', '24975-5', '24977-1', '24978-9', '24979-7', '24980-5', '24981-3', '24982-1', '24983-9', '24984-7', '24985-4', '24986-2', '24987-0', '24988-8', '24989-6', '24990-4', '24991-2', '24992-0', '24993-8', '24994-6', '24995-3', '24996-1', '24997-9', '24998-7', '24999-5', '25000-1', '25001-9', '25002-7', '25003-5', '25005-0', '25006-8', '25007-6', '25008-4', '25009-2', '25010-0', '25011-8', '25012-6', '25013-4', '25014-2', '25015-9', '25016-7', '25017-5', '25018-3', '25019-1', '25020-9', '25025-8', '25026-6', '25027-4', '25028-2', '25029-0', '25030-8', '25031-6', '25032-4', '25033-2', '25034-0', '25035-7', '25036-5', '25038-1', '25039-9', '25040-7', '25041-5', '25042-3', '25043-1', '25044-9', '25045-6', '25046-4', '25047-2', '25050-6', '25051-4', '25052-2', '25053-0', '25058-9', '25059-7', '25060-5', '25070-4', '25071-2', '25072-0', '25073-8', '25074-6', '25076-1', '25077-9', '25078-7', '25079-5', '25080-3', '25081-1', '26132-1', '26133-9', '26134-7', '26135-4', '26136-2', '26137-0', '26238-6', '26239-4', '26240-2', '26241-0', '26242-8', '26243-6', '26296-4', '26297-2', '26298-0', '26299-8', '26300-4', '26342-6', '26343-4', '26344-2', '26345-9', '26346-7', '26400-2', '26401-0', '26402-8', '26129-7', '26130-5', '26131-3', '26138-8', '26139-6', '26140-4', '26141-2', '26142-0', '26064-6', '26065-3', '26066-1', '26067-9', '26068-7', '26069-5', '26070-3', '26071-1', '26072-9', '26073-7', '26074-5', '26075-2', '26076-0', '26077-8', '26078-6', '26079-4', '26080-2', '26081-0', '26082-8', '26083-6', '26084-4', '26085-1', '26086-9', '26087-7', '26088-5', '26089-3', '26090-1', '26091-9', '26092-7', '26093-5', '26094-3', '26095-0', '26096-8', '26097-6', '26098-4', '26099-2', '26100-8', '26101-6', '26102-4', '26106-5', '26107-3', '26108-1', '26109-9', '26110-7', '26111-5', '26112-3', '26113-1', '26114-9', '26115-6', '26116-4', '26117-2', '26118-0', '26120-6', '26122-2', '26124-8', '26125-5', '26126-3', '26127-1', '26128-9', '26143-8', '26144-6', '26146-1', '26148-7', '26150-3', '26151-1', '26152-9', '26153-7', '26154-5', '26155-2', '26156-0', '26157-8', '26158-6', '26159-4', '26160-2', '26161-0', '26162-8', '26163-6', '26164-4', '26165-1', '26166-9', '26167-7', '26168-5', '26169-3', '26170-1', '26171-9', '26172-7', '26173-5', '26174-3', '26175-0', '26176-8', '26177-6', '26178-4', '26179-2', '26180-0', '26181-8', '26182-6', '26183-4', '26184-2', '26185-9', '26186-7', '26187-5', '26188-3', '26189-1', '26190-9', '26191-7', '26192-5', '26193-3', '26194-1', '26195-8', '26196-6', '26197-4', '26198-2', '26199-0', '26200-6', '26201-4', '26202-2', '26203-0', '26204-8', '26205-5', '26206-3', '26207-1', '26208-9', '26209-7', '26210-5', '26211-3', '26212-1', '26213-9', '26214-7', '26215-4', '26216-2', '26217-0', '26218-8', '26219-6', '26220-4', '26221-2', '26222-0', '26223-8', '26224-6', '26225-3', '26226-1', '26227-9', '26228-7', '26229-5', '26230-3', '26231-1', '26232-9', '26233-7', '26234-5', '26235-2', '26236-0', '26237-8', '26244-4', '26245-1', '26246-9', '26247-7', '26248-5', '26249-3', '26250-1', '26251-9', '26252-7', '26253-5', '26254-3', '26255-0', '26256-8', '26257-6', '26258-4', '26259-2', '26260-0', '26261-8', '26262-6', '26263-4', '26264-2', '26265-9', '26266-7', '26267-5', '26268-3', '26269-1', '26270-9', '26271-7', '26272-5', '26273-3', '26277-4', '26278-2', '26279-0', '26280-8', '26281-6', '26282-4', '26283-2', '26284-0', '26285-7', '26286-5', '26287-3', '26288-1', '26289-9', '26290-7', '26291-5', '26292-3', '26293-1', '26294-9', '26295-6', '26301-2', '26302-0', '26303-8', '26304-6', '26305-3', '26306-1', '26307-9', '26308-7', '26309-5', '26310-3', '26311-1', '26312-9', '26313-7', '26314-5', '26315-2', '26316-0', '26317-8', '26318-6', '26319-4', '26320-2', '26321-0', '26322-8', '26323-6', '26324-4', '26325-1', '26326-9', '26327-7', '26328-5', '26329-3', '26330-1', '26331-9', '26332-7', '26333-5', '26334-3', '26335-0', '26336-8', '26337-6', '26338-4', '26339-2', '26340-0', '26341-8', '26347-5', '26348-3', '26349-1', '26350-9', '26351-7', '26352-5', '26353-3', '26354-1', '26355-8', '26356-6', '26357-4', '26358-2', '26359-0', '26360-8', '26361-6', '26362-4', '26363-2', '26364-0', '26365-7', '26366-5', '26368-1', '26369-9', '26370-7', '26371-5', '26372-3', '26373-1', '26374-9', '26375-6', '26376-4', '26377-2', '26378-0', '26379-8', '26380-6', '26381-4', '26382-2', '26383-0', '26384-8', '26385-5', '26386-3', '26387-1', '26388-9', '26389-7', '26390-5', '26391-3', '26392-1', '26393-9', '26394-7', '26395-4', '26396-2', '26397-0', '26398-8', '26399-6', '28032-1', '28561-9', '28564-3', '28565-0', '28566-8', '28567-6', '28568-4', '28569-2', '28570-0', '28571-8', '28572-6', '28573-4', '28574-2', '28575-9', '28576-7', '28577-5', '28578-3', '28579-1', '28580-9', '28581-7', '28582-5', '28583-3', '28613-8', '28614-6', '28615-3', '28616-1', '28617-9', '28618-7', '28621-1', '28622-9', '28623-7', '28624-5', '28625-2', '28626-0', '28627-8', '28628-6', '28629-4', '28630-2', '28631-0', '28632-8', '28633-6', '28635-1', '28636-9', '28651-8', '28653-4', '28654-2', '28655-9', '28656-7', '29272-2', '29206-0', '29252-4', '29749-9', '29750-7', '29751-5', '29752-3', '29753-1', '29754-9', '29755-6', '29756-4', '29757-2', '29761-4', '30816-3', '30817-1', '30818-9', '30819-7', '30604-3', '30605-0', '30606-8', '30607-6', '30608-4', '30578-9', '30579-7', '30580-5', '30581-3', '30582-1', '30583-9', '30584-7', '30585-4', '30586-2', '30587-0', '30588-8', '30589-6', '30590-4']}, 'type'=>'CodeableConcept', 'path'=>'Composition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/doc-typecodes'}},
      'category' => {'valid_codes'=>{'http://loinc.org'=>['11369-6', '11485-0', '11486-8', '11488-4', '11506-3', '11543-6', '15508-5', '18726-0', '18761-7', '18842-5', '26436-6', '26441-6', '26442-4', '27895-2', '27896-0', '27897-8', '27898-6', '28570-0', '28619-5', '28634-4', '29749-9', '29750-7', '29751-5', '29752-3', '34109-9', '34117-2', '34121-4', '34122-2', '34133-9', '34140-4', '34748-4', '34775-7', '47039-3', '47042-7', '47045-0', '47046-8', '47049-2', '57017-6', '57016-8', '56445-0', '53576-5', '56447-6', '18748-4', '11504-8', '57133-1']}, 'type'=>'CodeableConcept', 'path'=>'Composition.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/document-classcodes'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Composition.subject', 'min'=>0, 'max'=>Float::INFINITY},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Composition.encounter', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'Composition.date', 'min'=>1, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'Composition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Composition.author', 'min'=>1, 'max'=>Float::INFINITY},
      'name' => {'type'=>'string', 'path'=>'Composition.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'Composition.title', 'min'=>1, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Composition.note', 'min'=>0, 'max'=>Float::INFINITY},
      'attester' => {'type'=>'Composition::Attester', 'path'=>'Composition.attester', 'min'=>0, 'max'=>Float::INFINITY},
      'custodian' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Composition.custodian', 'min'=>0, 'max'=>1},
      'relatesTo' => {'type'=>'RelatedArtifact', 'path'=>'Composition.relatesTo', 'min'=>0, 'max'=>Float::INFINITY},
      'event' => {'type'=>'Composition::Event', 'path'=>'Composition.event', 'min'=>0, 'max'=>Float::INFINITY},
      'section' => {'type'=>'Composition::Section', 'path'=>'Composition.section', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Attester < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Attester.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Attester.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Attester.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/composition-attestation-mode'=>['personal', 'professional', 'legal', 'official']}, 'type'=>'code', 'path'=>'Attester.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/composition-attestation-mode'}},
        'time' => {'type'=>'dateTime', 'path'=>'Attester.time', 'min'=>0, 'max'=>1},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Attester.party', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :time              # 0-1 dateTime
      attr_accessor :party             # 0-1 Reference(Patient|RelatedPerson|Practitioner|PractitionerRole|Organization)
    end

    class Event < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'Event.period', 'min'=>0, 'max'=>1},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Event.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :detail            # 0-* [ Reference(Resource) ]
    end

    class Section < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Section.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Section.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Section.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'title' => {'type'=>'string', 'path'=>'Section.title', 'min'=>0, 'max'=>1},
        'code' => {'valid_codes'=>{'http://loinc.org'=>['10154-3', '10157-6', '10160-0', '10164-2', '10183-2', '10184-0', '10187-3', '10210-3', '10216-0', '10218-6', '10223-6', '10222-8', '11329-0', '11348-0', '11369-6', '57852-6', '11493-4', '11535-2', '11537-8', '18776-5', '18841-7', '29299-5', '29545-1', '29549-3', '29554-3', '29762-2', '30954-2', '42344-2', '42346-7', '42348-3', '42349-1', '46240-8', '46241-6', '46264-8', '47420-5', '47519-4', '48765-2', '48768-6', '51848-0', '55109-3', '55122-6', '59768-2', '59769-0', '59770-8', '59771-6', '59772-4', '59773-2', '59775-7', '59776-5', '61149-1', '61150-9', '69730-0', '8648-8', '8653-8', '8716-3']}, 'type'=>'CodeableConcept', 'path'=>'Section.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/doc-section-codes'}},
        'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Section.author', 'min'=>0, 'max'=>Float::INFINITY},
        'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.focus', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'Narrative', 'path'=>'Section.text', 'min'=>0, 'max'=>1},
        'orderedBy' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/list-order'=>['user', 'system', 'event-date', 'entry-date', 'priority', 'alphabetic', 'category', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Section.orderedBy', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/list-order'}},
        'entry' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.entry', 'min'=>0, 'max'=>Float::INFINITY},
        'emptyReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/list-empty-reason'=>['nilknown', 'notasked', 'withheld', 'unavailable', 'notstarted', 'closed']}, 'type'=>'CodeableConcept', 'path'=>'Section.emptyReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/list-empty-reason'}},
        'section' => {'type'=>'Composition::Section', 'path'=>'Section.section', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :title             # 0-1 string
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :author            # 0-* [ Reference(Practitioner|PractitionerRole|Device|Patient|RelatedPerson|Organization) ]
      attr_accessor :focus             # 0-1 Reference(Resource)
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :orderedBy         # 0-1 CodeableConcept
      attr_accessor :entry             # 0-* [ Reference(Resource) ]
      attr_accessor :emptyReason       # 0-1 CodeableConcept
      attr_accessor :section           # 0-* [ Composition::Section ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 0-1 uri
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :type              # 1-1 CodeableConcept
    attr_accessor :category          # 0-* [ CodeableConcept ]
    attr_accessor :subject           # 0-* [ Reference(Resource) ]
    attr_accessor :encounter         # 0-1 Reference(Encounter)
    attr_accessor :date              # 1-1 dateTime
    attr_accessor :useContext        # 0-* UsageContext
    attr_accessor :author            # 1-* [ Reference(Practitioner|PractitionerRole|Device|Patient|RelatedPerson|Organization) ]
    attr_accessor :name              # 0-1 string
    attr_accessor :title             # 1-1 string
    attr_accessor :note              # 0-* [ Annotation ]
    attr_accessor :attester          # 0-* [ Composition::Attester ]
    attr_accessor :custodian         # 0-1 Reference(Organization)
    attr_accessor :relatesTo         # 0-* [ RelatedArtifact ]
    attr_accessor :event             # 0-* [ Composition::Event ]
    attr_accessor :section           # 0-* [ Composition::Section ]

    def resourceType
      'Composition'
    end
  end
end
