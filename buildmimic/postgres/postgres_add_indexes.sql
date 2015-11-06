-- ----------------------------------------------------------------
--
-- This is a script to add the MIMIC-III indexes for Postgres.
-- 
-- ----------------------------------------------------------------

-- The below command defines the schema where all the indexes are created
SET search_path TO mimiciii;

-- Restoring the search path to its default value can be accomplished as follows:
--  SET search_path TO "$user",public;

-------------
-- ADMISSIONS
-------------

drop index ADMISSIONS_idx01;
CREATE INDEX ADMISSIONS_IDX01 
  ON ADMISSIONS (SUBJECT_ID,HADM_ID);

drop index ADMISSIONS_idx02;
CREATE INDEX ADMISSIONS_IDX02 
  ON ADMISSIONS (ADMITTIME, DISCHTIME, DEATHTIME);

drop index ADMISSIONS_idx03;
CREATE INDEX ADMISSIONS_IDX03
  ON ADMISSIONS (ADMISSION_TYPE);


-----------
--CALLOUT--
-----------

drop index CALLOUT_idx01;
CREATE INDEX CALLOUT_IDX01
  ON CALLOUT (SUBJECT_ID, HADM_ID);

drop index CALLOUT_idx02;
CREATE INDEX CALLOUT_IDX02
  ON CALLOUT (CURR_CAREUNIT);

drop index CALLOUT_idx03;
CREATE INDEX CALLOUT_IDX03
  ON CALLOUT (CALLOUT_SERVICE);

drop index CALLOUT_idx04;
CREATE INDEX CALLOUT_IDX04
  ON CALLOUT (CURR_WARDID, CALLOUT_WARDID, 
    DISCHARGE_WARDID);

drop index CALLOUT_idx05;
CREATE INDEX CALLOUT_IDX05
  ON CALLOUT (CALLOUT_STATUS, 
    CALLOUT_OUTCOME);

drop index CALLOUT_idx06;
CREATE INDEX CALLOUT_IDX06
  ON CALLOUT (CREATETIME, UPDATETIME, 
    ACKNOWLEDGETIME, OUTCOMETIME);

---------------
-- CAREGIVERS
---------------

drop index CAREGIVERS_idx01;
CREATE INDEX CAREGIVERS_IDX01
  ON CAREGIVERS (CGID, LABEL);

---------------
-- CHARTEVENTS
---------------
drop index CHARTEVENTS_idx01;
CREATE INDEX CHARTEVENTS_idx01 
  ON CHARTEVENTS (SUBJECT_ID, HADM_ID, ICUSTAY_ID);


drop index CHARTEVENTS_idx02;
CREATE INDEX CHARTEVENTS_idx02 
  ON CHARTEVENTS (ITEMID);


drop index CHARTEVENTS_idx03;
CREATE INDEX CHARTEVENTS_idx03 
  ON CHARTEVENTS (CHARTTIME, STORETIME);


drop index CHARTEVENTS_idx04;
CREATE INDEX CHARTEVENTS_idx04 
  ON CHARTEVENTS (CGID);

-- Perhaps not useful to index on just value? Index just for popular subset?
-- drop index CHARTEVENTS_idx05;
-- CREATE INDEX CHARTEVENTS_idx05 
--   ON CHARTEVENTS (VALUE);

---------------
-- CPTEVENTS
---------------

drop index CPTEVENTS_idx01;
CREATE INDEX CPTEVENTS_idx01 
  ON CPTEVENTS (SUBJECT_ID, HADM_ID);

drop index CPTEVENTS_idx02;
CREATE INDEX CPTEVENTS_idx02 
  ON CPTEVENTS (CPT_CD, TICKET_ID_SEQ);

-----------
-- D_CPT
-----------

-- Table is 134 rows - doesn't need an index.

--------------------
-- D_ICD_DIAGNOSES
--------------------

-- drop index D_ICD_DIAG_idx01;
-- CREATE INDEX D_ICD_DIAG_idx01 
--   ON D_ICD_DIAGNOSES (ICD9_CODE, DIAG_OR_PROC);

drop index D_ICD_DIAG_idx02;
CREATE INDEX D_ICD_DIAG_idx02 
  ON D_ICD_DIAGNOSES (SHORT_TITLE, LONG_TITLE);

--------------------
-- D_ICD_PROCEDURES
--------------------

-- drop index D_ICD_PROC_idx01;
-- CREATE INDEX D_ICD_PROC_idx01 
--   ON D_ICD_PROCEDURES (ICD9_CODE, DIAG_OR_PROC);

drop index D_ICD_PROC_idx02;
CREATE INDEX D_ICD_PROC_idx02 
  ON D_ICD_PROCEDURES (SHORT_TITLE, LONG_TITLE);

-----------
-- D_ITEMS
-----------

drop index D_ITEMS_idx01;
CREATE INDEX D_ITEMS_idx01 
  ON D_ITEMS (ITEMID);

drop index D_ITEMS_idx02;
CREATE INDEX D_ITEMS_idx02 
  ON D_ITEMS (LABEL, DBSOURCE);

drop index D_ITEMS_idx03;
CREATE INDEX D_ITEMS_idx03 
  ON D_ITEMS (CATEGORY);

---------------
-- D_LABITEMS
---------------

drop index D_LABITEMS_idx01;
CREATE INDEX D_LABITEMS_idx01 
  ON D_LABITEMS (ITEMID);

drop index D_LABITEMS_idx02;
CREATE INDEX D_LABITEMS_idx02
  ON D_LABITEMS (LABEL, FLUID, CATEGORY);

drop index D_LABITEMS_idx03;
CREATE INDEX D_LABITEMS_idx03 
  ON D_LABITEMS (LOINC_CODE);

-------------------
-- DATETIMEEVENTS
-------------------

drop index DATETIMEEVENTS_idx01;
CREATE INDEX DATETIMEEVENTS_idx01 
  ON DATETIMEEVENTS (SUBJECT_ID, 
    HADM_ID, ICUSTAY_ID);

drop index DATETIMEEVENTS_idx02;
CREATE INDEX DATETIMEEVENTS_idx02 
  ON DATETIMEEVENTS (ITEMID);

drop index DATETIMEEVENTS_idx03;
CREATE INDEX DATETIMEEVENTS_idx03 
  ON DATETIMEEVENTS (CHARTTIME);

drop index DATETIMEEVENTS_idx04;
CREATE INDEX DATETIMEEVENTS_idx04 
  ON DATETIMEEVENTS (CGID);

drop index DATETIMEEVENTS_idx05;
CREATE INDEX DATETIMEEVENTS_idx05 
  ON DATETIMEEVENTS (VALUE);

------------------
-- DIAGNOSES_ICD
------------------

drop index DIAGNOSES_ICD_idx01;
CREATE INDEX DIAGNOSES_ICD_idx01 
  ON DIAGNOSES_ICD (SUBJECT_ID, HADM_ID);

drop index DIAGNOSES_ICD_idx02;
CREATE INDEX DIAGNOSES_ICD_idx02 
  ON DIAGNOSES_ICD (ICD9_CODE, SEQ_NUM);

--------------
-- DRGCODES
--------------

drop index DRGCODES_idx01;
CREATE INDEX DRGCODES_idx01 
  ON DRGCODES (SUBJECT_ID, HADM_ID);

drop index DRGCODES_idx02;
CREATE INDEX DRGCODES_idx02 
  ON DRGCODES (DRG_CODE, DRG_TYPE);

drop index DRGCODES_idx03;
CREATE INDEX DRGCODES_idx03 
  ON DRGCODES (DESCRIPTION, DRG_SEVERITY);

------------------
-- ICUSTAYS
------------------

drop index ICUSTAYS_idx01;
CREATE INDEX ICUSTAYS_idx01 
  ON ICUSTAYS (SUBJECT_ID, HADM_ID);

drop index ICUSTAYS_idx02;
CREATE INDEX ICUSTAYS_idx02 
  ON ICUSTAYS (ICUSTAY_ID, DBSOURCE);

drop index ICUSTAYS_idx03;
CREATE INDEX ICUSTAYS_idx03 
  ON ICUSTAYS (LOS);

drop index ICUSTAYS_idx04;
CREATE INDEX ICUSTAYS_idx04 
  ON ICUSTAYS (FIRST_CAREUNIT);

drop index ICUSTAYS_idx05;
CREATE INDEX ICUSTAYS_idx05 
  ON ICUSTAYS (LAST_CAREUNIT);

-------------
-- IOEVENTS
-------------

drop index IOEVENTS_idx01;
CREATE INDEX IOEVENTS_idx01 
  ON IOEVENTS (SUBJECT_ID, HADM_ID);

drop index IOEVENTS_idx02;
CREATE INDEX IOEVENTS_idx02 
  ON IOEVENTS (ICUSTAY_ID);

drop index IOEVENTS_idx03;
CREATE INDEX IOEVENTS_idx03 
  ON IOEVENTS (ENDTIME, STARTTIME);

drop index IOEVENTS_idx04;
CREATE INDEX IOEVENTS_idx04 
  ON IOEVENTS (ITEMID);

drop index IOEVENTS_idx05;
CREATE INDEX IOEVENTS_idx05 
  ON IOEVENTS (RATE);

drop index IOEVENTS_idx06;
CREATE INDEX IOEVENTS_idx06 
  ON IOEVENTS (VOLUME);

drop index IOEVENTS_idx07;
CREATE INDEX IOEVENTS_idx07 
  ON IOEVENTS (CGID);

drop index IOEVENTS_idx08;
CREATE INDEX IOEVENTS_idx08 
  ON IOEVENTS (LINKORDERID, ORDERID);

drop index IOEVENTS_idx09;
CREATE INDEX IOEVENTS_idx09
  ON IOEVENTS (ORDERCATEGORYDESCRIPTION, 
    ORDERCATEGORYNAME, SECONDARYORDERCATEGORYNAME);

drop index IOEVENTS_idx10;
CREATE INDEX IOEVENTS_idx10 
  ON IOEVENTS (ORDERCOMPONENTTYPEDESCRIPTION, 
    ORDERCATEGORYDESCRIPTION);

--------------
-- LABEVENTS
--------------

drop index LABEVENTS_idx01;
CREATE INDEX LABEVENTS_idx01 
  ON LABEVENTS (SUBJECT_ID, HADM_ID);

drop index LABEVENTS_idx02;
CREATE INDEX LABEVENTS_idx02 
  ON LABEVENTS (ITEMID);

drop index LABEVENTS_idx03;
CREATE INDEX LABEVENTS_idx03 
  ON LABEVENTS (CHARTTIME);

drop index LABEVENTS_idx04;
CREATE INDEX LABEVENTS_idx04 
  ON LABEVENTS (VALUE, VALUENUM);

----------------------
-- MICROBIOLOGYEVENTS
----------------------

drop index MICROBIOLOGYEVENTS_idx01;
CREATE INDEX MICROBIOLOGYEVENTS_idx01 
  ON MICROBIOLOGYEVENTS (SUBJECT_ID, HADM_ID);

drop index MICROBIOLOGYEVENTS_idx02;
CREATE INDEX MICROBIOLOGYEVENTS_idx02 
  ON MICROBIOLOGYEVENTS (CHARTDATE, CHARTTIME);

drop index MICROBIOLOGYEVENTS_idx03;
CREATE INDEX MICROBIOLOGYEVENTS_idx03 
  ON MICROBIOLOGYEVENTS (SPEC_ITEMID, 
    ORG_ITEMID, AB_ITEMID);

---------------
-- NOTEEVENTS
---------------

drop index NOTEEVENTS_idx01;
CREATE INDEX NOTEEVENTS_idx01 
  ON NOTEEVENTS (SUBJECT_ID, HADM_ID);

drop index NOTEEVENTS_idx02;
CREATE INDEX NOTEEVENTS_idx02 
  ON NOTEEVENTS (CHARTDATE);

drop index NOTEEVENTS_idx03;
CREATE INDEX NOTEEVENTS_idx03 
  ON NOTEEVENTS (CGID);

drop index NOTEEVENTS_idx04;
CREATE INDEX NOTEEVENTS_idx04 
  ON NOTEEVENTS (RECORD_ID);

drop index NOTEEVENTS_idx05;
CREATE INDEX NOTEEVENTS_idx05 
  ON NOTEEVENTS (CATEGORY, DESCRIPTION);

-------------
-- PATIENTS
-------------

-- Note that SUBJECT_ID is already indexed as it is unique

drop index PATIENTS_idx01;
CREATE INDEX PATIENTS_idx01 
  ON PATIENTS (EXPIRE_FLAG);


------------------
-- PRESCRIPTIONS
------------------

drop index PRESCRIPTIONS_idx01;
CREATE INDEX PRESCRIPTIONS_idx01 
  ON PRESCRIPTIONS (SUBJECT_ID, HADM_ID);

drop index PRESCRIPTIONS_idx02;
CREATE INDEX PRESCRIPTIONS_idx02 
  ON PRESCRIPTIONS (ICUSTAY_ID);

drop index PRESCRIPTIONS_idx03;
CREATE INDEX PRESCRIPTIONS_idx03 
  ON PRESCRIPTIONS (DRUG_TYPE);

drop index PRESCRIPTIONS_idx04;
CREATE INDEX PRESCRIPTIONS_idx04 
  ON PRESCRIPTIONS (DRUG);

drop index PRESCRIPTIONS_idx05;
CREATE INDEX PRESCRIPTIONS_idx05
  ON PRESCRIPTIONS (STARTTIME, ENDTIME);

-------------------
-- PROCEDURES_ICD
-------------------

drop index PROCEDURES_ICD_idx01;
CREATE INDEX PROCEDURES_ICD_idx01 
  ON PROCEDURES_ICD (SUBJECT_ID, HADM_ID);

drop index PROCEDURES_ICD_idx02;
CREATE INDEX PROCEDURES_ICD_idx02 
  ON PROCEDURES_ICD (ICD9_CODE, SEQ_NUM);

-------------
-- SERVICES
-------------

drop index SERVICES_idx01;
CREATE INDEX SERVICES_idx01 
  ON SERVICES (SUBJECT_ID, HADM_ID);

drop index SERVICES_idx02;
CREATE INDEX SERVICES_idx02 
  ON SERVICES (TRANSFERTIME);

drop index SERVICES_idx03;
CREATE INDEX SERVICES_idx03
  ON SERVICES (CURR_SERVICE, PREV_SERVICE);

-------------
-- TRANSFERS
-------------

drop index TRANSFERS_idx01;
CREATE INDEX TRANSFERS_idx01 
  ON TRANSFERS (SUBJECT_ID, HADM_ID);

drop index TRANSFERS_idx02;
CREATE INDEX TRANSFERS_idx02 
  ON TRANSFERS (ICUSTAY_ID);

drop index TRANSFERS_idx03;
CREATE INDEX TRANSFERS_idx03 
  ON TRANSFERS (CURR_CAREUNIT, PREV_CAREUNIT);

drop index TRANSFERS_idx04;
CREATE INDEX TRANSFERS_idx04 
  ON TRANSFERS (INTIME, OUTTIME);

drop index TRANSFERS_idx05;
CREATE INDEX TRANSFERS_idx05 
  ON TRANSFERS (LOS);
