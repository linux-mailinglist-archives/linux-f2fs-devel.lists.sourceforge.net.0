Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TyyTLOcYOWo/mwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 13:13:43 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A366AEF9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 13:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Vn0kHsNE;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Oqa7XNdQ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="gEgXg/5/";
	dkim=fail ("body hash did not verify") header.d=amlogic.com header.s=selector1 header.b=JrZ1e2sY;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hws9lcbn3HH9TIx0hye+7KPuaamBEaShsMEPHVSywCs=; b=Vn0kHsNEILc0MeLppQS0S1u6ro
	otsyseaNbp5MsVuONi8/BPRTrpezWc/V9DYLMgkojS/tqYuHf8s4S71mGF9jrqjo9pv3LAzdMSvhQ
	DYIYGp9rJgBxmSpcGn3rpVsYnw1q0DRze59hPK0KrQk+HW5l/LS7NHNCHtmuWTtT7aFg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbcal-0000j5-Bx;
	Mon, 22 Jun 2026 11:13:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Jiucheng.Xu@amlogic.com>) id 1wbcaj-0000ix-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 11:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xWbiJiuA+KtoiJmrga5qA0gdKBMJQyvcnKVUg+SQlTc=; b=Oqa7XNdQbvwDv+/vnynHdwdb69
 mpI35S+qn2qgZAfK1rLN027arsKspZeOqzYws1/7adz0LYRPS1f47O+ACUr+zWeuOk/atchZpK+1/
 RgkpZ6KzAaAJlM2CZW7Ekh7p8sLLTtGQTYIsIRdcvhW+70NmMxvC0ekzsb6n3hA7NItw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xWbiJiuA+KtoiJmrga5qA0gdKBMJQyvcnKVUg+SQlTc=; b=gEgXg/5/+pGoFqhcz/+saRYist
 R41XaiVchOOImArb70q+ctNkGBQl8yD8WGHakrx2Zlw0pY/M5UZhBNvbPJunJnxHNwYpHLb5Ql0QQ
 oImG2Fnfbk5M7Zo1xdwZue91RSg8P3rQAnkFQAdF5DNTa9UtWcX0ffgbSrKHtVgnNFuk=;
Received: from mail-japanwestazon11022093.outbound.protection.outlook.com
 ([40.107.75.93] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbcae-0008TR-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 11:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7PRRrZ6jiQqIkTyf56kM5UlqY/I77PKYydb7CAGvFIDkE0yCrXLqegIvExCHpS8fWhzkS8VT92zPu+h14CZwLWXGsE1qQPvDcvp9mTQr6jKGOIEojfwVUeJjR0Wk5cJcLgLLa4fGb2F0yK7KVxWk6n0gVHxn2FKWQppBbaViaoPg2FrxZmbgxrcMWB/2qkLIQUHPKFUKUS/pzbLJOfcJ42cNd297Zl6c9Ii1mLKbxhd5vdWokkte8sSbYOl9kGrWSaJMnDSgPfd37Y9WfSxYUs21pIC57OSPhE19toN+tCrQYifePJsA/4AtzfZlLrYUrdK/KzJds4obCx9hd4Y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWbiJiuA+KtoiJmrga5qA0gdKBMJQyvcnKVUg+SQlTc=;
 b=U46K97hMHLrrylFnP5EjG0SOrcCdQMnqi2P1grI8D7zwTIJB2CaoRGqkPbWL9KqbmPuYsng+o1HEEj9BxE76pEpppRFLEfUoOUpkwJCNRff11uMlS5/iSd//rOZzQyaIWpg5HJcZRKc1t6L3ojrMB0mGQf94HFjR9gCcZCueFvuL92E3Pbas/yIKW9tep8IEmDptUmZkkFcfRm4HdBPZPjXJ4nfuhLd7FDtkpAaZ1m0cA0cnAreOGFTSGwYGfa+Gd+lcOSyNXTprx4tgq5fHyNnIcFULGDFPDYAaom4/91nO3e6cDYpWL4zBOeIsA0Iz4lr9ZrokOsUqaLlQS0uH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWbiJiuA+KtoiJmrga5qA0gdKBMJQyvcnKVUg+SQlTc=;
 b=JrZ1e2sYcCRxRiScFeUORM5S736/w145YAzXtR7mdMa9/KE91aswYjxZWeZ/CQrAhHnso62B3RLFMrbNTk6EDslDyWB9rBxiTf/4S4gJaXrz+cGHNQ/OnJ5UwKHtT5e28i20nWEvUINQsSAGis4S/rI1CJh+aW8dSvevEY3c6L4RQ0tgbk/+vduQUwFwK9d6/N8OwjFdReDZm9HXcSkYgyOi4TKBRLurjIzFtYHFDwe5l+qKy7Tow765gME+qKNtz69APBCtuFzxjhGsyvYuDCyjmWxyq315MTWaAwKEf0hT5ZdKr45H2DBtFgOoV55P7WCFDa9AN0jsn9Rzp+ePGA==
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5)
 by SEZPR03MB10282.apcprd03.prod.outlook.com (2603:1096:101:337::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.10; Mon, 22 Jun
 2026 10:40:35 +0000
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f]) by TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f%3]) with mapi id 15.21.0159.007; Mon, 22 Jun 2026
 10:40:35 +0000
Message-ID: <e9f39088-a4c1-4d1f-9a06-9d530e3fab15@amlogic.com>
Date: Mon, 22 Jun 2026 18:40:32 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260620-origin-dev-v1-1-3b2e639e794c@amlogic.com>
 <dffacd73-ebc2-4f35-9433-d569b48014be@kernel.org>
Content-Language: en-US
In-Reply-To: <dffacd73-ebc2-4f35-9433-d569b48014be@kernel.org>
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To TYUPR03MB7232.apcprd03.prod.outlook.com
 (2603:1096:400:354::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR03MB7232:EE_|SEZPR03MB10282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd84ad3-068e-4fce-15a9-08ded04ab11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: xUn4mf/UEyl01EStWKwZ4DamtemlPYY5kgb3msro3wx1iHN1+D5NXnv+h3mxQE69DH+bOHHu3QD9lNdiNPwa8w1sAD6FtoJAF456TQsSEKDqYgHLzkifPfTvaGvzWX5RGkdjxNw1P+97GPdMZi+BwW6kBmPySo+1U/yMg5zyPqd7Njc0vVTlvl7N8AI3rXhPuqhRGbRo9jdVduT4cEPpAR5woq+aGyd7Wk5gNOZ69zHKG7p2SqclOTzBZQQZVa4mhGnGVQ6Yq5gKRP/sk4kMEWhh5eLgnkDPaPUCYhskwZ2ZaFX4U0HGh+phCHsewAs9qoqh96CpcJSMMK/jqdZgoDo0cqWEkbHLo1sz3CeOdIdRaCaFciePmzvD7d0wAW22rJhr21K81ZwQCwBsBNlldpPqYE1JRIJ4EVXaii6YkBis6cYl93QkhtCqMegst851mf8iNav6Y9z1jiDH4pgxRLgntyLp8Cik7HAvLcfMZNoVqcB+ATWXbt8USv+89kzfIByA9Kvx49/gViaWuwn0tBh0UIYY7PPQsFfsi74Nvjpg3BFZIwXqnTGXJ2cj7N98A4sCpdFN/rQuDUQKPRNd4m86gRBUeXQbk/ufAH8qEIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYUPR03MB7232.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhzTUtEeGtDR0VGVk5PRTR1amdKTEsxRWJ1TC8yVHhoRW9NYmVOT24rWlpD?=
 =?utf-8?B?eGhPQmFNUWcrSjAvSC82VmJ3ODI5eS9rTm9tMGpHS1VTeU83c2xkY285RGZp?=
 =?utf-8?B?RnVBNDhheUpaMVNMK1FOc0JpbW9hS1VwdlhqalBwSWZCdXhxN2kxVGwvcndv?=
 =?utf-8?B?azVGNERkZ2FWYzFkSE9UYUJ6TXB5N2JjbnU2VEFISGlpc1hCVWpOVTFKMXlJ?=
 =?utf-8?B?K1lxM0tSbTZkOVpsYnQxL3RGbHhiT0RqcStOSlArajlQai9GL0pzQ2NKc3BQ?=
 =?utf-8?B?WUU3SVViV1lrTDRhbTdIM3RFRXAzekhpbktrbHhLRWJTT0taMVlBK2tCNHll?=
 =?utf-8?B?R2J0em1XVHdwV3A0L3VBS0tIT053NXdhRVRSWkI5Ui9PVjRFYkdLYUcwbERB?=
 =?utf-8?B?N09oZzRHc2JlSVg2ODYxcUFlY3BFWmlxNVQyRnN1UDNFNDdQRjA0QXAyRGVi?=
 =?utf-8?B?V2phVW10VC81eWZOVno3VW9VTmNFaWFyL1FuN0hVZzNrOTZEQkVOWlZFeXZi?=
 =?utf-8?B?bXBUemlkcjE3c0dvUTN6N0o4TktkNUtvZWdmUEVkeTdXamFtUGJsMXlOZlhw?=
 =?utf-8?B?aDd3TGZNVmxMRHFLdVRkMVBXeGNrM25GRWV4ek4zWXpzbFVTUkNHU2FwVXdS?=
 =?utf-8?B?NjFiRTR1RExLVHY1enU3MjEvMkR2RXJJdFducXFpVlJ3cnlObzF6QXlpTTg3?=
 =?utf-8?B?M1dOcFh3S0o4K0VVMDY5ZXRQbGhrdndyV3BxYUtGVFJoSXdnbWtUUWtWK1Ny?=
 =?utf-8?B?TG44b2w3MEovT0tjRzVyZ2wySUVWdVVXMlFWLyt6dE9IVDNQVlFWSDhIblBV?=
 =?utf-8?B?bFh3UG9HRVdmTFBwencvcXludEwyQmFJY3o5WVFadVVOS1V4bEdLNndMNXEx?=
 =?utf-8?B?VlBFd1NMaDQ3NTErRC9nUlZTeVB0bFpSeVhyTXpTa1g5T0tNSVVhQkdFelZW?=
 =?utf-8?B?V2cwRmxERS8yY082bWxPTVc4dVMvRm1UU3J6ek9KdzR4Y2FjbnMyWjErTVFG?=
 =?utf-8?B?U3M1dUpjM05GWGVuVyt3QlFuQjhrN09wU0t3enFUQTJKVVJrcDZ5UFl3aHB1?=
 =?utf-8?B?TTVzU1FQaytwOUFCeXZPUktQOUhCRFhyMm51RDZvNEU3RE15Wi9XMEZ1SjVT?=
 =?utf-8?B?ZXh3WUhPZlBlMGh0VWVLTHZ5TkdGTkt5dWVNWm0vYS9ldkZOVFc5NnpaNy9P?=
 =?utf-8?B?dHpxdFlnRlpZYXdVbXNRMWRWbWpYY2p1Q3JPd0FSTkE2eGhlSSt4V2txaHBR?=
 =?utf-8?B?U0dFNVFZOE9ZcnVJWGFvMTJsTW9jWEJTeHprM2RoeHRPRlJFclZmb1ZIOWF4?=
 =?utf-8?B?MWNxOGFQZHhCSE1jVHVWdHZwNWtmbGNZWGhaVnhvMlBGK204R2doSFBIdS9u?=
 =?utf-8?B?VENkRnErd2NWNG1uM0Z6ajdsQm5qYVFLUWxZNGI4aWI2ZCswVW41Qkd0c2Q4?=
 =?utf-8?B?SUZ3T2JyS0NxeGtvQ0NSREVUS05IOTNwWUkxOUt4ZTJOYng3dlVCUE1iRk90?=
 =?utf-8?B?UTNjbU9vdEFQVWFodVhNM2d2MFJrTmVSTnpsZkdVOVFjd1F1OSswdHozSG43?=
 =?utf-8?B?YU1rMXB6S241Vm5EV09PL1QyaTBDNnlMWXdsWTJHZHJZR0JBcWZQditrd0t4?=
 =?utf-8?B?emF6TFlJV3dQUHpLSjBQZGJ6K0gwNnlaUEFrQ0MvdTV3SG1zNHByY003Ulo5?=
 =?utf-8?B?c0NJVkhJY1I3UEF5N3ZkK2NSWmlqWGovZXVqOU1vTkdPcWdWVDRJQitxZTlN?=
 =?utf-8?B?c3g5WGJhemVGN0YzSkJkcExva2d6MmNDc3VDZHZYRUJkNWxUWDU3NlA1Y1hl?=
 =?utf-8?B?clhlZGZicUlNUkNiOEhFZXM4bklyQmQzaXZuc0J0eVAvQ0hlaUJrMmFsQjNO?=
 =?utf-8?B?M1plSjJHOXBHMU9RYXIvZWRNZ2dHOW9jREpMekk4TEwxUkZKdzFzd204SlFh?=
 =?utf-8?B?Um1USDM4UjhFUHhVSmFKTjlUMzFZS1RwRFBiaDVuYUtmcFo4cDdQS2xNcWw3?=
 =?utf-8?B?NVNNUUxaZmgzQWVESjc3amFERHBZMTExR2FGVDcxeVdTSlFDWWkwbGxWVEFr?=
 =?utf-8?B?NkVlVWU2cjhRWEsxcnE2a2VrZHBnbmsxMUlYTzQ5eSs3V2lpTklMcjJxbVRG?=
 =?utf-8?B?dW9jcE1UYVZ1TkpiSGhiWDNwNzI2S3h1ck9aNUo5cGlzaEVveVJ1STY2NTc0?=
 =?utf-8?B?ais3ajlaSUFoTmdNV1dORHNSb28rcC9NYUovUGZiWHJBL0ZlSkhCTW5SeGFD?=
 =?utf-8?B?b1h2K1M5V2JQV21ocXpvS2tUU2hpYlM5MUdkSFVpU29KQTA1UWVXcWpqNFh0?=
 =?utf-8?B?Um9sZUdSYU9mQ1Fka2R4T1NPSG5vQ0lhQXhBMmdUYm83UHp3SWxVZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd84ad3-068e-4fce-15a9-08ded04ab11d
X-MS-Exchange-CrossTenant-AuthSource: TYUPR03MB7232.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 10:40:35.2355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alYX9qOzklk91cWpUqtFBx+y00GNq7lFDeT12LPelqUWXRfoFvZDsySiid1ZHciCTmaZ4WaSe8HPY/ewjZvcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB10282
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/22/2026 9:46 AM,
 Chao Yu wrote: > [Some people who received
 this message don't often get email from > chao@kernel.org. Learn why this
 is important at https://aka.ms/ > LearnAboutSenderIdentifica [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.93 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wbcae-0008TR-Ja
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix FG GC failure when file in victim
 is pinned
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
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:tuan.zhang@amlogic.com,m:linux-kernel@vger.kernel.org,m:jianxin.pan@amlogic.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,amlogic.com:s=selector1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,amlogic.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jiucheng.xu@amlogic.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1A366AEF9E

Ck9uIDYvMjIvMjAyNiA5OjQ2IEFNLCBDaGFvIFl1IHdyb3RlOgo+IFtTb21lIHBlb3BsZSB3aG8g
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIAo+IGNoYW9A
a2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1z
LyAKPiBMZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+IAo+IE9uIDYvMjAvMjYgMTc6MzQsIEppdWNoZW5nIFh1IHZpYSBCNCBSZWxheSB3cm90
ZToKPj4gRnJvbTogSml1Y2hlbmcgWHUgPGppdWNoZW5nLnh1QGFtbG9naWMuY29tPgo+Pgo+PiBX
aGVuIGNvbnRpbnVvdXMgd3JpdGUgb3BlcmF0aW9ucyBvY2N1ciBpbiB0aGUgc3lzdGVtLCBCRyBH
QyBmYWlscyB0bwo+PiB3b3JrLiBUaGlzIGxlYWRzIHRvIGxhcmdlIGRpcnR5X3NlZ21lbnRzIGFu
ZCBzbWFsbCBmcmVlX3NlZ21lbnRzLiBJZgo+PiBmYWxsb2NhdGUoKSBpcyBwZXJmb3JtZWQgb24g
YSBwaW5uZWQgZmlsZSB3aXRoIHRoZSBhbGxvY2F0ZWQgc3BhY2UKPj4gZXhjZWVkaW5nIHRoZSBm
cmVlX3NlZ21lbnQsIEZHX0dDIHJlY2xhbWF0aW9uIGZhaWxzLgo+Pgo+PiBUaGUgcmVhc29uIGlz
IHRoYXQgdGhlIGZpbGUgY29ycmVzcG9uZGluZyB0byB0aGUgYmxvY2sgaW4gdGhlIHZpY3RpbSBp
cwo+PiBwaW5uZWQsIGNhdXNpbmcgZ2NfZGF0YV9zZWdtZW50KCkgdG8gZmFpbC4gU2luY2UgdGhl
IGNvbmRpdGlvbiBzZWNfZnJlZWQKPiAKPiBKaXVjaGVuZywKPiAKPiBwaW5uZWQgZmlsZSBzaG91
bGQgYmUgYWxpZ25lZCB0byBzZWN0aW9uIHNpemUsIHdoeSB0aGVyZSBpcyBmcmFnbWVudGVkIAo+
IGJsb2Nrcwo+IG9mIHBpbmZpbGUgbG9jYXRlcyBpbiBkaXJ0eSBzZWN0aW9ucz8KPiAKPj4gPCBn
Y19jb250cm9sLT5ucl9mcmVlX3NlY3MgaXNuJ3Qgc2F0aXNmaWVkLCBHQyBzdG9wcywgcmVzdWx0
aW5nIGluIHRoZQo+PiBmYWlsdXJlIG9mIGYyZnNfZmFsbG9jYXRlKCkgYWxsb2NhdGlvbi4KPj4K
Pj4gU2V0dGluZyBnY19jb250cm9sLT5ucl9mcmVlX3NlY3MgPSAxIG1ha2UgRkcgR0MgY29udGlu
dWUgc2VhcmNoaW5nCj4+IGZvciBuZXcgdmljdGltLgo+IAo+IE1heWJlIHdlIGNhbiB0cnkgdGhp
cyBpbnN0ZWFkIG9mIGNoYW5naW5nIGYyZnNfZXhwYW5kX2lub2RlX2RhdGEoKSBsb2dpYzoKPiAx
LiBjYWxsIGZnZ2MgdmlhIGlvY3RsIG9yIHRyaWdnZXIgdXJnZW50IGdjIHZpYSBzeXNmcwo+IDIu
IGZhbGxvY2F0ZSBvbiBwaW5maWxlLCBnb3RvIDEpIGlmIGl0IGZhaWxlZAo+IAo+IEJ1dCwgYW55
d2F5LCBJIHN1c3BlY3QgaXQncyByaXNrLCBpZiB0aGVyZSBpcyBubyBub3JtYWwgZGlydHkgc2Vj
dGlvbiwKPiBGR0dDIHdpbGwgdHJ5IHRvIGNhbGwgZjJmc191bnBpbl9hbGxfc2VjdGlvbnMoKSwg
dGhlbiBtaWdyYXRlIGRpcnR5IHNlY3Rpb24KPiB3aGljaCBoYXMgcGlubmVkIGJsb2NrcywgdGhh
dCB3aWxsIGNhdXNlIG1vcmUgZGFtYWdlLgo+IAo+IENhbiB5b3UgcGxlYXNlIGZpZ3VyZSBvdXQg
d2h5IHBpbmZpbGUgaXMgZnJhZ21lbnRlZCBmaXJzdC4uLgoKSGkgQ2hhbywKClRoYW5rcyBmb3Ig
eW91ciBmZWVkYmFjay4gSSBqdXN0IGRvIGEgdGVzdCB0byBzaW11bGF0ZSB0aGUgQW5kcm9pZCBP
VEEgCmNyZWF0ZUNvd0ltYWdlIGZhaWxlZCB3aGVuIGRpcnR5X3NlZ21lbnRzIGlzIHRvbyBsYXJn
ZS4KClNpbXBsZSByZXByb2R1Y3Rpb24gc3RlcHM6CjEuIEluIG15IGNhc2UsIGRpcnR5X3NlZ21l
bnRzPTk2OSwgZnJlZV9zZWdtZW50cz05NiwgZnJlZSBzcGFjZSA9IDEuN0csIApzZWN0aW9uOnNl
Z21lbnQgPSAxOjEKMi4gdG91Y2ggYS5iaW4KMy4gZjJmc19pbyBwaW5maWxlIHNldCBhLmJpbgo0
LiBmYWxsb2NhdGUgLWwgMS41RyBhLmJpbgoKQW5kIGYyZnNfZmFsbG9jYXRlKCkgcmV0dXJucyAt
MTEuCgpBbHRob3VnaCB0aGUgdXJnZW50IG1vZGUgd29yayBmaW5lLCBidXQgaXQgaXMgbm90IHZl
cnkgY29udmVuaWVudCB0byAKY29udHJvbCBzaW5jZSBBT1BTIGhhcyBhIGdyZWF0IGRlYWwgb2Yg
Y29kZSB0aGF0IGNhbGxzIGZhbGxvY2F0ZS4KCkkgaGF2ZSB0cmllZCA1IHRpbWVzIHRvIGZhbGxv
Y2F0ZSgpLCBidXQgR0MgYWx3YXlzIHNlbGVjdHMgdGhlIHNhbWUgCnZpY3RpbSBzZWduby4gU28g
SSB0aGluayBpdCBpcyBhbiBpc3N1ZS4KCgpUaGUgdHJhY2U6CmYyZnNfZ2V0X3ZpY3RpbTogZGV2
ID0gKDI1NCwwKSwgdHlwZSA9IE5vIFRZUEUsIHBvbGljeSA9IChGb3JlZ3JvdW5kIEdDLCAKTEZT
LW1vZGUsIEdyZWVkeSksIHZpY3RpbSA9IDYyNCwgY29zdCA9IDE5Li4uCgpmMmZzX2djX2VuZDog
ZGV2ID0gKDI1NCwwKSwgcmV0ID0gMCwgc2VnX2ZyZWVkID0gMCwgc2VjX2ZyZWVkID0gMCwgbm9k
ZXMgCj0gMTE3LCBkZW50cyA9IDAsIGltZXRhID0gOTgsIGZyZWVfc2VjOjUwLCBmcmVlX3NlZzo1
MCwgcnN2X3NlZzo0NywgCnByZWZyZWVfc2VnOjQ3CgoKSSBkdW1wIHRoZSBmYWlsZWQgdmljdGlt
IHNlZ25vLCBibG9jayBvZmZzZXQgaW4gc2VnbWVudCBhbmQgcmVsYXRlZCAKaW5vZGUgaW5vOgpk
b19nYXJiYWdlX2NvbGxlY3Q6IGlubz0zMzkwMiBzZWdubz02MjQgb2ZmPTEzMgoKVGhlIGR1bXAg
b2YgcGluZmlsZSAzMzkwMiBpbmZvOgptYWluX2Jsa2FkZHIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWzB4ICAgIDI2MDAgOiA5NzI4XQppX2lubGluZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWzB4ICAgICAgNjEgOiA5N10KaW5saW5lIHNob3dzIHRoZSBmaWxlIGlzIHBpbm5l
ZCAoMHg2MCkKaV9hZGRyWzB4OV0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgIDJm
N2IyIDogMTk0NDgyXQppX2FkZHJbMHhhXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzB4
ICAgMmY3YjMgOiAxOTQ0ODNdCmlfYWRkclsweGJdICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbMHggICAyZjdiNCA6IDE5NDQ4NF0KLi4uCmlfYWRkclsweDFkXSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbMHggICAyZjdjNiA6IDE5NDUwMl0KaV9hZGRyWzB4MWVdICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFsweCAgIDQ2NWFmIDogMjg4MTc1XQppX2FkZHJbMHgxZl0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgWzB4ICAgNDY1YjAgOiAyODgxNzZdCi4uLgppX2FkZHJbMHgy
MV0gICAgICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgNDY1YjIgOiAyODgxNzhdCmlfYWRk
clsweDIyXSAgICAgICAgICAgICAgICAgICAgICAgICAgICBbMHggICA1MDQ2ZCA6IDMyODgxM10K
aV9hZGRyWzB4MjNdICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgIDUwNDZlIDogMzI4
ODE0XQppX2FkZHJbMHgyNF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgNTA1YjYg
OiAzMjkxNDJdCmlfYWRkclsweDI1XSAgICAgICAgICAgICAgICAgICAgICAgICAgICBbMHggICA1
MDViNyA6IDMyOTE0M10KaV9hZGRyWzB4MjZdICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsw
eCAgIDUwNWI4IDogMzI5MTQ0XQppX2FkZHJbMHgyN10gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWzB4ICAgNTA2ODQgOiAzMjkzNDhdCmlfYWRkclsweDI4XSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbMHggICA1MDY4NSA6IDMyOTM0OV0KClRoZSBmaWxlIGlzIGNyZWF0ZWQgYnkgbG9n
Y2F0LGFuZCBsb29rcyBsaWtlIGluZGVlZCBmcmFnbWVudGVkLgoKQ2FsY3VsYXRlIHRoZSBibG9j
ayBhZGRyZXNzOgo2MjQgKiA1MTIgKyAxMzIgKyA5NzI4KG1haW5fYmxrYWRkcikgPSAzMjkzNDgK
ClNvIHRoZSBpX2FkZHJbMHgyN10gPSAzMjkzNDggaXMgdGhlIGZhaWxlZCBibG9jay4KClJlZ2Fy
ZGluZyAid2h5IHRoZSBwaW5maWxlIGlzIGZyYWdtZW50ZWQiIHlvdSBzYWlkLCB3ZSB1c2UgdjUu
MTUgKyAKYW5kcm9pZCBVLiBJcyBpdCB0aGF0IHY1LjE1IGxhY2tzIHNvbWUgcGF0Y2hlcyBmb3Ig
c3BlY2lhbCBoYW5kbGluZyBvZiAKcGluZmlsZXM/CgpUaGFua3MsCgoKPiAKPiBUaGFua3MsCj4g
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppdWNoZW5nIFh1IDxqaXVjaGVuZy54dUBhbWxvZ2ljLmNv
bT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvZmlsZS5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4gaW5kZXggCj4+IDhhY2RkOTQyNzJhMGNlZDQ0
OGUwYmEyMTYzNWQ3MDJjZmVjMTA2ODIuLjNlNDlhNzNiYmYzYTE4NGEzMTRlOTdiZmY5NTA5YTY2
YzI3ZWFjMDAgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL2YyZnMv
ZmlsZS5jCj4+IEBAIC0xODgzLDcgKzE4ODMsNyBAQCBzdGF0aWMgaW50IGYyZnNfZXhwYW5kX2lu
b2RlX2RhdGEoc3RydWN0IGlub2RlIAo+PiAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuaW5pdF9nY190eXBlID0gRkdf
R0MsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hvdWxk
X21pZ3JhdGVfYmxvY2tzID0gZmFsc2UsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuZXJyX2djX3NraXBwZWQgPSB0cnVlLAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMCB9Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMSB9Owo+
PiDCoMKgwqDCoMKgIHBnb2ZmX3QgcGdfc3RhcnQsIHBnX2VuZDsKPj4gwqDCoMKgwqDCoCBsb2Zm
X3QgbmV3X3NpemU7Cj4+IMKgwqDCoMKgwqAgbG9mZl90IG9mZl9lbmQ7Cj4+Cj4+IC0tLQo+PiBi
YXNlLWNvbW1pdDogYjUxZjYwNmFhMzIzZDU1M2Q3ODZlZDY4MWEyMTNmMTM0ZGM2ODhkNgo+PiBj
aGFuZ2UtaWQ6IDIwMjYwNjIwLW9yaWdpbi1kZXYtOTljZGNjYzgzODAwCj4+Cj4+IEJlc3QgcmVn
YXJkcywKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
