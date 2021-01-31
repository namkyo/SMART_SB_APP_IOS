
#ifndef	__KSW_ERROR_H__
#define	__KSW_ERROR_H__

#define	CERT_SIZE_MAX		2048
#define	MAX_PATH_LEN		64

#define KS_ERR_REPEAT_KEYINIT					-100
#define KS_ERR_MALLOC_FAILED					-200
#define KS_ERR_GET_PUBKEY_FAIL                  -201

#define KS_ERR_FAIL_TO_OPEN_SOCK                -209
#define KS_ERR_FAIL_TO_CONNECT                  -210
#define KS_ERR_FAIL_TO_HANDSHAKE                -211
#define KS_ERR_FAIL_TO_KEY_SHARING              -212
#define KS_ERR_FAIL_TO_DECODE_CERT              -213
#define KS_ERR_FAIL_TO_READ_MSG                 -214
#define KS_ERR_FAIL_TO_WRITE_MSG                -215
#define KS_ERR_FAIL_TO_ENC_MSG                  -216
#define KS_ERR_FAIL_TO_DEC_MSG                  -217

#define KS_ERR_ASN1_ERROR_BAD_LENGTH			-250
#define KS_ERR_ASN1_ERROR_BAD_DATA				-251

#define	KS_ERR_INTERNAL_ERROR					-300
#define	KS_ERR_INVALID_INPUT					-311
#define	KS_ERR_NOT_INITAILIZED					-312
#define	KS_ERR_SOCKET_ERROR						-313
#define	KS_ERR_TOKEN_DECODE						-314
#define	KS_ERR_BUFFER_OVERFLOW					-315
#define KS_ERR_INVALID_TYPE						-316
#define KS_ERR_INVALID_PROTOCOL_VERSION			-317
#define KS_ERR_INVALID_CLIENT_VERSION			-318
#define KS_ERR_INVALID_SERVER_VERSION			-319

#define	KS_ERR_NO_CERTIFICATE					-320
#define	KS_ERR_CERTIFICATE_EXPIRED				-321
#define KS_ERR_INVALID_CONTENT_TYPE				-324
#define KS_ERR_INVALID_PROCESS_ID				-325
#define KS_ERR_INVALID_PADDING					-326

//사용부분 없음
#define	KS_ERR_NO_PRIVATE_KEY					-330
#define	KS_ERR_INVALID_PRIVATE_KEY				-331
#define	KS_ERR_INVALID_PASSWORD					-332
#define	KS_ERR_PKCS1_DECRYPT_FAILED				-333
#define	KS_ERR_PKCS1_ENCRYPT_FAILED				-334

#define	KS_ERR_SECRET_KEY_EXPIRED				-350
#define	KS_ERR_ENCRYPTION_FAILED				-351
#define	KS_ERR_DECRYPTION_FAILED				-352
#define	KS_ERR_BAD_MAC							-353

#define KS_ERR_INVALID_PROFILE_LIST				-360
#define KS_ERR_NOT_SUPORTED_PROFILE				-361

#define KS_ERR_LIB_NOT_INIT						-370
#define KS_ERR_INVALID_KEY_LENGTH				-371
#define KS_ERR_SEED_INIT_FAILED					-372

#define KS_ERR_INVALID_VERSION					-400
#define KS_ERR_INVALID_PROFILE					-401
#define KS_ERR_INVALID_SESSION_ID				-402

#define KS_ERR_REPLAY_DECTECTION				-500
#define KS_ERR_INVALID_CERT						-501

#define KS_ERR_BASE64_ENCODE_FAIL				-600
#define KS_ERR_BASE64_DECODE_FAIL				-601
#define KS_ERR_HEX_ENCODE_FAIL                  -602
#define KS_ERR_HEX_DECODE_FAIL                  -603


#define KS_ERR_CERT_SIGN_VERIFY_FAILED			-700


#define ERR_PKCS5_INVALID_INPUT					-801
#define ERR_PKCS5_NOT_SUPPORTED_ALGID			-802
#define ERR_PKCS5_INVALID_DERTYPE				-803
#define ERR_PKCS5_INVALID_PADDING				-804
#define ERR_PKCS8_NOT_SUPPORTED_OID				-810

#define ERR_PKCS12_INVALID_KEYLEN				-830
#define ERR_PKCS12_INVALID_PWDLEN				-831
#define ERR_PKCS12_INVALID_SALTLEN				-832
#define ERR_PKCS12_DECRYPT_FAIL					-833
#define ERR_PKCS12_INVALID_INPUT				-834
#define ERR_PKCS12_MALLOC_FAILED				-835
#define ERR_PKCS12_CRYPTO_FAILED				-836
#define ERR_PKCS12_INVALID_VERSION				-837
#define ERR_PKCS12_NOT_SUPPORTED_OID			-838
#define ERR_PKCS12_INVALID_SPEC					-839
#define ERR_PKCS12_NOT_SUPPORTED_CONTENT_TYPE	-840
#define ERR_PKCS12_NOT_SUPPORTED_BAG_ID			-841
#define ERR_PKCS12_NOT_SUPPORTED_ALG_ID			-842
#define ERR_PKCS12_NOT_SUPPORTED_CERT_TYPE		-843
#define ERR_PKCS12_ENCRYPT_FAIL					-844
#define ERR_PKCS12_BAD_MAC						-845

#define ERR_RC2_INVALID_INPUT					-850
#define ERR_RC2_INVALID_INPUT_LEN				-851

#define KS_ERR_KCDSA_INVALID_PARAM				-860
#define KS_ERR_KCDSA_INVALID_INPUT				-861
#define KS_ERR_KCDSA_INVALID_PUBKEY				-862
#define KS_ERR_KCDSA_INVALID_KEYPAIR			-863
#define KS_ERR_KCDSA_INVALID_SIGNATURE			-864


//set 1000~1999 about ksw1(and, ios 공통)
#define KS_INVALID_PASSWORD                     -1001
#define KS_FAIL_TO_CHANGE_PASSWORD              -1002
#define KS_FAIL_TO_GET_VIDRANDOM                -1003
#define KS_FAIL_TO_SELF_VERIFY                  -1004
#define KS_FAIL_TO_CRL_VERIFY                   -1005
#define KS_FAIL_TO_GET_RANDOM                   -1006
#define KS_FAIL_TO_GET_ENVELOPE                 -1007


#define KS_ERR_SIGN_FAIL                        -1101
#define KS_ERR_SIGN_NOT_SUPPORTED_ALG_ID        -1102

#define KS_ERR_CMP_FAIL_TO_UPDATE               -1201
#define KS_ERR_CMP_FAIL_TO_REVOKE               -1202

// KISA - Enhanced password check
#define KS_INVALID_PWD_SHORT_LENGTH             -1501
#define KS_INVALID_PWD_NO_ALPHABET              -1502
#define KS_INVALID_PWD_NO_NUMERIC               -1503
#define KS_INVALID_PWD_NO_SPECIAL_CHAR          -1504
#define KS_INVALID_PWD_UNAVAILABLE_CHAR         -1505
#define KS_INVALID_PWD_REPEATED_SAME_CHARS      -1506  // 같은 글자가 4번 이상 반복 (1111, aaaa)
#define KS_INVALID_PWD_REPEATED_TWO_CHARS       -1507  // 2개 글자가 3번 이상 반복 (121212, ababab)
#define KS_INVALID_PWD_REPEATED_THREE_CHARS     -1508  // 3개 글자가 2번 이상 반복 (123123, abcabc)
#define KS_INVALID_PWD_CONSECUTIVE_LETTERS      -1509  // 연속되는 글자가 4개 이상 (1234, abcd)


// ios(2000~2999)
#define KS_ERR_FAIL_TO_SAVE_CERT                -2001
// android(3000~3999)

#endif
