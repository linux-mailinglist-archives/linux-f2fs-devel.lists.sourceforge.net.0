Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561BADB9AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivejHtpNqGI8x9+1zAR4pEz0cyAAGYKir4Tc9UJB/Mc=; b=GRs6IOWljLLEugLhdoDGeqdfQz
	QOs6G83UZff8W7IEbBPDdHqNsyDUKnSEtBP/TqT5cnHgMW0FvzlzGNvFXZrzcgnKd/eg3pWtYiIuR
	t0am+ggfyJF7j/uguumz/HafYFzPM8Hj0Qac/NlrTnkYWyPkhxwhNurn8cWjglZk01k8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbg-0001qu-9s;
	Mon, 16 Jun 2025 19:35:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFba-0001py-Jm;
 Mon, 16 Jun 2025 19:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQ6It7ceP4ge2wwkA2QHQTaGh4eZZLUU0skN0ZdcGT0=; b=cEAM2jXyoqFMUF4iEGwGJhbN/7
 IJDAgrvLrENoJQoOVFvI4yI1iceUwP+W3aMH0Qg4+NXufknOtYsJmEGogKKp/4UIzPEtFmSltx6lg
 tF+CJKjB/Ix73SllOlIiDGAosbUgGw4LKvWzTGVfe7TTerpIWDUlTMFFsZy8qqf+Y8T8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xQ6It7ceP4ge2wwkA2QHQTaGh4eZZLUU0skN0ZdcGT0=; b=UF5p0hn5uKzHqAdUHZU5vyi5IV
 EFiYY7jkXc2RlO5LhNQP9uZXGKDo9fzx7urYuCBMYJzcnVuJFd+imGaXa7qYzuisOY+cP6vnfyMRn
 USQ0JOZcBE+ZsNUWlJurCxZoPGWXMnpitl+biYR0cKllKwngWZLsFJ/vXifjTc7u/7lE=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFba-0008JJ-5K; Mon, 16 Jun 2025 19:34:54 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuWqQ025026;
 Mon, 16 Jun 2025 19:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=xQ6It7ceP4ge2wwkA2QHQTaGh4eZZLUU0skN0ZdcGT0=; b=
 VReEyvIy5ymV+EIkjiovaZO7zbuNJwNV25YZHuNpcCUdVP/AzOn+RWkVymg/WvHW
 IVFLb3rPCS6XfV4ibCLou72GogG2RMYAasQLLAev25+oJXBZQUvX9S7wVsNTTTZv
 Q9HUWN4Ha7Pik+1/ySEtt/ysTu8NSyzCSc3IAyx7VGqLCMNqdnCmSy9otHO1Rm59
 Pe9aFnRUMugJrAz4W9EJ+1a3WOhSwb42ONUAE/Kg2Xr4ft9Fg1SD8BMhGaPh3v0w
 ms2qkATp3tbfHhl4T72p2FBEqHJ0vQAbO+0VQBi4Kurnh5jidtvLqogfckfhr3y3
 33gvLFF47Iiywna4fNd2kQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd3nu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:06 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJ6DKK025950; Mon, 16 Jun 2025 19:34:05 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yhekuqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFnWLpGaK+1gwCNKfi4TjcF5WPYJw15ZV4W8mdPy+75ej4/Xqdu22dyLKoM4Pelz6uF5EXhYBHjK2P0+eCXnHQZA3YIrn5fXnutL1Q2BqYKKkQhHjqbnMOr9FyjjwPasdprMVV3M3YWKN1gMEZz2sd1ynkHxNQdpTmZxCyo1pvp5YJvP97bkB4mTBo96Td8GwBOTjWQ3wCxrfjgByvAhS36yU3ZEqdRvnK15GZ/mOSFsqeo9gsXGk1UDs6obwZi08FPf5u9D2wHci4trbTNJFIVTsEzahWd7bQFhk7/5IFjdTehjtVgCHpx2zgOsqRElzpO3j2Tr7ABy1sRMMvvRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ6It7ceP4ge2wwkA2QHQTaGh4eZZLUU0skN0ZdcGT0=;
 b=OKoZgmxKsOmmpkGwDOsiQAGkEDI8+op+Ovalf/QNnvsjztRrDoz80ZabLmYx/snCxhtlWAG+iyOPIRTHHPFcZuVtgZ9NdCTf7QKT0lb1Mjgpl2aY2QpyHcvODQSK/el5VA9Qd0T0sR+OF12e3AVHcfPSD8IQEF+MaMNipa9Akm5OocoiwPpm6FCoCzlF7LAfSPxoDuq/PYpRmldYDaXESW4gt0NmtNEcJgAMas8mri2ZwldlTq2OrQ2KSZq75B54AZy8faslZKp/p5kDRurC0N0UKIrzmBiugQcieTK1OzU8k51LeHev7QMFVfxuqtoiF+qmkgzFSXAt9RlW2W2Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ6It7ceP4ge2wwkA2QHQTaGh4eZZLUU0skN0ZdcGT0=;
 b=ApBMHSeW5M0MmmcTdM3vkGNoKeo14Vf/4P5MYmMz55EQMxFQyqYK+Yfv9EWR5dryQ5uUUTkhZKAusvgJZpNAUmpPq8MDgEz0Q6HPN6zFMk93e7MJY63HVbLYFaEAlQhn6BQxReEDnQ9HAKWU589Xma5UQJxmxK7hsLiBkSjKqUo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:34:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:34:00 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:25 +0100
Message-ID: <cba8b29ba5f225df8f63f50182d5f6e0fcf94456.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: b2edee95-c9c6-4fb7-a12a-08ddad0cbe44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+hguLymOY/EvWdgzmp6Ef1R06tviDnnqqhBOt/nW9dzkkZyOGyUH7+5n4RJ0?=
 =?us-ascii?Q?fIeKkVZkBidiQHCQQDV7jlZW2wqs+hKBowycdmwXmv5JGN+tj4BMQdICZjUh?=
 =?us-ascii?Q?i4SrvAGu/0IO2d98M+ytiTx1JrBTsArDr1KfS0CxTE/ww9KaCCxpM5dT5iA4?=
 =?us-ascii?Q?NLDvi36ejZ/KefL1OhQpeNm2zm3b+V23qTIeGcSrI0ki2aoj2lQI31y0MqvX?=
 =?us-ascii?Q?e8g/NLtHD/SFHzFHzWXndUw2u8Hw0FQ+AzfjEKY0BXRT1NlAvv18AtZEXkrl?=
 =?us-ascii?Q?2id92yD91NfcAP2a+a5//kJciWNB6/LUaPIagi2lJmeBddG5P+e258Pidcip?=
 =?us-ascii?Q?kZmQpnInv9KkNBrDG03d7lUoe7XkPtGVdwVf5zcsbktR9JTiugfQXcuy2GYB?=
 =?us-ascii?Q?8WdjjdUJqSyJ0BDtcMDSDf5pQ3VPNBvHy5fYxtgvxQOM/vfqQBtJfNw2m91u?=
 =?us-ascii?Q?l0s5BIVr+0ML6M1QWdbj7hhfkA9yImzU6yxmaOJ6ySVriYyCgHFtvvcwsqq/?=
 =?us-ascii?Q?EOe9abMJVynnBaM0bgHhLQXl2a645gvlXz1MjY9o8DPBheERV63y+8xHA5q6?=
 =?us-ascii?Q?vVSdz5FzblwRH8ax7xq2Y/LaCYrNzrhhI8hU6IdIy7VBQTYMDlYRP3nRSJpT?=
 =?us-ascii?Q?Rhf+qajbqvo0pOOUZLIK8dXzxR5iy4+AsGogE3lAhrOPXwfyWo5lJ6R/BTOQ?=
 =?us-ascii?Q?g4P/oMwuidkvaZkHzmSbn3zxqG6WE7TJrLjTqRqKcpReo8I3l5SaYj+jlEhQ?=
 =?us-ascii?Q?VZOFjeu9r4ZJRXRDucmolZIMMXKdxo3iC+js0eoHh7phPS5HTQOJQESu1TeF?=
 =?us-ascii?Q?oosw/0AuiubZ8FNX/krYqF4gxxLPCmoeirtBCHl/3wM4ydIAGUIdmAHQWMpI?=
 =?us-ascii?Q?qiF3+IlVE7QVdXDwaTXpKRceF9aHid2+5U02yYwLt8Xp9NfrT62CWdI6/BPt?=
 =?us-ascii?Q?vCbMx6HvE3T87P1yoWm1rYzd3Fe0YGObxcxz8FM01JWcjMV7sxoIv2V0qdHB?=
 =?us-ascii?Q?DOUSECl6OBdeWoF7PsE5/WcV49ijRyEBhR0Gb0fKhi4xySWRvGNPD4WSTcxH?=
 =?us-ascii?Q?kqAJC2te8afQEApsM8D0DUUD8KMa24m34aBo5n4CBRQaWATJAFEre7ROF/bw?=
 =?us-ascii?Q?HJN0F1od56IJR2LMlZXdgstNCuNBza8TgaMtVrOyV8z2p7lZ5OrX/1cSio1k?=
 =?us-ascii?Q?CymO8Q9pL3D+pUv9KAUW5ccZZgRwquhR6moRXqqzEO37uGlDAmIRSlnokqsc?=
 =?us-ascii?Q?8ZZnKUkAow1CBr4Se4sit1+pveAEPijHlTIPWhSmOyPQ2CNoztInL3Ezdwdo?=
 =?us-ascii?Q?fKMmTOn0UI2/ZnS6xUL5brWroYdgn930TDGNwEPgNKs+jjfzqAyOwbqtt27T?=
 =?us-ascii?Q?GWmGcwbDdo56780EJbKGPAY9bggA/fkmGIkKrmYJoFKVmDi32v7IFHw9yci1?=
 =?us-ascii?Q?pVDyf5Tv+tQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d6/hj6clz674Miyb/qtgjiAlPXVtQX6PTv1eKcrp6Hye8t5ebzWWDdzjE/CG?=
 =?us-ascii?Q?eWFmAMTZcT1B0FD0nR/52bJ3A0+N9R3bbI5Znnl+DmTDLeTpYFuZgeI9DiSS?=
 =?us-ascii?Q?8rNlR/GQm2WQJW3MJDFRZP42SyuVkda9Vq3TmnZGjg0nGQ0ahzXK48JmgUos?=
 =?us-ascii?Q?lil17CR9TzxMQ2uaCU1mCe6okyV8xxyf4ofG6U3bWfbjrC6dax4YAe3N4P1A?=
 =?us-ascii?Q?8Dhk9ckn0HVILyoqpXUqmmIqUIDNcgGI6WETDQ6KUs51Tqn+6nRul/Ipu+E0?=
 =?us-ascii?Q?q7MvFQ7Piz1xUJRGRHiTTHPJEPoya8T6xc8Tob32c0DWcaOfbrp/4RZ5mCbO?=
 =?us-ascii?Q?QMe4dWYMwze+z30+Asw5fng2fqylSmsz/sFjHErCQZ/hGY7aZzva5jydihkL?=
 =?us-ascii?Q?wauvSt2dQOvKhTVVLoyV2wOOwoSD46PIZDWbJaT25m3beTnce2izbq2dhDsB?=
 =?us-ascii?Q?NyGF1jiCk4XiL0thM58xowepcqVOHGO+07NwTDHmJAh0Wg9taqfs/rjU/s7h?=
 =?us-ascii?Q?kvzLEXNP6y1lcydCfSeVySTgav1SZTtxacKjovP1uld5a9dNdu4AH02VNhXx?=
 =?us-ascii?Q?02I+s/BUSYrkG2/7wmF0hAUy5FxOHtU3r4+TJ434I0K1uqtBYuqmM9J41Y9e?=
 =?us-ascii?Q?dRGTR7wU5d80YuCHH47BrHgKwA44XC6dTnjcHFYdmLgdHwEOu5h+ACWRgoMy?=
 =?us-ascii?Q?iQZvubVhnMuzghsmhsLiBDhBffPK1vQuy4MHYMrpilpgZuljH9vCzMWzaJxb?=
 =?us-ascii?Q?QPOzXtj+MgJCCmWrXlUw86xxA2pVQzc1tYbfc0aTTHYkoKzanP5gGDZwspT7?=
 =?us-ascii?Q?xYizOcjBs3O0WRiH3bJRAIUDrYqo5oErcFpDu/fiSvS9o57hvI9Pp3rNJZ26?=
 =?us-ascii?Q?wQ/1psEk3Hly92xWd3SRFtlUvJ3yNHQo39SicDzJRDUJ1G2/dZwTXzUE/2zR?=
 =?us-ascii?Q?GpkVAtsR5bDSo1SKJG2F9Z0ydSxMZIk4spu4+bQ6wEWmZ1ai/hbnJiXWczvX?=
 =?us-ascii?Q?XD0olt6YBhEDU3QGsyY+2OwlE9QxaNoy4+GVFb2DyjajJcWFjyp68FWN9fKH?=
 =?us-ascii?Q?WqXIrZPXxsrz1Cfa3zn+xrBVF+l1UHPYtjTK+BODUOuV4hcxskhRvY7NdJPl?=
 =?us-ascii?Q?acAYEmBLNK8+juZM2t61v6ifUINeiXKnygk/U36sZn67vOdJTol1oS3XTOP1?=
 =?us-ascii?Q?/7ZTFmuYlBcsqs4BJ8ZxoLkXiea7oq11TbE8NMuKTRNFpb2gb3/gQbUu6UZF?=
 =?us-ascii?Q?KnhKsA1kK2Hu5gIr2zOAMM4/bWBXz0WAIC7g2h1QfDz4NfVObhvXuF3hAj/S?=
 =?us-ascii?Q?iPWexGxLm+qje7LVFJw9srFoA6uK5ZKdR0dije8SuqNoK3jq/HU+cZsYJz8X?=
 =?us-ascii?Q?ttPgEwW3wuMrDlJjcPn7ScSeJtrc8c0gSe5gpGQSy3LoXVBC7K3Ts1zfXTwo?=
 =?us-ascii?Q?F/bHRSR05qie0f7NZMq426ajB0QOnLie+iXVmfEy2V6HtkAUbac9/Eb0L1Mq?=
 =?us-ascii?Q?iuZCs5pK5yIt4mw9mIvwkWbu+l+7MxpGSI6Y4gP5HP0/PD3J5RUg2Kk2X1Yf?=
 =?us-ascii?Q?yti3rbeoINL6QwV/GnmwWtt3SFM4hLCynw8kH9NZeqAqqHRFwGXiEgoGSLtk?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ybPTQK679yBBkUjoVIxbPZ++XcQIekyBwcBZqvSteAtyjz0dCyYsDQc4mxzXYoTmFru90ncppXGq5tMk9etjQRadWccOtIDuV4Yu7uRY18IgzjSoVVsM4HKTGu3+in2Qy4IHLZ8JZT/kR9fru22f+PnnwY5OTS1xuuhaF1JyVWsEts9QALxYfEHj21wEME9v4GzWXIi200F7Byr6804ZWBNK0r/XytuBYr5CoyH8yrcuwwuB8H4blTSnGlg2YfbjT/mt0ichK+tyacpaYCdkdcpf/98QqykhEMbo7clKywBLoTMcMqia82NamvW+je7v4Zp+0VxZlr7+zCMGV4NkVgi4WUikMjzWV8GR4c4s7S0dzMkBDgRjShm/uODWvUeqc1GIgRNAWt9n17fYMcEDjIype2aIp5vslM3MjMaSWYh21p8cKvGokHj/M0XuJbkU9T8USh7fnETlSdKLqMik22K1A4D4JAc0nRLoD/HvTFT5m7HpUgb1WCcZ05O8PAaM4YThAM5Unu7kdqwqaOnBAPvcwu4aUfybRmdRYNzuVqopbnTcU86UIXf4YFf9PrdvH8GgcE/itP7dFKrkOLjDDw8DhJNNdkfmSLIKwhF9n8o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2edee95-c9c6-4fb7-a12a-08ddad0cbe44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:34:00.0846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ck7ZvcvJ3VZmBI0c3TIQXbs58RUEZeYrpW6SPMLYdEzu+ceW5HOiT6aksoRLZ9TIKW+1MdoD96tt1JMqJDgJTZifT0/xbKBNhDqNyS6pqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160134
X-Proofpoint-GUID: UpKOwF7mhYOMHxwVhpYG41iXT0M2bgck
X-Proofpoint-ORIG-GUID: UpKOwF7mhYOMHxwVhpYG41iXT0M2bgck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfXz1O2Ok/T8jwZ
 T7zYD3c4EUTrtZtEAKK8PHCeZJrMnnUOfpn716XOGKyV+BnAeGNU58uQuz1fhggnchGkL3gXbyW
 Kii5IsXJ1uD9koceBBddFG0P4Y8cgbR9qJMefZeug9pxqyXs2C9xEcvmlOBEe8JdaU4lhL9S1fi
 ZrzoyvEI9jBobFhC9mJvAVcFpjZ+MAkFnKBA6N8mlWlz5yRXhlk73cjLYSC3Uq+ZotBWp8SjfPT
 UXm7XPIugoPBNIkXKVqY6PjBnFnAm6j7XB04DbyWQ6khuC0aOIP/07ePCVMd/FEps4GAUHQeJrP
 LVmA2QAbMKwdTR8Bns4iUjnhTqgxIOV/SxBJU3F47rx8rzADaUPQ5by5qmxTK2r2ybOGi/4gfTa
 xUZmOllhQZVmvLCbFzgih56n3vQxt4ZGHtFU85NNfcoogzgctlp8wDlS198c2Z4C2SknQGqA
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685071ae b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wP1-y75VcYHVbZsH9DcA:9 cc=ntf
 awl=host:13207
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare()
 file callback"),
 the f_op->mmap() hook has been deprecated in favour of f_op->mmap_prepare().
 This callback is invoked in the mmap() logic far earlier, so error handling
 can be performed more safely without complicated and bug-prone state unwinding
 required should an error arise. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFba-0008JJ-5K
Subject: [f2fs-dev] [PATCH 06/10] fs/xfs: transition from deprecated .mmap
 hook to .mmap_prepare
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
From: Lorenzo Stoakes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
callback"), the f_op->mmap() hook has been deprecated in favour of
f_op->mmap_prepare().

This callback is invoked in the mmap() logic far earlier, so error handling
can be performed more safely without complicated and bug-prone state
unwinding required should an error arise.

This hook also avoids passing a pointer to a not-yet-correctly-established
VMA avoiding any issues with referencing this data structure.

It rather provides a pointer to the new struct vm_area_desc descriptor type
which contains all required state and allows easy setting of required
parameters without any consideration needing to be paid to locking or
reference counts.

Note that nested filesystems like overlayfs are compatible with an
.mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
compatibility layer for nested file systems").

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 fs/xfs/xfs_file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index ab97ce1f9087..f7b76647d675 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1913,10 +1913,10 @@ static const struct vm_operations_struct xfs_file_vm_ops = {
 };
 
 STATIC int
-xfs_file_mmap(
-	struct file		*file,
-	struct vm_area_struct	*vma)
+xfs_file_mmap_prepare(
+	struct vm_area_desc *desc)
 {
+	struct file		*file = desc->file;
 	struct inode		*inode = file_inode(file);
 	struct xfs_buftarg	*target = xfs_inode_buftarg(XFS_I(inode));
 
@@ -1924,14 +1924,14 @@ xfs_file_mmap(
 	 * We don't support synchronous mappings for non-DAX files and
 	 * for DAX files if underneath dax_device is not synchronous.
 	 */
-	if (!daxdev_mapping_supported(vma->vm_flags, vma->vm_file,
+	if (!daxdev_mapping_supported(desc->vm_flags, file,
 				      target->bt_daxdev))
 		return -EOPNOTSUPP;
 
 	file_accessed(file);
-	vma->vm_ops = &xfs_file_vm_ops;
+	desc->vm_ops = &xfs_file_vm_ops;
 	if (IS_DAX(inode))
-		vm_flags_set(vma, VM_HUGEPAGE);
+		desc->vm_flags |= VM_HUGEPAGE;
 	return 0;
 }
 
@@ -1946,7 +1946,7 @@ const struct file_operations xfs_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= xfs_file_compat_ioctl,
 #endif
-	.mmap		= xfs_file_mmap,
+	.mmap_prepare	= xfs_file_mmap_prepare,
 	.open		= xfs_file_open,
 	.release	= xfs_file_release,
 	.fsync		= xfs_file_fsync,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
