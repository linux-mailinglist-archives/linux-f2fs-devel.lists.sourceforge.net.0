Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 559839FF873
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2025 11:53:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTIp9-0005Kv-SL;
	Thu, 02 Jan 2025 10:53:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tTIp8-0005Km-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Ih/94V6rMTlQCwFqxyUnwPM76qjryi+TkvVEJOwxEs=; b=isaZ5WlK4eTY7c0Ww6heMl9JTc
 iz/ijHjmlnLgZ3Qi25WoIiUl4/cNDdP44cQ1uSqSR5MiJ/dJdDRbwSfyx9zQ1CXEiosYLE6J2yziM
 Lu4sOI4sPNoFtXUSxrP2WzFpcxHyOrFNWzmpnfKojPHKKPvCLUfY3cMr3Ev8fWnB1CUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Ih/94V6rMTlQCwFqxyUnwPM76qjryi+TkvVEJOwxEs=; b=U3DtkzGqVyFQM1odQ9tDx3kLl+
 txvK2CRYIRLKfKWiStj9Mm6nHwdF2Vnxi/iy6BMtzz4q9fiCY6qwafrmiE+mXL9rEfje65VhMngKJ
 UIQe21Kdvwn0HK2S978mmEE5Uqez7eF8vZcCNA5lOfubRLqWJXUciRJtchHNwRzsCZyk=;
Received: from mail-psaapc01on2074.outbound.protection.outlook.com
 ([40.107.255.74] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTIp6-00033y-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:53:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oveYYgHqIckkt3X0aYRkjbGzFMuingIBn/oloKW5GHxHdSHEw7iSOlOCSzCHSVqKHBd/9oig0wUVgf+5+EBkx8YN5EU1nb3rmnPJjpYIHRvndBmnRufYHdCJMxOBAYet0SeE3IOkOw/fEv0s4HpK0vLZPxueMER1CLVdXAPkTjsbyztPVBFnTSx2Yw70TFIS9Qej4xJeXSmcw0esy5PqFEE2U/4B2BXPnN1wDZHh4TBI1KxpnFPiW8Sm/zHBAn5bnrt/VXPlRgxpH5EYkMFegpkevdxygqL29+hy1N5HW1pZC3O62SLAWcHVdkr0bvbEqf4k9hlv0XyvwOwaCsrDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ih/94V6rMTlQCwFqxyUnwPM76qjryi+TkvVEJOwxEs=;
 b=m8itWEyzHBIP/iyXjEL9mzkMMEHyc2IuqKrq4ezMpl94OmhJjZGczrDNgTHQYTwfG5XyWzTUCuOmm0e6sfE46h6ekr+3VAT8iVHo+LjUjiAS86hRg3xMj67fSI0xUWT9LsxhYZblHxRg3ecg790pKWDlCTHYangflIhLIvHoEutV8DFDplWm1MnrXMPFy4YG/NvnuUELmwPzL+f0tV7Joc/sTYHngVD84fJL9hyk7IpN/4epSuomxR9RY9+8WPshY8qejX7Fu8Med5ccFFPNBiQ5v2fQGXzxdLMlqSO4HcpNtIMYA7PXn3bL57ef2Z+augjmc6jAk86ueu9qVqW10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ih/94V6rMTlQCwFqxyUnwPM76qjryi+TkvVEJOwxEs=;
 b=EVhk52URdMCFtyv59ZyoBBuq/EFPaISfykSHUH4Unke4UnaKnrYVBEluSpiCu1Gq2ej950L3qhSfJ9Cr89Xd2lVF/p1GKDltS2TKTkV5GODAH8fBGdEXgJT3ySOY8lAfV7/qbkOLPtSaTLU6aqIeQE3FkrHYSpIxPlLK0pRBmgYS6QeRXkGnqrZ2rQ0VM3B4ueVvIs1xMCWqqASpaCoykjqqAOmtBkjyarCsPGGWFQrNpxUDtuCCTH8yPdN9j8pnlSaRZqUMlJBIzG0ph5hj/eZgiJkUeNO+uZLC/lhOcjs+iIEJuN/WHf6SFNOWCxPzcZ92P/lXu1FLTXstTob8ZA==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEZPR06MB6408.apcprd06.prod.outlook.com (2603:1096:101:131::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 10:52:49 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8314.001; Thu, 2 Jan 2025
 10:52:49 +0000
To: Chunhai Guo <guochunhai@vivo.com>, "chao@kernel.org" <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: fix missing discard for active segments
Thread-Index: AQHbRU2QFx/g8qISK0up0N3Ek11L5bMDflEA
Date: Thu, 2 Jan 2025 10:52:49 +0000
Message-ID: <5a898849-999f-403b-8e1a-761033b3f7b5@vivo.com>
References: <20241203065108.2763436-1-guochunhai@vivo.com>
In-Reply-To: <20241203065108.2763436-1-guochunhai@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|SEZPR06MB6408:EE_
x-ms-office365-filtering-correlation-id: 518bc031-db36-4aeb-e96f-08dd2b1b9959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VHpFdFlJcTlrOXB5ck5VUENEdEVDRkowdis4Q2JBVVVvZWxNUVRpRVBxbTJG?=
 =?utf-8?B?Tm9EckJ6b0xSZHlGN2hlV1V0RSt3N3ZNUjdBTDlBQVg0Yzk3eEcweCsxMmlX?=
 =?utf-8?B?RkJJckhzd1B4NnkzYlNaL2w1TXlWRUtjNkppaWZLQ3hXRXlLNWNyMVlhWGlG?=
 =?utf-8?B?N3dBQUNpSzV5YndaWWpydXBidkFXUjNuaDYxZ1JtclFNN0JjR1lOc0hYVEdV?=
 =?utf-8?B?QTBZd01ud0FDRjRoOCtLYjJDZzdMS0JwVUh0ZnBHaWcyZi92cEVBTlhlYjM3?=
 =?utf-8?B?TUFGUTVKbGczd0FQTXFBaWxmV29KRXJHTURWWTY0OEhkYVZ4TjNnZHdMM3JR?=
 =?utf-8?B?M3B5R21SM0JyMFVvU1VZMld5OG4yVmJwMERZaHlWQTlJUElpZ2xTVHdyVUg5?=
 =?utf-8?B?V1BzRjFDQkp1S2NIU1dSaE5LbGU3Z2VGbVNFUGIwL0Z5M3JBS1M0VlFBUnZW?=
 =?utf-8?B?NkN5ZTJ0TUVYNXFEcWNOYVFhT05HWG15SklmSGNxWVhoMFdQR0I2ZVVycjEx?=
 =?utf-8?B?a3VUdEhYbStJV2d0UVdlSWxmSUM4Y3A1NlN3NFpIeit0cGJvREdQQTlISFhn?=
 =?utf-8?B?QnV0ZzV0S2FGTHovNzBtMUZEb1R4aVFrTURCUVlNbHFaL09iZFFWWGlEUWRP?=
 =?utf-8?B?cE9pcWZYZzZPWmRLemNHYWZ4eWRnZlkvSzNQK053b0dUdDhnaXZXdUdzaHRB?=
 =?utf-8?B?NllUZWZRN0tLVGQwU0VoUm1mcjdoZ3BWdmplOXFqN0haQks1QjRVWXB2QTN4?=
 =?utf-8?B?V1V0SU5abFowQVpSRzhsOVpVN05Zb2kvaTJPeVdWNnVITWd2M0EyeUlRUlJH?=
 =?utf-8?B?VnluZmFTUUtDazNVaE5yU2VRcWRodHdQLzlWcmJkcEhSMm54Z1ZDaWhFMFpj?=
 =?utf-8?B?bUZuVXNPRkxENkl4SWtpUXFxcU11bWduU0lFQW1wNk5Ta2xTME9nU3V1alpX?=
 =?utf-8?B?MTY4TGNOZ25XMW1lQ0ordEhLSFJiWGVzS0lXR3VkRlVmTGJFT0pEYjNiZERp?=
 =?utf-8?B?SThzYlN5RFB6UDJ4dG0zOVNYQ3hMNHAxZ1Z2SzB1WlVRdXhzWFVQaUZ3T2R6?=
 =?utf-8?B?c0N3NDJLMnZ5WVVwV3NpNERhQWVWZml3d0lBOEpyZFBnbG5lNC9JckdzSlpa?=
 =?utf-8?B?S24rYTRtNFU3aEJja3ZEdG1NQjdPVmluKzNsRXRLWllNZ0pTdjhYM081MEln?=
 =?utf-8?B?dVpVWFptYlBBMkxDcW5KS0lCR2xxM1FoSTRNdHRhcWMyN3FsdGUydTJGSnJp?=
 =?utf-8?B?NENYaDlpMjhTTDNHbEJhRTBNbEw0RitaSG05Ymswa3RhS2x5RitkaGRwbGdG?=
 =?utf-8?B?elRkbWtLN3ROa0haRitOdHMyRDkyaHgxUEFETVVyY1JvdlRGZU5SQndxNFRW?=
 =?utf-8?B?WE54WnVobDdWcFhhUC9jbGJZL1hTTkdvSjIzaWx4ZE8vaHBDWFNHWnJMU0No?=
 =?utf-8?B?WE9ydnZQTTlDUGphdHVmcUZEd0puN0dPY1VvUUxZU0R5MEFjZHRhMkxCN1R5?=
 =?utf-8?B?eWdobGx1UEZZMS9YbnVJcGJWMjFnaHJ5b3RpeUk2VnhlL0N0N0pVQ1lhUmxL?=
 =?utf-8?B?OWUrUGMyb090TWNLaURiRWQ1ODFGaEJqOHEzMjdRcEZOb2tjRWNHZllENTAr?=
 =?utf-8?B?eFNxUkhyRnlDMjVuakMvTjZFMkowbmZlY2RKOUNGMmlyVGEzU3ppM1VnU1Yz?=
 =?utf-8?B?aTF5QXduQ0dSelc2WGpVUDE5cTkrUWJiYURLUVZ6NEpnOVR1M1F5Q0R6UW16?=
 =?utf-8?B?S1Azd2NPME9rdkFLYmsrK05RS2ZhK1lhWW1tZkFTQ1g4YmpZcFl3WkJ5ODhO?=
 =?utf-8?B?Q2tLczRkK1ZNeXJjK2g0L1ZIbG5ad1VQWDlXQ0tmaTM3bjZRcSsvMktyeVVy?=
 =?utf-8?B?RlNnaGpQN3NTZXNPMEcyNklPaWxMU3JqaWVwUlpjVy9weFpwNFJPaUhYTjVD?=
 =?utf-8?Q?D0yDkbnUrm0fCoIq8uXMivz5ZoDfmFrW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZSOU1pV0t4VVVueTZhRGpUMlRRUHBzK1BQdEcwSUhzRm1KQVNVRnJJNytI?=
 =?utf-8?B?MGt2UTZLMHRFMGgyWGQzQ0gwRm1OcUZCSlBuUWwvL0JWMXRMZ0JycTRodmh4?=
 =?utf-8?B?dDNEN0gwR3hBM294SmhwUEtwQkxSa3ZlRHRjUHUwaWpGaDAzSk8zaEo0Y25u?=
 =?utf-8?B?Z1pnMHBHYy9vVHJycXZKajNKaTd2UjM2MWt6Ym9KT1ViZlhQT0ozQ1RzOElT?=
 =?utf-8?B?cE1zOUo5ZHhHa1VNZG5wZi9JVytSb1BveHIwZFNxVlFRM2REeEg3bVA2SUkw?=
 =?utf-8?B?VXFMWFl4ZDY1Wkxjd3Q5M2l4RG5VQ2FJNWx5ZWxaYlk5blY3WHJHK29RM3JM?=
 =?utf-8?B?UnQ2M1dVVHo1c08rVm5sR1V0RFBSc200cEJoRTlhNjZBM2hUVVJiZnNJKzV3?=
 =?utf-8?B?NWZzU3dORFZkN1VKdDJEb3JmZFNsTDQxUXBYc2JiTjA5b053ZW1mN1dLbTVX?=
 =?utf-8?B?VG81eUdRZzc1dzZzOXhDdUpvL1NkSWdYWmlmM0kwZ0VOYVRBaFU1djYyY0dh?=
 =?utf-8?B?NDNVMlllQXFPT1VOMDRlR1htUXd4V2FwaFQ4SGF2NE5EMDZ4VisyVDVTTitQ?=
 =?utf-8?B?ZWZ0bEtyS0hqZC8wQ2hFaTc0SVppU3NLcTR5dkFuVzlVTjVFdzBQZGNyeWZF?=
 =?utf-8?B?aHhDQno0ay9xVlRVWmg3ZnlMSi9zb1ZvZ3pyVlJtM2M1dERmUk8xU3NJUnVt?=
 =?utf-8?B?eTNwbXR5SWdrMkxYdGM0QURDQWJLdnk3a0RwUm5vK3ZWOWpENWZ5MUoydmZa?=
 =?utf-8?B?R0pXOUc5V0FlaHVwNnRWcmoxeDB0bVVPWVZYZUlLNUVid3Y4aWxid0hudXQy?=
 =?utf-8?B?cTVISk42T2JwdE50UTZRR2MxY09ma1NnS2VySWw0dUtBSlgwS2M0US9nT1N2?=
 =?utf-8?B?alQ1KzNpWlZSMko3WkIwbE9DR1p2djY4LzhIMEJ3UDhmOUNIdnlNc2lpM2dz?=
 =?utf-8?B?VVJwZXRveW9LdXJHM1N0ZjN4a2czcGpPbDIxdlRKSDhmWXZSaDhTV1RxS0ZL?=
 =?utf-8?B?VHo3SXVXWnpTajN2YnlqT1EzTEhaTzkzd01HOWQ0Myt6UU5MZ0RteXhmYTd3?=
 =?utf-8?B?VDdpL2NTRTJmdC81YS9EWVVNSDN1MnBIYnkxZEx0ZGtQTVZsQ0hEenhDaCsr?=
 =?utf-8?B?RHFXcUQwS3ZYOXZoL1Y3c2ZMUlRtV0NPNTlJNEdaQk1JTkhYSmNaNmRUY1px?=
 =?utf-8?B?NC9oUjFuZXRseUEwYXNvZmRLM1VFYWRVN2IycmJ5MVpNZWpZMEJUK3UvOExW?=
 =?utf-8?B?N2V4TXJGbXhIZHU1ZnYyOXExOUs2QVEzYWo2WDRXRHA4SWxyRkZ3RmdvTDNp?=
 =?utf-8?B?Tkg5Z0hxVUcwbVJ6U3VQL210Z2V1aTg0WURBb3VraDlnYjNVeFRneEEvVm1s?=
 =?utf-8?B?V0RPS3RpZGsvbXYxRGhma3NCQWtYeXZOQWw5VEFnNDFNb3BCMjZaSU44QktH?=
 =?utf-8?B?NC80VGE4aW1rTHFCV2QyRGFrVTI2UkxrTmR0d05aMmo1Q2JSM0NsU2tXdDVv?=
 =?utf-8?B?bmc2eGt5N3RVaUZmejk2bTIwMmNYMFVPRTV6aWNJZzkzdXNtdnp5OXh1N0Y5?=
 =?utf-8?B?a2g2SURwUDBUUmVlTkxjZnp2dXRuK2JoT2hGSnMvMnMvUHNWeWNNR2RrbG9m?=
 =?utf-8?B?N0NJUncxOWlVeC9pN2xkZnJ0Y09WeURETENCK3UxMnVVcWxqejJZbzFWbWVY?=
 =?utf-8?B?d0pQSkEzK2ZJS2NRL2I5TkxCQ09sL204YWVzVkY4U2FUOEhkaUpUS1diL0Ew?=
 =?utf-8?B?UVZxN1I1MUFjT3lJQVRZKzgzVzlaaHA1VzFldU5hcGtDTDNCcFpRckZHSzlZ?=
 =?utf-8?B?dkRReE85QTEyeS9Bd3VlYlN0V3E4RktVWnQrdXpkS0x3eWtMcE9BN1l0MVFT?=
 =?utf-8?B?ZnhxS2Y0dHpFYklVVGhVWGpSKzkzQ3JwV01SYnhrbjhWc1dDQ1NzZTZ3NWg1?=
 =?utf-8?B?YWt6aFBicjgvd3lyQzROOWZ5clo4YUdQN1Z2aXljWUlvR29mdmlCRmlsNXA1?=
 =?utf-8?B?WXp2NlBZU01RTU9WRjdKUlNJU3VSdGphTHI2ZEV1ck92cmhWUnd1Mm4vT2dp?=
 =?utf-8?B?eHlVblVLWTM5dG9aU1VjS0o2UzFHbU5JUUtFdHo0NThhQityOEtGYWhRL2hi?=
 =?utf-8?Q?91r8=3D?=
Content-ID: <F770974798DE764590385A28D997739E@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518bc031-db36-4aeb-e96f-08dd2b1b9959
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 10:52:49.2999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HkC6jwAm9N4mUObwaVzOBqtib7ZXPcPQneQ07rTlbH5MvkMkZTUiQ2dOXyF5IlnakpdFmiSGvSgLYVsXkkaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6408
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 12/3/2024 2:51 PM, Chunhai Guo 写道: Dear Chao & Jaegeuk,
    Could you please help review this patch? Currently, this issue is quite easy
    to reproduce in some projects. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.74 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.74 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.255.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.255.74 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tTIp6-00033y-J4
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing discard for active segments
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

5ZyoIDEyLzMvMjAyNCAyOjUxIFBNLCBDaHVuaGFpIEd1byDlhpnpgZM6DQoNCkRlYXIgQ2hhbyAm
IEphZWdldWssDQoNCkNvdWxkIHlvdSBwbGVhc2UgaGVscCByZXZpZXcgdGhpcyBwYXRjaD8gQ3Vy
cmVudGx5LCB0aGlzIGlzc3VlIGlzIHF1aXRlIA0KZWFzeSB0byByZXByb2R1Y2UgaW4gc29tZSBw
cm9qZWN0cy4NCg0KVGhhbmtzLA0KDQo+IGxvY2F0ZV9kaXJ0eV9zZWdtZW50KCkgZG9lcyBub3Qg
c2V0IGFueSBjdXJyZW50IGFjdGl2ZSBzZWdtZW50IGFzIGENCj4gcHJlZnJlZSBzZWdtZW50LiBU
aHVzLCB0aGUgaXNzdWUgZGVzY3JpYmVkIGJlbG93IG1heSBvY2N1cjoNCj4NCj4gU3RlcCAxOiBE
dXJpbmcgYSBjaGVja3BvaW50LCBhZGRfZGlzY2FyZF9hZGRycygpIGRvZXMgbm90IGhhbmRsZSB0
aGUNCj4gY3VycmVudCBhY3RpdmUgJ3NlZ21lbnQgWCcgd2l0aCAwIHZhbGlkIGJsb2NrcyAoYW5k
IG5vbi16ZXJvIGRpc2NhcmQNCj4gYmxvY2tzKS4gQXMgYSByZXN1bHQsIG5vIHN0cnVjdCBkaXNj
YXJkX2NtZCBpcyBjcmVhdGVkIGZvciAnc2VnbWVudCBYJw0KPiBhbmQgdGhlIHZhbHVlIG9mIHNi
aS0+ZGlzY2FyZF9ibGtzIGNhbm5vdCBiZSByZWR1Y2VkIHRvIDAgYWZ0ZXIgdGhlDQo+IGNoZWNr
cG9pbnQuDQo+DQo+IFN0ZXAgMjogZjJmcyBpcyB1bW91bnRlZCB3aXRob3V0IHNldHRpbmcgQ1Bf
VFJJTU1FRF9GTEFHLCBhcw0KPiBzYmktPmRpc2NhcmRfYmxrcyBpcyBub24temVyby4NCj4NCj4g
U2luY2UgYWRkX2Rpc2NhcmRfYWRkcnMoKSBjYW4gaGFuZGxlIGFjdGl2ZSBzZWdtZW50cyB3aXRo
IG5vbi16ZXJvIHZhbGlkDQo+IGJsb2NrcywgaXQgaXMgcmVhc29uYWJsZSB0byBmaXggdGhpcyBp
c3N1ZSBieSBhbHNvIGhhbmRsaW5nIGFjdGl2ZQ0KPiBzZWdtZW50cyB3aXRoIDAgdmFsaWQgYmxv
Y2tzIGluIGFkZF9kaXNjYXJkX2FkZHJzKCkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENodW5oYWkg
R3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPg0KPiAtLS0NCj4gICBmcy9mMmZzL3NlZ21lbnQuYyB8
IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50
LmMNCj4gaW5kZXggZWFkZTM2YzVlZjEzLi40ZmIxZGM0YWFiOTcgMTAwNjQ0DQo+IC0tLSBhL2Zz
L2YyZnMvc2VnbWVudC5jDQo+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+IEBAIC0yMDkwLDcg
KzIwOTAsOSBAQCBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsDQo+ICAgCQlyZXR1cm4gZmFsc2U7DQo+
ICAgDQo+ICAgCWlmICghZm9yY2UpIHsNCj4gLQkJaWYgKCFmMmZzX3JlYWx0aW1lX2Rpc2NhcmRf
ZW5hYmxlKHNiaSkgfHwgIXNlLT52YWxpZF9ibG9ja3MgfHwNCj4gKwkJaWYgKCFmMmZzX3JlYWx0
aW1lX2Rpc2NhcmRfZW5hYmxlKHNiaSkgfHwNCj4gKwkJCSghc2UtPnZhbGlkX2Jsb2NrcyAmJg0K
PiArCQkJCSFJU19DVVJTRUcoc2JpLCBjcGMtPnRyaW1fc3RhcnQpKSB8fA0KPiAgIAkJCVNNX0ko
c2JpKS0+ZGNjX2luZm8tPm5yX2Rpc2NhcmRzID49DQo+ICAgCQkJCVNNX0koc2JpKS0+ZGNjX2lu
Zm8tPm1heF9kaXNjYXJkcykNCj4gICAJCQlyZXR1cm4gZmFsc2U7DQoNCg0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
