Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLmnBOtGPmr8CQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 11:31:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DF6CBB4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 11:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YGxq6LXT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=aAOoWAKH;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FKDRB8BS;
	dkim=fail ("body hash did not verify") header.d=amlogic.com header.s=selector1 header.b=LXMrwyrJ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFrT3SygrIyymnbjVCywj7tOIws2d8KD7woHxG91ceQ=; b=YGxq6LXTzFEuCgFCrgyh6r7RRN
	J61imH3iIJV8Gp86wTky974TWUBaiE/Z3RS5jSkYmzckIxfeoPsNe7oPiXlokpVDE9AnQlOHiOYBa
	XOxp1W09l0vXfJQvPX6c/gbAaLDmy39yoLS9iX5ZV3gkFixREEpCITTAu2BgK+D00aRY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wd2tw-0004PZ-7m;
	Fri, 26 Jun 2026 09:31:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Jiucheng.Xu@amlogic.com>) id 1wd2tv-0004PR-8T
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 09:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt++/wkgAziuk2o3Wm8pdZ53FVKJ9EBJ2szGoSrYaaE=; b=aAOoWAKH9BdTCXDSDDmu1mqS0a
 kS4AozpmUK+X5Yg5nCWgYcOc1mQlHVJkpp2YF7SXElaPFPEn1FqpGKm0LfDVcKoRSKdKK/4YYwRBJ
 slQfQ10XTpn18uA1Fsg/BtN+sdImx8rfhe88Nj5qsCDYDGNod//daJw4ELWGMYJJbZfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rt++/wkgAziuk2o3Wm8pdZ53FVKJ9EBJ2szGoSrYaaE=; b=FKDRB8BSUR89bf+PjuPAZ3PE1i
 hAi3Tl0hxbx0rkbRDV4Zg4VbxzrCFxv5r1DLIdHyJXjmpAhbYUJjZD9NQfIIIF1WiLStyLemfW3JN
 7V0vwzkwg2XFlKpMljh5PdM0CY6X326AsbqB+fuoR3vyzuYJYXTj59tVUhrQSy6j4S+c=;
Received: from mail-japanwestazon11022097.outbound.protection.outlook.com
 ([40.107.75.97] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wd2tu-00028t-UC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 09:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UagpT81V1VwUdPyOdmM8U0TVbOwXBwnnybyMm3NcMicrE9zk0sX3oYyeIt0QWIidT7bRfohkWDjTcNn/Il4e23GWSy2SKwhVI6r+X7uQeZBuTK55l9uXS2K9WpTKwz2Jf+0BtatFYARwlRWCAeCMKpV+d/IUaMSYNNLoeZwQA/O7QlP3BlLw6zo8N2H5zB1aulv4rW+tefHXiRxqH/W49JVOVglbRBqGV6rtqBh1bwwwCmhXjaCx+w3lYZ2R5fW1CFH1vEiSLEbxd9lXbHshUhuvFMF4jIy+J6goSMQzl8s4qzo7ikaqxx2a2fG4wAf3kv6R4t4FFyRdPE+M3YyFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt++/wkgAziuk2o3Wm8pdZ53FVKJ9EBJ2szGoSrYaaE=;
 b=qkirKXOWMCMK4KHxLe116XvFKjCCRQTu9/9EbFY/zOZxqxs3sLSziAG1YLL/ke0eomvWxuG9MUOZBz78xcEPpQmSxMBtsWUV1HiNnxOQGnqEKQuLWa0VlTNd4CVgpGv92gNSMdbJigpC84e8+6BLKRo6cC0uT5GmdWMoASOb2JgcgilqqsvQ9KLrEAte+fnMwJhXFRxGsVGo13KZQTOjqpyZ89ruvDsK7gii6mlufw+6ItBYY7mYPrCJYTcIKV5JOD9KrSU0+wZoTreMHxv5m2lz5xcrUk3JGB8taYcbcdPGoWcpBLK6gB0+VVUvD2wbtJJoUYTYZTur2LAHT4KVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt++/wkgAziuk2o3Wm8pdZ53FVKJ9EBJ2szGoSrYaaE=;
 b=LXMrwyrJLCTS51u02r0KKN5JHg9o1DskLxSCPrM40sBd1kvYpzb56vU2Abk6e6uCFSWn1fgmubhZtmutBATW1n4XeWuJBwe5083eYIcNoMmy0NtSemSKY7NdJSxYchF0VXuvZnoBzHvm6yK0WttFKWi4DucWvzGoQqva6HjR3qYoLGX2ayye2fMsczzieeaBGi6rucGfddsu+J8TUfKbee/jwzXYzvPm5uzrgOpEoqOov6hkHEUj3hBKJd31OC14s7MJAW8SeEzlbt4fCW1hF/tairH3NObZ52NYYUVVqrWHfUlMUTIzEOA0lf2obmp5/KmtSHFmf4GTvGNUGzBERA==
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5)
 by TYNPR03MB10201.apcprd03.prod.outlook.com (2603:1096:405:3c3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.6; Fri, 26 Jun
 2026 09:30:59 +0000
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f]) by TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f%3]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 09:30:59 +0000
Message-ID: <ca56ceb7-b0a7-41f2-9b26-085e81456794@amlogic.com>
Date: Fri, 26 Jun 2026 17:30:56 +0800
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <ajwtQRawMxcQkyo8@casper.infradead.org>
Content-Language: en-US
In-Reply-To: <ajwtQRawMxcQkyo8@casper.infradead.org>
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To TYUPR03MB7232.apcprd03.prod.outlook.com
 (2603:1096:400:354::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR03MB7232:EE_|TYNPR03MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c67945-4d3c-4704-7868-08ded365a1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QCxHzQEgLftAYcJzxpHP33LiVnyczS6dSyKP9VUAGb4y/sZFSEP2SwzUDEybgDUbD23sbB7+OJbROffsyVRKRvpyPiSLLW+N+pRhfaSGOovp+4d2el3K7ZWyVXDOIepDQmTIw53ct3V+D+RE+VSGQAYriP6LopD1rqs4m3/CaEZy3bu/D+xNAXmDxSN37XcTRMlmRNJQhYsqfjyxkbq1i3j9KZBYg602AEMCRSJ1Dm3U0OzUMxv4QKsnYNSM+jRHsJd7D1/BhUKArN5DMFOd7O9L3FlFrxDev7YVuxJeOSm5rgFG6B9PwZjZEeC3/aoPrrQf7jQ0LSRoZNX78qWstg/fEyeZ5sdHXNclIvsOoTy37XN1p+oTeic4zM1liOShuZpSyravetozW79Z/AZ3nfI9MTADFHmI0Et7QKPLDg7m3oradjMiHSb+U2IhjrS+rtRupgo39Ghp4wvWohxxI/goUezVBmfm6kkMGss9LgCzsn9zFtj5r/CAAO5zS+c9z9aJwfSzJAnRgDNVkYtfPYizmUxwngZnXdvKj+BaWb7kMzj9wkmlzAkqyt5X2HuuJ5WDiGQ4FaL5+IJq+hFMZE+Fd+wFtJioNUfqU2OPWTv0TC/2zlMmFsat0iGlWwAlG2CROa0JPZTjaYcUO8FTe+BNeoGz1UqBwCDrzcCT2eA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYUPR03MB7232.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFZaXByQUdnQ1hYanQrZmNXYTRVejU4bms3OHk3amlINzRCUzhVMER1K1lW?=
 =?utf-8?B?NlhoZGltN29hQmZjNyt5bkZMRGVZdWRucTJNMDlnczgwZ2drcDlWaWExTjNZ?=
 =?utf-8?B?b3JsK2Z2WW9tRWRzMnBrWFN1TnpBMFNkb1RmM0tSTUtweDRGc0ZkOEpIUjZ2?=
 =?utf-8?B?NnFVcG4vb1o4bHlpNFdzcVpnaFZKRjVkOHJoN0RKKzNhcFRTTW9JWlgyT0VC?=
 =?utf-8?B?WFc1NWNzclBSV3BWWGFHRUg3bkxsVTBrb0dtQktBOW5seEdsVzk5RTY5T0c2?=
 =?utf-8?B?ODRjZkk0WHJhQ3ZMdjlKcC9nRzVUK1ZDMWZBczNrbXN4dkVxbHB4cHpLdi9C?=
 =?utf-8?B?aUY1MDNMZTcyLzd5eG5Eb055djZ5Y3V6ZGhpdCtGQm9zemJHOXhXL1ZmUUUw?=
 =?utf-8?B?aWltTEdubUk4VHlVbkVtQ2ppOGNHM0hHWURIMndEbzBFQi95MDhDS0VBRkRV?=
 =?utf-8?B?QkdzaFBJZXVkWjZLQjJLUHYwQTFrcCs0RHVBbUpPVVMvdVgvMGJxWHdyQjB2?=
 =?utf-8?B?Y1I4bTUyL3BHS0Z3a3lPMEUzMTNBOHltNkh4VmZJcUN6dFZnUzZ5YmYrcXZ4?=
 =?utf-8?B?M2NuS1c5M1o1dSsva08zQ250d1g2TVYzTnk4THoyQ1h1UGFPQ2lGZGF4UGxm?=
 =?utf-8?B?YWtBYzZFaVo1aWpZSzRtTVNjaTRDMVAyWTFEZHRTUGdUSWljTTZxc0hOUFY1?=
 =?utf-8?B?Yk5RNFI2K0tZZW02aHoybGd3elZEc3Y2WjhROVNCSXA4a1RCNDIvdG02RFR0?=
 =?utf-8?B?ZlVZblZESlUrVkZJdEx2RjJDblBlNDlyYytaNS9SV01lNGVFRVVPdXo4NVlh?=
 =?utf-8?B?T3h1WlBPRmU3M09NZGNPRm9LRlpLcTNKZ0NxeVZQYzNZZllLQTlqYUgvdGJV?=
 =?utf-8?B?OXE0RUNDT3VzdzdyR2wyS0RNTXpab3JqWFB0WGN6MjBKMUtBL21MQ2oycGly?=
 =?utf-8?B?SThkY1ljL2pzSDRvQVg2Z1Z5bEZWKytiRzVZTm4rZW5wU2xXbzV5Qll0UFV4?=
 =?utf-8?B?aGxHWjgrclV5dmRucGxpc2w2S3g5dnl2QWtmdUpReXZ2ZGM1bnlLYVNJZTVm?=
 =?utf-8?B?UDRhUDZxSmw4Z3lWSG8zaUFXZWxUOW53bXI1OGZoOHZhQU5pTmFHUG1RNHVO?=
 =?utf-8?B?U2RGbEZNcWZsRXBIK2ZVdXZkRWg2VFhTT01IcjlOR0YvNitEVFZrVXFNNzZT?=
 =?utf-8?B?OUxGRzU4RnBhMy90VVM4bk4wK1JhWnRhTHRyazZGVmpMdnd5MUdwV0pKb2pw?=
 =?utf-8?B?M05HTWhPK2ZPUGo5KzhzQ1pkRFBaaGpBRFdFVXdhUmtKdnFrclJtRXplems1?=
 =?utf-8?B?THIxUHRWUTJ0aEFWeVF6bGFRRWxnVmk1Z2VVdzJQc3RLd3Z3ckRQSzVpaXdK?=
 =?utf-8?B?ZUdWNVQzWnFsT3c5aEFUOE9mZ3dvUS9DSmIxMk0yNUo1R0FFZmNZdk96UlV2?=
 =?utf-8?B?SFRRUWhtU2R6b3RCMjN6ei9aY1NLR0dOOEtNaXNpbDBnbE10VU1oeEMwazA4?=
 =?utf-8?B?eThtdDRXY0QvWmNFeDR0TnMzbDFsL1VEQUcvTmFqcm5ML1FEdXhqa08zbXAz?=
 =?utf-8?B?UjJBUm04UjRxRGdqWTdHSlRjYTg1SnN5ajREV3NML0NJUmpFaE8xbldHUXFL?=
 =?utf-8?B?Q0pwYzhFZzVSZWhSMWdoYVpCVDQyUUQ3OEc4VXRMZUZLSlNsbHNTUHNFMWF2?=
 =?utf-8?B?TGF6WjZoT2lGT25tYW1pQjJ2Sk5idVhOYzVyT3gyY3IwU1lpSWJ3bjF2dm1r?=
 =?utf-8?B?WWpRUSsrUllNMEt0VzVqelo5QzVJY3FIWFNseHN4OGI0MWF3dm9DNi9LRVQr?=
 =?utf-8?B?Ym1oYjVkOWRiUHg1eUNyS0xyNVQvK0hCZkRmVEJrLzlQbnpuQTBuN0JiTVFv?=
 =?utf-8?B?blR2WjFQeFVnVnZKUUR6M1hRUXVMTmFXeG9OY0c2bExUemR0eTNReTBCSlR3?=
 =?utf-8?B?QmpFT29NQTBtYTRjVDZuSG8vVGdGOGJ3c0U4UTcwKzVIQzZDanFpNG55dW5J?=
 =?utf-8?B?Z0ovYmU0OUdPYmNRZDJJaklDMVpHNnVpa21oLzZFMGZhYmtOZmZUVlFOVzBV?=
 =?utf-8?B?c0RuNE1LSVBmSDRUdC9sTzZWMEtJL1hzN0hDLzBvSEw5RWdmRlE3cjZva0Ni?=
 =?utf-8?B?NnJYOFkyN1BrOVNpdXNsY0NkWGlQenlnSXRlM0FRV2Q5RnpBdWpudWs5Nmg4?=
 =?utf-8?B?ZStsK2o1b0JzdDk5UkhPdkhPaC9oSWZyWmFZQ1NYK2c3eUk2UnRIVjFMTjBP?=
 =?utf-8?B?SjFWaS9jUGtrU01SZkQ4MkpEeDhIeDdFVTExOGhFOWRvdU9VQVhYT3Q5RWVH?=
 =?utf-8?B?MjJHL2dTZWZMc3I0c2Zlajd3Z1ZxZCtnTUJaNnAyQmZpcUt4UmFpUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c67945-4d3c-4704-7868-08ded365a1ec
X-MS-Exchange-CrossTenant-AuthSource: TYUPR03MB7232.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:30:59.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lzqI1LS+8b+UjpVTb+JtcIfFzr0zsnY2xMOoDYDiujPDcvT6qz+yTUtlTSL1x/20r3RMcAy+XXXN4rmnu+CMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB10201
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/2026 3:17 AM, Matthew Wilcox wrote: > [ EXTERNAL
 EMAIL ] > > Hi Jiucheng, > > I am trying to remove FGP_NOFS from the kernel
 and the last remaining > user was added by you last year in commit [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.97 listed in wl.mailspike.net]
X-Headers-End: 1wd2tu-00028t-UC
Subject: Re: [f2fs-dev] Use of FGP_NOFS in f2fs
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
From: Jiucheng Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,amlogic.com:s=selector1];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jiucheng.xu@amlogic.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,amlogic.com:-];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,amlogic.com:replyto,amlogic.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B6DF6CBB4A



On 6/25/2026 3:17 AM, Matthew Wilcox wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Jiucheng,
> 
> I am trying to remove FGP_NOFS from the kernel and the last remaining
> user was added by you last year in commit 2308de27c03d.  I'm trying to
> understand why.  Did you see an actual problem if you do not use it,
> or was it theoretical?  The commit message says "to avoid potential
> deadlock issues", but it's not clear to me whether you know they are
> there, or only think they are there.
> 
> I'd really like to understand what the issues are as the normal issues
> which make calling into the filesystem (holding another folio locked,
> holding a mutex relied upon by reclaim) don't seem to be present.
> So if there is something, I'm not sure what it is.
Hi Matthew,

The FGP_NOFS flag was suggested by Chao and not adding it might lead to 
deadlock issues.

@Chao could you explain this for Matthew?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
