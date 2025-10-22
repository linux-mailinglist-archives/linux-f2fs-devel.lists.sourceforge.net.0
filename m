Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB2BF9944
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Oct 2025 03:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:To:
	From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98nZbxkp+ENcWedQLAJHKCFruVl1IomVoUsTYBi/Ivs=; b=MWMb/vIcLpUzNI7iU96a22atl7
	SMzk2oIvcrtc5zo/4+dmo/wT6cJPxKlB4+j/AsIFoslM52vMD+bDoAV3CooK/L6P94D+QTZbD8X2+
	pEETMmOVMBx9imjfZnWz990FYO5GHtUc+LnUXeKpL3eUShJvqiz+9RR3cT6H9wjoty94=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBNPP-0004c9-3E;
	Wed, 22 Oct 2025 01:12:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SJB7183@PSU.EDU>) id 1vBNPN-0004bq-8J
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 01:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjT2c2/ykb/+fMR1SVGhVsyiv/gvvvpu3bvJe5dsqkQ=; b=IY/2FNpUtCnMXqutDZrVmKe1+e
 A5OQ5woH7OsHvLkEIjjCclqP4/mY41MBZYCUl4q8aqsI9rCBFhwsWX9sohjsPbJP02v636L/+B6AF
 jEvQyYm3zaXqw7H9oj3G/SPa/TL1Bjody+WIg0kjRQYBjYqh2Gv4EIbx0XyEWJ0+Ym1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjT2c2/ykb/+fMR1SVGhVsyiv/gvvvpu3bvJe5dsqkQ=; b=POX+oN1j09fkFa6bOPIBleuEDx
 rehYo+c0TprF9hVbb7KRemAB0UBK6whcDDjDO05xceUpJTtYGrQUk7UZZtlQloFnySVVcPfU4tOn5
 b61tWD+Z7XXDlT5RSRN4jTweFnxJsrfwdQnOoRbokpSkR2IXYSwaMcE/5QRhymJbZ8Sc=;
Received: from mail-westus2azon11012005.outbound.protection.outlook.com
 ([52.101.48.5] helo=MW6PR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vBNPN-0007tL-86 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 01:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4jjkCfOTX6+aaWvXdUp6bMAimyLGX0xlxkDESFJE29IKpQh9C7Ir62aovSXzOWtn9wYWUon/ZmBnqpfWZW2SFdJl9wGAZzl7mGxePrAJE0JHB3gFsnUQ3e/vK4ya1/apcmpQ69nkatwS1FrZbN4gr6St5YtC5giwDztmriTFz70Md1KO/9LY9HN9/OH37ZV4P1QCEj1Xs8QE4u1TwQGKvnlfmdhMJzZFBXFiujjX41aHqXiCF56xwALyE9upbNzZpO3QkfTKJzmdVeLI4xRD8L3a+gzMLgLPYBXUPsbUXNPzgubifdRKiLHjCYeLui/4irsgiXi0fqTPCS2vbMTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjT2c2/ykb/+fMR1SVGhVsyiv/gvvvpu3bvJe5dsqkQ=;
 b=vEqrsr389vxvf0EfSnOviWVWEDEF7IpzhqY4XJoXaaYzFkG/I1juyhGjO9NI9aO2tcIOT1kjn3lgoYQgsn7WN3sigsmGNDZvEBbZjt9vfbR35+C1DZ90zFsYceZF8g9030n7qiyWWyeeraYy/Toz3Aw5za7zG+qmKEDvF3DMjUp/HvKnyVNbD0wJY+1gFooafyZRcYndoaccKuDAHbaRNLgTfzIAsIb8DfwWvIfCpC8WVtnOOg9zhzBCtv3RTTWmH2MrLZ22qT+7ccgsXH2Qu9fPUp2/wM8yuqJaJIb6ZccHiBwnA7yi5WZeqYjhVeMFTQfYSr7x1sxRn2M5xgrhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=psu.edu; dmarc=pass action=none header.from=psu.edu; dkim=pass
 header.d=psu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psu.edu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjT2c2/ykb/+fMR1SVGhVsyiv/gvvvpu3bvJe5dsqkQ=;
 b=eqZJka2bU9a0cb9YZYcTRQ0XyR+Z3Mhhr4Po4wj35GvJXOd2CQE787q+uDp48P5upPtpTkK9SnRaYAi5OXR5oFK7cuTFQH9zZ4WW9MJF+Zz6HSgQL+Rp9Mt4et1JLFaG27aPvqda3FlssEPfE7razov6XOo1OOAOIthNCPz5F0s4Y8+klfQmEHrH4PJKHeUpRxi0JkKF/JKeyDaW4EShccDBvrlcOPdGfNLM4hxALDPCC+yIeOt4AjD3GBXgv/SDCZ39Sih3Fg+bDWC2TImK0r68lLsRHpGXQPLYD3cx5/c/wpQ0R8wIooXUjNU1zYuWiU1iBmswJJqXycubIP1BOw==
Received: from SA0PR02MB7276.namprd02.prod.outlook.com (2603:10b6:806:e6::17)
 by LV3PR02MB10210.namprd02.prod.outlook.com (2603:10b6:408:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Wed, 22 Oct
 2025 00:57:33 +0000
Received: from SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66]) by SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 00:57:32 +0000
From: "Bai, Shuangpeng" <SJB7183@PSU.EDU>
To: Chao Yu <chao@kernel.org>
Thread-Topic: [BUG] f2fs: divide error in f2fs_all_cluster_page_ready on v6.17
Thread-Index: AQHcO9LikRAKz2pYikuAKVmnd6QgArTKZ9MAgAL+KgA=
Date: Wed, 22 Oct 2025 00:57:32 +0000
Message-ID: <A08A3C40-FC46-4A14-A946-6C5D354FE9AB@psu.edu>
References: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
 <54ad259c-b29f-4444-8d3c-1ec37abc628d@kernel.org>
In-Reply-To: <54ad259c-b29f-4444-8d3c-1ec37abc628d@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=PSU.EDU;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR02MB7276:EE_|LV3PR02MB10210:EE_
x-ms-office365-filtering-correlation-id: dec0bd23-7354-4b5a-c8fe-08de1105fb3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TVdYeTM3NjJSSnlkaG80UUt2SlFmWDhCSDY0Vm9PaHZrUnRzRnpxUE05NmMy?=
 =?utf-8?B?ZFVldGpmT280RTVHTFh6Mk4zQTFKS1Q5VEFrRjZVdFRQQzFUa3gxR3pQT3I4?=
 =?utf-8?B?T0JUcWRsUGN3MVg0MVpoeEw4K1U2aWpvMk9peGpJM1IvTjJIcWc0dVZQV2Uy?=
 =?utf-8?B?czd6ZE1rV2Z6OGV6TCtKK3lNdkdOYWJ3c25idEc0V21ZZU9QYVRpT00zVFV3?=
 =?utf-8?B?ajhhOXZOZGdabW1icEVaSzZid3hBY1J0VDJsUkRpbU04RHc1VlJHTHVkTFNn?=
 =?utf-8?B?amZkK0U1ZHo4bEVscXlmMUZYK0RNdTZyQk1DUVBKOGFYQmZvclg2NGNVN3lF?=
 =?utf-8?B?ZXZTcllZYkdnR2RPcEU5TXpoaXlPL0Nxb2pKSFVuWkprVHNicXQrZG5wL1hv?=
 =?utf-8?B?UU5MQkFuM1FrOHVPSitnWU40ZHNsRkliUUxtYm9FelA5VXJrZDBPMERMbmtQ?=
 =?utf-8?B?bWNsM3hKRHVkbnpyTzhmWmEvNjVRbjJSeFM2YU9RZ0MwcXJIVFQwMlgwUXo3?=
 =?utf-8?B?VE9WV3A3QVZMb1dOUDFSaGFZMGtUT2dacFFzOFRKY005WU5PZ2NhRWhkQVE3?=
 =?utf-8?B?VmsxRGk1NHRBSDZMMDM1eDVvTjc3Sm4veVRBbEZYRmtnU0RmRlluTFhvU1A3?=
 =?utf-8?B?aWg4ZVB3ejN2RnUzWFgwaitMV3lwdHR0R1I1Rnk5ekZ0cXlYeEdqbVU1L2Nh?=
 =?utf-8?B?MmthT2YzQnlkangwajhOUncrL1pJL1RBa1g4VmtwMVkwWVNmYmUvOWZXcVFt?=
 =?utf-8?B?WnhCWi9hQURaWkVqV0Z6M1VpTUp6R0d6NWFOL1hhQ0c0d1B4QmhPSGhiQnFL?=
 =?utf-8?B?amloNTlQZ1htMjEwTVFCL3A1OC81dG02VmduZjBISTVtY1Bid2prbnlOaENP?=
 =?utf-8?B?Qmo0QlMrVFNCbXJZVnpJK3MyZVNHcXNNblBXcXIyekFTNVhGcjUyeCt6SG94?=
 =?utf-8?B?NHUwczJRNXVCdDlxaTNmdklhc04yWEMyUm5xODJGVkdLRUVSNXFOQUhuQ3Fu?=
 =?utf-8?B?V1dsYjFHQjJxdjY2VVNWZE4ycmRJcjZUWGZnMGRpdjJDMysyZDVCUFBxYndD?=
 =?utf-8?B?ajB1RjU1eFBTT0JacXg1dUpyU0RheVZ5bTE1bjlsSE5CdGdINGpGT2d2MEE4?=
 =?utf-8?B?NmxIWkdUeDZBYTlSQUR6bG1xVG1pbUtpSU85Z2syaEE5MGtGTkw3ODlQWVZE?=
 =?utf-8?B?ZkhLUlN4KzNLakhuYVRHRktXSTVJZEpGVzJVRDhSQmFhYzVVZXJGNG85aFZ2?=
 =?utf-8?B?TWkvWGk3eFVTUmhpY0xKc1puQng3WSs2bXJlNTdnTjVHYzZtKytiK29odHZZ?=
 =?utf-8?B?cWtoZHhkcmxVRWNyeVJISmlsZFRMZWRGWFdtVHc5cTVCcGJqWDlNckpUV1Vn?=
 =?utf-8?B?MXlWZkcwRUlZdGpCMk55L1lMZDlZK2Z1MGpsbVN3UHVOZEdoT21lTGYzaGVZ?=
 =?utf-8?B?NXVGYU1ib0lJZndpZ2xwS1JmTUNsOHVsZitUSFZXZjl3K21lN3RyRzJFcnNK?=
 =?utf-8?B?VUI1R1I0dXUrV3kyMExZN2ZUYitJV1VmbitxRFdwVTZJdFRsUE0zU1JJWnNT?=
 =?utf-8?B?OTVuWEFRMGdkNFd0RDA1dEZkSVNYVjNEcnJVM0lPQXRKUnJrK3R5b2tvVG1O?=
 =?utf-8?B?RUNLYzNKeVlYTWJldm9PdUNhWkd1ZzRwQXFJTXljT2FOSXF4NDNKUDdCRDR4?=
 =?utf-8?B?QXBQWG9uWEdGYXREV0YyZFBEY1F3OVpUVzBnQWZXTjBPWE40MW5lVWdUTjAw?=
 =?utf-8?B?RGtWSnRjUndOcFNDSTl5cWkvUHVNaEgzc2xqaHJuS2ZPMURsRW5TRHVadUMr?=
 =?utf-8?B?eSsxL1hNYXVaUUJna3JJeGVtUkFINmZCZlpBekRFdlBXRkwvSVF4R2poalA1?=
 =?utf-8?B?RGFrRVBZL0Ewd3dXWUdhei9wTEVObU1uaTM3MFUvVUZJV1pIVnIrd3FGL3l6?=
 =?utf-8?B?OXBEM3BwUE9UT1ArR1FvTDJSZDlJa0lCSDU4dTU0UkF4dm1WUjFoMXFaRk1t?=
 =?utf-8?B?TVozK0wvVjdwTjljbVdscjJFRml0Z25ER2xQcjBjL24wRUFyOCtiMStXYnh3?=
 =?utf-8?Q?f7n8oJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR02MB7276.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dld2enRrckxxZi81OHo2Z2VpYUgvVFYzNmUvM0ladFJFRzVlaUw4dWxxZTNh?=
 =?utf-8?B?SmNFKzc0MEJlcHBTc0NESktoTEVXNmlGZzUzN2FHenovY3cvZlhPaUdJVTc3?=
 =?utf-8?B?KzFNbzd3dGl1MVhBVlRLWCtNVWl5cVNyMlNGZ2l1ZFlLRWg0N29kc1pxQTEz?=
 =?utf-8?B?dWc5bWtLcEhNQjFZRjZkd1cxQUxSaGlHWURZLzdUSTVKdmliK054QTBnNEY5?=
 =?utf-8?B?aDA5eTNEZzU5UU13RzZyV0x4ZjJqRmk3SWVyNmt2NDRHTjZzKzRKeWo1NGRP?=
 =?utf-8?B?TmNBZDQ5UnBaSXVuejgybDNveEN4Q1ZEejF0T2VWVGgvc3RzbUZ5bnVrZnND?=
 =?utf-8?B?S1dZVWpDY0MydjlhcERNQ29rVDRkcDVkSW1UV0VpVHA3WGxucndWdHdnYnpJ?=
 =?utf-8?B?WWxZa1RXdVRGVnJWbHI3aDg2ZWRlMlJRdm9Ca0R4N2FhOTY0N2RnR0hNbnRP?=
 =?utf-8?B?Qituamk4RDdhbW1WZkhyQVdpQTRPRTZVV3o5V29PUytYQTdDRENLK0xST2Jq?=
 =?utf-8?B?b1FLcWNzRFZDOFdLUFBEVFQzVi9VOE81SXM5MkJWTTBLUFRqL1B0amtQY09C?=
 =?utf-8?B?eFo3QWRwM1VHb0hQc2RuRURFMXVFK2JISUk2VEp2OStvV0JjVHhGZEdvcDRi?=
 =?utf-8?B?S2RqNXBLeUNIa0dtVWhaVXJvcU5JS0ZWSWZ3Z1V3L0lmZUEzYXAyNTZSaXR2?=
 =?utf-8?B?dVdMaDBDeHBpc2VscnZNQ2YyNkZLN0VMNzRhVFhmS2FCeWhVYVg4Rjc5dDhI?=
 =?utf-8?B?Z1ZXZ2RYL1BxT04rell4TDhXMUpCWUJKenNWRCtBZG5KeEdyaDdLdi9VL0c0?=
 =?utf-8?B?WW5iWityckV4V2RVeHZ6K1BBVDFSVW5CUlhNa2ZMMnRnZHdSOGxDTTBZY0pY?=
 =?utf-8?B?N2NTVk4wbVJtUTc2andmQWh0Y1dZWlRLaEcycG93SWdrYmE0NXJrNURlcjc5?=
 =?utf-8?B?TjNEUnYyVS9TYis3N2ZXUTdBdDlvMVdDS2M0ckUrM0R6TFJrQkMybzhPZU9Q?=
 =?utf-8?B?SEV1YncwMHlHS2xXS041bGVBU2liWnVuMFZ1WnE2RW51akExZG1vMTVndDNS?=
 =?utf-8?B?OHZHQUdMMHh4QTJYTnpmUzJkbjhBWXdkNE9GVE9xLzZzc0pyYnpocTFZZXBL?=
 =?utf-8?B?Uzh6THRrREhIdHBPa0xGR08xdE1WSXN4cWxuZTFnME0xZk1CRmo0anJ3YUNL?=
 =?utf-8?B?T3UxMWdTKzBkbTI5VHptOElVRFQyQU0yNnlPSndCQlhJbWI1cS9NQThpYlFt?=
 =?utf-8?B?eGE2cGp0Z0ZBWW9JT2QzWUw0ZitGcG4wVlBzVTRlQ2EvMGt0SCtVTlZtNnBY?=
 =?utf-8?B?YjBnSkxiQzNmZzgwK0pHcnV6QWUwQUU0RCtIcUhrdlcwNDNSVzNhY2N4UW9V?=
 =?utf-8?B?b1AyeU9HZFNPOGU4elpEYysvU2RPMDhIOUsxT1JzZU9oTWtEV2hueEpsSXhW?=
 =?utf-8?B?dWFMcjhBeUdZZ1NkaWEzcnAvVDFRNlY1Syt0L1JCcVFXT0ppRlFUT0ZDb0Zs?=
 =?utf-8?B?M3N0Q2xmOGIyWHUzY2cxRFFmVjZ0WWEydk81M0lKRFRFT2h0azJiaG95NzY2?=
 =?utf-8?B?S3Fkd0lyaTVHSzFqMFBFUDY1NWc5Yzhub2lwVHhNTU9LZXYxMXozNnZhaXh2?=
 =?utf-8?B?ZjI3eUlkM2JVTlB3cmtPTS81eWREdnBhTXZPVmFRc1ZFZ1BkbW5VVVFHYWE0?=
 =?utf-8?B?SGcrcTJSdk1QL3JsWXgxRnJ3eEloNHBaUzJmNHpUUVQ5UDdjYngyRjJwS3VN?=
 =?utf-8?B?MTIwTnJmY1dxUk1LNUVxN2g5Uk9sK096bzV3ODM2eVJGSFkzc21pZU9BbE9W?=
 =?utf-8?B?NnFoWXRQb1V1VkxSUUV0VjhaTkN5alBRUm1GYmRnVUdQeVJKU3NEK2txWFl1?=
 =?utf-8?B?bklJNTF6Yk5XYURiVEIyYkJRRDFJZnE3dCtsK2xmaFMxcEtnenNjSis4aHRJ?=
 =?utf-8?B?SzlYM2xhQkFNU0dWeTFuYVlPbXRxSkNua0ZBeVlaZFlrWE0vZktzLzRaYXRt?=
 =?utf-8?B?cjJMQk5HTitBTGxuWmpTWG1IRlVHbytBRUx6b0FMT0xZaHFHWVh4TzM3TmVs?=
 =?utf-8?B?eDdIQ09DTDJCVVRjT3JYcy9nYmg1Wk5qbk1palhRUGpwQ2lHUFFMbWlIU2t3?=
 =?utf-8?B?eDRSN1ZEY1lHL3R3OWZqYzJwcGp6L3pYdUhqdzhsazhDMXIwczlmWit6SlQr?=
 =?utf-8?Q?TnrM61J/z2DZQLlr60JRMzrLtUeFGB2w/Z1YJh/WdwYy?=
Content-ID: <06727A8F2EADF24DA507BB5C3632FA2A@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: psu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR02MB7276.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec0bd23-7354-4b5a-c8fe-08de1105fb3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 00:57:32.0537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7cf48d45-3ddb-4389-a9c1-c115526eb52e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlDMqmGz7zkXJIby1rEvAhD2l40y2SPYJilDNLgHJnyeFE7EOHF65gvnhEOZSdmO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10210
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Oct 19, 2025, at 23:15, Chao Yu <chao@kernel.org> wrote:
 > > Hi Bai, > > On 10/12/25 23:49, Bai,
 Shuangpeng wrote: >> Hi Kernel Maintainers, 
 >> Our tool found a new kernel bug "divide error in f2 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.48.5 listed in wl.mailspike.net]
X-Headers-End: 1vBNPN-0007tL-86
Subject: Re: [f2fs-dev] [BUG] f2fs: divide error in
 f2fs_all_cluster_page_ready on v6.17
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gT2N0IDE5LCAyMDI1LCBhdCAyMzoxNSwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToNCj4NCj4gSGkgQmFpLA0KPg0KPiBPbiAxMC8xMi8yNSAyMzo0OSwgQmFpLCBTaHVh
bmdwZW5nIHdyb3RlOg0KPj4gSGkgS2VybmVsIE1haW50YWluZXJzLA0KPj4gT3VyIHRvb2wgZm91
bmQgYSBuZXcga2VybmVsIGJ1ZyAiZGl2aWRlIGVycm9yIGluIGYyZnNfYWxsX2NsdXN0ZXJfcGFn
ZV9yZWFkeSIuIFBsZWFzZSBzZWUgdGhlIGRldGFpbHMgYmVsb3cuDQo+PiBLZXJuZWwgY29tbWl0
OiA2LjE3DQo+PiBLZXJuZWwgY29uZmlnOiBhdHRhY2htZW50DQo+PiBSZXByb2R1Y2VyOiBhdHRh
Y2htZW50DQo+PiBUaGUgcmVwcm9kdWNlciB0cmlnZ2VycyB0aGUgY3Jhc2ggcmVsaWFibHkgaW4g
fjUwMCBzZWNvbmRzIG9uIGEgUUVNVSB4ODZfNjQgVk0uDQo+PiBJ4oCZbSBoYXBweSB0byB0ZXN0
IGRlYnVnIHBhdGNoZXMgb3IgcHJvdmlkZSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uLg0KPg0KPiBG
aW5hbGx5LCBJIGNhbiByZXByb2R1Y2UgdGhpcyBidWcsIHRoYW5rcyBmb3IgeW91ciBoZWxwLiA6
KQ0KPg0KPiBJIGhhdmUgZmlndXJlZCBvdXQgYSBmaXggYmVsb3csIGNvdWxkIHlvdSBwbGVhc2Ug
aGVscCB0byB0ZXN0IGl0Pw0KPg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZz
LWRldmVsLzIwMjUxMDIwMDIzNDUzLjMyOTQ2Ny0xLWNoYW9Aa2VybmVsLm9yZw0KPg0KDQpJIGFw
cGxpZWQgdGhlIHBhdGNoIHRvIHY2LjE4LXJjMiBhbmQgcmVyYW4gdGhlIHJlcHJvZHVjZXIuIFRo
ZSBpc3N1ZSBubyBsb25nZXIgcmVwcm9kdWNlcy4NCg0KVGhhbmsgeW91IQ0KDQoNCg0KPiBUaGFu
a3MsDQo+DQo+PiBPb3BzOiBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBTTVAgS0FTQU4gUFRJDQo+
PiBDUFU6IDAgVUlEOiAwIFBJRDogMTE0NDEgQ29tbTogc3l6LjAuNDYgTm90IHRhaW50ZWQgNi4x
Ny4wICMxIFBSRUVNUFQoZnVsbCkNCj4+IEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMg
KGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIDEuMTUuMC0xIDA0LzAxLzIwMTQNCj4+IFJJUDog
MDAxMDpmMmZzX2FsbF9jbHVzdGVyX3BhZ2VfcmVhZHkrMHgxMDYvMHg1NTAgZnMvZjJmcy9jb21w
cmVzcy5jOjg1Nw0KPj4gQ29kZTogMDAgOGIgNGQgMDAgNDggODkgZDggNDggYzEgZTggMjAgNzQg
MTkgNDggODkgZDggMzEgZDIgNDggZjcgZjEgNDggODkgZDUgZWIgMTQgNDggODkgNWMgMjQgMTAg
ZTggNDAgYTQgNmQgZmQgZWIgMmQgODkgZDggMzEgZDIgPGY3PiBmMSA4OSBkNSAzMSBmZiA0OCA4
OSBlZSBlOCAwYyBhOSA2ZCBmZCA0OCA4NSBlZCA3NCAwYyBlOCAyMiBhNA0KPj4gUlNQOiAwMDE4
OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdTOiAwMDAxMDI0Ng0KPj4gUkFYOiAwMDAwMDAwMDAwMDAw
MDAzIFJCWDogMDAwMDAwMDAwMDAwMDAwMyBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCj4+IFJEWDog
MDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAw
MDAwDQo+PiBSQlA6IGZmZmZjOTAwMDY2MTcyNzAgUjA4OiBmZmZmZmZmZjg0NTUyZDI2IFIwOTog
MDAwMDAwMDAwMDAwMDAwMA0KPj4gUjEwOiBmZmZmODg4MTU1YWQyMDAwIFIxMTogZmZmZmZmZmY4
MWQyYWEyNiBSMTI6IDAwMDAwMDAwMDAwMDAwMDENCj4+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBS
MTQ6IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiBmZmZmYzkwMDA2NjE3MjYwDQo+PiBGUzogIDAwMDA3
ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgwMDAwKSBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwDQo+PiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzDQo+PiBDUjI6IDAwMDA1NjUwOGEzMjYwMDAgQ1IzOiAwMDAwMDAwMTE3YmVjMDAwIENS
NDogMDAwMDAwMDAwMDAwMDZmMA0KPj4gQ2FsbCBUcmFjZToNCj4+ICA8VEFTSz4NCj4+ICBmMmZz
X3dyaXRlX2NhY2hlX3BhZ2VzIGZzL2YyZnMvZGF0YS5jOjMwNzggW2lubGluZV0NCj4+ICBfX2Yy
ZnNfd3JpdGVfZGF0YV9wYWdlcyBmcy9mMmZzL2RhdGEuYzozMjkwIFtpbmxpbmVdDQo+PiAgZjJm
c193cml0ZV9kYXRhX3BhZ2VzKzB4MWMxOS8weDM2MDAgZnMvZjJmcy9kYXRhLmM6MzMxNw0KPj4g
IGRvX3dyaXRlcGFnZXMrMHgzOGUvMHg2NDAgbW0vcGFnZS13cml0ZWJhY2suYzoyNjM0DQo+PiAg
ZmlsZW1hcF9mZGF0YXdyaXRlX3diYyBtbS9maWxlbWFwLmM6Mzg2IFtpbmxpbmVdDQo+PiAgX19m
aWxlbWFwX2ZkYXRhd3JpdGVfcmFuZ2UgbW0vZmlsZW1hcC5jOjQxOSBbaW5saW5lXQ0KPj4gIGZp
bGVfd3JpdGVfYW5kX3dhaXRfcmFuZ2UrMHgyYmEvMHgzZTAgbW0vZmlsZW1hcC5jOjc5NA0KPj4g
IGYyZnNfZG9fc3luY19maWxlKzB4NmU2LzB4MWIwMCBmcy9mMmZzL2ZpbGUuYzoyOTQNCj4+ICBn
ZW5lcmljX3dyaXRlX3N5bmMgaW5jbHVkZS9saW51eC9mcy5oOjMwNDMgW2lubGluZV0NCj4+ICBm
MmZzX2ZpbGVfd3JpdGVfaXRlcisweDc2ZS8weDI3MDAgZnMvZjJmcy9maWxlLmM6NTI1OQ0KPj4g
IG5ld19zeW5jX3dyaXRlIGZzL3JlYWRfd3JpdGUuYzo1OTMgW2lubGluZV0NCj4+ICB2ZnNfd3Jp
dGUrMHg3ZTkvMHhlMDAgZnMvcmVhZF93cml0ZS5jOjY4Ng0KPj4gIGtzeXNfd3JpdGUrMHgxOWQv
MHgyZDAgZnMvcmVhZF93cml0ZS5jOjczOA0KPj4gIGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2Vu
dHJ5L3N5c2NhbGxfNjQuYzo2MyBbaW5saW5lXQ0KPj4gIGRvX3N5c2NhbGxfNjQrMHhmNy8weDQ3
MCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6OTQNCj4+ICBlbnRyeV9TWVNDQUxMXzY0X2Fm
dGVyX2h3ZnJhbWUrMHg3Ny8weDdmDQo+PiBSSVA6IDAwMzM6MHg3ZjhiYWI3YWU0OWQNCj4+IENv
ZGU6IDAyIGI4IGZmIGZmIGZmIGZmIGMzIDY2IDBmIDFmIDQ0IDAwIDAwIGYzIDBmIDFlIGZhIDQ4
IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhi
IDRjIDI0IDA4IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggYzcgYzEgYTgg
ZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgNCj4+IFJTUDogMDAyYjowMDAwN2Y4YmFjNWI0Zjk4
IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDENCj4+IFJBWDogZmZm
ZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZjhiYWJhMjYxODAgUkNYOiAwMDAwN2Y4YmFiN2FlNDlk
DQo+PiBSRFg6IDAwMDAwMDAwMDAwMGZmYmQgUlNJOiAwMDAwMjAwMDAwMDAwMjQwIFJESTogMDAw
MDAwMDAwMDAwMDAwNw0KPj4gUkJQOiAwMDAwN2Y4YmFiODQ4MjY4IFIwODogMDAwMDAwMDAwMDAw
MDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4+IFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6
IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+PiBSMTM6IDAwMDA3Zjhi
YWJhMjYyMTggUjE0OiAwMDAwN2Y4YmFiYTI2MTgwIFIxNTogMDAwMDdmOGJhYzU5NTAwMA0KPj4g
IDwvVEFTSz4NCj4+IE1vZHVsZXMgbGlua2VkIGluOg0KPj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAw
MDAwMDAwMDAwMCBdLS0tDQo+PiBSSVA6IDAwMTA6ZjJmc19hbGxfY2x1c3Rlcl9wYWdlX3JlYWR5
KzB4MTA2LzB4NTUwIGZzL2YyZnMvY29tcHJlc3MuYzo4NTcNCj4+IENvZGU6IDAwIDhiIDRkIDAw
IDQ4IDg5IGQ4IDQ4IGMxIGU4IDIwIDc0IDE5IDQ4IDg5IGQ4IDMxIGQyIDQ4IGY3IGYxIDQ4IDg5
IGQ1IGViIDE0IDQ4IDg5IDVjIDI0IDEwIGU4IDQwIGE0IDZkIGZkIGViIDJkIDg5IGQ4IDMxIGQy
IDxmNz4gZjEgODkgZDUgMzEgZmYgNDggODkgZWUgZTggMGMgYTkgNmQgZmQgNDggODUgZWQgNzQg
MGMgZTggMjIgYTQNCj4+IFJTUDogMDAxODpmZmZmYzkwMDA2NjE2ZTYwIEVGTEFHUzogMDAwMTAy
NDYNCj4+IFJBWDogMDAwMDAwMDAwMDAwMDAwMyBSQlg6IDAwMDAwMDAwMDAwMDAwMDMgUkNYOiAw
MDAwMDAwMDAwMDAwMDAwDQo+PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAw
MDAwMDAwIFJESTogMDAwMDAwMDAwMDAwMDAwMA0KPj4gUkJQOiBmZmZmYzkwMDA2NjE3MjcwIFIw
ODogZmZmZmZmZmY4NDU1MmQyNiBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4+IFIxMDogZmZmZjg4
ODE1NWFkMjAwMCBSMTE6IGZmZmZmZmZmODFkMmFhMjYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxDQo+
PiBSMTM6IGRmZmZmYzAwMDAwMDAwMDAgUjE0OiAwMDAwMDAwMDAwMDAwMDEwIFIxNTogZmZmZmM5
MDAwNjYxNzI2MA0KPj4gRlM6ICAwMDAwN2Y4YmFjNWI1NjQwKDAwMDApIEdTOmZmZmY4ODgyMjBm
MDIwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4gQ1M6ICAwMDEwIERTOiAwMDAw
IEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPj4gQ1IyOiAwMDAwNTY1MDhhMzI2MDAw
IENSMzogMDAwMDAwMDExN2JlYzAwMCBDUjQ6IDAwMDAwMDAwMDAwMDA2ZjANCj4+IC0tLS0tLS0t
LS0tLS0tLS0NCj4+IENvZGUgZGlzYXNzZW1ibHkgKGJlc3QgZ3Vlc3MpOg0KPj4gICAgMDogMDAg
OGIgNGQgMDAgNDggODkgICAgIGFkZCAgICAlY2wsLTB4NzZiN2ZmYjMoJXJieCkNCj4+ICAgIDY6
IGQ4IDQ4IGMxICAgICAgICAgICAgICBmbXVscyAgLTB4M2YoJXJheCkNCj4+ICAgIDk6IGU4IDIw
IDc0IDE5IDQ4ICAgICAgICBjYWxsICAgMHg0ODE5NzQyZQ0KPj4gICAgZTogODkgZDggICAgICAg
ICAgICAgICAgIG1vdiAgICAlZWJ4LCVlYXgNCj4+ICAgMTA6IDMxIGQyICAgICAgICAgICAgICAg
ICB4b3IgICAgJWVkeCwlZWR4DQo+PiAgIDEyOiA0OCBmNyBmMSAgICAgICAgICAgICAgZGl2ICAg
ICVyY3gNCj4+ICAgMTU6IDQ4IDg5IGQ1ICAgICAgICAgICAgICBtb3YgICAgJXJkeCwlcmJwDQo+
PiAgIDE4OiBlYiAxNCAgICAgICAgICAgICAgICAgam1wICAgIDB4MmUNCj4+ICAgMWE6IDQ4IDg5
IDVjIDI0IDEwICAgICAgICBtb3YgICAgJXJieCwweDEwKCVyc3ApDQo+PiAgIDFmOiBlOCA0MCBh
NCA2ZCBmZCAgICAgICAgY2FsbCAgIDB4ZmQ2ZGE0NjQNCj4+ICAgMjQ6IGViIDJkICAgICAgICAg
ICAgICAgICBqbXAgICAgMHg1Mw0KPj4gICAyNjogODkgZDggICAgICAgICAgICAgICAgIG1vdiAg
ICAlZWJ4LCVlYXgNCj4+ICAgMjg6IDMxIGQyICAgICAgICAgICAgICAgICB4b3IgICAgJWVkeCwl
ZWR4DQo+PiAqIDJhOiBmNyBmMSAgICAgICAgICAgICAgICAgZGl2ICAgICVlY3ggPC0tIHRyYXBw
aW5nIGluc3RydWN0aW9uDQo+PiAgIDJjOiA4OSBkNSAgICAgICAgICAgICAgICAgbW92ICAgICVl
ZHgsJWVicA0KPj4gICAyZTogMzEgZmYgICAgICAgICAgICAgICAgIHhvciAgICAlZWRpLCVlZGkN
Cj4+ICAgMzA6IDQ4IDg5IGVlICAgICAgICAgICAgICBtb3YgICAgJXJicCwlcnNpDQo+PiAgIDMz
OiBlOCAwYyBhOSA2ZCBmZCAgICAgICAgY2FsbCAgIDB4ZmQ2ZGE5NDQNCj4+ICAgMzg6IDQ4IDg1
IGVkICAgICAgICAgICAgICB0ZXN0ICAgJXJicCwlcmJwDQo+PiAgIDNiOiA3NCAwYyAgICAgICAg
ICAgICAgICAgamUgICAgIDB4NDkNCj4+ICAgM2Q6IGU4ICAgICAgICAgICAgICAgICAgICAuYnl0
ZSAweGU4DQo+PiAgIDNlOiAyMiAgICAgICAgICAgICAgICAgICAgLmJ5dGUgMHgyMg0KPj4gICAz
ZjogYTQgICAgICAgICAgICAgICAgICAgIG1vdnNiICAlZHM6KCVyc2kpLCVlczooJXJkaSkNCj4+
IEJlc3QsDQo+PiBTaHVhbmdwZW5nDQo+DQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
