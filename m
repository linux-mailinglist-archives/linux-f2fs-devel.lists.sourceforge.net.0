Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E3914F63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 15:59:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkE5-0001mw-Fu;
	Mon, 24 Jun 2024 13:59:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sLkE3-0001mn-Rm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgEAAy4nKSAlicIICYU0FPnvsqdXNIu/+UNVaoCGd9E=; b=NK3URyxvIKsjjogUHd6bGIf/66
 Z/r7B38t/St/VyLa7KuWbvo/1fUh6OtGzg2VoXKl/liqOLaWD5qa8o9wE+Q3pkJqvFcxTTiycR/hy
 z49TkC6u1UxbbnXLOF4heE0rQbkvxNSKjRQMrjbWD4ggWpNVc6mo4IGgGpE+ADjLVoIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZgEAAy4nKSAlicIICYU0FPnvsqdXNIu/+UNVaoCGd9E=; b=gpg1iFDijIW7i5LN5QGUdaHdrp
 MhWZTwvrinWi5IXtkzas4cNpb/GYFhez/3ZUxVoZrOxudah3hfR2SZm6P/9Lx6RnF7rlSR2zRABGE
 8kzSHurRRsemNEtTfkWUwXmuF5WajVAAajmYFNDKAXYyoXI/mbE+S4F+xTJBVtbIgnB4=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkE4-0001X6-RP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:59:20 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O7g13B029713;
 Mon, 24 Jun 2024 13:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 message-id:date:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 corp-2023-11-20; bh=ZgEAAy4nKSAlicIICYU0FPnvsqdXNIu/+UNVaoCGd9E=; b=
 iQnG6njNWF8O3x1GSdMTjaz33sN+hReDUPW5/GsH2VuGtAIYlyYVq62fuNsClxVC
 TM1Px3ddMkqhnqnl26LDABgrcIYMgH3WWeUK2raoOdngWtJksmS+XV8LVzrnDqIO
 k6yOJ5WAzPbuT48ZYZDsRf4hXehYXL1TLmXw4CgOpB3p/p/+onyMqb5X4H/jOLSo
 XHYIdUoCpTiWP+cl9GYJ5sIAYNiSX5xgQZ8KmhbO5LI7QZAGcC8SGoJILwJZNDOs
 0JC6Cz7DJ/wTSXnnkDT9rnCNFu50Trgho3WhFDqD9ini6zM6r9IoX8fEGmcpqg6U
 wuiVOtImHY9qz8/LEVhSjg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2apep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2024 13:58:50 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45ODANo6017797; Mon, 24 Jun 2024 13:58:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ywn25yp8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2024 13:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5/sNCztwo+z99obSSbK2O+tuLnJRUiQ4LFdIHCzTrdLleuPkCR0nIiE65dKVM8zSGKsIrk5jzQ5BY5lWjcUJ6SVgo1OlVgA3RgU67wRVWm0ldDysUpXOcLqE6JMVHHunNibFRBC2JOPv+HJFORtAIlHsCn9jrGyh53gEwMGIFtNOu6D+/jnQr9r5taDnfirmEatwtP6U0q/PhRu+NzJ/yktMr9d1tZHhvftyak4svRWIa+l+Jz3ZZ2S3gs6o+wulhBBpEIe2wJrJouRj24XsJdBCmxINWJolJSQY6+ZZ0xsuSSykcuIiBTf5N5j5z8Ob4CAdoRKMY+FeirkQijA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgEAAy4nKSAlicIICYU0FPnvsqdXNIu/+UNVaoCGd9E=;
 b=L1yyekAVZH7T853D162TMBW+ELd1vLTNiHTPqbLHN1qW4nnS5NCI+hQ4rnYA8ZbqzSCAM4TcNLo8Xbpeg+MXU1okP/7MSNwPqgX5jfEsIa99L6pDztl47CP2hei2kylTnNIkzZ5cE3SkxdEORsSZm+0hyHc9p/XTEnfirS1yJw+LyQsG2RgauLKQ8ODecXNPX+5UohSmd0g42deBZA6cmpe1PNjvQbgbHF9ePZXWBQ3jWX4UojBzCxBZSPk3cDjyCcP0nFdQVerZDsTAUezHfg4zyYSby7ffIMBEZOY++akWzLuTcT+niZLRwzrKiSYIoAwZ8jyTfojeD6sEcURe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgEAAy4nKSAlicIICYU0FPnvsqdXNIu/+UNVaoCGd9E=;
 b=P0Z6amF+XUgti9YQQMLp8RjUtbVguJgeBuIFSKFQzpCkjVlGoxWODGFf3w6tm/98aOw/UdlY8s1A6lWIesM4UPcfwxWFhQbfLHlVNyyHByPHI0xpycwYGtpU+l84k55Ci6SDv6pHrgGUcKFWwLRB5/xt9ff9dCs6iiwRPRwTdTg=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4220.namprd10.prod.outlook.com (2603:10b6:5:221::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 13:58:47 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 13:58:46 +0000
Message-ID: <644afc72-71bb-4201-8829-ccf3211d68b7@oracle.com>
Date: Mon, 24 Jun 2024 14:58:40 +0100
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
 <20240607143919.2622319-3-john.g.garry@oracle.com>
 <20240612213235.GK2764752@frogsfrogsfrogs>
 <59255aa1-a769-437b-8fbb-71f53fd7920f@oracle.com>
 <20240621211855.GY3058325@frogsfrogsfrogs>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <20240621211855.GY3058325@frogsfrogsfrogs>
X-ClientProxiedBy: AM8P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::11) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: c87cd328-ee2b-47c7-3e22-08dc9455c451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0wvU2lXQzhvaUpQdDQxcXRyVlJWaXF0c01HNk9nWVdteEE1WldDWWJneWxj?=
 =?utf-8?B?U3BvYzl4S0RpT041V3hhMnZZd0J4WFVvVlJhcE1TRmVNZGtkVGxXa3U1Tlkw?=
 =?utf-8?B?VWpSeWwyODR6aVdENHhmd21ONnNxVUJOS3dzNUppTjlML1pkYlNxVDVvUWRo?=
 =?utf-8?B?UGhzUTdjWXpBV1NsdGlKR0tnQ041WUhYTThwVGRqVzI4cEIrNG5zSklzS2xz?=
 =?utf-8?B?Y1NVSE1nSWFZLy8zTGhPVlR5TTk3c0Z0ZmI3TVAyY0J2Y0JYZlJycWxUWkRU?=
 =?utf-8?B?M2RGbCswcysvbytiaU5MdFp0T0sxRENnRllKSEhnQVUycXpidU5BUDc3KzA1?=
 =?utf-8?B?YUVic3JGR2hrelJQbW9iUmFUSUtGRWJlOHI4Smt2UHZzc2NGYUVpT1N5ckgv?=
 =?utf-8?B?OC9rOHF4S1dRbW1TRGpiYlIraFdhSjZSWThHVUtIR3hDMG1CRWpjajd5Q1hK?=
 =?utf-8?B?cjQwZ1hYdHh3WmdQeHU0VnVxMzJ2ZGpFWE9TTXR6U0VmczRBMXpKRmUzd0NG?=
 =?utf-8?B?QUlvOTRMRFdPTDJGUHE4OWUxeHFnM3dtTlhiN3E5Mk9JeTZQeHB3dGkzdnE1?=
 =?utf-8?B?MEIwSU9RemZPNUsveWF0dkRsT1ZuclV1WTVmWUJ2ZytPRXdIN1huOU91dXlq?=
 =?utf-8?B?TUNuOTZSQXlBZkRSbmZkUkl3ZXF1NklHVmZtOUdBSDZ6SHhsK0o0aERndTA5?=
 =?utf-8?B?L2tqK3VYalI5ckVYUDhXTzJkMHZWL0NZUnpjUmVNd3RqUktnLy94c3liWm01?=
 =?utf-8?B?MFpRZW9qRE5xMlBFU1FnRXVyS3pVRmRiWUpjNXdQdWpJdmJ4SXp2Mi9jdDdX?=
 =?utf-8?B?VFVmRkZGV3ljOXpVM093clBGWWY3MW9ybmFOeUFwQlZoZXFOM1AwSHFEMEVK?=
 =?utf-8?B?Q29zK2c4bmFpdnFScmNkcmF3QnJBdERyS1A2MnZSWXlSQ1U3OXhLdDJaYXRa?=
 =?utf-8?B?SG1Tay9FeTlseHpEaTBTNHhXQXB4VHJ6V01WZGVUL1BCeEV3cmErczlmRC9L?=
 =?utf-8?B?ZGdHZ3pMQ3c3K0wrT0dPdEU4NTV2TWV3SWxZYitId3dOMWJ4YXJmRXFqVXhM?=
 =?utf-8?B?NHB1NHp1dVpENEtEQTVybDVYWWdvcGJ5NUg5Vk1SNmREU1pCNEtyOERxVm1X?=
 =?utf-8?B?alpyTGZ1eWZYSnFzOExjYkxnZ2toc08wd0dYT2hONDBRRlZYQURVRC8zdUox?=
 =?utf-8?B?SFIybENCRUZtT1lGS28xd0dnTEtDK1Mwd01ZQmZwNmg5ZERtSGpwMHZhaXB6?=
 =?utf-8?B?NDdpNDQ3QTcwaWZleGlHSjAvRXNWRU9YNkw5cGNhcTY0a2N2STlkbHVDQUYw?=
 =?utf-8?B?bi96aVFVN05GbkRqTHMyL3c0dyt3K081a2tQQmVnV1BCelhiVlhCN1Y3ZVVW?=
 =?utf-8?B?UG9jbVRKTENZWDJYdmVZMy9TcVRaTitENjhCTjgwaUM5Q01od2JLZ05kUTh0?=
 =?utf-8?B?ODluYVBvSXBqK2N4M3UvNVdzTlJWTzZEME8rRjFvbFdXeXBaNE9XQ2x0dWRi?=
 =?utf-8?B?eDRNVGFhZWJqanJaWjQ5U3d1UUJoUWlxRzZDU2hDdkt6YzM5N3RQUVVsd1Bj?=
 =?utf-8?B?SzFMVHh6RzFYV2NxOVl5OS9rdFAzemJHcHNVK0t0ajlCcW11dkdIRG1JeVVk?=
 =?utf-8?B?ckwzaUFhSVFkMDU1RytGb21tZllObDJ2MkFPcGlwTncrNzhrcGhjL055YWdl?=
 =?utf-8?B?V3o0allDV1NLZE0xUmpNYTNLN2dNTEhEOHM3SWh0SDJYbGFTODdoL2liVGFF?=
 =?utf-8?Q?lWelmzxQ/lV02MOKvcMrmwmjqlRUjyHN1Clz6KY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJWczgwVzJmeXlPbVpVMmNkWFN0TFNWYmo0VGY2MEdZS2pFeEJiN2p0UVBI?=
 =?utf-8?B?MHhGSFJkZjNCdThTaFBqS2VjdmZrY0lmK0NlNE5oWDBKS1ZSQ0ZxRUtscWNN?=
 =?utf-8?B?T2N5NjAxQjRpbjJUWGE0a3pHWnMzUkk0YUVuR3BRTC8yVFowaFJjK3oxRXhM?=
 =?utf-8?B?UVZDRFpjWTZCZlFMR0FDY2dtU0VwMkl1SE0yZGpYbHp1UEEyL1JIY1lSMll0?=
 =?utf-8?B?Vk5wSXcvSEVZTkNDaW83bnVrZTZnK0RpU0xneHpPdU0yS0ZWeVRlMjZ1c2wv?=
 =?utf-8?B?dXBpWlRocklvclRtems0cktSbDJVS3JzZS9DQ012c2Z1Sk1PL3dLTEFBd3B0?=
 =?utf-8?B?S2pDRTlVVG9aK296TzcvZkVmeDJ6Nnh2dGY0K1dlbnJYVG1wdWhxQ21RTHlN?=
 =?utf-8?B?c0ZwNzRJOU53ak0rMFNxL1ZMZy9Sclo4QTZrOTZtaFErK3B4QlE2M3JxTVdr?=
 =?utf-8?B?YWs0UDRCcy94R01RTFYzUTNZNWVxM0JvTHcwMmpPWWZSQ2ZSV1BGTEs5YjRl?=
 =?utf-8?B?RHhSbkZXMGZjZ0xUWlluSGd5SEtUYWFQSHhKd1dzWWpRQldJeFNubU9JbGp1?=
 =?utf-8?B?S3dDTTluQk5saU9RbiszMlM3S2xoUk05aUJuY2p4cytSeVRJODViYkxJa2Z1?=
 =?utf-8?B?ZG5ON2NXY3NLamVnWk9xRlFVUUoyYVVweEZISTduL2R5aDlrVHpxbmcrYzFm?=
 =?utf-8?B?Zmp6VXBxc3ZJSEFEeEY3MjlZM2hIdU1rd1Vkdkp6NGh6elpvSzhJQzlNeVdn?=
 =?utf-8?B?akJORGgzUnZwY1hSeTBieFl0ZkVEekxGQTRBNGZZVUNEYnVRWVdYVStBSU1h?=
 =?utf-8?B?U3NPRzE3Ui94c0YwU05mSmRYblZqR1JuaG1zZEVQQ29XT2I4aU44b3lYeW41?=
 =?utf-8?B?SmxqMXRFSE9wQnZ2VTYvUS93QTFyZU15eHhnd0RhODFKMStXZkgrMnAyOFJP?=
 =?utf-8?B?Sld3N0JrZWhnWkVnZkorcTNmaTVzSTMra0hIdStLWjN3aHNpc0svMzJkeUFa?=
 =?utf-8?B?UlJhQitVQklpRWY2SVprcURHTHlkWTVyTWhCOUhhd1JwNVB2c1ZBZUZYWUd6?=
 =?utf-8?B?T1QzT0RkK0kxS0xxSGQvUEhtK3I1Y09HRGdJUGhybXhON2RmNkljNXFGcFJG?=
 =?utf-8?B?WGZVZG9kdE5sOUhJK2g4UCtLb2lhdXRnN2FKOWFUbi9vYnRGeEpzenRqM1ZV?=
 =?utf-8?B?RGtUak84dy8wQjYvT01qMm94VlVsK3JiMldvNjFqOFoyMTNFS1ZrOHNidS9V?=
 =?utf-8?B?Rk5zNUFqL2p0YURDTUJoODVKTWRRdHVEeXJmcTd1TlEzb1lnMWRCMm9YeDM1?=
 =?utf-8?B?dkdxak9mcEcxRlZ3cU40bUUyOTNySHNwSTdJK1pBa0llNzJucS9UM1VjTzNt?=
 =?utf-8?B?QlRObG5UN0JWYkhOOGNveG1TdFlzWnRIaXFIRTFRblEwcmdSQTdJVmw2NG1m?=
 =?utf-8?B?QlAxd1NScUxVNkdWTDBIU0VObkptRTlmcGV4b3N2b0ZVS1JRU2c1VTVHSjJ5?=
 =?utf-8?B?WExxU0czdmM0SFlCNlg3UEFmMHhwYlg3QjViME9TTjZ1VmpPSWh2eXFRTVVv?=
 =?utf-8?B?U0VMUncxclpWR1Jxb1hHMjUvN1FsSFd2MCtweEE3c2JhU0dzVjUzS2xmKy9N?=
 =?utf-8?B?bHdnUGswcTYzRitoMUlCUWptK0pqc0d2YkJNdEhuWkF3VzBrWHNTWVZGM2JN?=
 =?utf-8?B?Smg3TmlWMlhPbU9sUGowYUwrNGRoU1gyNmJWRjd1cjIyT3dNVWN6MW1nZ2Fp?=
 =?utf-8?B?dlF6d1plQnl2WXRSYW9laVQyRFc1NHZnT3RKTEJ2ZjRpc1NoMzBJdTB0bERT?=
 =?utf-8?B?WEwwdVJ2NDZYY0VMOW5kckllbFE4aUoxdnlZREQ5cWlaMnRNaDVZOFIvN09I?=
 =?utf-8?B?V3lTbDRDcEgzdHBrclpSdG4wSXFhVDl3cUlOejBxWi9QN29uMEI3SW1UeDcr?=
 =?utf-8?B?K1JrVU0ycnl2SEdWaXRtakhqdm1kV01kaThXT1BMZnQzc0MzWDlsL05zVE9W?=
 =?utf-8?B?L1E3S1d3U3YwMUNJbUh2Z2JxVXlwUXhrTDNVMUdkZkRJRDQ1YkNJRlVndjhJ?=
 =?utf-8?B?Rmc1Sy9jNXhwdkZZMnNWYzB0YzRWN1UzSXZ1VzZqaDRQTFNHd1BvZGgxblM2?=
 =?utf-8?Q?BZ8S85SEmMPacQjQ4Bq7hc9t7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4BSj8SUlbRRmGj9xvN2JvYqU92/hUDNa7f3YV/njFyi3UyVXnyAbQDeVa5ygrkzvEU1nSAD68kkw4X4nSrK1oF9Dw/xD2QmYn/y7GP3z7Sfmg4wKMedUNbdvXnSM6XoK+ULpkTrecpdgQ3m3C49EKWs7xk6CbkYk2ovp5qJdXlUtA0wS0OgFUaVdv9JHmb7iwrXbtBl1H3zvOnlLz/OHSb9hTYxmBcI852ggG//knOb5RS8gOEkMDEIF63Grh3vljLhx5xOcSB6CWHpsHSvFCy9k7KmOHOY6T6XFmlTGOeGqC/JiKdHv+5HkODaqMwrAJ8a0UcFOwoJDXt3VAdhbCNvRyhIeVkD5df8uK85iy6UXGlMQ1+5h2UyH+FDFqLoT519Wcn6hKY+w+JLsqDj4kyIdYT3lnUQdbp87v/qBbJXequBN9svPjeSqCkeJ8lj6J14svEeh9VnkbbtEgbqYs6xS576EPj3ZP6FY+xQnjUykwI/JlB/XDHk+L0s+MnPigs//vH9V8WI+LLWIL87OXcIywo4co4q/262Cc+iN+YRFhvcFtbVojJ2rYihhFtav8hzTj8vjycN4Z3uxnJ7KnBLZdSB2LEmtlvs7IMBJ2sc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87cd328-ee2b-47c7-3e22-08dc9455c451
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:58:46.8722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8lKtNHBBKrQcZhnyouEeKJJP7MUeo61TCd1AcXZBt2W01eSC8iGTOHA0siQP5Kyy/6SkifaIpVxVI/3Fbax1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4220
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_10,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406240112
X-Proofpoint-ORIG-GUID: 0LfbOqaPdjqhGyV3caVmwGkGGOTwCllz
X-Proofpoint-GUID: 0LfbOqaPdjqhGyV3caVmwGkGGOTwCllz
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 21/06/2024 22:18, Darrick J. Wong wrote: > On Thu, Jun
 13, 2024 at 11:31:35AM +0100, John Garry wrote: >> On 12/06/2024 22:32, Darrick
 J. Wong wrote: >>>> unsigned int fs_block_size = i_blocksize(i [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sLkE4-0001X6-RP
Subject: Re: [f2fs-dev] [PATCH v4 02/22] iomap: Allow filesystems set IO
 block zeroing size
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: ritesh.list@gmail.com, gfs2@lists.linux.dev,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, agruenba@redhat.com,
 miklos@szeredi.hu, linux-ext4@vger.kernel.org, catherine.hoang@oracle.com,
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 axboe@kernel.dk, brauner@kernel.org, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, chandan.babu@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 21/06/2024 22:18, Darrick J. Wong wrote:
> On Thu, Jun 13, 2024 at 11:31:35AM +0100, John Garry wrote:
>> On 12/06/2024 22:32, Darrick J. Wong wrote:
>>>> unsigned int fs_block_size = i_blocksize(inode), pad;
>>>> +	u64 io_block_size = iomap->io_block_size;
>>> I wonder, should iomap be nice and not require filesystems to set
>>> io_block_size themselves unless they really need it?
>>
>> That's what I had in v3, like:
>>
>> if (iomap->io_block_size)
>> 	io_block_size = iomap->io_block_size;
>> else
>> 	io_block_size = i_block_size(inode)
>>
>> but it was suggested to change that (to like what I have here).
> 
> oh, ok.  Ignore that comment, then. :)
> 

To be clear, Dave actually suggested that change.

>>> Anyone working on
>>> an iomap port while this patchset is in progress may or may not remember
>>> to add this bit if they get their port merged after atomicwrites is
>>> merged; and you might not remember to prevent the bitrot if the reverse
>>> order happens.
>>
>> Sure, I get your point.
>>
>> However, OTOH, if we check xfs_bmbt_to_iomap(), it does set all or close to
>> all members of struct iomap, so we are just continuing that trend, i.e. it
>> is the job of the FS callback to set all these members.
>>
>>>
>>> 	u64 io_block_size = iomap->io_block_size ?: i_blocksize(inode);
>>>
>>>>    	loff_t length = iomap_length(iter);
>>>>    	loff_t pos = iter->pos;
>>>>    	blk_opf_t bio_opf;
>>>> @@ -287,6 +287,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
>>>>    	int nr_pages, ret = 0;
>>>>    	size_t copied = 0;
>>>>    	size_t orig_count;
>>>> +	unsigned int pad;
>>>>    	if ((pos | length) & (bdev_logical_block_size(iomap->bdev) - 1) ||
>>>>    	    !bdev_iter_is_aligned(iomap->bdev, dio->submit.iter))
>>>> @@ -355,7 +356,14 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
>>>>    	if (need_zeroout) {
>>>>    		/* zero out from the start of the block to the write offset */
>>>> -		pad = pos & (fs_block_size - 1);
>>>> +		if (is_power_of_2(io_block_size)) {
>>>> +			pad = pos & (io_block_size - 1);
>>>> +		} else {
>>>> +			loff_t _pos = pos;
>>>> +
>>>> +			pad = do_div(_pos, io_block_size);
>>>> +		}
>>> Please don't opencode this twice.
>>>
>>> static unsigned int offset_in_block(loff_t pos, u64 blocksize)
>>> {
>>> 	if (likely(is_power_of_2(blocksize)))
>>> 		return pos & (blocksize - 1);
>>> 	return do_div(pos, blocksize);
>>> }
>>
>> ok, fine
>>
>>>
>>> 		pad = offset_in_block(pos, io_block_size);
>>> 		if (pad)
>>> 			...
>>>
>>> Also, what happens if pos-pad points to a byte before the mapping?
>>
>> It's the job of the FS to map in something aligned to io_block_size. Having
>> said that, I don't think we are doing that for XFS (which sets io_block_size
>>> i_block_size(inode)), so I need to check that.
> 
> <nod>  You can only play with the mapping that the fs gave you.
> If xfs doesn't give you a big enough mapping, then that's a programming
> bug to WARN_ON_ONCE about and return EIO.


I think that this is pretty easy to solve by just ensuring that for an 
atomic write inode, the call xfs_direct_write_iomap_being() -> 
xfs_bmapi_read(bno, len) is such that bno and len are extent size aligned.

>>
>> Naming is hard. Essentally we are trying to reuse the sub-fs block zeroing
>> code for sub-extent granule writes. More below.
> 
> Yeah.  For sub-fsblock zeroing we issue (chained) bios to write zeroes
> to the sectors surrounding the part we're actually writing, then we're
> issuing the write itself, and finally the ioend converts the mapping to
> unwritten.
> 
> For untorn writes we're doing the same thing, but now on the level of
> multiple fsblocks.  I guess this is all going to support a
> 
> 
> <nod> "IO granularity" ?  For untorn writes I guess you want mappings
> that are aligned to a supported untorn write granularity; for bs > ps
> filesystems I guess the IO granularity is

For LBS, it's still going to be inode block size.


>>>
>>> <still confused about why we need to do this, maybe i'll figure it out
>>> as I go along>
>>
>> This zeroing is just really required for atomic writes. The purpose is to
>> zero the extent granule for any write within a newly allocated granule.
>>
>> Consider we have uuWu, above. If the user then attempts to write the full
>> 16K as an atomic write, the iomap iter code would generate writes for sizes
>> 8k, 4k, and 4k, i.e. not a single 16K write. This is not acceptable. So the
>> idea is to zero the full extent granule when allocated, so we have ZZWZ
>> after the 4k write at offset 8192, above. As such, if we then attempt this
>> 16K atomic write, we get a single 16K BIO, i.e. there is no unwritten extent
>> conversion.
> 
> Wait, are we issuing zeroing writes for 0-8191 and 12288-16383, then
> issuing a single atomic write for 0-16383? 

When we have uuuu and attempt the first 4k write @ offset 4k, we also 
issue zeroes for 0-8191 and 12288-16383.

But this is done synchronously.  We are leveraging the existing code to 
issue the write with the exclusive IOLOCK in 
xfs_file_dio_write_unaligned(), so no one else can access that data 
while we do that initial write+zeroing to the extent.

> That won't work, because all
> the bios attached to an iomap_dio are submitted and execute
> asynchronously.  I think you need ->iomap_begin to do XFS_BMAPI_ZERO
> allocations if the writes aren't aligned to the minimum untorn write
> granularity.
> 
>> I am not sure if we should be doing this only for atomic writes inodes, or
>> also forcealign only or RT.
> 
> I think it only applies to untorn writes because the default behavior
> everywhere is is that writes can tear.
> 

ok, fine.

Thanks,
John



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
