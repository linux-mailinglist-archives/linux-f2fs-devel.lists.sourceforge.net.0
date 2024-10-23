Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC419AC07D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 09:41:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3VzC-0007an-3s;
	Wed, 23 Oct 2024 07:40:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t3VzA-0007ae-Vb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 07:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=28w7dZ7YlzA48TWcVkd+iQE1atax5dCy+vTvZmjwrDo=; b=hooL0A1Of3bGQSJ9gTy4OokNPW
 TqbSHVLa5zlpDTsB54PinbZM6fGBZIh76yqpPOW2FvsFWsENZ87RE2WyrzC7M69mcfAnjxe4H2QKp
 cFDIF10ej/e8Jbxrn9kFkSQfatyTgfpjdjib1F002A/iNI5cmxk+rnE5NMay6F9sd/YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=28w7dZ7YlzA48TWcVkd+iQE1atax5dCy+vTvZmjwrDo=; b=amwU+VhbEW/DeqfmrxeJM9o0Mw
 /V8rW9eki69vAaep0ydE1U5PwZ1pnE9Fabeu1AaIAiPiyvtKdcHODbmQv1JP4ALbX/g/Kh1733Mxc
 +T5okq3DkLJiXKRTxyK/km8w7/H43I9g1t4xYae21pXQNXTy61mqAOxdE+Shtv0oOUIc=;
Received: from mail-eastasiaazon11011036.outbound.protection.outlook.com
 ([52.101.129.36] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3Vz9-000817-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 07:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMEphhIK189OEG8EyMFeohxdnlGrgKrDILqEKb4b4ur/H/CJjLd5nExSq4HsD5DgT1LKZcMYkG+Ak5WA97zeEM9gN2+HXJEBiTbl5l5y3oSGidXu1fambh7VEx539fE7aNz/2HNdrNOPNeHQenSo93ARzYdkVNhD/Myitx76fXbKX6QsjP5nMIGsUYYuQ/dwFptIi1weL7Q86/4irXjRgdxPiwZosAMfDlkLMfMjKtbyRw+LuSnUXnCe/7tmBKyrEIjyEfXyNel/bdnDBgKwuh2VFRURCIxsEc/RG2gP3TK7SK9pSZuk8buUMnx1LykBQAZa5MyIrdfzoOiqWIm1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28w7dZ7YlzA48TWcVkd+iQE1atax5dCy+vTvZmjwrDo=;
 b=dRvBrHN3vvi7IfBS9Thb9RnEmue60bHX78c0B+tJUGLrdQKtroBSjtxBKktfFrdVQhqb86HKzneBt/N6LzMiM6LE5bGeoHK4tKKw37O26vH46Zhf1UCvZkLmPOiZSz5LWRt82Q6/BtLaf3qhvLkLGAFCxdeBxcOuBu9U4PAIu4zVSzNx/5DYJ/5lDZ/wQaUqw4kBcXbSAO6cmgQvWwq5i5lL0Y6xROD7Bm7KoNFxUvDOcyKwQm99HVYBVSXzs0iHH4tSFiC75OPbiTh9EYXlgOQ78Co3MoKtaJH7swr2N21FII12cwqM8FZNrr3herYQ4JgTPDNcK9Uhvmm8PYt44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28w7dZ7YlzA48TWcVkd+iQE1atax5dCy+vTvZmjwrDo=;
 b=cLTuNL+3uvm+vrRcEx68dhglaPXMds7HWJ6/UEOPCHBL7ctCWc3zzlF7gQnIZkPDl4vtSAAZJFfsESXzBT/yJ2/Qez8fv2pE+cgW0d5O1Sgq+ks09o7yv8X1lFFldAA4mlTS75J1tFi/JWvGiH1xfXH8J4BbcS4q+5qZM2sFKa438UCKoMOXWPQ2axZMygCvukBFO0MGaTjcCqIM0Te1Davk2jOSY1v01CvTWp3bRXCpAXCYErxiFM3swk+4HbeAIBnCXTlNLpXwgoIDmPIhFFPlMWSCdOiUhMdl5a5TbqNQXlRsmqf88jYSjwGI4n887/QLq5Jedozkos2yRkL5HA==
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TYZPR06MB6143.apcprd06.prod.outlook.com (2603:1096:400:340::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Wed, 23 Oct
 2024 07:40:44 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 07:40:43 +0000
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [PATCH v3] f2fs: modify f2fs_is_checkpoint_ready logic to allow
 more data to be written with the CP disable
Thread-Index: AQHbJPVYFuddN7YKoUe4+0WOEGD1a7KT88+A
Date: Wed, 23 Oct 2024 07:40:43 +0000
Message-ID: <9825b1c1-9d24-48d1-a807-d1e6e25c4157@vivo.com>
References: <20241023025945.1817457-1-hanqi@vivo.com>
In-Reply-To: <20241023025945.1817457-1-hanqi@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7140:EE_|TYZPR06MB6143:EE_
x-ms-office365-filtering-correlation-id: 1ce17f44-f4ac-4c41-544f-08dcf3360046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MXgySmN5K1BUOXpGMzdJU2lsRE9pRVExVU44dGZHZ0M4WXJKTUFlNzFWM1RJ?=
 =?utf-8?B?QVhOOHkvckFrcGVrMWlKUDc3aEY2SkZ2V2Z4NFcwcjJBeVdjR2JpMExSV1Np?=
 =?utf-8?B?MjVNWGU4b1B0dnlVNGtXc09qUDdhV1RoZEVOcDNPU2RFZktOYyt2TzFLR2Jl?=
 =?utf-8?B?bVZkUVhneFFqNzlQcnlQN0dkNTc1d3BjeFl2N2Z3VmtiaDVYdWhpYTVwNjJC?=
 =?utf-8?B?c2M0bEpRTTErSTVZcFNYN2gyV1BvUDlTVjBtRmN4Q2pVUnRMSldhbG4xZ2p0?=
 =?utf-8?B?enFLU0dkSXdSaFZ1VXpUR2RnSmdPUTcrazB4Q1lZbkdtcWhiQ3RYMTBHWmlM?=
 =?utf-8?B?MWdCV3htc2xmNWM1RTJDVS84S0N4V0pBVy92VlMwNDBPK1dNTWZxMWRJTG82?=
 =?utf-8?B?c25MdC93Wk5vUHBwQzdWSDFIaEoyZ1FSTkFjdEg1SU5VTUpDNDJYTkVkZmRk?=
 =?utf-8?B?bjJEdFhPSUNqMU9Pa0Q4OFpDc1pXenVhaVMvek85RGl0V1BRQ1VpVHJDVUpu?=
 =?utf-8?B?UC9wUkhuaWhyZ0dXY0ZOaS85bjRLYTNFTnRBVnpva3BSOW92b1hBWjN3T21q?=
 =?utf-8?B?MyswR2wzSzZPekNlYVBUYWJac2pOQjVGbFNDYUhZSWdzRk9ZcUZmYXhQeWJG?=
 =?utf-8?B?dTZHZFRLRHJUU0F6ckpJd0NhNzBUWTZvdnRTMCtISGtHOHJpdXdCZlEzS3ZO?=
 =?utf-8?B?ekNlUDVrcVl4WUFWZG1kd2ZGWXBoeVJFRUVLYUwrSXFvYXE1U2VOeTRPSXRC?=
 =?utf-8?B?UERnNFloanFTV0Zud2xwYVpoWTRWZjZEZWF3c2o0VnpMSkdNSkMvcTUwdjZL?=
 =?utf-8?B?M2ZOMlpOT0lTQ2RMYVhmOGZrLzErWVdOZGVSM1dJQmlqZHNFN2ZzcktDOE1Y?=
 =?utf-8?B?UEk2NEo4emNTWllVMjUzbUhOTnVldVBORkZpMzFEMFR4ajJkSFYvbmdTRUlz?=
 =?utf-8?B?YVlpQk1pcS94cU5VUVljZnBWYWZ0Wkp2ZUljbTI5K1hIYjFMSlowTFBFRUov?=
 =?utf-8?B?eDlDQ1ZRN3NxanNMdVIvaUovcmU4aE1ScEJHeDdoT0pUQTJnUzR1dUJ6Vkl1?=
 =?utf-8?B?U1BKcnloejZ6R3YvcFJ2KzB3UWdDTklzZ01ZWEFjcUVLOWIzdkRWN091RmtO?=
 =?utf-8?B?TjNDNXJKclV2bHRwQktOcUpDM0JPWUlLenNTUVVOTDlYd0tvU3RrckZLSC8y?=
 =?utf-8?B?SkV2MTJvbHBDdHR4cHNOSkgxSjJhdnZ2NjFWZ3RiMjVhT05JZnBwS1BZWWR1?=
 =?utf-8?B?MmJpaDgxdFVsVkI3SlBFNXdHMExlemlKczlxNlNaSVpPQ3ZVTGFuYkV3UkRt?=
 =?utf-8?B?dkM5TXFTS2ZsNkhIUEc5anI5bXEwVnBVVXNOc0lYMlJBZktPUVJZZWJhcDg1?=
 =?utf-8?B?T3FWTjE2K09adGNKNk4wM29leUdaeFRBcWtoR1kyNEZCTkZDTHpMNWFkb050?=
 =?utf-8?B?T1VEY0lweW5vRG1LSENDYnBpSXIrRkQvWENHamJwbVMxdmxjL01tbjh6ejBw?=
 =?utf-8?B?NFlkNk1TRG85R1czWVZYaDdaa1k5cWtDd2ZIalZCUU9ZdVhvNUZqc1lNWWtr?=
 =?utf-8?B?TGd6U0Z0VjFKRVpHcmpOSk1UT3poZ1Q1dHgvbCttMkRQaGQ3TUxKSEIwbFRt?=
 =?utf-8?B?anVUWGY5UklYNVB1UnFwNk80ZjVIRmROVWFVNFBpWlE1SXN0bnlMV0FheXht?=
 =?utf-8?B?R3FUNjlZcWJSMVV0YUNYMk5SVXl1U3BRYnNEMldxWTVvTkwzZVZZc2VCOEZr?=
 =?utf-8?B?dzI2R0FrMURrb2ZSYUZPeGtjSzRPeUZ2Um5pSUVQZjV6eXRiRzY3dWVWQU9j?=
 =?utf-8?Q?Sp4fxEKfXveglG40pR2nTbd8L0NZJH2iK2n88=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0JBTGsxWGVZdC9NQzgwS1Q3cEE5OXhlaVFZMXJ2VUdHc0ZWNEJmL1N3SFNP?=
 =?utf-8?B?c01UVnJGamlZTlRud2ZKSzB0UEJaSXBIejQ5aUZxb2plK2x5VjNBNnhIM1pz?=
 =?utf-8?B?aVdPNENVSGhsTTg1MDRUbEk3MzlaLzh0dHB5RWJnV3J0SzZtV1ZnZ3ZJM205?=
 =?utf-8?B?ZVZXYmdqYk8wUlpOM2tOVG9qOUpzb2RwOE5tL1UyU0ZMQ0huWElpVkYvRkJw?=
 =?utf-8?B?V0xpc09kaktQa3pkeVIvMVNVeFhnNDVCWjgzOERIci9IaWRMaWJGbnVySHhD?=
 =?utf-8?B?S1BTV0g4bEJwcGZXVkE4aHY0aVZsUjBkR3NNYUhyUTl3bW8xS0lZc3lqUXh6?=
 =?utf-8?B?SjZoMTB2WGwvQTI0eHE0QmpBWGZwTWVCT0FRWmEzdUh4ZVh2Tis3Z0JCemRS?=
 =?utf-8?B?WTFkQ1Y2R0hnbGdBSElWNDVZSHFiSkJ2UnVTNzlXdUwreEM0dGZzOEIxZmpu?=
 =?utf-8?B?WEt3YlQ3R29sS0FDY3hkNHc0Qk1CZmxLTkE2QTF3bFpndDZpaTNjTVU3VXJw?=
 =?utf-8?B?TmNuQ0FJQTVEcWlYTGk1NFNtd210dk9pSlJNbnhXNHBQOXVvKzhuYUdwenBv?=
 =?utf-8?B?TFBURm93c2hwS2RjOHc3eG54UVhRcnYvRm1RT0YvWGowQ1FUeWp4L1ViZXdw?=
 =?utf-8?B?QWRzWlNRdGlDSVM3czRNTkp3ZlpnNi9DMWh2bGRKLytrQitKZkYwaGtOZG92?=
 =?utf-8?B?NjZwaCt0WWFqT0pCRm10amI3dEdLMmxhQUZSTklwN29Eb2FWS0Z1eTFzdm11?=
 =?utf-8?B?MmY1TXJhaUlhQUlHWnZBTFNyYU5qRzVqT255WFc1ZGE0aTdNak9Dc0lQYmUw?=
 =?utf-8?B?WkNnTGhuejJobE1HdDE1M1hqOGdkTEhaK2pLMWUvNnNQYzRURmZMN2VVTUFo?=
 =?utf-8?B?ZktOakFXZ0hjL2p6akJUaFdhNU5WZkJ2OHhjaktCM0N1c00wVmFLcmVKbklu?=
 =?utf-8?B?VVZlYWZwUEUyUDlyMW03QjB4cDBBNzBoeHphRVZrbDY3VEFhcXgyM0o5UVdE?=
 =?utf-8?B?clhkWlpIUFRtbTlycW9yQWx4aTF4WmpZZHlZSFkzZG82S2R6Q3dYWGdDaG5O?=
 =?utf-8?B?QjQ3bGVCOWd6Tlg3cFY2cVRlMVhHMmJVeldaTXYrUThjeGpKNGVTU2JCU1VV?=
 =?utf-8?B?VUJHK2MwWHJWUmpFVXhCbkpxc3JkRG91cjFzdkdkQmxNT3djclQ0L0k2Vmtm?=
 =?utf-8?B?Zy91eDd3d0ZhNitESkx3ZTNSZUVhZFd1aUlrRytoU1FZUUpJQVRkcnc3SE5I?=
 =?utf-8?B?MFJGNCs1cEpsR3VCdlIzK1pNb2FNN1oxSnlTL2RPQ3ZiZWhXRVJ6UStXQ0Uv?=
 =?utf-8?B?K0IzOW9jQzBwcUgwclFDc1RUTXBiTWRjRlozUWk0SUVzZnhCemNiMmt1UlA4?=
 =?utf-8?B?c2dkbHpwUWxWV3FrbUo4N29mS2V6SFk1Y3paRXNrMFUxNjRhcTlqQVVwa2lz?=
 =?utf-8?B?TGhlR3FTVTBuN3ZBdENIWFAyWDJsMTFQZE1xNWI4aUtMMTJRK0hIY21nb2lZ?=
 =?utf-8?B?c0NBcThMaFN6QjNVL3hQaHNHTFgwVWR0TjRFb00xUEFKUCtoTDlwYTg1dGRB?=
 =?utf-8?B?ajdSTWxZbnBqazFVdkU4M0Z5ZHNHSzJjbGRsTFFXVE1MOC9VQlhMd1R2QkRX?=
 =?utf-8?B?dUFZVWRiWmUyM3J3N1FvL1N4RDBqVGFNOS91Unh4Q3BzS01YcE5TS29sZGU2?=
 =?utf-8?B?ZHdyU050c2hLUVdwcmRGSFhCOVN5QVpwSnl1Qk1xanFuVVdlNW9jK2N4Sy94?=
 =?utf-8?B?dTlhZk1xTkR0VFF2VndSd0l4NENKWkZuWVNkVlJLM2FwK0xKTCt1MjBFZ05r?=
 =?utf-8?B?UHljbFFNb2JkUWdWcjlWUUlCODA3YW11QWlQQXRnVlk0STNNOEdpTmhWSW91?=
 =?utf-8?B?QWRvaXMxRXdHNzhaWGRMRjU1Z1UrcHRmTm5qbGJyb3Y3R29HUE9XQnAyVzBX?=
 =?utf-8?B?UXBsbkNtbXpPNWpmRXRqWFlVU2xBYkQvVm12R0UxVFIwcitFZmYwOHVSWmJE?=
 =?utf-8?B?cG9acDdLMGNRcldkOXVFV25Lc3ZNbzJhNE1NTnNXdUNURS9RV2tJR2xPSWRU?=
 =?utf-8?B?eUovZ2xUbXh5Zk83Mnk3TkhFNHg0a3Q3ZkJqQTNqZDlHS1lCQ0dGQUdUd1Fh?=
 =?utf-8?Q?A/Qs=3D?=
Content-ID: <06264ADC00821244B72AEC38F53DAADD@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce17f44-f4ac-4c41-544f-08dcf3360046
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 07:40:43.7669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUhIrvtkIa5Q4ndQaibb2JRazpxmC9RGD5gXU/dltYtowaYHIAYXCcsqYOmdkz2DO69upaykAjivKgEuwdU3HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6143
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/10/23 10:59, Qi Han 写道: > When the free segment
    is used up during CP disable, many write or > ioctl operations will get ENOSPC
    error codes, even if there are > still many blocks available [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t3Vz9-000817-TJ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: modify f2fs_is_checkpoint_ready
 logic to allow more data to be written with the CP disable
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
From: =?utf-8?B?6Z+p5qOL?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6Z+p5qOL?= <hanqi@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDIwMjQvMTAvMjMgMTA6NTksIFFpIEhhbiDlhpnpgZM6DQo+IFdoZW4gdGhlIGZyZWUgc2Vn
bWVudCBpcyB1c2VkIHVwIGR1cmluZyBDUCBkaXNhYmxlLCBtYW55IHdyaXRlIG9yDQo+IGlvY3Rs
IG9wZXJhdGlvbnMgd2lsbCBnZXQgRU5PU1BDIGVycm9yIGNvZGVzLCBldmVuIGlmIHRoZXJlIGFy
ZQ0KPiBzdGlsbCBtYW55IGJsb2NrcyBhdmFpbGFibGUuIFdlIGNhbiByZXByb2R1Y2UgaXQgaW4g
dGhlIGZvbGxvd2luZw0KPiBzdGVwczoNCj4NCj4gZGQgaWY9L2Rldi96ZXJvIG9mPWYyZnMuaW1n
IGJzPTFNIGNvdW50PTY1DQo+IG1rZnMuZjJmcyAtZiBmMmZzLmltZw0KPiBtb3VudCBmMmZzLmlt
ZyBmMmZzX2RpciAtbyBjaGVja3BvaW50PWRpc2FibGU6MTAlDQo+IGNkIGYyZnNfZGlyDQo+IGk9
MSA7IHdoaWxlIFtbICRpIC1sdCA1MCBdXSA7IGRvIChmaWxlX25hbWU9Li8yTV9maWxlJGkgOyBk
ZCBcDQo+IGlmPS9kZXYvcmFuZG9tIG9mPSRmaWxlX25hbWUgYnM9MU0gY291bnQ9Mik7IGk9JCgo
aSsxKSk7IGRvbmUNCj4gc3luYw0KPiBpPTEgOyB3aGlsZSBbWyAkaSAtbHQgNTAgXV0gOyBkbyAo
ZmlsZV9uYW1lPS4vMk1fZmlsZSRpIDsgdHJ1bmNhdGUgXA0KPiAtcyAxSyAkZmlsZV9uYW1lKTsg
aT0kKChpKzEpKTsgZG9uZQ0KPiBzeW5jDQo+IGRkIGlmPS9kZXYvemVybyBvZj0uL2ZpbGUgYnM9
MU0gY291bnQ9MjANCj4NCj4gSW4gZjJmc19uZWVkX1NTUigpIGZ1bmN0aW9uLCBpdCBpcyBhbGxv
d2VkIHRvIHVzZSBTU1IgdG8gYWxsb2NhdGUNCj4gYmxvY2tzIHdoZW4gQ1AgaXMgZGlzYWJsZWQs
IHNvIGluIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeSBmdW5jdGlvbiwNCj4gY2FuIHdlIGp1ZGdl
IHRoZSBudW1iZXIgb2YgaW52YWxpZCBibG9ja3Mgd2hlbiBmcmVlIHNlZ21lbnQgaXMgbm90DQo+
IGVub3VnaCwgYW5kIHJldHVybiBFTk9TUEMgb25seSBpZiB0aGUgbnVtYmVyIG9mIGludmFsaWQg
YmxvY2tzIGlzDQo+IGFsc28gbm90IGVub3VnaD8NCj4NCj4gU2lnbmVkLW9mZi1ieTogUWkgSGFu
IDxoYW5xaUB2aXZvLmNvbT4NCj4gLS0tDQo+ICAgZnMvZjJmcy9zZWdtZW50LmggfCAxNyArKysr
KysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+DQo+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuaCBiL2ZzL2YyZnMvc2VnbWVudC5oDQo+IGlu
ZGV4IDcxYWRiNGE0M2JlYy4uMjBiNTY4ZWFhOTVlIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuaA0KPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuaA0KPiBAQCAtNjM3LDEyICs2MzcsMjkg
QEAgc3RhdGljIGlubGluZSBib29sIGhhc19lbm91Z2hfZnJlZV9zZWNzKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwNCj4gICAJcmV0dXJuICFoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCBm
cmVlZCwgbmVlZGVkKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2Vu
b3VnaF9mcmVlX2Jsa3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQ0KPiArew0KPiArCXVuc2ln
bmVkIGludCB0b3RhbF9mcmVlX2Jsb2NrcyA9IDA7DQo+ICsJdW5zaWduZWQgaW50IGF2YWlsX3Vz
ZXJfYmxvY2tfY291bnQ7DQo+ICsNCj4gKwlzcGluX2xvY2soJnNiaS0+c3RhdF9sb2NrKTsNCj4g
Kw0KPiArCWF2YWlsX3VzZXJfYmxvY2tfY291bnQgPSBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50
KHNiaSwgTlVMTCwgdHJ1ZSk7DQo+ICsJdG90YWxfZnJlZV9ibG9ja3MgPSBhdmFpbF91c2VyX2Js
b2NrX2NvdW50IC0gKHVuc2lnbmVkIGludCl2YWxpZF91c2VyX2Jsb2NrcyhzYmkpOw0KPiArDQo+
ICsJc3Bpbl91bmxvY2soJnNiaS0+c3RhdF9sb2NrKTsNCj4gKw0KPiArCXJldHVybiB0b3RhbF9m
cmVlX2Jsb2NrcyA+IDA7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19p
c19jaGVja3BvaW50X3JlYWR5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkNCj4gICB7DQo+ICAg
CWlmIChsaWtlbHkoIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQ0KPiAg
IAkJcmV0dXJuIHRydWU7DQo+ICAgCWlmIChsaWtlbHkoaGFzX2Vub3VnaF9mcmVlX3NlY3Moc2Jp
LCAwLCAwKSkpDQo+ICAgCQlyZXR1cm4gdHJ1ZTsNCg0KSGksIENoYW8sDQoNCkFmdGVyIFpoaWd1
bydzIHJlbWluZGVyLCBJIGp1c3Qgc2F3IHlvdXIgcHJldmlvdXMgcGF0Y2g6DQpmMmZzOiBmaXgg
dG8gYWNjb3VudCBkaXJ0eSBkYXRhIGluIF9fZ2V0X3NlY3NfcmVxdWlyZWQoKSwNCnRoZSBjdXJy
ZW50IG1vZGlmaWNhdGlvbiBtYXkgc3RpbGwgcmV0dXJuIHRydWUgaWYgdGhlIHNlZ21lbnQNCmlz
IGZvdW5kIHRvIGJlIGluc3VmZmljaWVudCB3aGVuIExGUyBhbmQgQ1AgaXMgY2xvc2VkLCBzaG91
bGQNCkkgYWRkIHRoZSBMRlMgbW9kZSByZXN0cmljdGlvbiBoZXJlPw0KDQpUaGFua3MuDQoNCj4g
KwlpZiAobGlrZWx5KGhhc19lbm91Z2hfZnJlZV9ibGtzKHNiaSkpKQ0KPiArCQlyZXR1cm4gdHJ1
ZTsNCj4gICAJcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gICANCg0KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
