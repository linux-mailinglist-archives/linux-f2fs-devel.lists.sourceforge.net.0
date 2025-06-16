Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A985DADBDE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 02:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cli41J7h2WEMlS4SxaIWCa8tj/FpYF6uU6xnyFiIVjE=; b=XFDL0An5io5+t0U7bAJqRbnFmE
	MefYe/LQLblaIWXEvOtOxc2FEmCfiKQGNoctTCVDw0I/g8cMmoGAa0Gk+9zit4NiQyWkX1tqLVT94
	CjcWenUMxXZTEckrI6G3+sGdga1xIveCEXYDik2cJ3/2sLFCFT3uN6j3M1JKNM7J5h6Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRJnn-0000NV-M8;
	Tue, 17 Jun 2025 00:03:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1uRJnm-0000NJ-6g;
 Tue, 17 Jun 2025 00:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9Amuu1cnmnKSZT8EifmRlotqroxM1F93OxqWrhOwZQ=; b=mVzmcQkD/v5a7L0N45WSxWcjI7
 FYAG1ZSPgurXqVLtx3yhS6xVygMXKJ6nYlc9xoWLEU8hj9DqQDjdxG/EkBqcjcRIa7YtOI/9mE3fm
 qOEEgfLV5WIadxsr2vGAKnkYcIr2Cb3WWKWXBqLjo36gmoeBgOyHl87wjJCzmOazmbyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9Amuu1cnmnKSZT8EifmRlotqroxM1F93OxqWrhOwZQ=; b=J9UJr7l7b/1IAMqckeBNCCy5sW
 zCcMSvZUFFs9K1XaK540alMKM7etU4EGxj+mTt01+qSo/CaCVbp8RO9B1zLiCjGqI6PfPtegqWe2i
 AJ2WiwlTGb8b6XGeBp+S6MCZd5NzW8J4Cgrk9gH+f+ppdciURVVFYfzai3OLb/97mmqs=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRJnl-00025L-BM; Tue, 17 Jun 2025 00:03:46 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GKmsAs026844;
 Mon, 16 Jun 2025 23:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=z9Amuu1cnmnKSZT8EifmRlotqroxM1F93OxqWrhOwZQ=; b=S4IDB116
 5rxfjTBmBJAMXKL0v7nxyI8KS2Z+tCg4L/6L2OrZ/Cn18hWxvsZ95718WPewexvP
 V94QmTe2BmXrVwFbFT7k7jVbv9ac/xUda2sF8XUJYkoEu6mpVfM4hFhDip8foZ2A
 8V4JcNf26gsEyUIKRG9KJHyVGVAEGeP8/oS/xfVqJ7cWggLQZ4V9e5l69pKmhAUd
 +sfArulOoFVH2uz1Uqd4pH5udkTzmC6mWG6ncXycO0BzoCArrMAKDcOzYYGWaNA0
 ubFCTRkjlYUMLYNxU7O+Yv5+P9dZgI65CFZEW+7A2Lnw0T1mVpns+AB+fgZPy2kJ
 vJZZZLOt+FJe2A==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 478ygn4qb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 23:26:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55GNQiL3004424;
 Mon, 16 Jun 2025 23:26:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 478ygn4qau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 23:26:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+aqp7AjBPn17rSIhoMDEsUA3tO+vkdkr3eVsAdhhS0VIqhfuS5YdtpChmzFIAgHUtbdmrm/JMBR8B0FPVQbNWv/hNrDLZAdatDkrUvkC+y+e/b7WIlyxb/njHdYULAZCNLkGa0yNBz7thNX/Fx9o+6A1OR4DnMgv/owRYtGO5u8KHyDBaRgwrPGcyJc1dUoMZBXFN7Q/8vKE6qPFXi9q+LAvN9THvL1LYg50hIJR77dF1hg/kMS2B/Sdqe+EiVNqjwlOb1w4w48sLOYl7CLXwlwHFYReBo05GHVAje5zTPI+VGYWEUB2EuJAfp2p7aWisDcbS1i4O8DqAr2O1i4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9Amuu1cnmnKSZT8EifmRlotqroxM1F93OxqWrhOwZQ=;
 b=wuCQg96Xbp5uAnKxauCDm10jXAFb09y6pu+woqUun04RejOfrg3Z0wLj5QTJ+PsvX/SdVuCB+Qelegqal2fCpcl5MiG0L1bb4agXoQADdB9r5Ehq7QeoYBWHOJhLH/V/uS6+8RotLNXtzTqVGPI0ndF9BqHZ7hv524/oCurxx9nh17qPlGyJUK0sN3lkDsAxfrHIMVhfi30y8TkBV64vR0L5TAiQNV/t6Ry09x7Dm9xzbnr8VB63CvokRoEIz3fXkn2ZU21EjQKWYlt16psLvCiH99g+dzgdNqSBcsI6C4WhkKO7dWCvSQDM+25qW1BNVc1H1KUZAZIeAQ2k6bU1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ2PR15MB6467.namprd15.prod.outlook.com (2603:10b6:a03:577::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 23:26:41 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::6fd6:67be:7178:d89b]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::6fd6:67be:7178:d89b%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 23:26:41 +0000
To: "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Thread-Topic: [EXTERNAL] [PATCH 08/10] fs: convert simple use of
 generic_file_*_mmap() to .mmap_prepare()
Thread-Index: AQHb3vY1k2m1+nMh1EGyW6lb2yGgIrQGbkwA
Date: Mon, 16 Jun 2025 23:26:40 +0000
Message-ID: <bbd4300abcd1ba128e593779a87a8c6133dfbfc4.camel@ibm.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ2PR15MB6467:EE_
x-ms-office365-filtering-correlation-id: 895cefc4-5da3-4e76-7a4d-08ddad2d3fb7
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cDRPZVp1aTFkV3RqY3liUjROUndQdzcybS90enZsTXRuWHJVd3VjUGN5bmRl?=
 =?utf-8?B?b2FUclNtSW5oazZqQ1ZvT3Y2N2drZ1BXTTRUTUxuK2hoeXBUMFZjTUFKU0lF?=
 =?utf-8?B?TUhSVXZiNGFJSHo5d042OENRQU04YnpQeWhaVS92U2s5S01tZUphYWQzYnE0?=
 =?utf-8?B?ci9VNGUrQjgyRTEzQVVTci9mN0g3NjMyYVJ0bm91K0lreWROTFR4WURjUzE0?=
 =?utf-8?B?RDdLYUVUVXM4Sjlod2xUS2VMZVlYVVRVeFlLS3c0aHhjNFhHeWhNdFlsSlk4?=
 =?utf-8?B?NXJuNUFSZ0E4TDEvVXdSTGlaZVJWT0hvM2Iya29qSCsycDB6RUkzdXI2QkVt?=
 =?utf-8?B?NFlVQlhaZW53eW1PODlUN0tIcHQ2L3JudFFuUkxSeVpmdFNVeU56em9NdFR0?=
 =?utf-8?B?clZyT1B0YTgvNkVBSWJqTTFrSmZCQURwekZLeVY1Q3JiVFQwVXRyd0JSajhG?=
 =?utf-8?B?ejdzYmttOEltV01MS1ZjZlJzczQ1d3hWV2hDRnhpUUxaSXJFK1lRTVFMQVJG?=
 =?utf-8?B?bzB2azAxSXdJc21PUHhrR0kyRnRaNll2TGFKTjI5RElIdGF1V0FPSFp2ZGxB?=
 =?utf-8?B?cEg2dTZFYUN4M2xmS2dNRjRBUS9rVDV4TUdkNDVwUjRvY2xWRWl6YXpick1K?=
 =?utf-8?B?RmNwUGt1RTMwSGFjOEdybzBzcVVhdnIzYWltalVZSU5Xbm1zV0M4ejNUdDRp?=
 =?utf-8?B?SnNLdThNUm5tQzdyUjZXMko1Yk1YV0pETStwdzJ3VitJdEFJWWZWNnNhUzli?=
 =?utf-8?B?YklXeUpGUkdrdis4b0UrTWgzTkxFeFdMU254Zk0wTXZmdkZpKzZZdUVCbWxh?=
 =?utf-8?B?c3VGTlBmN0paQ1BZU0tCaW5jNjRtV1pyTndPQng5RHJQNDZ6b2c3a2t5THVV?=
 =?utf-8?B?V2tiOFdSeTZjVDgzNEVXbFMwZytMTDdtTGNhRUlWdCtheHQ2UHhvQ1UwMGZ6?=
 =?utf-8?B?ZHp5NnJPYmlmM1o4c3dZRnorTmRUQTJnWFAyTDkzWGx6aWFLUjZ2Tmx0dVNl?=
 =?utf-8?B?TTlRdTVkNW1LY3lZaGF2UUVnVlBnbFhDaFNBQW1laDFkZGpVZVEvRThUUU96?=
 =?utf-8?B?dlowczlZSDlMYk1jUnp0WlZoR0hpQTlDSldhUkM3ektiNEtRV2E4VlZCSHVp?=
 =?utf-8?B?ZVdNbzB6ODVxMnVwNTlRMDBYQkYvNDkvd1dmZnhYdjRPRmltWHZBZmxXRVpm?=
 =?utf-8?B?bDJ4b1NYRFhJUk1RRVVXdGpPTFdxQzVaTjlyYlh6QWdpTWQ5UFVjZjNudHpE?=
 =?utf-8?B?dENKMFhsWmFxMTJaczczT01lRWxZcnh0ZURoUk0wNmhFQ1Y4bVd0bjNOU1JG?=
 =?utf-8?B?WU1jUFd3djFqdm1QRWV3YzAveW9sYmdYVm01QTZ1YWFKNmlQOVZtN1Fhbmxv?=
 =?utf-8?B?YmpMSFkvOGEySGJMV042M2lRbzBuOGg5Z0VxUm5makFYOVE3TmRFZWFXNjdL?=
 =?utf-8?B?eXgyZ01MNzQwOE82MXUwUWRHcTRVc1BINlRRUEE0WFZnRVArcDBhdG1NUVcy?=
 =?utf-8?B?dFU0dUdSUGlMTkd5SWp5Q0ZCT1NLZDBPdktyaDNpMnk4a0ovMTNoSVRZZDVn?=
 =?utf-8?B?eWJONVRLU0JRY29TYnZjZ0VHSi9GR0FoZ2VvM1R2Q3lOOGxlVXNRSFJsM2R2?=
 =?utf-8?B?ZFgra3lndW9RTmpwLzlXMUlJOFVzN3ZCVjVTUWlSZmRDTDE2WGs4YUx5aW1U?=
 =?utf-8?B?TXhmc3pSaGdwa1Y2aEVFc1Vrc3RVRnhqeXYxRU41ajBiSHlJY0tDYWliTkR3?=
 =?utf-8?B?Yi8wdzlSQ1F0Z0RaSEZaZ2s3bjhRWW5GVWtTWVFtK1l6WTlDV3lSUWJrcXVO?=
 =?utf-8?B?K0E1TmtNdEYycFRSb3ZJaDEzN2lWRkFhd1VFZS83OWZtanovTGVUclNyYU51?=
 =?utf-8?B?RDJVdnh6TUZJZnVxRzNxSGpibWZ6cC9nYmUvRjFFaWN5M0tEV1R6OEZCSG03?=
 =?utf-8?B?OFdpTW00Y3hIMkxZdFE2Q0pUQzU2NGl0M1VBeENia2U0aTMwaGE5cmU2cytK?=
 =?utf-8?B?TnhaSlNXNk1BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWYzNG92UDBybG9ydm0zY05VK29US0FyV241OTJTak01QjJhNXZFM1g1b0JD?=
 =?utf-8?B?OXpVRzVMUWxxNUZ6SnZuSjlzNzI2TG5EaG5ZdjlDdWpFYXNYNXI2bHAwbUhD?=
 =?utf-8?B?SkgvYkEzc0ZicW9HYitrRkxFckN2UWNKQmFZV2pkQWpIL3lsd2RpK25aSDcv?=
 =?utf-8?B?c3Vadis0ZzAwSksvNWphTkxVdEFPOXFIN0h4S3IvVHR4bEI4eW9ma1NoRTAw?=
 =?utf-8?B?TnZXRUlUeXpqREtkTjNDd0hQTWlWQlVITmVNVGdwSkxRUThRUTJLYUVCM2RJ?=
 =?utf-8?B?dmVHcHUwVmc0ZFF3b0NGVkxGU2hVV0dTb0g4cWZyR0YwQlFZVXBDa3U0d0hq?=
 =?utf-8?B?UEJ5TnJ5NWUrN040Uzh4dVFWUkJ2MXFjT2NndWloWWVTSUY2NFlOWmV6ZStZ?=
 =?utf-8?B?Yk5uSHFaaXU2U255QnV6MHg0eVhuOUZLV0R1Y2dNbVJsWi8vWFpDWXcxZnJ5?=
 =?utf-8?B?WTEwd2VROEljR0ZITHloYlBqRk85a2laVCszWi9SS1c3enZxbWh0LzhQYlFR?=
 =?utf-8?B?MmxCOGZuUEFVSWg0QWMzNkRNY01IbEZBcUUxY3lXTHM3eVZLOFo1Z2ZQYnZ2?=
 =?utf-8?B?dHRHcjFrQkcvQnRxSCtlUUtjalhJY2dPblFCK2RFa2lwWHJnQWUvcWsyTldP?=
 =?utf-8?B?elROMjVVQTkxREJMMmNBeFlRUVdVeUNvdVcrV0lmK2l2YWdKck1xRFFKemRr?=
 =?utf-8?B?S0JKSmxlTy8zcTdYbllMMG5xQUQ3QUNqNEsxUXprZ0dDazVIOS8yR2htK09K?=
 =?utf-8?B?K1BYcnNTTnBsd3lTdFRZMi92UmUrdlo2RzVWckxoOFJVZkdRbnpBLzhpbXhs?=
 =?utf-8?B?M2Q1a2xHQmRJa3l2WUpNM3RtcW9peU5Cakw0ZVZlNlhQYlY3SlFUYmdKWlo5?=
 =?utf-8?B?V2I2R24vbUEzMmNYSXQ4d2ttNHQwTkdSdkl2ZTZ4M29maGlyejdaOHJpNFNh?=
 =?utf-8?B?YytjUVZBdytGNVg1NE81M2dwa2lBdGM0eCtlblhrUlY3RjZWMXZsbDhUM3I4?=
 =?utf-8?B?QnkzY2xZSnQyREVYSExLMzdWN1pQUSswOTN5cmNpYzNHa3pQelVjVExRUXRz?=
 =?utf-8?B?VytjTE1QT3V0cUprbnd3eVFhWVZLbnQxaFR0WW0reVU5Zlgyd1k4YUxjNWlK?=
 =?utf-8?B?Rld3Vnp2akNZbGwzMkdsY0pDcDVvblVBeEVUTFFuODFyY2dMWmo2VDFQUXA3?=
 =?utf-8?B?a0dtYTczRUV3WXNwbUI1SmNzZjNWRTFpelNHNVFsbVU0OEI1anF6S0lGRjBL?=
 =?utf-8?B?U1dDaEJNWnVzK01mTFFGb2F0SkYyZ3k1cDY4RC9Rb0xsWFVJU2ZhVDZnTWwz?=
 =?utf-8?B?OHhCNFJqSzNFL0JXWlZJVTRjaXBqWGIxYW5wTEE4U1Awa1hSZys1dFl5dUQ0?=
 =?utf-8?B?cFFyZUsxYngzbTcrWU5lb2s3MGdoaytQK1p6Qkk1dTJBSG5LUklDM1Y5Nkxu?=
 =?utf-8?B?LzhFVmpYTUhSTDhwRFg2SGh0MmgzUC9RSnVvZ3ZrSTFWOTFBVExJcFVUTDRn?=
 =?utf-8?B?cXd5UVhpSmNySUNyT216MG50K2JLTXNpMTVpenE4OXhFR1lGRWZyZWtpRmN6?=
 =?utf-8?B?UStScTJFU1FVZHVITFlzVDcyK3kvVnVMaWZGdHR4UnVac3JVSXlKOEFLQXpp?=
 =?utf-8?B?RkwyZFYrZzRjYk9zWEF6MEVwTGFPVnMwcXlIem1xZkxGUm44aXAxU0E3aUhN?=
 =?utf-8?B?UXkwNGNjMHhYUGRDb1pmSFRXcGVlMENLNWp5ckFsU09wTCtiMTVhUzJOeExW?=
 =?utf-8?B?VmlNR2JaaHZTandNaHBSdEcybkVxWGR0cmlvaE16U0VTem9Uc05RN3Z2ajJw?=
 =?utf-8?B?cXE1WTdka0x4bTFqZk9tYUdSd2tqdXRTVHFBQlN1M09qMTRBZnNNdTRzQ3hh?=
 =?utf-8?B?M0lZSU8wQXlTdmZSci9jZ3lYU2JSNFVPYWsySzhCSUZuU3QvTUlLblNyQUpo?=
 =?utf-8?B?SDRvOFJmSDlSME9UU2dnY2NleW5GZVJNY245S0t1QlA1Y2FXbzN5RVI5aDFC?=
 =?utf-8?B?RWlqbjhmenJhOWlJYzZISGNEUTBZUVQ0K3lzNW9hVUtxSjZYV2UzTVVOYy9B?=
 =?utf-8?B?aTU1WjlHQmhuRFdHNmJwdXFnRUxObkFRSnZXR2FDWEdZaTFSU25XQmxteTZX?=
 =?utf-8?B?RUpwaHc4dnE0RmVpSXYzMk5xNkR3QklvQytjeWtPTXZhTThRYTYxTlZHS0dI?=
 =?utf-8?Q?kFFA3DnX27jMIY0oKaNCRa4=3D?=
Content-ID: <FA3FB1ADED5FE64C8292420FED48C5F9@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895cefc4-5da3-4e76-7a4d-08ddad2d3fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 23:26:41.0237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjF1CBw5RXllMs/RYt+a9Gv9bomgV4jRG8Qt+ozphS11ojAXSWA5YAL1IObm8Sv04GfqYQY8sUadQoupVIWcIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR15MB6467
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE2NyBTYWx0ZWRfX/yhSa7IcwJh+
 cqFFJX0yS10YGGB/QRREdUTBaB79BSkJrycMRoNLRZFwmGEVKN4D/YcqrvIEQWijFoio8f1nbZ5
 Imw1+Eflqlstan/c1OOhNdfBSvHbQksYbAjFo6Pep8lYhGZim3GvB4OJLBghNa9mILMGyzLXYCW
 O1v4v6S5OXDvuMudcwa7fMzcXRzQVKQhmvXuNjhSPRGHnBcTJA8O74jGjwK34wgb0V2560BtIRz
 AhBQYMHyr+K65MATkgBpSOpJoTXkX2h62vCzAK0tKwGtN+7+UUrs+q0KsaJMNi7vLDNvSmAqWlT
 bG1hbCm3lyJTbB+knpp/9p18ZfNEzZrYZ85lFjd0aIDQY6NLLT5utqjfJaYRITk0ukEEbOy0IrG
 iliydSEGumOaxc1M4S+39aXkElHo0WOGNmvRAYp7ZNHcDSj8mTQex75u6dt9Vq4ja+3T5hKb
X-Authority-Analysis: v=2.4 cv=fYSty1QF c=1 sm=1 tr=0 ts=6850a835 cx=c_pps
 a=5CpET3F+obEq8wTakKEnog==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=VnNF1IyMAAAA:8 a=K5pBiBE3vNJVv6Kx_kgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: lFgfPd5bXuX2bHn5bu1yiz-3Dvll88E_
X-Proofpoint-GUID: 0vBUP36GTObHu2Khyp7kdVmOwnFgAqAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160167
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2025-06-16 at 20:33 +0100, Lorenzo Stoakes wrote:
 > Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file >
 callback"), 
 the f_op->mmap() hook has been deprecated in favour of > f_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRJnl-00025L-BM
Subject: Re: [f2fs-dev] [PATCH 08/10] fs: convert simple use of
 generic_file_*_mmap() to .mmap_prepare()
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
From: Viacheslav Dubeyko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "lucho@ionkov.net" <lucho@ionkov.net>,
 "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>,
 "pc@manguebit.org" <pc@manguebit.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "hubcap@omnibond.com" <hubcap@omnibond.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "sprasad@microsoft.com" <sprasad@microsoft.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "ericvh@kernel.org" <ericvh@kernel.org>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "trondmy@kernel.org" <trondmy@kernel.org>,
 "shaggy@kernel.org" <shaggy@kernel.org>,
 "dhavale@google.com" <dhavale@google.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "pfalcato@suse.de" <pfalcato@suse.de>,
 "hirofumi@mail.parknet.co.jp" <hirofumi@mail.parknet.co.jp>,
 "tom@talpey.com" <tom@talpey.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "lihongbo22@huawei.com" <lihongbo22@huawei.com>,
 "anna@kernel.org" <anna@kernel.org>,
 "martin@omnibond.com" <martin@omnibond.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "yuezhang.mo@sony.com" <yuezhang.mo@sony.com>,
 "cem@kernel.org" <cem@kernel.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "clm@fb.com" <clm@fb.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "marc.dionne@auristor.com" <marc.dionne@auristor.com>,
 "code@tyhicks.com" <code@tyhicks.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>,
 "willy@infradead.org" <willy@infradead.org>,
 "coda@cs.cmu.edu" <coda@cs.cmu.edu>, "slava@dubeyko.com" <slava@dubeyko.com>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux_oss@crudebyte.com" <linux_oss@crudebyte.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dlemoal@kernel.org" <dlemoal@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "idryomov@gmail.com" <idryomov@gmail.com>,
 "jaharkes@cs.cmu.edu" <jaharkes@cs.cmu.edu>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 "jack@suse.cz" <jack@suse.cz>, "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "asmadeus@codewreck.org" <asmadeus@codewreck.org>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 "me@bobcopeland.com" <me@bobcopeland.com>, David Howells <dhowells@redhat.com>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "zbestahu@gmail.com" <zbestahu@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "mark@fasheh.com" <mark@fasheh.com>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "jannh@google.com" <jannh@google.com>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Hans De Goede <hdegoede@redhat.com>,
 "bharathsm@microsoft.com" <bharathsm@microsoft.com>,
 "aivazian.tigran@gmail.com" <aivazian.tigran@gmail.com>,
 "dsterba@suse.com" <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 "konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "jth@kernel.org" <jth@kernel.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 "bcrl@kvack.org" <bcrl@kvack.org>,
 "jefflexu@linux.alibaba.com" <jefflexu@linux.alibaba.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-karma-devel@lists.sourceforge.net"
 <linux-karma-devel@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2025-06-16 at 20:33 +0100, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> We have provided generic .mmap_prepare() equivalents, so update all file
> systems that specify these directly in their file_operations structures.
> 
> This updates 9p, adfs, affs, bfs, fat, hfs, hfsplus, hostfs, hpfs, jffs2,
> jfs, minix, omfs, ramfs and ufs file systems directly.
> 
> It updates generic_ro_fops which impacts qnx4, cramfs, befs, squashfs,
> frebxfs, qnx6, efs, romfs, erofs and isofs file systems.
> 
> There are remaining file systems which use generic hooks in a less direct
> way which we address in a subsequent commit.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  fs/9p/vfs_file.c        | 2 +-
>  fs/adfs/file.c          | 2 +-
>  fs/affs/file.c          | 2 +-
>  fs/bfs/file.c           | 2 +-
>  fs/fat/file.c           | 2 +-
>  fs/hfs/inode.c          | 2 +-
>  fs/hfsplus/inode.c      | 2 +-
>  fs/hostfs/hostfs_kern.c | 2 +-
>  fs/hpfs/file.c          | 2 +-
>  fs/jffs2/file.c         | 2 +-
>  fs/jfs/file.c           | 2 +-
>  fs/minix/file.c         | 2 +-
>  fs/omfs/file.c          | 2 +-
>  fs/ramfs/file-mmu.c     | 2 +-
>  fs/read_write.c         | 2 +-
>  fs/ufs/file.c           | 2 +-
>  16 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 348cc90bf9c5..2ff3e0ac7266 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -516,7 +516,7 @@ const struct file_operations v9fs_file_operations = {
>  	.open = v9fs_file_open,
>  	.release = v9fs_dir_release,
>  	.lock = v9fs_file_lock,
> -	.mmap = generic_file_readonly_mmap,
> +	.mmap_prepare = generic_file_readonly_mmap_prepare,
>  	.splice_read = v9fs_file_splice_read,
>  	.splice_write = iter_file_splice_write,
>  	.fsync = v9fs_file_fsync,
> diff --git a/fs/adfs/file.c b/fs/adfs/file.c
> index ee80718aaeec..cd13165fd904 100644
> --- a/fs/adfs/file.c
> +++ b/fs/adfs/file.c
> @@ -25,7 +25,7 @@
>  const struct file_operations adfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= generic_file_fsync,
>  	.write_iter	= generic_file_write_iter,
>  	.splice_read	= filemap_splice_read,
> diff --git a/fs/affs/file.c b/fs/affs/file.c
> index 7a71018e3f67..fbac204b7055 100644
> --- a/fs/affs/file.c
> +++ b/fs/affs/file.c
> @@ -999,7 +999,7 @@ const struct file_operations affs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open		= affs_file_open,
>  	.release	= affs_file_release,
>  	.fsync		= affs_file_fsync,
> diff --git a/fs/bfs/file.c b/fs/bfs/file.c
> index fa66a09e496a..6685c3411fe7 100644
> --- a/fs/bfs/file.c
> +++ b/fs/bfs/file.c
> @@ -27,7 +27,7 @@ const struct file_operations bfs_file_operations = {
>  	.llseek 	= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  };
>  
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index e887e9ab7472..4fc49a614fb8 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -204,7 +204,7 @@ const struct file_operations fat_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.release	= fat_file_release,
>  	.unlocked_ioctl	= fat_generic_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index a81ce7a740b9..d419586d668d 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -690,7 +690,7 @@ static const struct file_operations hfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.fsync		= hfs_file_fsync,
>  	.open		= hfs_file_open,
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index f331e9574217..0af7e302730c 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -366,7 +366,7 @@ static const struct file_operations hfsplus_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.fsync		= hfsplus_file_fsync,
>  	.open		= hfsplus_file_open,

Looks good for HFS/HFS+.

Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

Thanks,
Slava.

> diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> index 702c41317589..bc22b6cc72af 100644
> --- a/fs/hostfs/hostfs_kern.c
> +++ b/fs/hostfs/hostfs_kern.c
> @@ -382,7 +382,7 @@ static const struct file_operations hostfs_file_fops = {
>  	.splice_write	= iter_file_splice_write,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open		= hostfs_open,
>  	.release	= hostfs_file_release,
>  	.fsync		= hostfs_fsync,
> diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
> index 449a3fc1b8d9..a1a44e3edb19 100644
> --- a/fs/hpfs/file.c
> +++ b/fs/hpfs/file.c
> @@ -255,7 +255,7 @@ const struct file_operations hpfs_file_ops =
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.release	= hpfs_file_release,
>  	.fsync		= hpfs_file_fsync,
>  	.splice_read	= filemap_splice_read,
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 13c18ccc13b0..1e05f7fe5dd4 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -54,7 +54,7 @@ const struct file_operations jffs2_file_operations =
>   	.read_iter =	generic_file_read_iter,
>   	.write_iter =	generic_file_write_iter,
>  	.unlocked_ioctl=jffs2_ioctl,
> -	.mmap =		generic_file_readonly_mmap,
> +	.mmap_prepare =	generic_file_readonly_mmap_prepare,
>  	.fsync =	jffs2_fsync,
>  	.splice_read =	filemap_splice_read,
>  	.splice_write = iter_file_splice_write,
> diff --git a/fs/jfs/file.c b/fs/jfs/file.c
> index 01b6912e60f8..5e47951db630 100644
> --- a/fs/jfs/file.c
> +++ b/fs/jfs/file.c
> @@ -143,7 +143,7 @@ const struct file_operations jfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fsync		= jfs_fsync,
> diff --git a/fs/minix/file.c b/fs/minix/file.c
> index 906d192ab7f3..dca7ac71f049 100644
> --- a/fs/minix/file.c
> +++ b/fs/minix/file.c
> @@ -17,7 +17,7 @@ const struct file_operations minix_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= generic_file_fsync,
>  	.splice_read	= filemap_splice_read,
>  };
> diff --git a/fs/omfs/file.c b/fs/omfs/file.c
> index 98358d405b6a..319c04e63964 100644
> --- a/fs/omfs/file.c
> +++ b/fs/omfs/file.c
> @@ -332,7 +332,7 @@ const struct file_operations omfs_file_operations = {
>  	.llseek = generic_file_llseek,
>  	.read_iter = generic_file_read_iter,
>  	.write_iter = generic_file_write_iter,
> -	.mmap = generic_file_mmap,
> +	.mmap_prepare = generic_file_mmap_prepare,
>  	.fsync = generic_file_fsync,
>  	.splice_read = filemap_splice_read,
>  };
> diff --git a/fs/ramfs/file-mmu.c b/fs/ramfs/file-mmu.c
> index b45c7edc3225..b11f5b20b78b 100644
> --- a/fs/ramfs/file-mmu.c
> +++ b/fs/ramfs/file-mmu.c
> @@ -41,7 +41,7 @@ static unsigned long ramfs_mmu_get_unmapped_area(struct file *file,
>  const struct file_operations ramfs_file_operations = {
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= noop_fsync,
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 0ef70e128c4a..80fdab99f9e4 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -28,7 +28,7 @@
>  const struct file_operations generic_ro_fops = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_readonly_mmap,
> +	.mmap_prepare	= generic_file_readonly_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  };
>  
> diff --git a/fs/ufs/file.c b/fs/ufs/file.c
> index 487ad1fc2de6..c2a391c17df7 100644
> --- a/fs/ufs/file.c
> +++ b/fs/ufs/file.c
> @@ -38,7 +38,7 @@ const struct file_operations ufs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open           = generic_file_open,
>  	.fsync		= generic_file_fsync,
>  	.splice_read	= filemap_splice_read,

-- 
Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
