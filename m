Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D609C93876D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 03:58:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sViJr-0000kq-W1;
	Mon, 22 Jul 2024 01:58:32 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1sViJq-0000kk-MZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=70n1E8ay0Px7upQc9m8BgcttAiguu4BA8OOPXnx7ivE=; b=POBp8MJcC46/SWQT+gX5SxpdTe
 rZG9GheFtSXWJ+ROKeAJx1OAMeB0n4KLZjghn0GB9NxabW1m7A0oevuGB1sqLPDC5SfjPBQps+lE6
 Da1fiPU6OfRM6oH+IQi2ujMWpo2a8Du1qBsBmoAU6jYG8d+mMlv2Wd8mmmndTgGlKKAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=70n1E8ay0Px7upQc9m8BgcttAiguu4BA8OOPXnx7ivE=; b=BHeC/crZN8ugm8pQAS/MZwZQ+w
 O9xCzgglC+SZbX7ympG97UMoDNKgqqJFQTVQOagathlk8kjJDuIkUDrmQRRtbt9k6FchMLWCjMdIe
 syaMACBF/Jf8IxoI9NwGR6hbybMXct7S90WwNQ+P0a8Kxiws4BdFNGYD7u6fajh8yUbY=;
Received: from mail-tyzapc01on2071.outbound.protection.outlook.com
 ([40.107.117.71] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sViJp-0007sO-OW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2fbS+2xPjWQxEnwNt6jgOIeV7Q+jelA8Hqm66mxSB3Ehmy0Db5N39Mt78rbVR+vwQfIbhfcmUUZLw0/0OMFc8ao25HKpPdPHfY35SM0f9yF8OF/0oFZObhDkfXrhQMosvnNgTwDsAAr2ualmguK4n9tvAJ9dTsCJs/4b/0l6x5/jv3BWeUP8xdRzVuu7hPK8maUVWvkJl2ijph0e8/iGdAvjrzC/JWWHLF2EpwUYNOEdunqj/spnziLGDBgWo8iMARNtRtiTKGbaY2lM2qnJHbl76bGIAEBDVWh/z9hMR2fnxYgcrtrDwtkwaV6t1R551apWzXkbWqs8pIg7HbzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70n1E8ay0Px7upQc9m8BgcttAiguu4BA8OOPXnx7ivE=;
 b=eoG92LxoK9QoTjn8P4MBOb0kocSJppp++piLGZe+RUMB+9VRzAO2nHS+zNV/epKGvS4dJGAhYS/7HwV7oGGVxcopiX3A6RPL7UoKeTS2vVBgX4/8Rc3fuvNN1lqDX6QhgJxEW+5DyHUWTqfQrExxVAI4QC2z2gycwSdyFi3PuxJo6ih7/epGNanjVbAh/3zuNZQtFX6A60CxSe/9K9Nmjkwi5elfOuLh7FbwiD2fIJ1AsfKXUXLexcc9nv+1R8TZEPznOsab13/W2oLazccrhQ3KdNMOTRC96fzOMekcWruPullXhOc98lAC5XL+5+bfU5q/eyZV+NLSdVYaFbORFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70n1E8ay0Px7upQc9m8BgcttAiguu4BA8OOPXnx7ivE=;
 b=kCTgr3o4JAtIO7vHMM4GaAEfgGJ3T/NSRirIUFwPkh3GfO/t+aUN/w1BbmvaO/hDry9CS0wt0vCgeGqmvIdin3kTF4ta5m1N/5kucVFaDPGwLAwtOFBvjsdtTs0r7rqFxigb3ry5S3pdRvMcHu4HPfxXFbH7yIhL4viu5uVt6oA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by TYZPR02MB6246.apcprd02.prod.outlook.com (2603:1096:400:338::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 01:58:21 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9%7]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:58:21 +0000
Message-ID: <b8504f76-40fc-4f93-b496-138bf2fcfc30@oppo.com>
Date: Mon, 22 Jul 2024 09:58:16 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240720103349.3347764-1-yangyongpeng1@oppo.com>
 <c81af94d-3b56-4169-b2eb-5d82623ab0af@kernel.org>
Content-Language: en-US
In-Reply-To: <c81af94d-3b56-4169-b2eb-5d82623ab0af@kernel.org>
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|TYZPR02MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4610c8-e431-4e44-1c84-08dca9f1c358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUsvY0wxejJMWE5ETnFCQTJBeTY3cGFXZTRXbklOdzdZbmhDOFVZcE9ldjFN?=
 =?utf-8?B?NldBMi81MjBaSi9Tb1lkbU1ZYk5tellYWlNHenk0VWI1cFYvQVdvb0R6MDN4?=
 =?utf-8?B?MTlSSXJTVzRSTU1lODR0blJGRmpwcEhvVUtuOGFLdzVsYUF5RmpNSTRjOWZ5?=
 =?utf-8?B?ZksrMEFPemJjSHdWSXFJNlBpcWNVQWcyMS9sekFHWHY5SXFmOXpGMm9yVjd5?=
 =?utf-8?B?Y0RQRkhTaDNxeW5pUDQrTGJoNjh1YW1qbnpSZTcwaGRTbXhmbTNLcUE1ekJR?=
 =?utf-8?B?dndKNzlERXFwRUxjVmh0UW9IWVc1NnFaQWtoL21aVDN4TWhDUGtkTVM5U0lT?=
 =?utf-8?B?K1BVM0YwQU5palBFektpdzNNQktzL1F4ZHcyM1BVbFlXU2pUWWEyVWJHMmh5?=
 =?utf-8?B?S0VOeVBSRnhLajFWem5ZRTAycGc2T1Y0RkRQZE9hMjJiS0t5WUREYXNYeHNL?=
 =?utf-8?B?VXoxSEFqYzFKN2xYNlRxYjlnTUh0TnQ2R1hOM3pkVGFvYXJmTGRaVXN3ejhL?=
 =?utf-8?B?SWJ1NEFaVUVITGQ5OUdmRFJzRm1SaVQ3bFFiU2hITk9aWHVaQmdqRDhjaGxl?=
 =?utf-8?B?TVpGOFRJYndkdW8wZkZjVFozbWs0bkxSK1Q5cWg0Tjk5M2lNMXVSOWZxcC9H?=
 =?utf-8?B?dEJPc3pBMVZQaHNZNGZuZmdyWndvQk56N2tkNkx4YmxEYlcvUDBIdnBWcTVi?=
 =?utf-8?B?TlBsdURadnUyZ09mY0JBUkJSZ09zNXdxM1F4enV4aHZpbWZqWGhjQnJPcUQ0?=
 =?utf-8?B?bjNIRDRxZ0JhdkNaRUlzdVM5ZURhTGFvK2RBSURVbVBmSW5Jc2RuOUo3RDV0?=
 =?utf-8?B?NWk2UURIc0ZoR0RueVNJVnRGZHBQc2pVcm5YYTQvWnVIWEJFWjRqVkhNUnlD?=
 =?utf-8?B?UU5VUWUzbFovQ2hudkZvL2x2ZXFCT25QNC8zVVVaZFRZTGdoUGlSVUx6Wkxz?=
 =?utf-8?B?aVlVSU9TUnVqZmNhdVp6VzdaYkhuUU0rcmVnb0l3MVRuYnlxWmF6VXpKdGZy?=
 =?utf-8?B?MERBeXREOUhGRUxDNGVsQnhOVSszU09hZCtkLzBLYkgyVmprZUdxVC9QZEdP?=
 =?utf-8?B?cFpWK1ZKOHgwWFNHY3UrVFRxangrUFlGbVdYQVFPT0tOSmlOek9mVkI4TEcw?=
 =?utf-8?B?dVRUaEVtMWc1cFhPU2Nac00yeERhVjFZUXcxT3NUbmRPbVNQcm0yS25ST3Ji?=
 =?utf-8?B?a2VyeXpwMVhDU2FrYkE4NjIrd3JBRU0zLytHNFBDU2Q1dDJ6dm5oaGlvTDJR?=
 =?utf-8?B?K1pmeDU0MXBSVnBNOXp0V0pkWGpMcGgxUHFUdlhoSmFCQ2c0TkFFcFJMNjNO?=
 =?utf-8?B?VWhGMlVTU1pza0o1S1VYbzJIVDZNU0dDWlBiYkswRVR3aklaQnZINjZyMjlt?=
 =?utf-8?B?MXBSeXkwNkx3RW5zSU40ZVQxVTZXRE52TDJYVk1RQzZtRjYrbEh6bTRnNmFD?=
 =?utf-8?B?NTJVSmkvY1VWZE5vb0NiM0lpQm82RFgzVTBsOFQ4MnVqYm9YMnhxQ21zOGlO?=
 =?utf-8?B?K1FnQ2VvWm8xaTZrMllrRDgrTVJhUnZUWTZhTVlGTTBxeHJyWmgvK25tK0th?=
 =?utf-8?B?OFlBZG1mT1cya3krTW1ld0lMblRFZFR4MmZ3UllhS283RlJGVWtiMGJxS0V4?=
 =?utf-8?B?QTUwV2JYZEE3NGE4TWtLNmFWMmRrUUQvd3JxbkVxOXM0QTQyTVR3TnB2U2RZ?=
 =?utf-8?B?MitwNmJrcjNqOTN2T3VDenJ6NEh4R3hsNk1lSjdmWkw1TDRSc29JcysxYlBV?=
 =?utf-8?B?ZXFuMUR4ZDlteHlJOEdrRWk3V1NmaUcyanRXWk50QUd1cldscWJvdlNSaGU1?=
 =?utf-8?B?cVVjcjc2bWRrcnlVNWdCUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05yenZlN1hjTGlQMERUZXMzaUNOMXdEb0xMdnZVQ1NiSDJ5S0hTYWNPQjBw?=
 =?utf-8?B?dWtCekVuRlVPMU85a0dXL3Q2YWlreTMvYkRuS0szU3FhU2hxTXhhSmVvTnFD?=
 =?utf-8?B?RDVLOGZmVjdNM2ZZUDJiczFTSlBhWi9iVmxIcFFLQ25UM2tPbGtOU2JQYWQy?=
 =?utf-8?B?WEhjQWk2Q2plL3I1SStFMjhkOTBBbFRubFNuSmlHU3lzQUFXam5MWFVnait2?=
 =?utf-8?B?UVVUY0FqTkFuWXFQUE5ZdGhIRmN6Vk5Pd2VGNEdjM0ZqemFmRVQ1Ynh2R2Zn?=
 =?utf-8?B?UjN2VC9NMWtmMHdGNUJHK0dvbDMrczZ4S1hHQkRPWlZMNVJ2NnN2eEZrUkJ5?=
 =?utf-8?B?Zlp3U25jY3BEMzRNOWNueG5nNk1SZWhpUHFNdnNpVmJqY0FXZXV3VkRaMUJx?=
 =?utf-8?B?OE02MWtDV0hLNFF3Ni81Z0NqNFhFbVREMlJhQjd6cGZwMGtDdFZ3cW80ME83?=
 =?utf-8?B?U3NZWE5VdUVST0tVNTVDcnZaNVd5SHA5ekRoUGxKWm03MlJxRDJkVyszVFZJ?=
 =?utf-8?B?VTZVL2dic2diVDZESVhEMEJoN0gwWk04U1FWcXlZYW9qMUF6MGx6ZjV2akVQ?=
 =?utf-8?B?TzhIcFJzWFhHMU9kRGNXTVhRWTM4OTdockd1L3JNR3hJRDI4QXpEWEZoWVZY?=
 =?utf-8?B?NUFZZmUzdWdsNEhTSHdMZXFtNWRtcEd1RkQ2WEJiM01MaXFzV2QwVXh4TW9z?=
 =?utf-8?B?RkJlQmlScXVBeWFhaTZ4anVrZi82NEpURWx5VVk2ekRYeG1wVXUvdmYzbE55?=
 =?utf-8?B?QVVnZVI0RlNPY2NIUGR1T2tEMVNKN2dIQW9EbFc5c3EyL2RaeGU5WE9JUERi?=
 =?utf-8?B?Zm1jV093S00rZmlXdGdDRGdFaThrdC9BTDFvK3RNTkVROGZ6dEFBblRGWmZk?=
 =?utf-8?B?emMwU0ZXRWt0MEhUWFE0OXZzbEJ2N21wc1JGcVhDaFBjY2V3T0paT1gwN0s4?=
 =?utf-8?B?YzVsZU5PRWs4ZVVtMzJVaXk1U3NNc0ZoMkZFQTRvWk9iWXVwNXRvN1lMWnJm?=
 =?utf-8?B?ZHI2WTBPa0l3TDViazNwUkp5T2MvdVowQ3VuRkxiKzNWa2xwZ3B4eGZ1a0xJ?=
 =?utf-8?B?KytScVdIcGtXRU1XVnZDNCt4cXluRFRDM3JvMHJoZ3pETzVvOUlpK3Y0eDI5?=
 =?utf-8?B?dVhKL1JBY0lveFlwMTlxTmpYclB2dzlwbE8xN2J1V1A5RkZQaUtkUU15bVNm?=
 =?utf-8?B?L2Y1ZEJPZ3VDRkEzUTlablFVQm9YUDVXb0ZDV2k4NUdkemsvWGNzVE9kYzRj?=
 =?utf-8?B?TzNpUXlkNDUzSHNLV2NtYUNGdVp1TFFsRzFvUXBTdy9rVXBlQ3VNZDVKZWpI?=
 =?utf-8?B?VUlqNEtDZEY4QjJONFBKSytWRUNEYkxTdDVrM3hzc2RxUHR2ZWxZeFlacnUr?=
 =?utf-8?B?WkIwNEhwQTBSVWE4YUtzMmhoWEZpWGZPbE11SjVTbjI3RER0MGF3MVVCR0pZ?=
 =?utf-8?B?ZldOSFFBZGpKRmJENVd6amNNeCt3K0ZYUW5uYnJNZldGb0N3U2Z5eTZCTXhN?=
 =?utf-8?B?NlZvU1Q4R3ZOSVJqbWZSNTI0MEQ1bVFrL0FjRjhtWjNpbEppMjhseXlwenZ6?=
 =?utf-8?B?a0NTK1RKbWYvd1RaVVZ3aW9QRUVFNy9ZWGxEL1VIRkphNDR5TGtacS82YjF6?=
 =?utf-8?B?VmlMVk5YMmVHeFVhYjd2OUNybGtOWVBteHBsaEI1U2R6cjRtWGMyTHhVNFdz?=
 =?utf-8?B?VHphWHI5NEQ0OHcrd3VWYjlZWUFhSWtiQkx1N09ucnV4Y0k3K0F1aGtJMU1y?=
 =?utf-8?B?Um8wNVpkZGUwVTQxUTI0eElTMHFlV0t4VGxlWFRwbjhtN1ZpWHMvcVVKQUJr?=
 =?utf-8?B?MnZ2REppOUc5bW14dWh5SjlNUjcvVUQxQUYxR0lHSGkvMFptOWxuajJLRDdj?=
 =?utf-8?B?MTJrS2F5MW9jV3NYeFE1cnhlQkJSejJzV3p5bVI0VEh0ZEd0V2Q1VlI3UUho?=
 =?utf-8?B?eW9vVitxeExFazA4WENQcHJuZkY0UmZ5eGZBUWN6aUxxYmhvcE5IUXhidzBI?=
 =?utf-8?B?bFRHQ2JmVS9lZ2p3VHgzNHhGVXdnMDZhZWZSbkFwQmJBVDVtV0VHQnRFYjNC?=
 =?utf-8?B?SlZmSUhEQkNTckg4SDV6QVJuajA3NmVvaXFCTXpPaVQ2OFJ2NWlDaVRZMk1Z?=
 =?utf-8?B?cGxaRnRyWVR6bldNdHVrNnlKWTI2Qi9SU0RBQW0wSE5wTTljWERYZisyZHcy?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4610c8-e431-4e44-1c84-08dca9f1c358
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:58:21.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqiGR/5TbZfmprDdbIiVaqNGd2AAJZ5Hz321VbEmDr1SJ5zeG2TRNnu428yvrhXIn/7T3CJuSDKzEsOdt+bYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6246
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/22/2024 9:28 AM, Chao Yu wrote: > On 2024/7/20 18:33,
 Yongpeng Yang wrote: >> In the init_victim_secmap function, if the allocation
 of >> dirty_i->pinned_secmap fails, dirty_i->victim_secmap is n [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.71 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.71 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.71 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.71 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sViJp-0007sO-OW
Subject: Re: [f2fs-dev] [PATCH] f2fs: free victim_secmap when pinned_secmap
 allocation fails
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiA3LzIyLzIwMjQgOToyOCBBTSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDI0LzcvMjAgMTg6
MzMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEluIHRoZSBpbml0X3ZpY3RpbV9zZWNtYXAgZnVu
Y3Rpb24sIGlmIHRoZSBhbGxvY2F0aW9uIG9mCj4+IGRpcnR5X2ktPnBpbm5lZF9zZWNtYXAgZmFp
bHMsIGRpcnR5X2ktPnZpY3RpbV9zZWNtYXAgaXMgbm90Cj4+IGZyZWVkLCB3aGljaCBjYW4gY2F1
c2UgYSBtZW1vcnkgbGVhay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nMUBvcHBvLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvc2VnbWVudC5jIHwgNCAr
KystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMK
Pj4gaW5kZXggNzhjMzE5OGE2MzA4Li4xZTc4NGVhM2RiYjQgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+IEBAIC00OTcxLDggKzQ5
NzEsMTAgQEAgc3RhdGljIGludCBpbml0X3ZpY3RpbV9zZWNtYXAoc3RydWN0IAo+PiBmMmZzX3Ni
X2luZm8gKnNiaSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiDCoMKg
wqDCoMKgIGRpcnR5X2ktPnBpbm5lZF9zZWNtYXAgPSBmMmZzX2t2emFsbG9jKHNiaSwgYml0bWFw
X3NpemUsIAo+PiBHRlBfS0VSTkVMKTsKPj4gLcKgwqDCoCBpZiAoIWRpcnR5X2ktPnBpbm5lZF9z
ZWNtYXApCj4+ICvCoMKgwqAgaWYgKCFkaXJ0eV9pLT5waW5uZWRfc2VjbWFwKSB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBrdmZyZWUoZGlydHlfaS0+dmljdGltX3NlY21hcCk7Cj4gCj4gWW9uZ3Blbmcs
Cj4gCj4gSW4gYmVsb3cgcGF0aCwgaXQgd2lsbCByZWxlYXNlIHBpbm5lZF9zZWNtYXAvdmljdGlt
X3NlY21hcD8KPiAKPiAtIGYyZnNfZGVzdHJveV9zZWdtZW50X21hbmFnZXIKPiAgwqAtIGRlc3Ry
b3lfdmljdGltX3NlY21hcAo+ICDCoCA6IGt2ZnJlZShkaXJ0eV9pLT5waW5uZWRfc2VjbWFwKTsK
PiAgwqAgOiBrdmZyZWUoZGlydHlfaS0+dmljdGltX3NlY21hcCk7Cj4gCj4gVGhhbmtzLApPaCwg
SSBtaXNzZWQgdGhlIGVycm9yIGhhbmRsZXIgb2YgZjJmc19idWlsZF9zZWdtZW50X21hbmFnZXIs
IHdoaWNoIHdpbGwgCmZyZWUgdmFsaWQgcG9pbnRlciBhbmQgaWdub3JlIE5VTEwgcG9pbnRlci4g
SnVzdCBnZXQgcmlkIG9mIHRoaXMgcGF0Y2guCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVOT01FTTsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgZGlydHlfaS0+cGlubmVkX3Nl
Y21hcF9jbnQgPSAwOwo+PiDCoMKgwqDCoMKgIGRpcnR5X2ktPmVuYWJsZV9waW5fc2VjdGlvbiA9
IHRydWU7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
