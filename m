Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B20AD19993
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 15:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+2UFFAbQml8Fmwr3kxoCURHUAoN91mgleGE7Bf2Jdo=; b=OaSDV+wan1JyiuHsXeTp7WPzvs
	X0Vgnd0tEBKJNgz2rkczznaN50TIOLnr9B55LGE9yIkXC3+/Z4KG40oHEuMqRU+LUxnHaUJSy4qfa
	qU0ykNjs7SXxvYknR/Qfh+8hCwq/h9j+P541Se/xBWgYYIQby1NN+WyL6MkPmO993LgQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vffhS-000607-Lr;
	Tue, 13 Jan 2026 14:48:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chuck.lever@oracle.com>) id 1vffhR-0005zy-Hz;
 Tue, 13 Jan 2026 14:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mP/g8UY32ndvOM3LKDx1ed8Dxn892wEzbwhdmJE7hTk=; b=eJ/1kce+sQoRbDl8AOXIkVcNVl
 bdVSiYe6ltV1pl0ZL3ceyyZNAINN0qfdREx9hMc6wDx0rEQh3SkbsZ4WLwoG6WO7geA14ys6G8na6
 aMB+eBHEsPl5YBw3vVBiwZ5rcvEkZGIC03AocfVCKi9HbansgTKi0RJVRCIk3sMPXbSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mP/g8UY32ndvOM3LKDx1ed8Dxn892wEzbwhdmJE7hTk=; b=WG4zukhWfp3NI7Wh/rBb4PAx8T
 VkL++zuQ7/wpc9kQb80g0WoxHhPNad/HybXPj4pqCK89amgwxfXaJjQB8McC8x8heVROFbxGuGGR/
 0tkcNB3H4tfKveWWoZ9VKjX8fJlZtHMrApdzhuR1ADHlHWC0aP0wgVd7hNNYL9EPq3vg=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vffhQ-0007ja-N5; Tue, 13 Jan 2026 14:48:49 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D1gZwC2395850; Tue, 13 Jan 2026 14:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=mP/g8UY32ndvOM3LKDx1ed8Dxn892wEzbwhdmJE7hTk=; b=
 OLlMk1ykanSrmUsKXyQJSp59G8drU7fTrANqMRkfkfDQhfIkSmo7xLmNiaeRX9ZQ
 PffYEXuKKjd4p8O4LgUEGYPvfUOXEP88/M8N6OaosL0faYlyex6PeOzHOYcelTbs
 g9nARv5pgj0bRNEWpl++TnJpmBd0bAnXtH2D1K01XdML4Fq+Kmo15sdXjyQa7a3Q
 L/Mp1EVuHc8hvxa/B36YJzruI5RV8ur0CCB6jmd5k3bJiz4WXBjU8EQwDrMheClE
 5X2InQi9aeIlgisFYA9AekT9GJsty6LvGfwA8DFREGfSH8+aXdFm1+JeMilxOVS7
 BSGAFzPWU17uxLflHV47RQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq53f06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jan 2026 14:03:46 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 60DDbCqo032777; Tue, 13 Jan 2026 14:03:46 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4bkd78s9mb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jan 2026 14:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waTBL9YNQ3eyQ1nK6upU4TFGAXXHkpC9jwzimvKa6AALpouovAQ8Wi2/47JQ5Z3oc/cVEZJN77q6wdBvLY5XFN4j8RWKua59PnZhxccHyeRNXU8bfXCkKA3BV+Ovw603BP5zXo2NlCHt5viz4BmNVqD8kUCJq3NFiBHhB583fz5i0ZSae7zzYpidlwkJvWWbb4nPXFro0AOrOHRvYrrr/6aZWq2FQdGoIZo8V+11H7R2gd+/WiaiHpXoTSeILN54FMxbrg9xfGkIrnANhS8lIFMJickQbpZqImD2vc4W43z3tyyX6l0Zmqi88VnvDd3RlF7UgwBXmWo9kcxEOGMX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP/g8UY32ndvOM3LKDx1ed8Dxn892wEzbwhdmJE7hTk=;
 b=Hl4QjcFzGPURq4sEALrKTX8hDKNCA3lxQUfU4LTBE/cJrV1If/dM+UQiCci+EOsM/uKpqUXaGy2INtxca4kAo0oWa4XVAAmCyDG/Wv5AaRQ2Ibmvv6hKHv0pe7l23PfFrrPkJ7hk/jrVMdwLZBIpefVhgpA4iijQfo/8aziCs3pRbfWwRE5c8o7YBSvFzghtikIRJ5wusTfGlGVCEKS7P8yuc23OczN/Bomqxx4DqBXvzAd6k5zy5sgJLXXyvt5Cm/I+aqNAOi5Ws6KErlQH05MfYE7JBOcuThqgXV6ubev4/dAa8PbCJruDz3Vv4+apypER6M5w2l0oomP4RSnS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP/g8UY32ndvOM3LKDx1ed8Dxn892wEzbwhdmJE7hTk=;
 b=BFCHmSPrNHFT/TaKzFSDYxSRsAPzOvCCBQeZz915ecABFjMZfc4QPF9nKpwxYMFTZ+rCiVhWysGCIxbV90QNcZYB3Yro9OYEK7UyAVp+ZfT3S1AGS0HkIUn5cJzNuHmjxvgppljl21iO2iZoyuFx836xGTQ2pxTAHofb9HZLvBc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY5PR10MB6120.namprd10.prod.outlook.com (2603:10b6:930:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:03:40 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:03:39 +0000
Message-ID: <5809690c-bc87-4e66-9604-3f3ee58e2902@oracle.com>
Date: Tue, 13 Jan 2026 09:03:27 -0500
User-Agent: Mozilla Thunderbird
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Amir Goldstein <amir73il@gmail.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <4a38de737a64e9b32092ea1f8a25a61b33705034.camel@kernel.org>
Content-Language: en-US
In-Reply-To: <4a38de737a64e9b32092ea1f8a25a61b33705034.camel@kernel.org>
X-ClientProxiedBy: CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::6) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CY5PR10MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec1a10f-0ee9-4e4d-92fe-08de52ac8d81
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|3122999018|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUpMV2doUnZNU1BJdVpLTm5aRVAvUUVEUCszdTVXNEYzYTRMYy9ISHF3L1Ix?=
 =?utf-8?B?bDloaU4yai9aR0txMlVVOUxpSlRIOXd1TWt1Y1dPUFJTS295Tm1WR1UzbGFM?=
 =?utf-8?B?c3RzSTY5bTE1dmNzMXRrenQvYytFVllkOWhKalM3TS9HZ0tCNUNtVDdyTFNh?=
 =?utf-8?B?b0Fjb3d2R2VPbEVmUWdoMSsveTYvcDMzelFqbDlYSnFIM1NRTHQwOEdaeUdu?=
 =?utf-8?B?MlhDRUlMRUtBM0tXa2lxcHZ1OGYvMXdMTHpNZGhCdk1QOWMzaitkSDUvcnE2?=
 =?utf-8?B?Qkp6eVlZemd0aVhtTmZ5czFNN1Yyb2xKL2R4TjlvSVhVblhRa3hXaXB2b0h5?=
 =?utf-8?B?Z3NpZXBrWjFVNy9tRXZVbVVscHVKdjBDaWxJVW1MSkErcS9TVXd6ZHh1aXVT?=
 =?utf-8?B?dEg0Ni9IL1MrcG1MVStGbExwTW1EYksrcW1vQUtFQWd4RmFtaTliK3RscFpw?=
 =?utf-8?B?dGNJcHJrSnlGUDhGRmU3cTVEZWF4S3NFVFpaSmkyVlFWSHRPa3V2OEF4VmtR?=
 =?utf-8?B?SDZKVlg1bk5aZ3BOemYzWGwzODVlb1NNVkptM1NYd085TVNqNWNnVGFKQ3hH?=
 =?utf-8?B?ejZhQmp0OE52TVFDblYxNVV3WVNOM1hVTnVMcjZzRHhGM2JhcThzY2NPNmpu?=
 =?utf-8?B?byt5VnRPWk1PNVZ0elh0Qzd3aitQYkRPNkg4YjBsT0ZYZER3ZjY0UGkwVW1R?=
 =?utf-8?B?NmdMSFFWVFpEdHlIOHNzTjhtcFlJL2ZDby91dlJ1dU1sWmZjV3BtT2JkMVhi?=
 =?utf-8?B?cnlidG5VRWpFWTlGN0dLSmduRkY1KzNYeUFSdUVCK0N3OXpYcGthL1BmaDdp?=
 =?utf-8?B?QkplcTcwdEhRQlAydkhIaFNidFBFR1UxNVE4dEREYkRGeFRDOHNBM0grWGIy?=
 =?utf-8?B?bjZPOVk3RDhveTRoMzlYRHBobURQVVVGdHhYT3J4K0pLUEtVeGxmY21jeVFR?=
 =?utf-8?B?Q0xpajRUbFZtaFdTZnVwME9OTU5QNVZFUkh3eHU1d3VwZlV6YjUzOHRGYVhh?=
 =?utf-8?B?blZCdUhXN3Q5U1lnVUxUWmpRZFhQaFZsSXJlVXhwTVJDOW9yaDUrSEUxY0Iv?=
 =?utf-8?B?Z256Um1lS2ZWdWZlWGRLcU0rNEFPaXVIMXh0QWlDczBjdjNObnFDcDFjZmFM?=
 =?utf-8?B?clM2b0thNTgzT2N1UmxhU3lDUXlzN2FkTHVUWVFRdkFBcUV1TjNlWGU1Wktr?=
 =?utf-8?B?RnJGS3hHOGMxVmpYaWJhWTF1QTNkeVVMMFdvZ2E5aUJSZVFxV3lXWHFlS0Nz?=
 =?utf-8?B?emVZZE41ZER6bVBZdUE4di91dmoyVmpxajQrU3ZPQkN2ZmcyRmh4UnVpUmlC?=
 =?utf-8?B?anliZnFzQ1RGREpzZjFGL1RJQ29sOGc4T0FXY3F4dlBaUi8rZTdQckprUTJ5?=
 =?utf-8?B?ZUIvK3lDZGh5dVNxYlpSejgwZXlqSEs3WVU5QTY0bjlkQjdvZ0o3Z25ZaDN2?=
 =?utf-8?B?SjdMSTl4ZHZ0WHdCN1Fja1dVZXU1SDVrTndrYUF4VFNHWUNXWnduL3c5ai9N?=
 =?utf-8?B?MTJzUkJ5cWZUSWkyUDRnUWZ2cVgvWWl3Rm0vaFVkMW1wVlZGbjREaW03WU9O?=
 =?utf-8?B?Qk1ibUhnMVRIQ3JROWZiRVhxekxIZG9FQktoOWFmRm5pUFZGUGVId21ZYWNO?=
 =?utf-8?B?TGpmNlowK002UksxRnNsb2xtb2F3UGZ1V3JWeUp5c0J0a01ITC9JRzRPbnIr?=
 =?utf-8?B?bkVsTzJteWhOM3ZOVC9HNEowajVXaGxTcGI1N0FoYWRWOTBVMEttR1hldHI0?=
 =?utf-8?B?NjFaMXJPTytsZFp0ME8xUlZaRmNvWG1Wa0p1WFVES3VoYmk5U0JPVXJXREha?=
 =?utf-8?B?MllId0Q2UkVCL3FENWk5UXFUNVlZdXQ2Y1piQmlJNDB3WXJsakZCZUtQOXdB?=
 =?utf-8?B?MmRLeWVvSHI2eVpGZzNYTm53enNhdzYyaHlhZ01LS0NKNndZKzlsRCtwbG91?=
 =?utf-8?Q?DzC7P+c324FkCWCbqJ0EqFBj3M/1Lt+H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(3122999018)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU5LWGVwYUgzckRwZG9yeHZxVEd3WFFvZmp6WDd1T0NxNEhzSGhjd25MckZP?=
 =?utf-8?B?M1FqMEQrVXNMaXQyQ05aK0lXY0xEbUtLN1dKeTdZMVdrYVI1M3VicWdudGI3?=
 =?utf-8?B?MG0vV2R0VEpSM0ZINDBRTHZOVGk2NHNLd01GQ3QrejJYcWd5S25kaDN4L3dx?=
 =?utf-8?B?UC8ra1hJV216aVdpTjl3T1Qya0xoRFRreXJwVDU4Nnc2dTR5a0M4SmRFSHRN?=
 =?utf-8?B?WHlhbnJJMU9mRGlyNHBKNzhhaGYxR1E3SFh0MlU5SlhZSmRLWFFhV3djMTNj?=
 =?utf-8?B?SHRPZWpOUWtzNUk1OUNXMGx5cElKazdRZzExZ2NLUWIybklxVk1Yd2Jibzh5?=
 =?utf-8?B?NCs5SkVESGNWWTVxUm9sNmQ1dVdBaGsxRkdIcERwdDRoTUJvMWhIalVwUWUx?=
 =?utf-8?B?ZjJVOXpKeWJidVlPbUxJNU8yMUFhN0d0a1ZFSWt2dk9WYXlyMWowN2k3aDQw?=
 =?utf-8?B?N3pKN3ZZOWV1SlhCYlFPanQ4bzdyb1NqL0RkRWNTSkdrTzFYOFAyaUN2WXdi?=
 =?utf-8?B?TWRGTGw3KzBGNlg1OHFoUVkwbXpJV2d1VlNDVmdQVjM4dFNoSmRTcnFRcEpB?=
 =?utf-8?B?VmU1bklKd0NxRklxWUd3ZHJ2TzhrSWxIdit6WTZUNWVxQjIrVG0vN2Rkbmxv?=
 =?utf-8?B?dEM3N3dtN0EvNU9IU3dUWHNoUnVwYmE2U2hieWZaVzJMV1ZGZ0FNekJhRDFl?=
 =?utf-8?B?UFV4TjVVUmFjMWthTEhZdUkxai9reGhxWmhWRDczSnFsc2pPbEhVVVVoMURG?=
 =?utf-8?B?dVBhb05wbmpaS2hndStVZkJlWHNhRStlV0JVOUUxN0xleE9ZQVNMOHlpVzly?=
 =?utf-8?B?Q1k2Y1ptL0pYaG11WXFpaDZiWWlLdGZPT2tQeHRIVEJwUHFndE9LT2gvWDVw?=
 =?utf-8?B?M1NmMUhMQlcrb1VVVDZmcVdScEJhMm5YUmZLRGh1elg4a21kcmlJeUx1SGhv?=
 =?utf-8?B?U1E2aDVBZTM5VUo1dndMNHUwOFVJOVF5b0k2empDT3d1YjkyZ09ScXpydk9j?=
 =?utf-8?B?ZEVrbndYbjBkNkx0SGc3Z013RGpqR3BUbThmL2h0UmNnZDZDMVlxVnBtRUFu?=
 =?utf-8?B?TGxNbHkvNTRqTnJvS3IzRm14aEdDNmNIMUxYeUdValh0eTJySUF6eWl2bmhH?=
 =?utf-8?B?Q3ZMQ1duUTBqZGhSUnpsejZ5bk53NkNaYnlZUi81VUtmV3VCTkFBSTJ6SVFW?=
 =?utf-8?B?Wll4WjBWWEdFWEJDMHFNSHRBNHAwY0MvNkwzdnlOa29OUG5pY3lyeDV0UCty?=
 =?utf-8?B?MUl4WDFqc0NqdE1Gd2FjSW13QUUwMXNvaTN3NmY0SnhiYkcwd3E1UythaWdU?=
 =?utf-8?B?dnQwWFFseEd6OWhsRHdMRmQ3T2Qyek1JT3hSUGxOMHo0QWZTK2tnVjJZYTk4?=
 =?utf-8?B?NUkrQU1iSkRuYWprRnNOR0REOWdrNm9RaGk3OWdzT0o3L1ZDejdIZ1BBbnFD?=
 =?utf-8?B?NEMwN1dsVnVKcWxyREt2LzlWU045Z0JvR3lZbUVpMXVtZkpjem5nSHVON2hZ?=
 =?utf-8?B?VmE4T2lORzZXaUg4OVN3Z0VFMEQ0MURGMU14bzFPSnNUTFNxeDE1amNBb0pW?=
 =?utf-8?B?Z1pwdWZNbjFGWVdQTHVPbXdUYUw3Qm9WVHhVNDg0Z1JFMmtmeXE5SThIYzhs?=
 =?utf-8?B?dUFtMGFGV0JtemlBUmFENjRvN3pFWjNhQWNOcGlSa3p1a2N4anVBRlpiUmJH?=
 =?utf-8?B?VnFscjk0OCtjZUx2elRlaXFNa3BHdUNQT0thczBkWGExTmJCdXFQaU1YMnJP?=
 =?utf-8?B?WTQrNzVJNGpESVBDQ1FkTHRxY1B6dW9JdG5oek5FSzYzQ3ptYVlCT2p5ejBi?=
 =?utf-8?B?dW1hcnM2V3p5OW9CMW9LeC9PbitXWEwyd24wdVkwR05ZeUZKcm8yeWJjQ0Nv?=
 =?utf-8?B?cFdQOUdpb0Y0bDlsTHBXMG1nbVI4ek1BQXZJKzl5RmUwazdCWUVpTS9CajZL?=
 =?utf-8?B?V3hLZFBIUkc1bTJadUNZVytUa0o5QVU3bnBWNzRrVnVnNDAxQ0t0anF6UEda?=
 =?utf-8?B?Mjg5ODBSRnFFR3V0TFYveGlLYzZEa1ZYVXFFeDdsK3Z5c1MvbHFqdlh2RmFH?=
 =?utf-8?B?bTZPc0JmLy83aGl2TG8rM2lIdnlySkl1ZXV2dzdFN2RTWXd6VFZlTGRMVEtW?=
 =?utf-8?B?NDdtenBKY3MwUHhqK292WTdVaTNia1VGais5NTQxay8wZENCWlJNQnkwUHNz?=
 =?utf-8?B?eG8zQjNXWEIyMVRpS01DMmdYTUJBTFljdXhRRHY4aFVYeXhkQjNuQUFqVnQ3?=
 =?utf-8?B?VnVNYWlac0RXdlFQdzFjWC81dXF1YzlucTFzYkNPSHI1V2IrRTJqZTNrOFNm?=
 =?utf-8?B?MjRvOWc4eTRTdVFiKzd2MU9PSjBZNkRJZGU0UVl1VTVUM1dnNHNidz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Gjuzn59QpT9i3tuLtakgzssJ5JFrkVRjDPf//fE/pVrRMB9QQ3mS6vE6GUe2iheyeZDXA055Xwqvy2j4Aa5NpbeBM+t4JtTQR65LeWgTHlSol3up+l5LYL2HE1TISoxDq07kEShFGJtTR5N1adRid6HZ3JCTAz9uf1UqnTOGgSa9WY/SK1KKEhkiCtThdCVTg+SGkhmV13QiW4W11ix7A4YMIsLsnw9uxXzGa8MYmARvOLtJnvnCx+4BknTFytbYlcCu8idIch1uq9y0+O4GvouqR8IAFmmQ0jYJtlOyHDnHW9Ffgj1AmwwGSW0yz3mQz4DaEt9rEMKFIiH/3pTIPGZVgX5BDgbmObuXHaBa4ySb9iQw/OL7stuf4qlK04hESFGkCsx2ek5GuYssEH2a81FWWPEyHNnmhBfk0xK5OlcCrO5SOBVzktnNQM/Si/bC7mkp5FN0FpXQtqGKOCI/np5PToTkYPD/Jww7GqU6uxgyEVxICap0xJyMCDkM5jz9xxBfjVHvLbZR/kfpIOG5OoWMjBjIz4TBASzf4uEAItdUW3GEiHXzuiP+vzhJpOYdTwFJiYWHDjl1L/9drC/2tjCXOKJVioOtdoyLND7YKO8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec1a10f-0ee9-4e4d-92fe-08de52ac8d81
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:03:39.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGk2SXNN0FjDKmDnetA74beY9FS4bgv486Upczd4bUxd2faLluaNpjzaaTsnfE0+2g+Wax5DOjfhNiPF7L+bpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130118
X-Proofpoint-ORIG-GUID: 2YNEE3Tr-BYkU9W3QqbyBTutfIfueKeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExOCBTYWx0ZWRfX3JSZYS9RlbVF
 idO5zgTdYUc7eGw2FuOzKzZL7T+NIHez4Y1TabBnRpp2YVb/fDbkNIGLFJ45GRip2J0k0vRT9m7
 s1CJzn/Ry0vIjQMoHEc6I9/vWHCMJgokJzMNaTOi4NRXvVR/h4LaRbXf7UwgWEArR7PaYx+GoO/
 +jkuYrruMZWUnXxnyHmXlKcR3xIlzs4QERX8FvGIitIY3F4OUPV2EA3JfX6+CpEocEPXmYVclTk
 Rs1TEsf27OQglg2T7gHMu5mqfGYEs1vmXjZe5u2xaDERL2j96y5h0cCI3dMLDGXo69P/dp3NTkl
 V2SwuR5oQfClJp/3V52e89tcjJV1cw+4JLE2zhFwHGBlRdUyF6U/daKbKOFFb/A91PY7FckOeXE
 tlK4w5Xpn+o21oRyrHkWYSzSpn/vCully62OLr8Oyp3x44P1Ba4lYZuzVsICjiUtivZpUGNm8rQ
 SwlHWOMmOT1LpJMtHKQ==
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696650c2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Y791ZhcX_UeUQF-99ecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2YNEE3Tr-BYkU9W3QqbyBTutfIfueKeK
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/13/26 6:45 AM, Jeff Layton wrote: > On Tue, 2026-01-13
 at 09:54 +0100, Christian Brauner wrote: >> On Mon, Jan 12, 2026 at 09:50:20AM
 -0500, Jeff Layton wrote: >>> On Mon, 2026-01-12 at 09:31 -05 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vffhQ-0007ja-N5
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <chuck.lever@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS8xMy8yNiA2OjQ1IEFNLCBKZWZmIExheXRvbiB3cm90ZToKPiBPbiBUdWUsIDIwMjYtMDEt
MTMgYXQgMDk6NTQgKzAxMDAsIENocmlzdGlhbiBCcmF1bmVyIHdyb3RlOgo+PiBPbiBNb24sIEph
biAxMiwgMjAyNiBhdCAwOTo1MDoyMEFNIC0wNTAwLCBKZWZmIExheXRvbiB3cm90ZToKPj4+IE9u
IE1vbiwgMjAyNi0wMS0xMiBhdCAwOTozMSAtMDUwMCwgQ2h1Y2sgTGV2ZXIgd3JvdGU6Cj4+Pj4g
T24gMS8xMi8yNiA4OjM0IEFNLCBKZWZmIExheXRvbiB3cm90ZToKPj4+Pj4gT24gRnJpLCAyMDI2
LTAxLTA5IGF0IDE5OjUyICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPj4+Pj4+IE9uIFRo
dSwgSmFuIDgsIDIwMjYgYXQgNzo1N+KAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjQwICsw
MTAwLCBKYW4gS2FyYSB3cm90ZToKPj4+Pj4+Pj4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1LCBK
ZWZmIExheXRvbiB3cm90ZToKPj4+Pj4+Pj4+IFllc3RlcmRheSwgSSBzZW50IHBhdGNoZXMgdG8g
Zml4IGhvdyBkaXJlY3RvcnkgZGVsZWdhdGlvbiBzdXBwb3J0IGlzCj4+Pj4+Pj4+PiBoYW5kbGVk
IG9uIGZpbGVzeXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQgYmUgZGlzYWJsZWQgWzFdLiBUaGF0IHNl
dCBpcwo+Pj4+Pj4+Pj4gYXBwcm9wcmlhdGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRv
IG1ha2UgbGVhc2Ugc3VwcG9ydCBiZSBtb3JlCj4+Pj4+Pj4+PiBvcHQtaW4sIHJhdGhlciB0aGFu
IG9wdC1vdXQ6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gRm9yIGhpc3RvcmljYWwgcmVhc29ucywgd2hl
biAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0IHRvIE5VTEwsCj4+Pj4+Pj4+PiB0
aGUgZGVmYXVsdCBpcyB0byB1c2UgdGhlIGtlcm5lbC1pbnRlcm5hbCBsZWFzZSBpbXBsZW1lbnRh
dGlvbi4gVGhpcwo+Pj4+Pj4+Pj4gbWVhbnMgdGhhdCBpZiB5b3Ugd2FudCB0byBkaXNhYmxlIHRo
ZW0sIHlvdSBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+Pj4+Pj4+Pj4gLT5zZXRsZWFzZSgp
IGZpbGVfb3BlcmF0aW9uIHRvIHNpbXBsZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVxdWl2YWxlbnQu
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhpcyBoYXMgY2F1c2VkIGEgbnVtYmVyIG9mIHByb2JsZW1z
IG92ZXIgdGhlIHllYXJzIGFzIHNvbWUgZmlsZXN5c3RlbXMKPj4+Pj4+Pj4+IGhhdmUgaW5hZHZl
cnRhbnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxl
ZnQKPj4+Pj4+Pj4+IGl0IHNldCB0byBOVUxMLiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgZmlsZXN5
c3RlbXMgaGFkIHRvIG9wdC1pbiB0byBsZWFzZQo+Pj4+Pj4+Pj4gc3VwcG9ydCwgcGFydGljdWxh
cmx5IHdpdGggdGhlIGFkdmVudCBvZiBkaXJlY3RvcnkgZGVsZWdhdGlvbnMuCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gVGhpcyBzZXJpZXMgaGFzIHNldHMgdGhlIC0+c2V0bGVhc2UoKSBvcGVyYXRpb24g
aW4gYSBwaWxlIG9mIGV4aXN0aW5nCj4+Pj4+Pj4+PiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5l
cmljX3NldGxlYXNlKCkgYW5kIHRoZW4gY2hhbmdlcwo+Pj4+Pj4+Pj4ga2VybmVsX3NldGxlYXNl
KCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0aGUgc2V0bGVhc2UoKSBvcGVyYXRpb24gaXMgbm90
Cj4+Pj4+Pj4+PiBzZXQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2l0aCB0aGlzIGNoYW5nZSwgbmV3
IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPj4+Pj4+Pj4+IC0+
c2V0bGVhc2UoKSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5kIGRlbGVn
YXRpb24KPj4+Pj4+Pj4+IHN1cHBvcnQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSBtYWlubHkgZm9j
dXNlZCBvbiBmaWxlc3lzdGVtcyB0aGF0IGFyZSBORlMgZXhwb3J0YWJsZSwgc2luY2UgTkZTIGFu
ZAo+Pj4+Pj4+Pj4gU01CIGFyZSB0aGUgbWFpbiB1c2VycyBvZiBmaWxlIGxlYXNlcywgYW5kIHRo
ZXkgdGVuZCB0byBlbmQgdXAgZXhwb3J0aW5nCj4+Pj4+Pj4+PiB0aGUgc2FtZSBmaWxlc3lzdGVt
IHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9ydGFi
bGUgYW5kIGRvbid0IGhhdmUKPj4+Pj4+Pj4gLnNldGxlYXNlIHNldC4uLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gWWVzLCBGVVNFIG5lZWRzIHRoaXMgdG9vLiBJJ2xsIGFkZCBhIHBhdGNoIGZv
ciB0aGF0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gQXMgZmFyIGFzIGtlcm5mcyBnb2VzOiBBSVVJLCB0aGF0
J3MgYmFzaWNhbGx5IHdoYXQgc3lzZnMgYW5kIHJlc2N0cmwKPj4+Pj4+PiBhcmUgYnVpbHQgb24u
IERvIHdlIHJlYWxseSBleHBlY3QgcGVvcGxlIHRvIHNldCBsZWFzZXMgdGhlcmU/Cj4+Pj4+Pj4K
Pj4+Pj4+PiBJIGd1ZXNzIGl0J3MgdGVjaG5pY2FsbHkgYSByZWdyZXNzaW9uIHNpbmNlIHlvdSBj
b3VsZCBzZXQgdGhlbSBvbiB0aG9zZQo+Pj4+Pj4+IHNvcnRzIG9mIGZpbGVzIGVhcmxpZXIsIGJ1
dCBwZW9wbGUgZG9uJ3QgdXN1YWxseSBleHBvcnQga2VybmZzIGJhc2VkCj4+Pj4+Pj4gZmlsZXN5
c3RlbXMgdmlhIE5GUyBvciBTTUIsIGFuZCB0aGF0IHNlZW1zIGxpa2Ugc29tZXRoaW5nIHRoYXQg
Y291bGQgYmUKPj4+Pj4+PiB1c2VkIHRvIG1ha2UgbWlzY2hpZWYuCj4+Pj4+Pj4KPj4+Pj4+PiBB
RkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlfaGFu
ZGxlX2F0KCkuIFNlZQo+Pj4+Pj4+IGNvbW1pdCBhYTgxODgyNTM0NzQgKCJrZXJuZnM6IGFkZCBl
eHBvcnRmcyBvcGVyYXRpb25zIikuCj4+Pj4+Pj4KPj4+Pj4+PiBPbmUgaWRlYTogd2UgY291bGQg
YWRkIGEgd3JhcHBlciBhcm91bmQgZ2VuZXJpY19zZXRsZWFzZSgpIGZvcgo+Pj4+Pj4+IGZpbGVz
eXN0ZW1zIGxpa2UgdGhpcyB0aGF0IHdpbGwgZG8gYSBXQVJOX09OQ0UoKSBhbmQgdGhlbiBjYWxs
Cj4+Pj4+Pj4gZ2VuZXJpY19zZXRsZWFzZSgpLiBUaGF0IHdvdWxkIGtlZXAgbGVhc2VzIHdvcmtp
bmcgb24gdGhlbSBidXQgd2UgbWlnaHQKPj4+Pj4+PiBnZXQgc29tZSByZXBvcnRzIHRoYXQgd291
bGQgdGVsbCB1cyB3aG8ncyBzZXR0aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxlcwo+Pj4+Pj4+IGFu
ZCB3aHkuCj4+Pj4+Pgo+Pj4+Pj4gSU1PLCB5b3UgYXJlIGJlaW5nIHRvbyBjYXV0aW91cywgYnV0
IHdoYXRldmVyLgo+Pj4+Pj4KPj4+Pj4+IEl0IGlzIG5vdCBhY2N1cmF0ZSB0aGF0IGtlcm5mcyBm
aWxlc3lzdGVtcyBhcmUgTkZTIGV4cG9ydGFibGUgaW4gZ2VuZXJhbC4KPj4+Pj4+IE9ubHkgY2dy
b3VwZnMgaGFzIEtFUk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4+Pj4+Pgo+Pj4+Pj4gSWYg
YW55IGFwcGxpY2F0aW9uIGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0IG11c3Qg
YmUgc29tZQo+Pj4+Pj4gdmVyeSBhZHZhbmNlZCBydW50aW1lIChpLmUuIHN5c3RlbWQpLCBzbyB3
ZSBzaG91bGQga25vdyBhYm91dCB0aGUKPj4+Pj4+IHJlZ3Jlc3Npb24gc29vbmVyIHJhdGhlciB0
aGFuIGxhdGVyLgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gSSB0aGluayBzbyB0b28uIEZvciBub3csIEkg
dGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGggdGhlIFdBUk5fT05DRSgpLgo+Pj4+PiBMZXQncyBq
dXN0IGxlYXZlIGtlcm5mcyBvdXQgb2YgdGhlIHNldCB1bnRpbCBzb21lb25lIHByZXNlbnRzIGEg
cmVhbAo+Pj4+PiB1c2UtY2FzZS4KPj4+Pj4KPj4+Pj4+IFRoZXJlIGFyZSBhbHNvIHRoZSByZWNl
bnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4KPj4+Pj4+Cj4+Pj4+
PiBJIGhhdmUgYSByZWNvbGxlY3Rpb24gYWJvdXQgd2FudGluZyB0byBiZSBleHBsaWNpdCBhYm91
dCBub3QgYWxsb3dpbmcKPj4+Pj4+IHRob3NlIHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2Zz
IHNwZWNpZmljYWxseSksIGJ1dCBJIGNhbid0IHNlZSB3aGVyZQo+Pj4+Pj4gYW5kIGlmIHRoYXQg
cmVzdHJpY3Rpb24gd2FzIGRvbmUuCj4+Pj4+Pgo+Pj4+Pj4gQ2hyaXN0aWFuPyBEbyB5b3UgcmVt
ZW1iZXI/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiAoY2MnaW5nIENodWNrKQo+Pj4+Pgo+Pj4+PiBGV0lX
LCB5b3UgY2FuIGN1cnJlbnRseSBleHBvcnQgYW5kIG1vdW50IC9zeXMvZnMvY2dyb3VwIHZpYSBO
RlMuIFRoZQo+Pj4+PiBkaXJlY3RvcnkgZG9lc24ndCBzaG93IHVwIHdoZW4geW91IHRyeSB0byBn
ZXQgdG8gaXQgdmlhIE5GU3Y0LCBidXQgeW91Cj4+Pj4+IGNhbiBtb3VudCBpdCB1c2luZyB2MyBh
bmQgUkVBRERJUiB3b3Jrcy4gVGhlIGZpbGVzIGFyZSBhbGwgZW1wdHkgd2hlbgo+Pj4+PiB5b3Ug
dHJ5IHRvIHJlYWQgdGhlbS4gSSBkaWRuJ3QgdHJ5IHRvIGRvIGFueSB3cml0ZXMuCj4+Pj4+Cj4+
Pj4+IFNob3VsZCB3ZSBhZGQgYSBtZWNoYW5pc20gdG8gcHJldmVudCBleHBvcnRpbmcgdGhlc2Ug
c29ydHMgb2YKPj4+Pj4gZmlsZXN5c3RlbXM/Cj4+Pj4+Cj4+Pj4+IEV2ZW4gYmV0dGVyIHdvdWxk
IGJlIHRvIG1ha2UgbmZzZCBleHBvcnRpbmcgZXhwbGljaXRseSBvcHQtaW4uIFdoYXQgaWYKPj4+
Pj4gd2Ugd2VyZSB0byBhZGQgYSBFWFBPUlRfT1BfTkZTRCBmbGFnIHRoYXQgZXhwbGljaXRseSBh
bGxvd3MgZmlsZXN5c3RlbXMKPj4+Pj4gdG8gb3B0LWluIHRvIE5GUyBleHBvcnRpbmcsIGFuZCBj
aGVjayBmb3IgdGhhdCBpbiBfX2ZoX3ZlcmlmeSgpPyBXZSdkCj4+Pj4+IGhhdmUgdG8gYWRkIGl0
IHRvIGEgYnVuY2ggb2YgZXhpc3RpbmcgZmlsZXN5c3RlbXMsIGJ1dCB0aGF0J3MgZmFpcmx5Cj4+
Pj4+IHNpbXBsZSB0byBkbyB3aXRoIGFuIExMTS4KPj4+Pgo+Pj4+IFdoYXQncyB0aGUgYWN0aXZl
IGhhcm0gaW4gZXhwb3J0aW5nIC9zeXMvZnMvY2dyb3VwID8gSXQgaGFzIHRvIGJlIGRvbmUKPj4+
PiBleHBsaWNpdGx5IHZpYSAvZXRjL2V4cG9ydHMsIHNvIHRoaXMgaXMgdW5kZXIgdGhlIE5GUyBz
ZXJ2ZXIgYWRtaW4ncwo+Pj4+IGNvbnRyb2wuIElzIGl0IGFuIGF0dGFjayBzdXJmYWNlPwo+Pj4+
Cj4+Pgo+Pj4gUG90ZW50aWFsbHk/Cj4+Pgo+Pj4gSSBkb24ndCBzZWUgYW55IGFjdGl2ZSBoYXJt
IHdpdGggZXhwb3J0aW5nIGNncm91cGZzLiBJdCBkb2Vzbid0IHdvcmsKPj4+IHJpZ2h0IHZpYSBu
ZnNkLCBidXQgaXQncyBub3QgY3Jhc2hpbmcgdGhlIGJveCBvciBhbnl0aGluZy4KPj4+Cj4+PiBB
dCBvbmUgdGltZSwgdGhvc2Ugd2VyZSBvbmx5IGRlZmluZWQgYnkgZmlsZXN5c3RlbXMgdGhhdCB3
YW50ZWQgdG8KPj4+IGFsbG93IE5GUyBleHBvcnQuIE5vdyB3ZSd2ZSBncm93biB0aGVtIG9uIGZp
bGVzeXN0ZW1zIHRoYXQganVzdCB3YW50IHRvCj4+PiBwcm92aWRlIGZpbGVoYW5kbGVzIGZvciBv
cGVuX2J5X2hhbmRsZV9hdCgpIGFuZCB0aGUgbGlrZS4gbmZzZCBkb2Vzbid0Cj4+PiBjYXJlIHRo
b3VnaDogaWYgdGhlIGZzIGhhcyBleHBvcnQgb3BlcmF0aW9ucywgaXQnbGwgaGFwcGlseSB1c2Ug
dGhlbS4KPj4+Cj4+PiBIYXZpbmcgYW4gZXhwbGljaXQgIkkgd2FudCB0byBhbGxvdyBuZnNkIiBm
bGFnIHNlZSBtcyBsaWtlIGl0IG1pZ2h0Cj4+PiBzYXZlIHVzIHNvbWUgaGVhZGFjaGVzIGluIHRo
ZSBmdXR1cmUgd2hlbiBvdGhlciBmaWxlc3lzdGVtcyBhZGQgZXhwb3J0Cj4+PiBvcHMgZm9yIHRo
aXMgc29ydCBvZiBmaWxlaGFuZGxlIHVzZS4KPj4KPj4gU28gd2UgYXJlIHJlLWhhc2hpbmcgYSBk
aXNjdXNzaW9uIHdlIGhhZCBhIGZldyBtb250aHMgYWdvIChBbWlyIHdhcwo+PiBpbnZvbHZlZCBh
dCBsZWFzdCkuCj4+Cj4gCj4gWWVwLCBJIHdhcyBsdXJraW5nIG9uIGl0LCBidXQgZGlkbid0IGhh
dmUgYSBsb3Qgb2YgaW5wdXQgYXQgdGhlIHRpbWUuCj4gCj4+IEkgZG9uJ3QgdGhpbmsgd2Ugd2Fu
dCB0byBleHBvc2UgY2dyb3VwZnMgdmlhIE5GUyB0aGF0J3Mgc3VwZXIgd2VpcmQuCj4+IEl0J3Mg
bGlrZSByZW1vdGUgcGFydGlhbCByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpdCB3b3VsZCBiZSB2
ZXJ5Cj4+IHN0cmFuZ2UgaWYgYSByZW1vdGUgcHJvY2VzcyBzdWRkZW5seSB3b3VsZCBiZSBhYmxl
IHRvIG1vdmUgdGhpbmdzIGFyb3VuZAo+PiBpbiB0aGUgY2dyb3VwIHRyZWUuIFNvIEkgd291bGQg
cHJlZmVyIHRvIG5vdCBkbyB0aGlzLgo+Pgo+PiBTbyBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRv
IHJlYWxseSBzZXZlciBmaWxlIGhhbmRsZXMgZnJvbSB0aGUgZXhwb3J0Cj4+IG1lY2hhbmlzbSBz
byB0aGF0IHdlIGNhbiBhbGxvdyBzdHVmZiBsaWtlIHBpZGZzIGFuZCBuc2ZzIGFuZCBjZ3JvdXBm
cyB0bwo+PiB1c2UgZmlsZSBoYW5kbGVzIHZpYSBuYW1lX3RvX2hhbmRsZV9hdCgpIGFuZCBvcGVu
X2J5X2hhbmRsZV9hdCgpIHdpdGhvdXQKPj4gbWFraW5nIHRoZW0gZXhwb3J0YWJsZS4KPiAKPiBB
Z3JlZWQuIEkgdGhpbmsgd2Ugd2FudCB0byBtYWtlIE5GUyBleHBvcnQgYmUgYSBkZWxpYmVyYXRl
IG9wdC1pbgo+IGRlY2lzaW9uIHRoYXQgZmlsZXN5c3RlbSBkZXZlbG9wZXJzIG1ha2UuCgpObyBv
YmplY3Rpb24sIHdoYXQgYWJvdXQga3NtYmQsIEFGUywgb3IgQ2VwaD8KCgo+IEhvdyB3ZSBkbyB0
aGF0IGlzIHVwIGZvcgo+IGRlYmF0ZSwgb2YgY291cnNlLgo+IAo+IEFuIGV4cG9ydCBvcHMgZmxh
ZyB3b3VsZCBiZSBmYWlybHkgc2ltcGxlIHRvIGltcGxlbWVudCwgYnV0IGl0IHNvdW5kcwo+IGxp
a2UgeW91J3JlIHRoaW5raW5nIHRoYXQgd2Ugc2hvdWxkIHNwbGl0IHNvbWUgZXhwb3J0X29wZXJh
dGlvbnMgaW50bwo+IHN0cnVjdCBmaWxlX2hhbmRsZV9vcGVyYXRpb25zIGFuZCB0aGVuIGFkZCBh
IHBvaW50ZXIgZm9yIHRoYXQgdG8KPiBzdXBlcl9ibG9jayAoYW5kIG1heWJlIHRvIGV4cG9ydF9v
cGVyYXRpb25zIHRvbyk/Cj4gCj4gVGhpcyB3b3VsZCBiZSBhIGdvb2QgTFNGL01NIHRvcGljLCBi
dXQgSSdtIGhvcGluZyB3ZSBjYW4gY29tZSB0byBhCj4gY29uc2Vuc3VzIGJlZm9yZSB0aGVuLgo+
IAoKCi0tIApDaHVjayBMZXZlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
