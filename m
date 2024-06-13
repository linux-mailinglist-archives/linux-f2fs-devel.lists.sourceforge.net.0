Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2225906A0D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2024 12:32:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHhkj-0006Xz-Iw;
	Thu, 13 Jun 2024 10:32:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sHhkd-0006Xn-Mu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jun 2024 10:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2g9oa2B60IwdNJK8WfuLBcUdYuBfePSmZFjS9FvUd0=; b=CgnBtwLJ4HrK19YLnIO19x96lq
 xE3IKr6E4COVwi/v1dxl+sxND+5/LGXI41FACjtBm688MphPK6Z/POIcmo4NpoHKjAqz31F4ytA/v
 Rqr9FUYnK4xvvNSw540gTCJq9javzwOCsprY79NaFM/rpftdwebtT8/KlLJzwg40HhHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e2g9oa2B60IwdNJK8WfuLBcUdYuBfePSmZFjS9FvUd0=; b=GTqM3nTnc0dY/D7xtvwkuOl7Ij
 jhGw7Ndj8badfD26f+534dGrpdyX3eXz7TS1LhSehFIdoYRZ32x//vWe94GHClTqsnuFssG59aFbg
 kKT7MZmGC+UOPjUh6F6lHrfnSDS4UqFmFz5RmgKPL/zqW5hK+0M0UbWUp/SpddfQUJn8=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHhkc-0001pH-QO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jun 2024 10:32:15 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D7tSlH017559;
 Thu, 13 Jun 2024 10:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 message-id:date:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 corp-2023-11-20; bh=e2g9oa2B60IwdNJK8WfuLBcUdYuBfePSmZFjS9FvUd0=; b=
 BG4Dd3CNuikc5gTizu/hHNMTBiUb9RSFBatnX3DdlvtQshvL1t69ff1BZwjlgOEx
 2+/k83nQd4Qtzy0i5rspYys7c0w09PcbJm5KiEwn5G2Z3Qu4eg8O21caT411XKyE
 zje5/Ee32z/wlznQ2YjyML+buIvqRLdKaHjOd19gPOiddh2NuSUTXfNBOIIQ5ysS
 KDLQa1Fa8YY7AJMaqi5e3McsIw1Wz83JchUYcAdHKrtMNh/iE6wQYHfVTgrTptnG
 ZV63Iez8NKhj4OZcqxO/xxRTmG7QviQfmrIGUnE9sXufpRDCnGvcUqmXiVOJobu7
 VyIBgP236XSxQ9DS4bijDg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhaj98eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 10:31:46 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45D9cWkx027073; Thu, 13 Jun 2024 10:31:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncdw1dr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 10:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyn5IQMN0ql9am+RKVL8TM2IQBo3Ynbv5VUA3IkhOYg9MH+KSEBV4dk/hffhhZ9XRBzW5Xsik4SvgtSx+xoJiJ84WmmAHh4CNYKruZPmqWss1upaY4QbHSJW4dfrSQBzmnxjyuRG//quDe55F+cgohfbi60lOOs6iPvrLNJ0nyHipUMg98sMUVeCfUP0NZfxPsObj3XeodbE2icv2IzPP+it0UO+/RHK48Hr3A0DCTx6OTolVf75DqumoWy9mvcb2ADSzmRhXwkvbpcdO6kXI6IQfE8I6zKM1dByFu1wJPQJ8aZEF8+QeRnwg2IEHkA9VxozLKV1+7h/EpLRJbbJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2g9oa2B60IwdNJK8WfuLBcUdYuBfePSmZFjS9FvUd0=;
 b=eUiBOTQZ7E6p/N8M3icKNax1+dnU2DmHwNl1bqCm2QPefYgCYF2HQ6LP01eh/S43kBBYXHBADGNp4Kb/GBZrJ7sCRAwcIU55Bf0VT6f8QuNjScEsN9ykf9qhvSxeFgzT4B0gV6H50dqVpam4N+8rd5smRDA8UaetapFf3b9FizxLycDRRC82oUmHKlJPf11dk0xg65oG4VJFN3b4plqwHKkEg0/2laVM4o/rkFxhi7TF6lQIko/50NZKdutFPbbhp4EXQPFv1tcZMRETT6HMIAvilp48UDZm+6bedlj8KS4oNxFDB2bxu93uAPQ2m0GLgVf1FzSIg2KnEkOJyrsw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2g9oa2B60IwdNJK8WfuLBcUdYuBfePSmZFjS9FvUd0=;
 b=ul9Y68fSTDjevuz0iDOoHyUauXpc28aLeDBdd5WCOsfe7pW90WJi0caRETN/tRB76SK7Z4i6O2gTWyrae8O+QXUZuHPwp6s+r8p9c1L2WDAtmZkiQIxL7nL0qgKe+0ADvKG+3Jv/UC46kzmp889Ay3odibzsM1TcRO/pEFlTuI0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH7PR10MB6457.namprd10.prod.outlook.com (2603:10b6:510:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 10:31:42 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 10:31:41 +0000
Message-ID: <59255aa1-a769-437b-8fbb-71f53fd7920f@oracle.com>
Date: Thu, 13 Jun 2024 11:31:35 +0100
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
 <20240607143919.2622319-3-john.g.garry@oracle.com>
 <20240612213235.GK2764752@frogsfrogsfrogs>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <20240612213235.GK2764752@frogsfrogsfrogs>
X-ClientProxiedBy: LO4P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::11) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH7PR10MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6cb7f6-7014-459f-1491-08dc8b9403e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|7416008|366010|1800799018|376008;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHltYjQzS2RaaGtQS2ZmdFZmSmVEV005TVJXODBmNkE2aTFhM3NoU2ZPMFZj?=
 =?utf-8?B?bTdwMWJra0htdDArMlJ3MEFSMTNEVXFCZHMwK1d4S2tSVHp5U05OZ01IeHRl?=
 =?utf-8?B?L1JHblliMTN4QldnUm5sYWNxdXB1bFp6TlNYYlRoejdQRnFwTUYyalMxcmpl?=
 =?utf-8?B?cmFneDRXNm5ISyswTWwzMEd5ZGtTckVqRmIwOHE4MUlQRmJKdEV3RmtOUVgv?=
 =?utf-8?B?WnpIUUtINEJMZ0lVSDlZSVhVWm5MbTNDZlpOREh0TGNHb3hicGx0WGowWG4v?=
 =?utf-8?B?NmZydGIvQkhXSGRtZUtVUmlnTlBUWVgxdGNLcUVnejhXZ1N1K3hZazZudWdZ?=
 =?utf-8?B?UWtob3NTOTBwWjg1Q0lFRG1sUWZwemRVbjNRT013cUNuY0JIMzhGUFRFeVNo?=
 =?utf-8?B?Q3FSQ1l6NUhqNzhZVXFKbmN4Vm5oODBDL3RNNXljeStwZXFETVFVeVdaQUxn?=
 =?utf-8?B?RE0xcU90Unc5ei9kMWNISE94N2JKT2gzL1pOUkw3RlBxOTRZSW5Qa0tNR0xY?=
 =?utf-8?B?Z29CSVQvbjNmSk5zbG9pTVZwZGlBYVJuY1VrYWxVRnh5SE5ieXFkVHNZMTBE?=
 =?utf-8?B?WFlKL2xxb1VtcVdITzNzcE4xUis4dWM2NzBYYWY3SS9zUWNGNGt0SzVqbkM1?=
 =?utf-8?B?RFIrRzA0cVI4OXBpYkNWRGV1SnZBY0c3VWE5QllCTjlWcngrd0c4T25KNmZK?=
 =?utf-8?B?QmZSZHRma05SWHlPeXc3SlJsMi92WmFDcmF3ai90WTVvTVJ6N0s1bnZseHoy?=
 =?utf-8?B?WEtIVFVrU0tpaCsxV0h0RTkvQXRZVzcyS21ST3kwam9McHdIdnM0emtiUUdH?=
 =?utf-8?B?V2M0amkxNXZlNlZucGc3a2ZuaWErQmVtRGxWa0xPSWlYTXJxMGp2YXpqZDc1?=
 =?utf-8?B?MkxKZ3NnZHhjdXJmcGR0ejJRMEZGYXh3RlAxRkduS2J1UFVndkhHNjR0YWVo?=
 =?utf-8?B?dHd6Mk4waFhXRVhIL0NvRm1RcDBpQ3laQzBQVVJOaGRnM2dRaUpGOTlUcXNO?=
 =?utf-8?B?Q2xjQzY2eTEzNHBIb1B4WFFlcmtxblVpR1lPdWNtSG84bDg3UitJNWt0QkVW?=
 =?utf-8?B?ZWhUYkUyb204RzZoRkxxL2Rna3FycVF5OVdVM0dhLzg1cWNib3I0Wk54SGxx?=
 =?utf-8?B?TVBhQ0ljQ2J0dXJzMXR4QWErVUF1Vmc1d2ZHQUpxRWxuZlZGSzVDRzkxdUo4?=
 =?utf-8?B?ZVU5aS9USnd2dVhHS0lzNEU5ekU3N0dYZUJJQVhPVi9iczBhZzRlUU9kYzRR?=
 =?utf-8?B?UHFSMGFjYVFvZFlnVmtjSXRxT0x5dHVDK0JhTTNuTUdTU2NrRzJBMzdPTGUy?=
 =?utf-8?B?SFVSNjk3dGp1eUluN2hkUVU0U3RnK3lKLzBCbjhLTkFXM1ZQWjNZOEZqblVq?=
 =?utf-8?B?aEE2MjhpVGJQMi9rSTNDWmZSSzFOWnd0M0Y0VWJWeVY1TlowZmRybmtBa0xI?=
 =?utf-8?B?bC83VWNrQWJWMUZRM3ZPakdlaU44eitjREFzKzRsZTEwaUc2c1ZjNVArRWV4?=
 =?utf-8?B?V2k0VzZyNi9Xcjh1U0Y4OWFlWVA3cGFhYXl5OFQvVjN5L3ZaQ3VWTFMwdmd5?=
 =?utf-8?B?a0xjU3BONWtZNUQwcTB6ZGdCcnNRMjU5MEJWdmdOQ3JZemtnNHhPRmtCbGIv?=
 =?utf-8?B?QXh3OUVXOWxURXdaUG9nUG1Mc2pmSktyN0hiQ0NsdHJORXR2a3QyR25nUzkx?=
 =?utf-8?B?Ri9QamNrKzEvWXIzMkJIalFYNnhDekdUNzBnVDcwOVFyczdZVWlicHlNVlUz?=
 =?utf-8?Q?tZIEIV0G4+lnxdkWLQhp0rbXsbKDASTsUMkATKh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(7416008)(366010)(1800799018)(376008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUh6L0pNSVo0b0hZQngrYlFoR29kWGd1UDVJUVA1UzhvbVRTWUQ1WlpMbmVZ?=
 =?utf-8?B?UXNpWkFabWM5c1RVTDZyZ2pPZ3o3VVI5Z3pOWkFqV0R1RzQrK0NVU2lQVktE?=
 =?utf-8?B?M3lIeTNoMGJ1bDJuREJYeXNWUC9hNytjRkF6MHBIQ2tRWnl0SnZDNkZ2VWIr?=
 =?utf-8?B?enA3ZDV4dFhTU3VJNGhTditrRkM3c01QL3IwSDJ5K0hkS1JiUnZjWDlwREdz?=
 =?utf-8?B?allqWkt4WXV4MDQzMGZxdGJaczVkanVMRHBuanRkNUhBTzkzclFGRCt1UjZN?=
 =?utf-8?B?TlZ0b1duTnQyWDh4dGNkYWVpVmQ5Zjh5cXMxUWEwdXlmUXpvcGUyR3ZWMHEw?=
 =?utf-8?B?aGUrRlBsVEhpWDhZUldxbVRmN3dQVUJrM0FXV0dkRUM2b0NXTk15dmwzVFM5?=
 =?utf-8?B?MHBVbGVWN0Z1T3ZOcVlVajBIODd6b2dGOWtBdDJhc1FMY2lNWUtGTFZzSG8y?=
 =?utf-8?B?M3lqdHhOVkFIT2xzeTlUMWUxWUI3eVRkenJ6eTVtVnR1b3JaTzIwbnZOZkgv?=
 =?utf-8?B?M1Rmc3dVTU5jNW8rdXZVMVVJQzJFWW5STVVKSnN6ci9mVjNQbS9OaGN5QlJr?=
 =?utf-8?B?SElTQ2xnNys3bG1yYzNKUVBKNkIwOWZabVc5OU9md3FWV3FjbWM3K1ZmOG1n?=
 =?utf-8?B?TGd1VGt1N2twdm9vZUpYOHIxQnZaYlZ2R2psWmJTVFlRdVFHSnJqTGMvVndC?=
 =?utf-8?B?Vm9WYTZPeThCbytjWEtjWm1wSGJZYUxUMitFOERRSjcva0puM3JkbUVNeUk2?=
 =?utf-8?B?RjBwZWxPdm44NzZEK2x5aFE1UUxPZkhET0o3aGxqV2ZOS29lQmFuYlprWGN2?=
 =?utf-8?B?UEplQmxlYnIzUng2YXpKVlRkUW9sRlNoRDFDNndEWHU0a2hFajVEczEweTFl?=
 =?utf-8?B?VjUrSGFiS3JWMTFtWUtQMGtoVHlnVnE2MU9yYk9sNk9MT1ZwMVFrT2xaWUM3?=
 =?utf-8?B?MU1UL05odUxjTHF4bnJlK2JpTmYxNzJRZURsNjh1bmp1c0tuUVdRdWdoaVoy?=
 =?utf-8?B?Zmh2MEZxMEhIYXZ2NWs1U2huUXZHMlRDVVFPWExNKzRuL1ZhRmMwYlIvN3Ar?=
 =?utf-8?B?dFppN1FaaGJhdWVaY3BmVXdkVFFqMHJVQ1RLYzVIK0NGbUluZS9IZDNLM25W?=
 =?utf-8?B?VlV3NWRsWDBaV2JEYTVkTGdWcjY5Wk44dzhQTVFYZ09rS3VrOXV0UjdBRUtI?=
 =?utf-8?B?QmV1b0JUenBpeGxvMjJHZ1Zoa1pzVk4xeWVCeDFFQTIrZkh0cktyNGwvbzlO?=
 =?utf-8?B?RzFtcTVqdVRIMHJMRkE2SE1pNGprbEZmQ2dYMEpQRGI2ZmNDZXJEWHlKN01N?=
 =?utf-8?B?UGxWYUFpYWxkUXJjQWRqL0IxMDB4S3YvZnZ5cFJxb2pDc0tpU2tUTDkvS0NK?=
 =?utf-8?B?c3Vxc1l5RTZnZkxUMDg1czl5MmYyRktYWHBTMU9xcExWNFN3NDM2ZndOT3RT?=
 =?utf-8?B?dlgzTzZEMHdMRjFjeE90SDltNUJhZzhQb1JMd3pGMWVmem4vdEN6UXl0SU1Y?=
 =?utf-8?B?bk00cllYdXFBZTJPVG9icWpzaWtXYThpUmJwQ1UxczVncVVOR3BWbXo5WHdx?=
 =?utf-8?B?VjE2VTNDUWhrd3I2bW10aWNXVld6MWdGTThiSVVqbTNTdmtPUlRoak9NNzA0?=
 =?utf-8?B?OWVYTnNJOWtLWXg5S3c3V2Q0TTUwdE96WG9reTBacmc0SnA2LzVocVg4RUpK?=
 =?utf-8?B?cVZCSHUxVEQ4SDRYWGoxemFnZzg1aTZ1UXgvVzNQSlVvSUZlT29keHV6QzJx?=
 =?utf-8?B?OWN0R0V6YVpSSVRJU3BZbWpNMmtzT0ZJWXQ1b2VnZkxtLzcyMUg4ZW42Q1FU?=
 =?utf-8?B?SU5zVEhwZjNBbkt0VFJSWVByaGpXN2JwU09JcU4rcTB6Zm9NTlc3UFZuYXF6?=
 =?utf-8?B?TmFCakpVSjgyVVh0RC9XaG51NnM3Ulk2VzZxdmUxQ0RaaUJKWjZCRWRNMzFz?=
 =?utf-8?B?K2F1dVVWa25lT3JoNWx3SklsZHIrS0xCb0VYd1JXNmkzNXJwSk5jb05LMmh0?=
 =?utf-8?B?TnBQVlFGU2srSlZ6bnhjbHdscWEwc1plbi82ZEtHZ1NEbS9VdVV1eTNWNm56?=
 =?utf-8?B?b3dGaS9QSEN1RGkxQ2lwKzBCR1lJV0JsemVIVy9BaXoyT3pkNnBSakpJYXIr?=
 =?utf-8?B?UUlvUzBIWHBQdlh1RTIvMEl4dHdIeS9aYW9hclpDVzZLcVA0dHpqN1NGUGdO?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jU4HRuctEbqUTC+TcAenVs2K4m38PED9sqbARQ8Z305tiL2F1DvI+bkZEuNWlICFhHSjDHxKUSPmeRshcLgpDOPmoFMvqEMTeIMABXxDbccj/WGmYfPGzbrR8VOXMGFZUCDqzHK8TVgHQmM4u6OYie57p2oLtukOEaKMyRbpIOJ6N63KXJt9AWu/az02FLOQshEx7AzSHnQCncmjPS3nnMtdPpFdFFrCeiQi24q9XVbCc79UeO2G+Z1TNr1MrkMlzKskuW4G3C0EJnh+oZ5O4jXEDrhkj92EKUM/Cmb1QX+LBerbbUc0fz8xyyexjxgp2/X+LkEJnO5shQS47IXapEJ0bysAoy3ymxXC8sLksoUnNk/xjl82ZF1/p3bCc//GzQHFf5klilICdcd2cjmPucM/bo78pKPkpu8WqAsDNHz9CW7J+nEP8DHgmDKOK6L8+fKp2yhrkloDbaEythT2korOcOZUn4z4BYHiuZ7OaOWVM5gqquQAcV65fpqHGakWdCb4r+e6SRkVz/kDz1tXLRXhH72MqV0Onv6VMEDZAFiKSqecC2KM6sNlIfigSNA1C3rMdmUEeBV4hYWmI0BbVujSzFsCFas2/+tX9zr4EBI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6cb7f6-7014-459f-1491-08dc8b9403e4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 10:31:41.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEfW4n+vYNEVvxx72wyckd+mJEE77qfxi9nAF8jGbidsqZHxjvGe+2enGyLWPOAm4AohStajcf5QjaV34rpOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6457
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_02,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406130075
X-Proofpoint-GUID: jbd1m1jFLZ2n70RJpKyphd4Hm1NMlsJj
X-Proofpoint-ORIG-GUID: jbd1m1jFLZ2n70RJpKyphd4Hm1NMlsJj
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/06/2024 22:32, Darrick J. Wong wrote: >> unsigned int
 fs_block_size = i_blocksize(inode), pad;
 >> + u64 io_block_size = iomap->io_block_size; 
 > I wonder, should iomap be nice and not require fil [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.165.32 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sHhkc-0001pH-QO
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

On 12/06/2024 22:32, Darrick J. Wong wrote:
>> unsigned int fs_block_size = i_blocksize(inode), pad;
>> +	u64 io_block_size = iomap->io_block_size;
> I wonder, should iomap be nice and not require filesystems to set
> io_block_size themselves unless they really need it? 

That's what I had in v3, like:

if (iomap->io_block_size)
	io_block_size = iomap->io_block_size;
else
	io_block_size = i_block_size(inode)

but it was suggested to change that (to like what I have here).

> Anyone working on
> an iomap port while this patchset is in progress may or may not remember
> to add this bit if they get their port merged after atomicwrites is
> merged; and you might not remember to prevent the bitrot if the reverse
> order happens.

Sure, I get your point.

However, OTOH, if we check xfs_bmbt_to_iomap(), it does set all or close 
to all members of struct iomap, so we are just continuing that trend, 
i.e. it is the job of the FS callback to set all these members.

> 
> 	u64 io_block_size = iomap->io_block_size ?: i_blocksize(inode);
> 
>>   	loff_t length = iomap_length(iter);
>>   	loff_t pos = iter->pos;
>>   	blk_opf_t bio_opf;
>> @@ -287,6 +287,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
>>   	int nr_pages, ret = 0;
>>   	size_t copied = 0;
>>   	size_t orig_count;
>> +	unsigned int pad;
>>   
>>   	if ((pos | length) & (bdev_logical_block_size(iomap->bdev) - 1) ||
>>   	    !bdev_iter_is_aligned(iomap->bdev, dio->submit.iter))
>> @@ -355,7 +356,14 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
>>   
>>   	if (need_zeroout) {
>>   		/* zero out from the start of the block to the write offset */
>> -		pad = pos & (fs_block_size - 1);
>> +		if (is_power_of_2(io_block_size)) {
>> +			pad = pos & (io_block_size - 1);
>> +		} else {
>> +			loff_t _pos = pos;
>> +
>> +			pad = do_div(_pos, io_block_size);
>> +		}
> Please don't opencode this twice.
> 
> static unsigned int offset_in_block(loff_t pos, u64 blocksize)
> {
> 	if (likely(is_power_of_2(blocksize)))
> 		return pos & (blocksize - 1);
> 	return do_div(pos, blocksize);
> }

ok, fine

> 
> 		pad = offset_in_block(pos, io_block_size);
> 		if (pad)
> 			...
> 
> Also, what happens if pos-pad points to a byte before the mapping?

It's the job of the FS to map in something aligned to io_block_size. 
Having said that, I don't think we are doing that for XFS (which sets 
io_block_size > i_block_size(inode)), so I need to check that.

> 
>> +
>>   		if (pad)
>>   			iomap_dio_zero(iter, dio, pos - pad, pad);
>>   	}
>> @@ -429,9 +437,16 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
>>   	if (need_zeroout ||
>>   	    ((dio->flags & IOMAP_DIO_WRITE) && pos >= i_size_read(inode))) {
>>   		/* zero out from the end of the write to the end of the block */
>> -		pad = pos & (fs_block_size - 1);
>> +		if (is_power_of_2(io_block_size)) {
>> +			pad = pos & (io_block_size - 1);
>> +		} else {
>> +			loff_t _pos = pos;
>> +
>> +			pad = do_div(_pos, io_block_size);
>> +		}
>> +
>>   		if (pad)
>> -			iomap_dio_zero(iter, dio, pos, fs_block_size - pad);
>> +			iomap_dio_zero(iter, dio, pos, io_block_size - pad);
> What if pos + io_block_size - pad points to a byte after the end of the
> mapping?

as above, we expect this to be mapped in (so ok to zero)

> 
>>   	}
>>   out:
>>   	/* Undo iter limitation to current extent */
>> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
>> index 378342673925..ecb4cae88248 100644
>> --- a/fs/xfs/xfs_iomap.c
>> +++ b/fs/xfs/xfs_iomap.c
>> @@ -127,6 +127,7 @@ xfs_bmbt_to_iomap(
>>   	}
>>   	iomap->offset = XFS_FSB_TO_B(mp, imap->br_startoff);
>>   	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
>> +	iomap->io_block_size = i_blocksize(VFS_I(ip));
>>   	if (mapping_flags & IOMAP_DAX)
>>   		iomap->dax_dev = target->bt_daxdev;
>>   	else
>> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
>> index 3b103715acc9..bf2cc4bee309 100644
>> --- a/fs/zonefs/file.c
>> +++ b/fs/zonefs/file.c
>> @@ -50,6 +50,7 @@ static int zonefs_read_iomap_begin(struct inode *inode, loff_t offset,
>>   		iomap->addr = (z->z_sector << SECTOR_SHIFT) + iomap->offset;
>>   		iomap->length = isize - iomap->offset;
>>   	}
>> +	iomap->io_block_size = i_blocksize(inode);
>>   	mutex_unlock(&zi->i_truncate_mutex);
>>   
>>   	trace_zonefs_iomap_begin(inode, iomap);
>> @@ -99,6 +100,7 @@ static int zonefs_write_iomap_begin(struct inode *inode, loff_t offset,
>>   		iomap->type = IOMAP_MAPPED;
>>   		iomap->length = isize - iomap->offset;
>>   	}
>> +	iomap->io_block_size = i_blocksize(inode);
>>   	mutex_unlock(&zi->i_truncate_mutex);
>>   
>>   	trace_zonefs_iomap_begin(inode, iomap);
>> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
>> index 6fc1c858013d..d63a35b77907 100644
>> --- a/include/linux/iomap.h
>> +++ b/include/linux/iomap.h
>> @@ -103,6 +103,8 @@ struct iomap {
>>   	void			*private; /* filesystem private */
>>   	const struct iomap_folio_ops *folio_ops;
>>   	u64			validity_cookie; /* used with .iomap_valid() */
>> +	/* io block zeroing size, not necessarily a power-of-2  */
> size in bytes?
> 
> I'm not sure what "io block zeroing" means. 

Naming is hard. Essentally we are trying to reuse the sub-fs block 
zeroing code for sub-extent granule writes. More below.

> What are you trying to
> accomplish here?  Let's say the fsblock size is 4k and the allocation
> unit (aka the atomic write size) is 16k. 

ok, so I say here that the extent granule is 16k

> Userspace wants a direct write
> to file offset 8192-12287, and that space is unwritten:
> 
> uuuu
>    ^
> 
> Currently we'd just write the 4k and run the io completion handler, so
> the final state is:
> 
> uuWu
> 
> Instead, if the fs sets io_block_size to 16384, does this direct write
> now amplify into a full 16k write?  

Yes, but only when the extent is newly allocated and we require zeroing.

> With the end result being:
> ZZWZ

Yes

> 
> only.... I don't see the unwritten areas being converted to written?

See xfs_iomap_write_unwritten() change in the next patch

> I guess for an atomic write you'd require the user to write 0-16383?

Not exactly

> 
> <still confused about why we need to do this, maybe i'll figure it out
> as I go along>

This zeroing is just really required for atomic writes. The purpose is 
to zero the extent granule for any write within a newly allocated granule.

Consider we have uuWu, above. If the user then attempts to write the 
full 16K as an atomic write, the iomap iter code would generate writes 
for sizes 8k, 4k, and 4k, i.e. not a single 16K write. This is not 
acceptable. So the idea is to zero the full extent granule when 
allocated, so we have ZZWZ after the 4k write at offset 8192, above. As 
such, if we then attempt this 16K atomic write, we get a single 16K BIO, 
i.e. there is no unwritten extent conversion.

I am not sure if we should be doing this only for atomic writes inodes, 
or also forcealign only or RT.

Thanks,
John




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
