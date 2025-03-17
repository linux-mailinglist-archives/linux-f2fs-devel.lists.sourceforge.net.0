Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF3A64602
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 09:43:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu64U-0002zh-Do;
	Mon, 17 Mar 2025 08:43:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tu64T-0002za-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 08:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAFzB97b2eOVAX8kp8wVZqL+or1EoC2qR/rIYlTbISw=; b=JwrdHfGnIHO4V023paP/GQMFSi
 TXRt4i4PwO6Uy3MtIsf4BjYAZOwn57P16wZXXBHVxGSAYCMTDr0B/6ucDfUClhoeXljHgVLF8LBal
 BxTrrcCT6D6TeA9vUtwS5TGKcMoLxvKaiH1nyjCf1TsmToHM3OraNHQnLyYd095mCC4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAFzB97b2eOVAX8kp8wVZqL+or1EoC2qR/rIYlTbISw=; b=NFE13gvZrJBGwtR6tRexDBvyPF
 0GlWRimlIHgvn7txdoljKFcgx97mJPcYou7EcRkDt/pdbDExPDlrUjm2nIvesIdEY/MnUlEKJ5tIJ
 VE4oOeJfyYWbBrdQ1yU/Ci/XRvMOjNZqdNT2aqkBUHGO+oPBm5KZGUJjWDVAW+MwSajE=;
Received: from mail-tyzapc01on2089.outbound.protection.outlook.com
 ([40.107.117.89] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu64N-0003Bv-Ba for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 08:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLtelc1sq7yRYsQyEGrV1bRe6dLK7/ylDIj+HatTgRAHN9XQ5EACW+Xmf0GgtVUE/Sqzh7svsRCvNIFSXHbUPE9iAHWH7rZn861Pu57aK+olpo7tpOln9sBAWeie8W8NGO8WMD2mZcCr5l9xq+M+Z2BqCPg0nwv/4qAC3sojTMknBQRVtpsQ10F0mtbfsgRFAFcLRdT8bmiYJOLM4XoSnox36q+rmGMu8qJ2gNZKwPhmjUMX/b9iluz53NnnK/3bbBpXkQd6h46C2yf3PWhDUFq9sbaTN4bsgV2ezgdSqBgDIzc58lQHsXop5Aabp9yz/btdxcJWNK4+zMdd/oJTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAFzB97b2eOVAX8kp8wVZqL+or1EoC2qR/rIYlTbISw=;
 b=P8x+RbLGEnt0n/ER5FP+66ErdsIgrm/Ja++z5znS/jU2Oex6Z/WOG1GgNmuw1aaitv207GEdzrluqH38kt09omrwIzCQ5RYa7uju3SKH3vEfG354trcf0cIV58nD96HeP4LalJ8Yjz4856BRLbp3m65BgtGdtQd+H7YwmYM0HjvmLfCV5hzLgcYxJ6YYyJa9IjzLcht9XbWFjhG8RQcjDpxGBOl0GXcT1ljeQDAr92sNXN+3dWtP1HI6t28VAQY0E1c2jPjz+MUAgZWQLZ+3JIHNhhhsm26m5MU/I8aCSONIYiu3vamHXidDYe5xWi57KdPrnIoi2nA+7k/s+EY+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAFzB97b2eOVAX8kp8wVZqL+or1EoC2qR/rIYlTbISw=;
 b=VpOGoxLevbJOvOPprnkl9aDdyKQFPWOtYVd6dSWt4hQWKicR54jM623o6FGwqRE4iioIBTattrLRLDJjG5aJX8gGCcsXtHAt592PTcTTCFPwWUExzIKJjjVihfhEwdt7LZqEbc6lwkjZzpaLLwWz/NqB3G0/UKgNq6bj/KkPsIUA4SAT9MfhvIiPYFJxJa41wAQ5UmP0l8PhmNV5vzR2fXFV950KjRuuZe1zc+HKbClxL4Pyiij6WsO9+fo0wVSyMnCLaNHNvcToom9gm8c4L3zf48KFWtHR8ibu13iIahC4YRh67tGIuD4cckIUiFODlAVVJ5MVAe1ent6sDjZxHA==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEZPR06MB5920.apcprd06.prod.outlook.com (2603:1096:101:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:28:32 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Mon, 17 Mar 2025
 08:28:31 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: fix missing discard for active segments
Thread-Index: AQHbYo97IM4VJ+ShM0Cx72FTZCbyqbMfp5AAgFERrQCABpmjgIAAFSKA
Date: Mon, 17 Mar 2025 08:28:31 +0000
Message-ID: <bc4ef0da-2227-4562-bfaf-a59a1b2e2d73@vivo.com>
References: <20250109122755.177926-1-guochunhai@vivo.com>
 <4270b213-e4f9-46b2-958a-df3dbaaed969@kernel.org>
 <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
 <6ad02c17-a175-43fd-bce4-d3cd2dc01338@kernel.org>
In-Reply-To: <6ad02c17-a175-43fd-bce4-d3cd2dc01338@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|SEZPR06MB5920:EE_
x-ms-office365-filtering-correlation-id: 01e49453-7b0c-4460-12f5-08dd652db37c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZWpDUmVFeHUvWlVZZHQ0OWRIVnFiY2tmWnViMW84SE1nRHVHMFJrd1VnNms5?=
 =?utf-8?B?U1kyTzNtZFV3MktYMTlMekdDSjZBZVVESzRaNk52a3dWeVBxanh6ZTNod1hx?=
 =?utf-8?B?Sk14ZStjWFEvV0JoT3dQZmtVUitFVlpJT3JIcW1XRHI5NUxsVmRPSS9kMGFt?=
 =?utf-8?B?U3hQbS8wOVZJUlVDTU91T2loZUdxOSttRTZEbnNpa1FtOWdLaWZaNmZodG04?=
 =?utf-8?B?eWZMZC9hZFhGZzZxMEprWlY3SU5wWEpDY1RsRUdSYzJoVHZFem40Ukxja3pL?=
 =?utf-8?B?VnN4dHRsak9uZ1JmWklMYlRiOUhMTy9TRzEyZ2daMlQyUkk4bjRzWFo4QVgx?=
 =?utf-8?B?Zk9HcXZ2d0VJT3BWdnBaRjVRb3NCVC8zQWsyVk9iZGtUY21sK1dHcDlKNk0y?=
 =?utf-8?B?SndkOGczWklOM1ZuSU1SQTdGV3VNZjRMUHZFclRGelllaU83a1gvODN0OTNu?=
 =?utf-8?B?REw2YjY3UWdUa0lrOEJhMTl2OHVHMWRaZ0hqbXh1NUJYVFpZRFZQUm9INGVi?=
 =?utf-8?B?Q1lMMW9xVk9DYzYwcjR0RHlVekRRbGwzL1NXRW8vL3VhRitiMGYzK3pqU3Zk?=
 =?utf-8?B?bnpKdFhGb3pVd0Z2dVRGTkt4TkRLRDRpWkRJRmd2NGYrSVlwWDJOcndxQkdq?=
 =?utf-8?B?RkZaSDRmUlNoYmVMSWsxM1BRelJHeW81UWp3SDJ5c3FHV084eHdUVE1iMERp?=
 =?utf-8?B?WFhrd29UWWNaQlRKTnhqNjF2MDdsa05HdG5VVExrTTZodzZ2clNaL1VqbU5p?=
 =?utf-8?B?RkRQZEREM2o0V3R5dXJxbDgwQ3FzYXE1TjQzV1hIYVQwU0tZQU5ROXhxaDNW?=
 =?utf-8?B?bVBuYjVpVkxxU3o4aDV0bkRBb1g3YmthVFhKajl1NFVjejVuOWRDbngzenA3?=
 =?utf-8?B?NDhISzFxOHN1QUlWc21vRGw1b3ZFc3BONGtvWGQxdDYxNnUvemlORTdIM1ZJ?=
 =?utf-8?B?UEVKM2VNVnpqb2dleUlhTkVSVTdUemFMVFdRQ0ZxYkpaRU0zbjJIVHVEaUJ0?=
 =?utf-8?B?Sm1mQThyTjJEQXU2anNLb2dEeEJYSTNxZ2pqNnlPUUgrdktOWlMvY1ZPTFYz?=
 =?utf-8?B?TGFIOTdlU3NtN1RFMnRMMk9oNDZYQnhBMFFpVlRwQWlXWlFQdXA3NkhEZnV3?=
 =?utf-8?B?UmVvRDZ6dEpNM1g0eTFoa2dmSGhZRjM0Wkk2TEVFcnpJY0Z4K1E5RmtzYnNU?=
 =?utf-8?B?M0xNcEVVUFpzUlRaSXJ1dG4wNTcrT280dS9COS9nUzZLZk81UkNsYkIvYTh6?=
 =?utf-8?B?YnpNT0U0NVFjUjAwaGNXNHVWNTBjK1ZCekVGSTNPdnBLeUtCRm9DdEd4VXhJ?=
 =?utf-8?B?WFZNdEJWa2tRY0tkSE0vN29KbHZnWUQ1Vm1jMEFsM3VWMWZXM0xFYTJuZWtU?=
 =?utf-8?B?SEVhZjIvU0Y5a2VwaTliS1NYMVNBVG1WaTh5cWlYWEFpeWlhZlZhQ3lNanFX?=
 =?utf-8?B?a3FOM21UZnFValVSMFZwaVhNeUpoU2Uvd3YrTHplVVdiUjBoZXZPK0RlMCtO?=
 =?utf-8?B?Z2ZyUmZyVlloOXM1RzNpRGY0UlR2dy9zN0NJWUs1bUt6enhnZlpxZ2NzTWlp?=
 =?utf-8?B?Q3pEc0JnUmNTZVp6ZjlOemYwZ3Q2UWRvM0VKVms1MUpOWnRINXppMTkzUmF5?=
 =?utf-8?B?REdRcitVNGxidVNpN2twL2llUStrd1ZmeGtzb2dGWHo0MnN6blNYZ29QZzhk?=
 =?utf-8?B?dWdDSlpaYURSVXA4SWtwVWoxSitrYktOQ2c0M0t6WUpoNC9pSEFuamFYSDNi?=
 =?utf-8?B?M2xldFFTSkZldTVRU1BQOUE0cDBFbTFsM0RreXpNRmlNM2tKR2FwcFRGN1Bs?=
 =?utf-8?B?QnVmQUhsejVQa0JEMjBYMGVwWXBzZWkvRjFpKzJyeklTS3J6b0ZrcFB3L3Y0?=
 =?utf-8?B?UjM0UXp4WDFQbldidUs3cGphUnpWeWdEcHhKMUZwT1RLbDBGdUdUZ21mcU9P?=
 =?utf-8?Q?gdgrCedp2N9eqnSwYyIR/qmi5DUX6p0p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S25Qc0orNlVFdG40T2tOL1dMS0p6OHVFMEw4bVg2Qm1HNTBrbjlOQVIwK044?=
 =?utf-8?B?cERBNUxoSVdYbUdGd3lJVHBySzlOVEk5TnVoaUhBMjZhVUw4cXJvMFZpKytF?=
 =?utf-8?B?Q3ZjZ0VWbGl2VFhPWjJFMkZIZ1VrL1Bicmx0SHZPMU1XeERPRFZXQUhEWG9p?=
 =?utf-8?B?SWFLZnExejNzbWt0bXRsWFZ5LzI5Q2xxWEJ3TWxTVlloVzdRWFJiOC84U2JK?=
 =?utf-8?B?WnNJbkI4ZkVIR3YzeWcydk5yTFhXRDRERW40OWNVQ1I3aWpUTTlhVXBjRUhn?=
 =?utf-8?B?RDc3ZHRRZVgzYzRoVEZWZmJzbWdTVWU4Sk4vc3BJTGRzUWc3clRFWkJwelY3?=
 =?utf-8?B?T0VWUFF4WW0zWTI3R1hqWjJya21GMFUyNXRHRE5aS2FpOUE2cCtncDNPNVY3?=
 =?utf-8?B?TDBMcHBjbnBKa1dYbktFWjhZcEVVOW9oTDR5c2g4OWZWWm11TDdtVW51RGtM?=
 =?utf-8?B?Tmx6K1VycXo1TWp5ejhkdjk4eXRDazI1S1dZdFJ0Vy8vYkVUWVBiZmdVNTFj?=
 =?utf-8?B?OHJVS1NrMkpGbmVleGd2cFY3bmp5ZUR4V2szdWdraDRvMy9Ma2FBRVhrcENa?=
 =?utf-8?B?QzhQdm5lamovQktFc0F6cUpwVElTWjkvQ2t5YStwWDBnbHBDeE4xMUptWW5n?=
 =?utf-8?B?dEVRWUNFMHF2YzJtbHFUMTE3N00yTWF3Z3FqbExRSGZXZXZETmtTbTJUbDdz?=
 =?utf-8?B?MStzMnArTmtTV0hCRU83WTJoUjFndXNsR0NnaXQvbGluSDRaSldhMkRCY2tw?=
 =?utf-8?B?NHBDTmUrOW1VWDNINDZhc2x6QXB1eUZqd3ZRaEl6aE5ZbXF4RzNvdVBUUkNV?=
 =?utf-8?B?S2wzOHo1QTRSaXZJamR6YW4yU0RwMnYvcGhqclhPV0E1YndWdFdRbWRVRW9L?=
 =?utf-8?B?SFk5MnFQS3UvU24wbU1GUXhLdHZRNnNuVnNNYWh3WU5pWkROenVqT0V5QmFE?=
 =?utf-8?B?d2laNkVRTS8zYWdTeWxadHZBZTFZeGdjWmZSOHZXRTRnb3ZLTTZ2TU1QTS8y?=
 =?utf-8?B?alFpSHRHczZsbDgweVFTaHlxLzJ1MXF2WlU3SUJZeTRKWTBqOHlrTHJGOFh4?=
 =?utf-8?B?TURjb0p5MStaSnRzb0N2d1lEQ1ZSVThMZk9nc3NsQjZVb1JXakF4TG8yT3ht?=
 =?utf-8?B?Z25uL1QzK2Q5MTc3STBpMW9YVVRzeDAzdERtcmtqTHUvTnNleVEzenhHcWx1?=
 =?utf-8?B?cStUTW03MVptY1ljaXBBMFY5QU9Kd3F1UnFSd25CTGdTaWNucCsrbzFQVmps?=
 =?utf-8?B?YlcySS8zVVh3OGxhZCtLVS95Q0VaTHMvcHVQcUxSQUFVeU9YMCtSSGxaNWp6?=
 =?utf-8?B?U2pGNm10SkkxSUFFM21MdFk0U1ZUOCt6Wlc5Y1dXYmFWMUJhRVhLT1k3Q3JE?=
 =?utf-8?B?R2xkSGRGY09EVW1CWmlaUXJWR0J3N1FhVEk2bVVlU3Z3VWRSNzNscndGUWtN?=
 =?utf-8?B?L3g5MU5mMnlOU0NkdWtFeEV4dnhBVThZa1ZqZi9sWGtJMVo0VHZtVFEzeG1F?=
 =?utf-8?B?YlhmYXJwVno0MVo0NnR1ZUhJVlkvNWNKWXdOakdoUkl6RStqT0tSczRwdFpL?=
 =?utf-8?B?djRVR2wxUEVJMWRFbUMxakNQVmV6OTg2c2FsbkM1ODRnYjI3NDY2TkQwWC9V?=
 =?utf-8?B?NzFGZUVpRTBySHhaRnZvOXI4U1kxKzlERDZNZVFkTWNnNG9qN0diNHVIaHli?=
 =?utf-8?B?b0RhS3VvQmZaTTU4QS9QZjc5M3gweXQyMTNuLytIVDZGaHJ5blpxOEdCQndE?=
 =?utf-8?B?UWhORlNyNXFxVVdKNkJ2b3ZyUEFLWFB5Z0dscVlGSmJHY1RxbHl4MWNIODNh?=
 =?utf-8?B?ak5TdGVFVHJ2MWZwSERPOW8xN0tvZng2YjVoVkg3RGM4WStsMi9VMlROWVpv?=
 =?utf-8?B?b2FsQXlzbFd5MTJzTmZhMkV4ekoxTUYwbUwwZ05hZGlDb2RJTHVxV3UxbGtH?=
 =?utf-8?B?Z1Q3Y0M0Zk9KbnVxcENGeHM5L2FYQlMra1ZZbXBRTUg3eUwvSDVRREVRbWw3?=
 =?utf-8?B?ZUJFcncxZmFPaFUzaWpGOUVzQ2c4YlMwMndwMGZxd1dONUoxYkl6VS9RVEp5?=
 =?utf-8?B?YUdaVkIwMkpyZ1hxRXh6dUFDaWxkQjFGNWFxdStTRkFwVFczRHMvdlEyN0Ra?=
 =?utf-8?Q?RuGA=3D?=
Content-ID: <BA6AD7EF9399FD40AF47A7C946AF9272@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e49453-7b0c-4460-12f5-08dd652db37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 08:28:31.5279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XC3NqV8k0Pv+eojb8ID6XbzlMgq06UQaCHndQtr8XMLK/bb2Ans8phvyCR3kO9sEMYFcMauR5Q3FvnrL4ldvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5920
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 3/17/2025 3:12 PM, Chao Yu 写道: > On 3/13/25 10:25,
    Chunhai Guo wrote: >> 在 1/20/2025 8:25 PM, Chao Yu 写道: >>> On 1/9/25
    20:27, Chunhai Guo wrote: >>>> During a checkpoint, the current ac [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.117.89 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.117.89 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.117.89 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tu64N-0003Bv-Ba
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard for active
 segments
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDMvMTcvMjAyNSAzOjEyIFBNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMy8xMy8yNSAxMDoy
NSwgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+PiDlnKggMS8yMC8yMDI1IDg6MjUgUE0sIENoYW8gWXUg
5YaZ6YGTOg0KPj4+IE9uIDEvOS8yNSAyMDoyNywgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+Pj4+IER1
cmluZyBhIGNoZWNrcG9pbnQsIHRoZSBjdXJyZW50IGFjdGl2ZSBzZWdtZW50IFggbWF5IG5vdCBi
ZSBoYW5kbGVkDQo+Pj4+IHByb3Blcmx5LiBUaGlzIG9jY3VycyB3aGVuIHNlZ21lbnQgWCBoYXMg
MCB2YWxpZCBibG9ja3MgYW5kIGEgbm9uLXplcm8NCj4+PiBIb3cgZG9lcyB0aGlzIGhhcHBlbj8g
QWxsb2NhdG9yIHNlbGVjdHMgYSBkaXJ0eSBzZWdtZW50IHcvIFNTUj8gYW5kIHRoZQ0KPj4+IGxl
ZnQgdmFsaWQgZGF0YSBibG9ja3Mgd2VyZSBkZWxldGVkIGxhdGVyIGJlZm9yZSBmb2xsb3dpbmcg
Y2hlY2twb2ludD8NCj4+Pg0KPj4+IElmIHNvLCBwZW5kaW5nIGRpc2NhcmQgY291bnQgaW4gdGhh
dCBzZWdtZW50IHNob3VsZCBiZSBpbiByYW5nZSBvZiAoMCwgNTEyKT8NCj4+DQo+PiBUaGlzIGlz
c3VlIGlzIGZvdW5kIHdpdGggTEZTIHJhdGhlciB0aGFuIFNTUi4gSGVyZSdzIHdoYXQgaGFwcGVu
czogc29tZQ0KPj4gZGF0YSBibG9ja3MgYXJlIGFsbG9jYXRlZCBmb3IgYSBmaWxlIGluIHRoZSBj
dXJyZW50IGFjdGl2ZSBzZWdtZW50LCBhbmQNCj4+IHRoZW4gdGhlIGZpbGUgaXMgZGVsZXRlZCwg
cmVzdWx0aW5nIGluIGFsbCB2YWxpZCBkYXRhIGJsb2NrcyBpbiB0aGUNCj4+IGN1cnJlbnQgYWN0
aXZlIHNlZ21lbnQgYmVpbmcgZGVsZXRlZCBiZWZvcmUgdGhlIGZvbGxvd2luZyBjaGVja3BvaW50
Lg0KPj4gVGhpcyBpc3N1ZSBpcyBlYXN5IHRvIHJlcHJvZHVjZSB3aXRoIHRoZSBmb2xsb3dpbmcg
b3BlcmF0aW9uczoNCj4+DQo+Pg0KPj4gIyBta2ZzLmYyZnMgLWYgL2Rldi9udm1lMm4xDQo+PiAj
IG1vdW50IC10IGYyZnMgL2Rldi9udm1lMm4xIC92dG1wL21udC9mMmZzDQo+PiAjIGRkIGlmPS9k
ZXYvbnZtZTBuMSBvZj0vdnRtcC9tbnQvZjJmcy8xLmJpbiBicz00ayBjb3VudD0yNTYNCj4+ICMg
c3luYw0KPj4gIyBybSAvdnRtcC9tbnQvZjJmcy8xLmJpbg0KPj4gIyB1bW91bnQgL3Z0bXAvbW50
L2YyZnMNCj4+ICMgZHVtcC5mMmZzIC9kZXYvbnZtZTJuMSB8IGdyZXAgImNoZWNrcG9pbnQgc3Rh
dGUiDQo+PiBJbmZvOiBjaGVja3BvaW50IHN0YXRlID0gNDUgOiAgY3JjIGNvbXBhY3RlZF9zdW1t
YXJ5IHVubW91bnQgLS0tLQ0KPj4gJ3RyaW1tZWQnIGZsYWcgaXMgbWlzc2luZw0KPj4NCj4+IFRo
ZSBwZW5kaW5nIGRpc2NhcmQgY291bnQgaW4gdGhhdCBzZWdtZW50IGluZGVlZCBmYWxscyB3aXRo
aW4gdGhlIHJhbmdlDQo+PiBvZiAoMCwgNTEyKS4NCj4gUGxlYXNlIGFkZCB0aGlzIHRlc3RjYXNl
IGludG8gY29tbWl0IG1lc3NhZ2UsIG90aGVyd2lzZSBpdCBsb29rcw0KPiBnb29kIHRvIG1lLCBm
ZWVsIGZyZWUgdG8gYWRkOg0KDQoNCk9LLiBJIHdpbGwgc2VuZCB0aGUgdjMgcGF0Y2ggbGF0ZXIu
DQoNClRoYW5rcywNCg0KDQo+DQo+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+DQo+DQo+IFRoYW5rcywNCj4NCj4+IFRoYW5rcywNCj4+PiBUaGFua3MsDQo+Pj4NCj4+Pj4g
bnVtYmVyIG9mIGRpc2NhcmQgYmxvY2tzLCBmb3IgdGhlIGZvbGxvd2luZyByZWFzb25zOg0KPj4+
Pg0KPj4+PiBsb2NhdGVfZGlydHlfc2VnbWVudCgpIGRvZXMgbm90IG1hcmsgYW55IGFjdGl2ZSBz
ZWdtZW50IGFzIGEgcHJlZnJlZQ0KPj4+PiBzZWdtZW50LiBBcyBhIHJlc3VsdCwgc2VnbWVudCBY
IGlzIG5vdCBpbmNsdWRlZCBpbiBkaXJ0eV9zZWdtYXBbUFJFXSwgYW5kDQo+Pj4+IGYyZnNfY2xl
YXJfcHJlZnJlZV9zZWdtZW50cygpIHNraXBzIGl0IHdoZW4gaGFuZGxpbmcgcHJlZnJlZSBzZWdt
ZW50cy4NCj4+Pj4NCj4+Pj4gYWRkX2Rpc2NhcmRfYWRkcnMoKSBza2lwcyBhbnkgc2VnbWVudCB3
aXRoIDAgdmFsaWQgYmxvY2tzLCBzbyBzZWdtZW50IFggaXMNCj4+Pj4gYWxzbyBza2lwcGVkLg0K
Pj4+Pg0KPj4+PiBDb25zZXF1ZW50bHksIG5vIGBzdHJ1Y3QgZGlzY2FyZF9jbWRgIGlzIGFjdHVh
bGx5IGNyZWF0ZWQgZm9yIHNlZ21lbnQgWC4NCj4+Pj4gSG93ZXZlciwgdGhlIGNrcHRfdmFsaWRf
bWFwIGFuZCBjdXJfdmFsaWRfbWFwIG9mIHNlZ21lbnQgWCBhcmUgc3luY2VkIGJ5DQo+Pj4+IHNl
Z19pbmZvX3RvX3Jhd19zaXQoKSBkdXJpbmcgdGhlIGN1cnJlbnQgY2hlY2twb2ludCBwcm9jZXNz
LiBBcyBhIHJlc3VsdCwNCj4+Pj4gaXQgY2Fubm90IGZpbmQgdGhlIG1pc3NpbmcgZGlzY2FyZCBi
aXRzIGV2ZW4gaW4gc3Vic2VxdWVudCBjaGVja3BvaW50cy4NCj4+Pj4gQ29uc2VxdWVudGx5LCB0
aGUgdmFsdWUgb2Ygc2JpLT5kaXNjYXJkX2Jsa3MgcmVtYWlucyBub24temVyby4gVGh1cywgd2hl
bg0KPj4+PiBmMmZzIGlzIHVtb3VudGVkLCBDUF9UUklNTUVEX0ZMQUcgd2lsbCBub3QgYmUgc2V0
IGR1ZSB0byB0aGUgbm9uLXplcm8NCj4+Pj4gc2JpLT5kaXNjYXJkX2Jsa3MuDQo+Pj4+DQo+Pj4+
IFJlbGV2YW50IGNvZGUgcHJvY2VzczoNCj4+Pj4NCj4+Pj4gZjJmc193cml0ZV9jaGVja3BvaW50
KCkNCj4+Pj4gICAgICAgIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoKQ0KPj4+PiAgICAgICAgICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc2VzLCB0bXAsIGhlYWQsIHNldF9saXN0KSB7DQo+
Pj4+ICAgICAgICAgICAgICAgICBmb3JfZWFjaF9zZXRfYml0X2Zyb20oc2Vnbm8sIGJpdG1hcCwg
ZW5kKSB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgLi4uDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIGZhbHNlKTsgLy8gc2tpcCBzZWdtZW50
IFggZHVlIHRvIGl0cyAwIHZhbGlkIGJsb2Nrcw0KPj4+PiAgICAgICAgICAgICAgICAgICAgIC4u
Lg0KPj4+PiAgICAgICAgICAgICAgICAgICAgIHNlZ19pbmZvX3RvX3Jhd19zaXQoKTsgLy8gc3lu
YyBja3B0X3ZhbGlkX21hcCB3aXRoIGN1cl92YWxpZF9tYXAgZm9yIHNlZ21lbnQgWA0KPj4+PiAg
ICAgICAgICAgICAgICAgICAgIC4uLg0KPj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+PiAgICAg
ICAgICAgICB9DQo+Pj4+ICAgICAgICBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHMoKTsgLy8g
c2VnbWVudCBYIGlzIG5vdCBpbmNsdWRlZCBpbiBkaXJ0eV9zZWdtYXBbUFJFXSBhbmQgaXMgc2tp
cHBlZA0KPj4+Pg0KPj4+PiBTaW5jZSBhZGRfZGlzY2FyZF9hZGRycygpIGNhbiBoYW5kbGUgYWN0
aXZlIHNlZ21lbnRzIHdpdGggbm9uLXplcm8gdmFsaWQNCj4+Pj4gYmxvY2tzLCBpdCBpcyByZWFz
b25hYmxlIHRvIGZpeCB0aGlzIGlzc3VlIGJ5IGFsbG93aW5nIGl0IHRvIGFsc28gaGFuZGxlDQo+
Pj4+IGFjdGl2ZSBzZWdtZW50cyB3aXRoIDAgdmFsaWQgYmxvY2tzLg0KPj4+Pg0KPj4+PiBGaXhl
czogYjI5NTU1NTA1ZDgxICgiZjJmczogYWRkIGtleSBmdW5jdGlvbnMgZm9yIHNtYWxsIGRpc2Nh
cmRzIikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2by5j
b20+DQo+Pj4+IC0tLQ0KPj4+PiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJm
cy1kZXZlbC8yMDI0MTIwMzA2NTEwOC4yNzYzNDM2LTEtZ3VvY2h1bmhhaUB2aXZvLmNvbS8NCj4+
Pj4gdjEtPnYyOg0KPj4+PiAgICAgLSBNb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2Ug
aXQgZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQo+Pj4+ICAgICAtIEFkZCBmaXhlcyB0byB0aGUgY29t
bWl0Lg0KPj4+PiAtLS0NCj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgNCArKystDQo+Pj4+
ICAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5j
DQo+Pj4+IGluZGV4IDg2ZTU0N2YwMDhmOS4uMTNlZTczYTNjNDgxIDEwMDY0NA0KPj4+PiAtLS0g
YS9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+PiBA
QCAtMjA5MCw3ICsyMDkwLDkgQEAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLA0KPj4+PiAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4NCj4+Pj4gICAgICAgaWYgKCFmb3JjZSkgew0KPj4+
PiAtICAgICAgICAgICAgaWYgKCFmMmZzX3JlYWx0aW1lX2Rpc2NhcmRfZW5hYmxlKHNiaSkgfHwg
IXNlLT52YWxpZF9ibG9ja3MgfHwNCj4+Pj4gKyAgICAgICAgICAgIGlmICghZjJmc19yZWFsdGlt
ZV9kaXNjYXJkX2VuYWJsZShzYmkpIHx8DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICghc2Ut
PnZhbGlkX2Jsb2NrcyAmJg0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICFJU19D
VVJTRUcoc2JpLCBjcGMtPnRyaW1fc3RhcnQpKSB8fA0KPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgU01fSShzYmkpLT5kY2NfaW5mby0+bnJfZGlzY2FyZHMgPj0NCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU01fSShzYmkpLT5kY2NfaW5mby0+bWF4X2Rpc2NhcmRzKQ0KPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4NCg0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
