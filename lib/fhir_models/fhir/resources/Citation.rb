module FHIR
  class Citation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Citation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Citation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Citation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Citation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Citation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Citation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Citation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Citation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Citation.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Citation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'Citation.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'Citation.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'Citation.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Citation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'Citation.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'Citation.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Citation.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'Citation.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'Citation.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'Citation.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'Citation.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'purpose' => {'type'=>'markdown', 'path'=>'Citation.purpose', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'Citation.copyright', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'Citation.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'Citation.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'Citation.effectivePeriod', 'min'=>0, 'max'=>1},
      'author' => {'type'=>'ContactDetail', 'path'=>'Citation.author', 'min'=>0, 'max'=>Float::INFINITY},
      'editor' => {'type'=>'ContactDetail', 'path'=>'Citation.editor', 'min'=>0, 'max'=>Float::INFINITY},
      'reviewer' => {'type'=>'ContactDetail', 'path'=>'Citation.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
      'endorser' => {'type'=>'ContactDetail', 'path'=>'Citation.endorser', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'Citation.note', 'min'=>0, 'max'=>Float::INFINITY},
      'currentState' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/citation-status-type'=>['pubmed-pubstatus-received', 'pubmed-pubstatus-accepted', 'pubmed-pubstatus-epublish', 'pubmed-pubstatus-ppublish', 'pubmed-pubstatus-revised', 'pubmed-pubstatus-aheadofprint', 'pubmed-pubstatus-retracted', 'pubmed-pubstatus-ecollection', 'pubmed-pubstatus-pmc', 'pubmed-pubstatus-pmcr', 'pubmed-pubstatus-pubmed', 'pubmed-pubstatus-pubmedr', 'pubmed-pubstatus-premedline', 'pubmed-pubstatus-medline', 'pubmed-pubstatus-medliner', 'pubmed-pubstatus-entrez', 'pubmed-pubstatus-pmc-release', 'medline-completed', 'medline-in-process', 'medline-pubmed-not-medline', 'medline-in-data-review', 'medline-publisher', 'medline-medline', 'medline-oldmedline', 'pubmed-publication-status-ppublish', 'pubmed-publication-status-epublish', 'pubmed-publication-status-aheadofprint']}, 'type'=>'CodeableConcept', 'path'=>'Citation.currentState', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-status-type'}},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Citation.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'summary' => {'type'=>'Citation::Summary', 'path'=>'citation.summary', 'min'=>0, 'max'=>Float::INFINITY},
      'classification' => {'type'=>'Citation::Classification', 'path'=>'citation.classification', 'min'=>0, 'max'=>Float::INFINITY},
      'statusDate' => {'type'=>'Citation::StatusDate', 'path'=>'citation.statusDate', 'min'=>0, 'max'=>Float::INFINITY},
      'citedArtifact' => {'type'=>'Citation::CitedArtifact', 'path'=>'citation.citedArtifact', 'min'=>0, 'max'=>1}
    }

    class Summary < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Summary.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Summary.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Summary.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'style' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/citation-summary-style'=>['vancouver', 'ama11', 'apa7', 'apa6', 'asa6', 'mla8', 'cochrane', 'elsevier-harvard', 'nature', 'acs', 'chicago-a-17', 'chicago-b-17', 'ieee', 'comppub']}, 'type'=>'CodeableConcept', 'path'=>'Summary.style', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-summary-style'}},
        'text' => {'type'=>'markdown', 'path'=>'Summary.text', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :style                # 0-1 CodeableConcept
      attr_accessor :text                 # 1-1 markdown
    end

    class Classification < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Classification.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Classification.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Classification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/citation-classification-type'=>['citation-source', 'medline-owner', 'fevir-platform-use']}, 'type'=>'CodeableConcept', 'path'=>'Classification.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-classification-type'}},
        'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/citation-artifact-classifier'=>['audio', 'D001877', 'cds-artifact', 'D016420', 'common-share', 'D019991', 'D064886', 'dataset-unpublished', 'Electronic', 'Electronic-eCollection', 'Electronic-Print', 'executable-app', 'fhir-resource', 'image', 'interactive-form', 'D016428', 'D016422', 'machine-code', 'medline-base', 'prediction-model', 'D000076942', 'Print', 'Print-Electronic', 'project-specific', 'protocol', 'pseudocode', 'D016425', 'standard-specification', 'terminology', 'D059040', 'webpage']}, 'type'=>'CodeableConcept', 'path'=>'Classification.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-artifact-classifier'}}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 0-1 CodeableConcept
      attr_accessor :classifier           # 0-* [ CodeableConcept ]
    end

    class StatusDate < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'StatusDate.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'StatusDate.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'StatusDate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'activity' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/citation-status-type'=>['pubmed-pubstatus-received', 'pubmed-pubstatus-accepted', 'pubmed-pubstatus-epublish', 'pubmed-pubstatus-ppublish', 'pubmed-pubstatus-revised', 'pubmed-pubstatus-aheadofprint', 'pubmed-pubstatus-retracted', 'pubmed-pubstatus-ecollection', 'pubmed-pubstatus-pmc', 'pubmed-pubstatus-pmcr', 'pubmed-pubstatus-pubmed', 'pubmed-pubstatus-pubmedr', 'pubmed-pubstatus-premedline', 'pubmed-pubstatus-medline', 'pubmed-pubstatus-medliner', 'pubmed-pubstatus-entrez', 'pubmed-pubstatus-pmc-release', 'medline-completed', 'medline-in-process', 'medline-pubmed-not-medline', 'medline-in-data-review', 'medline-publisher', 'medline-medline', 'medline-oldmedline', 'pubmed-publication-status-ppublish', 'pubmed-publication-status-epublish', 'pubmed-publication-status-aheadofprint']}, 'type'=>'CodeableConcept', 'path'=>'StatusDate.activity', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-status-type'}},
        'actual' => {'type'=>'boolean', 'path'=>'StatusDate.actual', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'StatusDate.period', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :activity             # 1-1 CodeableConcept
      attr_accessor :actual               # 0-1 boolean
      attr_accessor :period               # 1-1 Period
    end

    class CitedArtifact < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CitedArtifact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CitedArtifact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'CitedArtifact.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'CitedArtifact.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedIdentifier' => {'type'=>'Identifier', 'path'=>'CitedArtifact.relatedIdentifier', 'min'=>0, 'max'=>Float::INFINITY},
        'dateAccessed' => {'type'=>'dateTime', 'path'=>'CitedArtifact.dateAccessed', 'min'=>0, 'max'=>1},
        'currentState' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-artifact-status-type'=>['created', 'submitted', 'withdrawn', 'pre-review', 'under-review', 'post-review-pre-published', 'rejected', 'published-early-form', 'published-final-form', 'accepted', 'archived', 'retracted', 'draft', 'active', 'approved', 'unknown'], 'http://hl7.org/fhir/publication-status'=>['retired', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'CitedArtifact.currentState', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-artifact-status-type'}},
        'note' => {'type'=>'Annotation', 'path'=>'CitedArtifact.note', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'Citation::CitedArtifact::Version', 'path'=>'CitedArtifact.version', 'min'=>0, 'max'=>1},
        'statusDate' => {'type'=>'Citation::CitedArtifact::StatusDate', 'path'=>'CitedArtifact.statusDate', 'min'=>0, 'max'=>Float::INFINITY},
        'title' => {'type'=>'Citation::CitedArtifact::Title', 'path'=>'CitedArtifact.title', 'min'=>0, 'max'=>Float::INFINITY},
        'abstract' => {'type'=>'Citation::CitedArtifact::Abstract', 'path'=>'CitedArtifact.abstract', 'min'=>0, 'max'=>Float::INFINITY},
        'part' => {'type'=>'Citation::CitedArtifact::Part', 'path'=>'CitedArtifact.part', 'min'=>0, 'max'=>1},
        'relatesTo' => {'type'=>'Citation::CitedArtifact::RelatesTo', 'path'=>'CitedArtifact.relatesTo', 'min'=>0, 'max'=>Float::INFINITY},
        'publicationForm' => {'type'=>'Citation::CitedArtifact::PublicationForm', 'path'=>'CitedArtifact.publicationForm', 'min'=>0, 'max'=>Float::INFINITY},
        'webLocation' => {'type'=>'Citation::CitedArtifact::WebLocation', 'path'=>'CitedArtifact.webLocation', 'min'=>0, 'max'=>Float::INFINITY},
        'classification' => {'type'=>'Citation::CitedArtifact::Classification', 'path'=>'CitedArtifact.classification', 'min'=>0, 'max'=>Float::INFINITY},
        'contributorship' => {'type'=>'Citation::CitedArtifact::Contributorship', 'path'=>'CitedArtifact.contributorship', 'min'=>0, 'max'=>1}
      }

      class Version < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Version.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Version.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Version.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'value' => {'type'=>'string', 'path'=>'Version.value', 'min'=>1, 'max'=>1},
          'baseCitation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation'], 'type'=>'Reference', 'path'=>'Version.baseCitation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :value                # 1-1 string
        attr_accessor :baseCitation         # 0-1 Reference(Citation)
      end

      class StatusDate < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'StatusDate.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'StatusDate.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'StatusDate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'activity' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-artifact-status-type'=>['created', 'submitted', 'withdrawn', 'pre-review', 'under-review', 'post-review-pre-published', 'rejected', 'published-early-form', 'published-final-form', 'accepted', 'archived', 'retracted', 'draft', 'active', 'approved', 'unknown'], 'http://hl7.org/fhir/publication-status'=>['retired', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'StatusDate.activity', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-artifact-status-type'}},
          'actual' => {'type'=>'boolean', 'path'=>'StatusDate.actual', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'StatusDate.period', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :activity             # 1-1 CodeableConcept
        attr_accessor :actual               # 0-1 boolean
        attr_accessor :period               # 1-1 Period
      end

      class Title < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Title.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Title.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Title.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/title-type'=>['primary', 'official', 'scientific', 'plain-language', 'subtitle', 'short-title', 'acronym', 'earlier-title', 'language', 'autotranslated', 'human-use', 'machine-use', 'duplicate-uid']}, 'type'=>'CodeableConcept', 'path'=>'Title.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/title-type'}},
          'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Title.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
          'text' => {'type'=>'markdown', 'path'=>'Title.text', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 0-* [ CodeableConcept ]
        attr_accessor :language             # 0-1 code
        attr_accessor :text                 # 1-1 markdown
      end

      class Abstract < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Abstract.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Abstract.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Abstract.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-artifact-abstract-type'=>['primary-human-use', 'primary-machine-use', 'truncated', 'short-abstract', 'long-abstract', 'plain-language', 'different-publisher', 'language', 'autotranslated', 'duplicate-pmid', 'earlier-abstract']}, 'type'=>'CodeableConcept', 'path'=>'Abstract.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-artifact-abstract-type'}},
          'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Title.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
          'text' => {'type'=>'markdown', 'path'=>'Abstract.text', 'min'=>1, 'max'=>1},
          'copyright' => {'type'=>'markdown', 'path'=>'Abstract.copyright', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 0-1 CodeableConcept
        attr_accessor :language             # 0-1 code
        attr_accessor :text                 # 1-1 markdown
        attr_accessor :copyright            # 0-1 markdown
      end

      class Part < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Part.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Part.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Part.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-artifact-part-type'=>['pages', 'sections', 'paragraphs', 'lines', 'tables', 'figures', 'supplement', 'supplement-subpart', 'article-set']}, 'type'=>'CodeableConcept', 'path'=>'Part.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-artifact-part-type'}},
          'value' => {'type'=>'string', 'path'=>'Part.value', 'min'=>0, 'max'=>1},
          'baseCitation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation'], 'type'=>'Reference', 'path'=>'Part.baseCitation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 0-1 CodeableConcept
        attr_accessor :value                # 0-1 string
        attr_accessor :baseCitation         # 0-1 Reference(Citation)
      end

      class RelatesTo < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RelatesTo.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RelatesTo.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatesTo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/related-artifact-type'=>['documentation', 'justification', 'citation', 'predecessor', 'successor', 'derived-from', 'depends-on', 'composed-of', 'part-of', 'amends', 'amended-with', 'appends', 'appended-with', 'cites', 'cited-by', 'comments-on', 'comment-in', 'contains', 'contained-in', 'corrects', 'correction-in', 'replaces', 'replaced-with', 'retracts', 'retracted-by', 'signs', 'similar-to', 'supports', 'supported-with', 'transforms', 'transformed-into', 'transformed-with', 'documents', 'specification-of', 'created-with', 'cite-as'], 'http://terminology.hl7.org/CodeSystem/related-artifact-type-expanded'=>['reprint', 'reprint-of']}, 'type'=>'code', 'path'=>'RelatesTo.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/related-artifact-type-expanded'}},
          'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/citation-artifact-classifier'=>['audio', 'D001877', 'cds-artifact', 'D016420', 'common-share', 'D019991', 'D064886', 'dataset-unpublished', 'Electronic', 'Electronic-eCollection', 'Electronic-Print', 'executable-app', 'fhir-resource', 'image', 'interactive-form', 'D016428', 'D016422', 'machine-code', 'medline-base', 'prediction-model', 'D000076942', 'Print', 'Print-Electronic', 'project-specific', 'protocol', 'pseudocode', 'D016425', 'standard-specification', 'terminology', 'D059040', 'webpage']}, 'type'=>'CodeableConcept', 'path'=>'RelatesTo.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-artifact-classifier'}},
          'label' => {'type'=>'string', 'path'=>'RelatesTo.label', 'min'=>0, 'max'=>1},
          'display' => {'type'=>'string', 'path'=>'RelatesTo.display', 'min'=>0, 'max'=>1},
          'citation' => {'type'=>'markdown', 'path'=>'RelatesTo.citation', 'min'=>0, 'max'=>1},
          'document' => {'type'=>'Attachment', 'path'=>'RelatesTo.document', 'min'=>0, 'max'=>1},
          'resource' => {'type'=>'canonical', 'path'=>'RelatesTo.resource', 'min'=>0, 'max'=>1},
          'resourceReference' => {'type'=>'Reference', 'path'=>'RelatesTo.resourceReference', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 1-1 code
        attr_accessor :classifier           # 0-* [ CodeableConcept ]
        attr_accessor :label                # 0-1 string
        attr_accessor :display              # 0-1 string
        attr_accessor :citation             # 0-1 markdown
        attr_accessor :document             # 0-1 Attachment
        attr_accessor :resource             # 0-1 canonical
        attr_accessor :resourceReference    # 0-1 Reference
      end

      class PublicationForm	 < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PublicationForm.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PublicationForm.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PublicationForm.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'citedMedium' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-medium'=>['internet', 'print', 'offline-digital-storage', 'internet-without-issue', 'print-without-issue', 'offline-digital-storage-without-issue']}, 'type'=>'CodeableConcept', 'path'=>'PublicationForm.citedMedium', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-medium'}},
          'volume' => {'type'=>'string', 'path'=>'PublicationForm.volume', 'min'=>0, 'max'=>1},
          'issue' => {'type'=>'string', 'path'=>'PublicationForm.issue', 'min'=>0, 'max'=>1},
          'publicationDateYear' => {'type'=>'string', 'path'=>'PublicationForm.publicationDateYear', 'min'=>0, 'max'=>1},
          'publicationDateMonth' => {'type'=>'string', 'path'=>'PublicationForm.publicationDateMonth', 'min'=>0, 'max'=>1},
          'publicationDateDay' => {'type'=>'string', 'path'=>'PublicationForm.publicationDateDay', 'min'=>0, 'max'=>1},
          'publicationDateSeason' => {'type'=>'string', 'path'=>'PublicationForm.publicationDateSeason', 'min'=>0, 'max'=>1},
          'publicationDateText' => {'type'=>'string', 'path'=>'PublicationForm.publicationDateText', 'min'=>0, 'max'=>1},
          'articleDate' => {'type'=>'dateTime', 'path'=>'PublicationForm.articleDate', 'min'=>0, 'max'=>1},
          'lastRevisionDate' => {'type'=>'dateTime', 'path'=>'PublicationForm.lastRevisionDate', 'min'=>0, 'max'=>1},
          'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'PublicationForm.language', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
          'accessionNumber' => {'type'=>'string', 'path'=>'PublicationForm.accessionNumber', 'min'=>0, 'max'=>1},
          'pageString' => {'type'=>'string', 'path'=>'PublicationForm.pageString', 'min'=>0, 'max'=>1},
          'firstPage' => {'type'=>'string', 'path'=>'PublicationForm.firstPage', 'min'=>0, 'max'=>1},
          'lastPage' => {'type'=>'string', 'path'=>'PublicationForm.lastPage', 'min'=>0, 'max'=>1},
          'pageCount' => {'type'=>'string', 'path'=>'PublicationForm.pageCount', 'min'=>0, 'max'=>1},
          'copyright' => {'type'=>'markdown', 'path'=>'PublicationForm.copyright', 'min'=>0, 'max'=>1},
          'publishedIn' => {'type'=>'Citation::CitedArtifact::PublicationForm::PublishedIn', 'path'=>'PublicationForm.publishedIn', 'min'=>0, 'max'=>1}
        }

        class PublishedIn < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'PublishedIn.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'PublishedIn.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'PublishedIn.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/published-in-type'=>['D020492', 'D019991', 'D001877', 'D064886']}, 'type'=>'CodeableConcept', 'path'=>'PublishedIn.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/published-in-type'}},
            'identifier' => {'type'=>'Identifier', 'path'=>'PublishedIn.identifier', 'min'=>0, 'max'=>Float::INFINITY},
            'title' => {'type'=>'string', 'path'=>'PublishedIn.title', 'min'=>0, 'max'=>1},
            'publisher' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PublishedIn.publisher', 'min'=>0, 'max'=>1},
            'publisherLocation' => {'type'=>'string', 'path'=>'PublishedIn.publisherLocation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :type                 # 0-1 CodeableConcept
          attr_accessor :identifier           # 0-* Identifier
          attr_accessor :title                # 0-1 string
          attr_accessor :publisher            # 0-1 Reference(Organization)
          attr_accessor :publisherLocation    # 0-1 string
        end

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :citedMedium          # 0-1 CodeableConcept
        attr_accessor :volume               # 0-1 string
        attr_accessor :issue                # 0-1 string
        attr_accessor :publicationDateYear  # 0-1 string
        attr_accessor :publicationDateMonth # 0-1 string
        attr_accessor :publicationDateDay   # 0-1 string
        attr_accessor :publicationDateSeason# 0-1 string
        attr_accessor :publicationDateText  # 0-1 string
        attr_accessor :articleDate          # 0-1 dateTime
        attr_accessor :lastRevisionDate     # 0-1 dateTime
        attr_accessor :language             # 0-* [ CodeableConcept ]
        attr_accessor :accessionNumber      # 0-1 string
        attr_accessor :pageString           # 0-1 string
        attr_accessor :firstPage            # 0-1 string
        attr_accessor :lastPage             # 0-1 string
        attr_accessor :pageCount            # 0-1 string
        attr_accessor :copyright            # 0-1 markdown
        attr_accessor :publishedIn          # 0-1 Citation::CitedArtifact::PublicationForm::PublishedIn
      end

      class WebLocation < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'WebLocation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'WebLocation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'WebLocation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'classifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/artifact-url-classifier'=>['abstract', 'full-text', 'supplement', 'webpage', 'file-directory', 'code-repository', 'restricted', 'compressed-file', 'doi-based', 'pdf', 'json', 'xml', 'version-specific', 'computable-resource', 'not-specified']}, 'type'=>'CodeableConcept', 'path'=>'WebLocation.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/artifact-url-classifier'}},
          'url' => {'type'=>'uri', 'path'=>'WebLocation.url', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :classifier           # 0-* [ CodeableConcept ]
        attr_accessor :url                  # 0-1 uri
      end

      class Classification < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Classification.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Classification.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Classification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/cited-artifact-classification-type'=>['publication-type', 'mesh-heading', 'supplemental-mesh-protocol', 'supplemental-mesh-disease', 'supplemental-mesh-organism', 'keyword', 'citation-subset', 'chemical', 'publishing-model', 'knowledge-artifact-type', 'coverage']}, 'type'=>'CodeableConcept', 'path'=>'Classification.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/cited-artifact-classification-type'}},
          'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/citation-artifact-classifier'=>['audio', 'D001877', 'cds-artifact', 'D016420', 'common-share', 'D019991', 'D064886', 'dataset-unpublished', 'Electronic', 'Electronic-eCollection', 'Electronic-Print', 'executable-app', 'fhir-resource', 'image', 'interactive-form', 'D016428', 'D016422', 'machine-code', 'medline-base', 'prediction-model', 'D000076942', 'Print', 'Print-Electronic', 'project-specific', 'protocol', 'pseudocode', 'D016425', 'standard-specification', 'terminology', 'D059040', 'webpage']}, 'type'=>'CodeableConcept', 'path'=>'Classification.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-artifact-classifier'}},
          'artifactAssessment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ArtifactAssessment'], 'type'=>'Reference', 'path'=>'Classification.artifactAssessment', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 0-1 CodeableConcept
        attr_accessor :classifier           # 0-* [ CodeableConcept ]
        attr_accessor :artifactAssessment   # 0-* [ Reference(ArtifactAssessment) ]
      end

      class Contributorship < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Contributorship.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Contributorship.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Contributorship.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'complete' => {'type'=>'boolean', 'path'=>'Contributorship.complete', 'min'=>0, 'max'=>1},
          'entry' => {'type'=>'Citation::CitedArtifact::Contributorship::Entry', 'path'=>'Contributorship.entry', 'min'=>0, 'max'=>Float::INFINITY},
          'summary' => {'type'=>'Citation::CitedArtifact::Contributorship::Summary', 'path'=>'Contributorship.summary', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Entry < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Entry.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Entry.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Entry.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'contributor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Entry.contributor', 'min'=>1, 'max'=>1},
            'forenameInitials' => {'type'=>'string', 'path'=>'Entry.forenameInitials', 'min'=>0, 'max'=>1},
            'affiliation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Entry.affiliation', 'min'=>0, 'max'=>Float::INFINITY},
            'contributionType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/artifact-contribution-type'=>['conceptualization', 'data-curation', 'formal-analysis', 'funding-acquisition', 'investigation', 'methodology', 'project-administration', 'resources', 'software', 'supervision', 'validation', 'visualization', 'writing-original-draft', 'writing-review-editing']}, 'type'=>'CodeableConcept', 'path'=>'Entry.contributionType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/artifact-contribution-type'}},
            'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/contributor-role'=>['publisher', 'author', 'reviewer', 'endorser', 'editor', 'informant', 'funder']}, 'type'=>'CodeableConcept', 'path'=>'Entry.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/contributor-role'}},
            'correspondingContact' => {'type'=>'boolean', 'path'=>'Entry.correspondingContact', 'min'=>0, 'max'=>1},
            'rankingOrder' => {'type'=>'positiveInt', 'path'=>'Entry.rankingOrder', 'min'=>0, 'max'=>1},
            'contributionInstance' => {'type'=>'Citation::CitedArtifact::Contributorship::Entry::ContributionInstance', 'path'=>'Entry.contributionInstance', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class ContributionInstance < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'ContributionInstance.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'ContributionInstance.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'ContributionInstance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/artifact-contribution-instance-type'=>['reviewed', 'approved', 'edited']}, 'type'=>'CodeableConcept', 'path'=>'ContributionInstance.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/artifact-contribution-instance-type'}},
              'time' => {'type'=>'dateTime', 'path'=>'ContributionInstance.time', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                   # 0-1 string
            attr_accessor :extension            # 0-* [ Extension ]
            attr_accessor :modifierExtension    # 0-* [ Extension ]
            attr_accessor :type                 # 1-1 CodeableConcept
            attr_accessor :time                 # 0-1 dateTime
          end

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :contributor          # 1-1 Reference(Practitioner|Organization)
          attr_accessor :forenameInitials     # 0-1 string
          attr_accessor :affiliation          # 0-* [ Reference(Organization|PractitionerRole) ]
          attr_accessor :contributionType     # 0-* [ CodeableConcept ]
          attr_accessor :role                 # 0-1 CodeableConcept
          attr_accessor :correspondingContact # 0-1 boolean
          attr_accessor :rankingOrder         # 0-1 positiveInt
          attr_accessor :contributionInstance # 0-* [ Citation::CitedArtifact::Contributorship::Entry::ContributionInstance ]
        end

        class Summary < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Summary.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Summary.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Summary.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/contributor-summary-type'=>['author-string', 'contributorship-list', 'contributorship-statement', 'acknowledgement-list', 'acknowledgment-statement', 'funding-statement', 'competing-interests-statement']}, 'type'=>'CodeableConcept', 'path'=>'Summary.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/contributor-summary-type'}},
            'style' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/contributor-summary-style'=>['a1full', 'a1init', 'a3full', 'a3init', 'a6full', 'a6init', 'aallfull', 'aallfullwithand', 'aallfullwithampersand', 'aallinit', 'aallinitwithand', 'aallinitwithampersand', 'contr-full-by-person', 'contr-init-by-person', 'contr-full-by-contr', 'contr-init-by-contr']}, 'type'=>'CodeableConcept', 'path'=>'Summary.style', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/contributor-summary-style'}},
            'source' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/contributor-summary-source'=>['publisher-data', 'article-copy', 'citation-manager', 'custom']}, 'type'=>'CodeableConcept', 'path'=>'Summary.source', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/contributor-summary-source'}},
            'value' => {'type'=>'markdown', 'path'=>'Summary.value', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :type                 # 0-1 CodeableConcept
          attr_accessor :style                # 0-1 CodeableConcept
          attr_accessor :source               # 0-1 CodeableConcept
          attr_accessor :value                # 1-1 markdown
        end

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :complete             # 0-1 boolean
        attr_accessor :entry                # 0-* [ Citation::CitedArtifact::Contributorship::Entry ]
        attr_accessor :summary              # 0-* [ Citation::CitedArtifact::Contributorship::Summary ]
      end

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :identifier           # 0-* [ Identifier ]
      attr_accessor :relatedIdentifier    # 0-* [ Identifier ]
      attr_accessor :dateAccessed         # 0-1 dateTime
      attr_accessor :currentState         # 0-* [ CodeableConcept ]
      attr_accessor :note                 # 0-* [ Annotation ]
      attr_accessor :version              # 0-1 Citation::CitedArtifact::Version
      attr_accessor :statusDate           # 0-* [ Citation::CitedArtifact::StatusDate ]
      attr_accessor :title                # 0-* [ Citation::CitedArtifact::Title ]
      attr_accessor :abstract             # 0-* [ Citation::CitedArtifact::Abstract ]
      attr_accessor :part                 # 0-1 Citation::CitedArtifact::Part
      attr_accessor :relatesTo            # 0-* [ Citation::CitedArtifact::RelatesTo ]
      attr_accessor :publicationForm      # 0-* [ Citation::CitedArtifact::PublicationForm ]
      attr_accessor :webLocation          # 0-* [ Citation::CitedArtifact::WebLocation ]
      attr_accessor :classification       # 0-* [ Citation::CitedArtifact::Classification ]
      attr_accessor :contributorship      # 0-1 Citation::CitedArtifact::Contributorship
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :url                # 0-1 uri
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :version            # 0-1 string
    attr_accessor :name               # 0-1 string
    attr_accessor :title              # 0-1 string
    attr_accessor :status             # 1-1 code
    attr_accessor :experimental       # 0-1 boolean
    attr_accessor :date               # 0-1 dateTime
    attr_accessor :publisher          # 0-1 string
    attr_accessor :contact            # 0-* [ ContactDetail ]
    attr_accessor :description        # 0-1 markdown
    attr_accessor :useContext         # 0-* [ UsageContext ]
    attr_accessor :jurisdiction       # 0-* [ CodeableConcept ]
    attr_accessor :purpose            # 0-1 markdown
    attr_accessor :copyright          # 0-1 markdown
    attr_accessor :approvalDate       # 0-1 date
    attr_accessor :lastReviewDate     # 0-1 date
    attr_accessor :effectivePeriod    # 0-1 Period
    attr_accessor :author             # 0-* [ ContactDetail ]
    attr_accessor :editor             # 0-* [ ContactDetail ]
    attr_accessor :reviewer           # 0-* [ ContactDetail ]
    attr_accessor :endorser           # 0-* [ ContactDetail ]
    attr_accessor :note               # 0-* [ Annotation ]
    attr_accessor :currentState       # 0-* [ CodeableConcept ]
    attr_accessor :relatedArtifact    # 0-* [ RelatedArtifact ]
    attr_accessor :summary            # 0-* [ Citation::Summary ]
    attr_accessor :classification     # 0-* [ Citation::Classification ]
    attr_accessor :statusDate         # 0-* [ Citation::StatusDate ]
    attr_accessor :citedArtifact      # 0-1 Citation::CitedArtifact

    def resourceType
      'Citation'
    end
  end
end
