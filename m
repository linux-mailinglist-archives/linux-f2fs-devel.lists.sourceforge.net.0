Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A5B81319
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 19:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvPSKjn2+GsogF064xKq6nGGpPps3ifJu92wv93zZwk=; b=D8jtoUnHxUc2vggIBJJvZPV0Qu
	c6YZtDE2TzCAIEiWNVmzafGOuhqEBDt9QplEnPSBTDR9DDLjSL4NjAVujk8j6rdzRnZzFKMiYfUS3
	JzKyFVGz2qZI+1BC6CrLYCoKup6EOfYfGbvQ/S3kKXPsv3cZCP04DK7igT1LHE9Ii7B4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uynIU-0006Vs-1o;
	Wed, 17 Sep 2025 08:13:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uynIS-0006Vk-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 08:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hjt4xrh6qtB48EY4bLwtovSH73F0OwLiRYQqG+JlEzI=; b=HwmjovkGh2u/ffirkvekcSdpps
 +4nj4HXlx/a0BwBCHcSa9P/4Giea62x3+UFyG1F1u8bkHcQlGbYGkEFWUhT8n1g2Dret0lg4pqcq5
 /vGJ9awQIH96GEpGbGZmusE+0PieGzZPMqWA/1GsKjDLLXuqKz0/y+dllxX18cNg19vk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hjt4xrh6qtB48EY4bLwtovSH73F0OwLiRYQqG+JlEzI=; b=kDcLlAVsjW0oQxcWUMnkK+YQ6d
 JDw3vTYzDD0rV7NnYRsPDymGi2N5MOHhGaXnO3DL+8X2xSxv/2B83HIizqJxjHPMbNfRLUUUkJBMm
 bvZQ7qLG8cY9+ZFF6150Pi7W6VB+hcg/LWovlq2xRzo9Y2Se/pCWfPfRrzNNAbcALC4A=;
Received: from mail-koreacentralazon11013070.outbound.protection.outlook.com
 ([40.107.44.70] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uynIS-0001w0-2L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 08:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYQV78QhT2Eb+CN4UZbvcZvlfxyxWS29ps6KZdDcoUivGDO/TkAxzPIQdjj2WXvEdVni34BnbD84acMeyA0XRvxZr4mV45hKGZzuyQAAe5H3+zWk0XdcD9Vl9SSe4IsacDWpFQYMT1xjqc+4cemXnPzP7eSFiLMPh+aVptcqAxx1KJZXmY19hoTFS98JggKPJB6J7Z5o9g6rBmVvH9WnM/nWzqWtyjUKcAMqQanJ7WoIiUKH2PhWgOTHqxVH1aZoqhffyh40e6K2L/TM/URzmBfCTYrp8uFvZsYjaHykf9kFz9uVeafQh1LXREhcYmF/6yd/KUc+Vv6ujUuR2AilEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hjt4xrh6qtB48EY4bLwtovSH73F0OwLiRYQqG+JlEzI=;
 b=dxVGM4grjI4R/gHt7Nijb0n+/AfWez0tYdNNAbX4BuB0jRW1vOqNRb1OZFuIKKWUToHr3LSyOJldoDuJgJLS/yuTgdTxqH+SCl21go03vX1Jnq1buRW7Oe4QCtu+De3H9UJUYA2d+TJzmskN0iHD8Z1LZ65CwA5bvd8/ctqfke7yhZg/B3hqPLXf+GsdOlWnS/54uc5tL9zmIhj7cDUEmZt+I2A3HnjymppdPxEZCfFrxXKhz+dbB1nenybl4T4GJEexQUrE7Z43FB8FmDXSd/2Cwe4inNFi81JLGxI/jfCQoc52RJBfqS0TkJHlYbx8Cb0OYczwtWik8Ix4rWHfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hjt4xrh6qtB48EY4bLwtovSH73F0OwLiRYQqG+JlEzI=;
 b=nSv2fUhjQKlEU6vJm1TM7/OL39oN0TbWa/uRk66mhFHQ5hv03ychEvgeOIzUyfmm9ehDiUTsiTU6ZA9Zf8+nDkm+PCFe0GVJhdLFZOmsPFWotgalAExaEYGHc0oyxP0QImltrL8/KIhw9wDctJlZwmUgwdfOv8ZbjEbrslMwL2BvhIZWjJEOkBH57T9HOdsCkAzslTvp90QlqfcXdN2fL8hgaOH3Mqji768+t0YjJtx03PZiqGA+Vh/TGJ9kg1/QzYZ8Mu7NMQZGm2DCAdDnDhOaqCouk5AwbLaYa1KPhgP7omBddxj4gL3sXWsrBvkrhE8W8eODE9sR2Rcp4EdJ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB6704.apcprd06.prod.outlook.com (2603:1096:990:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 08:13:39 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 08:13:39 +0000
Message-ID: <3cd3bfb5-857f-4b61-a1c1-55805bed4609@vivo.com>
Date: Wed, 17 Sep 2025 16:13:34 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-3-liaoyuanhong@vivo.com>
 <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
 <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
 <22d9f9d1-1db0-4bad-a782-212ab3da630e@kernel.org>
Content-Language: en-US
In-Reply-To: <22d9f9d1-1db0-4bad-a782-212ab3da630e@kernel.org>
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|JH0PR06MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db971a5-80b5-4ebd-937c-08ddf5c21b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlNqd2dwWEIwdzR4WHl6RlpsVjFQY1dkOUNXSmNpcWcwNzc4K1pnQVp5QjZT?=
 =?utf-8?B?NG9ITjM5d3NqNlFLL2JZQzdxcU5FdWZ3VzJHYlJweW02RFgzRU8zYUphMURp?=
 =?utf-8?B?THBBc3g1NzMyRVNDNXpUSUpyMTQvMC9VYW0vckUxLzErbFI1RWdrVVNCVjdj?=
 =?utf-8?B?Qm9iTmdZK2k1Y1dyQ3NPUWVwQVkwRVp6ZUcyVzhYN2lEWEtJK3JrUEpvNVRD?=
 =?utf-8?B?cnpnUDU1MnBHZlRZQmhyLytRV0NxTkQ2YzNWZGdoQ1hnUmV4ZTcxOEpYOVJI?=
 =?utf-8?B?WFp5QjFCZlhvazlkT21jRW82d1dOdDN3K2tDVGlsc3Jrak1QekdTSU8wQ0tl?=
 =?utf-8?B?WnBFS1V1NGZocDdEcGNjR1FucSs5SkRwTitybThBbUN1c1NXbXh2T0tudGNv?=
 =?utf-8?B?TXVwWUhxTnVPSEtvbHZzQzA2a0FEeEh4WEVYU0p3blJvK09Sbk5DUDlLdlZX?=
 =?utf-8?B?aEJpQmx6aW9DYU9meE8xZnlvUjIyQk82S210T056cy9NeGE5RHBBU0IzVTBq?=
 =?utf-8?B?eWtuTnpCcTdMM2dxc1dHQjdpT0pPbnVMKzc5MlArRU56cUpJQ1pEcFhlU1pt?=
 =?utf-8?B?MWMwNjdBSUJJaUllRnJUVHhJSVZ2VUhvTmx6WktISHI2eWNvRWViMnAwRVhD?=
 =?utf-8?B?TVVwTU1BdWZVWWU5U0xtT3J0MHdnNnRBK1BQZkVSYjF5Qy9HYWZsUDNiaVFu?=
 =?utf-8?B?cmZCMHpmNHhjZ0hWWFFCUXBtaURuTnJLalgxc2RqZFdRQ1lUZ3I4d0hwazZE?=
 =?utf-8?B?TnljUlhiUlZxaEU5RTdoOGl3Y2paK1NsUGFQa3dwVWEyVks2c1h0a3hJbUV2?=
 =?utf-8?B?VDJ1S1lVOFl0ejd0clcvT1RiL0lQWFRueDRmQ0FjSzlqOGgrcU91YjdMVFNs?=
 =?utf-8?B?VzRoSWhPaUxQc1lpRDhseFJoM08yV2ljenJ1aCtZaFFLVGFOaVp4V2xnWUtX?=
 =?utf-8?B?dCs2TnRLc0p1bWNLNFNsS0FRRXN6eDRHTXp5eis5VTRuUjMzV3UwVGpONGFN?=
 =?utf-8?B?cXhZSWdEMTFxYS9RV1BWa1M0VWN0ZHA1cDcvS0c3UC9mdEVoYkZGMFhTOXg0?=
 =?utf-8?B?L3QrVGt5OHFtNlBvdVdSZnJ0YW96dENTdEo5ZjJhNExVWWI5VzBtOTg0bzlt?=
 =?utf-8?B?U3pXUm1rQXYxb2JUZEFIbG1pNXBPYmc1QnVENDhGaHJoRnROWGtDTjVjVzkw?=
 =?utf-8?B?Y1l3Qk1kYjkwNi9RSm5leXJLZm5lMy9VUng1aHRPd2RmUkVXYVRJMmo4YjJ2?=
 =?utf-8?B?NnF4OHFuWHcvNGxjSEVVY3hHak1sNzB4WmE3L0ZYa0IvczJYVDNsaG4zdXpw?=
 =?utf-8?B?R1pLTTJ1RklnYjZrVkgrUUdRT3FNQzlEcVplRVU1YUJMTWdEMkJSQkZaZldN?=
 =?utf-8?B?RjZDRmo4L00wQnpJQkhRd1IvcTdnanY3REhRT2pqK3U3cnNNNUpYZ1EwQWEy?=
 =?utf-8?B?K2Z2T0lManVFQUxqS1ZSOHV3MmFOZ1YwaldUKy9aNlVQQmZ6enZOVDFoYjhz?=
 =?utf-8?B?ZXVKMk9VS0NwNlRtaWhUREcyS0Z2NkRJSUtISkV2dTVHVEJ5ZmgyUVFrb0NK?=
 =?utf-8?B?c2h5N2xUVm84WEpobnJnUStpQVlJdFpieUZBZ0duYlUzZW5pK3dDVmZTMFpn?=
 =?utf-8?B?bDg5RGlyZlhIRW94WFBqZFp4cG1sRUtlNFJQT2QwNDVqc2l0dzZvK3g5TDIv?=
 =?utf-8?B?QVFuV3lwV20zUGNzYWRCZGw3TWVva29PbkNPc3NvUlRtc3F6U2d4Sk9rVmRB?=
 =?utf-8?B?TE03bU1UUStmbWV3TTZ2UXdYa1orS0t1dDVtN3NveEtVbUZUMlF1U0Vuc09U?=
 =?utf-8?B?VXdjS2QyUFBRdVB5L1I5allpdE9hK3VMNk8xVXpFN1dmbkJFWUUzQ3NQMEgw?=
 =?utf-8?B?cVhtYTNBSHp6R3FDanZEb0phYVZQTTQ1R3lZQ05Wa3Yrbjc4WFJUaUR1R3Nt?=
 =?utf-8?Q?SElnzA81HW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHU4WVJQZ29iRmpyd3hNMXkrWjV4M2hKQlZaZFRpcWtCU1cxYm1KUGhuV1Ja?=
 =?utf-8?B?NXhwKzNzM2dXMXNIcWdjQWhEcDRGSFZtUmtuc08wTklpNjNhK1pGV3QyWGw3?=
 =?utf-8?B?T0ZOeHljdXNNU2VLbmhOWEdZa29lZzU3SnU5OUFVSThmUlFVYWdjcDVIeDFB?=
 =?utf-8?B?MEN2VnpndUg2MkttNUpoVTVQYUczMG1CbktZNGYxdTh6SEFSSGszVWlFR0hT?=
 =?utf-8?B?K3EzMC9oY0hTcGhmQnhOY0RLY2RmdnRyQ29iaWgzVmExdnAvQmFxKzI4eGhp?=
 =?utf-8?B?VTk5L3BNelU3cUNNeHptUFRDL0ZFVTVjek54YXdDL1JERFlUYnpYSW9TNVRG?=
 =?utf-8?B?QndCY3NRdzFqRVNNNTdvL1daTmt3eUp0dHkzdFhVWllEYjVBTlR1K3dUQW1N?=
 =?utf-8?B?Y3dVN1B4djYzcjloekRHZ1dIYWExbGtTUXQ0TS9nOFIzZ3UxakxaZ0lUL2E2?=
 =?utf-8?B?SE1UZnM3bnZGcElNK0dHZDJ1U3lhQkNoY2VZeFkvc0lxSTdPR1BTL2FLdzlY?=
 =?utf-8?B?L0R1R3dyeVBReEE5aXZDK3ZaNDcvMXRid01TSWlNeTMzS0J1aFVBYnZLNFlx?=
 =?utf-8?B?UjhYcXJvZlM1N1VMUkd5bEV4Q3dtanBMSFE5c1JFRTJxUXVPeGlSWUM5aG8r?=
 =?utf-8?B?dkVpV2xQS1I0YmoxeW96VGZlT1B0SzloaGNhd0gyTmhESFhiQTVCOS9tUUNq?=
 =?utf-8?B?c0V1Y2V2TUdEd0FEZS9pcnNIOXkvekd4Z2FhOTNuZk1PREdyL1JkVDlxck9I?=
 =?utf-8?B?OFp6Vmd2eWZHald6a0hjZHM0ekZLdHRlUkpUY0hVS01Ia1lPTFMrTDZva0tE?=
 =?utf-8?B?YjJpR2RPQTlhSzBPRXJPa01PQncvVUdqb09CTnhLbE1SQ2lEdlViZlJJZEJG?=
 =?utf-8?B?K3VwSHpDcCtOM1F0S1Q4M3BqaGxEN2xoNnBKVUNlNEx6LzkvalBXSnpUZURa?=
 =?utf-8?B?aVZrU2tTWEpvd3Z3Ui90Ty9IYTNDRGlmc0pEUG91bnlobC93ZkF0QlZOa0dL?=
 =?utf-8?B?L3c2MDZrSjBlWVBuU0F6Rkk4N25Pc000VEtSL0ZRQWZEcE1teHZnRGdZUUZh?=
 =?utf-8?B?NjhSSVpWSnhlOFlyQ2dLZzhsSE9mM2tQV3I3dWtVeUIreWQxL1lFM2JRWXBu?=
 =?utf-8?B?SlV2T2JrdjRCL0d6UW5kdU5ZOXVqOWxsU0dwOC9SSEwvS0k3bElMcSs1dFV6?=
 =?utf-8?B?dkxqUklkUk16Z1FrbHRxUDJ6czhtSkFIaFNiVGJEWlQ4bEEveXFKSlJEMk1s?=
 =?utf-8?B?VlQ3QmRQYW9nVzB5YkJJUHkyRGpubDJlWlZQMmR3Q3NuaFpBL2sxMTlGcVh2?=
 =?utf-8?B?aTh1WWZIWTU3dmFMZ0t4VEswelpwWTIvcE9mcWp3VHV1dUxuS3lFSzBVVUlV?=
 =?utf-8?B?dEQ5QzVxVW5oTXNRRytnai9EdStPU2xWSExSYUZBKzBKWG1SWkxLRFdQR1lQ?=
 =?utf-8?B?dk5Sd2YzV1FBQ2ZFYUlzZWJHSFFYcVg0ZDFocnJ6WE12UmtWSVB5UjZRN0M5?=
 =?utf-8?B?MHBPWkIwbkpDaWUzTCtkeUlDdmQzR2ZNcjFoTXlIQ0NtT1daWTYwSHFIZ0tD?=
 =?utf-8?B?N3d1NlB2aUQvdGFrdUw0aTlGbCtsTkRZVS9EWUZORkFucUFNcjZ3bDE2WDAy?=
 =?utf-8?B?akpGekhPM1ZjdGVKNmE0REVjQS9NN1J2L1FweUR3K3hHbG5rbjVFMlVZNkRk?=
 =?utf-8?B?WnU5aTdDc1cwQXBCOER4YmJ3MWUvMTZkdTMyRkhqOFBNYnRRbWNGMHIyM1dZ?=
 =?utf-8?B?blFwa2Y2Sm0zTDNXN2grdGwxUVBHbnMwRnM5RUhjMFpYTjBQVzI2b25yL1Nx?=
 =?utf-8?B?clllV3BOQ0d4bHhLVXNrOWZORXpRVTVMVkRvenUvckRvNXZzaW9nMkZTaWVi?=
 =?utf-8?B?a01oNlBpdGdaaFk5MUlOMThxdUJ2NHVNL2N5SFd3TWVyY3J3anRYdmwvZXha?=
 =?utf-8?B?SG9iS29tdEtCekc3K1I5MUFlMStaWlpSM2RRWFZiZ28rcEF3T3FzYmhIZE5T?=
 =?utf-8?B?bFVoRFNtNXdrUUIyT1FKQ0s1UG9Sb3ZEZVVTNm5OZmI4R3FXbjIybjY4R012?=
 =?utf-8?B?ZVh2b21qWTVENmhSMSs4dkY4VE81TGxEYng0dHFwNXIvNTlyOVNvYkkxU00w?=
 =?utf-8?Q?aLPMVkSRFBjLtReY/lGRn7lfL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db971a5-80b5-4ebd-937c-08ddf5c21b5e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:13:39.0657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qieYJQHI9zOImKfXb2t7N8C8P02n1lTFlS6c6oYCZKfZH0j1kSH5ffPBhSUF1hvSYkah+U0U2BD847mnXrdbgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/17/2025 3:57 PM, Chao Yu wrote: > On 9/17/25 15:08,
 Liao Yuanhong wrote: >> On 9/15/2025 4:36 PM, Chao Yu wrote: >>> On 9/9/25
 21:44, Liao Yuanhong wrote: >>>> When the proportion of dirty segme [...]
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.70 listed in wl.mailspike.net]
X-Headers-End: 1uynIS-0001w0-2L
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Enhance the subsequent logic of
 valid_thresh_ratio to prevent unnecessary background GC
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDkvMTcvMjAyNSAzOjU3IFBNLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDkvMTcvMjUgMTU6MDgs
IExpYW8gWXVhbmhvbmcgd3JvdGU6Cj4+IE9uIDkvMTUvMjAyNSA0OjM2IFBNLCBDaGFvIFl1IHdy
b3RlOgo+Pj4gT24gOS85LzI1IDIxOjQ0LCBMaWFvIFl1YW5ob25nIHdyb3RlOgo+Pj4+IFdoZW4g
dGhlIHByb3BvcnRpb24gb2YgZGlydHkgc2VnbWVudHMgd2l0aGluIGEgc2VjdGlvbiBleGNlZWRz
IHRoZQo+Pj4+IHZhbGlkX3RocmVzaF9yYXRpbywgdGhlIGdjX2Nvc3Qgb2YgdGhhdCBzZWN0aW9u
IGlzIHNldCB0byBVSU5UX01BWCwKPj4+PiBpbmRpY2F0aW5nIHRoYXQgdGhlc2Ugc2VjdGlvbnMg
c2hvdWxkIG5vdCBiZSByZWxlYXNlZC4gSG93ZXZlciwgaWYgYWxsCj4+Pj4gc2VjdGlvbiBjb3N0
cyB3aXRoaW4gdGhlIHNjYW5uaW5nIHJhbmdlIG9mIGdldF92aWN0aW0oKSBhcmUgVUlOVF9NQVgs
Cj4+Pj4gYmFja2dyb3VuZCBHQyB3aWxsIHN0aWxsIG9jY3VyLiBBZGQgYSBjb25kaXRpb24gdG8g
cHJldmVudCB0aGlzIHNpdHVhdGlvbi4KPj4+IEZvciB0aGlzIGNhc2UsIGYyZnNfZ2V0X3ZpY3Rp
bSgpIHdpbGwgcmV0dXJuIDAsIGFuZCBmMmZzX2djKCkgd2lsbCB1c2UgdW5jaGFuZ2VkCj4+PiBz
ZWdubyBmb3IgR0M/Cj4+Pgo+Pj4gVGhhbmtzLAo+PiBZb3UncmUgcmlnaHQsIHNlZ25vIHdvbid0
IHVwZGF0ZSBpbiB0aGlzIHNjZW5hcmlvLCBhbmQgdGhpcyBwYXRjaCBmZWF0dXJlIGlzIHJlZHVu
ZGFudC4KPiBPaCwgSSBtZWFudCwgaWYgZjJmc19nZXRfdmljdGltKCkgZmFpbHMgdG8gc2VsZWN0
IGEgdmFsaWQgdmljdGltIGR1ZSB0byB0aGUgcmVhc29uIHlvdQo+IGRlc2NyaWJlZCwgZjJmc19n
ZXRfdmljdGltKCkgd2lsbCByZXR1cm4gMCwgYW5kIGYyZnNfZ2MoKSB3aWxsIG1pZ3JhdGUgc2Vn
bWVudCAjTlVMTF9TRUdOTz8KPiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Cj4gVGhhbmtz
LAoKWWVzLiBJbiB0aGlzIHNjZW5hcmlvLCBzaW5jZSBpdCB3b24ndCBlbnRlciB0aGV8cC5taW5f
Y29zdCA+IApjb3N0fGNvbmRpdGlvbix8cC5taW5fc2Vnbm98d2lsbCByZXRhaW4gaXRzIGluaXRp
YWwgdmFsdWV8fHxOVUxMX1NFR05PfC4gClRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHdoYXQgeW91
IGRlc2NyaWJlZC4KCgpUaGFua3MsCgpMaWFvCgo+Pgo+PiBUaGFua3MsCj4+Cj4+IExpYW8KPj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMaWFvIFl1YW5ob25nIDxsaWFveXVhbmhvbmdAdml2by5jb20+
Cj4+Pj4gLS0tCj4+Pj4gIMKgIGZzL2YyZnMvZ2MuYyB8IDUgKysrKysKPj4+PiAgwqAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
Z2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+IGluZGV4IDRhOGMwOGY5NzBlMy4uZmZjMzE4ODQxNmY0
IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+
Pj4+IEBAIC05MzYsNiArOTM2LDExIEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPj4+PiAgwqDCoMKgwqDCoCB9Cj4+Pj4gIMKgICvCoMKgwqAgaWYgKGYyZnNfc2JfaGFz
X2Jsa3pvbmVkKHNiaSkgJiYgcC5taW5fY29zdCA9PSBVSU5UX01BWCkgewo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSAtRU5PREFUQTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+
Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICDCoMKgwqDCoMKgIC8qIGdldCB2aWN0aW0gZm9yIEdD
X0FUL0FUX1NTUiAqLwo+Pj4+ICDCoMKgwqDCoMKgIGlmIChpc19hdGdjKSB7Cj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBsb29rdXBfdmljdGltX2J5X2FnZShzYmksICZwKTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
