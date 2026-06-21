Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7ybNBwIOGr2XAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 17:49:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AD6AB348
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 17:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=nFWTwA5s;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bRpfmVlr;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YZFoMYRU;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=qOjtKNE3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW/0V4ZZGVH5W3sGeFNs0JTRUGQ65gjvtgZrJUGx0F8=; b=nFWTwA5s8Bp/V5GXKQKmivnnc0
	L7t5Tro8rB2XcGzI+5M5VG7LVGq8RF9oiMJUzGKurYDxleTjFbbFtfD/E11nAuCDawMs1ad8YLu6K
	XILUz6YZCxnVtadpv5wr91QYDFBf6f9s3qQN5m2bNNLBFP9SKf3AzE51bpwGOP/i4T+s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbKQR-00063f-Bi;
	Sun, 21 Jun 2026 15:49:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wbKQD-00063L-51 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 15:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cl6FSEjCMBUH6rMNd4Cw8RGuuYj+Rx1dcV/aJ6ZOvlE=; b=bRpfmVlrtqZHKBmXpbEDsWkwJl
 IuHykWpPESOcWd+gGljty+WvfJMGQgq18agcTkfA0r+FxxQP1xPTTYgfG7anAvJ4W+qprs+4npVfy
 aem6yMVmKGpVerqfDCFn+VmFeXSKVPrpe2tQCpMEFr+mUrJ1Toz3zJGGuhdtcLbgW+8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cl6FSEjCMBUH6rMNd4Cw8RGuuYj+Rx1dcV/aJ6ZOvlE=; b=YZFoMYRU4Bwud2rRXHecLYgiqJ
 DRIebTYZjwdZn6HJuLVeDVVoudU2usaFNOiwIgtiRK70KMESIK9mtbFvGsjklkLoRWb3cwSCS6jv5
 5VVO/QoZrEs/8gcweGypGvlobxv+Mt7eT/v1TTfn2gdirWUlNd0mEijaGodHOGzVv0lE=;
Received: from mail-japaneastazolkn19013078.outbound.protection.outlook.com
 ([52.103.43.78] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbKQ5-0006HE-8h for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 15:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA+dFVXUxx+xq4BNawPt8TUR9M9mXnPPbWKOlPzsh+GD+tsqZ+EV/Ka8eBZA5C2C/s8nnetjIiK1KMIpJuEPfqlPEwAk74qovGphj/h3Gtpq5yQ2JrL1iAEM6agT65GB2tHorhz/8OZYG7jXCMwfFftbYhzVVL8FUznOHe5+xzstHMPIrisNzaV3p2dfX/0hjAHZF4WjcTmvnFB8CWDMy04rPSmdw+yESjGw4cmE5WpK8QQ9yBuOZIjpCRwpsFlDGoo/u7OwI1Lzc8L3ezZEXqyjO4e69Jd4+FOX/OOXjjquYEOdSmvr2Uin39op6mSdXQwyCw39l5piDbRptckzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl6FSEjCMBUH6rMNd4Cw8RGuuYj+Rx1dcV/aJ6ZOvlE=;
 b=JkQPmihD2pvpVB6ClSiAEZhoOb1YMIlD0fY/T7an5uSnVEuzt7QlOfujUPC5KLrgL4+uCkaVbM7Yi9o8t5rHZFkJbcIL/e+rVtYkBO6DyLofsJzwUeOOsJ16+WivXeN3jdWsBkcESVXxXiUAcNZGtK8veVAxXzibShcrMvk0HKQJERK/L4zVgS6ZsBU47L5fiW/rB4fBNOIWYnG37um29lObp4AYB2u9pJ3kOMXI5fgzio/a3d9cfbXNWQBgaWebuMTh+JoUfm/+URaQ/6vpNszgDQSmOl5zbJFvqx6kLbOzEuK+/wMIPD11CecgyKkTRqhHLglZyOKR+Cpfcja1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cl6FSEjCMBUH6rMNd4Cw8RGuuYj+Rx1dcV/aJ6ZOvlE=;
 b=qOjtKNE3+Yvy4imrda0rMjUScUxOXhXT08hXGhHQvlfLHDInEvUoPkRsIrkovITjbELqBWkeTjrdNVcyaICE5hcw9bWle4JS607nzimqp02LnlSBdGWNd+iQ51Ga2826rj7vTdE2CUtUw/J4uzsmA+d1cIPhFBthDbKwhzB7O84EF1jKSCfmjXeElN74MYtp2ISDqaLrzl2aUwUnxPDr7/iRF+NvfiJEJAzIy4NqVm/XmKb/K2eXC2aAmWEb48WISj5+nP0XFlOlFRogP+72h1RS7S90e3XGtuDT+EIvoug7WmjIle0rG/OOaLy1nk9Q8XYsXA6JTW0gdyvgOakn1Q==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by KL1PR02MB6499.apcprd02.prod.outlook.com (2603:1096:820:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Sun, 21 Jun
 2026 15:48:58 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 15:48:57 +0000
Message-ID: <SEZPR02MB5662F1A9AFD88BEA4624BC9699E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Sun, 21 Jun 2026 23:48:48 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
 <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
 <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <e876caa4-37bb-409c-98e5-2d051178d6db@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <e876caa4-37bb-409c-98e5-2d051178d6db@kernel.org>
X-ClientProxiedBy: TPYP295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::17) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <343d9a97-23a5-4d1b-88a2-e35a86d505e8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|KL1PR02MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e671ef4-6d88-4aa0-4187-08decfac99c8
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7042599007|8060799015|19110799012|6090799003|15080799012|23021999003|45011099003|8022599003|22091999003|24121999003|25010399006|5072599009|10035399007|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lsdnBxbmJqZ0I2VEp1SFVJV2p2Q3dxL2NxT1h1TTF0OTNuRVlqZldNTXZt?=
 =?utf-8?B?YjRzL0FFS0VYRXhMbWVZVld2TEZwSHc1Tmt3U3pPdXRpTVpXa1cvU2RRRmtY?=
 =?utf-8?B?d05pdXY0d202SHVuNGR1RHlpa0g2bHJOK2RzS3ZyTnA1WWkyeGxqcE9RS2xD?=
 =?utf-8?B?NkxldlI0L0QwNGhLYktnVENBSkd4dUQ3Qkw4Mm50cnRTUGxvejhlUFQ1QVMr?=
 =?utf-8?B?TmN2UjVEZURqZ1prNmMyWUc5OVF6S3dZaFF3cXZIYm85VzhzTEw3Zjg2eTJB?=
 =?utf-8?B?eE9RL3BuUE9aTmhCM1dJeVZuU2JFK3dCM1grWkpEd0lUZm95Y3Yxam4vMS80?=
 =?utf-8?B?SEsyVG93d1BobHEwYUU0R2VpK0dDRG1ERGtPYUdkZnZnajhmdTArOUNZdVhU?=
 =?utf-8?B?aFhwUDBjL1RJWXJpcmNiWENmeDgrT1NrQUNUdW0xd0xOdUhOTFd6NVY3dnl1?=
 =?utf-8?B?bGpXS3NtY0R6dWFGMDBpUjJZeXY2Mnh1c0VTMFJhalUrVVRsQ1ZKSDdpaXhO?=
 =?utf-8?B?b3YrMUNUNi93RXZYcmJjZlYvc3FEbUJwYkxoaDlDRkMrYUdMazB6UDhhTFI4?=
 =?utf-8?B?MVYzSUNjT0lpSWU2MGJ5TXpNQndXd3hRdER5WU4ySUdsTmE2U0c3cytzVlN5?=
 =?utf-8?B?WFRVZEtZRWhGNGVYQjhUTU05SFNTOGY5TWpnOE1ERFVLLzBjOHE0eEUvQ3BH?=
 =?utf-8?B?dkpqczFIczU5MFpGeVR0TCtVQ3Z4K0ErTUtaSEs4MXkyTndLV1NsU3FDZFlv?=
 =?utf-8?B?V2N1TEMxWDg4bzZUcDJrQlR3OFBpMndoNlVBTFBTd2FMbTZsckJJaFBJVjdN?=
 =?utf-8?B?VXI3Mm9CcU1DQW04TXRMNUpGQzFETllLZXNSc1gyQTZIdlZnR2crcEZDcTZz?=
 =?utf-8?B?VzBsLzZSelo1M1hpOUk1amx0UzNwV1J3ZWVFeUxIZDdFVDlyN3h1ejBab3pK?=
 =?utf-8?B?bC8yWXYxWlRCdm1MOWJ4OEtXL0Ric0hDZzJCSGx6SzIyOHdkVityRVdVK2ZZ?=
 =?utf-8?B?MGp5Ui9aMDhzRExBVHY2SEJHalFJZUl1VlREUFZnaUlzKzIxbzR6TVNCQkpU?=
 =?utf-8?B?RXIrQysyWTl6NkprVW5jWkxQNWVqVklQeFNKWDFiYTdNdkxvS3lSbCtmSnY4?=
 =?utf-8?B?Y0hINWhVSUNNTzd6a1h6NUYrTUw2SjJhVDF5bUx3V3ZWNm1oOE1FSWNTeHlK?=
 =?utf-8?B?ZDhrNTRRZ25MS3hJMXdiVFNONmtjNk4rd0pDSldaRnhZK0VMblZMdHhjTWhI?=
 =?utf-8?B?NEpRZzBUZ2tldWFFd3c2bmtPNUsyOFE3bzdraDZVSVZZSTQzV1gvdFFFM0ln?=
 =?utf-8?B?REdrTE9ycGtoczBhL0s1bnFMYVAzTTVHYzBTUnhxS055K2UzalFPd1NRZ01k?=
 =?utf-8?B?UDZJY3M3WUVDSFNDNTYvR24xWTJSNWhRdzl3UjdVOUJCbTV5NHhUdXFaVG9Z?=
 =?utf-8?B?eVVKdlpFODJ3UDJzQnFKQldtSUtUU3p5Tng0aVFRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVvLzEzeHJKZGg1MHdPZ0F3eTRaOGx1ZmJ3Mk5LZGJ1WFRZQzNjSlNEUnJy?=
 =?utf-8?B?T1FKeUQ1SWhhNVc4bk1oNEtDSVdjVTQ5K0hOVkE3ZGZybGUwbFZickt5aWwr?=
 =?utf-8?B?cjFVMElSeDNLWlhEQ1E2bWJpc1pSV2psa0pqdGJjV2ZZeW12N1daT25vR0Jz?=
 =?utf-8?B?MWQvajRlWVhHMUVSTXNEVUtTM3I1L0o5bWtJWGpuWlMwQ2R6TlV0a1liREFP?=
 =?utf-8?B?WlFLNjBmcWQzWERkanZpT3MvTTRwQWFFN1pGNzQ5ZkVOYXpOcnZpV1NKVDFM?=
 =?utf-8?B?T2NNcjM3ZmsrZDVRL0tnQjhaQzRlNHRNMEg2bURrekN3T01xRjlPS2ZCTmhH?=
 =?utf-8?B?YlhLa2Z0ODNKalR4Z0FhekNJT3RTdDRiVmdpT240NHkyV0pyQTVOOXlnWFZH?=
 =?utf-8?B?Ynhla2VwMTJCcysyaEZVN2ZHQ0FBQkRZNnJyY2tpekhnUjBQSG9UTnhheFhs?=
 =?utf-8?B?NlUrN3pBK2FTVzB4ZlRmdVpUUU51dmRKSi95Z2llblNUN283Yng0empOUDZ2?=
 =?utf-8?B?bUgwQmlUUDN3T3pkak96cDhuWXZUdDdkWmxvelFOOFZtSmJHS3FQQXQzUm5W?=
 =?utf-8?B?UW4wVE9BcVJkbUluSzV3OENWQWpWNUZ2R21GQWVzcHU4RFRxa2ZGbFpvaDZQ?=
 =?utf-8?B?NnZnSVBML2FVTXM4b25RRUxMSXJXUHdYM2kybGh1MUhXekJ0Q2tUazFIRTh5?=
 =?utf-8?B?RHRPZkYzVUQ3UjY5ZDF5VU1BWkhRWXpLOWRJR2I3TG5wbUxJRks1SzR6ellH?=
 =?utf-8?B?TFJ3dm1lcnhJSjhvSVIzZURLbFJQZXVFYzZJd3U2WmhPL2R4NEVOTjhLMDY0?=
 =?utf-8?B?RkpsN1M3cVVwT1VzK2c2bG9aMS9TUmpJNDNSSDFkMmNjUnJkMVN0bzNFT2cy?=
 =?utf-8?B?ckRFcUJGa2tsS0E0VkU5SGg2SzZaTklkaHF3dWUrd3YvdE9TbVFzQ2o1SW92?=
 =?utf-8?B?WWtpdUx4aCt3ejNGbzdnT0NMa2VvbEN0dC9HWFduWlhrdVdKcmtIOXlka0Zz?=
 =?utf-8?B?THl2Qmg5dDhmVFN1ZWw1YTl0MWljTzdtM2sxNW56NVZvTzRQVEdUQ2FidWF0?=
 =?utf-8?B?V2o2TjNJeEhBNFFRcHpPZnJZaGp5bEpmTGJXWE9LeHpKSzU4MzNiS1NtazhK?=
 =?utf-8?B?YkJlVXhrT2xlcHpNUUJBb1I0TFZ5enh6c2U1TExnbzBWRHZsbDM4aTlUTThu?=
 =?utf-8?B?YXhaT2VYWGZDcDhWZlRqZ3lNWDBiT0Rndk5VT0lqYWZ0ZTlrcVlndUFZOHp4?=
 =?utf-8?B?a3pqVS9iN0w4elM5aU16aTRLS3J6OTY2UTFlWVJ5QitpNk0wZHZnOUVPdXBq?=
 =?utf-8?B?WWVCOEFabjhFZktiY0JENGlyTW5ZTC9mbWZQa0FYQ0xUZFFNaUp5SG1UT1F5?=
 =?utf-8?B?bWF2ZlVvWE51Mmk3MVJkekgza2RkejJTN2p3WXhwdlBKYjdYZkFhaUFJZzNX?=
 =?utf-8?B?QVU0Vm9IOUJ5d3dHdFMrR2dxN0dMV2k4OE5FalJHcnJaUXJFYWI1SU9ESFFo?=
 =?utf-8?B?TERnSHAvSGRUSW9BSmtyUmFtd0RDUG02aU9OOVpYTldpYnIwcWdkZXRNK3Aw?=
 =?utf-8?B?OHdJU0FJZXVmZTBuUEdxQnVya0k2UGpMT0V6NjN5bWxiczRBTStKeDR3SVFp?=
 =?utf-8?B?K1dKRFZ1MVZnaXpZbnh4aUU2SHR1UVE0SFZsTTBmZGlraEtlaDVoUWsvS0k0?=
 =?utf-8?B?Um50eW9aeXNwb3ZlbUJsNWVrZ1VwTURSTmxTR1NxRytzYk83MncrSnN4SHo2?=
 =?utf-8?B?aGlWcEVpQnREYUxmWk5RR0w3eU4yNnVTYzZPM0hGQ1ltUjN5S2FqYmpHUk1C?=
 =?utf-8?B?N2ozYmVRZmZlV2daZUx3YkdMKy9LTC8vS2ZXRjNscGZaQXRvZ2RObEhCcTJC?=
 =?utf-8?B?MWNBZ3dQVEQ1eVZwbzgxZ2VDUW9vUGtkRlpaOUZIYUQ0d0h2aWdZRUpNbHRI?=
 =?utf-8?B?MitMcStJY2ZIUmNDbVpkU1BmaE1ENjhhR1cvdURSa3VIdGFjeXA3cFV5VTRz?=
 =?utf-8?Q?JjRZkrjxRsEPryk3iGHHZdKY4PZB7Q=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e671ef4-6d88-4aa0-4187-08decfac99c8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 15:48:57.5558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6499
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/26 11:31 AM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/19/26 22:34, Yongpeng Yang wrote: >> >> On 6/15/26 7:55 PM, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 6/12/26 19:58, Yongpeng Yang wrot [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [52.103.43.78 listed in list.dnswl.org]
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
 [52.103.43.78 listed in wl.mailspike.net]
X-Headers-End: 1wbKQ5-0006HE-8h
Subject: Re: [f2fs-dev] [PATCH RESEND 2/5] f2fs: only initialize largest
 extent without extent_node at inode init
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
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E06AD6AB348

T24gNi8yMC8yNiAxMTozMSBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiA2LzE5LzI2IDIyOjM0LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiA2LzE1LzI2
IDc6NTUgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiA2LzEy
LzI2IDE5OjU4LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcg
PHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Cj4+Pj4gVGhlIGxhcmdlc3QgZXh0ZW50IHRh
a2VzIGVmZmVjdCBkdXJpbmcgYm90aCByZWFkIG1hcHBpbmcgYW5kIHdyaXRlCj4+Pj4gbWFwcGlu
ZyBsb29rdXBzLCB3aGlsZSByZWFkIG1hcHBpbmcgZG9lcyBub3QgbmVlZCB0byBhY2Nlc3MgdGhl
Cj4+Pj4gZXh0ZW50X25vZGUuIEZvciB3cml0ZSBtYXBwaW5nLCB0aGUgY2FzZSB3aGVyZSB0aGUg
bGFyZ2VzdCBleHRlbnQgaXMKPj4+PiBub3QgaW4gdGhlIGV4dGVudCB0cmVlIGNhbiBhbHJlYWR5
IGJlIGhhbmRsZWQgYnkgdGhlIG1lcmdlIGxvZ2ljLCBhbmQKPj4+PiBjYXNlcyB0aGF0IGNhbm5v
dCBiZSBtZXJnZWQgZG8gbm90IHJlcXVpcmUgdGhlIGxhcmdlc3QgZXh0ZW50IHRvCj4+Pj4gcGFy
dGljaXBhdGUgZWl0aGVyLgo+Pj4+Cj4+Pj4gVGhlcmVmb3JlLCB0aGUgbGFyZ2VzdCBleHRlbnQg
ZG9lcyBub3QgbmVlZCB0byBpbml0aWFsaXplIGEKPj4+PiBjb3JyZXNwb25kaW5nIGV4dGVudF9u
b2RlLCByZWR1Y2luZyBtZW1vcnkgZm9vdHByaW50Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
WW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAg
ZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+Pj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTcgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hl
LmMKPj4+PiBpbmRleCBhYTM2OGEwMWIwMzUuLmY4ZDk0ZGI2MGRjNiAxMDA2NDQKPj4+PiAtLS0g
YS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUu
Ywo+Pj4+IEBAIC00MTAsMTAgKzQxMCw4IEBAIHN0YXRpYyB2b2lkIF9fZHJvcF9sYXJnZXN0X2V4
dGVudChzdHJ1Y3QgCj4+Pj4gZXh0ZW50X3RyZWUgKmV0LAo+Pj4+IMKgIHZvaWQgZjJmc19pbml0
X3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvIAo+Pj4+
ICppZm9saW8pCj4+Pj4gwqAgewo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpID0gRjJGU19JX1NCKGlub2RlKTsKPj4+PiAtwqDCoMKgIHN0cnVjdCBleHRlbnRfdHJlZV9p
bmZvICpldGkgPSAmc2JpLT5leHRlbnRfdHJlZVtFWF9SRUFEXTsKPj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBmMmZzX2V4dGVudCAqaV9leHQgPSAmRjJGU19JTk9ERShpZm9saW8pLT5pX2V4dDsKPj4+
PiDCoMKgwqDCoMKgIHN0cnVjdCBleHRlbnRfdHJlZSAqZXQ7Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3Qg
ZXh0ZW50X25vZGUgKmVuOwo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGV4dGVudF9pbmZvIGVpID0g
ezB9Owo+Pj4+IMKgwqDCoMKgwqAgaWYgKCFfX21heV9leHRlbnRfdHJlZShpbm9kZSwgRVhfUkVB
RCkpIHsKPj4+PiBAQCAtNDM1LDIxICs0MzMsNyBAQCB2b2lkIGYyZnNfaW5pdF9yZWFkX2V4dGVu
dF90cmVlKHN0cnVjdCBpbm9kZSAKPj4+PiAqaW5vZGUsIHN0cnVjdCBmb2xpbyAqaWZvbGlvKQo+
Pj4+IMKgwqDCoMKgwqAgaWYgKGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpIHx8ICFlaS5sZW4p
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcDsKPj4+PiAtwqDCoMKgIGlmIChJU19E
RVZJQ0VfQUxJQVNJTkcoaW5vZGUpKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0
ID0gZWk7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcDsKPj4+PiAtwqDCoMKgIH0KPj4+
PiAtCj4+Pj4gLcKgwqDCoCBlbiA9IF9fYXR0YWNoX2V4dGVudF9ub2RlKHNiaSwgZXQsICZlaSwg
TlVMTCwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZldC0+cm9vdC5yYl9y
b290LnJiX25vZGUsIHRydWUpOwo+Pj4+IC3CoMKgwqAgaWYgKGVuKSB7Cj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGV0LT5sYXJnZXN0ID0gZW4tPmVpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBldC0+Y2Fj
aGVkX2VuID0gZW47Cj4+Pj4gLQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmV0aS0+
ZXh0ZW50X2xvY2spOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZlbi0+bGlz
dCwgJmV0aS0+ZXh0ZW50X2xpc3QpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygm
ZXRpLT5leHRlbnRfbG9jayk7Cj4+Pj4gLcKgwqDCoCB9Cj4+Pj4gK8KgwqDCoCBldC0+bGFyZ2Vz
dCA9IGVpOwo+Pj4KPj4+IFByZXZpb3VzbHksIHdlIGNhbiBzcGxpdCBsYXJnZXN0IGV4dGVudCBu
b2RlIHRvIHR3byBpZiB3ZSBwdW5jaGVkIGl0LCAKPj4+IG5vdwo+Pj4gd2UgY2FuIG5vdD8gSUlV
Qy4KPj4KPj4gUHJpb3IgdG8gdGhpcyBjaGFuZ2UsIHRoZSBsYXJnZXN0IGV4dGVudCBjb3VsZCBh
bHNvIGJlIHNocnVuaywgc28gdGhlCj4+IHNldCBvZiBzY2VuYXJpb3MgdGhhdCBuZWVkIGhhbmRs
aW5nIGR1cmluZyBwdW5jaCByZW1haW5zIGlkZW50aWNhbAo+PiBiZWZvcmUgYW5kIGFmdGVyIHRo
ZSBtb2RpZmljYXRpb24uCj4+Cj4+IEZvciB0aGUgbGFyZ2VzdCBleHRlbnQsIGl0IG9ubHkgbmVl
ZHMgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIG1hcHBpbmcKPj4gaW5mb3JtYXRpb24gaXQgcmVjb3Jk
cyBzdGF5cyBjb25zaXN0ZW50IHdpdGggdGhlIG1hcHBpbmdzIHRyYWNrZWQgaW4gdGhlCj4+IGV4
dGVudCB0cmVlIGFuZCBtdWx0aS1sZXZlbCBpbmRpcmVjdCBpbmRpY2VzLiBUaGUgcHVuY2ggb3Bl
cmF0aW9uIGRvZXMKPj4gbm90IGJyZWFrIHRoaXMgY29uc2lzdGVuY3kuIE1vcmVvdmVyLCB0aGUg
bGFyZ2VzdCBleHRlbnQgaXMgbm90IHJlcXVpcmVkCj4+IHRvIGJlIHRoZSBsb25nZXN0IGV4dGVu
dCBhbW9uZyBhbGwgZW50cmllcyBpbiB0aGUgZXh0ZW50IHRyZWUuIEl0IG1lcmVseQo+PiBuZWVk
cyB0byBtYXRjaCB0aGUgbWFwcGluZ3Mgc3RvcmVkIGluIG11bHRpLWxldmVsIGluZGlyZWN0IGlu
ZGljZXMgYW5kCj4+IGJlIG5vIHNtYWxsZXIgdGhhbiB0aGUgbWF4aW11bSBleHRlbnQgcHJlc2Vu
dCBpbiB0aGUgZXh0ZW50IHRyZWUuCj4gCj4gV2hhdCBJIG1lYW50IGlzOiBlLmcuIHByZXZpb3Vz
bHksIGlmIGxhcmdlc3QgZXh0ZW50IGlzIDEwMjQsIHB1bmNoaW5nIGluIAo+IHRoZQo+IG1pZGRs
ZSBvZiB0aGUgZXh0ZW50IHdpbGwgbWFrZSBpdCBiZWluZyBzcGxpdCB0byB0d28gZXh0ZW50cyAo
NTEyLCA1MTEpIGluCj4gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UoKS4KPiAKPiBJZiB3ZSBk
byBub3QgYWRkIGxhcmdlc3QgZXh0ZW50IG5vZGUgaW50byByYiB0cmVlIGluIAo+IGYyZnNfaW5p
dF9yZWFkX2V4dGVudF90cmVlKCksCj4gdGhlbiB3ZSBtYXkgaGFzIG5vIGNoYW5jZSB0byBrZWVw
IHNtYWxsLXNpemVkKDUxMSkgZXh0ZW50IGluIGFib3ZlIHB1bmNoIAo+IHNjZW5hcmlvLAo+IGNh
biB5b3UgdmVyaWZ5IHRoYXQ/CgpZZXMsIHRoZSA1MTEtYmxvY2sgbWFwcGluZyB3aWxsIGJlIGRy
b3BwZWQuIEkgY29uc2lkZXJlZCB0aGlzIGNhc2UgCmVhcmxpZXI6IHdoZW4gdGhlIG5ld2x5IGlu
c2VydGVkIG1hcHBpbmcgb3ZlcmxhcHMgd2l0aCBvciBhZGphY2VudCB3aXRoIAp0aGUgbGFyZ2Vz
dCBleHRlbnQsIHdlIHJlaW5zZXJ0IHRoZSBsYXJnZXN0IGV4dGVudCBiYWNrIGludG8gdGhlIGV4
dGVudCAKdHJlZS4gV2l0aCB0aGlzIGxvZ2ljLCB0aGUgNTExLWJsb2NrIHNwbGl0IGV4dGVudCB3
aWxsIHJlbWFpbiBwcmVzZW50IGluIAp0aGUgZXh0ZW50IHRyZWUuIEluc3RlYWQgb2YgcGVyZm9y
bWluZyBwdW5jaCBoYW5kbGluZyBvbiB0aGUgbGFyZ2VzdCAKZXh0ZW50LCB3ZSBjYW4gc2ltcGx5
IGRyb3AgaXQgZGlyZWN0bHkuCkhvd2V2ZXIsIHRoaXMgYXBwcm9hY2ggZG9lcyBub3Qgd29yayB3
ZWxsIGZvciB1cGRhdGVzIHRhcmdldGluZyB0aGUgdGFpbCAKb2YgdGhlIG9yaWdpbmFsIGV4dGVu
dC4gRm9yIGluc3RhbmNlLCBwdW5jaCAxMDI0IGludG8gMTAyMiBhbmQgMSBmb3IgCm92ZXJ3cml0
ZSBjYXNlLCB3aGljaCB3aWxsIGFsc28gYWxsb2Mgb25lIG1vcmUgZXh0ZW50X25vZGUuCgpUaGFu
a3MKWW9uZ3BlbmcsCgo+IAo+IFRoYW5rcywKPiAKPj4KPj4gVGhhbmtzCj4+IFlvbmdwZW5nLAo+
Pgo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4gwqAgc2tpcDoKPj4+PiDCoMKgwqDCoMKgIC8q
IExldCdzIGRyb3AsIGlmIGNoZWNrcG9pbnQgZ290IGNvcnJ1cHRlZC4gKi8KPj4+PiDCoMKgwqDC
oMKgIGlmIChmMmZzX2NwX2Vycm9yKHNiaSkpIHsKPj4+Cj4+Pgo+Pj4KPj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKPj4KPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
