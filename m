Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC6ADB9AE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgV5PwEfivS+kPYHscNMMwWyRyzghO+iOblLLRprKGg=; b=Q6F6uW36TRpw17RwC38bJFBz1Z
	+yTgHNpdYJadjTfvTYD5srd3rReM6VzfCYc7gB4BwsTj6I+5dmi65FcprDxrC7AyaGFWkOsJmT7qh
	2rw/TDMTXQBSn5OzzxYGUrWck56C90Gp/M/H5hVBVYIKT4o5Z4EdknmW8Tgs+Y0c2mOU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbp-0005xd-NR;
	Mon, 16 Jun 2025 19:35:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbc-0005vx-Us;
 Mon, 16 Jun 2025 19:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0Y1Vqk78cqPEGZx5uk/nzDNc2etT5n21kmOCNhQxrU=; b=YOs2vLbbuQ69EO06WEw0l4KeLP
 rP7Hqe/T6qua7rS77qWwfmX0JMQR4CcSLNjMgR0aUZDr1fWGEr/TstTo4lf+DLdqzjqzZ/ta7X1Fe
 f064SdYiOso7FRbhp7N4HunH5t1xOyBF0bUM5rJne2S8eNf1vuO+yafghSbItsHpAgYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n0Y1Vqk78cqPEGZx5uk/nzDNc2etT5n21kmOCNhQxrU=; b=kwJvjHDLkV3y5Tr54SYB81kneu
 iAxXH6KHp5sjwymLaq6+pGpXgfwUYWYY9DgcbjzBDOWiKEuVlUJrOIz/3wFqhMpHGSpZQG+cSXlOR
 cyJhLMViF52GEypcWeisnOwMnMyK3REabcJDPCIgzpFTyvNP3hvTP4JKUzcx66vfEnRU=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbc-0008JW-CV; Mon, 16 Jun 2025 19:34:56 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuSI9017860;
 Mon, 16 Jun 2025 19:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=n0Y1Vqk78cqPEGZx5uk/nzDNc2etT5n21kmOCNhQxrU=; b=
 MlGjWMl+c/xN7ErrkFpwQXjsbu1lYmZ+eTMb3OrACYfz5+MNL83KJRT4K6ajk5H2
 MyFRXHx8pkOk+54GUyrtvXtrBpi1tAqNMRATEq9O7TS48q9oOAtKAhejH3MiGcy2
 xAT86rIAYNQo8lvTaWDUTkw4QIoS/0tsvOcZlpQ858wlI2DFERNludqSB96Ri4ef
 EoBW9/CaC+O3fXFmSnQSS1p/rMz/+s2HnEreFXC1f+fUafGrVKPcJA3gumDuEg0Y
 IFRYmlsboAmrJIv2+hsz9vhw9RAMhAVrvtGjnY58MUftvfaves2J4GqqN+YN4zor
 U4Gdgt7MHdNiNNF/N94TNg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn32kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:04 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJREO6036434; Mon, 16 Jun 2025 19:34:03 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com
 (mail-westcentralusazon11011031.outbound.protection.outlook.com
 [40.93.199.31])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yheuf7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxSFpDW0/T92qZGppPDKVSTWnxz7ScSmTXrIp9avaZTdFXnIsGhASY++S/rxVC54ovftftHrXuImc/i4RjGt5R5ZkGA3vnkZRbwhh7p//+/MLeEVFMswbBppb5FPMi5+zhQpSNLBwfeXrjsXpyXyKiGAnBucNL5hEHP+taDJWkFFW7PSdLa5adI/3WPcJtw91mpELDQianDdUXbZif3bt7E9VYkXlf35htDEbmXIiD0Qh30er1M+RFUnM2okrqU4xkrmvuWye9nVMehpWmSGv4cO6dOzK6P4QX7oArOVOGpMptMGK7n6CR5yjtcKcLHCPJqM5mqFP+GOT0IrxCrWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0Y1Vqk78cqPEGZx5uk/nzDNc2etT5n21kmOCNhQxrU=;
 b=KEF5eUzHvEkraZnYy7VKr+h5fJFQYELna63tLpjbgcZ79ou7g6rq+B7LGMG3c7pKi+g3X0kSsqsmwf9KQwQz4vBqtCdFl6oFio0w1qtIAQbc9XlAnapMJznuvcMvvcHzZsNyEEuJ6GTsvyKX+AG5ZwxcGGtmK6SfjoD6kThnOyi/VUfs8rA7ueSK+kipQ3DFiyzW3R1EmIqV2H+WC9Izg4JHrsrfB1QUDO73FFc6Pp31T5v1Bd2aQlY6ulLXXqQsUs4fTcQ3BncNorkqttVwaLLpYmeTYFaPFhNuuTyyiqlPIPAPjkTVn5DbKcuxVrT3MruQCsUWUx6lI+OMKAahXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0Y1Vqk78cqPEGZx5uk/nzDNc2etT5n21kmOCNhQxrU=;
 b=oDwMJ3PppVObui3rd3dyEYtYcbmYY5ANK9I1hVHa71XUonoQ6WpKMTJN4qm4rOp/PSbkqemaMf39VHudHY+deAIbXgFy/HDNcI3rFDlpPBDtzpaH6Ld6KS/id6NIfuhTGSRYMbUNcrjaquVvR9Vy+EXfpKzDnPLXfuCEaTgp4uc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4470.namprd10.prod.outlook.com (2603:10b6:510:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:33:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:33:57 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:24 +0100
Message-ID: <5abfe526032a6698fd1bcd074a74165cda7ea57c.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a6743d-22c0-4ca5-0eeb-08ddad0cbcd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h2Hm6n/g1F7+J5SeMZAMt3bXZmc+0Oq6nEuuIw7aVGwWOgi2tVyA2gctP76q?=
 =?us-ascii?Q?Pba41RAXkArQG05F5sB1tQcZrTf4lxdRGRg5syZ7/q6T6nwP4Pib5/AuL6nf?=
 =?us-ascii?Q?UW/doceDpP60l0grBoO+WwDrV42HN1IMg/v+MMi8uUcbUBr07+yso+VYG6pJ?=
 =?us-ascii?Q?/DHO0JRCGOD0zVuz9hE64mXjkQs1YO4PEPK0Mcgl39J6gMvURyfm1gxJ6aH5?=
 =?us-ascii?Q?eDqN/5/SjCuQKcU3wXHgj1djdD8CLWRTG05Gw0XaVUovRubaU6+j2HyRpEaC?=
 =?us-ascii?Q?VVu2H9KRJ7+77O77q8LJlhU6YXDp6mbVNB0+K/fmJ3pO2/69Vx6wzZ6HwTDV?=
 =?us-ascii?Q?z46i7ly1tBdnXXlq6j8bfoSWRrB/GSQ0T7H/PR3ThIh1ExvIhZnAaTdJsku1?=
 =?us-ascii?Q?BGO2eC5gjyf+ZaYVRnazQWPdf2ixPbeFnOzPLg4BeiGF8dM9JtmDho/+i6dD?=
 =?us-ascii?Q?RdqOK2NtVSJHotPLhqK+FuXZK3Oce+80RmZUaGFl1VlWELli/Eiv8LO4GPhQ?=
 =?us-ascii?Q?jlRXlW7LJs9FEvZgqFYZZdPFTXa7YHmuLt07xRue9kptDpF3R6NUVtgjG5YF?=
 =?us-ascii?Q?1lh9+VYuEmyfM7x1kBGLVXD5IP7mmhkmb21KosoRBGNEEo/SKLEuiagzI4wz?=
 =?us-ascii?Q?dGtTBIMZwtCEzXX5dvwA2AaPPpokcGvF7F+3CezTB/IL8sDuZSXq+d3Bg/ja?=
 =?us-ascii?Q?mlS2hsTmuXbxDitTRO4oHzoUNwWLfpmwp4ufIVdi1kKcmcCxH6e3RkKqqtCb?=
 =?us-ascii?Q?mFBw0YGtwEinUAbJIafxZFZHhm2askb9i1mrU072YgHfi9oKSfY0ZKMVp+aQ?=
 =?us-ascii?Q?+AAMGDHGdhDIEVXySHumBr79MlzWhqDeLCxkUpHnxYj95e7jrKH0CTVhhMXP?=
 =?us-ascii?Q?R1Nj9bZ4hHXWd0kDpGeERtlTs7EoGkax6s3z26apMfEEVYnE+Qc05MWv0kn/?=
 =?us-ascii?Q?3Tg8pIM6TJTC40LgI00kOqmijxcmd2nUDuLwq7sUGN5wq6Gpp3/rcwfTABAf?=
 =?us-ascii?Q?6kOPsygAt2gzR8noBjC5yeHJx2ev+T0TXOBtgkGek7MVALWruP2z4ovJdkwg?=
 =?us-ascii?Q?1qnYCyWBLv0AP/iMFT/A3r5aL5aH44fSh1WdfE+1djIjXM1F8fqtvSd/snIm?=
 =?us-ascii?Q?bf4pzr/ICAyrVRp8g0dXYK9niHLpvs2h7lgFlViTB/OA5EWle/MDER9GsZ7l?=
 =?us-ascii?Q?hSCtyxfL06ZAEwsL+y3AJT9rCrvDcpPLEjcAnLMVkypCuVFK9uSlEQAasM4A?=
 =?us-ascii?Q?xXH+i/hUU3QJTL4RpWm2QIT+8kZEtyYA1DeXViVnQWxwYBWaBhtl6diZeIqt?=
 =?us-ascii?Q?Z9np+zqCqeSI1vFf8fkFHEegptF/t+pTZHN2/rRLxbjNI34kBZffDXv4UYI1?=
 =?us-ascii?Q?eB4Jo9DKxiM/9eM+qeJ0ipz+ZW4ciOonFDBjSxO4ZviBLbpAgUuXBn29Xu3E?=
 =?us-ascii?Q?M1Kthu3G9co=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LUYT98Zc41mIfF4cZ4HsdCiT/km9EMJmvnwfWh7RQxXcLDDm/2QYwX8yi99b?=
 =?us-ascii?Q?sGtnGtCm0BhnC12PncgKNmISwSpZa6HOD/k9c28NeEUda1n78ZjjoRi4OGf4?=
 =?us-ascii?Q?ZC67kOSWqGKvxJunozT6VLIpNp00rnHe3PlGPA0m8ph6fTWdI7bs54NWMxjs?=
 =?us-ascii?Q?T8Solt8haAMMk2FC5gz7hUuXaPqTtd37OqeSW/mtaVRJc/s/Mtex6XOnr8+w?=
 =?us-ascii?Q?Ka8UZ3CttdWNHZWSvrc4YLbuc23nvvDEdRFnN0lKgl9ML90TRBMP4ddtZg8C?=
 =?us-ascii?Q?B3T/h7h0Y0tvWmHinaVbn8PzdCmOd/C2/pG97xqWqd4koe48EY2RQt6qwzUo?=
 =?us-ascii?Q?gonhCbGp2ZXLK0F7UYF1/o2zolNWQuWgqoyw6PTVpFqHW3pexk5qUk1Z9QBr?=
 =?us-ascii?Q?TFWMHgeATkLv3APfQ/50W1dwu/WhZPVZC1R1U5O23oCUnnoEgdZdhYHgCUgG?=
 =?us-ascii?Q?8356lEiwBgARBoiWOeYFmd+bY77CpoazZVH02SpHiG64Z/dtEokyceMNcFyL?=
 =?us-ascii?Q?TVNcStM5tQg3QggTfp7HUzjP6G2o/2HwBdbH09qdQM5h8IOEnH3920Zq5MnW?=
 =?us-ascii?Q?2dKqogjuOzyHltf2iAIioJxmynIrRf8EDpSKDRScrq3xstVoHxfD2HbY11At?=
 =?us-ascii?Q?4Jvw25BvDvxNaKV2UNkPCaY/HLsAWeLscm32nk3AOyXNzAkrlmiOrnTKtzxa?=
 =?us-ascii?Q?mc3fvqv6A40pBMQOeX1EGSD9USRbYEMXpEvZZj1e6TCX9CzG8tXWkr6KHfeM?=
 =?us-ascii?Q?Ojbu6vcfZ5fvOgympzPGSMZCqwBVFfeyhoyRfKiURJoAIofmpGscwYgHPGCb?=
 =?us-ascii?Q?Y91bYsesSoUbRb2BCn1qfvp8bfNPKdy3NjAhxvexNmRPyKbYsRNFMim0oNIT?=
 =?us-ascii?Q?8daax5YZ1UPy2AV/uDqNEtDHtxijO0aBGTqocScGJg7gJG/GK7taIpESd7td?=
 =?us-ascii?Q?nodQqXF2IeOuGDsbtR64CqlfrrBLOT7mOVfI8tJUFTiUP5Cwr9jvNxhbrSf2?=
 =?us-ascii?Q?0U7rRvuT9D49bgRNLXeDFISZ5yalvmldQPmoeH8ysROOgVtYH3YHJaXgW1lq?=
 =?us-ascii?Q?7ilyzmYfP2WQBX968LgoebJn96D6ocIG/rmLCXBh0q4Is9g0+uONcPSXyww8?=
 =?us-ascii?Q?tRgN8psIQaaMO9Ya5bvmczn3RM9r1AH6gFkuRgvZ2X5xJQt0EbBfZ1cFyw9p?=
 =?us-ascii?Q?n+c+yk9QtaY4E3o8KLsQIZSMyt+x0jB2rECNGH4tAGXjOXcXSNNjLAqfTH37?=
 =?us-ascii?Q?AiweZlSgHSs+gOqtJMTyvtxDT9OZIEevuIg2M09/TR70Hlp8aA88qYrlUfeH?=
 =?us-ascii?Q?5kZKGuZ2EBKqIn/eYsIP3ZdbYE6HCjRgmOkPuK+k6VB1DCKo1hDp57kyxwjQ?=
 =?us-ascii?Q?+piviT+jsZtnaOhOSs2ADT+FHhL8UvjbgpB0cwwEDmcd4eI5JDcrViJ49xVY?=
 =?us-ascii?Q?WUtN9jhGjHeOhDsZgezNc2VGXPJ5xfrIGKWk6N8W9N1lgNpkNigQGg7wOmwS?=
 =?us-ascii?Q?6hmjoXUERU2TIIfp0q1VO9wT0e/xgA+TjPZHMvtrSDFIqoWYyrWTVwr06NuE?=
 =?us-ascii?Q?0zH9YQYHyni9pGcGZZe3bH4FeNmdLOhTsvGbluvOtEkL+lNotFYEeqWCcBVS?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3Mg3kxEwzlnCr2E3s85LcjmNTqX5au2ZolasVsuDV4aUJwDuk7nR+o5gB8StbsFSXFNAQqZwHRLY1jNA4ffxtuJ87ljo4VkZMWeF7akKkenh3GWrybhaErU8a4NE9oG7XfehJaEluhHysNoIiPkqGyHdINaayQfUV1ORj3vNCzUWt35ut+ljo8+SMxIrzP6Z5WDgxa8fEyRxLMffteS2KX/GUy8HfIXbR6UudDgDwOMybiGnO44KjMq8O7zUy75V4x41DuUQ9KV5xIGkEN1O2bSmGBFCyhZb2UY9DvjFq+Fi6fnxL5w1d0ozkOYf6yWo8e+GF4dFircRWiT+Z3zrDl3S+DpoAAYJumpT2tbX8l2os77f43/O/K1n0UOmJKeLxbB/Kx+nDPJNIAbdMHYYEcsxa/WicWhedFHemvhNZIpa4MILoaXzMSN0j3RnDEbqG+T/2UwaSn1dnd4vAkJLPbhEgFSPl5k3MJxkLrJFxsIk3J8DpqTdSZG8QtdaHBd0Je31Y4q+XjAXqUMiS8lOsYJ3SUA1VxIgI4uvlFEw52NRvZ6miQ5fZL0nW9dKd1uYX66JXHXiAt5FTDy7cs0R5VmnlVtcgWYU/+GH/Zcyzn0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a6743d-22c0-4ca5-0eeb-08ddad0cbcd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:33:57.6786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qyj4rfrZBDsenjru2DwluVTy3CXCXxGfI1bqxbQnQBECZQAKFGSKNkiX3c7zLwRSiBlpqLW0zj4lVB+3nJT+296Je8TVs4yGevzVEpZ3+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4470
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160134
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=685071ac b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wP1-y75VcYHVbZsH9DcA:9 cc=ntf
 awl=host:14714
X-Proofpoint-ORIG-GUID: PxgytBffd-ifDd0i8haDcUdwYzy4IQxX
X-Proofpoint-GUID: PxgytBffd-ifDd0i8haDcUdwYzy4IQxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX/uxdoVU5IG9o
 KukK5Rd320ytQtiwI1/eoHDUXWi80qwfV6lOoRs7g4ueEx6uzsIG8uE2wUE7KhlsICVEG4d2m9k
 Mq9HJGGI2QoJwainHweVkewVOOCgzX2/Es522Lq7BFdPW9sJnMJ/cwI0WdHyctyHPK5gfwXIm3c
 8ywHAvGYiIDf90tSWatfDi2/Vdijx6oCnV+tUE4ommAy1r9yzpIBrWw1T7DT5mAakzi7cTfpHUm
 XrRdNgjmRh6qyDg6CW8jN2ePVYGiMv9u5IB6/rPNX9PfE9aAAIMPdASKm2bJylZw9TMCuy2SfoA
 qG7eI8jF8dmfnCQZpxlPMVtmw3oeuzBCbMgcHaHv4osM62bTwkSj4wNijA1PlcmMb0N+cHVmhwX
 lUVe3JPbCQq5dvvOvJdt2T2hIBylAvrhYbCg/IKR1x2JdKDT4esMBzJRre3NL5keTsUtFqa1
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 [205.220.177.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFbc-0008JW-CV
Subject: [f2fs-dev] [PATCH 05/10] fs/ext4: transition from deprecated .mmap
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
 fs/ext4/file.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 08a814fcd956..38180e527dbe 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -804,9 +804,10 @@ static const struct vm_operations_struct ext4_file_vm_ops = {
 	.page_mkwrite   = ext4_page_mkwrite,
 };
 
-static int ext4_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
 {
 	int ret;
+	struct file *file = desc->file;
 	struct inode *inode = file->f_mapping->host;
 	struct dax_device *dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
 
@@ -821,15 +822,15 @@ static int ext4_file_mmap(struct file *file, struct vm_area_struct *vma)
 	 * We don't support synchronous mappings for non-DAX files and
 	 * for DAX files if underneath dax_device is not synchronous.
 	 */
-	if (!daxdev_mapping_supported(vma->vm_flags, vma->vm_file, dax_dev))
+	if (!daxdev_mapping_supported(desc->vm_flags, file, dax_dev))
 		return -EOPNOTSUPP;
 
 	file_accessed(file);
 	if (IS_DAX(file_inode(file))) {
-		vma->vm_ops = &ext4_dax_vm_ops;
-		vm_flags_set(vma, VM_HUGEPAGE);
+		desc->vm_ops = &ext4_dax_vm_ops;
+		desc->vm_flags |= VM_HUGEPAGE;
 	} else {
-		vma->vm_ops = &ext4_file_vm_ops;
+		desc->vm_ops = &ext4_file_vm_ops;
 	}
 	return 0;
 }
@@ -968,7 +969,7 @@ const struct file_operations ext4_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= ext4_compat_ioctl,
 #endif
-	.mmap		= ext4_file_mmap,
+	.mmap_prepare	= ext4_file_mmap_prepare,
 	.open		= ext4_file_open,
 	.release	= ext4_release_file,
 	.fsync		= ext4_sync_file,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
