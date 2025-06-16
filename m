Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D1ADB9B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bdPyMbZomw/IsO/TO7W/NKMvRUcfBhK2OchjNTsPig=; b=dMOuAoZewcRXYDxM5y4Lqlvq1C
	BIVhBe2CI5kPKFY+dy65/553MmKpt1AD43UZV7k1lMcu62vXy61jCDBhLxC0qdZuLijYm+HPJEOpP
	cY1pb/FvvSRrEp8tf2oJVf7Q2AT2wVmG8lsxavFnv6pNwgn/qS4xVGM8am73s1jlEGrw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFc3-0002t0-87;
	Mon, 16 Jun 2025 19:35:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbT-0002oP-OM;
 Mon, 16 Jun 2025 19:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OkcVOJolnz5KIPxF3XETf1nbjZvW74UpRHbetRk6v34=; b=YUmdLIgJM4bZFWcPBJo7cckkJd
 pZ5xY0Jbcfpv1t76VxxO7bXoeOhjKIHEw2vS0kbpgWGdY885UnbsA8FPYEdRPM32HircvyJiTjzS8
 DsLEevqul/iqz9YQTDZJiH2aQQY1YFAN9FnLlL2EMerv79z+PJcTZ8iassh0U4Lhfjno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OkcVOJolnz5KIPxF3XETf1nbjZvW74UpRHbetRk6v34=; b=RlRxkU5sUhIiZtCczsbGm4zmCT
 xEJaegy6Rx0kyh5WND1bO4UkGXR3JCxZQhELyr8Z9IanclWWxow+izk7G74Ca9ZXuV0A1VPvU9v9F
 9OFKr2cYf888+7PDBy2OpIRhVqtKxWMwbANXNsDzQRp1Vh1A1T2Q1VG/pOWL85qCXHJs=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbT-0008IT-6Q; Mon, 16 Jun 2025 19:34:47 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuVFY027767;
 Mon, 16 Jun 2025 19:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=OkcVOJolnz5KIPxF3XETf1nbjZvW74UpRHbetRk6v34=; b=
 o3wz00KPuemHkOiLs/WxM9vDB5azgAW3hzLgEDtewfFJFYH25iYJfCjwPNWkHWN+
 DYXr2sDx+SNYyut1hhW5fKQ32VW5TtsQqWMkUwtVSG/nr+DLFstLhqY+ygehdjOf
 5xNo99CdwZfDi/AKskTCXcihNb0GQlGByTwlMxq2b7lELylnLFihF/kbJh8E92wC
 GR80J0k/q0C7lTnrtwGLEfDOl3gf9ntbrJgIG3aA/g5tqrY6PK3oHqsBR1IkGP/2
 Pbm/0i23nB0GR+9XPw8yDwL3V9lisi04oShpqenKQW4cjqYf1E9dhYCETAMX1pAa
 OHZMaM6Sp/Fv/9yY/QKvVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxkph5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:56 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJAKnc001648; Mon, 16 Jun 2025 19:33:54 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh8bqb0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCMOnqxgp4s0IZF0RH6W5WRRogkEzu8FoNGItzdQGeNH3K6/fD9Pvr/P60kSXzYbnUwGkYLbETVEpNyCmfGYL5tJ9rM/g2UAN4VBqlXnch6E2ytpEsZGER26brDGRPuBXI6iDIvtitiNgxjGiY+qSSOqRpB9tcXSk2/EE/zsT5zlrOlUv69uaAG6w6hnFZ1GVrGPqJtRLDntqZUr35ygii3rPV8EY3tLSGxzZR91lC7R+821380QQpQ+pGAn8k4uSWGZnp0Si80w3hrPRVyGN9yj5izMW5bJzb3HB6CzmO4p2Pf8xjWE9sNUa86RX/6+Fq0Nq5dGr6g0kDspyqt7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkcVOJolnz5KIPxF3XETf1nbjZvW74UpRHbetRk6v34=;
 b=OHCRkMtiAjUtNxWgTc1inJqDHm8VcZfInMg1zNLG/RruFn+QjwB7CHPKyPoZDKR5bU6RRXHApTLValAtQkeo16ScdUZn0VR2SsNJ5NEEwK35NuivG6P/w5vnGfrmV0E6oIjLVAEbWPLXRFwKM6aw4uPm53RF+/Hp668wP+Ohjh09gWe5HTzEcl+dFzuZXOJ1Li/L6wFCDA7llDbVgc7textToX8YTE970SGw59JNVu0AbdToXTEQTFGG9jAG9xCxXg76QeN06glJS7Hvycg9H8nKNZ1G5vU0/g6ViQl91QRZpcBfBFIKtB6B+alkcyZAW9vJfFYsEHgUzvQUPSG4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkcVOJolnz5KIPxF3XETf1nbjZvW74UpRHbetRk6v34=;
 b=djWHsyntllUA/R354wb1hkzRECPC0Z66PaMpFWwSlV1y0ZsvVNKgYX2iJcq22CqNHx5zfnB8veBffwOsSiiFNoN2hUy2drMBGgmRLzmIgPIj5B5O4m1LhvocFsUotuNV6Htj3USQJe+KSrtI/DdvBdGXRekH59gLTJF3/291tV0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5870.namprd10.prod.outlook.com (2603:10b6:510:143::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 19:33:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:33:50 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:22 +0100
Message-ID: <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0571.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: f597330c-860f-42de-fcf8-08ddad0cb86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTaImiHE2zItLT5+WfnXoe2XQyDjdfT0/w281mG5w4VtzXJPPCnRsMn6zQ/k?=
 =?us-ascii?Q?DovwvHKRTTCiEkhksxrN8sJypZqS5NBTgAUM4XYSipZfE+9q0YZvjZlDXOqR?=
 =?us-ascii?Q?WqcIUPipsR5o/4DKPQN5q1tLhJF2sgxAKPnl6ld+XoBF20yUrjgkkmxO2xD1?=
 =?us-ascii?Q?h+k7UGL+Fn4pgVezGCvEGvG3TBnMJimNghCqk1rsXUBt4kHkmaQzrhKhDO30?=
 =?us-ascii?Q?qYsVD6y1QL2qIfuiwFoTxop8vMttVX6QzEZOvuvPKy+PeMX1Qcn0mo9FnJ9w?=
 =?us-ascii?Q?bQnQuHZZ1/996fpkGHxFnwWHVONVp/bdPRzLSNqV5lK4cBlkAvr51e7+oC8h?=
 =?us-ascii?Q?Ek1ky8EmqmE6ZfB5DKAJfHppO/8IDXfRYfBvLOY2A3NFsbJm1P56PZenVSqg?=
 =?us-ascii?Q?b5ZZVyukLc94eG1WqAZqdOqgzxQG7tiSS+KyanMlduOm4Xl/QIJPdkWHHub2?=
 =?us-ascii?Q?uCmTC++nDYBYnoDPOW6lO+5abJaStm7j3l5fiE41yRuUjIDkbdPcEsZ7WblH?=
 =?us-ascii?Q?uNS1R0j2bsgM65/nlreMpAfhhSVQhvnkMU0b1s25TwF37x+NUogMPaYfr/Me?=
 =?us-ascii?Q?Zq7dgepq8QmL2HiVZtE62StvtUFos1r0GaSjcFQMGJFDf1yZ/PWiispkPTMI?=
 =?us-ascii?Q?Dt7nP6WTmiyXLt03jIw29xvtQhwen+x7vOV8VjzNSJxjZ7GOZhAMPflx/T2c?=
 =?us-ascii?Q?nTKJMB81Vx5sYCweXySW+nRgRhk2VBqAi+fmhwH/MhAIsXydmhdyJ92/Eklb?=
 =?us-ascii?Q?nv1TeCKC4c4Kos+XWODRn5l/x6+J+ttFuNf4AH5My0no1hVkAQKK4aPo4pRf?=
 =?us-ascii?Q?WrtLNlZ2GUFVOsMeW1h3loFQSm9zokRsgq58SdA5NNvnmewNbFq2dpT6WGHB?=
 =?us-ascii?Q?yW5J8AycsJ4yZlPgYmkCaqI41VKNAR8VrT/PR/MdeJ9c2WsmwVyY3HpTTWD/?=
 =?us-ascii?Q?ss9LQiZsi1QVTf7Re3RxNJsQxkhJJZyulpEXrfmXm5iF+1xt7ejH6IjVlRI7?=
 =?us-ascii?Q?XEBamg77DvJMc08YynCrccRAGRT/2T4JNv5xrXeYgRH2Yuu++OYebi3QKyCl?=
 =?us-ascii?Q?sk7ezm8owU0LozJBZczzpXUrbKdWlzsnxaVKYVMeG40ke5bWFHXIauWic3Hi?=
 =?us-ascii?Q?5GguFZfrC4P9ji1qYYa/xEdiAjnxwZJctzRz7ADBKh59aogDcXuWMZNEopOZ?=
 =?us-ascii?Q?FYmg9XQNAwcPpc0BzDOcjumn+4OT76KIeSmedt4sSyCMLg/J5azSwHEfOuoZ?=
 =?us-ascii?Q?CG0mfKfzfnIhIQd4tIvnKqdZ6GGP82YPtp+zqxbwntre3oGyndys9OUDcEJP?=
 =?us-ascii?Q?QragMZJA1KR6lQy4NsGeDCh8czZRLnEpvFpZaNOt0cvf8M4TK7OnQB522bgh?=
 =?us-ascii?Q?ofUiBruO78utRTy1qOk3S+LTfHS1yVBcw6LFSA0MNCoyhTRRz4wzKpkVHHaE?=
 =?us-ascii?Q?bvWqoPkcAEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/2slln6RQ3COtSAcVNM9ZlQ4Wj/a8KFhj8wyhM+HTP76wpgjunQaSqQ3pZ1?=
 =?us-ascii?Q?NCelXpZlnVGU2VM0SyvnzhAufe+4Va387Icoj1nrwevoicH1feTRBpKUetxC?=
 =?us-ascii?Q?pYR4pgE+GdihUHSqEtT+o2WXSeE07U30iS7jXhToKwUs3naMxNZJTh+e/m6u?=
 =?us-ascii?Q?uIuPniSQM41Zop/6JF86U14btOahfAIr6IEUl2N8D40FWwQ4Xo0Y4Akci+N7?=
 =?us-ascii?Q?GBpOPpMReCRPVj++1y2ho8IsaSCBUOPY6upL92AwX+6C4Zto12k5dG1Ak48d?=
 =?us-ascii?Q?0NaQ8r7gHm98a7hOaHvgOMxdT5dKdjX7omqhBiQHfjLLxiToDw3sHIafTYsd?=
 =?us-ascii?Q?4CnZE9gE453VlKqNXCLzz3d04HE6ZsNbBpT487G7aCXniCSzrqIS+SVAB2q2?=
 =?us-ascii?Q?EwyN8yQxApy+NAhBwanA2MQ3fPcFgJeF7PdjsBx/1fZnu7z8FQGi+HtcB1fK?=
 =?us-ascii?Q?5q0spXWqzORKIlQPdgnMa7ZqdA4R8n91iIfNZBcvXBLgp20JhIF8Vn7jSWPu?=
 =?us-ascii?Q?gDhvk0zPUl2GkiCZr21DpdkK/sWY5UGPv/ycMlqvtHiptxQZ0dRyAji6f8X0?=
 =?us-ascii?Q?tmolhaU0z/F8tYH2jIZBD2W17ntSSZaam8qh3oWqfLj42CMYw1qhWQZUfmPM?=
 =?us-ascii?Q?iepGATqvDSg1O32MwkeagWHuESwNHITAgzfc1TzDGAn2CU0k2/VSvOjcpAD4?=
 =?us-ascii?Q?LJeIYgAHrjDCY7jVURgc+HZyISKecvrP0yY5O6+tE3AGrGmBrgjlU5ruWBkS?=
 =?us-ascii?Q?vjv9ws06eSb5EnkKgzEj8ndnpwx1OtQMhLIQ8sK6aNN0EApFhXqwgK3PKhEz?=
 =?us-ascii?Q?L8lGDivRoNSHPqwIRnbjYkTyMaMar96L9BXoWGlxrNxKjioYUp2Vc4fGRHuu?=
 =?us-ascii?Q?iuhPhpqYn8Zv/PnyqP/8Zs272IsfZ8qS1dW5p/O1U66+r+SCXLhl4WChQFMn?=
 =?us-ascii?Q?35uciok+GuTJpoPmqMa6Ua2f93vajC3H9nUm97b5tCDAK6jbZkkTFdGKA76p?=
 =?us-ascii?Q?JMtYaJ1+XDWAwc1CVgl/VgOdJP+QSA3VEfL4BRm5L2Eki5Hl1Fg1DTm1ipzs?=
 =?us-ascii?Q?VP+10AtNEkv9Ru5UV+4q81gD6Scp4QO6zo5QhvAWLbDFUlTNIq5VIRP3mYsd?=
 =?us-ascii?Q?VSOAaIQ6ifet5B5P674A4wd5h3OqChdSsX1ZGxfBU6y7gxGtDoaJ+GJAmXYN?=
 =?us-ascii?Q?zWMN6VvUtkAxkMNwa1a7sFAgv7O69w1aUQ4RfJMqvwy8DyYNu8h9sPzH7TRb?=
 =?us-ascii?Q?FrdWgU8UQDCDhR50/hPgxPpcpOhPRT0kV7OrdN39Mb+MEMzhy7JQ9uKx91LH?=
 =?us-ascii?Q?B/sWQQl7QwzwWkfxgmbVizgqwiwvqyoJI5nwFsk0q8k+KWHXPnl1s180R41F?=
 =?us-ascii?Q?S3mPvbADW5txHMx1Zb+yHOK/hnQNzcOjwaespqsdI2v7EOxl66+zbymHZRoz?=
 =?us-ascii?Q?ne5RPlRAQSVYwcVSjLvtQdS97N5c9H1ZdocK4LWKWv1giMyIJwXv+7AsJGFI?=
 =?us-ascii?Q?fcjoQCZc6GL8JZXtX1INCOoXbkpgCw2kiwEQ+Ad0I26Gx4Sfntiq65OML5FR?=
 =?us-ascii?Q?0g1ATQD1DWuZsMuusbI2yGAV/xsYjI59EK6eDBIKBfmuMMLQIrCDrzQBY2he?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rnjxcdnFRdPJG2fTGc1le/LGVjzK7+fvVQFuOCgcrqX2TXlcu/TbEw63K9/osoJHuVyhQoApu+oDZUB3HI3ycsh4iXV7kNAW/kGqaZ0Tn5OlQ8dtn0uTGO6gYLoVHH/Ywtv3yoVjiGzmjDfE5Ibn2BwmPYvKUGCndWyo42F6piyeQsEJwU+DnptC2MMAv1G3QxnJfHvzhxmenBYCj0gcokFb/D321jLCRDw0VjRNr4OxbHB0DqSW59QGUn7kHyJ/nohIJHrh0cn/b7bnUDDjB6jRwpFq3rR20uwiaZmKwJ6xF/twmBi2f20/x6orrPgugEaay373dXv8s3X4u+yR0oQBAnmpWcHjqGGZCCES8D+MmWvIwD3tTOBuDYcHxT18kRoClJAjVSjI9LZwBCxgzsEsD79yAis3oOolzon4LDKeCHOtEggjcHJSBmRbsKb+H/zb1jdrCyJVCD+PPBvijdjOYh1zio879sbvrTX3uOWu/w8x+V5h71R0NAyK4446sulk7YYD3zew6FwvmHn22rOMFP/IleBCf8dWviOKGbDQExafq9JKlG6ya7Pl8ZyP6CpKtOdHR09teL4T9AwcT/v1i/AZAiK91gG2lSmgvxM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f597330c-860f-42de-fcf8-08ddad0cb86c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:33:50.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhcnPg0S+6pAIkECvW2/GpO8lBue/T+iuq8ZcnRHL+r0bi9OULxxZrpOJ5hrDDu71cbyjrsseYr1EpexYsE17l5A8BNyPqvSBK047uj7zWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX/C3kdm+QGlp5
 Z0JKwPmf3yRh+bfsbQz9z59M8W8w7XB6Ku9w6ZiLYBqPiF7PXKJZItYY/b14iGVI5u17DD28B92
 5Drr1XLu3Ktbhunt6gEK0SCvcx+p7tI+n7zPKKYpqvv6nOgqIYTrCtyqPdQfe4uIamHYbOftrza
 ldmwEU+vpcmVKE5WkhIqZ3r5n0FGWvvxmj2T5eIDqalkgnBB/hqT+1/DkyQEh89H5q428hNRfZ2
 yqcLGUyyNDOUPBE38nuctITDmc5RpmjVEziuJTwI3D3eSZlDVxvAMoW6jtNzEjLAfhkgJ6AYPL6
 4y92ws48uA1RYqJ2WgBT+z9TjVZPuz40XBdIVp2tKTZgkJ1PxAk1hFUCyKVnEI7Ne0QiH+mHuXF
 t5KaP6D6Buwy6IoRVNcuCwrhWxk1w3pvaFCyIpb3795X9EB/A0E+9gqQjjAMmMtMJXma7Wkd
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=685071a4 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vxWm5UkIwlaNHXKCl8kA:9 cc=ntf
 awl=host:13206
X-Proofpoint-GUID: UZdob71rwtJRmbeanNWK_zhgAJ3uOtfD
X-Proofpoint-ORIG-GUID: UZdob71rwtJRmbeanNWK_zhgAJ3uOtfD
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
 Additionally, commit bb666b7c2707 ("mm: add mmap_prepare() compatibility
 layer for nested file systems") permits the use of the .mmap_prepare() hook
 even in nested filesystems like overlayfs. 
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
X-Headers-End: 1uRFbT-0008IT-6Q
Subject: [f2fs-dev] [PATCH 03/10] fs: consistently use
 file_has_valid_mmap_hooks() helper
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

Additionally, commit bb666b7c2707 ("mm: add mmap_prepare() compatibility
layer for nested file systems") permits the use of the .mmap_prepare() hook
even in nested filesystems like overlayfs.

There are a number of places where we check only for f_op->mmap - this is
incorrect now mmap_prepare exists, so update all of these to use the
general helper file_has_valid_mmap_hooks().

Most notably, this updates the elf logic to allow for the ability to
execute binaries on filesystems which have the .mmap_prepare hook, but
additionally we update nested filesystems.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 fs/backing-file.c     | 2 +-
 fs/binfmt_elf.c       | 4 ++--
 fs/binfmt_elf_fdpic.c | 2 +-
 fs/coda/file.c        | 2 +-
 fs/ecryptfs/file.c    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/backing-file.c b/fs/backing-file.c
index 04018679bf69..5761db9a52a9 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -333,7 +333,7 @@ int backing_file_mmap(struct file *file, struct vm_area_struct *vma,
 	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
 		return -EIO;
 
-	if (!file->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(file))
 		return -ENODEV;
 
 	vma_set_file(vma, file);
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43363d593e5..a6750bd9392a 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -646,7 +646,7 @@ static unsigned long load_elf_interp(struct elfhdr *interp_elf_ex,
 	if (!elf_check_arch(interp_elf_ex) ||
 	    elf_check_fdpic(interp_elf_ex))
 		goto out;
-	if (!interpreter->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(interpreter))
 		goto out;
 
 	total_size = total_mapping_size(interp_elf_phdata,
@@ -848,7 +848,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 		goto out;
 	if (elf_check_fdpic(elf_ex))
 		goto out;
-	if (!bprm->file->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(bprm->file))
 		goto out;
 
 	elf_phdata = load_elf_phdrs(elf_ex, bprm->file);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 9133f3827f90..699bb9a65c27 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -109,7 +109,7 @@ static int is_elf(struct elfhdr *hdr, struct file *file)
 		return 0;
 	if (!elf_check_arch(hdr))
 		return 0;
-	if (!file->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(file))
 		return 0;
 	return 1;
 }
diff --git a/fs/coda/file.c b/fs/coda/file.c
index 2e6ea9319b35..eed45a80e9bc 100644
--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -160,7 +160,7 @@ coda_file_mmap(struct file *coda_file, struct vm_area_struct *vma)
 	size_t count;
 	int ret;
 
-	if (!host_file->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(host_file))
 		return -ENODEV;
 
 	if (WARN_ON(coda_file != vma->vm_file))
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index ce0a3c5ed0ca..2bd50d1de5ef 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -193,7 +193,7 @@ static int ecryptfs_mmap(struct file *file, struct vm_area_struct *vma)
 	 * natively.  If FILESYSTEM_MAX_STACK_DEPTH > 2 or ecryptfs
 	 * allows recursive mounting, this will need to be extended.
 	 */
-	if (!lower_file->f_op->mmap)
+	if (!file_has_valid_mmap_hooks(lower_file))
 		return -ENODEV;
 	return generic_file_mmap(file, vma);
 }
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
