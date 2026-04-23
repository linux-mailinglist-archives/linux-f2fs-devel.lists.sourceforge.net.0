Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEsAMicN6mn4sgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 14:14:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8A451D27
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 14:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS4E7uxV19ykrVnWdGoQvbAkrkHGQcMgkYUr+1liobA=; b=fbpYmVkBk8U3AwvQwhQegtz9jq
	GhVr1Imy547mvvzNddG9eMtdU/5p7+UCLk72NPCwzXeomBW5GIoa9+OVyopAevhxsSsPfple3Vg7F
	Y9b7yoUF2KprBAQhLdabiA+n558O+Xz9VDlPeQ96xXGI9yhfA3/L/pogNG8PEF5PEcp4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFswi-0003zS-DF;
	Thu, 23 Apr 2026 12:14:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wFswd-0003zH-RY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 12:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qvUJziKXe46hrXodHw02nFmofqALE1KGXS7isNkhv+I=; b=gMkktZ5ktTqaTPHqVntpsjbN6H
 QsEUjx4NPjdqCoZHzeT9Ngbbi7RrciHyY2TZTwMnR2aiyhwqSxtpQGjalQWG49VFZplmrMePIXlYF
 0/yam8NpAFGHUsWlgxq5N53ACADyqeL/02x2icpmiI17YhZx3fjE9QrkqWfkQPKjQm8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qvUJziKXe46hrXodHw02nFmofqALE1KGXS7isNkhv+I=; b=nEVlwCYeNPHs133mLcBRG4Jsf8
 lp2eCfIVuOmX7/QW8H/QrFasIt4wQePItJwl/TqFnKYFiHyb7zeOyXhuo7eSL1iW/4ty5g/R6fc5S
 T7qwutq1je668fsHgfx8wCnug1wztqJce5Y+Oy/yxMZz/Gleoj2yCoj8gHHXiz5lGNWY=;
Received: from mail-japaneastazon11012007.outbound.protection.outlook.com
 ([52.101.126.7] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFswb-0003PE-1j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 12:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBrp+6YWkPv/RAApl9J3YZM5h4zneEEx7ZWLPuQ24xZOfBeEtmdoL6X5S12nvRDL0vSOZqpIhTBnZLCoLYhnOtX80x7i9P69OasiNw2ue3kHPFqDyLTzQXYGMmre+fnPCN2fHGd+ApzAzyooIThwFxyjUduGlinu7JVviIDOFAcymdI8N1cWMUWGiFK9cK9viNFoflbC8wGkJsszAdLLIwu7kP0UY3+6083HucwlbSGbyOhVVd+RG2JJOCBMe57IrVFT36oQaQk5hIvhcsS2ENDdeFtePA8R++5NtEfWxw3uRwP1YDNVQYGyXlk6j6V0TUNoq4cOPOMK5kP2yfEiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvUJziKXe46hrXodHw02nFmofqALE1KGXS7isNkhv+I=;
 b=CdckE/VZHNsSpCa+kCJd4H+eFATaNIdLi34pMST6+GMFNmT+SeWDoPhbHGCRCGAe/5fW43dWQI48Q1700L4JNhed1a0xlvKzl74WmM6Y0K8Js+JoBJR4STgX3P9kqNQCzWa4asAAxCaU9D2wSiXZbJmXhCcHyMR0GCdsVPmWHXa8LD69zEIyYVbOq3uUjZFc5M8K9In3837L8qooZtL7b/J9OGKtpfy3ZeLF5VlK16YQd3V1DxI3MgTZCTPEVmYcpBA+lmO8TUXZKwRCc1NT2cQrBhcfIE7IMvmAJqkENLs5IGutRuhIqfqfamwzDLC48rzphjjftd07eePhzWz1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvUJziKXe46hrXodHw02nFmofqALE1KGXS7isNkhv+I=;
 b=EW3y9uoXDrg9YOR8p94WFfcwCZ/jZsPTTQJRMwlcILNC1bj8nZSVHBKEt7kay5NZzA4kiKbSj5cIimg/ng9thqaDiQDBfAMLcXRjGWSQcaouBqC1y481w5Wr9jO/lv6IWen0hhwuuctbeAzm4QVqfcOCiLH1a8wXJu3x00TuSPvaVmbB7TnDWmdj9b8yhqD/EJlQXF/C1l15kfmmRL1BrC7f0HVVjToi+S9uybUzWrHiAlqxkJC7OMvVTZ4cZ73kwLlsOxxNMVklYFvE3OnbEGveSDdYedmMOzjTOxpmuZkMEkDMRW3DD6kPZuYNNdRWbybGdUrluuPQc4+Ms7DLjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by PUZPR06MB6053.apcprd06.prod.outlook.com (2603:1096:301:11a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 10:41:35 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::fd5b:d112:ac3:bba4]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::fd5b:d112:ac3:bba4%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 10:41:35 +0000
Message-ID: <05eca173-168a-47df-982f-ccc3e06c0d0c@vivo.com>
Date: Thu, 23 Apr 2026 18:41:30 +0800
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <20260421075717.170840-1-liaoyuanhong@vivo.com>
 <20260422232747.GD2226@sol>
Content-Language: en-US
In-Reply-To: <20260422232747.GD2226@sol>
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|PUZPR06MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0a83d2-2ef4-4af1-8c48-08dea124e393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info: RwaugEp6MNizDbm9vAEHtr1+ymou7zW1R8HecPjr8bVYVN3f3NeNgUSQ4lYOhTs3E/BGtzmiVOqTKgUjLRjlXWzILrr/Va/peae3OeG0plDR6j3TkwdKxww2l0N74Yi/V9SHKSx5F4LDjEE40jGVCX9l6R+Gw4e5SIv2kWWGPQl9NjLOcQRkPIFp6+q7z5+vf5Rh1iR6UhOhf1v25ffyczKCQebUvIXejnKiGprglEjvvJDXTdGzB4uJgpivbHnXFzgUEOWLnx/mzOyLUM71tWr+MUT7ewi7LxoSpCtjjSZU4ppX6TtrXfsUWjs5dAyWCKj2CyJMqvjOgFOH6da+2DFzQrXruUSspFzZVb08/UUUbpmtWMH2XVdyVQzI3MhyxLQox5E9L8zj6ei8NyOKIAgX1ckizG5r66SfSDB/CZv1zdM2lU4SaNjsYpJ+gy02TQmKF8hTXFG/N4ZTcsLIyU8ob+biJKMkxoVIsUHa2NMctNvKtSzWYjFpxBUtCUCwH5l/kaRc2JmyAhvlmAuhhWs7aLGdSLCtpSY93+OzpCsLytdz0SIGqvxju/1nD1j0KS5xQ+w94puwEYyKe9wHHXLWpO494V2Rp7YuEzSbzEGpmM0p6lrSyXV0MT6I4VoZsnWFHWE6vJUlFSYBKqUC/Wtel5qkvznXqrx/oz4kdcNB2B7OoLy3pVA4GAfl7J9/2EAIOOIOqwRJavTH2FO4Tlb9D/MZzvaDt+0prya8Mpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(11006099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1k2aU9lTjc3RHBlVXM5VU9KSWJXVlh5MlFSVzhxRW82TGdDM1ZWN3ZQODV0?=
 =?utf-8?B?ckRXUFFXKytSekFzZW5OVERxc3puWHZoSWJTbExSRFNZeS9hOGRvOHV2MU5F?=
 =?utf-8?B?YlVmTldsclo2VXgyTE1xYkhqbWV0dEFrSmdVRHFaSEdZeHhRNzk1N01NT2ZE?=
 =?utf-8?B?WEdXYjBPcndScFJaUlliVjhKSDBZaXJMSzZ2V3NuRkNIMENxK3V1cFZJZDlC?=
 =?utf-8?B?VFhpK2NtWjRSNzI1RWdZVlBLTUt4WllzNG02Y1hvN3plRldaYW9VbHJvdWJJ?=
 =?utf-8?B?UFovRFkyU1BSMm5lZDVFS2Q4SER0MVMzVTk0dWp2ZGlXbmJ0Q0tLSmFrdVJR?=
 =?utf-8?B?TEpKM3QvOVNIczVoREFQY2tJL29aRGZVK294UCswNHVxS2tGNENBNkFiUzFq?=
 =?utf-8?B?RHRjOFM4TlRoRG9pS2d4RnVNdmFQVlBOZytZdlRFbElEZDBBWmsyaiszMDFr?=
 =?utf-8?B?cDd6Tmt5R3Y4Z0FkTWFlSkM4SEtmMmkwa0ZUUkZGZ3ZHVGo0QjI5eThacHM0?=
 =?utf-8?B?RmtBMkI3WFdnL0treDBSWGhNMm9pVFFlWW1MaVF5ZkM5Nng5dFhvc0lydVZl?=
 =?utf-8?B?OTdDUFlhbjloc3RhV0tHWkJGc1U1djlSY0NjUzF5VTRqYzRHZ3ZnRlA5M0pv?=
 =?utf-8?B?b1VkeFlOUzlIV2Z3ZU5IU3hVT0tTUkJzNFR5M1JGS0ZFcFU1bmhRREJqRHlX?=
 =?utf-8?B?cW5sMCthM1hBUy9BYUR4WDRGVFlQSVMvdU9Eb3BMZnNVWFZXb1VzM2ZSQmpo?=
 =?utf-8?B?TnJDdHFCdGY2VzN6VEgzSS9yOVJPTGVTaUtsdW51bFVWaTY3akErcmtIZnUw?=
 =?utf-8?B?dWZZakU5TTN5UitBYVFLOHp6RGVKbjEyL2REVjZMSkxxRXM3SXRXMHJKR3Fk?=
 =?utf-8?B?K2x2MkdzellYWTJoN3BEK0ZNUms3ZDdrTVZCdE9KZVlseHphS3hGLzIydUtt?=
 =?utf-8?B?MDNoOEFwZnRyc0RseW41MXM0Vm8xZFVIZFRCcFJiZm1hcldEUDVyRXFBWGZV?=
 =?utf-8?B?cnNGVjZoekM0Y3FIRzMwd3BFb3NLWmtZMjlya2VpTDRiWlVzNU5aOWQ2U1ZW?=
 =?utf-8?B?RHJ4QkFiK2E1MVl3anN2b3UrSVJVOHR1NER0cjRZcTJ6YmJ0RTdzQ21RaHJm?=
 =?utf-8?B?dlM0RzhLWlpZZlYreTlCUWIySmxsdXY4THNWbjgya2VSU1VJamFzbmhLNnF5?=
 =?utf-8?B?TTBqMUdET01QQTRZbUpkNDB2WXkyR3U3a2ZjYlVyWmdUL2ZJTUpwa3pIcFFN?=
 =?utf-8?B?N05lVFZsT3J1Vm1XaXRDZk5XOGxhdk1BRXlPdE1PL2tUU1cvTHBmbThQbnlv?=
 =?utf-8?B?OE1kS3BSQ3ZUUkxXZ3NlM3FCK05IZld3RFcwakx5UjhHR3V2VitGMHMySmJC?=
 =?utf-8?B?Z3kvMUh1SmdyVTcyU3F4NS9RTFBSZGxoK2Y3US84alBINzhpQWgvUDBQWGFz?=
 =?utf-8?B?bDBGN3NuT1hjL2Z4Ujd2YWxOMWpZTTFaQ0dQS2pGWExBaGx1L29aR05naUNx?=
 =?utf-8?B?dzUvT1BqM3hoS2krOFU5ZEY1cTJFbTJZQUVldm03aUJOU2dNMHJnQkp0bU9X?=
 =?utf-8?B?RTVrN3U0c0JMbUFNSmZKM0c2TU9Gc0ZMTGZUQk4vQ2RQSWU1aVltWEt0aVg3?=
 =?utf-8?B?RWVpSzk5QytJSXFaVWpCaHdaY2FWZE0yNzZNVlArVStlNG12SEdBQ251S1Ny?=
 =?utf-8?B?dlIwTkF5Y0R0L08xdXBxVXVYNzAxLysvbDVFQ1VwVUxEa0lXSk5JbnpQUFQ5?=
 =?utf-8?B?R1JMeWM0dm82VHZXVllzMHAzalphUUV3UXV3MmE1SitydWVXQlh4b0pySHAw?=
 =?utf-8?B?dmpsa0I5eVVPa2dNbjd1Um1tZXEvZ2lGcUlHTjZSUGJ4Wi8xVnl3YkJhRitN?=
 =?utf-8?B?Um9iV09WTlU5VnVsbEhydFFkYytaN3dsaUMyNzVidzVpc2hhdSt5cmpkWWw3?=
 =?utf-8?B?MVRpUzlrRUxqRHdPT2dTVkh4OURrbnVkTjUrUUFwNHoxWkMvdzNua2pFRjh1?=
 =?utf-8?B?UFVWem1nSklYK1JVT1ZiZE94WWp2dnlPd24vN0tqbTF6YzNkdVZwcFZ1bitj?=
 =?utf-8?B?OTNCc29manI3cFkyWERBRThQR1FEMFBQQlhuQW5YaDZ3MGtMVFI1VDAyOVZj?=
 =?utf-8?B?SEF3Z2wrS1JiZXAyRVBtTWhjR1hWaWFXbEFydEt0bEFDY3JZQ3lCTjl6enR0?=
 =?utf-8?B?bXExTy9FMmJWQjBYZVhHYXQxY3VsVFFnak5Nb2VBV1Y5V2h0NU1PMGo4UWVF?=
 =?utf-8?B?TWRNazJweFV5Q2NhL3l1VHVZMWduNitiQ1g3ZlAzTHQrOHowZFp4ZVIzdWNH?=
 =?utf-8?B?L29uaGVCaVNOWEpUdmpwSThEQXdjSHErQ2dBWk1QVWVwUjRsODRqUT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0a83d2-2ef4-4af1-8c48-08dea124e393
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:41:34.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvHIioZ5eps5iW3gRDE0xU6+dIsgxLgkPJAEWSybx9pv4c7j0oF5wPdd75DuNL5KZphQ+7tMENJgPEpo3eMLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6053
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/23/2026 7:27 AM, Eric Biggers wrote: > I don't have time
 for a super detailed review at the moment, but here > are my initial thoughts:
 > > - This needs to be sent along with the code that actually uses it in
 > ext4 and f2fs. Please also [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.7 listed in wl.mailspike.net]
X-Headers-End: 1wFswb-0003PE-1j
Subject: Re: [f2fs-dev] [PATCH] fscrypt: add software key support for
 filesystem-managed data
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:tytso@mit.edu,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MAILSPIKE_FAIL(0.00)[216.105.38.7:server fail];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,vivo.com:replyto,vivo.com:mid]
X-Rspamd-Queue-Id: 29D8A451D27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/2026 7:27 AM, Eric Biggers wrote:

> I don't have time for a super detailed review at the moment, but here
> are my initial thoughts:
>
> - This needs to be sent along with the code that actually uses it in
>    ext4 and f2fs.  Please also Cc the mailing lists for those
>    filesystems.
>
> - This is going to require an "incompat" filesystem feature flag.  After
>    all, once a filesystem contains files that use this scheme, older
>    kernels won't understand it.
>
> - UBIFS and CephFS already use fs/crypto/ but don't support blk-crypto
>    (inline encryption).  This new code feels duplicative of that.  It
>    should be possible to reuse the existing code instead.  That would
>    include, for example, reusing the existing en/decryption functions and
>    the existing struct ci_enc_key field.  This would keep the changes
>    limited mainly to how the key is being set up.
>
> - Supporting all the different IV generation methods doesn't make sense
>    when a per-file key is always used.
>
> - The fact that this is incompatible with hardware-wrapped keys greatly
>    limits the usefulness of this.  (Note that technically, it could be
>    supported in combination with them anyway.  But the security models
>    would be inconsistent, which I assume is what you have in mind.)
>
> Hope this is helpful,
>
> - Eric

Thanks for the comments. They are very helpful.

I agree that the fscrypt changes should stay much closer to the
existing filesystem-layer encryption code.  I will rework this so
that the fscrypt side is mainly limited to key setup: when
blk-crypto is used for normal file contents, fscrypt can also
prepare the existing software contents crypto state for
filesystem-managed regions that cannot go through bio/blk-crypto.

I will also drop the separate key object / key-selection path, and
try to reuse the existing contents key and software encryption
functions as much as possible.

I agree that supporting all IV generation methods is unnecessary
here.  For the first version, I plan to limit this to the normal v2
per-file-key case.

Regarding hardware-wrapped keys: it may be technically possible to
make this work in some cases, but using a software crypto key for
these regions seems to conflict with the expected hardware-wrapped
key security model.  What would you prefer for the initial version:
should this combination be disallowed, or is there another approach
you would recommend?

Thanks,
Liao Yuanhong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
