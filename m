Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ArOXLMZYNWpmtgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:57:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A526A6866
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=mq3vxM7p;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=j5xvVWWR;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=gbzpRiPZ;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=s0Qk5qWu;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dn+yFU1zV8IZn1o4EWfDZZHbPLPoAk2gNPR0nKMutw=; b=mq3vxM7pueiDC9ZZGwwBIBw35G
	coP8luIKQEyMNQ2PI7E03H7xEGffRNTB7lcZUuZv+QhlGS9yy5DlBw81tFy+9LIecXiNUQsTpkx4W
	ZrrDWbcRFrueKw8TbAgJSP3jiNx5MyoXhsTtES5zoBAMdn7STpKuqKhgryhjDI6M8bQ0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waaeU-0000it-LD;
	Fri, 19 Jun 2026 14:57:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1waaeL-0000iR-Rc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6Wr3vwDnOxYurl0WtSrJh1t68vQgoxlO355NKiPCu8=; b=j5xvVWWRY2rbcDlBlJeLGS8sZ1
 JS6/x7Ea8gnlet47hfT6pU6Bx2vya1nox4zyLGBBm6qEtaA6nMUY7C2p0YIxy2c31RHLIfvWJH0zA
 5WmAcKxcpjafh7OZGojBuJwM7xusq9sMqLY63fTD7cXfEf60OIBNhC3FaZ5XPKezptyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G6Wr3vwDnOxYurl0WtSrJh1t68vQgoxlO355NKiPCu8=; b=gbzpRiPZiEEMqs2bwn4pEwwbyp
 1Pxq2si+wkunV7bpARoeVenWp+4ROhj5KHltbwjRCl0Y8DPDOFvtL19onHO+Ds473djvCZV37Lblh
 YkXZG5vIcnw8onJ9GgTTYgikQrpW8pky8Nos8zOn9mfZy0vku15WqfYn5r5JzDFOXFUw=;
Received: from mail-japaneastazolkn19013074.outbound.protection.outlook.com
 ([52.103.43.74] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waaeJ-0007mr-QN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:56:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7K7Ludm474KbfNxTpOZ1q3uAp22IjtMs+TFtcL86yCfMn8teta72B1jrEZyRPjiQZ5cep3/y3JqDh5TlPIfEy1OqH/2qy8XTzycU6T/OoPCRys+i44oKUGCMF/dD33Ne+VND+EQOge14vholLeCSbGyLgIAstSwX9jaNaucKI/rr/BznhDhM8AikyrBdO/SKVzeujmXsa3BzimSZLpBQ7fNAiZZ78lHo3q2v5y3Y6IQU4Z6mNNGQpIzi52+K2ACKOhvMgLWJJQaw4RjSTkGgC/VY8p7WCy5OpY98BxwD5op7AOgA0HIbCgX1dV5U1WxRtrSYK9MBsLmVSaqumassQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6Wr3vwDnOxYurl0WtSrJh1t68vQgoxlO355NKiPCu8=;
 b=gbb/nkoyuHDa6+JmWbyQOWPhCjXrl5zrnyWi/Ik1CMjrVtkAwB3Ysf+7vblwBEAfnpNbMp+2ROWoTBH8HT+m5wqZIGKciMCPup9GWb7yOa1QFTqlsz0r0Ie4w20x8lYxrTTrehOzo0xL2MSk2qHCoptPPuCmrYNamiWXBFcb30TVGN7ApFr0K9b3xhuq4HuYAV/syJDKOgsqWkXqVXPsJuliI8Zkk/C87hxOwZRCXcwdIHBM7xvmFG+kZFyE6WH6eYNrFM347XIpdJqWZqpRl/0DE3LX2vmIGx5Pu2ylGCs8OQvfu6Wfc85wVBfn7DGWkyYjxrs6f2qRL6gDRNU0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6Wr3vwDnOxYurl0WtSrJh1t68vQgoxlO355NKiPCu8=;
 b=s0Qk5qWuXgGwgbq5bZwAXalsRXq6TLRCsYQQZ1GAVGDj1V0Uh+WFkKysWVeDmwOtJRYVXGQdMmFgEINq5mhOcI/va+F65hobnrmNfvJBNiSb+o9v2zce+MN2Kb3zUCrulzF6SCyLcyIkBnRbsZFp3yCnSOU0xovzkJTz2MmBSYPSTaKcIncXG16gHOQXK0LahzNRKw48rF5v5D6eejoVIkWr6QGI9/Dp28IIOaWK3jUosmXx2fiSgOeMLjNTFNe/h367v3H15bMDfQFNtpMGO1jBQhiZeCT9z6OteYu3JzIO8FL3qUXF8k/728kk23xwBpnwEM3wUZwVOkR2xeeq/w==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by SEYPR02MB5630.apcprd02.prod.outlook.com (2603:1096:101:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:56:37 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 14:56:36 +0000
Message-ID: <SEZPR02MB56627B7C417379E9209FF87799E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Fri, 19 Jun 2026 22:56:30 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
 <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
 <ajAfmEHCgHAh1E0I@google.com>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <ajAfmEHCgHAh1E0I@google.com>
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <ea5fd1a5-3feb-49ab-b416-b30c580e430f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|SEYPR02MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8feeab-36a9-450a-0003-08dece12f5d6
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkxKUcROmqaucl/Etp9duqxDp5F3ypQfX8mgn1RzkMJsGbnsKz0OyBuwMyOnHGVqVvOLAmI6dajDYopIy88fxwDONWx9oLg5KeRh/NB/mHO8jg4fwlcE4OcZaDx0B4c+WfvZWrWH69p1RBiC+mmJjJ1sp2YxgjWd4rKnNqYgWoxiBNjGBHyfowfOLgKiKzq3jXwkwmEZRFH6VIn6Ftmm52vxkHrlp0nxlltdZb2v+cm6D2K9KoECydVinZ5w46McDha1YTva95UTUSSRNoNTpqHApF7AWYhYEYxXwd1acQwnKqY1JR6a7ZvEcodPV4DLqlUZ/Kn6BIvJHfK86pD1ttinsCnC56O2yyblVrpGnHijxuKI8DhwDEeXRq86YKQsG9oMt5xGjO2fPOa6DqsEMHsNsaUwbMSWDINs+gZc2skuIeT1JZegYoUIJR3Y+drz+xAPgHpopiywhi7/gDcpiNPqSlXqUtNCzOcz5NAE1i0VVHH+jl5Y8LvRGxm1y0cypBHX2WWqLoDdKcekp8Oivdaja7ueBA1S4jO5fLxlJ1bqEqJ04s2tGhJzojbuQ6IEZBuMWj+TG0W8SXG6FAId5s/MPH0ASw4V928oT87SRLLMK8W1n5y7l42+7wvF+bmyURFrzqAEPsFj9d6Byw9/Qh+aNlNg173114rgpxvSXwi7XNBNMAoLj8pP4Uk/JnqTTBNAz05KR/NsepooPuDhY0GlTUF7snx+bs+YitGVdQ/knzRDaX/zwwsXL2kwxrP2inlCf2uAgdo/Wqu8YlLOvHNiDqsOBoXgAL
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|45011099003|19110799012|5072599009|24121999003|23021999003|8060799015|15080799012|22091999003|6090799003|12121999013|41001999006|7042599007|51005399006|25010399006|40105399003|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTE3ZStuR1N2cVo3UnZWaUNOUElvZWZVQXNiNVpIVTZTRi9YLzNIN1dkOE1Q?=
 =?utf-8?B?TnhqQlFjVjVsZWxIRFJ1VmJweHVZV2J0MkRoVkJsWEo1SHJjRmtOSW9lMkgw?=
 =?utf-8?B?bHlPT1YrN3BaN0k4NDlzVytoc0FydEFOdnNUVjU2Smp3VzZwK0d6blZ5dWs0?=
 =?utf-8?B?U1M1VldtYnpDSUNSVEU5QUVvU01lM0p5dGtWWGxwbHN5Vm82ZWxyNHlmV21E?=
 =?utf-8?B?YVlJYWxTOTZIMkQzejVwd1lqVG9qdVVmMEYzT053MFZ0RU9EbmI5dldoMEFF?=
 =?utf-8?B?V2pqNTUrcmNIc3VZbVhpaGVyc0xnQnBVQUQyWVFyUGRmRjBsRTllM0JUMlhK?=
 =?utf-8?B?S3pUUWlKVEg5QWtmNGZvR0NNZ0FDb2FHMm9rQ3dSc2QyOUpXM2xsOFhyc0Rt?=
 =?utf-8?B?Ums0MHlBOENPVFYrUWRyalpLNDFCOUhSRmxmamIyOVNLVnh2NSthWndsY1ZN?=
 =?utf-8?B?bkozdEhUdURKYUk4aXJ0L25Jelh4QjFSSnBQcVQwVjFMaWFybWZGUUErOFJ5?=
 =?utf-8?B?MGJpcFdjK2tQcU1kdys0L0hGbnl2WGNOTDVEenNqK0hDQ0F6QVB1UVMxMjVS?=
 =?utf-8?B?Y201dGhaME9SSE5SNzJMSDRDVGlOTFZnZEFucmQ0WDVISFlhRDJQSlhDRWhi?=
 =?utf-8?B?dDJIc2NERHdUeWJqVFJ5TC9WYXlQbzQ3WStqeHJUVlpibmpsWVBLZERYVEUv?=
 =?utf-8?B?QlVad1ZBcDU0aUJQKzJUakh2ODRJK1pEQW92Zi8rVkRkNXd5bWxzZUxENlhG?=
 =?utf-8?B?eE1rYkFNLzJaNFRQaFQ3eFBWU2RSd0NNVjU2VHBxZWIxbVBrLzlFaVdmb2lR?=
 =?utf-8?B?L21oVmpqa294ellCT0NmUFUxOVFqYXVMeCtxa29yRjM3b0dWQkNjSlBETDI4?=
 =?utf-8?B?aW82amx0Nm1nM0U1L1I4a1U0OVEwZ29UbjVDVk9TcDBSY3gyYkJ6L2ttdVFV?=
 =?utf-8?B?WWNSVVFaeENnWUxOSGE5eThvM3EzOGc4NEcveFJDSjRCV0dzUmV6c0prRHJB?=
 =?utf-8?B?WkxoS0FiN0lhN0Q1Sjd0Y1EvcjM2L25yRmxFZUM3QU44eTJwUzJxU1FTNkJT?=
 =?utf-8?B?VVkxN1g0am5nY0NNNEhiM1lRMkt6NGx2SmFLejl3OUxrS0NLS3ZJNFdETnI4?=
 =?utf-8?B?L1pnUnV4NHFVR2VaYjZocXJNWWNDMm1LakRKNWpXZTVmbWVNWHpOQXZzTVBs?=
 =?utf-8?B?QmthTzc2bnBacWFmWHVIandpUTdjdy9mWGM4dmhFNlVPb0NLQm5PZkNHd2xE?=
 =?utf-8?B?SXRtMnd4SGI1TTl6YXJWdURoUVBrOWhuTGMySGhiQXJHS0NhZzFNRU1HbGFX?=
 =?utf-8?B?NGFOamcyZVlIbkthbDhHcHdDWTB4QWsrYlF2amRwSXZheHJaWExBTGJoNFZJ?=
 =?utf-8?B?OTRHc215NHN2Y1gwdnp2ckxWWWZXSU0zUkQ1d1lIOGZUUFh6MWlkWExGYTdZ?=
 =?utf-8?B?YlV1dEUzNWgxVWY3ajVIK3g2bGhDaVJiZ0dxMmh2Z2JwaDN1ZEcrTTM1WHRO?=
 =?utf-8?B?SU55QUxoa0RudDdnSFVScEVkRU1tbFVENzBtRVE2Q05WaGZUZk4wZC83b3pR?=
 =?utf-8?Q?UBf9OFm0D3LJsGbMSBvG3b1eg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TktUZFp3djZvYy9PN3VjQkNiL2crVk5Vd1A2KzNueTVHcDg5Y1RSaXo1VFFh?=
 =?utf-8?B?a01ETGZlYUxpZnlyTzdhWkFNVUVRdkZyNXNqejBtZHRLR3dSY2FGN0xJWEV6?=
 =?utf-8?B?c3JPQUVhUDc5T0VDVXEvYjZHa21MZElNZWZZMlVwQnlJcHowSDJwWVRIcjhC?=
 =?utf-8?B?aUJZT1hQaFZBaDZhak14WEN1NC83UE9pU3dobmVqRDVPdDk1SWNEc1hMYlZD?=
 =?utf-8?B?OXc5dHozWlNXbHNtSWtSUGZPUEhpRmk1L3lZQmd6Q2xjQXlubG5Kamxya09H?=
 =?utf-8?B?eHRjcXZVaHdWMDZWVW9haDRuZkFHWjRZa1V4SDFZNkR5K0hrWjcyODNWQVFB?=
 =?utf-8?B?dTZobEx2cWVLbU9BTVYwQU1DRXdTOG5nbFZ1aTVuaVJmei9sbWF2dmtEU0w2?=
 =?utf-8?B?VEt0eERESU85MUpjNElpeW1ESjJ3dUE2NTkrRTFxZ1JPNms5R21WakJtbU84?=
 =?utf-8?B?aEhjNC8xNkk3VVYxQW14N3VZTEw3bzBFSVdFb2pNQlJLQitMdDRwS3ZGdTl1?=
 =?utf-8?B?WEZVaTZrVENNZjJ2WlB0d0VCS1hybW5RTDNCbitQU01BQXk0UmdDa08zL2lj?=
 =?utf-8?B?d0tYMUFUeUJtLy9iWlkvOGtUY2ZrejVjcE5temVGbER3Umo0ZUZSYlp0clE4?=
 =?utf-8?B?WGNtTGM3TjZpeDFXK1VXeHhDa2dWNU1lb1RJeDRWYmt3eldPcDVMZG95V3Iz?=
 =?utf-8?B?M1lDNFA0VlYzS3JxYWJVWHNjWHRkeDU2MzhmTjRyVzFxcDB3Y1FRRWJSNmNo?=
 =?utf-8?B?NFkrdDlab0t5Q05NUGh0a0k4ZWtqVDhwem1XNWlmaE1Zd3JzWW1MOFowd2RI?=
 =?utf-8?B?emFpRmxQcHVkNnpoeFJ2TGxEYVFHTnRSVzJINSt4Wm9uUzl6S1RFLzVLQ0h3?=
 =?utf-8?B?T1ZoU2JRdGtpZTBxMHBYSzk5VnArNjNWWHJQN013VDkwVVBwRUwrSkRaVC9D?=
 =?utf-8?B?WnBnME9QQmtsaVJ1TmM2TTB6L2V2aDgxNTlLTlplVGRNTDE4L3lKT1FLWm90?=
 =?utf-8?B?M2diZk9vbGpWWHcrYm9jTHAwalNWNGVoQkpEZ3diWEFTRVBQd05lTzBBdUR2?=
 =?utf-8?B?bVVGZTFmUnFVRm1VTEhQVmJabGptRWJySTJyQzk5eTFVSEpKYk5kekZmbWJZ?=
 =?utf-8?B?Wm1iZ1NEVEN4c2k0NWRnZmkrS2tlZG5MVXhMUXA2SFhTSHNudlZCSTY4aWky?=
 =?utf-8?B?Qi9acE1NeGpiVHBMN3BzS1ZsL256aHZiMTBCK1ErYkI1SDJnZDRzbU9pczNX?=
 =?utf-8?B?OEk3eHdHQm1GMmg0ODl2ZldwSGdMT29nMEMzNVl2L2M5WHYzcXhrOGVDelFa?=
 =?utf-8?B?MFcvdzE1ZEMvV3pXdnVxNnhHemxNRUhjUERkZEFaOHJuNStxV3ozWTJrWWZu?=
 =?utf-8?B?MzlsbnU4clFucmxGL1B6MXdSUVZOaDh0T1pXQWNoTTc0RVBwSkp3NTQvT3FR?=
 =?utf-8?B?SzdwdG52dWxCQmcvYTB6eWVRUWdyWW9oTUNyY0pZTGJoYmNzaHZRSjBKOG43?=
 =?utf-8?B?ak15M2FaVzB1K2tWVHdaSC9IYUlKbXluTlMvRk1wTG5lR3N6WXFMU2FKRktF?=
 =?utf-8?B?OXU4enRjcTBnRFRZZE0wSDcvY1BFd0pWVFJDWHlmYlZUbVJkTkdyeGx0Zmpw?=
 =?utf-8?B?aUlsdHpHUjNaS1ZhUVRsQ2JteFZxVVVBa1cxOGF2cmNyR1JYQ3VrSUtCUjVT?=
 =?utf-8?B?aGJ6VS96VEZKOWc0RlNQYTJxQnlxWFk5Y1NDYmRDSVBjYisyQzJ1cExEMDhB?=
 =?utf-8?B?UkZ2S2JQakhDeFZnNXpmRlZwb1BsRm5LbGs0S1N6TTdBTU1rNVBRekVNcGdv?=
 =?utf-8?B?TlBoa3hxdzJCMmo3R2luelo3aFpSWVd1T0Z1dG42SjJWYTN1c09JL2tVcnJz?=
 =?utf-8?B?dzNUNFA1ZEt6Y3ZJdVFYaXVvc0lYNW1maGYyL2Q0bHdTYThmS0cyd1pWeEUw?=
 =?utf-8?B?VCtjbVFlTEpRMCtMOGRYdEJZNkFEcEp3Yk42SkpDRmtGTXNwb3hzSWNySG9u?=
 =?utf-8?B?bnp2VkNhTlpnPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8feeab-36a9-450a-0003-08dece12f5d6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:56:36.4756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB5630
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 11:51 PM, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > On 06/15, Chao Yu via Linux-f2fs-devel wrote: >> On 6/12/26 19:58, Yongpeng
 Yang wrote: >>> From: Yongpeng Yang >>> >>> Add F2FS_IOC_G [...] 
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
 [52.103.43.74 listed in wl.mailspike.net]
X-Headers-End: 1waaeJ-0007mr-QN
Subject: Re: [f2fs-dev] [PATCH RESEND 5/5] f2fs: add ioctl to export read
 extent cache to userspace for debug
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[SEZPR02MB5662.apcprd02.prod.outlook.com:mid,outlook.com:from_mime,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2A526A6866


On 6/15/26 11:51 PM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> On 06/15, Chao Yu via Linux-f2fs-devel wrote:
>> On 6/12/26 19:58, Yongpeng Yang wrote:
>>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>>
>>> Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that allows userspace to
>>> retrieve all cached read extents for a given file. This uses a two-call
>>> pattern similar to fiemap: the first call with ext_count=0 queries the
>>> node_count, and the second call fetches the actual extent entries.
>>
>> It looks a little bit heavy to maintain a debug purpose ioctl interface.
>>
>> Maybe set ino via sysfs and dump extent cache via procfs? only enabled
>> if F2FS_CHECK_FS=y?
>>
>> Jaegeuk, do you have any suggestion?
> 
> Agreed, and even not sure we need sysfs or procfs. Can we dump the extents
> via fsck?

It is indeed quite heavy. Our primary goal here is debugging inode
extent trees, and fsck cannot meet this requirement. If we rely on
procfs or sysfs interfaces, we would have to open dedicated files within
sysfs.c, which feels like an inappropriate approach.

Thanks
Yongpeng,

> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>> ---
>>>   fs/f2fs/extent_cache.c    | 70 +++++++++++++++++++++++++++++++++++++++
>>>   fs/f2fs/f2fs.h            |  3 ++
>>>   fs/f2fs/file.c            | 11 ++++++
>>>   include/uapi/linux/f2fs.h | 21 ++++++++++++
>>>   4 files changed, 105 insertions(+)
>>>
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index e141ffb64e5f..0c10d5639d68 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -14,6 +14,7 @@
>>>   
>>>   #include <linux/fs.h>
>>>   #include <linux/f2fs_fs.h>
>>> +#include <uapi/linux/f2fs.h>
>>>   
>>>   #include "f2fs.h"
>>>   #include "node.h"
>>> @@ -1267,6 +1268,75 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
>>>   	atomic_set(&eti->total_ext_node, 0);
>>>   }
>>>   
>>> +int f2fs_get_read_cache_extents(struct inode *inode,
>>> +			struct f2fs_read_cache_extent __user *uarg)
>>> +{
>>> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
>>> +	struct f2fs_cache_extent_info *kbuf = NULL;
>>> +	struct f2fs_cache_extent_info largest = {};
>>> +	struct rb_node *node;
>>> +	struct extent_node *en;
>>> +	unsigned int capacity, count = 0;
>>> +	__u32 flags = 0;
>>> +	int ret = 0;
>>> +
>>> +	if (get_user(capacity, &uarg->ext_count))
>>> +		return -EFAULT;
>>> +
>>> +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
>>> +		flags |= F2FS_EXT_FL_NO_EXTENT;
>>> +
>>> +	if (!et || (flags & F2FS_EXT_FL_NO_EXTENT)) {
>>> +		if (put_user(0U, &uarg->ext_count) ||
>>> +		    put_user(flags, &uarg->flags) ||
>>> +		    put_user(0U, &uarg->node_count))
>>> +			return -EFAULT;
>>> +		return 0;
>>> +	}
>>> +
>>> +	if (capacity) {
>>> +		kbuf = f2fs_kvmalloc(F2FS_I_SB(inode), capacity * sizeof(*kbuf), GFP_KERNEL);
>>> +		if (!kbuf)
>>> +			return -ENOMEM;
>>> +	}
>>> +
>>> +	read_lock(&et->lock);
>>> +
>>> +	largest.fofs = et->largest.fofs;
>>> +	largest.blk = et->largest.blk;
>>> +	largest.len = et->largest.len;
>>> +	largest.last_access_mode = et->largest.last_access_mode;
>>> +
>>> +	for (node = rb_first_cached(&et->root); node; node = rb_next(node)) {
>>> +		if (count >= capacity)
>>> +			break;
>>> +		en = rb_entry(node, struct extent_node, rb_node);
>>> +
>>> +		kbuf[count].fofs = en->ei.fofs;
>>> +		kbuf[count].blk = en->ei.blk;
>>> +		kbuf[count].len = en->ei.len;
>>> +		kbuf[count].last_access_mode = en->ei.last_access_mode;
>>> +		count++;
>>> +	}
>>> +
>>> +	read_unlock(&et->lock);
>>> +
>>> +	if (count && copy_to_user(uarg->extents, kbuf,
>>> +				  count * sizeof(*kbuf))) {
>>> +		ret = -EFAULT;
>>> +		goto out;
>>> +	}
>>> +
>>> +	if (put_user(count, &uarg->ext_count) ||
>>> +	    put_user(flags, &uarg->flags) ||
>>> +	    put_user((u32)atomic_read(&et->node_cnt), &uarg->node_count) ||
>>> +	    copy_to_user(&uarg->largest, &largest, sizeof(largest)))
>>> +		ret = -EFAULT;
>>> +out:
>>> +	kvfree(kbuf);
>>> +	return ret;
>>> +}
>>> +
>>>   void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
>>>   {
>>>   	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 1588b64d04a3..69641fc31c51 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -26,6 +26,7 @@
>>>   #include <linux/part_stat.h>
>>>   #include <linux/rw_hint.h>
>>>   
>>> +#include <uapi/linux/f2fs.h>
>>>   #include <linux/fscrypt.h>
>>>   #include <linux/fsverity.h>
>>>   
>>> @@ -4590,6 +4591,8 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
>>>   void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
>>>   				pgoff_t fofs, block_t blkaddr, unsigned int len,
>>>   				enum extent_access_mode access_mode);
>>> +int f2fs_get_read_cache_extents(struct inode *inode,
>>> +			struct f2fs_read_cache_extent __user *uarg);
>>>   unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
>>>   			int nr_shrink);
>>>   
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index a3a5d499eadf..66ec9927d667 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -3672,6 +3672,14 @@ static int f2fs_ioc_precache_extents(struct file *filp)
>>>   	return f2fs_precache_extents(file_inode(filp));
>>>   }
>>>   
>>> +static int f2fs_ioc_get_read_cache_extents(struct file *filp, unsigned long arg)
>>> +{
>>> +	struct inode *inode = file_inode(filp);
>>> +
>>> +	return f2fs_get_read_cache_extents(inode,
>>> +			(struct f2fs_read_cache_extent __user *)arg);
>>> +}
>>> +
>>>   static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>>>   {
>>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>>> @@ -4744,6 +4752,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>   		return f2fs_ioc_get_dev_alias_file(filp, arg);
>>>   	case F2FS_IOC_IO_PRIO:
>>>   		return f2fs_ioc_io_prio(filp, arg);
>>> +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
>>> +		return f2fs_ioc_get_read_cache_extents(filp, arg);
>>>   	default:
>>>   		return -ENOTTY;
>>>   	}
>>> @@ -5506,6 +5516,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>>   	case F2FS_IOC_COMPRESS_FILE:
>>>   	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>>>   	case F2FS_IOC_IO_PRIO:
>>> +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
>>>   		break;
>>>   	default:
>>>   		return -ENOIOCTLCMD;
>>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>>> index 795e26258355..6ff9003bc030 100644
>>> --- a/include/uapi/linux/f2fs.h
>>> +++ b/include/uapi/linux/f2fs.h
>>> @@ -45,6 +45,8 @@
>>>   #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>>>   #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>>>   #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
>>> +#define F2FS_IOC_GET_READ_CACHE_EXTENTS	_IOWR(F2FS_IOCTL_MAGIC, 28,	\
>>> +						struct f2fs_read_cache_extent)
>>>   
>>>   /*
>>>    * should be same as XFS_IOC_GOINGDOWN.
>>> @@ -104,4 +106,23 @@ struct f2fs_comp_option {
>>>   	__u8 log_cluster_size;
>>>   };
>>>   
>>> +struct f2fs_cache_extent_info {
>>> +	__u32 fofs;		/* start file offset in blocks */
>>> +	__u32 blk;		/* start block address */
>>> +	__u32 len;		/* length in blocks */
>>> +	__u32 last_access_mode; /* last access mode of extent_node */
>>> +};
>>> +
>>> +/* flags for f2fs_read_cache_extent */
>>> +#define F2FS_EXT_FL_NO_EXTENT	0x1	/* extent cache disabled for this inode */
>>> +
>>> +struct f2fs_read_cache_extent {
>>> +	__u32 ext_count;	/* in: array capacity; out: mapped extent count */
>>> +	__u32 flags;		/* out: status flags */
>>> +	__u32 node_count;	/* out: total extent nodes in tree */
>>> +	__u32 reserved;
>>> +	struct f2fs_cache_extent_info largest;		/* out: largest extent */
>>> +	struct f2fs_cache_extent_info extents[];	/* out: extent array */
>>> +};
>>> +
>>>   #endif /* _UAPI_LINUX_F2FS_H */
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
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
