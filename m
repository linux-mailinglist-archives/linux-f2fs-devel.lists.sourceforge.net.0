Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66668B07084
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 10:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Y2mWUD6zvn3e6hNJZ83Sg7/35/qsHaVJWoLLzZN6q4=; b=iAyGLmRdU/sU3s3Y27kS8nrFGg
	tR9+SKtiHeHquwx8SdfDnG0zTvlAur/9d6DK7UPwJ0hQ4lENSq9lp9yLnM4hNrbAKglKBvxn6avRk
	UTXKKvDZV2R0QESyt41qh1ArVj6vRjlGTBqNWtn99kLWrMlfvuR6DwkBR/MOPpSoFpyo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubxUs-0006eF-7i;
	Wed, 16 Jul 2025 08:28:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1ubxUp-0006e4-87
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 08:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=41MjVr8l6vSUjYXnQpWFoaHSQw9G5PoPMSlDdwVD4co=; b=lYltyxpytRrzMMTw00eDirxiiG
 sGGi2LvpYLncrd9WzXO+KuKKlQd+XPT33oBTyNbA8qZ4QmnGmH9lfi6Ftyclf/X8QectsyJuTo17a
 VTyiZAS00OgKHQ8YkotxxT8jIVS3TDtbVYCUWT+8jlUHT1+RF0YBssJz/KTQfuw7jEe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=41MjVr8l6vSUjYXnQpWFoaHSQw9G5PoPMSlDdwVD4co=; b=gIcUnwx/haNdNHWGAUKVfjQ3Ge
 GlmAzJFQcNX0W9u1tN1hr+IKovgcybzEn2lIvmsWkfqxtoPN7sgbW8RYv8gVQ2Jb8l71qUv7XtViG
 sHs0ZopwWd+7spM6gJpHtc+Ckpbi3xGz0F4ehj3iNI/v6ACwum65e6nrKnFq6i7n36iI=;
Received: from mail-japaneastazon11012062.outbound.protection.outlook.com
 ([52.101.126.62] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubxUp-0002Cq-8K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 08:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoA76FH4HK5EHPaXMAtB8rkrlvh0BUrNvyM8OhMhBjbHHoGIQXNCbPb4XGLpk1n96um9IaxmUfdOtD6ZzGF9OxcbyRvTWmAfHOvrBylrapp2MVuLIkx4MWVj1sXWdj7/olaVsRMJ3KdncbaSVWzYQi/eWqo/ryqIEy88KrJNDzEmRDJkkmPHYEK0z6GSJnY8EiSpay1pwFhTzytZJqmgRgeVndfqG2G4ANcNpwmBKCVMBFutfMibDUqdKk4jDUFMgLSxP1HNmTvC250f0DDC4X++zQBHnMFatUNA3DTzwcIh6Qv4RYdToxRteWv0/nrIxLbmBxnKhdjoerKOurr74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41MjVr8l6vSUjYXnQpWFoaHSQw9G5PoPMSlDdwVD4co=;
 b=XlBXWsQAuVR204aUxosRYXLKqOQfjZ0gvG6kQq8+QWx0q+1KEDARVhuu5ZF5Ta8NcOvvbCJhK1EvWB3w6byP6++XnTuZto40S2DKeIhAmI3ivV7Isba6ahk0AUhx56I1RiYv4nFr6lcor0OjvLWnD9TA1wHbosJrs8bV9a0x6W8Mwgcbdsu4bI8lpECcGubXanqtVyTVwQAObBuujhjqRRhvvnB0LsnJfyjMD0BEJkp5PzmodmQRviZTE6ZWedxXnHXj3X1KIbPl4EDm3l0TLul7QYkD7tjzPMMaH9wLcKKZXgH1BDXzhAXtXnQvRNXjIypKP9OIJ2IFF5ha+eRV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41MjVr8l6vSUjYXnQpWFoaHSQw9G5PoPMSlDdwVD4co=;
 b=HgV3Uoa7yXBwgOF7a4GlJ0wTG8T064r3lsOpHxDfqPHBCERTVGy7EfLm4cWOsTGac5WXtOjbXU+oer49HeAYiNyItnUTbU+4UFzYsRTrH1XyWfKlCB2kLxlKYJ3/WGHzO85ZX5V7hTeLYUkkyEUmzbXl48prJb15WFRiEMKFuPtj4CgOhqwoWwM+U+AyPJsEAcsXumMGOdPGklYf11NJA7zvWZPhUaSMHGiwAxcZA9Nm3+ZhYBuEhaXOj2vGNJG7yBYUJIUg93KUjlrQXh5pB/7HdC6QSWMG5JhJeY02Gd6K65OhdfzaD0W2rIk3TquaxNpldkUmCq9dq3/6B/T4gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by PUZPR06MB5697.apcprd06.prod.outlook.com (2603:1096:301:f7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 08:27:53 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 08:27:53 +0000
Message-ID: <4366bf0f-64a1-44ae-8f81-301af2d179d8@vivo.com>
Date: Wed, 16 Jul 2025 16:27:49 +0800
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org, chao@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
 <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
 <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
In-Reply-To: <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|PUZPR06MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: b8badca5-90fb-4a6e-a45c-08ddc442a851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejZGazBRYW9ucks5T3ZHSlY5bnBNd3U2eC93bW5SMGM5N3pYTWYyUnBPSUlo?=
 =?utf-8?B?ckxlU0pLOTUrVjQ3dzlEdjM2eDNLT0xDaGpSbzlleUE0RG9CMjNnQWdQRkUz?=
 =?utf-8?B?bHgyek1vTHM0SDdlci92Tm5RWTJBdVFRdVNBejNZNk9CWUJuM0tXd0ZFWTk2?=
 =?utf-8?B?OUpvWlJCcUNveXJwR0NUQTlaN2Y3b0VON1pkNXRoOURtZTUxUitJOGF4dXB4?=
 =?utf-8?B?N1lGdStEcFFrbDdaelIrbEFmN215Uzc3cVpTVExXSlpoaERUU2xqOXZZenYz?=
 =?utf-8?B?cUxGR2ZCS05UM1F3K3NHenhZYXp1RTc5OHVzdTBNdjNWdlB1SlA3SEpNdE9Z?=
 =?utf-8?B?cUpsZFk0U1QvV1BMdFpFMXJSUEtaRllRUUozOFV1TlNVNjV3VVN6UFpqT0tn?=
 =?utf-8?B?QVBTSEJ2S3h1RHFPNTFhRithWXVENmh0TXFmbDdNdUdyQno4TzdOZHpCUS94?=
 =?utf-8?B?RzcyR0gvWHJkZEYvQzArQ2YwMHZ6K0h6QW5jaGtybnRuUkxLVnpseFczZjJM?=
 =?utf-8?B?OW0wUHJoeHlZTHNXMlF6dDlUUHMwU244OEQ0UnhPcmVtTWRIR2dXRnNtVU9S?=
 =?utf-8?B?QWNJNDVBc3pkRGdscFprMDJMMmY3RmU4VldSL3piQ2paTmFXRzQ4ZFova1E1?=
 =?utf-8?B?bndrOG51bVNENTFUdC8vWFVxUHVUNHFhYWtFK1FqaDBtSEJuRHRETXAzQkxW?=
 =?utf-8?B?S2lGUi9WZVVQVlozMzFubnNxay9PNSt1LzA5VTZPZWtmNnZMb2ppOUwwT05S?=
 =?utf-8?B?Z1hQNEJ4c1R4N3pTZEVGMldpamFpVTZiS3lXUnIwbktxVTA0cGpYVmE1QmY0?=
 =?utf-8?B?azdzbm54ZjhTTHZQWTVnRlZRVzA4dXd1ZzR3T29HdjVxY0lIWEg5U0E5R3pX?=
 =?utf-8?B?dkl5SC82SVl2aHZxZzJGcVV5UDRJUjBKRCtybFBmeDNEdkFUdE1TMXlHWmF4?=
 =?utf-8?B?dFN3WFZkcSthUWtQdWNQU0lrbldJMHVlT3l1QytiNkRTbjhxczJ3SkpVeENB?=
 =?utf-8?B?NlhOT0Z4TzR2bHJROVdCUXBDeFRHOGV2K0pBR3A2dENhNFV2Yi9KcWhPR0l5?=
 =?utf-8?B?S1BMMk1zR0M3NzhueitTa1dkNU9oaGlxTEVreEd1Z1RjWTRLM29jYjFrUTFE?=
 =?utf-8?B?R3ZCYXpweEZMZ29JZU1FNmxYdXkzVGNsbkRyOE9QbWxmWU5KQ0ZMcEozeW1x?=
 =?utf-8?B?S21iWnRBaHduOE9oakpsNlBNTlF4cFFTTXhSU2puemtyTTFIaWJFSHNUdG10?=
 =?utf-8?B?MzFXbGZ3K0I1eEJLbDQ3NVlKS1FBUmJublgxR2w0bHBXL2FXOEZMVXJsbkFY?=
 =?utf-8?B?bXpST0xiWTh1cS8wSG5tTndNNTREdHRLRnpmeCt2UFJvaUE1U2c3ZW14TDJo?=
 =?utf-8?B?empUNFczcW02UDErbFVibVZWU0xjTVJ4aG1JNzRUNXozSVBLZ1FYeHVOTzl5?=
 =?utf-8?B?U2xHWE00dXFWUERJazBlWUQyYVRhSVdzbVliaW90dlJjU3lPYUgyWkJ0QUNt?=
 =?utf-8?B?NWZ2VWNoUTliRWI1eTNwU2xhVTZ1UFVCVTZWS1UxNFQ4cG8xM3FrTDIyU0lx?=
 =?utf-8?B?NWJqWmhRaXhhZWpVVWREcklaR2tNQTk4MTZ5UWcyNGVucWFxK3VFdDRaMERu?=
 =?utf-8?B?eVFiemROaGZKcWxnSy8vYTBpSFVMczc0WWx5UU02QU1zQmt6MFZNcHNVeFhN?=
 =?utf-8?B?aTFxTjBOSlJvT2Z6Y3FvSytNbkY0MXZFaWlOQUtVZkNTd1hiTlUvdTByY3RU?=
 =?utf-8?B?SUhYd0dtMHBiajdwY2JwYkI5eGNucXBQbkcvaElVSmNnb2ZNYnZsRSt3TG9x?=
 =?utf-8?B?TEg0WUFVbmpzVERsMzlBTXRuejVva1BuL2Q0dUx1d0wvWE12QXRnV3VoOStk?=
 =?utf-8?B?Ky90RVJ1cTB3Wno2M3FjTDExakl2Zi81bXlrZWltT1F3NTdlRWdSZUVPeXN0?=
 =?utf-8?Q?hm9jB6asWrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdCVVZVRkczZklqTHFwbjRkUFhUM0NOdjMwdTdMUjZVSDhycWloRXgvQ3V0?=
 =?utf-8?B?UEtLMFhPYklCWW5IR0lobEIrK0dueGxnb3pnN3Z6S0drZXpZbE5DOUh1aXBo?=
 =?utf-8?B?UVFucVlSK2w2bGJNcWhXNmVMMVdHb3kxT3l5VGY5aEdONlhmdUlHaHJ1NWtW?=
 =?utf-8?B?OWdJcmJ5VnUrS2pzUkNFUUtBTXNXNWlBK0xGQnRuby9nM09RZHphNjR2SlZB?=
 =?utf-8?B?TmxCQzdKWksrRTg0VWZNZkFSWGRXMjNvaWs3MEUrNFpwY1luYkpWUEpYMUY1?=
 =?utf-8?B?UTBwbmRPTE81eHR0d2dhZFdJVk9yR0UwbHo4bUlWeUlRN1BGd0hsQzE0NW50?=
 =?utf-8?B?eCtlTXFGWVhRWVk2QTMyYTVubTU4VU1rNW0vdnhRTlJTRTVTVTR0RENVS2Vm?=
 =?utf-8?B?ZGd1a05XRlVIaytkcGRHOUFyWktZcUJ3NFV3dEdBcnc2ajlMZ2VRU3NrZ1NU?=
 =?utf-8?B?bmRLOHFxb3l0aU5jYTZJUnRPcTMySUw2ZTROWHROVFI4a3F4Q2VRSDcydDli?=
 =?utf-8?B?UXVkTGs4bFAwcXhrSDBIQXhqbW40S3VCY2RYQXRpZGpYTzRwU01PZFhXL0dC?=
 =?utf-8?B?YkI5YUMwd1E0UGl1WFVLYUh6dG5ReGtqSVlJaUxXQVFDZ1Y5OWg1aS94M1VW?=
 =?utf-8?B?VlJyYmcvNGVkN2xDNVdjaFVEbmtQOWJsb08xdkt2REJFYVdjVWFGcE11di95?=
 =?utf-8?B?K0FjNVlvZnRnbTZleHRRZERSVlRTaXc0UTNkaWpjNVZBdmplcVlnS1FJVjg3?=
 =?utf-8?B?VEdrNGMxMXQwQzQzbk5MQzZjcHpkbWQrNlZScjhPY1M0cjdYaytkM2N5YzZt?=
 =?utf-8?B?QzBYYlltVTRIYVI1TEpEQkNBMXMxc1A0dXhKOUFmSmNoOC9oVFR6U2JqWjRQ?=
 =?utf-8?B?aFN0V3I3M2ZsNmtuSzhxMVAyNnFiSmdKTWd4cFNHenFnN1NNeTluSkJNL0ds?=
 =?utf-8?B?STFDdFhwVmtqRGtuSUxjTTdJcHlFSGNJaHBEdE1takdHWGtKVHZPMVYzOUhM?=
 =?utf-8?B?Y3ByRmduU1VnS1RuVCtPVFExUXlRdEhaV2ZncFJuMHNsOGZDamtqSk5CdTlM?=
 =?utf-8?B?L1pjZ0tITmhvMWptZ00vbDRlbFMzSG12T2t2OGM1bXBDbWNzUkYxazZWaVo5?=
 =?utf-8?B?SG5lblA2WnpJWmNwTjV5OHgrK2FWa3JVMXd0ODhmNWZJc1JRa3FWR0RuZFRP?=
 =?utf-8?B?U1BJK2V1SkRKdkNZWElWT3hkenJ1Lzdib0xaZXI0Z2psOEZ3Z1FvY2VsSE14?=
 =?utf-8?B?UWdybHdLdGFZL3lKbEs1L1VkNEtLNEpkWWxjZGNsMUg3N0s2KzdiNU5pNC9q?=
 =?utf-8?B?UTBZSXZUTEJkWWJESGJ2aTJFUnhETkYyeExLUGdrMExHMjdaNWVSLzdYWUJS?=
 =?utf-8?B?ZTZVUE1KTzZib1U0Tk54VDZqOUhSZ21wQmV6bWw3QVpNU2RrVkVoRGhodkdW?=
 =?utf-8?B?dFV1RWZGcys5NDhOajIxb05mU0FPcUZSRlF2LzI3U044TlZvVE5BZVVDMG05?=
 =?utf-8?B?Smp1eloxZlJud0kwRWU3bWIwQ0N4VzRncWY2WmNlZkppQkFmTDY4MlVVMzkx?=
 =?utf-8?B?TDMxc2xFeHhBajEyaXFTVVN4ak82c3N1MEliTzZDV1VHSFlFMmt3dmFnSUhh?=
 =?utf-8?B?SGVaMmNkbWlpSkRtNlBEY0lraTR0R1gzNEZvYXJ5THNPU2tZam9hSXpoTlBI?=
 =?utf-8?B?emVOYzJ5ckxUTy9ITDhBVVVpSitWYmlTTDdESkFHRE9uUGlLUU5SYnFab0hI?=
 =?utf-8?B?QWlaUk12Z205ZGxJZ1ZJcU9KRUdFVWFLVHR4R3lVZVByWTdydW42VVhNMjlS?=
 =?utf-8?B?aWk5QWlkY1pWd28vdDZzK0pqdGs5VGhCNER5UnV5ZmtUa25VU1NEbmlLb0Nw?=
 =?utf-8?B?azYxa3NBb2R0U0ZWRlIxbCt5M3FLSXoxNmlqOUZCd2Z0WUtVTUpROWprb3hU?=
 =?utf-8?B?Rkh1OExLaVZFYm9yeldGY0ZIejJWRHZlRGFLamQ5VHFXalFON2JWUjlVQkdX?=
 =?utf-8?B?SW1kdFhUUVNkS0hCdkFqNUNWM2FnOG5UQUVQYlFySCt1Sm0xbDRXQnZIWVEw?=
 =?utf-8?B?Mkd3UjgyVVQ1UTZJM0lQT3E1NjFCc3pPdWxVQjFxTWtBdkk2R2RULzIxbWxB?=
 =?utf-8?Q?LcU5EvxIrjgtFZ/PDFWWFjYML?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8badca5-90fb-4a6e-a45c-08ddc442a851
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:27:52.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOvKiHHKI3uIa2Hu/BAhfds2EVAA6Fv1JCfiW9+TcNuUWBjnkOf5HKQh9OBjSqCm+zXz3PaZAhmFuWuJd3pZPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5697
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/16 11:43, Jens Axboe 写道: > On 7/15/25 9:34
    PM, hanqi wrote: >> >> ? 2025/7/15 22:28, Jens Axboe ??: >>> On 7/14/25 9:10
    PM, Qi Han wrote: >>>> Jens has already completed the development [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 ARC_VALID              Message has a valid ARC signature
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1ubxUp-0002Cq-8K
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
From: hanqi via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hanqi <hanqi@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzE2IDExOjQzLCBKZW5zIEF4Ym9lIOWGmemBkzoKPiBPbiA3LzE1LzI1IDk6
MzQgUE0sIGhhbnFpIHdyb3RlOgo+Pgo+PiA/IDIwMjUvNy8xNSAyMjoyOCwgSmVucyBBeGJvZSA/
PzoKPj4+IE9uIDcvMTQvMjUgOToxMCBQTSwgUWkgSGFuIHdyb3RlOgo+Pj4+IEplbnMgaGFzIGFs
cmVhZHkgY29tcGxldGVkIHRoZSBkZXZlbG9wbWVudCBvZiB1bmNhY2hlZCBidWZmZXJlZCBJL08K
Pj4+PiBpbiBnaXQgWzFdLCBhbmQgaW4gZjJmcywgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQg
c2ltcGx5IGJ5IHNldHRpbmcKPj4+PiB0aGUgRk9QX0RPTlRDQUNIRSBmbGFnIGluIGYyZnNfZmls
ZV9vcGVyYXRpb25zLgo+Pj4gWW91IG5lZWQgdG8gZW5zdXJlIHRoYXQgZm9yIGFueSBET05UQ0FD
SEUgSU8gdGhhdCB0aGUgY29tcGxldGlvbiBpcwo+Pj4gcm91dGVkIHZpYSBub24taXJxIGNvbnRl
eHQsIGlmIGFwcGxpY2FibGUuIEkgZGlkbid0IHZlcmlmeSB0aGF0IHRoaXMgaXMKPj4+IHRoZSBj
YXNlIGZvciBmMmZzLiBHZW5lcmFsbHkgeW91IGNhbiBkZWR1Y2UgdGhpcyBhcyB3ZWxsIHRocm91
Z2gKPj4+IHRlc3RpbmcsIEknZCBzYXkgdGhlIGZvbGxvd2luZyBjYXNlcyB3b3VsZCBiZSBpbnRl
cmVzdGluZyB0byB0ZXN0Ogo+Pj4KPj4+IDEpIE5vcm1hbCBET05UQ0FDSEUgYnVmZmVyZWQgcmVh
ZAo+Pj4gMikgT3ZlcndyaXRlIERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Pj4gMykgQXBwZW5k
IERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Pj4KPj4+IFRlc3QgdGhvc2Ugd2l0aCBERUJVR19B
VE9NSUNfU0xFRVAgc2V0IGluIHlvdXIgY29uZmlnLCBhbmQgaXQgdGhhdAo+Pj4gZG9lc24ndCBj
b21wbGFpbiwgdGhhdCdzIGEgZ3JlYXQgc3RhcnQuCj4+Pgo+Pj4gRm9yIHRoZSBhYm92ZSB0ZXN0
IGNhc2VzIGFzIHdlbGwsIHZlcmlmeSB0aGF0IHBhZ2UgY2FjaGUgZG9lc24ndCBncm93IGFzCj4+
PiBJTyBpcyBwZXJmb3JtZWQuIEEgYml0IGlzIGZpbmUgZm9yIHRoaW5ncyBsaWtlIG1ldGEgZGF0
YSwgYnV0IGdlbmVyYWxseQo+Pj4geW91IHdhbnQgdG8gc2VlIGl0IHJlbWFpbiBiYXNpY2FsbHkg
ZmxhdCBpbiB0ZXJtcyBvZiBwYWdlIGNhY2hlIHVzYWdlLgo+Pj4KPj4+IE1heWJlIHRoaXMgaXMg
YWxsIGZpbmUsIGxpa2UgSSBzYWlkIEkgZGlkbid0IHZlcmlmeS4gSnVzdCBtZW50aW9uaW5nIGl0
Cj4+PiBmb3IgY29tcGxldGVuZXNzIHNha2UuCj4+IEhpLCBKZW5zCj4+IFRoYW5rcyBmb3IgeW91
ciBzdWdnZXN0aW9uLiBBcyBJIG1lbnRpb25lZCBlYXJsaWVyIGluIFsxXSwgaW4gZjJmcywKPj4g
dGhlIHJlZ3VsYXIgYnVmZmVyZWQgd3JpdGUgcGF0aCBpbnZva2VzIGZvbGlvX2VuZF93cml0ZWJh
Y2sgZnJvbSBhCj4+IHNvZnRpcnEgY29udGV4dC4gVGhlcmVmb3JlLCBpdCBzZWVtcyB0aGF0IGYy
ZnMgbWF5IG5vdCBiZSBzdWl0YWJsZQo+PiBmb3IgRE9OVENBQ0hFIEkvTyB3cml0ZXMuCj4+Cj4+
IEk/ZCBsaWtlIHRvIGFzayBhIHF1ZXN0aW9uOiB3aHkgaXMgRE9OVENBQ0hFIEkvTyB3cml0ZSBy
ZXN0cmljdGVkIHRvCj4+IG5vbi1pbnRlcnJ1cHQgY29udGV4dCBvbmx5PyBJcyBpdCBiZWNhdXNl
IGRyb3BwaW5nIHRoZSBwYWdlIG1pZ2h0IGJlCj4+IHRvbyB0aW1lLWNvbnN1bWluZyB0byBiZSBk
b25lIHNhZmVseSBpbiBpbnRlcnJ1cHQgY29udGV4dD8gVGhpcyBtaWdodAo+PiBiZSBhIG5haXZl
IHF1ZXN0aW9uLCBidXQgST9kIHJlYWxseSBhcHByZWNpYXRlIHlvdXIgY2xhcmlmaWNhdGlvbi4K
Pj4gVGhhbmtzIGluIGFkdmFuY2UuCj4gQmVjYXVzZSAoYXMgb2YgcmlnaHQgbm93LCBhdCBsZWFz
dCkgdGhlIGNvZGUgZG9pbmcgdGhlIGludmFsaWRhdGlvbgo+IG5lZWRzIHByb2Nlc3MgY29udGV4
dC4gVGhlcmUgYXJlIHZhcmlvdXMgcmVhc29ucyBmb3IgdGhpcywgd2hpY2ggeW91J2xsCj4gc2Vl
IGlmIHlvdSBmb2xsb3cgdGhlIHBhdGggb2ZmIGZvbGlvX2VuZF93cml0ZWJhY2soKSAtPgo+IGZp
bGVtYXBfZW5kX2Ryb3BiZWhpbmRfd3JpdGUoKSAtPiBmaWxlbWFwX2VuZF9kcm9wYmVoaW5kKCkg
LT4KPiBmb2xpb191bm1hcF9pbnZhbGlkYXRlKCkuIHVubWFwX21hcHBpbmdfZm9saW8oKSBpcyBv
bmUgY2FzZSwgYW5kIHdoaWxlCj4gdGhhdCBtYXkgYmUgZG9hYmxlLCB0aGUgaW5vZGUgaV9sb2Nr
IGlzIG5vdCBJUlEgc2FmZS4KPgo+IE1vc3QgZmlsZSBzeXN0ZW1zIGhhdmUgYSBuZWVkIHRvIHB1
bnQgc29tZSB3cml0ZWJhY2sgY29tcGxldGlvbnMgdG8KPiBub24taXJxIGNvbnRleHQsIGVnIGZv
ciBmaWxlIGV4dGVuZGluZyBldGMuIEhlbmNlIGZvciBtb3N0IGZpbGUgc3lzdGVtcywKPiB0aGUg
ZG9udGNhY2hlIGNhc2UganVzdCBiZWNvbWVzIGFub3RoZXIgY2FzZSB0aGF0IG5lZWRzIHRvIGdv
IHRocm91Z2gKPiB0aGF0IHBhdGguCj4KPiBJdCdkIGNlcnRhaW5seSBiZSBwb3NzaWJsZSB0byBp
bXByb3ZlIHVwb24gdGhpcywgZm9yIGV4YW1wbGUgYnkgaGF2aW5nCj4gYW4gb3Bwb3J0dW5pc3Rp
YyBkb250Y2FjaGUgdW5tYXAgZnJvbSBJUlEvc29mdC1pcnEgY29udGV4dCwgYW5kIHRoZW4KPiBw
dW50aW5nIHRvIGEgd29ya3F1ZXVlIGlmIHRoYXQgZG9lc24ndCBwYW4gb3V0LiBCdXQgdGhpcyBk
b2Vzbid0IGV4aXN0Cj4gYXMgb2YgeWV0LCBoZW5jZSB0aGUgbmVlZCBmb3IgdGhlIHdvcmtxdWV1
ZSBwdW50LgoKSGksIEplbnMKVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBJIHRlc3RlZCB1
bmNhY2hlZCBidWZmZXIgSS9PIHJlYWRzIHdpdGgKYSA1MEdCIGRhdGFzZXQgb24gYSBsb2NhbCBG
MkZTIGZpbGVzeXN0ZW0sIGFuZCB0aGUgcGFnZSBjYWNoZSBzaXplCm9ubHkgaW5jcmVhc2VkIHNs
aWdodGx5LCB3aGljaCBJIGJlbGlldmUgYWxpZ25zIHdpdGggZXhwZWN0YXRpb25zLgpBZnRlciBj
bGVhcmluZyB0aGUgcGFnZSBjYWNoZSwgdGhlIHBhZ2UgY2FjaGUgc2l6ZSByZXR1cm5lZCB0byBp
dHMKaW5pdGlhbCBzdGF0ZS4gVGhlIHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93czoKCnN0YXQg
NTBHLnR4dAogwqAgRmlsZTogNTBHLnR4dAogwqAgU2l6ZTogNTM2ODcwOTEyMDDCoMKgwqDCoMKg
IEJsb2NrczogMTA0OTYwNzEywqDCoMKgwqDCoMKgIElPIEJsb2NrczogNTEywqAgcmVndWxhciBm
aWxlCgpbcmVhZCBiZWZvcmVdOgplY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKMDE6
NDg6MTfCoMKgwqAgICAgIGtibWVtZnJlZcKga2JhdmFpbCAgICAga2JtZW11c2VkwqAgJW1lbXVz
ZWQgICAgICBrYmJ1ZmZlcnPCoGtiY2FjaGVkwqAgIGtiY29tbWl0wqDCoCAgICVjb21taXTCoCAg
a2JhY3RpdmXCoMKgICBrYmluYWN0wqDCoCAgIGtiZGlydHkKMDE6NTA6NTnCoMKgwqDCoMKgIDY0
MDQ2NDjCoMKgIDgxNDk1MDjCoMKgIDI3MTkzODTCoMKgIDIzLjQwwqDCoMKgwqDCoDUxMsKgwqAg
ICAxODk4MDkyICAgMTk5Mzg0NzYwwqDCoMKgIDgyMy43NcKgwqAgMTg0Njc1NsKgwqDCoCA0NjY4
MzLCoMKgwqDCoMKgNDQKCi4vdW5jYWNoZWRfaW9fdGVzdCA4MTkyIDEgMSA1MEcudHh0ClN0YXJ0
aW5nIDEgdGhyZWFkcwpyZWFkaW5nIGJzIDgxOTIsIHVuY2FjaGVkIDEKIMKgIDFzOiA3NTRNQi9z
ZWMsIE1CPTc1NAogwqAgLi4uCiDCoDY0czogODQ0TUIvc2VjLCBNQj0yNjIxNDQKCltyZWFkIGFm
dGVyXToKMDE6NTI6MzPCoMKgwqDCoMKgIDYzMjY2NjTCoMKgIDgxMjEyNDDCoMKgIDI3NDc5NjjC
oCAgIDIzLjY1wqDCoMKgwqAgIDcyOMKgwqAgICAxOTQ3NjU2ICAgMTk5Mzg0Nzg4wqDCoMKgIDgy
My43NcKgwqAgMTg4Nzg5NsKgwqDCoCA1MDIwMDTCoMKgwqDCoMKgNjgKZWNobyAzID4gL3Byb2Mv
c3lzL3ZtL2Ryb3BfY2FjaGVzCjAxOjUzOjExwqDCoMKgwqDCoCA2MzUxMTM2wqDCoCA4MDk2OTM2
wqDCoCAyNzcyNDAwwqDCoCAyMy44NsKgwqDCoMKgwqA1MTLCoMKgICAgMTkwMDUwMCAgIDE5OTM4
NTIxNsKgwqDCoCA4MjMuNzXCoMKgIDE4NDcyNTLCoMKgwqAgNTMzNzY4wqDCoMKgwqAgIDEwNAoK
SGkgQ2hhbywKR2l2ZW4gdGhhdCBGMkZTIGN1cnJlbnRseSBjYWxscyBmb2xpb19lbmRfd3JpdGVi
YWNrIGluIHRoZSBzb2Z0aXJxCmNvbnRleHQgZm9yIG5vcm1hbCB3cml0ZSBzY2VuYXJpb3MsIGNv
dWxkIHdlIGZpcnN0IHN1cHBvcnQgdW5jYWNoZWQKYnVmZmVyIEkvTyByZWFkcz8gRm9yIG5vcm1h
bCB1bmNhY2hlZCBidWZmZXIgSS9PIHdyaXRlcywgd291bGQgaXQgYmUKZmVhc2libGUgZm9yIEYy
RlMgdG8gaW50cm9kdWNlIGFuIGFzeW5jaHJvbm91cyB3b3JrcXVldWUgdG8gaGFuZGxlIHRoZQpw
YWdlIGRyb3Agb3BlcmF0aW9uIGluIHRoZSBmdXR1cmU/IFdoYXQgYXJlIHlvdXIgdGhvdWdodHMg
b24gdGhpcz8KVGhhbmsgeW91IQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
