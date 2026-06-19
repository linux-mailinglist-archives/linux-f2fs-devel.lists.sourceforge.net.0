Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TqbtJYNUNWrLtAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:38:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39C6A6750
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:38:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="l2w/OoJZ";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OIGB73Aa;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=OtkNT+c1;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=PbZlBwfZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdIwHXy1j4Sbxs1/G/UEarDcqu4Y668qLW77Pqk+6qI=; b=l2w/OoJZ5KvNmKEdpQzBV7pHBw
	JPy5j6tTJn3p+2ltkSHpD2kyiH2nap+RGM6WOSybqIeX3ZX1PBm2aGa0QthXJMb4uqcxmIc5r5t98
	9G0mhTQwunAjtDjNDjlP1L0RjpFicCCI+fvswE6X5qTPS9W40Qwq+jJCcLZBHrutUCtE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waaMu-0000JZ-5O;
	Fri, 19 Jun 2026 14:38:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1waaMs-0000JR-Qu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/iStCWT7ykggCd4C/1TzNfu+068x4hkZv3tif9g/1bk=; b=OIGB73AaLjtN3VCXzGbKybivLL
 8PtzZUPvQ5VNA8gSe3oz31YlKi4Uighzxdl9jBK4BAWIIf2HCX5ZCpC4Jux24vCsv8gJ/+iDdG+6E
 CXD19b8II0s8U6DM5vkWgY6rLcl2W109McZ9rBgrrjb/Tggh4P7aljSH4ww1M8WbOz+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/iStCWT7ykggCd4C/1TzNfu+068x4hkZv3tif9g/1bk=; b=OtkNT+c1jlFjSSQ61WExkS/FcO
 /OO+vohuTK8aFR8iHXXxbESr2GdDtKiBVCAI3okL0fH9CEfL2qSCynNI/8CSYucUFfuc7UhHVf7U/
 PS9fJGxiAIcF8Whe/tcFLtNxiGothFqS9aqNq0qcBeyP93z0TM3+PXPoPBsbrBrt7d+Q=;
Received: from mail-koreacentralazolkn19013078.outbound.protection.outlook.com
 ([52.103.74.78] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waaMq-0004mI-VT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:38:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJnCIk/dQXtCaGuiIQc7cWVNqMw429oog9uSQ1i1Yznvl8t+NpI9Hsq25Xqxfbs5N/4hh4t97kdXCGCGlS5ffqWnBkglcjXi0YAPyUBjlUWrs1LF4eFzmzt3mm/vsYJYIBEkXdUGv8VhRdQR41ExfiQzIkQ303dY7nA5TFHfDYVG5ITJ/meZpNVgNxPLU4M5lTYv0RCHeTUT42WCV+bNn5TDR/CaWpf2Hcn4xME44RnsFp830M4PuHCCsM0PXAAj3D61npe8/BuPZiTwXrWVEmqgMsnQkj8OMqv8TE0Lx2Gc7ETMsbryllUREMufRqzhZqDnKv0ON+SZqVjjEhrLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iStCWT7ykggCd4C/1TzNfu+068x4hkZv3tif9g/1bk=;
 b=lsP93AkfKZ/9PPQfzjNyi++/rK+rWdnwGCTzBjWV++LUGAnzm16Q4zibEubMSJMofg8an9PfV6n4a/D5aG+KBCErrDs4WnYPQwTJa1PL0lYSuGKYo/F0zukJ3z/xsvmbdmGGVw3oB9WO0kXbiOOR6CAxAJORhUHBGOr8JeeSs9eK0TrSiRTSMYXqSlAe8P8js9O7v8evNtprnaaEvLvwfidyBztK1ou62UyOzhuCXwYLgho4x/u+4TixmNEzQraGRH4jEwJeDCLvnO2Aj0a0EzZoww+01hOO/P4hijgoPkvKtGDIkhByzJJjjGq+4Dwerq2qmo4C2YQBQB/6B29huQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iStCWT7ykggCd4C/1TzNfu+068x4hkZv3tif9g/1bk=;
 b=PbZlBwfZ07/bKUHiXtkRO9vtThXYefDEudxTgcEFxBePv8wThT/aUv7LGpF5AX2yfXM7Ed0HOg7qp5UJ5yYNOMFuaza5WDPcmtx6rwzPd58V19TuszM0sYInc599NV+2kcsC56sNI30lDqa/qox4vtfamLRqOrjOgESSlBlumlHVbEhorgL0eTLVVMdXOQcEb64rQ/S+DSb4IfYU+HOr7841WB4ttzK0uIbWvGoBXfKIAEWJIf64H3gFyVzY6Ix1On1scRyk1ncVHwbWJyeHPmxBQHHUj2bLECBSq+KSUAL7ZH9fTbi6k3n+lt/N7xyDF9sNNr9lcA9Is/AhlcYlKQ==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by SI3PR02MB9388.apcprd02.prod.outlook.com (2603:1096:4:2a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:38:39 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 14:38:39 +0000
Message-ID: <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Fri, 19 Jun 2026 22:38:31 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <717bf00c-fa1e-48dc-a748-e7e635b73ded@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|SI3PR02MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: c23a700b-35d4-4cdd-ac3c-08dece10739b
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIksnX2zd4X+CZuzA2WICBfo4mP2of8PKR9IxENK+qvzPkidkYD5LOMiG7IDkTYFJJjnBLqoYAKB9cDJx1ppOMEWIxmKoH3QnXP61MiNvjNLdPnm2Rv6iA8/fIixGOKVmq+D0KPSLhz1WCAScOMPr8O18o3zQxzULJ6hsdjOUyyLe+z0OBoj2HGYEcne9RXmCtmXzQ73W2tsMfAL2M+TatLbocucIBLvWZGZb900utMVd6TauXcGlMtaO14hv0M1w6NT37/VCWWqSt58klUq3q+cfTxO1y8RQH5gsoXDsu5EaK49NRy5/gquxcvVyDFOVkXCMdAWDKz6gaKW2H3GAQI0wVaruWAJ9JZUeqYtJXmmnd5winZW2dyLYrzSImtm64a0ZoEDkUGRfXahcxG+ZV8kz9J7ZY8CvlY1aUb7Mq5vGua3kOVVRDeR8Ox61Ei7RjdmGRysKrSgcyuvZFqmjDhjPLcOTTX4Fej4GLpEwSgtC3I5yjqunn0dFY86WN9rYlJyPqO1mEWNTVQeLE0Uc8uScyqTdSU9KRwMv4FeFeB5D6YCLo/ln8hFWbiqrYQ2jLJOGBeyBy9pUj44A3OLFt7Ue/lV8k47DkWKtUvc8TFU5I5/GG6AQqf7V4Qxr+pC+tq0UK1odDEzcoEGmEpBKPmbnL5+/waY3VDBEqJkWqUqTKXZA2Aj9YEvKWOFPS4D8YrIIFvytSvL+TE0mN+7AeuoS0H2PYYe8gjZg0FvZFAVWTHYVAj0vHYcc+oMG7EmWMa6va7+BfT3llQHgaPfVfNb/wuiQ1X5zC3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24121999003|22091999003|15080799012|5072599009|8060799015|41001999006|51005399006|23021999003|7042599007|19110799012|6090799003|45011099003|25010399006|40105399003|3412199025|10035399007|12091999003|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N29kVzZJLzE0Ync4Zm0xUEJrd2pkL3luNEdFN0Q4VVBnMmkxQk83WGliNGE1?=
 =?utf-8?B?SVlrRWMwQzZkd2hTNW42TExwWTZVaDB3U0FXbHlmb0ZHWG9iaEI2TWNyUUpk?=
 =?utf-8?B?d2lTdy92WXN5U1hkS0RQL0xVUE9CSVlnQ1dFbTU4aVpNcFdaVXQrUS8vakRo?=
 =?utf-8?B?OTBVZ0ZoYzNKdzE5NU9nTGtoc3gyWGVoK210cE9Edm4zR2VvN0Q2NkJIVW9T?=
 =?utf-8?B?bTJSZ3BTaENtZGJBU2tWcDZjd21ONCs5cjM3YUs4aXpaZ3ZOZm5lM2FKS2R1?=
 =?utf-8?B?K3hBSlNKd1hTeXFRZHlUeldpQi9VdjZCdVJ1Y1pZYnAxWklLQzRaSEVaVFdr?=
 =?utf-8?B?aU9ZRzE0OVUvQUtqcWd0bSticVladHZQSGQxTzA1TE96Vmg2MmlsWlVXYjhu?=
 =?utf-8?B?R2VoSGhtcW45OVRwWVk0bDhrMk42RnZUZTg1RitTaTlwMnFSRUROVWZyM3Jn?=
 =?utf-8?B?YWRNVk5rUWxueFFkN1dxc0crbE4wNjJvb2JJdmFkU0xVWVllUEphNWpESlRj?=
 =?utf-8?B?OXBMdDF6bkltSFRzYkpuSXdDSWE3NG1qWmtUQ2NTZ3NxOENwK1J5d2s4Nlk1?=
 =?utf-8?B?L0tJczBxZXQ1U2FXcTlUb1R1VWxld3kvZkUyWkFyOHlBWlhBOGU0bnlGV2ND?=
 =?utf-8?B?QjhPcSt5MW9pbis2cWNvTThpT24rRGNWREQ5YUkzN21hYjVpbytGT2xjUWY3?=
 =?utf-8?B?amZiU1lwaXRldmphZjBTbi9rOTRQTTRpaC84R3UxblA3TzV4TlhaaS9wNDNL?=
 =?utf-8?B?M0hwMnhsb3ZRdzlEQXR5WUdYQTJhb3VJSk5BRkRlM1JCc3ZhSS9QdUZDY3l2?=
 =?utf-8?B?bFk0T3diOXRKS0ZwT1V2STNnWU1kQXRSYkk0alpONUZrUE9LMFljNHhhcDdX?=
 =?utf-8?B?S2xxTlExNjNYRldDZWdRaXFlZjZ6UWpuQ2doYVJoQ292MG1RZFBKQzltSGNa?=
 =?utf-8?B?VVpHZE5QeDFBZjZiMG82NkRCb0pWTVlLRFFPSXFXSkZ4MGQ1Q2phZm1Jc2U2?=
 =?utf-8?B?Mm42QVJheUlVK2tzYzIyaGE1eUg4YkwxOThCTGZCa1Z2dUVubVZXUG93eDBC?=
 =?utf-8?B?cGd3azNFc3lBV0RiR29PT1E3MmVoOTViNlhSQWpYdytUZlladlhxZkp3UzdW?=
 =?utf-8?B?Z0JvcVRZTXNCYkxrTHpvV3dWSlhQdWsrZ1NWOCtZVm1sc3dhaHhLZ2RPZHVN?=
 =?utf-8?B?NHErQWVWOEw5em1UUnhjV1B4YXVWaVhsUkFVYVBZRFJaQlVYbkMxYi9CeWdN?=
 =?utf-8?B?WWxUcXdpNjE1bnpLYTJBQUs3WmlFb0RMdWhMZ2xvYVBybG1LRkJYV0h1QW9h?=
 =?utf-8?B?ZjR3TjlTSnJtT2FzUkJUR2tqbGNzUUFLOTBLWENGTFF1T2RvNnFaemJNNGxi?=
 =?utf-8?B?M2NqVmRycHA3Z0NBVDVxdzVMMTQ4cC90SHdvSUt4V2FtbmlidXB3QjlhTFlB?=
 =?utf-8?B?V09GVFBudlkxQ3Y0SHpkd2d1V0l3cmVuRUdZWlVzSEJQNWFNQ0FOZDJ6OWlq?=
 =?utf-8?B?Z2RGbTBDV2NkZVFZdFlEam9sNnErazdXNVdyeTUwTDQ5eVl2d3NGQXhPa3RD?=
 =?utf-8?Q?D5ku4/H/SIxVSmxHYsvdr5yTs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZlUTFXakYzN200SWVMaFp0TGhFUy9NYmEzbDhFOGs3eWlKdUtUOGJBdGRN?=
 =?utf-8?B?V1Q4SUJFKzNYdmZYZmFnOGl4MWpwNm5MY2ZXNVNtTGJMNmdkVU15bHpXaFNV?=
 =?utf-8?B?TzdPMWR6TUFEMnUxL2Z2RVBTZDYxNFZlTlpFa3dTWlI3UkNjc0dyNTRHOFo0?=
 =?utf-8?B?WTRiMXBrdzEzM2k1VEwvMVNNelQydHNNcmJuU1kxb3B1Z3lzTUlvVnZadTdE?=
 =?utf-8?B?N2l3Tzd0YlFoaGVnOWxpM202M0poVnc0NjI1c1pnd21DTSsrdW56d2xCQnhs?=
 =?utf-8?B?bUFQS1FkQzFpTjBWeTkvZHZDOWlzSGFlNERJdTY4cXVqanRJSU5aOTBnYm9z?=
 =?utf-8?B?TTdCaytmMWJLTmt4SW5kTHhhcm82MnRFTVlVNW9XNlZ0dkFsWC9mVHk5UHNp?=
 =?utf-8?B?elFOaitoM2pZc2pEUjlGT0hPSnBKRVhXNnZJZjNGT1grSENqTS9FYUZMQjlI?=
 =?utf-8?B?RnpxcnBjbzNaNm9BUXZEbitVK3FvZjlDVXdYeG5VY2RnQXRMREtoQXZqZVVN?=
 =?utf-8?B?MUM0QUo4MlZ6eUNybUx4L1pCQitQYlpiOHFiT2V5b3ZiZ1VnY2pZOTNKeFlM?=
 =?utf-8?B?MHB1SXZxQjFRcWExemtjekw0aWl4L3NGRldwczZ6NmE2QzJGY1h3bXpZcjVU?=
 =?utf-8?B?SjRwdVFMT1VIV0tFOTduZnprMWxRRFNQTVBHVkxHOUR1NmpleTh0MmJoZ0ln?=
 =?utf-8?B?cWdzcXF3Sm02YUpmb2FMUk5qc3d6U3YwL0UzU3VHRlE5VXcvWDkrSzlJUnZG?=
 =?utf-8?B?ZmxIZUt3Ylo4clFGVlpIcGtUK1U1VDJYZUJPaVg0MmtyR0ZsRFdxYm5sRTgw?=
 =?utf-8?B?bDZKcHNGTzB1dmFsVUFhcE5tenlGM0tkd0Q1S3NVSWsrTVh4bXZqZlJ4NWxu?=
 =?utf-8?B?SkpOUFhacXpJUHdiWUovK21YdjVCSm5VQ0RaaTdTbFhUb0ZWY053K3BVQUIr?=
 =?utf-8?B?eExNK1pObUFQNHV2MFBjRUw3NlE0UHFCY2ZuMGQvdzFaM1BKTWdNc1hDQmg5?=
 =?utf-8?B?M0NZQTg4dXIzbmlINW00KzFBYysybGZKK2RCZEs3SFRUMm1mTSs1c3RReW9E?=
 =?utf-8?B?K3p6NUxuMWhnNlR2T05ZVGZWYzZHSTYwcERieUExMldEOVhOTGo5S2w0SHBP?=
 =?utf-8?B?OHY5dHRlR1QzYkQ5SmJLVjE1aG5ydFZzaWlvNnZKVnZYM2VtMHBpMzJCejZP?=
 =?utf-8?B?ZE00cHBZdjJUQmt1cnFNOGlDZnlGcmVPdytORnhwVC9rSklNamgwZGh4ckc2?=
 =?utf-8?B?TjM1UWRoaGFnaURJRzZkblBHcDg3VWVYYnMyUnREUkd5V1Y5OC9nQ1BVMFZE?=
 =?utf-8?B?RExKNno0ZVFtU01VeFZkN3BMN0xEK09PTHEyLzhUUGMyMHRYOTZrdTVSZm9K?=
 =?utf-8?B?eDBOU1BsUlU3OS9uTm01K1FPYm1LL25sT25hc2NUTTQ2Q3VVVmcxeGh4ajhM?=
 =?utf-8?B?bk1zR0NYZjhOQmhtemk4M24xcFZDelI1NzBDSHNObkk3My8vWnZaV2lCcEZ2?=
 =?utf-8?B?MXdML3ZrcXlpNXVhSE5Bc2FzUzNqWWdlVnZHdElERllhVzhPQStiRjZxQ1pq?=
 =?utf-8?B?QTlGZW9VL3gvSWk4d0JNUUthN3pXK0FMKzR0YnI0SEdGcC95NENYQjJlb3R2?=
 =?utf-8?B?VktLNFBhUVVRS1EwZFkrWW5USXRlMjZSSVF4R3MzcVQxRGcvOVV6TE9iYlNY?=
 =?utf-8?B?YWxMdE5BZjRTdkdid2ZiU1RtdjNON3dOTDNVU00rLzRhZC94TEwrS1JHTlVT?=
 =?utf-8?B?bmlhNFhWaldpalNSRkFtT2dqTGR1OGRESXY1UnlXKzhwSXNIMS9LMnMxSEdo?=
 =?utf-8?B?b0J1MVlmQjlURVlLdVFLVklKSWtVWE5VOU8wbGlWa0ZDUEp0cHI0dWhJemho?=
 =?utf-8?B?RmVlT1Z1Y2wweEdvU1ZuUzNjdnV0TTB5bEJrY0FvUzYzdE45ME1nTUkxOXpD?=
 =?utf-8?B?c1JRS1h5VDdyV2tLbDJnUHBQbGZUakNQb0FHNmo3WTY4QVdpaWl6YWRGVyty?=
 =?utf-8?B?TkdDd2dzUkt3PT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23a700b-35d4-4cdd-ac3c-08dece10739b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:38:38.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR02MB9388
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 8:05 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/12/26 19:58, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Previously,
 when an extent being inserted overlaps with the largest >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.74.78 listed in wl.mailspike.net]
X-Headers-End: 1waaMq-0004mI-VT
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE39C6A6750


On 6/15/26 8:05 PM, Chao Yu via Linux-f2fs-devel wrote:
> On 6/12/26 19:58, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> Previously, when an extent being inserted overlaps with the largest
>> extent, the largest extent is dropped entirely. This was done to handle
> 
> Please correct me if I missed anything, I remember that we will add largest
> extent in below path?
> 
> - __update_extent_tree_range
>   - __insert_extent_tree
>    - __try_update_largest_extent : update largest w/ right extent
>   - __try_update_largest_extent : update largest w/ left extent

The largest extent might not reside in the extent tree. If
__update_extent_tree_range invokes __drop_largest_extent, the length of
the largest extent will have been set to zero. As a result, the largest
extent updated inside __try_update_largest_extent can end up smaller
than the largest extent obtained after __punch_largest_extent completes
its punch operation.

Thanks
Yongpeng,

> 
> Thanks,
> 
>> the case where the largest extent is not in memory, avoiding
>> inconsistency between the largest extent and the extent tree.
>>
>> This patch changes the semantics of __drop_largest_extent (renamed to
>> __punch_largest_extent): instead of discarding the entire largest
>> extent when any overlap is detected, keep the larger remaining portion
>> (left or right) after the punch. This preserves extent cache coverage
>> for truncate and overwrite operations that only partially overlap the
>> largest extent.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/extent_cache.c | 31 ++++++++++++++++++++++++-------
>>   1 file changed, 24 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index f8d94db60dc6..82d84c4e98b2 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -397,14 +397,31 @@ static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
>>   	return count;
>>   }
>>   
>> -static void __drop_largest_extent(struct extent_tree *et,
>> +static void __punch_largest_extent(struct extent_tree *et,
>>   					pgoff_t fofs, unsigned int len)
>>   {
>> -	if (fofs < (pgoff_t)et->largest.fofs + et->largest.len &&
>> -			fofs + len > et->largest.fofs) {
>> -		et->largest.len = 0;
>> -		et->largest_updated = true;
>> +	unsigned int largest_end, punch_end;
>> +	unsigned int left_len, right_len;
>> +
>> +	if (fofs >= (pgoff_t)et->largest.fofs + et->largest.len ||
>> +			fofs + len <= et->largest.fofs)
>> +		return;
>> +
>> +	/* Punch [fofs, fofs + len) from largest extent. */
>> +	largest_end = et->largest.fofs + et->largest.len;
>> +	punch_end = fofs + len;
>> +
>> +	left_len = fofs > et->largest.fofs ? fofs - et->largest.fofs : 0;
>> +	right_len = largest_end > punch_end ? largest_end - punch_end : 0;
>> +
>> +	if (left_len >= right_len) {
>> +		et->largest.len = left_len;
>> +	} else {
>> +		et->largest.blk += punch_end - et->largest.fofs;
>> +		et->largest.fofs = punch_end;
>> +		et->largest.len = right_len;
>>   	}
>> +	et->largest_updated = true;
>>   }
>>   
>>   void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>> @@ -680,10 +697,10 @@ static void __update_extent_tree_range(struct inode *inode,
>>   		dei.len = 0;
>>   
>>   		/*
>> -		 * drop largest extent before lookup, in case it's already
>> +		 * punch largest extent before lookup, in case it's already
>>   		 * been shrunk from extent tree
>>   		 */
>> -		__drop_largest_extent(et, fofs, len);
>> +		__punch_largest_extent(et, fofs, len);
>>   	}
>>   
>>   	if (et->largest.len != 0 &&
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
