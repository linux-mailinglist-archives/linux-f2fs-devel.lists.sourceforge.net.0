Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE92B2977B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Aug 2025 05:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCuSz0YurSrCkxAoytZzeLf6nrlIbxYiVYL/HCZj40k=; b=QTaEt6k68pFGdcMYUE3WSu2taz
	yCCvlL5hHwQ2sQGxvbglocyJcCcwxLGrrdc/AFpNImBt001tAqYbzuxdIhYRBBvDXEpS97wJtJ7Py
	YIFGHoiYefwa5cWqfT29LEzyXr3ek6+Bt4Fq20jwWH2a5lqUv0jMQTnYHcBGew+iksmY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unquj-0007gy-Hf;
	Mon, 18 Aug 2025 03:52:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1unquh-0007gi-Ry
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 03:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDWJgfeHmcYK2USKkOIbOmYA8bKEIRr+sCjwX9cHKtE=; b=YbVlEH+hRH5ZsNgaKAjiifDGz+
 aNqvLihWfWfcQPHedqO4w4cRxEmobfQp9/UmpDxO8PicX6QAsHWI1ma6OlsAGh+39puQ3tLFHsDt9
 aTXIxdMZc5wE7cS8Rai7+Fjn0lfCsQ3ZMghSdLsxFbONHH9/qgNUy/z7fPJCm9IkTAsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bDWJgfeHmcYK2USKkOIbOmYA8bKEIRr+sCjwX9cHKtE=; b=VYTbgTPn/NxXAVTtrv5C7VNLku
 ulnstV9aY9WdorAbqvIYDRku/xq+ByWnaL8P2+WXzqHvLGFZav8wg3ZQd8zWyBRPk6BsrEmjsgUjg
 bFPwM8ItVDAQo0SkyEAtwDOXwZhfo/4xHlDWkkJl23JOZPCnV43elCsjrMQVEIzSxh5A=;
Received: from mail-japanwestazon11012000.outbound.protection.outlook.com
 ([40.107.75.0] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unquh-0005ng-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 03:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgtMkEP90IzAv8qlhZaWFtyAVLrihUEkwfcc30RPKhSiMlNkcAK6NEXx4UteKEMgAdRjELklc03qqIAUsmxY0aKP+Oiuvhu2Qzz2LYcutnjradVuYqCLMoTX/USu/JgM5ByCSGHOAoZ+HDUReNJ6Tg0XC2C1KVyl54hiuwjQ/TubKeKkeSP2jZTFf7k78E6mirHseZTGzHSYrZYDUiOqFI7CnhzN8rU2cbuYEIChzt/C0UjMfGKt8EW4dFuvaTmbN2LZuF0/UZfGikVYOugic2h3jAWkBUYKpxW6ZMWBJHv8LakMk1lMqWV0PQuSVQnWXKMk4FUvTVotXpdP4f2GpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDWJgfeHmcYK2USKkOIbOmYA8bKEIRr+sCjwX9cHKtE=;
 b=aosc1o1wwT0TSvF294F8z/c/d3jDYM01B/VIHJR1k8djlGSK822wRMh6ZSeanMMYXHm+5QJ1JmUX26Dnpt27TUog7macE4Xo7ITyDkV34Z/uEmWEGyCdGo2czB+/aJVORgvAhH4+otYH9nAY0ToTHKOfaezelPRc2ChLr+vfiunyansMtjj9t3cjkW4x/YFdalMA9Irr9cKAFhJx75PPq4rfKu3KYn9fLlf5y2xbRZ+F/h0CafkFDqBSd29JY6W5ky0a5EVV8Zt7U8SIX6K8kmmln5WhMGOu19O1sfPEir8wWZj9JqYMH0hmp0fxb3+8fG0d90iBbQ23ZFXxADkSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDWJgfeHmcYK2USKkOIbOmYA8bKEIRr+sCjwX9cHKtE=;
 b=IodiK11Tx/JRZM9X9/IhyeSHQQpDmjsWUs4ZdhzJOFLkyC9wzBs/14H+87tVfXdpN3ySHvbnW0JfXV8vAtJGMFistmUBGcEEqx/ZIF6fDJBUCrEMa6hhM8/qVXrsPLyphrV+OR8BGJv+iYKhmHQ3zSaefV/upnrhS3dcWt4B09SGmn0WlsKFeRMrEF6r+Ar+gu3e4yOqXfo8VdpjbCilSQNAXpkKRbTxLq+p0+jPYyXDnJEgiIjYxZpe+zyJhdAwPYVCkFFA7rmj1kjTvt6wTBVKonx5si3SiHWl7CJdTe/WfkdFByj8UlWTLla4+k0LfNOEJqxakVBNfBVb9c6XgA==
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by TYQPR06MB8042.apcprd06.prod.outlook.com (2603:1096:405:2f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 03:51:48 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 03:51:48 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
Thread-Index: AQHcB3eLVY4SVx71lUaUM/5T13XYU7RYJ4YAgASgL4CACxAxAA==
Date: Mon, 18 Aug 2025 03:51:48 +0000
Message-ID: <19b1554b-12ed-4992-8a0a-6cf2f115a4d2@vivo.com>
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
 <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
 <4ca35d43-1e9d-4dd4-a291-0a54f93a2d67@vivo.com>
In-Reply-To: <4ca35d43-1e9d-4dd4-a291-0a54f93a2d67@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6845:EE_|TYQPR06MB8042:EE_
x-ms-office365-filtering-correlation-id: 7730172e-4f7e-4069-06cb-08ddde0a8ee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RVIrbUZrTnJWVmMwSGtQZ0Fnc29QMXJ6N2ZROVdMMDFEV2ZTV29wK21uMWh5?=
 =?utf-8?B?Q0UwREZWdmtIRTRIbUxYT1plVnpxaVZHQXpQMDBCL09qQ2FBZGg3YWc4RFdk?=
 =?utf-8?B?aTBKUDVBOGRjWEU5ZEZ0UWlKenV6NjVyQkRzNlE5SmtSYUVqU0Y0NW1kU1dH?=
 =?utf-8?B?Z2tKVGpYL3JaK1gveHVWSGhkcXFab0JWaVNYUkoyV05aMk5wbTA1S29Yb1Ra?=
 =?utf-8?B?S0hqMHphK1ZZQXdDRXpvVFVOdGFmTG1uU1RxT3I1UExCclZHZUQ5TEFweVFx?=
 =?utf-8?B?eEdEVzFpbFdyaFRyOG5HOVFHY3M1T290VjM1QWNjbnF2am5OT0IxN21TZEVQ?=
 =?utf-8?B?TnNTeXJwNGZrN01rUHdUcXJ6bkZNMUZrRkxoMS90alNQMUZ6L1RtdUpiTWU1?=
 =?utf-8?B?MEUySGsyeDQ2ZWxmdGRXb0wxUytSMHE1YVR1NFlSbzU3YW5XYksrZnF3cGFR?=
 =?utf-8?B?UXQ5blNJd0d2YVdjRDUzNW5ybkE4NVdMYkEra0FTT21QZCtzd2VwYTFtTlds?=
 =?utf-8?B?dUVaV0VRRll2RDRBaThGeURxOGxLa3JxU1RwZlc1d1R2L0srWEdNclNXbXYy?=
 =?utf-8?B?SmYwY2pqMWNTdEZ5dExUZUp2UjltWU9raG9PMjFna2srN2JoNWRyY3RyN3N5?=
 =?utf-8?B?UFhwR1U1UllZU2ttM1BRQUNicFR6UHduZDlrOEpqSWtLWGt1NmxCd2lrSEMv?=
 =?utf-8?B?bXJJY0ZvSkhRdFJlQ3lHYzdpYzBvaHFHRVROWWVaRWZtb0JxUFBkSGJhVzM5?=
 =?utf-8?B?WmZyb3hKNXlxN3E5Nm4yckdLK0ZvWVBZMUMyMXpRV05hNkYrb1loaWUvSjZh?=
 =?utf-8?B?SDBHbDFYOXNzanVYS2hRR2dIUGtIeFNHTDNsaXpsa3NXQm9zaFZzZVNjZ1hq?=
 =?utf-8?B?SUQ2QWx5cjFHUUhxSEdnNGdMUWRxRXhoVTVOOVU4bmk4em90b1BJWjNML3Q2?=
 =?utf-8?B?Mm85SytNVG52ZDQvb2oraUtpcUZPazM2c01IRDh4bUxzdEplajRSSnI5enlP?=
 =?utf-8?B?bmt0dlR2ZmxFcVZ5WXkxSEdlV1c4VURxT3I4cUh3NkxKQW1CTGhNK0JHT2Zy?=
 =?utf-8?B?SStCa2o3bVlSdDl0enBIdytlL2hkcy9RZ3UvcEUrbWlBM1U5My9PWkVyWld2?=
 =?utf-8?B?Z21aT3Axd1RoQVY4ZTBQYWdmODJYMnhnQi9GNkdTTXBJNVZCbEFwNTZVc2Z4?=
 =?utf-8?B?U0dSc0JYRUpHWlBkYmpjSisxVGJlcXpnRWhrempFUnRoRnQ3cmtVTWpHVUZQ?=
 =?utf-8?B?OVk5Nm4wWnMrd0lDR3RFN2dtUndCam1xNGpld0FtQXhyZjRpVFdYZ3graWZt?=
 =?utf-8?B?OVh4cWxSZWxGdkd5Q3NLK2M4Mldad3ArN0cxUXV6bVhybHZwZXdEWDBhdDBX?=
 =?utf-8?B?ejVUZi94RGxGMTkvY0dOd282N0FWTnQyelc4NnFFckl1djN3dEJGUzcraHR0?=
 =?utf-8?B?eTArdnFId1BYaWt6V2Z0RU1ldUpJai9kMWUvdERudU5US3RtVkUxN1dROW4y?=
 =?utf-8?B?a0lrb2pVSUxsUlFOV3F5MTkvWVRtblEyWUJ0c2hKRERNVWc3WXYvR29BaVFk?=
 =?utf-8?B?b2E3ajRZREtqd3E2WndleE5IbExxNkNBSU12Z3VheFlvVFQ3TXd0d1JTVWhR?=
 =?utf-8?B?VlJSRnRwUDI5UUN6TzI1aFRuRmJJNHFEbWswY3QzMy9SSDQya0RCS1hBcnlG?=
 =?utf-8?B?ZW14ZGdzNUI2cE95eEVkQ2g3WEpkUmFhYnlTcVBLcE8zTFlmMXBaLzYrMXBu?=
 =?utf-8?B?UTZhSVd4cXI4aEx6ZjNObTh4SWZ6WVM4MUJsQ2E1M3lQN0xNckc4dUw4cUpk?=
 =?utf-8?B?UVl3dVZkNGpYN3RqbkkwT05ZNnVSS0pJYUhUNy93blFHTEVIelYrZHdaZDZX?=
 =?utf-8?B?Y01aTGNvcTlUOFRnYWl3UEltWHJnejN4bG1CakR1RmdSRWxEM3R4V29vVkJL?=
 =?utf-8?B?SUhLNzhJY0FQazZXNHBjeHRBdUlsUHNpbThMUkJlRVFvYURGeG9lYm5oVDJS?=
 =?utf-8?Q?6D+A+arBOf18yjl9++7BTwubjMiguw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjV1VG5KL0ZhcjlySEdleWRFUWxubzh3L3kycWYwVWdWazNXNExzbkxJRUww?=
 =?utf-8?B?b1lpbzN5Q3BOQ2NNeG1md0o5OWloSjhqazBvNndPU2d3K2dmMkc5cXlaeVRo?=
 =?utf-8?B?eUFIUW1VbjBHMGZDbk1rM0VuM2dYd1RRUUE5NHViRmRMTCs1QWdXemw5WTNZ?=
 =?utf-8?B?Wi9GdkJYdnVNWG51U0E1ZGZuMDZqcjZ1YVl1emtiSzFxYkNycjVoMGlCMkpB?=
 =?utf-8?B?Qk1PUHNjQnd1b21HYjdkM1RBZXFaTXVUK0Y3VGhJbFFYM045a2NNYmVlT1Rz?=
 =?utf-8?B?Wk9rNEtLZ1FhOHZ2Y0FIMnZ1SHZ1blNhYzBieitNWWYrSWNqUnkxblovb1Ri?=
 =?utf-8?B?Vm9nQllPS3czWHI1WFpSWFd5NEpTNXRBeHVMVHZrY3ZTZkF2R0Jvd1JCQ0VQ?=
 =?utf-8?B?TlUxbC96Y0dPUGNXMzRXSTJqajlIU1NFZVF5ZldIOFBsWnk0dUZyc0ZjV1Mw?=
 =?utf-8?B?Y1ZpSE90aDJtTG5Cd21sZk1OLzlXOHlieFlzRUNUUlpsM3pwci9DeC9vcXRz?=
 =?utf-8?B?UVVGUlZDa0NUQmg4VXY5UU9uN3B0L2xEQmRwb2VhOEp6eFdpMUtORUI5U3l5?=
 =?utf-8?B?SThxUUowY3ljanhSVElNZXR3blBIVmtoOU5pWjNGUUNoaUROeVllR3RTSnBy?=
 =?utf-8?B?cVIwT1N2Qjk0REJzOHpvQkNPd0Q5RDRVRWlmT1EySTVUVFo2RndXcS9lS2Iv?=
 =?utf-8?B?dG9HQnZYYzJNUjdJdGw3VThNMTVNcitONlhlT0Z1TGFyM3dKa2lUUUNiL0NH?=
 =?utf-8?B?MlRWdUNhbk9KVS8rK1E2WmgwTnBJcnZ0U2Z0TXZIcXpmMExhTU8ySEh2Z2dX?=
 =?utf-8?B?NCtIWkRwNk1GNGMvTUdjMTdyRGNhNlhWeFFOT21ma3lIV1lFWGpHZ2p3U2R0?=
 =?utf-8?B?cEJ4bTdoZEhVbUptRDlsWXFNdjZjazlVelVGWVJJNUF0WDR0a05ROVN0NWlK?=
 =?utf-8?B?TzJvRlZCTkJJdkt1UE9ISmpEZVE4ajN6VFJwbFpRL0ExVVhJMGViQTlOOTNv?=
 =?utf-8?B?a2NLZFQzaldLanN1NnVYZ0V2R1cyUlZZSlJKVlkrZXlldDQzUzRzdnV4Mlcx?=
 =?utf-8?B?S2RmMlhkejNXS1FZeFZJR1JIdTZFbDdwRUVEaFg1SW5MRmw0Q2J2V2NvZk5D?=
 =?utf-8?B?VTE1Z09ySDIxbG04YURLU2ZRS2g5TzM0RnhiL3dFVTBPeStqZHFlbHZYb3V4?=
 =?utf-8?B?ZTFEL2ZQWHBFK3F3OCt4bS9taGo1VG91ZXdjY1VpNTFQUWpyZWc0aGpVUTZn?=
 =?utf-8?B?NWEvd0oybUZlSFVSNHFORHlTaWd1VjQ4VEl2c3Yzc01pVWtPZklmRCtrRVZO?=
 =?utf-8?B?M3lQUExMamZtS3dVNU5VYklSeXRFcXpvWDlybWZjYWJpaUhzcnBaS3llWWZk?=
 =?utf-8?B?Nit5NUx0N0pzalNIWkVRUm1DblZXSU5LVkdNZlFqZG5qRnRxU0lSL080cVFS?=
 =?utf-8?B?S2IwYU9oMFBwbm5OdlRibHFjTEpQOXgyYnVvcVdodGlpNGt1ODhWdSt6K3cr?=
 =?utf-8?B?NkNpZ1RScVhhM1BoMndYRTFqdjl4N1JPWWYzNmpFd0FsRmwyV1JWeXR5dzJX?=
 =?utf-8?B?S0w3ZFV3Y25ZRldMd1V4c3IyNmNtZi9KWnpKeTFnQ1A0akxGMnFkRDMzbU9Q?=
 =?utf-8?B?QVBrVFJ6VGNOM1RDRnArYVBJQnFpcHp2WU5FVEdoYzJIRE9Fd0pqTEZhanVt?=
 =?utf-8?B?TXpBL01BT1pIbHUwQXl1emYvZVBveDNmT1JXSGpxNXRwZVdYWnVwV1NDbFpQ?=
 =?utf-8?B?T002K1RJT0ZmVWl4MHRzUWM1K1BHaWFDOHlBVkhHc0VPbGZiNC9yMWI0OEs3?=
 =?utf-8?B?VnFxU1RVZjYrKzhjeE85dC9ZSFNvOWFDeWJaT2tMRUZuek5ZWmlFSHdLYkYw?=
 =?utf-8?B?Rm4zQ2ZjREY1ZlYxeUZlSDBleHNjSUtiUkwzckpkc1pzR3BCelpMblZGdTVa?=
 =?utf-8?B?Z0orSE5zY3dqKzFJa2JDcDNPSDV2a0dFNWhNN0NGdzgzN2c0bDc5ZzVaVDBI?=
 =?utf-8?B?SERkVEE3L2VOb2NldmdNc3pYVGpiMWJSbW9WNlVFcXRmSlFaYngxaEVFT2VL?=
 =?utf-8?B?M05WS3JhQ1FsV1loSk1kbVVienIxV2s5RUV4clVKbXhQVmZqc0t6YmlseVBp?=
 =?utf-8?Q?5xNc=3D?=
Content-ID: <2A83CE7BACD456459E81882C9F9C1BF0@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7730172e-4f7e-4069-06cb-08ddde0a8ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 03:51:48.4844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4DyeIG/nguQF764xOWU4+Xi959HQnMCt1EEvg67n0M9SRCBxXByXvH0+IBwR60DecxuFLsG6/pupQDiB6hlmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8042
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, The combination of truncate and falloc complicates
 the recovery process. For example, in the following scenario: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [40.107.75.0 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.0 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1unquh-0005ng-Qx
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: =?utf-8?B?546L5pmT54+6?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywNCg0KVGhlIGNvbWJpbmF0aW9uIG9mIHRydW5jYXRlIGFuZCBmYWxsb2MgY29tcGxp
Y2F0ZXMgdGhlIHJlY292ZXJ5IHByb2Nlc3MuDQoNCkZvciBleGFtcGxlLCBpbiB0aGUgZm9sbG93
aW5nIHNjZW5hcmlvOg0KDQp3cml0ZSBmaWxlQSAyTSB8IGZzeW5jIHwgdHJ1bmNhdGUgMjU2SyB8
IGZhbGxvYyAtayAyNTZLIDFNIHwgZnN5bmMgQSB8IFNQTw0KVGhlIGZhbGxvYyAoMjU2SywgMU0p
IG5lZWQgdG8gYmUgcmVjb3ZlcmVkIGFzIHByZS1hbGxvY2F0ZWQgc3BhY2UuDQoNCkJ1dCBpbiB0
aGUgZm9sbG93aW5nIHNjZW5hcmlvcywgdGhlIHNpdHVhdGlvbiBpcyB0aGUgb3Bwb3NpdGUuDQoN
CndyaXRlIGZpbGVBIDJNIHwgZnN5bmMgfCBmYWxsb2MgLWsgMk0gMTBNIHwgZnN5bmMgQSB8IHRy
dW5jYXRlIDI1NksgfCANCmZzeW5jIEEgfCBTUE8NCkluIHRoaXMgc2NlbmFyaW8sIHRoZSBzcGFj
ZSBhbGxvY2F0ZWQgYnkgZmFsbG9jIG5lZWRzIHRvIGJlIHRydW5jYXRlZC4NCkluIGZhY3QsIHRo
ZSBjdXJyZW50IGYyZnMgY2Fubm90IHJlY2xhaW0gdGhpcyBwYXJ0IG9mIHRoZSBzcGFjZS4NCg0K
RHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBpdCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vp
c2gNCmJldHdlZW4gdGhlIGFib3ZlIHR3byB0eXBlcyBvZiBmYWxsb2MuDQoNCkkgdGhpbmsgdGhh
dCB3aGVuIGEgZmlsZSBpcyB0cnVuY2F0ZWQsIGEgRklfVFJVTkNfRklMRSBmbGFnIHNob3VsZCBi
ZSANCnNldHRlZC4NCldoZW4gdGhlIGZpbGUgaXMgZnN5bmMnZCwgaWYgdGhlIEZJX1RSVU5DX0ZJ
TEUgZmxhZyBpcyBwcmVzZW50LA0KYSBjaGVja3BvaW50IG5lZWRzIHRvIGJlIHBlcmZvcm1lZC4N
Cg0KVGhhbmtzLA0KDQpPbiA4LzExLzIwMjUgMTA6NTQgQU0sIFdhbmcgWGlhb2p1biB3cm90ZToN
Cj4gSGkgQ2hhbywNCj4NCj4gVGhpcyBwYXRjaCB3aWxsIGNhdXNlIGZhbGxvYyB0byBmYWlsIGlu
IHRoZSBmb2xsb3dpbmcgc2NlbmFyaW9zLg0KPiB3cml0ZSBmaWxlQSAyTSB8IGZzeW5jIHwgdHJ1
bmNhdGUgMjU2SyB8IGZhbGxvYyAtayAyNTZLIDFNIHwgZnN5bmMgQSANCj4gfMKgU1BPDQo+IFNv
IEkgd2lsbCBmaXggdGhpcyBpc3N1ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4N
Cj4NCj4gVGhhbmtzLA0KPg0KPiBPbiA4LzgvMjAyNSAxMjoxNiBQTSwgQ2hhbyBZdSB3cm90ZToN
Cj4+IFhpYW9qdW4sDQo+Pg0KPj4gSSBqdXN0IG5vdGljZSBnZW5lcmljLzQ4MyB3aWxsIGZhaWwg
dy8gdGhpcyBjaGFuZ2UsIGNhbiB5b3UgcGxlYXNlIA0KPj4gdGFrZSBhDQo+PiBsb29rPw0KPj4N
Cj4+IFRoYW5rcywNCj4+DQo+PiBPbiA4LzcvMjAyNSA0OjQ0IFBNLCBXYW5nIFhpYW9qdW4gd3Jv
dGU6DQo+Pj4gVGhpcyBwYXRjaCBmaXhlcyBtaXNzaW5nIHNwYWNlIHJlY2xhbWF0aW9uIGR1cmlu
ZyB0aGUgcmVjb3ZlcnkgcHJvY2Vzcy4NCj4+PiBJbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvcywg
RjJGUyBjYW5ub3QgcmVjbGFpbSB0cnVuY2F0ZWQgc3BhY2UuDQo+Pj4gY2FzZSAxOg0KPj4+IHdy
aXRlIGZpbGUgQSwgc2l6ZSBpcyAxRyB8IENQIHwgdHJ1bmNhdGUgQSB0byAxTSB8IGZzeW5jIEEg
fCBTUE8NCj4+Pg0KPj4+IGNhc2UgMjoNCj4+PiBDUCB8IHdyaXRlIGZpbGUgQSwgc2l6ZSBpcyAx
RyB8IGZzeW5jIEEgfCB0cnVuY2F0ZSBBIHRvIDFNIHwgZnN5bmMgQSANCj4+PiB8U1BPDQo+Pj4N
Cj4+PiBEdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MsIEYyRlMgd2lsbCByZWNvdmVyIGZpbGUg
QSwNCj4+PiBidXQgdGhlIDFNLTFHIHNwYWNlIGNhbm5vdCBiZSByZWNsYWltZWQuDQo+Pj4NCj4+
PiBGaXhlczogZDYyNGM5NmZiMzI0OSAoImYyZnM6IGFkZCByZWNvdmVyeSByb3V0aW5lcyBmb3Ig
cm9sbC1mb3J3YXJkIikNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGlhb2p1biA8d2Fu
Z3hpYW9qdW5Adml2by5jb20+DQo+Pj4gLS0tDQo+Pj4gdjM6IEFkZCBhIEZpeGVzIGxpbmUuDQo+
Pj4gdjI6IEFwcGx5IENoYW8ncyBzdWdnZXN0aW9uIGZyb20gdjEuIE5vIGxvZ2ljYWwgY2hhbmdl
cy4NCj4+PiB2MTogRml4IG1pc3Npbmcgc3BhY2UgcmVjbGFtYXRpb24gZHVyaW5nIHRoZSByZWNv
dmVyeSBwcm9jZXNzLg0KPj4+IC0tLQ0KPj4+IMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqAgfMKg
IDEgKw0KPj4+IMKgIGZzL2YyZnMvcmVjb3ZlcnkuYyB8IDE4ICsrKysrKysrKysrKysrKysrLQ0K
Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgNCj4+
PiBpbmRleCA0NmJlNzU2MDU0OGMuLjI4ZmNlNTkxOThjZSAxMDA2NDQNCj4+PiAtLS0gYS9mcy9m
MmZzL2YyZnMuaA0KPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oDQo+Pj4gQEAgLTQ1OSw2ICs0NTks
NyBAQCBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgew0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGlu
b2RlICppbm9kZTvCoMKgwqAgLyogdmZzIGlub2RlIHBvaW50ZXIgKi8NCj4+PiDCoMKgwqDCoMKg
IGJsb2NrX3QgYmxrYWRkcjvCoMKgwqAgLyogYmxvY2sgYWRkcmVzcyBsb2NhdGluZyB0aGUgbGFz
dCBmc3luYyAqLw0KPj4+IMKgwqDCoMKgwqAgYmxvY2tfdCBsYXN0X2RlbnRyeTvCoMKgwqAgLyog
YmxvY2sgYWRkcmVzcyBsb2NhdGluZyB0aGUgbGFzdCANCj4+PiBkZW50cnkgKi8NCj4+PiArwqDC
oMKgIGxvZmZfdCBtYXhfaV9zaXplO8KgwqDCoCAvKiBwcmV2aW91cyBtYXggZmlsZSBzaXplIGZv
ciB0cnVuY2F0ZSAqLw0KPj4+IMKgIH07DQo+Pj4gwqAgwqAgI2RlZmluZSBuYXRzX2luX2N1cnN1
bShqbmwpIChsZTE2X3RvX2NwdSgoam5sKS0+bl9uYXRzKSkNCj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9yZWNvdmVyeS5jIGIvZnMvZjJmcy9yZWNvdmVyeS5jDQo+Pj4gaW5kZXggNGNiM2E5MTgw
MWI0Li42OGI2MmM4YTc0ZDMgMTAwNjQ0DQo+Pj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jDQo+
Pj4gKysrIGIvZnMvZjJmcy9yZWNvdmVyeS5jDQo+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RhdGlj
IHN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSANCj4+PiAqYWRkX2ZzeW5jX2lub2RlKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwNCj4+PiDCoMKgwqDCoMKgIGVudHJ5ID0gZjJmc19rbWVtX2NhY2hl
X2FsbG9jKGZzeW5jX2VudHJ5X3NsYWIsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEdGUF9GMkZTX1pFUk8sIHRydWUsIE5VTEwpOw0KPj4+IMKgwqDCoMKg
wqAgZW50cnktPmlub2RlID0gaW5vZGU7DQo+Pj4gK8KgwqDCoCBlbnRyeS0+bWF4X2lfc2l6ZSA9
IGlfc2l6ZV9yZWFkKGlub2RlKTsNCj4+PiDCoMKgwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmVudHJ5
LT5saXN0LCBoZWFkKTsNCj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBlbnRyeTsNCj4+PiBAQCAt
Nzk2LDYgKzc5Nyw3IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gDQo+Pj4gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+PiDCoMKgwqDC
oMKgIHdoaWxlICgxKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmc3luY19pbm9k
ZV9lbnRyeSAqZW50cnk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmb2xpbyAqZm9s
aW87DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGxvZmZfdCBpX3NpemU7DQo+Pj4gwqAgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgYmxrYWRkciwgTUVUQV9Q
T1IpKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+IEBAIC04Mjgs
NiArODMwLDkgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5mbyAN
Cj4+PiAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LA0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY292ZXJlZF9pbm9kZSsr
Ow0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5
LT5pbm9kZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5tYXhfaV9z
aXplIDwgaV9zaXplKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW50cnkt
Pm1heF9pX3NpemUgPSBpX3NpemU7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9PSBibGthZGRyKSB7DQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gcmVjb3Zlcl9kZW50cnkoZW50cnktPmlu
b2RlLCBmb2xpbywgZGlyX2xpc3QpOw0KPj4+IEBAIC04NDQsOCArODQ5LDE5IEBAIHN0YXRpYyBp
bnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gDQo+Pj4gKnNiaSwgc3RydWN0IGxp
c3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZWNvdmVyZWRfZG5vZGUrKzsNCj4+PiDCoCAtwqDCoMKgwqDCoMKgwqAg
aWYgKGVudHJ5LT5ibGthZGRyID09IGJsa2FkZHIpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChl
bnRyeS0+YmxrYWRkciA9PSBibGthZGRyKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aV9zaXplID0gaV9zaXplX3JlYWQoZW50cnktPmlub2RlKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoZW50cnktPm1heF9pX3NpemUgPiBpX3NpemUpIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGYyZnNfdHJ1bmNhdGVfYmxvY2tzKGVudHJ5LT5p
bm9kZSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlfc2l6ZSwgZmFsc2UpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGVycikgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19tYXJr
X2lub2RlX2RpcnR5X3N5bmMoZW50cnktPmlub2RlLCB0cnVlKTsNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9tb3ZlX3Rh
aWwoJmVudHJ5LT5saXN0LCB0bXBfaW5vZGVfbGlzdCk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0N
Cj4+PiDCoCBuZXh0Og0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByYV9ibG9ja3MgPSBhZGp1c3Rf
cG9yX3JhX2Jsb2NrcyhzYmksIHJhX2Jsb2NrcywgYmxrYWRkciwNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV4dF9ibGthZGRyX29mX25vZGUoZm9saW8p
KTsNCj4+DQo+DQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
