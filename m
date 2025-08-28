Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B0B39482
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 09:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3gi6zfxPB2Dum+zowN5zaE06MxjGLBOiJqUXwxqmq4=; b=HyiXQfhgm6KDBk/2qAPlYwOveD
	hJkmZ3XPm2IId48AG4cHVfifsY3d6OaX3BdKSgSxOOq77qJ1DdHsAoMwQigxcX994qR8+OmMPHL7p
	g+fIF6Jd+JSgTi7/F/RgQXJ7DxDKn91Jk4Nk2BQmJyMWm74fj8qJBiwo+lXiXFEIR9sU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urWgW-0007Fq-AY;
	Thu, 28 Aug 2025 07:04:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1urWgU-0007Fb-NL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 07:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xj7zUt49nMaZ3sPNNiiCDXZR70XlnYePDZsW34AswXQ=; b=NgSFpQ8KLZr249bCaV8zKPCfG+
 kOGXfJabtn7IEu03eoEe+9jBzykm2Ghh7ZZ1cmbuOaSl3IKhwdO7YINrgwYhItM44VG2qI5RBVQZH
 oipKLljY1nrzRHtHZLXEeSwEALhy5z45rwOABvvs78GfuomnU+rmNfSQ8JeScx5/sDDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xj7zUt49nMaZ3sPNNiiCDXZR70XlnYePDZsW34AswXQ=; b=OWkpAZtvTbUqlLB/4yBC84tHfA
 QrpuYvauPVj1oVDzODlC+NQ1wlAPYa6vIQtH3am6uVhOURPRMDcbTtdbHbGZzYkDAsg4PXLe25gq2
 qkFCpbaPIeEAgSEWBbfMF66pq3fo27GPRODcbDFCMtnzz6nLXLg8jgYgd/iNgsOV0bD8=;
Received: from mail-japaneastazon11012062.outbound.protection.outlook.com
 ([52.101.126.62] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urWgU-0005Lq-7V for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 07:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itqGQm76vhXs08QZ0Hom93bLTumlJvN4Im7CnioXQzzQ2OGagnrtIVnWfYbBIFfy+siqDPebvCuoVbMhTxGQDqTyNZEY/VvwHcB5MJitfdPZvX/L/G8TfHIkgBlz3hQYDDI/BHerqc+XWnQphG6dvsh8UWVgjy+73eh0jG2kyEFQRu3+aCI96DAXTNDtXBXHzTAJzB6mX19UgGWGqorgF1qz2zdxd15O0aTeJVewhe3GhnblPCsuyveUB0enZl3z+ienys4Ytw3FNQfqI9WnnI1ukrIk0jpBHvcAA30Z1y0h71rk2p8E1hX4I8UrBEKgmv8H8lsOXqaTdX94lBAzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj7zUt49nMaZ3sPNNiiCDXZR70XlnYePDZsW34AswXQ=;
 b=eAIp5Fkhcll7sR06TV4dwwHTHlC9jTnbXFoLdHWi1aqoWvyfueyZkaikj2Lmv1maJQKGQxqOSKRCgS5usOfENSsOTtZebCO+XEjRB+PhKwwEM7oNG5qSdaDAnkX9H6p6JGZPW+i/XLaDnULE2IfdeZvc8oJpk9g+CutrpVKuN3wsQZKyAqwVrukkAaVI3r6gx2YP/BIpOz2/gYxsKgIpeosrmtDH1m6+L8gQz5pj/L6ZmhANI5v3K5Jo+hlSscOhUiVAUZEvHRGDdh7x6/eOw896YBxuox3QhEAefozZGFYQ78AabeW6Z2+zjBBfkz7XqNDhHyD04V/g2W+bPYzxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj7zUt49nMaZ3sPNNiiCDXZR70XlnYePDZsW34AswXQ=;
 b=anOnhwXWv/3O5z0RG2/lSR0oAKxSowtsm9X4XTRbxvTQU3jCjrhaCdOZWB16rodxvHUXZwpnLjWh/AyISN5mzTOoG7/HNISBIxktsVADnKQ0ydFPA0m6KItSWeoLOBBlplxKy5T9FTlxKsPB83yWa7K+HWnudk5xgMg7ga485Un0OPzU3qSUqDAVDoWfn3TQ1cnhJL9i27hGGnh2aQ+tY3V4o/2cpGLZnkIFa+9jABPBfFyJKCzKanHgGe7iVtB27a0GK1OoGuN8jwx/lEAqEuV4hdv6v0OWvs99cwAOT8sY+xUaczwGEb4hqUJ77HjtxXFL76fRf5n1VdvIWuJWLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SG2PR06MB5405.apcprd06.prod.outlook.com (2603:1096:4:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 07:04:25 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 07:04:24 +0000
Message-ID: <35664093-198b-40c2-84a7-58e7c4794898@vivo.com>
Date: Thu, 28 Aug 2025 15:04:20 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>
References: <20250826140539.521074-1-liaoyuanhong@vivo.com>
 <5c955a76-8a12-4001-b89a-8e1b84b36564@kernel.org>
Content-Language: en-US
In-Reply-To: <5c955a76-8a12-4001-b89a-8e1b84b36564@kernel.org>
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SG2PR06MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d331c86-0cb1-42bc-4281-08dde6011ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGlObFVJM0FlREJIMGZrR0FpUVl1dHhHU1BUZTdXMXUxdHIxdE9CeG93V0w4?=
 =?utf-8?B?T052MHFyRzl3cXhkU1hvVnJMQlhtZ1pDR1RuNDBOVkRmU05CUUV2T0R2bkhW?=
 =?utf-8?B?eGxCSlVqTlFHMk1RbzZNUUNEMEhOZlh3U1hqK3hzbHhPT1YyUWM5Q1cydmlH?=
 =?utf-8?B?T2MwQ3VXdEo5SHBINk1MY09tdjlhNGVnNFJmSmVDNUZLbm9Vc29nYUowQjR3?=
 =?utf-8?B?MUxRNGp1QWRNWGtmRUJjdTVQckxyODBjZkdPck82M1JsY1FUZnc2NmxZa0Jo?=
 =?utf-8?B?VHhPUVlCN0pCVGhWYks1OHFha2NhS2dGTTRZdTVpRXpGL2Yrenk4MVZveHZm?=
 =?utf-8?B?VGRIUnE5YTVYc2lYRVFUaVVPdWhyVzBVNGh2RGZ3WW5raUh0dzNSSUI2RDJW?=
 =?utf-8?B?MzZ6bXdDVXRXMjczb1B6WTcvYXZDeCs1SWVlMVB0dUpLeXpqTFozRTVkeUtT?=
 =?utf-8?B?NEg1bUlnWWx5eVdOcW9CNmtaTkV4aG1MbDNZak5RMkM1UUFJV3d2MFZjb01D?=
 =?utf-8?B?SW5KdERCejE2Z0N5dHdvcFMvZGpoZ3V2YytqMXg1cVp0NEtaOHI0dVhYdlJ2?=
 =?utf-8?B?Y0JURzFpU1JRd1RIQWt1ZURjTnJjd0lTd0FHcitqWktLQlU3dDVsY3JWS0c3?=
 =?utf-8?B?dzJaZ3JUdkZUMUNKME9tTmhSYXZ6ckRtd0F3UWZNMVlOU3Vlcmw1b1BCcGdB?=
 =?utf-8?B?b2FlcU1ZcnF4cXpEYzFnL0NCQlgza0JwdjdIMjNqUjN1QTBoc3lUWGJWTVdB?=
 =?utf-8?B?YklQSmNZSS9JOWVSSkdqUnBOdFdwbVJabWdxV2M4cXZ2aFZzdXFtRFJpd0NQ?=
 =?utf-8?B?bWsvWFRFY1d4MTNHeVdFcGFmVFhyeEJxNjhUU1ZrdVMyM1pXQmJ1Z1RzeUIz?=
 =?utf-8?B?Qm1XMyt5Wk11WS9sTzBUR0RsSnhQZlA2Z2h0MjNuRmZudDRPTUpJbHVudkx5?=
 =?utf-8?B?a0N0Z2M2SGl4T2Z5Zk56MTFZdnJZc3JDRE1DdHJ4eGxPbldIdC8yeGtLbFVC?=
 =?utf-8?B?WkJKS29MbFZmdWhsdWcxTXhlN3IvVWFTZnFaN21VZHlqb1Rzd0tqL09NTzNm?=
 =?utf-8?B?RlQ3bkkrQXFRUEhyQjVPSU4vVjJzMGE0UDJ5YS80SEFRYmRSNVZFNzNLZWFk?=
 =?utf-8?B?L2hqTXpEUGFYOERBV2htWk9lTGxpT2xPclcvM2lhMXRiaFl6TmkyWXNIaVFz?=
 =?utf-8?B?UE5yS2ZOTmYrZVlWWC9NbnVwZ2dTQlF1ZWpjMkVrUDkvaVNsREdYZ3RxNEtZ?=
 =?utf-8?B?QUhHamZqcytUSG96c21ERFhNYW4xOTUrR1pLczVvbTBXLzFYdVdaamJuTlk3?=
 =?utf-8?B?S1ppbWZ4NXd1S3VJaHdFVE41dVR3cG5FcmpHTWdtbFJtV3hieDB2d2IvMGEy?=
 =?utf-8?B?ejV1a1hySWJyTlFtQjErZU1nbzlXUFpURGxHektBZWNXZE15dnk2M1BLTHdr?=
 =?utf-8?B?UWJEdUZEdHlSbXlYNEFJME85UnAyNkpWN0M0ZDJzY3doS29SWEt3Y1hiSnl4?=
 =?utf-8?B?YjBYRXNJSzZ6VWxvYzJEaUJqb3pQbkJBUEtlWVkyRjg2ZEx0SHY0ODdCSzZW?=
 =?utf-8?B?SnI4THhiNHh0UlJGTjZsQmY0bU5EZDZRUzFQd0haWVBpK0JGRjR1b0JZQW56?=
 =?utf-8?B?YndDWFZjOVZiSkJtaTBZN1VES2JjR2c0K2Q5cnQ0NUZqTlMwNGdiQlp2T0Jp?=
 =?utf-8?B?NHFTdkM4WEdicXF2ZWVOalZGTnkrdFJneS9GVVpjcGlxWnNpSEJrODBIYmhi?=
 =?utf-8?B?UlRaN0hWekJYaEpyeit5blRyNG9kbWErdW9scXNmMjRBbnEvYzNDdUVISk02?=
 =?utf-8?B?V0JmdkhNTnU0d3ROdGtkMEJBWnVwdTIxeXZmdGFXNVhQNzJhMlBwSG1kUzBM?=
 =?utf-8?B?UWxyRDFKem9CSWFRMTMwbU9sUDFxakRsOVprZzVwR2czVFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnhMZmU5L05BRW15MmpJSll0RlVaUlYyT3ZsL1NZY0tlY2NFbmUzMmNaVmpv?=
 =?utf-8?B?bWx3NzJkaWJ3aGI1ZkdLenQrR2RMVDJpUk5peklkaVd4dXljMGxxU2VBMTVQ?=
 =?utf-8?B?UW1zVTlJVWQwd1FWQ053Q0dWWTIrWEtUeGFMV2tvQTY5Mm1iaVdRekV3K2NW?=
 =?utf-8?B?eW5raDVBYk1pcGFZMk8zeWt4QmZjdjNnaCt5R1QxYlhadUtJandwN1dPajJl?=
 =?utf-8?B?MUMyUDJoUTJTTmtWMzFicGY1ajZMWjZyWkVTY0dpbGtmenhnOHRKcTFiZ0hX?=
 =?utf-8?B?SVpxQVhadEt3c0JJWTdvMjFXS1V2V2dMMnFTMm84QVdUaXpuN3IzZG9XcUlG?=
 =?utf-8?B?Z3YzcGlmU2NjQzVZRmpkMVE2NjNZVnNXVGZDUlVrQXdnYU12TXdTMllNWkRX?=
 =?utf-8?B?WmpsVDIvVFhCT3JSaWQxZm9ENTRGYlF2SEdoZXlJaHdRb3dSRm8zZXpINnVQ?=
 =?utf-8?B?TC81enZuRmh1clRnei9TdUtweUcwRS83cGsvQkN3TGVjUGdHNWkxdWhYblNH?=
 =?utf-8?B?QTlOVmxwcnFrekZiTW5jVHBjclhrSkp3THM2a28wcG0zMmZXN2lRSU5VVkd0?=
 =?utf-8?B?RjI4TGNIc3RVdXdZUUJxY0h6VmlpZU50OEpRTWZZaW5Eank1YmMxNm5kYmt0?=
 =?utf-8?B?aDduWEQxVVNhVkZYQ0R6RXVuTUZDdUVQYTdXenZxTGpNcTdWb0FCWi9GUG5s?=
 =?utf-8?B?ekZNdCthTE5NZ1lwSDgvMm16MnNkbVE4TGJtYmVuWW5ReEk4SjlhNDVqQ01Q?=
 =?utf-8?B?anYwYW40cGg4N2dvRFVOdHV0bytoQ1M4TmNsRlhnYWg3UEdzUG1yc1NlcmxI?=
 =?utf-8?B?NWo3TTltUWMzeUJObWhTbXBFOEJkMEl1MDkzZWhsY1hzVTBGWmtnRnppTjBp?=
 =?utf-8?B?dlgzcldpM0VQUjZ0S2R3aUZJWU9kQVBNVGxpSlNCYi9rVDc0TElpRVRtNmV6?=
 =?utf-8?B?SkhwdmIvYVl1dy9BUFFwb2gwTmF4OUFLSkhTakdiKytZYStyUkZxN2xyeGFY?=
 =?utf-8?B?Z1lJTXhDZ3B4WncvWURGLzVIeGRjMlZCSHN3UnNJL3lLdldGQVpVd0RMYWFr?=
 =?utf-8?B?TC85Rll0Q25EdUdWRWhYV251UTEzZXY1WFdPMjlubzZZNHZSbnRzUklPa28v?=
 =?utf-8?B?aklvOWEwVWtDUE9PR2tLa21wM1FneGpoWmFaV3NKVlVQdEI1VkgxWmNDU29L?=
 =?utf-8?B?bFN0WmZPQTBlNm82TXRncEdiK1NNbi9IVjJ1enBNZm1CM3FvZ2dkS3JmcVNj?=
 =?utf-8?B?QitiRXQ0cHFyTWhSTG1ZeHlLZG54WTFaRDZNVXNHVlVJMHRZVHh1aURjRGIv?=
 =?utf-8?B?eGgwTkFFRWhyUUw4SzdUakd3a3NtTlpxemVaV3VPOVAyU1plRTZCZytxazdX?=
 =?utf-8?B?aWFJcjdrL2xsVXBrcDdjZmlCQkpPZW1HOWU4MWdRNmJLcWxPWWpHSW0vRjNl?=
 =?utf-8?B?amZmOVE4Q1lWaEVkUldMVEQxK1liT1l6eXBsN2w3Ry9qaG1GMzdpSW14Y2Na?=
 =?utf-8?B?SDRKdFhaVytoNE9SUHdrWmVzcnJkZHZwZHBjaktQdGcvSWdjUlhaV1EvV1ZD?=
 =?utf-8?B?dms0bTVvdTNFcVZZTEhuUklVc2JKamozYUFXWG95M00reC9ucUF5NVNoclFN?=
 =?utf-8?B?S2JEazlZNjBoeVd2MWVSbnRuaGJOaHh4OXFwNlo1YW4rTUhLbThmUmsxaTRy?=
 =?utf-8?B?Z1VIdzU4RUg2bVg2UXVDR1FacENBekJUeVQydlBUTWl2Mkw2WkZ6cTh1MXdN?=
 =?utf-8?B?bTZXelhrNWxBNTQralpxUDE2V3JveE1ZN1hoM2hUdGFvQWw4U0VaT0NrK0Vx?=
 =?utf-8?B?SEMvQ1RGVUIvZm1TRERrMEQ5Q21BSGpGTU9MN09Yb25naU5QODVKUmFMeTJR?=
 =?utf-8?B?bTUwT1JJSlRTeWlMK3lxU21CTHhwSG5oZEg4WUhSSkh1OXZZV3d4Y1NZVzJY?=
 =?utf-8?B?aFV1U2pBN09XSXVFV041Nkk1OHRGR25FL0pWT2FDdEF0dU9pZ0JuaExOZVZV?=
 =?utf-8?B?T3ZHejRsU09oeWJuclFTeGhKYUpLTnRKOWtBQ1Y4bExsQnJoRC9PMGNGWUcz?=
 =?utf-8?B?UmxIK2xvUXZqZFpOWmFwcFJDdTd6YzRSN3JwNTQ2YzJ3YzBuVmwyZUFLQUtS?=
 =?utf-8?Q?Y6j20W0pzA11xivX5KizLpRNF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d331c86-0cb1-42bc-4281-08dde6011ec1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:04:24.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJv+4/JbMUz00W5EICgYDdPxtaJkYy71uKZelLLGTEVPaSnF947FsNM2FwRAcOsre98rPF7YDePU4AvPZmfqXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5405
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/2025 10:10 AM, Chao Yu wrote: > On 8/26/25 22:05,
 Liao Yuanhong wrote: >> Introduces two new sys nodes: allocate_section_hint
 and >> allocate_section_policy. The allocate_section_hint identif [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1urWgU-0005Lq-7V
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Use allocate_section_policy to
 control write priority in multi-devices setups
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 liaoyuanhong@vivo.com,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 8/28/2025 10:10 AM, Chao Yu wrote:
> On 8/26/25 22:05, Liao Yuanhong wrote:
>> Introduces two new sys nodes: allocate_section_hint and
>> allocate_section_policy. The allocate_section_hint identifies the boundary
>> between devices, measured in sections; it defaults to the end of the device
>> for single storage setups, and the end of the first device for multiple
>> storage setups. The allocate_section_policy determines the write strategy,
>> with a default value of 0 for normal sequential write strategy. A value of
>> 1 prioritizes writes before the allocate_section_hint, while a value of 2
>> prioritizes writes after it.
>>
>> This strategy addresses the issue where, despite F2FS supporting multiple
>> devices, SOC vendors lack multi-devices support (currently only supporting
>> zoned devices). As a workaround, multiple storage devices are mapped to a
>> single dm device. Both this workaround and the F2FS multi-devices solution
>> may require prioritizing writing to certain devices, such as a device with
>> better performance or when switching is needed due to performance
>> degradation near a device's end. For scenarios with more than two devices,
>> sort them at mount time to utilize this feature.
>>
>> When using this feature with a single storage device, it has almost no
>> impact. However, for configurations where multiple storage devices are
>> mapped to the same dm device using F2FS, utilizing this feature can provide
>> some optimization benefits. Therefore, I believe it should not be limited
>> to just multi-devices usage.
>>
>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>> ---
>> Changes in v3:
>> 	- Refactored the implementation logic of allocate_section_policy in
>> 	get_new_segment(). The current version has a more coherent and readable
>> 	logic while maintaining nearly the same functionality.
>> 	- Added a validity check for allocate_section_hint in get_new_segment()
>> 	to prevent potential conflicts that MAIN_SECS() might cause.
>> 	- Adjusted the initialization position of allocate_section_hint, now
>> 	initialized in init_sb_info().
>>
>> Changes in v2:
>> 	- Updated the feature naming to better reflect its actual functionality.
>> 	- Appended patch description to clarify whether the usage should be
>> 	limited to multi-devices.
>> 	- Improved the code style.
>> 	- Fixed typo.
>> ---
>>   Documentation/ABI/testing/sysfs-fs-f2fs | 22 ++++++++++++++++++++++
>>   fs/f2fs/f2fs.h                          |  8 ++++++++
>>   fs/f2fs/gc.c                            |  5 +++++
>>   fs/f2fs/segment.c                       | 15 +++++++++++++++
>>   fs/f2fs/super.c                         |  4 ++++
>>   fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>>   6 files changed, 72 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index ee3acc8c2cb8..b590809869ca 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -911,3 +911,25 @@ Description:	Used to adjust the BG_GC priority when pending IO, with a default v
>>   		bggc_io_aware = 1   skip background GC if there is pending read IO
>>   		bggc_io_aware = 2   don't aware IO for background GC
>>   		==================  ======================================================
>> +
>> +What:		/sys/fs/f2fs/<disk>/allocate_section_hint
>> +Date:		August 2025
>> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
>> +Description:	Indicates the hint section between the first device and others in multi-devices
>> +		setup. It defaults to the end of the first device in sections. For a single storage
>> +		device, it defaults to the total number of sections. It can be manually set to match
>> +		scenarios where multi-devices are mapped to the same dm device.
>> +
>> +What:		/sys/fs/f2fs/<disk>/allocate_section_policy
>> +Date:		August 2025
>> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
>> +Description:	Controls write priority in multi-devices setups. A value of 0 means normal writing.
>> +		A value of 1 prioritizes writing to devices before the allocate_section_hint. A value of 2
>> +		prioritizes writing to devices after the allocate_section_hint. The default is 0.
>> +
>> +		===========================  ==========================================================
>> +		value					     description
>> +		allocate_section_policy = 0  Normal writing
>> +		allocate_section_policy = 1  Prioritize writing to section before allocate_section_hint
>> +		allocate_section_policy = 2  Prioritize writing to section after allocate_section_hint
>> +		===========================  ==========================================================
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 6cde72fce74e..7c6bfee81c61 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -162,6 +162,12 @@ enum bggc_io_aware_policy {
>>   	AWARE_NONE,			/* don't aware IO for background GC */
>>   };
>>   
>> +enum device_allocation_policy {
>> +	ALLOCATE_FORWARD_NOHINT,
>> +	ALLOCATE_FORWARD_WITHIN_HINT,
>> +	ALLOCATE_FORWARD_FROM_HINT,
>> +};
>> +
>>   /*
>>    * An implementation of an rwsem that is explicitly unfair to readers. This
>>    * prevents priority inversion when a low-priority reader acquires the read lock
>> @@ -1856,6 +1862,8 @@ struct f2fs_sb_info {
>>   	bool aligned_blksize;			/* all devices has the same logical blksize */
>>   	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
>>   	unsigned int bggc_io_aware;		/* For adjust the BG_GC priority when pending IO */
>> +	unsigned int allocate_section_hint;	/* the boundary position between devices */
>> +	unsigned int allocate_section_policy;	/* determine the section writing priority */
>>   
>>   	/* For write statistics */
>>   	u64 sectors_written_start;
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 098e9f71421e..b57b8fd64747 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -2182,6 +2182,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>>   	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>>   	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
>>   	MAIN_SECS(sbi) += secs;
>> +	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
>> +		sbi->allocate_section_hint = MAIN_SECS(sbi);
>>   	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
>>   	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
>>   	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
>> @@ -2189,6 +2191,9 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>>   	if (f2fs_is_multi_device(sbi)) {
>>   		int last_dev = sbi->s_ndevs - 1;
>>   
>> +		sbi->allocate_section_hint = FDEV(0).total_segments /
>> +					SEGS_PER_SEC(sbi);
>> +
>>   		FDEV(last_dev).total_segments =
>>   				(int)FDEV(last_dev).total_segments + segs;
>>   		FDEV(last_dev).end_blk =
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 04b0a3c1804d..e86b78111444 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2807,6 +2807,21 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>>   	}
>>   #endif
>>   
>> +	/*
>> +	 * Prevent allocate_section_hint from exceeding MAIN_SECS()
>> +	 * due to desynchronization.
>> +	 */
>> +	if (sbi->allocate_section_policy != ALLOCATE_FORWARD_NOHINT &&
>> +		sbi->allocate_section_hint > MAIN_SECS(sbi))
>> +		sbi->allocate_section_hint = MAIN_SECS(sbi);
>> +
>> +	if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT &&
>> +		hint < sbi->allocate_section_hint)
>> +		hint = sbi->allocate_section_hint;
>> +	else if (sbi->allocate_section_policy == ALLOCATE_FORWARD_WITHIN_HINT &&
>> +			hint >= sbi->allocate_section_hint)
>> +		hint = 0;
> I suspect use of sbi->allocate_section_hint and sbi->allocate_section_policy may
> race w/ their update via sysfs node.
>
> What about this?
>
> unsigned int alloc_policy = sbi->allocate_section_hint;
> unsigned int alloc_hint = sbi->allocate_section_hint;
>
> if (alloc_policy != ALLOCATE_FORWARD_NOHINT &&
> 		alloc_hint > MAIN_SECS(sbi))
> 	alloc_hint = MAIN_SECS(sbi);
>
> if (alloc_policy == ALLOCATE_FORWARD_FROM_HINT &&
> ...
>
> Thanks,

Okay, I will upload the v4 version with this fix later.


Thanks,

Liao

>> +
>>   find_other_zone:
>>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>>   
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index e288b7be3131..924ad2216f67 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4238,6 +4238,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>>   	sbi->total_node_count = SEGS_TO_BLKS(sbi,
>>   			((le32_to_cpu(raw_super->segment_count_nat) / 2) *
>>   			NAT_ENTRY_PER_BLOCK));
>> +	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
>>   	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
>>   	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
>>   	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
>> @@ -4721,6 +4722,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>   	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
>>   	sbi->aligned_blksize = true;
>>   	sbi->bggc_io_aware = AWARE_ALL_IO;
>> +	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
>>   #ifdef CONFIG_BLK_DEV_ZONED
>>   	sbi->max_open_zones = UINT_MAX;
>>   	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
>> @@ -4752,6 +4754,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>   					SEGS_TO_BLKS(sbi,
>>   					FDEV(i).total_segments) - 1 +
>>   					le32_to_cpu(raw_super->segment0_blkaddr);
>> +				sbi->allocate_section_hint = FDEV(i).total_segments /
>> +							SEGS_PER_SEC(sbi);
>>   			} else {
>>   				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
>>   				FDEV(i).end_blk = FDEV(i).start_blk +
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index 1ffaf9e74ce9..81b99c2a02a9 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -889,6 +889,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>   		return count;
>>   	}
>>   
>> +	if (!strcmp(a->attr.name, "allocate_section_hint")) {
>> +		if (t < 0 || t > MAIN_SECS(sbi))
>> +			return -EINVAL;
>> +		sbi->allocate_section_hint = t;
>> +		return count;
>> +	}
>> +
>> +	if (!strcmp(a->attr.name, "allocate_section_policy")) {
>> +		if (t < ALLOCATE_FORWARD_NOHINT || t > ALLOCATE_FORWARD_FROM_HINT)
>> +			return -EINVAL;
>> +		sbi->allocate_section_policy = t;
>> +		return count;
>> +	}
>> +
>>   	*ui = (unsigned int)t;
>>   
>>   	return count;
>> @@ -1161,6 +1175,8 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
>>   F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
>>   F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>>   F2FS_SBI_GENERAL_RW_ATTR(dir_level);
>> +F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
>> +F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
>>   #ifdef CONFIG_F2FS_IOSTAT
>>   F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>>   F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
>> @@ -1398,6 +1414,8 @@ static struct attribute *f2fs_attrs[] = {
>>   	ATTR_LIST(max_read_extent_count),
>>   	ATTR_LIST(carve_out),
>>   	ATTR_LIST(reserved_pin_section),
>> +	ATTR_LIST(allocate_section_hint),
>> +	ATTR_LIST(allocate_section_policy),
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(f2fs);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
