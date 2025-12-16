Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA1CC308C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 14:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRoiOM+QwJimGCxhVbhCR/UzvhBEuusSQhdchXz5TdU=; b=D02YM9eNdEfaoiOIxvmaPTT9WF
	rLmyyJSjJ3g9HDZe+3lOz1V+ZWMZB6F12CoKyGo95vIQPMyDQ3ZyOO+KSY6ahc1wsQ/UoGpVXVmbH
	3UT9mZye8TjiniHHAUl+HHZyT1jLHA74QaL41e3GjIi0oO3wQ0F9xpRbC33grwpM0/7Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVUhJ-0007UW-Do;
	Tue, 16 Dec 2025 13:02:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vVUhH-0007UN-5D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 13:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vh/MbWM9a19IsIBknbxuSxDYqREVauUWqx9dSjDgRX8=; b=dxzg3V1EGwWvwScvptUGaVElvw
 PMLyPNVLktPjrC+s/vA8RlAKEr1mYUcCcD1EbK3EGRd7xm/C7hTYf4f7n+A2+FybYDRw4IHdfvFa/
 l3PUgQ0mN2bupEFnIY85RsRwLdQ0ED8VBf7IN4kug+cpyfZZjhaSpp/B8AhC5zJQem2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vh/MbWM9a19IsIBknbxuSxDYqREVauUWqx9dSjDgRX8=; b=QNjqHTDmCD3liuC0LDBpNFFtI2
 JKzZJUq5I0lJ1CklzV0oK9XzTvtWFIjrMFN6hzfbRjFC8HUafjYisTydmDSz4i6wBZN9+J9nrRE2G
 c8VElqCjzZJXMtFJaIZJg6Ix43CjMafpYF8yh6rg7Xm0GFOEAaAUS9FzIyaT4MEp00RA=;
Received: from mail-japaneastazolkn19012062.outbound.protection.outlook.com
 ([52.103.43.62] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVUhG-0003gR-JX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 13:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6XwSzuCX6emVMIqKvdvqCpnuC98JWFi1DDFPH5akP2n7I5zGrWNCsjXQtlGjQ9k6eEf1oaH4VEKjsC0OD/NusePj3vvIOHljTsLZSGM4xUYeVpmDXItiSvO6ubYRDIFCPY1+01ljnfhPa7PVuYM/r8TWxEx7ax6wrF1Oz12p19RhDpHOJeA/gGpDeMf94FS/Jf5Mf5R3yPf6G8p1GwUxgJ2ZCabQAGtADtQ8O/FFDEpn7WGHoyCoLgX9bRMVSMRAafffc/brMmuAX6CJ5HraZr+iTlhh1f9Xr6ULk6h3bMJ+RJUbOcMThGs8QNq6CjaYivRQIReVH4IIBlufehaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh/MbWM9a19IsIBknbxuSxDYqREVauUWqx9dSjDgRX8=;
 b=Vi0rtTDb2BeFrdBBnNaeNVwQKQrQjsCZaFyqGvV9gBXvkqfhcVMA0XoFXCcKlRwfT/TTf2+DgqnYqTIX3pMIa0W0wxtYwVuU6lNKryExfl4K8NRcPggNrfvyfO/Q0ELxlbgj9L4Aq3Bb08OGwlVak/0GAz88HKFWHBLQQppg8a7rJfUpV2c9uBOUUFeLk/fm+6EJ7tQA0r0MFeJqgqD1Z4gFOnjUZF6cCt92dgWPjqoO+hru7125AE1GOs/GpMFUl5E3ku6wuPdmNTqwO7lGEoWqubqpWazCumOE9R497aqxOvLTMvjHg1CEjZ8yupi/YRnDGBoKo73+jUJx6e12iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh/MbWM9a19IsIBknbxuSxDYqREVauUWqx9dSjDgRX8=;
 b=FfYTXvNJVOc3BSfhJwpIkzABuyKUu/chxJmrScfo+OWkw4L4XOGHmkm2U/MaYIul8vZgcZsCD0GeXvf4nLoq1QeXE3qkljVVta0x5KXX8+2auPuu69wWHeGsr/QivyO7BKUeTRVUpvPT8bT9SwSZ00RvvCAsRRAuGuh0K2c4+gtrRq7M2i4nBWXNvQY6V9P8rmVkoeDc7y7R5eMV73Q4L1NX4ZKvod0VWaEQCn9h7DLoQsum3qwq45rooJvtSOtIz6GHYMTYOKh6OfxMVJOM3TQq4pb7AVKB5gde/aTpk3OFYmd2gUrvbNvh+6NU0bYbs4hPizLOYUPB0Z+sjkSSQg==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by JH0PR02MB7620.apcprd02.prod.outlook.com (2603:1096:990:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 13:02:24 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 13:02:23 +0000
Message-ID: <SEZPR02MB552029B93B110C18EA2DBD8799AAA@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Tue, 16 Dec 2025 21:02:19 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
 <18edf007-9f95-40b0-867b-05ece98ca70f@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <18edf007-9f95-40b0-867b-05ece98ca70f@kernel.org>
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <cb4edc36-ee6b-419e-a554-88849fb844de@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|JH0PR02MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 73042241-cc57-464f-0d2e-08de3ca35a97
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT97+9kgwgO/mqEGtcymhevmQAxU93L+AMYQHYo2ygPUDZCb7fZSbnU5RPpxjGa4gEs1PJATIOv8m9t89A7fEIO2rdVCtolbV+wMhKaVBUUPHDtQDeOizCArnXevjR8cJy/+7ntlbGmu+1AKAa80mfS2qEKgLS+dUb/r6Yko7E/Hf/90pd/W+YZhhazxuiLn/LMte+Ve2NmR49uqVsKIX88gGAhdxifEeKoPYkXOw7jwvbiKUcII44a8FBFYt48ZLoMHO0FBvfSDzkUzyITEcK+NBbfrOTNnU5/P+fDqMFOpwer6a4iPuW4XOuApyQEuxj97Asks2rSr7NTjGUU1HZRWM778PxInJ5WCUCK6fMEAIesxQLtCEVzCXFs8uYoWXGiMhQ+7outLm0bFTah/obcL+VPqeieUKyZKt6iYyQ+6z8mbpmoEM+YyLxXTbBKgaL98ojksHM7UAcTfSMfbavcTtRlv4DDMuoVIIVuQb0KXGvWWW9Xyl4CD5K8GmPBPJ+DeOZhsvlzfS44ZtC7Xq+YChlO3WkWei0zCQcS8KxOJw/5emSvri5ba9SPfO06fg2ldgYhPD/BMA5WEFeywJW/0uqwPrFudYXOqKzCQi/16E3BUnjNANDhWuu6/z53lCi0CMLYsdDBd+eVqAP6sKZBMINF0cbB+vt7l4dTD7msaIw8686FC+2bXsTIKRWn5TdYKRUkOPJaPFRhUGhHVznGqR5mOHpVjZvcjAHbbpj9G4CtNJyHh65kqdN5vXgEN4jlW89r+nIn0wT6D0u5Vv/bnUwJBtveq/Z0u1RoST8dOjO9TSWupjw/9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|9112599006|461199028|15080799012|5072599009|6090799003|8060799015|19110799012|23021999003|12121999013|3412199025|440099028|10035399007|40105399003|52005399003|3430499032|3420499032|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1BscWppbmhsNTJvU2RUNmFhbmVYby91cGh2aUpneWxKQTU0dUxkR3EyVTBr?=
 =?utf-8?B?ZHBEQmRVQ0EyMGFxVFlBUkxWaGwxM21BdVg4N256YWxrTkxlN1ZyUUVWRTlq?=
 =?utf-8?B?d1h2T0s4dmQzVE9KZWVRbk5KOVJhZHlRYlkydUpTNmY2VWp4QjZ3NVo4dG1K?=
 =?utf-8?B?TzFBWDRZZlZ5MDZVdTYwV1FvOGpYd2lPYkplSWVMYVl0RGVSVmkvM3dLMVlj?=
 =?utf-8?B?V0Qzai9ONjZIMi9XTjc4dWJYVlBVemdRU3NBSUUzRUlwUGdtZ0NKZE9CU3pG?=
 =?utf-8?B?VDd2ODM2Q2pjYjRRU2ZoYkswWHdjUVgvbklQcXM3L3hjZHVzYzZjWFRvNTY3?=
 =?utf-8?B?WU9GTU9EbmptcjVEZVovQS9kZ0VFS25ZaERHZ2ZmemlVZmFGeTF0a05sUHNz?=
 =?utf-8?B?bTNIQUQwZWhBU0R4WDVFNWlQazIrRUFrdjMxblJCY1c3ajUxc0dWazdxZmR5?=
 =?utf-8?B?c0ZKUEx4WkgrR3JuRHN4YTJyRGhtZi8zM1VhTXpMRmY3cUlWZXF4bXI3a1hE?=
 =?utf-8?B?aFJycjBManI1ZFNDU2RXaFdXcW5QZ1pOUTZ1cFdpM2pRZzlMUWNwVmJJRy9I?=
 =?utf-8?B?ODJhYzNnVDMvcUFEOFloZkZvUTFTaDJQZEc2eVlhRjdROEJtUVBSMVQzMm5U?=
 =?utf-8?B?YXRxeG9EM1dXb1JKbmpuVW4rekRRU3JyZWZtaENJclBjSDBvcUlsQVpnOEUr?=
 =?utf-8?B?MDlPbEJFZHFTd25maHJsRm1kZXVOMkdxeWZaZTI2RFN4c01nLzNxSkdSRjZa?=
 =?utf-8?B?WVF3aTNVdTNhTUtBcmhhUHhjRVRFTVNiUFlxbHF6UndObVdSVVpCV1I1NSs4?=
 =?utf-8?B?S0xnUjEzN3Yra1hRcWExVTViTjRWNTQyM2tEWHcveHkwTkhKZmtvOXFyaU04?=
 =?utf-8?B?ZVcvbWpDVTBMeUN0YzhVeXJYUHVLdTYzcmJVd2hpdjB6NWp6dnNuTXNReEJv?=
 =?utf-8?B?UTI4b2ltZU5uTkxJQ016MDZXVldvT2dzNGJ1cFAwL1kyc1dnNUtUN0k5M1dk?=
 =?utf-8?B?WnRmU0NjUGR2MFloOTdycnRIWnlXY0hNbDB6bkFTVmRvbXAvdjVwVlF1VGp3?=
 =?utf-8?B?T1dQQW9aVDZ6a3ZjREp3VUlBVnh2UlBhNjBDekdlZEk3SWJ6SngyODdJSWZi?=
 =?utf-8?B?UFkzZ2pSd01KZmhNMlhRMUdZMUlZeHhuUHJmT0FDMGFEVVBVV1pJYXl6YUFI?=
 =?utf-8?B?NnErWGZpT3BHdWpLM20yaTBxUEJYbkNqTHdYaGxTWWNEYkNiUklvcVQzS3Vh?=
 =?utf-8?B?WmFUUE1jV1FkVkV3WlNlSzVVUG1xT0xEYjc0Rjh5TCtFc2tFeWZhVjhzTnh6?=
 =?utf-8?B?ODY1STk2N0JobzEwcUlHK0JwQzUxb2V6MnFUa2xZV29mYUJKVFRpdTZFQjhP?=
 =?utf-8?B?T2RmdFhXc0U1WTREQmNKb1RqQjdmd3hHdVhFVkptNHNjRE14OVNzREt5S0xO?=
 =?utf-8?B?OWMrbzNNRkNTRTJXbldhb3ExMHlETWFOUlBHMW84aTlibVJiV0NTVjZyZ1g1?=
 =?utf-8?B?OGFnTWxlSnk4dkpXNjhlMTNQTm12ZmdmV2QzOHk1YVVoUU56NWhtQWc0b2hX?=
 =?utf-8?B?RUMrdU5pQ2szWDlBdWQvdGxZWTBmekNLQVRSRFJ6M3J2N2J4ZFM3TE9rcU9r?=
 =?utf-8?B?OFBJUHk3a3JpN01PbUVRaVllbVU2WWtpRHhrUUJqVS9rUk5QdUt5ZUt0U2tJ?=
 =?utf-8?B?MVpjUXgxQ3N5U3pVUEJ3b1JmRG5lLzlHTVRBSkdualZtRGFZNnJUMzlNOFZk?=
 =?utf-8?B?ZW9ROTdhc2FXZzZWOXNzTXRndDhlMWNZSGpXV2IyRzVxcExtaEwrMzU5dTUx?=
 =?utf-8?Q?QJNY56ELb3q5uTDi4cLp1qDNJwnKSqC4+wXUY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNYdk1TSEpkOG5BVnFyMkszTElZUFo0eDFvYjgzc3VvNUxCWnliY1VZdXZj?=
 =?utf-8?B?Q2sxSWt4Y3NleUNnYUN1QzZESFR1dUZmdGRIako3dkxwbndOL20wV2V6UEZ4?=
 =?utf-8?B?K3h6bHhNNHBua08wL2ZValRJU0Q3MG9zU1VadjJFcWEwNGN2blA0YTNTdCtN?=
 =?utf-8?B?QzkzcExnRDhYV2ZPczB4L0ZvTHdaU0lOcFR5TUZQN2ZkUkdmZWJuemNXeDRJ?=
 =?utf-8?B?MW9TZ3JLL2l3b0xYS29ENGJTVHNXQUMyNTdDL0w0RHNUS0ZvYk1ZYUk0bU5p?=
 =?utf-8?B?NFNBdEJFYU8zd2N3ZGlZbnFTczlKbnNidDhJU2xWaGZhTXM1WDlUNXJrRUEr?=
 =?utf-8?B?WXAwbS9SaEYwUHQxT05raE4xM1NPUTlZN3gyQ0poMkNZSFdsckZOUXBOR0dD?=
 =?utf-8?B?SHJ2TERobXk2aU4vNTZqNkY1M0lNaTIrTjcySHZRSm9wa0xySVJ3MytQdGlH?=
 =?utf-8?B?dGxYZTA5WXRMR2h5M3pDakdlOXdVK25IZ2JCWkoya1FJdnE4WDF3WkNGY1Zy?=
 =?utf-8?B?bjZic242eEVwM1dOVjYzU2ZQM24yTklDUENjRGcvYTI4WWtIMmJ1YXNHZjg5?=
 =?utf-8?B?Zy9rNk0vd0F6ZDRITW5sYkQxU3hMZEtudVIvRk1NSERsK2NIRDZjTDBWQjJG?=
 =?utf-8?B?RHNvMVZYUWlZREM1b1pyOGdvZXg4NWF1ODVVT0t6RjM5bi82UGV0WXBGODNK?=
 =?utf-8?B?eHliNWcxTHpJeVA2VFM2SkhaMXQ1eitRQXIrWVhQVjBOdDhBMUhCSTlpaWlh?=
 =?utf-8?B?YnYvR3cyU0dBUktWM2YxQXUvaFVLM0Z3Mnp0SWk3VGZ5c1RDcWJqSUdsYVp5?=
 =?utf-8?B?NzJ6Z0VyOGwwN3Y0WEdzS0JTQ1c0alVlVithWlNPZkFuQlZ0cVVxOGxKS0JR?=
 =?utf-8?B?elVHZzJxQTh2dHFncXFGcDhTaTJZM2JpN1gyREdiK2ljbHpSc203bVdhK0Rn?=
 =?utf-8?B?WXg4NEM5b3RXSnhhNUJIdE1oTkQzbXVtSDZaN3pZTnRDSGEyK0xvWkFFeTBs?=
 =?utf-8?B?NW91M0IxdnVXbGR4K2hKTnQyNFBzNjVMdkJoTXE5ZU9XVTRuc0NiUENDV3ZV?=
 =?utf-8?B?aktBSG1vMis4MDJlL2txbUVhNEJYOExXeGVyZjQ2eDR5WTdiMTFDamMxaUcr?=
 =?utf-8?B?YzdZaUN6SUU0dE1NVGwzN25oaGMvdVk1MUp2bzBhSksrcCtQQVBrU0paS0xJ?=
 =?utf-8?B?dG43KzgyZnBuN08yMXlCMjA1NUJMZkZZWXdpSkdNdjNSRmhJZXdqYnRMNzRJ?=
 =?utf-8?B?aHRTaHRyekp2UzJQWklnOC81cFhpeGI5U1ZiV0lpdFNpZGlZZTNYRDhTVHNP?=
 =?utf-8?B?ZWo2Z2Fxc2d6M3cycC95Vk9zcjVKOGJoZFhLRXRzN3Q5SDVROUh3Z2VFU3hZ?=
 =?utf-8?B?YUNKRFVXL0VyS1prTzdpSS9qb0dod3ppK0FjNzNnMWsxRkVRS1NOVVFsMU05?=
 =?utf-8?B?dE9NMGlaWDd2dFJPd1BjSlhWMGowRVRtQkZhb0llVTRyNlNNM0lUeXJMSFU3?=
 =?utf-8?B?TkdkVXAzK0hmd3ZQckRIN3IwQzNBaWFhS3E3MFZtYU9JR1hndWtaRkZyU0to?=
 =?utf-8?B?a0lRK0t3RnlHbkFVaWdtbFdXZzZjbkJCYm96OVRYWm1DRXlLbEdFcEptd0FN?=
 =?utf-8?B?WFRoZW4vbFFhc2pWY1JrT1ZRU2JENVBiLzdBdHovYmNrVlJZTG9aaTBuVWNx?=
 =?utf-8?B?Zy95M3loRFJVMkZjcUlqRmNqaUQxcVU3QUxRaVRKSW5IWkI0Q3oyYlpRPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73042241-cc57-464f-0d2e-08de3ca35a97
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:02:23.3461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7620
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/15/25 09:55, Chao Yu via Linux-f2fs-devel wrote: > On
 12/12/25 21:52, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> For readahead,
 if the current readahead window is smaller than the exten [...] 
 Content analysis details:   (2.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [52.103.43.62 listed in psbl.surriel.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.62 listed in wl.mailspike.net]
X-Headers-End: 1vVUhG-0003gR-JX
Subject: Re: [f2fs-dev] [RFC PATCH 1/1] f2fs: adjust readahead window based
 on extent length
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTUvMjUgMDk6NTUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTIvMTIvMjUgMjE6NTIsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBGb3IgcmVhZGFoZWFkLCBpZiB0
aGUgY3VycmVudCByZWFkYWhlYWQgd2luZG93IGlzIHNtYWxsZXIgdGhhbiB0aGUgZXh0ZW50Cj4+
IHNpemUsIGV4cGFuZCB0aGUgd2luZG93IHNvIHRoYXQgbGFyZ2VyIGJpb3MgY2FuIGJlIGlzc3Vl
ZCBhbmQgaW1wcm92ZQo+PiBvdmVyYWxsIHJlYWQgcGVyZm9ybWFuY2UuCj4gCj4gWW9uZ3Blbmcs
Cj4gCj4gRG8geW91IGhhdmUgYW55IG51bWJlcnMgdG8gcmV2ZWFsIGhvdyB0aGlzIHBhdGNoIGlt
cHJvdmVzIHRoZSBzZXF1ZW50aWFsCj4gcmVhZCBwZXJmb3JtYW5jZT8KClllcywgdGhlIGdvYWwg
aXMgdG8gaW1wcm92ZSBzZXF1ZW50aWFsIHJlYWQgcGVyZm9ybWFuY2Ugd2hlbiB0aGUKcmVhZGFo
ZWFkIHdpbmRvdyBpcyBub3QgYWxpZ25lZCB3aXRoIHRoZSBkZXZpY2Ugb3B0aW1hbCBJL08gc2l6
ZS4KCj4gCj4gSW4gYWRkaXRpb24sIHdpbGwgd2Ugc3VmZmVyIHJlZ3Jlc3Npb24gZm9yIHJhbmRv
bSByZWFkIGNhc2U/Cj4gCgoqQmFja2dyb3VuZCoKT24gQW5kcm9pZCBzeXN0ZW1zLCBzb21lIFNv
QyB2ZW5kb3JzIHJlZHVjZSB0aGUgcmVhZGFoZWFkIHdpbmRvdyBpbgpvcmRlciB0byBhdm9pZCBl
eGNlc3NpdmUgdXNlbGVzcyByZWFkYWhlYWQuIEFzIGEgcmVzdWx0LCB0aGUgcmVhZGFoZWFkCndp
bmRvdyBjYW4gYmUgc21hbGxlciB0aGFuIHRoZSBkZXZpY2Ugb3B0aW1hbCBJL08gc2l6ZSAocS0+
bGltaXRzLmlvX29wdCkuCldoZW4gcmVhZGluZyBsYXJnZSBmaWxlcyB3aXRoIGRkLCB0aGUgbnVt
YmVyIG9mIHJlYWQgSS9PcyBpc3N1ZWQgYnkKZjJmc19yZWFkYWhlYWQgaXMgbGltaXRlZCBieSB0
aGUgcmVhZGFoZWFkIHdpbmRvdywgcHJldmVudGluZyB0aGUgZGV2aWNlCmZyb20gZnVsbHkgdXRp
bGl6aW5nIGl0cyBwZXJmb3JtYW5jZS4KCipUZXN0IHNldHVwKgoxLiBUZXN0IGVudmlyb25tZW50
OiBVRlMgNC4xIGRldmljZSwgcS0+bGltaXRzLmlvX29wdCBpcyAxIE1CCjIuIFRlc3QgY29uZGl0
aW9uczogYSAyIEdCIGZpbGUgd2l0aCBhbGwgZXh0ZW50cyBzaXplZCBhdCAyIE1CCjMuIFRlc3Qg
dmFyaWFibGVzOiB0aGUgcmVhZGFoZWFkIHdpbmRvdyAocmVhZF9haGVhZF9rYikgYW5kIHRoZQpl
ZmZlY3RpdmUgcmVhZGFoZWFkIHNpemUgYWZ0ZXIgYWRqdXN0bWVudCBieSByZWFkYWhlYWRfZXhw
YW5kIGluCmYyZnNfcmVhZGFoZWFkCjQuIFRlc3QgY2FzZTogZGQgaWY9ZmlsZV8ybS5kYXQgb2Y9
L2Rldi9udWxsIGJzPTUxMksgY291bnQ9NDA5NiwgVGhlCmZpbGUgcGFnZSBjYWNoZSBpcyBkcm9w
cGVkIGJldHdlZW4gcnVucywgYW5kIHRoZSB0ZXN0IGlzIHJlcGVhdGVkIDMgdGltZXMuCgoqVGVz
dCByZXN1bHRzKgp8IHJlYWRfYWhlYWRfa2IgfCBlZmZlY3RpdmUgZjJmc19yZWFkYWhlYWQgd2lu
ZG93IHwgYmFuZHdpZHRoIChHQi9zKXwKfC0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS0tLS0tLS18CnwgNTEyIEtCICAgICAgICB8IDUx
MiBLQiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyLjIgICAgICAgICAgICAgfAp8IDUxMiBL
QiAgICAgICAgfCAxMDI0S0IgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMi42ICAgICAgICAg
ICAgIHwKfCAxMDI0S0IgICAgICAgIHwgMTAyNEtCICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIuNiAgICAgICAgICAgICB8CnwgMTAyNEtCICAgICAgICB8IDIwNDhLQiAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAzLjAgICAgICAgICAgICAgfAoKKkFuYWx5c2lzKgoxLiBUaGUgZmlyc3Qg
cm93IHJlZmxlY3RzIHRoZSBjb21tb25seSB1c2VkIGNvbmZpZ3VyYXRpb24gYW5kIHNlcnZlcyBh
cwp0aGUgYmFzZWxpbmUuCjIuIFdoZW4gdGhlIHJlYWRhaGVhZCB3aW5kb3cgaXMgYWxpZ25lZCB3
aXRoIHRoZSBkZXZpY2Ugb3B0aW1hbCBJL08Kc2l6ZSwgdGhlIGJhbmR3aWR0aCBpbXByb3ZlcyBi
eSBhYm91dCAxOCUuCjPjgIIgSW5jcmVhc2luZyB0aGUgZWZmZWN0aXZlIGYyZnNfcmVhZGFoZWFk
IHdpbmRvdyB0byAyIE1CIGltcHJvdmVzCmJhbmR3aWR0aCBieSBhYm91dCAzNiUuCgoqRGlzc2N1
c2lvbioKVGhlIGdvYWwgb2YgdGhpcyBwYXRjaCBpcyB0byBpbXByb3ZlIHNlcXVlbnRpYWwgcmVh
ZCBiYW5kd2lkdGggd2hlbiB0aGUKcmVhZGFoZWFkIHdpbmRvdyBpcyBzbWFsbGVyIHRoYW4gdGhl
IGRldmljZSBvcHRpbWFsIEkvTyBzaXplLiBXb3VsZCBpdAptYWtlIHNlbnNlIHRvIHJlY29yZCB0
aGUgZW5kIG9mZnNldCBvZiB0aGUgcHJldmlvdXMgZmlsZSBhY2Nlc3MgaW4KZjJmc19yZWFkX2Fo
ZWFkIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBjdXJyZW50IHJlYWQgaXMgc2VxdWVudGlhbCwg
YW5kCmJhc2VkIG9uIHRoYXQsIGRlY2lkZSB3aGV0aGVyIHRvIGluY3JlYXNlIHRoZSByZWFkYWhl
YWQgc2l6ZT8KClRoYW5rcwpZb25ncGVuZywKCj4gVGhhbmtzLAo+IAo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+ICBm
cy9mMmZzL2RhdGEuYyB8IDExICsrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYwo+PiBpbmRleCBjMzBlNjkzOTJhNjIuLjJlNWNiZGI3NzI5YyAxMDA2NDQKPj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTIzNzcsNiArMjM3
NywxNyBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCj4+ICAJbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+PiAgCW1hcC5tX21heV9j
cmVhdGUgPSBmYWxzZTsKPj4gIAo+PiArCWlmIChyYWMpIHsKPj4gKwkJbG9mZl90IGJsb2NrX2lu
X2ZpbGU7Cj4+ICsKPj4gKwkJYmxvY2tfaW5fZmlsZSA9IHJhYy0+X2luZGV4Owo+PiArCQltYXAu
bV9sYmxrID0gYmxvY2tfaW5fZmlsZTsKPj4gKwkJbWFwLm1fbGVuID0gbWF4KG5yX3BhZ2VzLCBp
bm9kZV90b19iZGkoaW5vZGUpLT5yYV9wYWdlcyk7Cj4+ICsJCWlmICghZjJmc19tYXBfYmxvY2tz
KGlub2RlLCAmbWFwLCBGMkZTX0dFVF9CTE9DS19ERUZBVUxUKSAmJiBtYXAubV9sZW4gPiBucl9w
YWdlcykgewo+PiArCQkJcmVhZGFoZWFkX2V4cGFuZChyYWMsIGJsb2NrX2luX2ZpbGUgPDwgRjJG
U19CTEtTSVpFX0JJVFMsIG1hcC5tX2xlbiA8PCBGMkZTX0JMS1NJWkVfQklUUyk7Cj4+ICsJCQlu
cl9wYWdlcyA9IHJlYWRhaGVhZF9jb3VudChyYWMpOwo+PiArCQl9Cj4+ICsJfQo+PiAgCWZvciAo
OyBucl9wYWdlczsgbnJfcGFnZXMtLSkgewo+PiAgCQlpZiAocmFjKSB7Cj4+ICAJCQlmb2xpbyA9
IHJlYWRhaGVhZF9mb2xpbyhyYWMpOwo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
