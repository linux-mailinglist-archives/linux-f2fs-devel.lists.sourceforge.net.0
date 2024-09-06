Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A468096F203
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 12:57:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smWeH-0004Ka-Q5;
	Fri, 06 Sep 2024 10:57:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1smWeF-0004KI-Vx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LUGjxvv5EXgZ9zW5GZiciuOA8qxl0QvJCECjKsjK54o=; b=nSDa6hKVEPRJrbFbFk1MKwM50Z
 tps07M8okuBox+2LW7smpcqjKn9oASEz2gkdRFAV/hJ/m374qrs79BxlUP7gW9pH6YTCFFP5qhst6
 XEz4qjirwC4hPx8p1+Sc9cMwnhbs8Vrlf4QVtPuw9/w5xdLmhbXAhTsS4kgn7k6u0Low=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LUGjxvv5EXgZ9zW5GZiciuOA8qxl0QvJCECjKsjK54o=; b=Ao8OJFjy66QbRugfcvrvhJ0sh0
 ngvluDStFganel4pf5lmz33JSVsqR4CQqYicugJUXxsyfGDVN7NMawzZBzlzb8rhEfaon7u79TBP5
 fVTX0q6/1Y0ve4bqx8eSiM6bLPGY9QE9E8zv7+nQd/Wp2AalTDy7QUTNLbohQF1/5MiM=;
Received: from mail-eastasiaazon11011056.outbound.protection.outlook.com
 ([52.101.129.56] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smWeF-0004cK-7E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 10:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVQmrePuA7n4/OA2AW4d2IUfDUw4RCWjNjIJM2Pa+so9UfASN+7IabqH12Ew+zlIjvDn8ltpZZLKH91BEeXL7fcDmVPxJ4RptnhLF9cJ9oKs/3kQCUFQTQ+Z/y1zM8PRZNd8uliTkMtPuVyo3+nw0m/2tGvo/79O+PT8VgCXIs+jWWkwIZorFaefYo2gO5C1U/PZih1rGyxf9kzEp5Pl0YEFxia2kezh2LJErh0qFhd2bKeCJw4z730zXgBE6/4CHQMApCxuUhbAVuT5H1LYG8nOwEmdsgZc+xjJw+mdB023qs4sJHzm0aFc/93HJVdS7yBzJK2U7+fbOgltFIKBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUGjxvv5EXgZ9zW5GZiciuOA8qxl0QvJCECjKsjK54o=;
 b=KmAVQneV4Vjlu8JMCRd37wnMS2LL1yAv6BveWXwByxR0VaV8o3807HXGDm25nRSkqCBEZO3uPBJrTDSfwTz5F4/BHFgvMg9KcMfLnlTdR28dj602FLN5fpkK33qj6AIyU07ud7eShUHXoGRFgVg33N+zjUvftO9s8FTlUlspy3KNTjpUQZHVo/hyTuYITY0D241wQue6QkRwKCSaVY9svBeFbNAP8+3/JR2cbD/2T+dsTagjeEg11SiBDKOSFXQLurm+Z59bpnq8hplO1dXD1V80r4slvHOVYosWLtS4X0IFzUjHkFWwGME6pt6FXyA7eMQAg6MPcVaKJ46WgTXb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUGjxvv5EXgZ9zW5GZiciuOA8qxl0QvJCECjKsjK54o=;
 b=LkJdJRq/MMbFGXEKI/SKlbANRG6+31BvYHtbLBEel2Z988OfUvDoWlGew3HY41fub4XcCgox6GfpSK/uj+PwRptLvpDa19dNp+rkhGOxuMBGHqXNwAbaNmsncKZ181wY5Bbj1E5hdiBaWwhn/WFOaSxLXoIm/flaslra+KtI+Rg4GBH5lOVug2iPfEfkelII71IAiSBQIo6OEvN1HpuBFx5hWD2CZRNuhD6T2s18m5qnso15tkncj5ODQHi0KJ0M6XiyeyFX3oM8G7TNxqIkMqCS64zCL1MvJ3EL0ffhailYR3NXu6/xX7JvQ3/B7T06iZblxCDvzV+MsEwK7KWk4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYZPR06MB7192.apcprd06.prod.outlook.com (2603:1096:405:aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 10:42:19 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 10:42:19 +0000
To: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri,  6 Sep 2024 04:57:27 -0600
Message-Id: <20240906105727.3666561-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAD14+f2M+C_21h2bV6=GMhNwgWzLVaCL5jv1SQxsuKoveX6P_w@mail.gmail.com>
References: 
X-ClientProxiedBy: SG2PR06CA0242.apcprd06.prod.outlook.com
 (2603:1096:4:ac::26) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYZPR06MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b53fb8-bde7-4b32-e936-08dcce609503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0FyK09LNzBES3FUUnRuZ0MvaE9vQXlFbnZzU3FkZVNvZXdPMkR0bDFKSks5?=
 =?utf-8?B?Y2RtYUU3NWVNQXQrT2VzT2N1cGtNNEM1NGRJSC92QVhWN3YwTWUxempVVkcy?=
 =?utf-8?B?ZjZlWHZQeHRmTk5MUVFaWHBqVEtKUGE3TDcweUcrdGdzZWFMNnQ4d0FmZmVk?=
 =?utf-8?B?bHBmNjlibmp0SENSbkJMenUvdWdpcGRHQlIvdEplS0I0R25NOSswU1NhU3dX?=
 =?utf-8?B?bThoUXhBR0pKK1NwS2U1S3pPckNnejA2Qlp6c3ZZSzRwaHVtVGFlZm9FTW8v?=
 =?utf-8?B?RzFKWkRUMVVxK0FnTVBoQlVvMGVESUJmSXczQURGWEpWUkszTFNIZXhESmJz?=
 =?utf-8?B?Q3FjTFBxZGxFV3ZnZlNJb0JRM2JzbEZLN1Q4WTZseDRpdU1VZEl3V3YxVXlk?=
 =?utf-8?B?NisxWU5CNGJPb0JEcFdDc1VnR1NuRnZvbnJRMnVoVWVnbnNLeXFPSnB2R2Jj?=
 =?utf-8?B?dUNzZXBrMjBMQ1dDUmo3ZzBWS05OMjFtQVhCMTVwZFJVK0ZxSmlZWHMwVHhn?=
 =?utf-8?B?Sk1wTHI0OG54eUl5Z3lUandkclUzczcvbVRJeUl4ZWJnbWYraXFkcFVFRWlS?=
 =?utf-8?B?ejROS1ZyZkVCcGQrbE5VVU9hc3B4S1lBTUpTMjBhNU84YlI4djB5eW9iWUU0?=
 =?utf-8?B?WU9qTFNQbEtsM2RoTHlZY2Y4Vll5SzRtcTV2TzJkckxOZzlKcGk4RmhEcjRO?=
 =?utf-8?B?dTkxWUVJdi9ZQndmZEczZEMvQXF5TGt1NlVjZk1zcjJRSXhHbUphWUhWeGxR?=
 =?utf-8?B?YXdnTVJxc0U5U2xLR0tGeUxXSTFYVnB6cXUybDBHd2I0cUsrLzNtYnNITGxj?=
 =?utf-8?B?MHVpdFFab2tjTHlKRWg0bkVycVVmMDZ3Lyt0aThsSDE3YXdhc3VkRTRpS3I3?=
 =?utf-8?B?YS80VWxlUmFJTzZtU3hxZnJtSFpzZnFqaThuUzc5VnFtQnpUSFRjS2hNWDRy?=
 =?utf-8?B?bGdwelBHS2pvb2NPakhNZXNVODMvL1labVNhR0d4VjA1WHlFQlRPTUZtWk5Q?=
 =?utf-8?B?TmZHY0hkaDVJNWZ4OHlPaEFKWitxVXZlcU9pNkd2RXF2a2JYeENsNHVrOHZZ?=
 =?utf-8?B?bGNxTmhmWVNRUzNlOCtZNkFQdEFpMEE3c1ZWb2xMdkZJd3k3QzhYSzVkNDNS?=
 =?utf-8?B?bjB1K1Y0cnJpU29NUjJBOWRCMDk0bWF4bmtWamlBWWV6VzliYlovQ21iRUl1?=
 =?utf-8?B?dXUzRDBPd3hPeHZ2ekN5VHJRL2tscDcrZW4wTWswc0FCMVJyRXlkQk5LYWw2?=
 =?utf-8?B?UzhKZVhFRmd4amNZN2ZTeWdIRENPTUY3V3k5QXRoQmVWNFdIQTlPSi9IY25S?=
 =?utf-8?B?NS90VXhDMEltVVVjRWRwbDM3TmpDUUlMd21qZXorTnlKTDVvbnpvRHJtRGZr?=
 =?utf-8?B?c2RHTXc5RS94dllQckFnTm1pZEJWNFkzQlBSTHVlUEp2bDh4V2JGY1JUOHhI?=
 =?utf-8?B?NTlzZFU0RVovMXBlWkpudGdQbmdHUnJCYW81RmRTVVFVSVFEVlZUcEtINmFM?=
 =?utf-8?B?TWw5cEI3dHlOZXQ5VjU3dzJmS0FTcVFPNDU4ZTQ1M2NmZTBJb1BBT2pRZHpq?=
 =?utf-8?B?YnBESmpvV1N4T2k3THprMlZMVHRCTnVBNStBcEdHSWYvYUUybVZxVytUZC9l?=
 =?utf-8?B?Z2ZUTnRLQzhwLzd2blFNYUVTblNvSEF4azlYdm9pc1ZkakdWYmRyMk1OTmxU?=
 =?utf-8?B?S3dsTmU4RExZeGpRUnlNdFdFYk1KVGdyZnJrM0k1SExkVmxwTGYrTFBPcmJZ?=
 =?utf-8?B?TW5OLzVOYmp0VkpkWXFqNjBYb0c1MGJEM2VGTHNJbnVhN3VQMkQ3NFZaTlA2?=
 =?utf-8?B?ZC9HWU5BK1hOQUsvbGpqWkVkSVA0VXkzT0pPSW1QQzRaOFNGQXhBZit5dDBW?=
 =?utf-8?B?SDRydkl1N094UDZzRVBGM2NDbGxBdUY2cTloT0kvNElOZUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1JCZjdBYlNBNFl6Z2VCMUR0MFRudU93QjFXc3dzUGtyN3ZSbmhyV2tJR0Uw?=
 =?utf-8?B?Qkw2ZEpJTEYyTnAxdGJnYzBod0Q1cFRVSVExTUZYQ2N3eXlGdnE3R0FBMEhP?=
 =?utf-8?B?SjEvWkVqODlBckxJVklxdmVJNFpId1lienEwYjUzbHNvMkd1NitycmpsNVNH?=
 =?utf-8?B?Q1RmQXRFZGRmd1hXMXpIYzBmWUJkY3hvY0p2Mno3bnhkU3F2WE1kU3l1Z2Fx?=
 =?utf-8?B?bzNpNUloN013UklFV0pDVnpna1VQdTZWMzErVEh5T3M2V3FzYWZBZ0hsSnRx?=
 =?utf-8?B?WllmVHFQYmsyb3ZKWFdWb3IxZ0pKYkllc0IzN2NLZmgyMDhjdldUdm5WVzlx?=
 =?utf-8?B?OFpFcEc0eUFUbDdUUVlqTWhUQzVNenVoL1duUHNtQlpCMHRJY1dBVS9RUFJq?=
 =?utf-8?B?SFEwNkFRYU93SXBIZklnVVowUXNWVUxVRlR3RmhhbmpFelpiZE5RYlcreWRC?=
 =?utf-8?B?QTQxSnRVUS8vbkZYeTlONngyL2R1N1g2OFRYZlpxVWxTOUY4YWh1WEFwL1ZW?=
 =?utf-8?B?Y0FHWGwzMnNxOXZia1BSTnh3SjBCSGwzcGR2RHo2aVNlb0JyTG03dVdpTFcr?=
 =?utf-8?B?YUdJYnYvbk9NeTZmNThKUkJpbnFEbzUxRXpvVDg2RnBHTG13cnpuTWI3Szdo?=
 =?utf-8?B?U0o3ZWp5L3lIL2o4Z21McFh2R3FGVWZLWGRKejJvVzlkWHNnaTNIN3F0OW5O?=
 =?utf-8?B?SGFsVTN1Tlo1MEViUytFamFFZzJJcmJqakdoYzVYSmVwTDFHSEI3ekVIcnhS?=
 =?utf-8?B?WktjSnF5bUgyRGNhTXNFKzYwdFB2ODZYQTA4aDIycTZpS0xYVHpGWGY0UERw?=
 =?utf-8?B?RnZFRXJKMFVaS2I1UGpSOGxDa2duMGtEYVpHV1dBQkM1MUxRdVJBbkxJSjZy?=
 =?utf-8?B?SmQveFQ2eitSeHBRYVVJVE5FUmpGb2VFZXhYQS9QNEFPQzZ5MG5sTllwSHkw?=
 =?utf-8?B?QllvQTBXeFRsM0FZZTNNWU9nSU9WRFJzd1Vpb2ppL3ZIMERoRUY5VFI4Z041?=
 =?utf-8?B?MWpvNDhrOElDQzQ4MWJaK2ZTbytXRVZ4TDdxemw5TFlIQ2I0WHBlV0szc3Bk?=
 =?utf-8?B?YUxBUktnRHNja0gveFZGYk54TmgxdDdtWFV0aG5wYU83ZVhJQ3g2cWNJMm5R?=
 =?utf-8?B?Z3YwUEpCY2ZQU1ovd3p3a1QvcllRU3l0b1dtdVVxRWxqZkdvTld1M0Q1OVV0?=
 =?utf-8?B?dW4vQlpkK1JLL2NsYnFZQ2RTaWRldytTaFFMdkxKS2g0QkkyQlFjRnFKREhY?=
 =?utf-8?B?NERIaE5FaEJHYVFkeU1GeUh0QktQa215aHdaVkZkUGlTd1hGaXRFSG9zUmdw?=
 =?utf-8?B?S1l3b20yMXhQWEdJeldDaDZpQ1gyaU1lZEtDTzVXRHBZeWJqV1ZlWEl5VU5w?=
 =?utf-8?B?eUxkZ01pYUJ2Q2JxYTUrbmtyaENQUkJNc2ppZWtycUllR1daS2pTQkZNeFE1?=
 =?utf-8?B?dGZmUTh2UGllMU1kbHkrT0FvOXRKbnhUcGU4UFZsTTJnakVlejdzbG1RODZQ?=
 =?utf-8?B?WWZXS1JOVDI1UzE0MHp0RC9VaUFRTjg2M3V5T0NPU3hGQzc4NG1wRDZGLzMz?=
 =?utf-8?B?SG1QSkRhZWErTjAzUnhqdFYwbHZBVXFiRkkrUUkyWjZKS3JZaTRoMEsxMlFM?=
 =?utf-8?B?V1VLckpmdU1YWEpjRDV5WC9UR054Q2x5NHZnbFJVdktTUTBMbGdsS21EMzI1?=
 =?utf-8?B?ZDlPZjN6V09wcmk1QnI4bDVRRTVGT29sdkJxQW9BTjA3RzZLRXdsMVdsWDJL?=
 =?utf-8?B?R1ZqdGF1SEVYYWl6d0txUW5yanRtZkR0Wkt1ejZWTGdzMlZkQ0g3TnQzNXJC?=
 =?utf-8?B?QXdFZDhxaEREajY4dHpNcnFYdWgrWHhKS0Z3TE5RNkZqZFlieENMdmhVYTFs?=
 =?utf-8?B?OTh3MXR2R1JXOHErK083TjhhY2xJWVVDdExuWnYwMUNPMHBQQm56OEJydXlV?=
 =?utf-8?B?YXFrNWxFUVFDa3B0dURGaFpNdmJPdnpKY1M3MVpFT3hBcXI1VFRKdkNNU0hs?=
 =?utf-8?B?K1NMcU1tMlZpRjltVjlZZGJRalNtZ2pXZ0lHQmM5ZCtCbDZXOTJDYllMUlIr?=
 =?utf-8?B?akljdDJUYnI0cWRVSnpaeXluMlUwMnZSTk5wWlhwZ0p2UjZlL2pOSnRURFlY?=
 =?utf-8?Q?foMe0o1p5lgZtwK0BHWt1FpHv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b53fb8-bde7-4b32-e936-08dcce609503
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 10:42:19.5334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oh4MLXgGrOQjJONYt99KH3kPtMNG+T6ZJSNt3a3oFReKlddUDcFSyR4Re8RsuULmcEfaSOkZlJMHnQ9zkGyopg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7192
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 06, 2024 at 06:02:42PM +0900, Juhyung Park wrote:
 > Hi Wu, > > Interesting patch-set. > > A quick test here on my daily-driver
 phone's data (785558 inodes) with > both compression and encr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.129.56 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.129.56 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1smWeF-0004cK-7E
Subject: Re: [f2fs-dev] [PATCH 00/13] f2fs: introduce inline tail
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Wu Bo <bo.wu@vivo.com>, Wu Bo <wubo.oduw@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMDY6MDI6NDJQTSArMDkwMCwgSnVoeXVuZyBQYXJrIHdy
b3RlOgo+IEhpIFd1LAo+IAo+IEludGVyZXN0aW5nIHBhdGNoLXNldC4KPiAKPiBBIHF1aWNrIHRl
c3QgaGVyZSBvbiBteSBkYWlseS1kcml2ZXIgcGhvbmUncyBkYXRhICg3ODU1NTggaW5vZGVzKSB3
aXRoCj4gYm90aCBjb21wcmVzc2lvbiBhbmQgZW5jcnlwdGlvbiBkaXNhYmxlZCwgY29waWVkIHZp
YSByc3luYyB0byAyIGZyZXNoCj4gZjJmcyBwYXJ0aXRpb25zIHdpdGggYW5kIHdpdGhvdXQgaW5s
aW5lIHRhaWw6Cj4gQmVmb3JlOiAxNzAwNjQ5MjhLaUIKPiBBZnRlcjogMTY5MjQ5NzgwS2lCCj4g
Cj4gU28gYWJvdXQgMC40OCUgc2F2ZWQuCj4gCkhpIEp1aHl1bmcsCgpUaGFua3MgZm9yIHlvdXIg
dGVzdC4gSWYgaXQncyBub3QgdG9vIG11Y2ggdHJvdWJsZSwgcGxlYXNlIGhlbHAgY2hlY2sgdGhl
IGYyZnMKc3RhdGlzdGljczoKY2F0IC9zeXMva2VybmVsL2RlYnVnL2YyZnMvc3RhdHVzIHwgZ3Jl
cCBVdGlsaXphdGlvbgoKSG93ZXZlciwgaXTigJlzIG1vcmUgbGlrZWx5IHRoYXQgdGhlIGJlbmVm
aXRzIG9mIGlubGluZSB0YWlsIGFyZSBpbmRlZWQgbGltaXRlZCBvbgptb2JpbGUgZGV2aWNlcy4g
SSBwcmV2aW91c2x5IGV2YWx1YXRlZCB0aGUgZ2FpbnMgb24gbXkgb3duIHBob25lLCBhbmQgdGhl
eSB3ZXJlCmxlc3MgdGhhbiAxJSB0b28uCgpGcm9tIHRoZSBkYXRhIG9uIHlvdXIgcGhvbmUsIHRo
ZSBhdmVyYWdlIHNpemUgaXMgMTcwMDY0OTI4S2lCLzc4NTU1OOKJiDIwMEtpQi4KU3RvcmFnZSBz
cGFjZSBvbiBwaG9uZXMgaXMgcHJpbWFyaWx5IGNvbnN1bWVkIGJ5IG11bHRpbWVkaWEgZmlsZXMs
IHNvIHRoZQpwcm9wb3J0aW9uIG9mIGZpbGVzIHNtYWxsZXIgdGhhbiA2NEtCIGlzIHF1aXRlIHNt
YWxsLgoKVGhlcmVmb3JlLCBjb21wYXJlZCB0byBwaG9uZSBzdG9yYWdlLCBzY2VuYXJpb3MgbGlr
ZSBzdG9yaW5nIExpbnV4IHNvdXJjZSBjb2RlLAp3aGljaCBpbnZvbHZlIG1hbnkgc21hbGwgZmls
ZXMsIGFyZSBtb3JlIGxpa2VseSB0byB5aWVsZCBub3RpY2VhYmxlIGJlbmVmaXRzLgoKSG93ZXZl
ciwgZG9uJ3QgYmUgdG9vIGRpc2FwcG9pbnRlZCB3aXRoIGl0LCBhcyBpdCBjYW4gc3RpbGwgZG91
YmxlIHRoZSBiZW5lZml0cwpiYXNlZCBvbiB0aGUgZXhpc3RpbmcgZ2FpbnMgZnJvbSBpbmxpbmUg
ZGF0YS4KSW5saW5lIGRhdGE6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2
ZWwvMTM4NDA5NjQwMS0yNTE2OS0xLWdpdC1zZW5kLWVtYWlsLWh1YWp1bi5saS5sZWVAZ21haWwu
Y29tL1QvI3UKClRoYW5rcywKV3UgQm8KCj4gTGV0IG1lIGtub3cgaWYgdGhpcyBpcyBhbiB1bmV4
cGVjdGVkIHJlc3VsdC4KPiAKPiBUaGFua3MsCj4gCj4gT24gVHVlLCBTZXAgMywgMjAyNCBhdCA1
OjQy4oCvUE0gV3UgQm8gdmlhIExpbnV4LWYyZnMtZGV2ZWwKPiA8bGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+ID4KPiA+IFRoZSBpbm9kZSBpbiBGMkZTIG9j
Y3VwaWVzIGFuIGVudGlyZSA0ayBibG9jay4gRm9yIG1hbnkgc21hbGwgZmlsZXMsIHRoaXMgbWVh
bnMKPiA+IHRoZXkgY29uc3VtZSBtdWNoIG1vcmUgc3BhY2UgdGhhbiB0aGVpciBhY3R1YWwgc2l6
ZS4gVGhlcmVmb3JlLCB0aGVyZSBpcwo+ID4gc2lnbmlmaWNhbnQgcG90ZW50aWFsIHRvIGJldHRl
ciB1dGlsaXplIHRoZSBpbm9kZSBibG9jayBzcGFjZS4KPiA+Cj4gPiBDdXJyZW50bHksIEYyRlMg
aGFzIHR3byBmZWF0dXJlcyB0byBtYWtlIHVzZSBvZiB0aGUgaW5vZGUgYmxvY2sgc3BhY2U6IGlu
bGluZQo+ID4gZGF0YSBhbmQgaW5saW5lIHhhdHRyLgo+ID4KPiA+IElubGluZSBkYXRhIHN0b3Jl
cyBmaWxlIHdoaWNoIHNpemUgaXMgc21hbGxlciB0aGVuIDMuNWsgaW4gaW5vZGUgYmxvY2suIEhv
d2V2ZXIsCj4gPiBmb3Igc2xpZ2h0bHkgbGFyZ2VyIHNtYWxsIGZpbGVzLCB0aGVyZSBzdGlsbCBo
YXZlIG11Y2ggd2FzdGUuCj4gPiBGb3IgZXhhbXBsZSwgYSA1ayBmaWxlIHJlcXVpcmVzIDMgYmxv
Y2tzLCB0b3RhbGluZyAxMmsgb2Ygc3BhY2UsIHdoaWNoIGlzCj4gPiBtb3JlIHRoYW4gdHdpY2Ug
dGhlIHNpemUgb2YgdGhlIGZpbGUgaXRzZWxmIQo+ID4KPiA+IEFkZGl0aW9uYWxseSwgdGhlIGVu
ZCBvZiBhIGZpbGUgb2Z0ZW4gZG9lcyBub3Qgb2NjdXB5IGFuIGVudGlyZSBibG9jay4gSWYgd2Ug
Y2FuCj4gPiBzdG9yZSB0aGUgZW5kIG9mIHRoZSBmaWxlIGRhdGEgd2l0aGluIHRoZSBpbm9kZSBi
bG9jaywgd2UgY2FuIHNhdmUgYW4gZW50aXJlCj4gPiBibG9jayBmb3IgdGhlIGZpbGUuIFRoaXMg
aXMgcGFydGljdWxhcmx5IGltcG9ydGFudCBmb3Igc21hbGwgZmlsZXMuCj4gPgo+ID4gSW4gZmFj
dCwgdGhlIGN1cnJlbnQgaW5saW5lIGRhdGEgaXMgYSBzcGVjaWFsIGNhc2Ugb2YgaW5saW5lIHRh
aWwsIGFuZAo+ID4gaW5saW5lIHRhaWwgaXMgYW4gZXh0ZW5zaW9uIG9mIGlubGluZSBkYXRhLgo+
ID4KPiA+IFRvIG1ha2UgaXQgc2ltcGxlLCBpbmxpbmUgdGFpbCBvbmx5IG9uIHNtYWxsIGZpbGVz
KDw2NGspLiBBbmQgZm9yIGxhcmdlciBmaWxlcywKPiA+IGlubGluZSB0YWlscyBkb24ndCBwcm92
aWRlIGFueSBzaWduaWZpY2FudCBiZW5lZml0cy4KPiA+Cj4gPiBUaGUgbGF5b3V0IG9mIGFuIGlu
bGluZSB0YWlsIGlub2RlIGJsb2NrIGlzIGZvbGxvd2luZzoKPiA+Cj4gPiB8IGlub2RlIGJsb2Nr
ICAgICB8IDQwOTYgfCAgICAgaW5saW5lIHRhaWwgZW5hYmxlICAgIHwKPiA+IHwgLS0tLS0tLS0t
LS0tLS0tIHwgLS0tLSB8IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+ID4gfCBpbm9kZSBp
bmZvICAgICAgfCAzNjAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiB8IC0tLS0t
LS0tLS0tLS0tLSB8IC0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiA+IHwgICAg
ICAgICAgICAgICAgIHwgICAgICB8IGV4dHJhIGluZm8gICAgICAgICB8IDB+MzYgfAo+ID4gfCAg
ICAgICAgICAgICAgICAgfCAgICAgIHwgKipjb21wYWN0X2FkZHJbMTZdIHwgNjQgICB8Cj4gPiB8
IGFkZHIgdGFibGVbOTIzXSB8IDM2OTIgfCByZXNlcnZlZCAgICAgICAgICAgfCA0ICAgIHwKPiA+
IHwgICAgICAgICAgICAgICAgIHwgICAgICB8ICoqdGFpbCBkYXRhICAgICAgICB8ICAgICAgfAo+
ID4gfCAgICAgICAgICAgICAgICAgfCAgICAgIHwgaW5saW5lX3hhdHRyICAgICAgIHwgMjAwICB8
Cj4gPiB8IC0tLS0tLS0tLS0tLS0tLSB8IC0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LXwKPiA+IHwgbmlkIHRhYmxlWzVdICAgIHwgMjAgICB8Cj4gPiB8IG5vZGUgZm9vdGVyICAgICB8
IDI0ICAgfAo+ID4KPiA+IEYyZnMtdG9vbHMgdG8gc3VwcG9ydCBpbmxpbmUgdGFpbDoKPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA5MDMwNzU5MzEuMzMz
OTU4NC0xLWJvLnd1QHZpdm8uY29tCj4gPgo+ID4gSSB0ZXN0ZWQgaW5saW5lIHRhaWwgYnkgY29w
eWluZyB0aGUgc291cmNlIGNvZGUgb2YgTGludXggNi45LjcuIFRoZSBzdG9yYWdlCj4gPiBzcGFj
ZSB3YXMgcmVkdWNlZCBieSBhcHByb3hpbWF0ZWx5IDglLiBBZGRpdGlvbmFsbHksIGR1ZSB0byB0
aGUgcmVkdWNlZCBJTywgdGhlCj4gPiBjb3B5IHRpbWUgYWxzbyByZWR1Y2VkIGJ5IGFyb3VuZCAx
MCUuCj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggeGZzdGVz
dHMgYnkgcnVubmluZyAna3ZtLXhmc3Rlc3RzIC1jIGYyZnMKPiA+IC1nIHF1aWNrJyBib3RoIHdp
dGggYW5kIHdpdGhvdXQgdGhlIHBhdGNoOyBubyByZWdyZXNzaW9ucyB3ZXJlIG9ic2VydmVkLgo+
ID4gVGhlIHRlc3QgcmVzdWx0IGlzOgo+ID4gZjJmcy9kZWZhdWx0OiA1ODMgdGVzdHMsIDYgZmFp
bHVyZXMsIDIxMyBza2lwcGVkLCA2NTAgc2Vjb25kcwo+ID4gICBGYWlsdXJlczogZ2VuZXJpYy8w
NTAgZ2VuZXJpYy8wNjQgZ2VuZXJpYy8yNTAgZ2VuZXJpYy8yNTIgZ2VuZXJpYy81NjMKPiA+ICAg
ICAgIGdlbmVyaWMvNzM1Cj4gPiAgICAgICBUb3RhbHM6IDYwNyB0ZXN0cywgMjEzIHNraXBwZWQs
IDMwIGZhaWx1cmVzLCAwIGVycm9ycywgNTc5cwo+ID4KPiA+IFd1IEJvICgxMyk6Cj4gPiAgIGYy
ZnM6IGFkZCBpbmxpbmUgdGFpbCBtb3VudCBvcHRpb24KPiA+ICAgZjJmczogYWRkIGlubGluZSB0
YWlsIGRpc2sgbGF5b3V0IGRlZmluaXRpb24KPiA+ICAgZjJmczogaW1wbGVtZW50IGlubGluZSB0
YWlsIHdyaXRlICYgdHJ1bmNhdGUKPiA+ICAgZjJmczogaW1wbGVtZW50IGlubGluZSB0YWlsIHJl
YWQgJiBmaWVtYXAKPiA+ICAgZjJmczogc2V0IGlubGluZSB0YWlsIGZsYWcgd2hlbiBjcmVhdGUg
aW5vZGUKPiA+ICAgZjJmczogZml4IGFkZHJlc3MgaW5mbyBoYXMgYmVlbiB0cnVuY2F0ZWQKPiA+
ICAgZjJmczogc3VwcG9ydCBzZWVrIGZvciBpbmxpbmUgdGFpbAo+ID4gICBmMmZzOiBjb252ZXJ0
IGlubGluZSB0YWlsIHdoZW4gaW5vZGUgZXhwYW5kCj4gPiAgIGYyZnM6IGZpeCBkYXRhIGxvc3Mg
ZHVyaW5nIGlubGluZSB0YWlsIHdyaXRpbmcKPiA+ICAgZjJmczogYXZvaWQgaW5saW5pbmcgcXVv
dGEgZmlsZXMKPiA+ICAgZjJmczogZml4IGlubGluZSB0YWlsIGRhdGEgbG9zdAo+ID4gICBmMmZz
OiBjb252ZXJ0IGlubGluZSB0YWlscyB0byBhdm9pZCBwb3RlbnRpYWwgaXNzdWVzCj4gPiAgIGYy
ZnM6IGltcGxlbWVudCBpbmxpbmUgdGFpbCBmb3J3YXJkIHJlY292ZXJ5Cj4gPgo+ID4gIGZzL2Yy
ZnMvZGF0YS5jICAgICB8ICA5MyArKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIGZzL2Yy
ZnMvZjJmcy5oICAgICB8ICA0NiArKysrKysrKysrKystCj4gPiAgZnMvZjJmcy9maWxlLmMgICAg
IHwgIDg1ICsrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIGZzL2YyZnMvaW5saW5lLmMgICB8
IDE1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiA+ICBm
cy9mMmZzL2lub2RlLmMgICAgfCAgIDYgKysKPiA+ICBmcy9mMmZzL25hbWVpLmMgICAgfCAgIDMg
Kwo+ID4gIGZzL2YyZnMvbm9kZS5jICAgICB8ICAgNiArLQo+ID4gIGZzL2YyZnMvcmVjb3Zlcnku
YyB8ICAgOSArKy0KPiA+ICBmcy9mMmZzL3N1cGVyLmMgICAgfCAgMjUgKysrKysrKwo+ID4gIGZz
L2YyZnMvdmVyaXR5LmMgICB8ICAgNCArKwo+ID4gIDEwIGZpbGVzIGNoYW5nZWQsIDQwOSBpbnNl
cnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4zNS4zCj4gPgo+ID4K
PiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
