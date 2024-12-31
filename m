Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE059FED5A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2024 07:52:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tSW74-0007JP-Ht;
	Tue, 31 Dec 2024 06:52:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tSW73-0007JD-B7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Dec 2024 06:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5m95T/1YpqSbXtlDOzDeoHOb6cJz+VIK6mQ3HT9Kc0=; b=UKLdZa/zFURLEQ+2YJkcqqEBXh
 WQGm1EzUysHbgnPdrab2dbESCGWAlXLh5ZmUMwKNqT07zsX+AjuX0i3OskYAPkWnT6XrxsuEqgie6
 //RL5UPDhow5VgcliXyo9oJlaco75e7oFNAmDk4fZPK6UPgMMDMwYfbqRoWGxzKahdY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:CC:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o5m95T/1YpqSbXtlDOzDeoHOb6cJz+VIK6mQ3HT9Kc0=; b=FRZ974JkFoj+yObq94HrntMKX7
 D7nmJXUH7eT/fdCPGDw0xLypZ5MvociJkfmQZiO9XQoNGKC+HR7qm4y/nKNTrtdr/X8INI3+JmuNZ
 bIcbo58HB3Qn3oP45d3PUNvhqpfE4M0jjX0TZKNm4r7TyUNwhtpsVPGTndYFA0lYRVyI=;
Received: from mail-tyzapc01on2042.outbound.protection.outlook.com
 ([40.107.117.42] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tSW72-0005GC-3D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Dec 2024 06:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJkSn0ktNh8Z7zWFi4uorrz42aZx7Iso7GufQlbUlMrjTFF5QyZMWAFbDWuEqC854R4eR9dmUY1NiDBsYEqBmLdFly6MoYVKFpnm7U/Wb5FHUPI74bq6t0JV3KlNXrXyAwI0ZdaC86v05PXf8rS2eKyTtX/cq0g9lEEcnc0gFkNmsqxYh1f1XjeiejlWl9PZuk9jIVR15CkKQkU3obYkA3K0XICqc2RJ4ZjF+k+ZbZzH2Rp8VaSET34vy7KqItYzwIUcBa4KcVMWjhgvvk5hJ+4MsT+csgFu/LCShOGx5/roAXPeUN+XGu+d6XdPlQ/j6cU0t0WE/1uNe7dLXBSTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5m95T/1YpqSbXtlDOzDeoHOb6cJz+VIK6mQ3HT9Kc0=;
 b=iYG30/bz2KqCwRzvDr3LLmwbBpRbcyQOi42rWGZ1R1DsPjL6pPmlCwcrVT9uudB2YQM1iYCLp5fT3X7oxl31q8unyQCdUHIWK2sFUXBPvGgSAVPqtsGaGpm7wkDKV8F+jMv1JCWnt515m1lmA2cdvXNzdRLRJKSrTUEkjqHtjyqWQIJwMOTG2mZ+Z4aA5rTMOa/ROj8sTxLi1i+tsquywVtkrKUxEgFBLP9d0ErGy2tBIQw9vKq+cbdLIFNkymui1NWkoPq4/3UucVsSr76kNA+cu+AWfor09N4emRSI9ug9g7aRF1etO0husqEGYs6g9JlgE1fgF+ksbuRMCgsbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5m95T/1YpqSbXtlDOzDeoHOb6cJz+VIK6mQ3HT9Kc0=;
 b=SonExSGR0xeDxTv5QZoUCb8GRhLO8N+rWu4wQKrip3WrsN6rG8I+ESjQQdU6mIdlKJDajBQNaaeZKptatWa7clu33eIyCBPN4neHtPrNSgOZQMftRhI4Teypa1PVL21c/3Ej409oftUV+I2Ox3t2Khr9/dNqJRN0drVl9mNJlII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYSPR02MB7323.apcprd02.prod.outlook.com (2603:1096:405:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 06:52:06 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 06:52:06 +0000
Message-ID: <2c781ecb-b611-4911-8918-e7a455f3f53b@oppo.com>
Date: Tue, 31 Dec 2024 14:52:03 +0800
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241230132325.2891011-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20241230132325.2891011-1-wangzijie1@honor.com>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYSPR02MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 42641341-347e-40a0-962e-08dd2967a3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkh0R2t3Zno3RTA2eDlBWElnSktqdXdUVWdxWUlwempiNFZzb1JlRlAyUDYw?=
 =?utf-8?B?Um9qS3YxWWRtM1Fsc3dlMVlGcVBaT1NaZUJ6ZHZ3VmxZVThtK1BjS3dvMUZ3?=
 =?utf-8?B?dHZpbk54bE44QnllUkVsRkVBOHpycnpybTd3QlpXQUZwRkduOGwzbklEemor?=
 =?utf-8?B?eFpsbldHVU1XTHBKK3Q5eUZ3S3ZUNXJmcWc0cUVEdDVMWXEzbmZaTndJZnJk?=
 =?utf-8?B?ZWd5Vmh0OGlTUlo3QjRrRFh2cXpJU1NRSTFRdHVQTXloTWw5OUVnZ2lKcDVX?=
 =?utf-8?B?YVI5MnZsSEx5TWVxM25ncWliakFRSW92bnVpaG9XS2RoaFA1Nm5meDIrZVpW?=
 =?utf-8?B?b1BObW5sRS9BeEJWZ2wyUmMxdzcvOC9XU2tCZHk0eHcyRmtKN29HTThDQ2Vh?=
 =?utf-8?B?M2RSWFU1c01qQm1TZWRIN0ZwK3l0ZzcwREhDY3lIRTkyWXlVQlRua0ZUZGJs?=
 =?utf-8?B?UTYwVDJNcURUKzdaSTVUNjFqeXpzNHB5dTBUUmJwMTk3YVIyOGJjYUdjVmdn?=
 =?utf-8?B?Ri9uaFdHa0RSeVE3R2pTRXByeUcyc1RrejNuOUhKc0prTHM4RjdtRUtuRXVB?=
 =?utf-8?B?NzgvMjRZQkhlYm5IQXlKR015Q0VHSFBRNXgvZmJZKzhKUVM3Ukhpc3N5SkVn?=
 =?utf-8?B?eW43bWpGbVcwZUk1TXRSeG80bTNTcVNLQ2tDeXdwbit4OHNNaVpBVDdvTU1Z?=
 =?utf-8?B?V3cyeXpRMWFxSG5za0pXaDNOYkxPTzZjSHVDaHVRL3VwZzl6SEM1U3pwNFZr?=
 =?utf-8?B?RnlFQkdITmlWaHRLSGVKNUpIWUt0djIyNXRSRG04ajdkTnhsUWhqVmloUXJS?=
 =?utf-8?B?MDlhemJCNGtUeERjOFNCUktBd3k1ckhoSHlYQXpxbWZMck43L2l3dkJYNU1Y?=
 =?utf-8?B?OTM1UkxEOFJwWVptY0hGUmxhM0NJU2tXNzVPOWxZYmIxSlA2anFZSTVqWFl3?=
 =?utf-8?B?aW5KVE01UEhKZC9YdjJyeEJ4RWs5VGc1SmRsSTJmU3NZd0U0d29PMU11Nno1?=
 =?utf-8?B?Q1RZU1N5bWxRK2RrbUw1bUNxMm1uNEpKck9rT3A1ckpMYURMNFV6akhjU2xW?=
 =?utf-8?B?UTlITmkwZURFWkJ5eStVeUg0MTZaU1lNSkVkZU8vREVOSWJON1c4WTArOFlx?=
 =?utf-8?B?Wm9lWlp5aSs1SDRTZTVES2h1ZVBoRzJTNFltT2pEMFpQWmE4WWQ5QlYvWVZp?=
 =?utf-8?B?OWcrRzc3Vk9CZjUwRUd3YWhEaEdiT1dheEtQYzkrYldOdE9kUU9Uc2dOdG9T?=
 =?utf-8?B?WjJVUTZ1Yk1XV08xZ2V3OW5Rc2k5cm5oTXBDOFVYZkgwdVFTK3hNNkRnbjV1?=
 =?utf-8?B?emJER2huNmp0M2ttQjA2WmNia1E0RVJBbTg2aHZCNFJLK2F2OW9CL2Q1dWF0?=
 =?utf-8?B?MWd6RlFkbWFZa243Z1pXRzdiMmt2dVB4T2hBSFQ4MWphWWFnY2l5SkhIUnNB?=
 =?utf-8?B?WjlSOE55N3RWT3N1MHF0ajhmTmtVbDh6V1Rrb2ZqWnliNXZvMWFrRDM5TkN5?=
 =?utf-8?B?K0E2K0VIYlJYMTFuRVZST2M5aW1LcXdCeXRRd0hyWXlRenhpU0pUSmtnL1Bm?=
 =?utf-8?B?eS82ZnZDQ1lwSWszaTNoR1VYRkRxY1NOOTl6akpNSnI0OCt3ZkNpNzBFZ3VY?=
 =?utf-8?B?eVU4YnY5WlF2MkdBNmh2QVIycTVOaG1YMmtRZXpDYVcvUmQ4VkU2MXRycXJG?=
 =?utf-8?B?b2F3OUNPRUZLU2RkK2M5elQvcmhPTUpPUnBFNFVUYWRPd09RaHdRRENreVhs?=
 =?utf-8?B?RzI5S1dxV3FQOTRuRTc1QnY1clV3aDhEWEplS3V5MGVnc2poYTUvVG1peHJm?=
 =?utf-8?B?b1NJa2hoRGZveEZBVzQrY0hFdlkxTFkwWkc1T0pNSlRIQkQ3a0ZwZjBUVHhK?=
 =?utf-8?Q?tr7M50Gfk8g0j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek82ZDZ0V1RZVmpsVU5CQlJTMjNnOFBBT3hwQWhNVXlOalZQUE9MWUk2alA1?=
 =?utf-8?B?RFIrSTdNRTUxWjI4eXJPRE83TXQwaUkwTjJVanVKVDFvY0UxRFl4Q0N6MHox?=
 =?utf-8?B?WVZsYjd6aHE2VjJ5QzBaVUJoSmlyNDJJVU8xUHQ5WUs5ZGpkZndrS1M1S2Vs?=
 =?utf-8?B?SjZtYXVRVkZnTWE4RmNxTGVEWm5talo2NS9oZ3dMMTF0WGlra2VramtyOGIz?=
 =?utf-8?B?RU9xVVJhNnErZkhVQzJSRjY0YmJQZlB3Q1RybURERC9yeWpvVmNlM3hONUdq?=
 =?utf-8?B?dVNaSHAzRFRMZmNNU3VEUUt6VGNibUU0WnZmbEY5TGZaQTBvUWpCbGlSR2Vx?=
 =?utf-8?B?QXBCWlM2TER2VDJ3QnNOK0lOdFRkTEJENGVTMFh6MVNhTmw3ODlpSU0yemdl?=
 =?utf-8?B?aWx0cklFekpMRVlMbldETXhUelZtQTZMNTZQY0xpOSttNFZVQ1lwSi84cjNx?=
 =?utf-8?B?M3FJMzJBQ1VJazRWVW14UE10VUhLMG9TM3hFMXBSYU9adkpTRi8zYk9lTzg1?=
 =?utf-8?B?RUVTWmc1Y2krN21OWVZ3T3JKMUN4NVM3WWlaSHFsektKdHJvTnl3Y2N1Z243?=
 =?utf-8?B?cVZBcE5qbmp6M2k0eEo5U0p6VDYvYzE3Rk8xK2JaTzJ0V3Y2RGFWSzQ2MWV1?=
 =?utf-8?B?VzBOMENjYnBFV1YyNTlqejNWUXFxSjBEWkErMStzVW1pNXE2ZWhkalFHUjZa?=
 =?utf-8?B?N1VXUTU3NmFPNTN5cUp3OFVsZGRJbEVoNUhDSVZXUHplRStyaXFRRFN5N0xZ?=
 =?utf-8?B?TzVUcVN4TGpUUVlPQ3RRcHBMZ0tmRmFvMy9McndvYmNBTXI0SitKQnZUSHI4?=
 =?utf-8?B?aTNPQ3RBbmM4Y01CY2gzd3NTTWppSGZROUtON2pDYm5yMW1iMkVIbTY2LzdE?=
 =?utf-8?B?YTRIOFc0bm9Dbkk0MXh1NlM2VDF5Si95MTFPS0w3dHFzellNem9XSXZubERy?=
 =?utf-8?B?aHhqLytnbW1GdUhTY0l6Vyt4VjlLUHVNZmxPS1VhVDVsVUlzRmJISGVRa3Vw?=
 =?utf-8?B?UmJtaGo3cmhqd3JQNWVITXZ4Q3lVZ3FMRmYwcCtkRkZBWmFvSnR4WndFa0Zj?=
 =?utf-8?B?WGx2UkJEdkZKWTZOeXQyTmQ5bnlUcW95VWpDbHhrd1lWYXdtcEs3NUgxemh2?=
 =?utf-8?B?QnNtZmE5NE4xQW44ekYwODZTR255MHY1VTFmYXRDSnc2TzhYaUlqZEE2M0ZF?=
 =?utf-8?B?YSs4Z3o5ZWQyS0RiMTZybXFJMy9VYlZxOW5ZN1ByMzBOa05oUGJVamZ4VjZx?=
 =?utf-8?B?OWdrNDdiRFVpSGk1N3UzREFFb3htajZyVVJuRW4rbFliUkpPTXF0VHcyOXNz?=
 =?utf-8?B?K2VuYVFTVzl4cGVGZklMQmFqQ3NpS3ZkWjFkRk9jQmQzZDZCNnd4YjZWSzFp?=
 =?utf-8?B?V3NuS2JVNXhQK3FLM09ZbmYvdzNCL3FpdmRYWUxHam9TZlY3QTRmYk91K25S?=
 =?utf-8?B?YUN4TytrSXB3eDNKTWRkbElTUGRRdmhXcEFXSEZQSlp2eklweUNkUkhiSjBJ?=
 =?utf-8?B?Rlk5K01JNWZ1REhOdzNiNjFPV29rOEdWaTlBZlQreDhZN3dJQlZzNVl0ZnpL?=
 =?utf-8?B?UFI3NWRwRTRpUWh5ZFB1ZzlnZjhyZjdITnhRRlQrQVNEVndCbDV4THVYM0lL?=
 =?utf-8?B?MEV6VDA2RURJaXVhOUx1b0Y4bkZkZEUvMWxQMzErR1UyRk1qbzEyU1grUFZS?=
 =?utf-8?B?WGFXdG5JVzNkVTU0RjRiVThzaEYrZXFzL3pjc1hqcDVQa0pkeStqRUhUVFRs?=
 =?utf-8?B?aEErK3NWYjJmTFV5OENjenFmUTRSVG5IU1loRnU1VndWaENPSEN2N3ZSUFh5?=
 =?utf-8?B?R2d6VmtLWFRmMnV1SzNaS3lFa2k3dUFDTVdMUEIxQzlZUWs2U09NN2Fjd0Vh?=
 =?utf-8?B?cjh4UHNrM04reGNHSE1vbUhSL2FvclNvY0gvZ2FiazBvNUhZb2F0ejIzSWxi?=
 =?utf-8?B?L2VNVU5BUVBrVzJPN3VNemRiZk9ZV0llVFUzdW9ncmcxWVJLRi9jU1R2ZWNT?=
 =?utf-8?B?L1haTEJoWDJBQWh4MVJ5Vk9GUnpBcFhlQTdzNTcyNnVMUFRrVzBnNUw0SDBV?=
 =?utf-8?B?MWw4U2RMN0tEdGk0VnU1aTc3emNGWlRKa281NmlXUldxMlFncGxneWlNamIv?=
 =?utf-8?Q?OX0sdSQkCUHCdqWuB9FyhLGv9?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42641341-347e-40a0-962e-08dd2967a3cd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 06:52:06.5442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjsEZHYRodQJUYbPcIl3Nae+rmcEbiQspM60XJO4//Z2mWk07bl455rTM7enFsslzFY07g70/W/d/L4C3bBtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7323
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/30 21:23, wangzijie wrote: > Currently when we
 check xattr of inode which dosen't have xnid, we make unnecessary > memory
 alloc and copy. Followed by ShengYong's suggestion[1], change the b [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.42 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.42 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.42 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.42 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tSW72-0005GC-3D
Subject: Re: [f2fs-dev] [PATCH v3] f2fs-tools: reduce memory alloc and copy
 for xattr
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
Cc: "mike@oppo.com" <mike@oppo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/12/30 21:23, wangzijie wrote:
> Currently when we check xattr of inode which dosen't have xnid, we make unnecessary
> memory alloc and copy. Followed by ShengYong's suggestion[1], change the behaviors of
> read_all_xattrs and write_all_xattrs, and add a new function free_xattrs.
> 
> * read_all_xattrs: If xnid dosen't exist and there's no possibility to change xattr(which
>     may enlarge xattr's size and leads to alloc new xnid) in next steps, return inline_xattr
>     directly without alloc and memcpy.
> * write_all_xattrs checks whether inline_xattr and new txattr_addr have the same address
>     to avoid copying back.
> * free_xattrs checks whether inline_xattr and new txattr_addr have the same address to
>     free xattr buffer properly.
> 
> After that, instances(except setxattr) where {read|write}_all_xattrs are called can avoid unnecessary
> memory alloc and copy.
> 
> Use free_xattrs(xattrs) instead of free(xattrs) to free buffer properly.
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/502ae396-ae82-44d6-b08d-617e9e9c4092@oppo.com/
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

It looks good to me.

Reviewed-by: Sheng Yong <shengyong@oppo.com>

thanks,
shengyong
> ---
> v2 -> v3:
>   - fix read_all_xattrs logic to check and set xattr header
>   - change parameter name for read_all_xattrs
>   - change subject
> v1 -> v2:
>   - Suggestions from ShengYong to change {read|write}_all_xattrs and add free_xattrs
>   - If we may need change xattr, still alloc xattr buffer in read_all_xattrs
> ---
> ---
>   fsck/dump.c  |  4 ++--
>   fsck/fsck.c  |  6 +++---
>   fsck/fsck.h  |  3 ++-
>   fsck/mount.c |  4 ++--
>   fsck/xattr.c | 25 +++++++++++++++++++++----
>   5 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index dc3c199..cc89909 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -399,7 +399,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int
>   	char xattr_name[F2FS_NAME_LEN] = {0};
>   	int ret;
>   
> -	xattr = read_all_xattrs(sbi, node_blk, true);
> +	xattr = read_all_xattrs(sbi, node_blk, true, false);
>   	if (!xattr)
>   		return;
>   
> @@ -478,7 +478,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int
>   		free(name);
>   	}
>   
> -	free(xattr);
> +	free_xattrs(node_blk, xattr);
>   }
>   #else
>   static void dump_xattr(struct f2fs_sb_info *UNUSED(sbi),
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index aa3fb97..982defb 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -844,7 +844,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>   	if (xattr_size == 0)
>   		return 0;
>   
> -	xattr = read_all_xattrs(sbi, inode, false);
> +	xattr = read_all_xattrs(sbi, inode, false, false);
>   	ASSERT(xattr);
>   
>   	last_base_addr = (void *)xattr + xattr_size;
> @@ -869,10 +869,10 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>   		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
>   		write_all_xattrs(sbi, inode, xattr_size, xattr);
>   		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
> -		free(xattr);
> +		free_xattrs(inode, xattr);
>   		return 1;
>   	}
> -	free(xattr);
> +	free_xattrs(inode, xattr);
>   	return 0;
>   }
>   
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index b581d3e..2897a5e 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -341,9 +341,10 @@ struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
>   						struct dentry *de);
>   
>   /* xattr.c */
> -void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool);
> +void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool, bool);
>   void write_all_xattrs(struct f2fs_sb_info *sbi,
>   		struct f2fs_node *inode, __u32 hsize, void *txattr_addr);
> +void free_xattrs(struct f2fs_node *inode, void *txattr_addr);
>   
>   /* dir.c */
>   int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
> diff --git a/fsck/mount.c b/fsck/mount.c
> index a189ba7..f6085e9 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -370,7 +370,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>   	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[3]);	/* indirect */
>   	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[4]);	/* double indirect */
>   
> -	xattr_addr = read_all_xattrs(sbi, node, true);
> +	xattr_addr = read_all_xattrs(sbi, node, true, false);
>   	if (!xattr_addr)
>   		goto out;
>   
> @@ -384,7 +384,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>   		}
>   		print_xattr_entry(ent);
>   	}
> -	free(xattr_addr);
> +	free_xattrs(node, xattr_addr);
>   
>   out:
>   	printf("\n");
> diff --git a/fsck/xattr.c b/fsck/xattr.c
> index 6373c06..413cf73 100644
> --- a/fsck/xattr.c
> +++ b/fsck/xattr.c
> @@ -18,7 +18,7 @@
>   #include "xattr.h"
>   
>   void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
> -			bool sanity_check)
> +			bool sanity_check, bool for_change)
>   {
>   	struct f2fs_xattr_header *header;
>   	void *txattr_addr;
> @@ -30,6 +30,11 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
>   			return NULL;
>   	}
>   
> +	if (!xnid && !for_change) {
> +		txattr_addr = inline_xattr_addr(&inode->i);
> +		goto check_header;
> +	}
> +
>   	txattr_addr = calloc(inline_size + F2FS_BLKSIZE, 1);
>   	ASSERT(txattr_addr);
>   
> @@ -49,6 +54,7 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
>   				sizeof(struct node_footer));
>   	}
>   
> +check_header:
>   	header = XATTR_HDR(txattr_addr);
>   
>   	/* Never been allocated xattrs */
> @@ -97,7 +103,8 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
>   	bool xattrblk_alloced = false;
>   	struct seg_entry *se;
>   
> -	memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
> +	if (inline_xattr_addr(&inode->i) != txattr_addr)
> +		memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
>   
>   	if (hsize <= inline_size)
>   		return;
> @@ -137,6 +144,16 @@ free_xattr_node:
>   	ASSERT(ret >= 0);
>   }
>   
> +/*
> + * Different addresses between inline_xattr and txattr_addr means
> + * we newly allocate xattr buffer in read_all_xattrs, free it
> + */
> +void free_xattrs(struct f2fs_node *inode, void *txattr_addr)
> +{
> +	if (inline_xattr_addr(&inode->i) != txattr_addr)
> +		free(txattr_addr);
> +}
> +
>   int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *name,
>   		const void *value, size_t size, int flags)
>   {
> @@ -174,7 +191,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>   	ret = dev_read_block(inode, ni.blk_addr);
>   	ASSERT(ret >= 0);
>   
> -	base_addr = read_all_xattrs(sbi, inode, true);
> +	base_addr = read_all_xattrs(sbi, inode, true, true);
>   	ASSERT(base_addr);
>   
>   	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
> @@ -257,8 +274,8 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>   	/* inode need update */
>   	ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
>   exit:
> +	free_xattrs(inode, base_addr);
>   	free(inode);
> -	free(base_addr);
>   	return error;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
