Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03656CEC07C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Dec 2025 14:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8pKd3OmyWwbFpwhjntjd4Ib1V2ED5P9aROZitxz6i8=; b=b2GJGJYMW/kGA38wAs+kz2dan4
	38ANqNQmdNfKSvAike3AYx+SPaLXklenx8pnCVUC5jX3GGblRtCThSOf54Ol2cl75eKZAf9Yu211W
	40asA8oqWKHX8yYmLX1+PjG5aopU5B48wJituGmmG4SVXIlc51JYEOTaS3mhJkH9mKkc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vawSQ-0008Ll-Ga;
	Wed, 31 Dec 2025 13:41:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vawSO-0008Lc-Ti for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6QaG3I7CrlHKuorgCu5xAtyHUH8qNbH27qU8qqtLNOQ=; b=hs7xNnLkPY5EvA9IybMZXL2wtc
 MSg1CJcrCSW7AuyKFU/1vJgvJBV8lk+AC8sbb7kBDT+gT8LJzafd1PNq54cqdkqQV0ug8OLmSBMol
 amWv8TKRELcDl/m7fHYSots5xm9rza22KuBQ/D9UjEJOXFVBOn8fOTaWJrx7n0sIXxFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6QaG3I7CrlHKuorgCu5xAtyHUH8qNbH27qU8qqtLNOQ=; b=jBUkgobB9p7Hs+na4fsxcslNNo
 7w97X4Dh+jzex66gJmxuPPrhrQzsMyLOrHNNzNgSe1+mogmjmY4MpBfpMgycrgPIj7TalkvhMyfaL
 x49ZxA4tiiwUR1gbiyD5C9dAbO7kbMeQO8FwQrEBPOtK0ys6b98nW8dG8yKSLdYsuItE=;
Received: from mail-japanwestazolkn19012058.outbound.protection.outlook.com
 ([52.103.66.58] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vawSO-0002Wf-8q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYbLk8Yj7YYlMI57v9WMnq9p7uR/lokSZWh9tL186cLwHoYqhy7wzpqqgjEO/zVYbOCCI+PZsYnPkieOfKkv68CgWXzxMxPZtnU4BFDn/sE+IcWKDHd/sYqUnEVhHVrbk96hbcJwedTol7QdhBXQlrwP7GZwRO0pdXHzSCZCuDpwED/TEt9x5sHwREAz5kiogbpH8ozDKQUEpJC0OxuygKLwKVi1HvfnOJw1ZBWj7Xeh1CV5Ilkcv/G9fso/OttOUOm3ZqrVSOZg1noEr8msY9fyDB/uU87azvw1HL5ljY2b9M9xmHOfAgcfi2/gY2lknhtaaDNl5fyhbxxLGsihNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QaG3I7CrlHKuorgCu5xAtyHUH8qNbH27qU8qqtLNOQ=;
 b=L98z7wbgdtdj572P5FwHuReOWCLfbXTD0y3Jo0MI8KvXSU5CO+r6vyvklHXq5QgO79JHhjt8FsbfUN8rgM9wJqQxFeWReqp5e/SV3yOWsZQojxtNoItElCxS4+0/m798gLGei845/hdeMlPOSQwrU8MxCIbL1jLg0jc8kc7mxhVh71wjVACCjjIu+SknvoweIgh8EQekio+GWybo0VCj6pyE276tkNZK+JZM3cbBUWDWi+CA2HW9xktgF04emIPq1XyaNmaEaeBvYnVUGFI1I+6u/TCNlO6Y68Ysx0Z1fXtXSj0CzXbZj/ZhbA45VDfIyPjQeRrOlTkdo8vqjEAJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QaG3I7CrlHKuorgCu5xAtyHUH8qNbH27qU8qqtLNOQ=;
 b=dzhT2RKpNAEUX33laPKqAzfVF/4VdT0VD+ZkqJ75eURszHXn3co4mt5wXiig1aNK3psMkhXYD6D6KX95WdJuIuif9MiznC4ZGwXRrFno51/uzSaPMZV7J8zWD6pBMwTajj4Sc2Y40v5UAhqymfk7QMI3nFFbBAwxaIJvHCGCf8cVkG9OsGAW3OI2ITrX6/gMcEyU1pi6tgZOBHTsJM4TlwC3Oi4/LcFy5VbIWhMoZCgg4R+d1+QzgiHtimgGj5sPxABjNhJiqK2fRSp04KDUPN2KPJ763m2pSEufo8/KnLorhrsDv4TeRCXT9FwLKbQmuRQXSbDX2/+207d/hZWIIg==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by TYZPR02MB6041.apcprd02.prod.outlook.com (2603:1096:400:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 13:41:35 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 13:41:35 +0000
Message-ID: <SEZPR02MB5520D2EF5035A04A3D8455BE99BDA@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Wed, 31 Dec 2025 21:41:30 +0800
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>, Chao Yu
 <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251231130514.1061051-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <20251231130514.1061051-2-yangyongpeng.storage@gmail.com>
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <89175636-339e-4278-ad8b-34e32ac2c68d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|TYZPR02MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2211c7b2-7915-4b96-7f1c-08de4872507e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|5072599009|6090799003|23021999003|9112599006|51005399006|8060799015|19110799012|15080799012|3412199025|440099028|40105399003|3420499032|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2o3K01lQUdQS1NQTHJGS2RTTlR5U3dxRTFIU1YrZGd1V2ZnR3NicFRYS2xt?=
 =?utf-8?B?d0h3aEE0K0FEb0lJRjVpcWxlSkpmUU1Sa3QwQlFvRzdhdFRDOTFZWTRDZU1U?=
 =?utf-8?B?bXp3bG54a3JsRDNwUGUycC81eGU2OVRvazE5Tk5iTGM2Tit0UU1CSGR5cFNa?=
 =?utf-8?B?T0MyVlcvTEZJM2kwWStuZTFKN29QeDdBZ2lSRHhGQlh2WDhyM3lUT0RGYjJM?=
 =?utf-8?B?ZWJYRFIyS0tXMllKZWJrM1VvMnM1NU5oTHJ0K1ZCZzFpYitGcFIxYkFlRVpn?=
 =?utf-8?B?aEJkZGhob09NVjZXMXJrdWlUd2JWcitLVCttY2picnlLdVlPazVWN21wU0xz?=
 =?utf-8?B?K0pLbXFPMWQ2Y2ZSdnF2ZGdZTU40M3Z3OEdrNW1kVEIwRERSalZXQUhmcEFL?=
 =?utf-8?B?VzQ0WHRVSGJpRmJsM2d3dDJvSFZVRFJwUGJpUXMzM2VrWGlyeFpMZEN2emdI?=
 =?utf-8?B?VXNHSVZkZUQ1SEJTZWZiNTdLNUdHSEFiK3lhaFNKOS93ZXVueEl3MVVZSHJp?=
 =?utf-8?B?R0hWMGplUnY2eTNSSHloelJlWjJxZmR3WnYxcWRXSVk4QmcxeEprakhCMDBF?=
 =?utf-8?B?c0dPcEliSDB2WWpCb2VFWWw4TWpwNTZ5SXdmS0tYVzl1a0ZwSHZrZlBJTnY0?=
 =?utf-8?B?a3Q4SGswNzJza2t4VDZQZ3NOSmg3aUZnd1FYTFNKRFQ4dkJBRm9tQkpIQVFK?=
 =?utf-8?B?QWl1U0xLSjVGbXZ6VmhSR3BPaDJlejF5MjkwaXNoUG1rSFJYUVY4ME1IRGFn?=
 =?utf-8?B?L25WR1k4WlpqUkhYbFdoQVlONGsxaDdrNmthN2pBbWhjM0Jqa2JRTlh4Z1Jl?=
 =?utf-8?B?RjByQWt1bHVCcm9OT2JPUDhzazFJRy9nRHc5VitvdzhmSm1UamVURnRUOVZH?=
 =?utf-8?B?NXo2clpvN1J3OXdIay9TeXplYjBSNUJod2k1YlkwVHpJdmxPUUEwbSszZDZz?=
 =?utf-8?B?ZlFRRjlKeEpGc2Rrc20rVTdUWVFMWmFsZ0JXNmlmZVpaNkN2TUJjRldLSHhn?=
 =?utf-8?B?YXEzVnpjUHdxUUd2dlBuTnhSOC8vaEpTQTVmSHozdVVGTWtySHNkMFh0UUV2?=
 =?utf-8?B?SkZYbmZBY0pWeXUwZmZZMERodmVpZ0NuYTg5UDFyaTlhTzhyQnhoNFZ0emM3?=
 =?utf-8?B?QUI2akloNmUySXI4OUJ5K0xRS0J3UXhhdXhiZkxxZXBTRTJ3U3NieGJwYjE4?=
 =?utf-8?B?Q3BQeFB3ZnRSb1g2a25mVm1WS0FaTDFYanBsTWdOK3R0TUhwSDI5UENMWjNu?=
 =?utf-8?B?SERYMnR5YTd5V3FvTXF6L2pvN2tXWG4yQVliVkk4L1ZCSmZqNHRQMStVemtY?=
 =?utf-8?B?ZEhQbldQT093bml0bGFVMzhhcEVBRUhaS0VyZGY3UllVSnhRTEtQaTdUcDlS?=
 =?utf-8?B?amtaL2Zoc2pIVXBGdStzUS85dEJmUzliU3pPci94bHdOTldVV0YyNlJyaWZK?=
 =?utf-8?B?YmFGVmVIdEY5R0tINEV0S1NsdWdpUk9iQ09ndGJFUmtCdVhPeTE5Tm1ka2tw?=
 =?utf-8?B?MGhGY005Y1orcXR3RXdIVm9lOGVNNWtuUXc2dTZxa1IxL1JYenQvck5nY25X?=
 =?utf-8?B?UVpORWpLSWM0eU5ETU5XVktwWkVWVStmZ01RNnJ3STVkRTR6cXBUOFJxckpJ?=
 =?utf-8?B?TTFVVkpmWXMwQzdlejBYMjVCaTRNdy82ZGdSeGptVmtpMUVKNFArUWltODlu?=
 =?utf-8?B?VVF5SmN5aEwrK2Y3ZERlZ3E0QlJnTXhLTUtyYUw2NWdEQU4xNEk5R2dBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENpd2Fyb29la09yZUZHM1VDaHJOcG9jMUU5ak9TMWs1QlV2eEx0ZzlVeThn?=
 =?utf-8?B?OUszQ0NpNUV2UTFDRk44MjlFanU5cHVDeHFFTXJmMlY4SnZFYkFueGhteUYz?=
 =?utf-8?B?S25ZR0dQV1hMK3Y1WEZ0YzIvamlXTFZPeHM5bHFCWHZMb0NLTFJmMDJIRWlx?=
 =?utf-8?B?WlM1NWo3TSt3R3FORjlPZ2ZMV3Y5QUZadzExd1JOaFM3aUpsVEFnQ1F0bC8w?=
 =?utf-8?B?NWNGbjBQUXY1ZTNlT3dIYmNmZmxWZEI4em52NFFEN3VJTVBjOHBlQjVtL0wr?=
 =?utf-8?B?dDQ5eWV3MlVwaG1GaGh4bGlsSCtEZkZDR2ovTHJtN2lZRE9KR1FnMXh4c2Jr?=
 =?utf-8?B?M3RmQ05zRjRkSzQ5eFI3Yk14OFVmRTUxZy96MEFUcjRCb00yRFRMOVA3U3Ey?=
 =?utf-8?B?VGJCbWJOa01xZHl1cDQzQTk4MGZQUnl2UkczQi9LdUptRmExblVpbEpkN3lx?=
 =?utf-8?B?OWVnQy82QjBMQUxqSnVETCtpZ2NhM2RCMFM3V0t5dEdkd3VGU2VZNzNwN2JD?=
 =?utf-8?B?YjYyaE5aeHc1MXRyWjVndHltV0ZIL0dsVjJqUmsxR1o2a2FpK0VzT1JtVnNt?=
 =?utf-8?B?ajh3cmJ4MGszQ3B4NlFQNitRamkyTE1ZQ1BMS04zQmpEcm9sR2VqWGpWb3B4?=
 =?utf-8?B?TnpoMjRDR3EzeDJPS0RXdGpKOXJqQjluMXVwVGYrcXdKVy9MbUhwRXNBZ2I3?=
 =?utf-8?B?bWsrZEpiS0trZUN1MXNEWnpwam5HN0MzNmF4WndNbkYvdVlMT3FJRk9VZGJE?=
 =?utf-8?B?NzE2WXVrVE9HRU8wdWZIeDBGdTBtSmFhbDFTcUxCRC9YL3B0TzVOUFFES2t1?=
 =?utf-8?B?ZzNSb0QwQ1F5c2lqeWVnc015RG8xRVh5WElGTzcwN0ozKzI1Mmx3RGU3ZmVs?=
 =?utf-8?B?RUtQelpWd2JFNVlCUGlzaENqU015eE1SaEFncHpqd3Urckk0NUZ2b2RjUTVp?=
 =?utf-8?B?ZlNobTJxenRVZUY5NkJrUjFqUzN5V2J0OFI1c29QNDA1WCtSRFB1NVEvNHpj?=
 =?utf-8?B?NFlmZzgyUGt0TWVybmJUZzRxNWZuK2Y1dVdwZkhlWSs4S2FqVEVPTEJrTWt5?=
 =?utf-8?B?V0pXbVZUdFZ4V3NqdWZBeE5maEZ2ZnJUSURmTng3aTB2SVJFdUplZEg0eUVm?=
 =?utf-8?B?TzVxbU81dTNyV1l5SHlWckNLS0hhUEhlcWU1R2x0KzJZY3ltRmNSUlpaellh?=
 =?utf-8?B?UVNCZjA4bzNaY2dSR2tyS3BGdlphZlZPYTdGa2g2NG40YVhkaHYxN1ovS3ZZ?=
 =?utf-8?B?dzFscG9nR2xxUysweHhJMVljeHh0dzdHbWRPdEhPS3pLOGZJNWowV2EvdVRz?=
 =?utf-8?B?SzdONzBwN1E4NUdhTnRlYlg5K3BaTlRlUWJKU3hnT1NQM1VydVJ5K3NLWU94?=
 =?utf-8?B?MW55bWFwSitjR3ppK3d1eTRhS1hhQW9GOEsvQWN5MlRGM0NrcDVmSkRtOE5m?=
 =?utf-8?B?dEdObGJyblc1SDhQRlJ2Y0pSZVZiS0Q4ekgyWWpNYXZ4S0VyNUExeU9hdmtv?=
 =?utf-8?B?NFg4bit5OVJjb2xSenV1UlkybHJLQUNOaThNT2UwR0VFaVNVc1A1dlZ2eldr?=
 =?utf-8?B?OUNydDFiMnNQUmZaczhvQ0tZMTdWcjhDbk1OQlB3d2FQanJ5c2JUM0FjdmxN?=
 =?utf-8?B?NGRWbzMzNGJXSXFGeUZUQU5VK2xwRWQyaXNKSU44WnhMOVZyaDR0TlVhWEJ1?=
 =?utf-8?B?bVIvbWNHTjR5dGdQQWc3Skc0M05HaVJMTFdyOXZxeXUrejlpdGpxd1JNOHA4?=
 =?utf-8?B?ZVhxTVJ4MHBWR3BEVy8wbXVwTFNJcDd4MUxXYjVyWGl2TndhQWFKUW9SVzlU?=
 =?utf-8?B?VkxJRllxYjBpUnhoZUkrWUxWRTdPRzVFSEJKU0daZk9MMThTWXRDclB5VitC?=
 =?utf-8?B?SzVkVDIxWGpJS0t5Z0lTd21EUTZLa1V3RzVHTkNzVkJLZGdGT0pKTmRKNnEr?=
 =?utf-8?Q?ozNTxcgHUbs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2211c7b2-7915-4b96-7f1c-08de4872507e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 13:41:34.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6041
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang {struct file_ra_state}->ra_pages and
 {struct
 bio}->bi_iter.bi_size is defined as unsigned int, so values of seq_file_ra_mul
 and max_io_bytes exceeding UINT_MAX are meaningless. Signed-off-by: Yongpeng
 Yang --- fs/f2fs/f2fs.h | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.66.58 listed in wl.mailspike.net]
X-Headers-End: 1vawSO-0002Wf-8q
Subject: [f2fs-dev] [PATCH 2/2] f2fs: change seq_file_ra_mul and
 max_io_bytes to unsigned int
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

{struct file_ra_state}->ra_pages and {struct bio}->bi_iter.bi_size is
defined as unsigned int, so values of seq_file_ra_mul and max_io_bytes
exceeding UINT_MAX are meaningless.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53cbce96f126..027ff3080941 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1762,7 +1762,7 @@ struct f2fs_sb_info {
        unsigned int total_valid_node_count;    /* valid node block count */
        int dir_level;                          /* directory level */
        bool readdir_ra;                        /* readahead inode in
readdir */
-       u64 max_io_bytes;                       /* max io bytes to merge
IOs */
+       unsigned int max_io_bytes;              /* max io bytes to merge
IOs */

        block_t user_block_count;               /* # of user blocks */
        block_t total_valid_block_count;        /* # of valid blocks */
@@ -1910,7 +1910,7 @@ struct f2fs_sb_info {
        unsigned int gc_segment_mode;           /* GC state for
reclaimed segments */
        unsigned int gc_reclaimed_segs[MAX_GC_MODE];    /* Reclaimed
segs for each mode */

-       unsigned long seq_file_ra_mul;          /* multiplier for
ra_pages of seq. files in fadvise */
+       unsigned int seq_file_ra_mul;           /* multiplier for
ra_pages of seq. files in fadvise */

        int max_fragment_chunk;                 /* max chunk size for
block fragmentation mode */
        int max_fragment_hole;                  /* max hole size for
block fragmentation mode */
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
