Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E90829E4C57
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2024 03:36:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJ1jC-0001dx-Lf;
	Thu, 05 Dec 2024 02:36:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tJ1jB-0001dh-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 02:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X7Sk49/O/g3L+5QtFmqu6OH5J8Z6FOI5Ea3YB4wDoBs=; b=INO5y08urFDjHBnXM8K/Tl36wv
 1i33Q41Wtn/+duvcZBgRp4JK3cM62Hl/oCsWNGnlAyZkvDLB4S7I+5Wx7waOCD54u3tW+3DwgrSE6
 4HNwVF9oQgIBkmaXeh9nSByFaJTVJT5o4WyDr5R7fl7dzFDcxpPv0QtZCLc6uSJb9R6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X7Sk49/O/g3L+5QtFmqu6OH5J8Z6FOI5Ea3YB4wDoBs=; b=UF9O+4GSCp+1IYkDh8DLTN/4+Q
 DaarLkZN//caOJSgg4H43x4GNGTRRVlmneLSLoLm5cZIaFjGIan3Bpt4m5WFh1B0rZX4WnVeby7k0
 OPxktvkA618fgWukFEkDxMJgwx1V49gp0v+tHh0L/AQYL+7M29sv7xDVzbohXFiZvzfI=;
Received: from mail-tyzapc01on2058.outbound.protection.outlook.com
 ([40.107.117.58] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJ1jA-0006iM-29 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 02:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEAM7hFuErNb49cY8Zex3KuzeN0bqWfFKLvGSccM+fmr/+vhLOcVnOE8elj9q9QCuYfMHCSQLZjJ2uKjgPtS6NJ6vMIXwtcXQ8p/z97rdJV2s1p7L4LZ0w0cN2Y9ISXpG6v16hpsLNxpH/H2R/mFj5PyLS5uFoR3bbSgq4icuqmisi6ojifZLP2Q90tFqD+LvxmtioWHHbZ9IHR8QTc4Ha0dYvE4W56/ujlf2g0tgIy7942QyiGZYs/WIiXhWxniVhCNU92dyD9YIuiLuTRz/MdVKb1/0YHmNZMc+1uWEcS4qd/xvBs9tOYwh4vPF2n5DHRjd0RQ4uDxlZCuSdBi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Sk49/O/g3L+5QtFmqu6OH5J8Z6FOI5Ea3YB4wDoBs=;
 b=Ydfo29et44VoRZF3UCXdbVvR6mBv54z4jl5o+F4kzt+k0wvl6SY8NkaPpN3YrBtMs/jDRdUy+km63R/hAPnthyFx36NMQyh2UPLXXtnnTuTNHPpwcenrPSNRokZg82S74gjjkRylE6B6CbPhiDuVeMeJ1UQZZuxhc0C9RxOUjl5JoedYqlPInPTkpVNB8TvscMhUMUsz0EffVY96L6fucry78X2fWQZTFxylNhiCRXVGdhlHjZI3TcTMjUX6tXabnXASa8xsH66h6pMutTpU/uZQfBrLaiCltaDbxg2krU7eCLm/HzYI9Q7nbA9HuTaEXKF42GSLWuOxEmAER7fHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Sk49/O/g3L+5QtFmqu6OH5J8Z6FOI5Ea3YB4wDoBs=;
 b=PJMRYTEqzgOJGgltTvFvRjhJmDuHoHzf0n2ADHafjo39ubA3cK+oiVTrLTtHUcA1KoBU1I68/gFzYbGtTce1fq83aDkYk4Tf1xtsS1gvxO/KuQLKcxmujb5WlH72JrbidbsO2HkGkNkO/3dXUN5hmVyAFvQVpwkD2rN723UlMbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6669.apcprd02.prod.outlook.com (2603:1096:405:19::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 02:02:22 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 02:02:21 +0000
Message-ID: <502ae396-ae82-44d6-b08d-617e9e9c4092@oppo.com>
Date: Thu, 5 Dec 2024 10:02:18 +0800
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241204122317.3042137-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20241204122317.3042137-1-wangzijie1@honor.com>
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a15599-4931-41de-c1c9-08dd14d0daf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGRQWVhvNXdTaVd4ZU1QRkowMmdtMThJalUrMVF1UHJ1MFljNEhMVmQzVzlD?=
 =?utf-8?B?aXIxelYycjJ1T2ltNnA4L3cvWjVHdXRpRGIydUMrcmtIWjVBT0ZRVng3ajdu?=
 =?utf-8?B?c2tHK1BwNktuc084SkRYVWJMazF1d0svVlhaUGErZ1pveTk5eTdMb0NjVmRF?=
 =?utf-8?B?STQzS2NnZGVKSC91SW9seFFMa0JKdGR3azB2Y1pXekpHQWt6MVZOQ0FIL2Fh?=
 =?utf-8?B?dHBjaGhscXZ6UUh5UUhuYXVvQVpvWWFaaUVacDY0THBYOHdWcHFUbHU1blhj?=
 =?utf-8?B?d2diTDZLUlRlMjJVZzJFUUhlM0xWWkZwSEdsQ2tIZStQUk9UOXFXVEtCcGM0?=
 =?utf-8?B?MFNrdTRFVGhzUjQxZmIzc0l4Sm9CaTNhbTRwdktuY3U0SGRrVzNZdXBqdjRt?=
 =?utf-8?B?L0JqSkM4dTBycVIyUlZtNnF1YUZKTkRmYlFESUFlUk90RUxYQjhvaXpWT2Nl?=
 =?utf-8?B?L0JxbHp1R3Fra1pJZ0lPYk16UHI0LzJXZnRGV215WkJqMGVEVTFncDl4RTQr?=
 =?utf-8?B?QldxbndNWUxYd01DU2lHS0pBOXdRZmRlU0lVR2hWSzVTRXdCY0ppRmUyU1dL?=
 =?utf-8?B?WmVNWDQxQUtzc1FLbGIrd29CZW1oT2Q5UmNqUkJJbHhUYWUwck5qRHpOK2tv?=
 =?utf-8?B?U0hQbFRvSGVLVUhsU3BtR3ZHSlVIZi9VTS8wdENXa1NsU3BVSGd2ckJ5NnNL?=
 =?utf-8?B?dThuTjZZMDBoOHdmT01ITFJjeDF2ajVId0pLdTZiYmZvTk5nWlJsOWw4Z3Vr?=
 =?utf-8?B?Z2xBTXA1NFI5dThkWTA4cjA0WTJaWEFhR2tzYmtPT1c0TTRLRnJTMS81Ui85?=
 =?utf-8?B?UUhkcGVEbkFyOENETjhpdnBhRzdveVk0eWpFWEdob0c1aWtvQU5JNmpzRWZX?=
 =?utf-8?B?N0NnWWpJVlovU2lyRDA3d1lpRy85YzFFZkdTWEQrcXFxQ3Z1UTZvakMzM3dR?=
 =?utf-8?B?V20zdGNzVGpIU3M5eGhhcy94SjNxWlBXSkN2NlBzUm1HQWkxVm4vUkFsTXFu?=
 =?utf-8?B?czkwMEk2SmgyaTkxZTM5WDE1K20rTDNnR2tTcHU5WWVVSDhXcHlTT2RSQmJ5?=
 =?utf-8?B?UHZQTzlNMkJ4OG9tMVorSXpjME9jZnd5SENKSThMUmRFZVNiNnp1WUlYUjNn?=
 =?utf-8?B?S0cxMGlBK0ZwajVkVGwrV21ldXh5NjZzaDJDQTFKT1htUll5c0RudDBKN1hs?=
 =?utf-8?B?Y0dYOXY2MWlQWmMwV3MxV3hqQnE3cmdHbFRvSFpjNXVmbk1IU0FQRHd6Tktp?=
 =?utf-8?B?aHBraU8vUlpaMDlUZVJ4ZFRmTS92ZmZLUkhEdUVSOS9LZW16U3g5SmprWjd6?=
 =?utf-8?B?ODJZLzNQcGdLQk41WGxoVS9wT1RHcXRzV01vZU04SC93NFhjY25vb1hOdFZ2?=
 =?utf-8?B?cVdISnJvOGNGSzM3eGMyTlc4QkRFVmgzTHE2WXdCVmV5UWhnUE5kRUNHOWsx?=
 =?utf-8?B?d0REUHBRaTlzWVYramRwaTNJYVdyRFE4OG9RVUE5Ujk0Umd5MmlSVk1JcSt2?=
 =?utf-8?B?V3hSUFdrRVUwRjVQcHV2aHpLY1BnNDZNQ29uVVk2TG9maU9iWURwanhJSkFM?=
 =?utf-8?B?S1lNOE5UNW5YZ013N1lSTGUxZ0IrcEdlWWQvcUhZQVBCZUdudllFY2NBTksr?=
 =?utf-8?B?V2RscUlMNTJjLzBobWhPaVlqT3E2OU83OXBvbTM3cE9IQUo4K1BQNzI2bzVP?=
 =?utf-8?B?aitNTFgwWlBtMDFjWW9GOUtSdmZUd0JHc0hJUGt2ZzBrQ25ubGEyTjRkMW1W?=
 =?utf-8?B?QytWTjBuY3NEZ1NWRWpyUHFXOXJ2RGxPNWtXWmdqOWFqUXRJQ2RxYXl1Vi9u?=
 =?utf-8?B?dHdGMG8va2xiUkM1andQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU9TYmw0d2V2REVZNGtuak9QbEhVZXVBb0lwVnZ5VDZIMXcvZ1l1czZONDZi?=
 =?utf-8?B?OE4vZzkxa1Q4WnE5OTdZZ0VqQURJOXhIbGFrWk1nU2xKQmsyV2ViLzZvcVBu?=
 =?utf-8?B?VkZSS0gwWElrUjBDNmRtUVVEcnA3RlUyd3VFVjJGaEx4TzU4YWJ6U1U4dXkz?=
 =?utf-8?B?cTNTNmFrczg2dUViYjllYU5rbWx2Y015d0d3cllyVytIY1R2T01HbW9keS9M?=
 =?utf-8?B?aHBVVlFiM3BLcDNHUGlLdlRIcjZSZEppNExGOHJkSDY0ZE1sdzc4aWwyRmVS?=
 =?utf-8?B?dWJ6VGJWWktnbXZHUk92OCtMVDlKWkszdFNKRXpVUnUzYUxsK0pZR09nNUJ4?=
 =?utf-8?B?QVcrSDh3azdxT1BrVms2MUZvQjRJVTNSejNCd3VVaFRuVm1vSDk3THN2bEdn?=
 =?utf-8?B?UGNKL2VvN1hzNEdUUUJpUlZrOEZTNUx0QjdmbENidk43c1ZpWFBtRjNvaHFj?=
 =?utf-8?B?UVprcWF1UWZidmdWaS9TajlVWGFnSVpWeFRpZTR0ZUFMYnVOOSswMktUQm1G?=
 =?utf-8?B?SHRsRndHYllmbXY3V016UGUxSXFiQ3V2c2R6Z3lDOGtvY0RuMUV6YlFzZ1FE?=
 =?utf-8?B?WFQxNmtWMFVHOUxwa3BrQ1k1Rk9sTmdPamlNSXgyVUdrME1Tb08xdm5DaXZK?=
 =?utf-8?B?c0ZGdEJlbWtYbTVyL3dLMzlYOVRyR1pVQlZiV0dsSk5wUVJaZVFJR3RNUnV1?=
 =?utf-8?B?ZmRHZUdSRWRyRlJkbnlCYmhLSWRwSFJXOW5DZWluSm0zSUhETU9oMG4raHor?=
 =?utf-8?B?blZqTm1vdnBqenNrYkowSDJ5b2xtZk1IZ2p3N2ZyY1MwckZabHhESm5vRVpW?=
 =?utf-8?B?QWN2M0hFdmFjOWhLY0ErK2I2QXFhWVEwdHp5Y3lDdDBOVVFtelEvbFdVVHVZ?=
 =?utf-8?B?eElVaTY2S0QxT0gxZnljdmkzV2pqeXhQQjBoeHVid2NibWQ2Z24yZCtwZzU5?=
 =?utf-8?B?U3BXZUZJVlc2RlhmbkpOK3NiazJKZnlQblNWUjdSU2xZZFdtTlA1NE9MdjBj?=
 =?utf-8?B?K3BiaGJZakZDaUZlK2oyTm8wcGJkYklhTUJGYXYzRDdtaE5rbk1vamZia1g1?=
 =?utf-8?B?ajJ2UkloeEN2T056dXpMSzhMZjc0c1NZUndkVDZ1cGhHbmQwYUtGQVFCYzF5?=
 =?utf-8?B?TThKZW1YMjBiV2ZwQ2dhVU1DL2wycy9DREdJY0RJOGVrYkZiOFZzOERFck9M?=
 =?utf-8?B?RkNZWE52Ujk0VGdwU21yTHBid1k5aWs3cVc2ZjUzWTZrcjVpWlBxT3A3Z2ds?=
 =?utf-8?B?NGNLKzF5cGdzNDhnQXZKZGxRNWZZcThEaDBPOW5PZUJ0a0dJTmdqZ3RndTVS?=
 =?utf-8?B?K2c5Y3htbkx5TGR4aHRieDBuSCs2OVhCTG5vWXhpV2pXbEd2dEw0TkthSXpG?=
 =?utf-8?B?U2IzZjQ2NGhqWWJGN1J6ckc4aE81b25FZG53R3dlQUZZOEpaWTV5TmU0cStF?=
 =?utf-8?B?UEZkdkx6T2UyQzRzSS9OYVpQRXlZM1FtdSs3Yk5EVWlzckt1TmFjeU5LZmNs?=
 =?utf-8?B?NmJDaEptVzBiS2QwRk9Wb1NXNFZaVi80dUVtUGJVdGQ3MmhMbUsxY3NJMVB2?=
 =?utf-8?B?ZkFHMzdHRk9XaThxckFzbndLNXB5bktiTWplWEZ0NCtxclJHQVRmQmNQUzZx?=
 =?utf-8?B?dEg1UnpGNGxDSjA5UG1VczhXMjYzUkFkcnptcVFRSTFIdHVpejNmVnJoMXIy?=
 =?utf-8?B?dkVZa0R2S0RpM0xnS3VWYzNLb1RqMEsxb3BNbGl0dnBFK1cvWVZ6T2ttbW5k?=
 =?utf-8?B?dVlhOHNnOEpUMGFreTRNK0FZNzkwY3QwM3lxU2lkcnBWQ1Bsa2txN2R0Vkdu?=
 =?utf-8?B?czVwY05SYXpOU2gwR0l5RmR4WU93aHFUVVJIeEdSeUp0UWU3UDRDNFlKaDVZ?=
 =?utf-8?B?aVIrT0d0WW5pVkZFMHg3cEJKSHkvVHRmV3NjZjBRN3QyM3FLQ1FPTWJLZkFt?=
 =?utf-8?B?RWFuQURBVWNodHhmMko3SU5nZHAyeUJVcmJpaDM3V2k4UE9CVUk0ZUc3V2t3?=
 =?utf-8?B?TlRkYlZZUWFxSnRock5IOGN3QnZZUDlIN2JyeFYrQXRWVnR3Wmt6ZDdFZnNH?=
 =?utf-8?B?OTUrU0Y4Y0ViRzhFL08xVWk2VHBNUCs0TitxeFg3NDdrMHJDZG9vQTBMWXpn?=
 =?utf-8?Q?R52VC2Hp+flf6+m095a5yQk3a?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a15599-4931-41de-c1c9-08dd14d0daf6
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 02:02:21.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GU48oeEnF4IWne15kWiB227dTzhlqbW81bZMb0BgQ31PZaLHYgyLTrA4c6H122ps3e17K5CXQINmBbBNd5hU3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6669
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/4 20:23, wangzijie wrote: > When we check inode
 which just has inline xattr data, we copy > inline xattr data from inode,
 check it(maybe fix it) and copy > it again to inode. We can check a [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.58 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.58 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.58 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tJ1jA-0006iM-29
Subject: Re: [f2fs-dev] f2fs-tools: Check and fix inline xattr inplace
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/12/4 20:23, wangzijie wrote:
> When we check inode which just has inline xattr data, we copy
> inline xattr data from inode, check it(maybe fix it) and copy
> it again to inode. We can check and fix xattr inplace for this
> kind of inode to reduce memcpy times.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>   fsck/fsck.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index aa3fb97..fd8b082 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -840,11 +840,18 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>   	struct f2fs_xattr_entry *ent;
>   	__u32 xattr_size = XATTR_SIZE(&inode->i);
>   	bool need_fix = false;
> +	bool has_xattr_node = false;
> +	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
>   
>   	if (xattr_size == 0)
>   		return 0;
>   
> -	xattr = read_all_xattrs(sbi, inode, false);
> +	if (xattr_size <= inline_xattr_size(&inode->i) && !xnid)
Hi, zijie,

I propose to change the behavors of read_all_xattrs and write_all_xattrs, and to add a
new free_xattrs.

* read_all_xattrs checks whether xnid exist. If it's not, return inline_xattr directly
   without alloc and memcpy.
* write_all_xattrs checks whether inline_xattr and new txattr_addr have the same address
   to avoid copying back.
* free_xattrs checks whether inline_xattr and new txattr_addr have the same address to
   free xattr buffer properly.

In this way, all instances where {read|write}_all_xattrs are called can avoid unnecessary
memory alloc and copy. free_xattrs(xattrs) should be used instead of free(xattrs).

thanks,
shengyong

> +		xattr = inline_xattr_addr(&inode->i);
> +	else {
> +		xattr = read_all_xattrs(sbi, inode, false);
> +		has_xattr_node = true;
> +	}
>   	ASSERT(xattr);
>   
>   	last_base_addr = (void *)xattr + xattr_size;
> @@ -867,12 +874,15 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>   	}
>   	if (need_fix && c.fix_on) {
>   		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
> -		write_all_xattrs(sbi, inode, xattr_size, xattr);
> +		if (has_xattr_node) {
> +			write_all_xattrs(sbi, inode, xattr_size, xattr);
> +			free(xattr);
> +		}
>   		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
> -		free(xattr);
>   		return 1;
>   	}
> -	free(xattr);
> +	if (has_xattr_node)
> +		free(xattr);
>   	return 0;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
