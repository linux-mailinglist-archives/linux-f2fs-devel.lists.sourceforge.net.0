Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E13899ECE5D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 15:14:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLNU3-0004XQ-Lu;
	Wed, 11 Dec 2024 14:14:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tLNU2-0004XH-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 14:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slO5nFeW8wbchcAzkmlewbYcsFUMA++9BqMJh25WyAE=; b=hEmP+yQEm1tL+AHm9Ww5Zy5Fam
 afSyzItfse/ZYSf2xDbo57wBGmmfWDvjaAJ0THeWOW3agx2XdEznywqjnD10IPDdNt6AWHMoq1aev
 s6q+F9BUzQFvawVWmmbv43xBA/2EUggKtQ5eSBx1aerbAXBRsRszGDC/T+dc6P3Z72vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slO5nFeW8wbchcAzkmlewbYcsFUMA++9BqMJh25WyAE=; b=cDofsXtNwme7I4GGKRNEVM09bU
 KcmWKNe0JRdknGsBj8rg5xU31l5nCjn0ai0jY785EmSRsoqq/+btGW3p/WbN9i+kTY4g2Cwx17YbF
 dEzMo1SXCRP16z0EWhBkk2Dps1TFK9RftgseBqyUH1bHpjHMaT56I3jxwyoJRV4QSRa4=;
Received: from mail-tyzapc01on2062.outbound.protection.outlook.com
 ([40.107.117.62] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLNU1-0001WS-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 14:14:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3+fYs6RWr27M8p8/RNwNbjwA2W5c9boYGO2CMeeggvBUf2OoF7c+PgO/ZIT4iELzPLN3S5Tmj1pwsgugYsG/ma/o57n8IaH0APRPIFf1dsUfCOWC6RrJXO1GOQf5ooeUyLowt+PPp6DmQyVA1dbk0yFEtVsaWkjysslX8jB/PFHa7CRB27W+WmfwyXpeOyFt+XnpuqwuvHVUoCIzVoLTqThIgTW/OfNaspgtwk2ePTlOIuuFa+cGha98bZ8g6JV0wt+2jycHFw0dPSlU0ftmSRI6Sim/3ngjM3FpEOh9P+0dJYBgWs7CxfMRMIVeVWBhvRRv3h9d8L8Wd2ZCfmniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slO5nFeW8wbchcAzkmlewbYcsFUMA++9BqMJh25WyAE=;
 b=qLXnsmUT6sGp5Q3U8LjkqiuSlo6MWysL2S94VcKnNoo4elKAB+Z4p0tFPPXifPQwwXAkOITqJc0wS8utbi/7XY8EEyfnsLlKSriK2jt8g4wc5JEkuJfKBqDBrP5nYfRrqE0WWKOGmIHODxzYnnu4jzt0wXFzOf3T1HYPIKoFz4GkRMCbSAeZ8phpBYXZslcByLh/hNwNEvK7ufPQfCJOpcKm6w+F4CnJ8YFkZMAe7jykEKZtxmChWkVGOuESGyNbZ2yo4ERIbMQg9etF4GBfTqvfqjBXgaJjK5pCmAnplgfn6NQa/EfxnBnPlS9BXU9MjaJ3zUOuUMATAwbqMH67KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slO5nFeW8wbchcAzkmlewbYcsFUMA++9BqMJh25WyAE=;
 b=hYg1KDu+ifUls9H6qYQ8vwmUKNaS+A5vkgdzNi384EYXAr8O4XlaTN/sRRA5TVy+98ayyzeMxk6E84zPv9E+pRNOPTdSewH+7waWHt2DCfoxXrE5xCFhBx6lCCwq3UjhHZVz+zGi6TFkmP8gkhFZhsCpg0oGPbyLaqZkdd/TnVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SG2PR02MB6023.apcprd02.prod.outlook.com (2603:1096:4:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 14:14:19 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 14:14:18 +0000
Message-ID: <c7febf9d-f743-475f-8473-0d391814eb07@oppo.com>
Date: Wed, 11 Dec 2024 22:14:15 +0800
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241211001404.4120186-1-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20241211001404.4120186-1-weilongping@oppo.com>
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SG2PR02MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f687668-29ce-4f96-b1fc-08dd19ee19b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzhKUHUvZ0tUL2JHTHNtZkNuYVdKMFB3YmxCdmRFWitGa01HK2kzYkQ2THF2?=
 =?utf-8?B?dGNrVW1EYnNOT0NGOU5hbU9VQWZibEl1T3BSVUVwaTZoTGhJN2xFYVZSSUhE?=
 =?utf-8?B?UDU2SnZzemZycElHL3FnazQ5L1ZMaUkwdzZTL2lQQUNSQnY3YkZQT2E3VHMv?=
 =?utf-8?B?ZXpjWndyWmlxQmNmTVlKenp5a1JZQ1hRb09DU3kyK0x3bnk3cUcxVnIwanRm?=
 =?utf-8?B?eElUR1FMYWw3RDlMcWF3b1JCenFWOWxybFNSOGw3MFRPeTI2dXhjTkNGS0l3?=
 =?utf-8?B?OG9GT0hueTl0RlNPQjlTTnJ3aEJERTdmMzFBczgzeWNDRktCN3NqQ3FwNzFi?=
 =?utf-8?B?R2lWcWdvMjJodFZXRVI4ZE1qVy9vN3JMS01lTTBZWDUvRGh2bjlPM2pjN001?=
 =?utf-8?B?aytPbzY1d3V5V2lUQ2xWaUpMbUN5dGtOSFZCblNjeVFkUmdPdXNadHV0VTJ3?=
 =?utf-8?B?QnRxSHQveEJrTGYrNEgzNWdpM3hkbGJMSG5wKzJxczlBMmI4bGtzZmdLeW95?=
 =?utf-8?B?M25QQ1JUeG4rNXRzR1B6M04rRnNPMHRQNFA2dTdOS3dndjhKL0NiOWxsZmV4?=
 =?utf-8?B?K0dJSnhZUFRKNzlWUVNFbnpqU1hNUDZTbGhaVzlsdU9YWldBZlBOMnlaR081?=
 =?utf-8?B?NWZrSi9TODdhRFd4UDR0RUE2UzNKSGhOWFZYSVV4RVdQaFdncmJRU1hOS0hu?=
 =?utf-8?B?azF3d2ZpN2FhZitKWVk3NEVaczBmdUoyR3JCQXVYYk0wUGlOMHlERHpNWjZz?=
 =?utf-8?B?V3dFZUNGU3FabFJ3SmErdVRxcFoyWi85WGJ1MS9qTm5POUpEUTdkZVBSekwv?=
 =?utf-8?B?WC9wQlpDSEl1aFNrUnZlTjg4amNMTzgwN0Zvczc2TXRzK3hLc2xoUFJJNnR5?=
 =?utf-8?B?TXd1REd2T1dsMHBkT3h4OENQbHdOeDlJeWh1OExWYjdoS3RqTjljakt0SjNN?=
 =?utf-8?B?amQ0K2NFOFdnYTh6OHlHeDVvd0ozN2s5djhQWUUwcHJNM0FENXFrTFJKQVdU?=
 =?utf-8?B?eEtIbTJwNmROU2xKVUpaZ3FYZVN1Nzd6a3JCQ1J5S2JsVS9rNFp0NGREMjNs?=
 =?utf-8?B?d1pPUmdiRVh1ZDJ2WS8zWkV0RHlFNDA2QnMvSVhybGtLa0NYTjF6bWVIVGJC?=
 =?utf-8?B?N2d1SzFkMEc0V0N4RFVNLzRYcUw0OHlNYW5pbWN5anpPNlBJcHVSUStFWG1x?=
 =?utf-8?B?TlkwWkhKZURob3poOVN2SVArdUJkanZFY1lEWHFSTnZRVWxmcSt2cWJLTGgr?=
 =?utf-8?B?enRxL0V0L1ZEWjBQRXBKWFpzT2VUcHcyM2pSTFd0bEJMd0dyREh2dDZZamVw?=
 =?utf-8?B?ZmNha2tRQlM4UjlEWVFGZkRaWVZETndneEE4MHlwTWFvcWhUUlNnV3g1WEg5?=
 =?utf-8?B?VlVkbit6NXpBZGtHL3dKQUt5SlhVdTNBTFJVSFZRd1MwMTJ2bkQ3TUVtOHJJ?=
 =?utf-8?B?N242emEzSkt4bHJaZlhKL0JCQkkvN0tPZmx5cG9YdTNxNGFQN3F4b1J4d3dG?=
 =?utf-8?B?MTVmUU5uai84c1NyZlVUQ0xMVEVGWFZOTDNYZXFFK1Byclh0T3YrczJDcitn?=
 =?utf-8?B?MmdYRUdhNzJwZ1NXY3U4NWlCa2FOVkJqWlZqNFMyaUIwVklBOHVGeVdFL2NC?=
 =?utf-8?B?YUs3M2wyalh2Zzc5RE9XZld1VndJZkpTdmk3TlMrRzk2WkcrUTUyUU0yQ2ky?=
 =?utf-8?B?Tm9oSDQ3U2gxTHhVZWpUNVA4bU9VVzZLVUp3cit6U0JkZnFqalg3cXZvaWM2?=
 =?utf-8?B?N3BaWS9ad0RMOEFrRnhvTG95WXl2aGtxTm5rQTdjcHd1NVBGSThpTGxKRnpz?=
 =?utf-8?B?cmhuT01IaUUxUmh6YzVGZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW5ucjBPZXNRWkZKUGIybndxSkY1MlEwdmtycG5SdWRVa1h4dUVhOTRta1Ux?=
 =?utf-8?B?L1ZmTG50TVIrYk5tUUlnZmhvUGtXV21ObHFJQ2N3KzlIbjZFQkMvaUlNY3NY?=
 =?utf-8?B?YXFMZUszazgyeWZrWWdlY3I1bFBzTkVsSFF4ZktVTk9VaWpoSmduT2orRW80?=
 =?utf-8?B?U0NVTzM1MmpRNjQwRVJYdFVuRjQ3OVZzUTBEQmNSU2xmQXAxRVlkTTZsU1Vs?=
 =?utf-8?B?L0pXeTVodkpOV0dXT1l5YXlySUk1SUZrWVFWdlMrUEpPSEtnSVF4aVc4djU0?=
 =?utf-8?B?YlVYTGdGYkNLVGUzWmQvNTZRa3NqWmJ4VHhMOXU1TkR3UVovTU5kYXN1Rlkx?=
 =?utf-8?B?a2tQOTJHQWs2SzJRRUgzdzdta01xYnRZNFZwSERpNlJpRlgwbnExUlMwVndO?=
 =?utf-8?B?Q3k0bWlkc1ZKcVhRQzYyWng0SkFhelpTSEVXeG14LzBCMk0vQ3lCZExMOEJI?=
 =?utf-8?B?Um9xT1hYb1FOOUoxSVAvZkVjSTJqNG84ckh2UWJYSlNIMFl2Tk0xNDVFMGU2?=
 =?utf-8?B?eTlqdU5TMExjU3pDaWRZVWlDd3NmR3dZQUR4UTd3RDREYzVZRTAzVVNDc3Jp?=
 =?utf-8?B?VXRJVys3VVJVdmFjSkk0Qk5BRGV5V243ZmxIbnczeEV0TjFhVTYvVlNvWWJY?=
 =?utf-8?B?dU5jT2pJWEF2Z0d0UWlpMDk5ZWxuRlhCSVVCQVpwazJlaFBOZ25rVFdRK2t1?=
 =?utf-8?B?MnE1NjB2RHNUakZjd01ZWHF3RVlBMG5EWUtWK205YkFCK0FsSWs0by9TTVdq?=
 =?utf-8?B?VWdDREV4MWZibmF1UGdvV3h4OW9CV1VqUmEwSVZocys0KzVvanRhM2M2aGxj?=
 =?utf-8?B?K1hoczkrYlYrcTVFSWJyWjk5MjZVYnRVTnRRTU0xQ3NXL1pqRVVZc21FR1My?=
 =?utf-8?B?eWdIRU5ybWFDNlNwWHNYb3BkL0o4YnpEbjlZNTlIUTFna3VZSDFpV3dIaEQ3?=
 =?utf-8?B?MzJxNWlDSDFsdkhaVFpmdEYwR0ZMeHhKZzlwMzhYN0VUbmlrb296cjhpcnkw?=
 =?utf-8?B?NVBtckM2NWppaTh0a0E5cDg3YStxRmsyaDBNVTlmdFdZNGxRUFdKd1pyRmln?=
 =?utf-8?B?RERJWGdQWExsc0gxak0yQ2hwVnRZUFo0NG8yM2Rzc2RyaXNKblJKUzByd2xD?=
 =?utf-8?B?dkYxbC9wY25KYXp0b0d4b0dUdkdGZDhhY1NRcldMeFJkRStlQWg1MHJwRVRi?=
 =?utf-8?B?NjhZdGl4aHVoR3Y1MStSUFF5eVFKQ2YzZkVSeC83VDdtRGFqYzk0SmFpcDRy?=
 =?utf-8?B?cEJWMUhISktYVUdDNnU3UEo4Qjk0SHNoSVovaEFaWWNTc2NKU0xCWUVhc0Zt?=
 =?utf-8?B?SlJBK3A5ZnF0Ui9TelcvcndDNlVRbDQrWEdoV3IyRWJJSFBpR3FYbTRMWHp0?=
 =?utf-8?B?VWYzR25vQUhDOE1xM2x0U3JIUS8yb1hvMCtlV0xFS1YwUitvR1ZYajRES1Vu?=
 =?utf-8?B?RUY5cGdrTmtTVVF3NEFFOTdYb2NJZlp6dFdyYWR4TnV2WUdvNHYxQTRYbmVG?=
 =?utf-8?B?VmdubllCazBLZ2JEOEd6bFlMa0x2SzZRVytCVzRXL1Y5ZzJTaTFLa2R6dzlz?=
 =?utf-8?B?Um14R3k2Qk5xV2NEZDBtTWRaNlYxOGh2V1lueWxSNGptZzJ1VkJlMnVVd3JS?=
 =?utf-8?B?ZmJxSHVSbTZPdk9hMEJjK0Q4UGVJRjhWbFhtbHhqWEtIVHREZGcrQUFxWkRV?=
 =?utf-8?B?T0pHbEF0cHlDbFI3NFNaMWdaTHZYbDZKdnVteExDa0ZubForLzN0WGY1Z3dM?=
 =?utf-8?B?dHVwZXI0d1BFOER3am1ER0dheU9rMDMzWmJNVFZLaHAyVDduUlNPVHRpM0li?=
 =?utf-8?B?alpZM0NGdXh0MEt6ZFQ4eDlMdzhCZVpUcXNSdFBqYlk1UkhJS3p6Z2V0N3JW?=
 =?utf-8?B?VW0zL3loWTk1Q0t4cmo1N3lTdDdJckVNeUZEUFZNaDZZRWhhWnJaMkd6dHF1?=
 =?utf-8?B?MkNyZWhJZ3c3MTJEY2kyaDUzOXJKcll3YVkzdmJWZE5nU0FzWmJHM2RmajJW?=
 =?utf-8?B?OVRIa2lzdjBPMThZUkdGeFhBSDdjYmxPM0ZQQ1JNQkJWb2NWMS9RL1Jmb3pq?=
 =?utf-8?B?S3RqSG4wRmJxVUpFT1AvMEJkdHJXUXRhQmg4bERUc1FzOHdtWE1JUjM5VWM0?=
 =?utf-8?Q?SDkSBSLKIYaPNw9iWzau1baz2?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f687668-29ce-4f96-b1fc-08dd19ee19b3
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 14:14:18.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md5BIFiMIzb4QuvvEW7Yokc5uX7d3Ogl37BxKqDPhXmirOCppaU85HlBPTtL7+9fCvXeMbR6ui2S5cGePof/tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB6023
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/11 8:14, LongPing Wei wrote: > This patch wants
 to reduce the number of system calls to improve performance. > pread and
 pwrite will only be used when the target platform support them. > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.62 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.62 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.62 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tLNU1-0001WS-Hb
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs-tools: use pread and pwrite when
 they are available.
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
Cc: panglu2022@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/12/11 8:14, LongPing Wei wrote:
> This patch wants to reduce the number of system calls to improve performance.
> pread and pwrite will only be used when the target platform support them.
> 
> Signed-off-by: LongPing Wei <weilongping@oppo.com>

Reviewed-by: Sheng Yong <shengyong@oppo.com>

thanks,
shengyong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
