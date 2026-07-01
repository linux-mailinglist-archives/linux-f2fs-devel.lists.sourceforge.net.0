Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5AgKBw8TRWoJ6goAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 15:15:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B46EDF24
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 15:15:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B39li85o;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="Bu/TUWP5";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NnwXnAtd;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=ogKQpNRJ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZJ0C542pPdxtIGuPSiroZ1vdMWsUVnm7HiQAjJrEuk=; b=B39li85oBZilOYtSWk1riGe4lS
	vCMH9nUw7yxf8/JAEfdZPrCwV+KG/4QlO1G8+qdS1HxtsD8NkFH25Cw9oowQUyi3oSmqQmDLnXK1m
	lNy+UseayF+6qcZ71rzdMsi2YOsYA2VMJjN4tJOEQ/kSvy+F/0XwsxjrLGqObcBQtDsE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weun3-0001nG-Mx;
	Wed, 01 Jul 2026 13:15:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1weun2-0001n9-22 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 13:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hv4qvojcRSWW65eh0/Y+kviMJ4g5sgc6dLIa4qIVu9I=; b=Bu/TUWP53UmFeFAhbbZm46CWsZ
 klwPTevxCCkW88snZPH5WofA35Lp/VxWhBMbuw9DdWSDM71KYvQ8F+8LGiD3GBXSV4faVNP9ti84t
 XAsr4+I1GPi9goli3bpmLH0LoJsx0Tdc+qKAa5CbLeZlvuqOGd35QNv/mczcwC09JQTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hv4qvojcRSWW65eh0/Y+kviMJ4g5sgc6dLIa4qIVu9I=; b=NnwXnAtdXSAHLYz0BG/ZvGqPTA
 /8JCGfYN4SkxfGYcNAFe0APaZGow2Rjhukoo8GoST44PuB64NA9w3BBRg+Si3MCeaCkEquBn8SDDd
 DSH0W2SHhlll33U9M3K2aGFRzfi1mBy+ijTgIEdpAgQvVzOcJ4eslX6aZX20BoZ+thdo=;
Received: from mail-japaneastazolkn19013087.outbound.protection.outlook.com
 ([52.103.43.87] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weumy-0000qF-08 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 13:15:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdJfH3abmcUl3H+F8dg+XIG/opIWlcyQYLVmFy8zVTvF68ZOP4i1tZys8guAonA20xaCqw0v3sbYyZvwyad2DSXXsM+4yN9dbXoMukY0aOxTCw5iIs23gh82HBvQvIvcF73xvCLTRryPMsxzQNMQ39gwJjvdjYpQm7SusQo5wrQzPZUUk1yJLazaLb9eYo8HnRX0yDKoBLVxB/XHS8XtNXyz3nkZyfiYUvOH80Dh6bBz6COs6Z4DyMz2x3tzo6qoDI2TP9kfYY6Da6AQYqb6Yzt1noDTLtFc/w5IjD0BiBoYs9H6zE01Kr8FWP9VNFr5eMc7lGVYWkNC4ICUUt4sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv4qvojcRSWW65eh0/Y+kviMJ4g5sgc6dLIa4qIVu9I=;
 b=gD26DUhrWkpvpguHNvaqgx6M9bKtnShAjgQ0Xq9JxEjxuelVBJaIv/2K0+goB+1qYVG7HTPrHj1rgOIzfqv8fQM1+7/6GfYM2dtI3kbDr4yhW68m99WDWpKhb/R7PACz8+YxXHKxDAYV4kItTtTT07e2Ze1taR2M+NdhRuJzRnr5bsm0pAwxQdBMTzIbptjajFhgkTAlbvY8RtJSo/H5BdDZg4S6aDoC/s0fp40/cahKUHMEQT9fCP+WUOGg7l8VUHDTeQME5NyIsmM93EqniWSwpQmp6EdH6e+PMLgDMuyC5NSHUrYW7FTo7Wa2LBkeKuvV7gT9DnBpObeWE+dzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv4qvojcRSWW65eh0/Y+kviMJ4g5sgc6dLIa4qIVu9I=;
 b=ogKQpNRJ8QGchU33EHIvmDqP2MWq7c8/0G3hirwoUfA8z2K2k+DIwysW9CuDc+4CwUSm8/zgMx/m0TMPJgp+EFobTdQszpl4RpJN2fIbwhu1TaN0pGYXtoKamRQfbJGceQUrowqUtruY/MLy1iYFF2zQavSVuyYiEPB5diLa7KM7RdTsd3kcY7wM7sJ3lWnNgGVf182IKtCdGovTmr4hLSDrINr99CIfXserA35TNVzobxVApMkqLVMuDPzLSPzAej8O0l8ef+ZWoFFfMJPvmBPmFxPwvqYBQS6ba3/csnTMa3obdxlMCq+vezSGvrut0ZOJEK7JKY2j5y2nL6SI2g==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by JH0PR02MB7029.apcprd02.prod.outlook.com (2603:1096:990:4e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:15:26 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 13:15:25 +0000
Message-ID: <SEZPR02MB5662D50D613E638A3FC67F9999F62@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Wed, 1 Jul 2026 21:15:19 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
 <7862f9d0-278f-4bf8-ae6b-9413dc52f841@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <7862f9d0-278f-4bf8-ae6b-9413dc52f841@kernel.org>
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <44b6ac6e-5565-4b8e-a4e0-652b89271dc1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|JH0PR02MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 5735f591-6392-4dc6-1770-08ded772cee5
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799012|23021999003|5072599009|22091999003|7042599007|24121999003|25010399006|41001999006|12121999013|45011099003|8060799015|19110799012|51005399006|6090799003|3412199025|440099028|40105399003|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3ZyQ0xUTC8xenRCUzhQWGlCekxzWW1sOFE1MElLdlIyZjFxMGR1TlhxaDU0?=
 =?utf-8?B?TnVaYVdMaUhkSHllYWkvdElJeDF0TFdUbFNBL1B6ODJKd1Rzc0JZRVF5OFVa?=
 =?utf-8?B?elBJSFJ6Wi9ONW4vd2FraGl2VWQydkZsbHRVcXkzR2NpRTNXTU9nRUZIRHVZ?=
 =?utf-8?B?Yi9TdU9xYmVZd0RKY05RRWNPZ0E2ZFdKUjEzdDdwZzdyc3Q1bnVsd291cHc1?=
 =?utf-8?B?KzR1d2Q3MnpnamlxZmYzWnloLzRsR1g1Uk5sZWxuU2c1NlFMVHdXdzl6MDlm?=
 =?utf-8?B?dG5yYk9YRUJ1NmtMMGhsZ2ZydVNnKzhTcUFtK0ozMHlPU2p5bnhNZ2NjaXNT?=
 =?utf-8?B?V1YzM2NydnpRMnU5UTBFRUhTVC9Zbys2S2NrUjduaEs5Q2hIaDd4NW9KMG9s?=
 =?utf-8?B?Yml0Y1VrbnNHd25Nc3ltZGlvcTl4Yk9XbnpDZVoyS3h1RW82OS9DcjlnRG12?=
 =?utf-8?B?REpNaHVzSTJCSVVTZlBkWVhEbXhTYmM3enpSOXZXVlpYRUZYU0k4UkUyQU51?=
 =?utf-8?B?eThyV3BXdEJkR0xQNFBtdjNHSVEzZnFvMTJHT1ZWR3orOUlaSTF2K0VzYUxT?=
 =?utf-8?B?bmpCWTI2ZjZMYUxzTUQ1YTk5Y0NRWVhwQ1lRQjNaYUovcGFnY0lSd2hYWUdG?=
 =?utf-8?B?TzZVczZUSDducy83QnlJNEE4Ym5haXBmTS82QzlubERyUFozRkliZktDZ1E3?=
 =?utf-8?B?Rk5LZzBBNkRwcmVRb1dvMUQwRFhKc1Zld2cvc3I2ZFNRZmtsaFYxbFhPbUZT?=
 =?utf-8?B?clU4UlZNbUtnb0ZzT01DeTI2WnFTUGh3VmFWNnhOZ0cydVptazVwVTBoekRQ?=
 =?utf-8?B?NUx3S09tWnNyVTZnQ2IzeFduczN1bmdOV1RZWjIwQ0RtK3hIcDN0SzdnY0Fq?=
 =?utf-8?B?TnAvUnUxQzlYbU1CV2FUNmxxRmNHNW1EN2FzeG0xTTl5Unova083WFhQSThE?=
 =?utf-8?B?M3RZMkdkZFQwWE8va2p0QmkzZWI2MjEvY2hTbjRMNjZ3NG54d2RJYXljWkho?=
 =?utf-8?B?ZERBQWE0dG92WFZraC9VL0ZtT1dOMUp5WW1hTFF6a0h4eHp3RWlLNmMya2tZ?=
 =?utf-8?B?Sm1WZW5zR0NaNXpKdldCaDJWNlRPaUd1Z0NuaUZScm1Fd1dhOWZxSGtucEtk?=
 =?utf-8?B?RUhtaDVoK3JmSEYzRGxPR2tQeVVUUVRLQTdjVU9uZ0RYU0I5a0grM2N6Vm03?=
 =?utf-8?B?ZklEdnkrSEdDS1BQamlCbGpWTDVRaU5maXVoTjlNSTBYNk53RkxGS2hMeklm?=
 =?utf-8?B?UG1nandiaTM3LzE4RDBTck52NkwwQlQrNVNCVmVURnd3R0dnNFVxQVFpRkR3?=
 =?utf-8?B?bUx4Qm5jVkNxb3JQbENHaWdsZi9JVmhPZHpvaDRTSi9tSGlJMzl1RWpIWElw?=
 =?utf-8?B?VmU5R0lLL0owWWEvNzBSZk15Y1FzSGVFUGVTQjdIcmNwbVQzYzh4N0xGVVRZ?=
 =?utf-8?B?Ry9FNHIyVHFWaVgyN3FITGQ0ODAzUWxQclprTjRqVHpTVnp4a25ERWd1NVM4?=
 =?utf-8?B?VU9aVUVoczgwS2F1NkpsSWlqdm01L25UWEhWbHNjSEppU2ExTEwzR3JCM0ZZ?=
 =?utf-8?Q?DS40DPrz6NrzumnOshXLsvptU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YksrYzk2MmlUV2J4RDY5WlJQK2wxWGZGRmVleDBudXFFcTI4Sjl1UlZXendo?=
 =?utf-8?B?eDlSdDdYMjhEeXdhamhzR0ZCTmJGdlIvTnhvWWZGWFdnSUhHRnNEK3F2cDNF?=
 =?utf-8?B?MGFPcTBOUmg3Q1ltYkU1QVRyVEh6d3hxbVRUR0xmVmxGVjRmbVdjUUxpWTNF?=
 =?utf-8?B?YURWbkNUQ3VOYittOHE4d1B6TlVCL2VkaVJUUnNPTGxLWlFyQ1hQaldBRW8r?=
 =?utf-8?B?eXZQNVl2Zm8rZEo0Z2xFMWt0UVk2WU9xRGtkdFl0OEFtcUs1MmNhN2lCT2pL?=
 =?utf-8?B?ZitZN3VOTm9SNGRCNG9Wd3NpdGhOYWw1bExhdk51TzNTTVVOS29RWnpmVTBU?=
 =?utf-8?B?QTBnNHl0VjVzcHRwQ2tvQjR6bHNLNGhwYnd4TklyV253Vm9EQWw0K1JWTzVV?=
 =?utf-8?B?bWR3YzhYMVVPQ3pXRGhDL1VkdG5XMTNXWUhvRHM0djc0dEc0dFhQdFk1anl6?=
 =?utf-8?B?dnhYV2U3TDVMUy93NDZNV1JEMmovK2szbTJQTVIvbDZpNm8wL0w3OVgxV2pZ?=
 =?utf-8?B?WlYyYW05YzV3UW1wdjhNaUJaRnR0VjMxMUR3SllXSTFqNjVXU2t2Rk10YW1T?=
 =?utf-8?B?VkFTelhqdGovWENkbS9SRXVQSmplUzY1d3hJelBvR3E2bFU3ZndtNGZHSWJ2?=
 =?utf-8?B?QkFTQmI5M1dHZ0wxNE1rM2F1TmlleElwUDNid2RWR0xrS1lEbnJVOFlmWFZs?=
 =?utf-8?B?bGRDWnFoanBEbGIvVkZoNEgzM3FOcjlVQkkyemdhaCtDWlVzVWFTUnJRKzUr?=
 =?utf-8?B?Rm5QSDY0dGFmYWc5MXVFMWJhbG96WFgyVkQyZnoxbkxyT2lUeDBmQXpmNmwv?=
 =?utf-8?B?bFNvQjg2dUw4ZndwZzF0V09kNVlRQTZLTENrWENNTlJHclBqclRKNEQveWxY?=
 =?utf-8?B?QVByWElFTkovemNHcXc3cDNmYlIzbjdaUy8zWUd5UGV3R3VTdWE2dXJObm5P?=
 =?utf-8?B?Q0lHcGU3VTJ6NkhUTUQzMVVYQm8veGQwYzdlUUFXdlhFNG9BemQyelRLUkJ0?=
 =?utf-8?B?b091THE5K2JLUitGdlpWdnBLSU8xVXFoSmt6NlJhYlh5emVUVEVtN2hMTEVC?=
 =?utf-8?B?YmFRbTNvSk1HUytNY3ZXSmdZajBleDZWemp3TTh6dXVvVU9BMDV3c2diSHVJ?=
 =?utf-8?B?eHM1UFU5LzRkZU5Gc0FPSTNWNTBERmF4dEpIbWp5eGFqeDhwTFZLbG5OdkJ4?=
 =?utf-8?B?VzhqVWFrREFyc3dQY1BQakFQVk1rN0NEaXoyalI5OC9HYXlyRmpvWFE4TWtQ?=
 =?utf-8?B?ZGdITktxcTdNM01hMENIeTVNWjdCZUhwVEE3dEJsQzJZRWZBeEkyRXR1UlpB?=
 =?utf-8?B?UFpkK2wyajJnL090dkk0akZDekdjUllQQzViZ291RnFDSU1yeGxQZ0ZkM3hK?=
 =?utf-8?B?Rk1SYUl0MnpsNVgxVi9ZbHFaSzhJb2ppbDNQK3JORUl1TkNyNWdXcUJZaVlT?=
 =?utf-8?B?bXFnSEE0VWNRRE4vNFYydloxUUd4Q1N5ck5IM2IrLzVhQm1tY1dyVitCdlRI?=
 =?utf-8?B?ZDdIQzNtVUxHeER4Z1NsVXErVU0wdFovUWFIK3dyeXFJa004YTNnd1Yxd1lT?=
 =?utf-8?B?T2lYN1dPdDU3T1N1TFZwbFlrWkZTK1g4b0QvMHM1dmpSRDJ3UG5mUW5XeEMw?=
 =?utf-8?B?bHNHR1JldkRDR2VaQkc3a3hGVDB5UXFSb0FLSzdBaHpmSmZHdGpKcER0RkUz?=
 =?utf-8?B?YklPSU1ORmN2b1VMbE9YWVJIc1N5aFlRRzNTM1lya2xyUWFBWHcyMFdqajZZ?=
 =?utf-8?B?VjJCS2s0SVhib1kzekIzYnlxTzBQeExhYWxiZTJJZjV2cXVDRGI0VkxjU09K?=
 =?utf-8?B?R2RXcVFlZlUzczZpYzA3bHdYZEc3SnIzdjZ1S1plWkdEeDMrY2FWSlM0aE9p?=
 =?utf-8?B?RVVLVERaUkFqMWRGMlJ2SnZCcC9KaXBPQ1JOcTFLdDdnbDNrTC9jcjVZR2FG?=
 =?utf-8?Q?V2RUJRpCH1A=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5735f591-6392-4dc6-1770-08ded772cee5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:15:25.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7029
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/26 16:34, Chao Yu via Linux-f2fs-devel wrote: > Sorry
 for the delay. > > On 5/29/26 16:56, Yongpeng Yang wrote: >> From: Yongpeng
 Yang >> >> Changes since v1: >> - Introduce tracepoints for [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.87 listed in wl.mailspike.net]
X-Headers-End: 1weumy-0000qF-08
Subject: Re: [f2fs-dev] [RFC PATCH v2 0/5] f2fs: introduce inline extent
 mapping for inode data blocks
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_MUA_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime,xiaomi.com:email,SEZPR02MB5662.apcprd02.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 296B46EDF24

On 6/25/26 16:34, Chao Yu via Linux-f2fs-devel wrote:
> Sorry for the delay.
> 
> On 5/29/26 16:56, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> Changes since v1:
>> - Introduce tracepoints for f2fs_iext_update_data_blkaddr and
>>   f2fs_iext_lookup_blkaddr to aid debugging (new patch 5/5).
>> - Bypass inline extent lookup for F2FS_GET_BLOCK_PRECACHE to ensure all
>>   mappings are loaded into the read extent cache.
>> - Unify the check for fofs exceeding direct_blocks range to use
>>   "fofs >= direct_blocks" consistently.
>> - Remove support for caching NULL_ADDR in inline extent area. If a fofs
>>   within [0, direct_blocks) is not found in inline extent, it implies
>>   NULL_ADDR. This simplifies merge and split logic.
>> - Fix f2fs_iext_enable_inline_extent to use PTR_ERR instead of -ENOMEM.
>> - Change f2fs_iext_convert_to_inline_extent return type to bool.
>> - Add benchmark data covering 4K/8K/32K/64K random read.
>> - Rename __is_extent_mergeable to __is_iextent_mergeable to avoid
>>   naming collision with extent cache code.
>> - Remove inode parameter from f2fs_iext_sanity_check (always NULL).
>> - Reduce #ifdef CONFIG_F2FS_INLINE_EXTENT nesting in node.c.
>> - Code style fixes to comply with kernel coding style.
>>
>> This patchset introduces an inline extent mapping mechanism for f2fs.
>> Instead of storing individual block addresses in the inode's data block
>> address area (i_addr[]), this feature packs contiguous block ranges into
>> compact extent entries, significantly reducing the number of entries
>> needed and enabling faster block address lookups via binary search.
>>
>> The inline extent format is identified by magic numbers in the inode
>> data area and is transparent to the rest of f2fs -- when the extent
>> area is full or cannot represent the mapping efficiently, it
>> automatically converts back to the direct block address format.
>>
>> Patch 1: Preparatory refactoring -- replace raw pointer arithmetic
>>          with f2fs_data_blkaddr() to abstract block address access.
>> Patch 2: Core implementation -- data structures, extent operations
>>          (lookup, insert, merge, split, truncate), format conversion,
>>          and integration with f2fs data/node paths.
>> Patch 3: ioctl interface -- allow per-file enable/disable of inline
>>          extent format via F2FS_EXTENT_FL flag.
>> Patch 4: sysfs interface -- runtime enable/disable toggle and file
>>          extension list for automatic inline extent activation.
>> Patch 5: Tracepoints for inline extent lookup and update operations.
>>
>> Test setup and results:
>> =======================
>>
>> Platform: Xiaomi smartphone, UFS 4.0 storage
>>
>>   # Enable inline extent
>>   echo 1 > /sys/fs/f2fs/<dev>/inline_extent_enable
>>   echo 'mp4' > /sys/fs/f2fs/<dev>/inline_extent_extension_list
>>
>>   # Prepare data: write with 4K offset stride to create fragmented
>>   # extents, then overwrite sequentially so inline extent can cache
>>   # all mappings in compact form.
>>   fio --name=test --filename=data.mp4 --rw=write:4k --bs=64M \
>>       --size=8G --ioengine=libaio --direct=1
>>   sync
>>   fio --name=test --filename=data.mp4 --rw=write --bs=64M \
>>       --size=8G --ioengine=libaio --direct=1
>>   sync
>>   echo 3 > /proc/sys/vm/drop_caches
>>
>>   # Benchmark: random buffered read, 1GB total IO
>>   fio --name=buffer-read --ioengine=libaio --rw=randread --bs=$BS \
>>       --size=8G --io_size=1G --numjobs=1 --filename=data.mp4
>>
>> Results (random read bandwidth, MiB/s):
>> +---------------------------------------------------+
>> | BS     | baseline | inline ext | improvement      |
>> |--------+----------+------------+------------------|
>> | 4K     | 35       | 36         | +2.5%            |
>> | 8K     | 60       | 62         | +3%              |
>> | 32K    | 179      | 191        | +6.8%            |
>> | 64K    | 284      | 321        | +13%             |
>> +---------------------------------------------------+
>>
>> The improvement comes from eliminating direct/indirect node page reads
>> during block address lookup -- all mappings are stored directly in
>> the inode page and found via O(log n) binary search.
>>
>> Yongpeng Yang (5):
>>   f2fs: replace raw dnode pointer arithmetic with f2fs_data_blkaddr()
>>   f2fs: introduce inline extent mapping for inode data blocks
>>   f2fs: support setting inline extent flag via ioctl
>>   f2fs: add sysfs interface for inline extent management
>>   f2fs: introduce tracepoints for inline extent lookup and update
>>
>>  fs/f2fs/Kconfig             |  18 +
>>  fs/f2fs/Makefile            |   1 +
>>  fs/f2fs/data.c              | 157 ++++++-
>>  fs/f2fs/debug.c             |   4 +
>>  fs/f2fs/dir.c               |   9 +
>>  fs/f2fs/f2fs.h              |  23 +-
>>  fs/f2fs/file.c              |  93 +++-
>>  fs/f2fs/iextent.c           | 873 ++++++++++++++++++++++++++++++++++++
>>  fs/f2fs/iextent.h           | 187 ++++++++
>>  fs/f2fs/inline.c            |   7 +
>>  fs/f2fs/namei.c             |  48 ++
>>  fs/f2fs/node.c              |  66 ++-
>>  fs/f2fs/node.h              |   4 +
>>  fs/f2fs/recovery.c          |  17 +
>>  fs/f2fs/super.c             |  13 +
>>  fs/f2fs/sysfs.c             |  52 +++
>>  include/trace/events/f2fs.h |  79 ++++
>>  17 files changed, 1635 insertions(+), 16 deletions(-)
> 
> It's quite a large number of change (including f2fs-tools change) to support
> this new feature, it causes the performance price ratio a little bit low.
> 
> About inode disk layout, as we discuss offline, maybe we can add 4 or 8 ...
> extents in i_extra_attr area of f2fs_inode structure, it can reduce the
> change line and code complex, however, not sure how will it affect the
> benefits.

If we change it this way, it can indeed reduce the complexity of both
f2fs-tools and the kernel:

1. We no longer need to handle format conversion. This removes roughly
200+ lines of code and also eliminates the need for 1 conversion folio.
2. It also simplifies the mapping logic, since we no longer need to
handle the case where inode extents cannot cover the direct block region.

With this patchset, Android typically have 287 extents. After this
change, the number of extents becomes much smaller. However, even if the
direct blocks are highly contiguous, they will no longer be cached, so
the performance benefit will be reduced. The actual performance gain
depends on file contiguity. For example, with files allocated in
contiguous 2 MB chunks, if inline extent array length is 8, a single
inode can still cover approximately 19 MB of mappings. Small files can
also benefit from this optimization.

If we reuse the i_extra_attr area, inline extents have to depend on the
F2FS_EXTRA_ATTR bit in struct {struct f2fs_inode}->i_inline, because the
size of the i_extra area is zero unless this flag is set.

Would it make sense to redefine the semantics of i_extra_isize so that
it is meaningful not only when F2FS_EXTRA_ATTR is set, but also when the
F2FS_EXTENT_FL bit in struct {struct f2fs_inode}->i_flags is set?

Then struct f2fs_inode could be organized as follows:

struct f2fs_inode {
	/*not change*/
	struct f2fs_extent i_ext;
	union {
		struct {
			__le16 i_extra_isize;
			/*not change*/
			__le32 i_extra_end[0];
			struct f2fs_extent i_inline_extents[F2FS_IEXT_ARRAY_SIZE];
		} __packed;
		/* F2FS_EXTRA_ATTR not set and F2FS_EXTENT_FL set */
		struct {
			__le16 i_extra_isize;
			struct f2fs_extent i_inline_extents[F2FS_IEXT_ARRAY_SIZE];
		} __packed;

		__le32 i_addr[DEF_ADDRS_PER_INODE];
	};
	__le32 i_nid[DEF_NIDS_PER_INODE];
} __packed;

Thanks
Yongpeng,

> 
> To Jaegeuk, please share your thoughts on this feature.
> 
> Thanks,
> 
>>  create mode 100644 fs/f2fs/iextent.c
>>  create mode 100644 fs/f2fs/iextent.h
>>
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
