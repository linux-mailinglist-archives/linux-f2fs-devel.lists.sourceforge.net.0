Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71F4F7390
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:27:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncInp-0006hI-68; Thu, 07 Apr 2022 03:27:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncIne-0006fl-1x; Thu, 07 Apr 2022 03:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MwpJLE0ch36RZGcSE+/AeVbeOa9UnzSlj2os7foWWmM=; b=Ctc8agASuiRP1rSchy2D0gORei
 MuAgJBUrW2EyhbYEC2xL53n2SF2m1KcM8jJqZkTS7hMSTuotU+oaPaahy89o42cQ+LvZMLiDVfZJF
 Cb/CKynqi6NaRURjeEHdi/4Mre0zSnLlJPECuByOQdWSbEWhM8cRospjQpcPHxC+RnPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MwpJLE0ch36RZGcSE+/AeVbeOa9UnzSlj2os7foWWmM=; b=dWOi2SEQWSf5nH6AuoaVsGMnqr
 25GB3YgM1Nh7ZeKiStdxua6sv+T2L9VHCZnCcuOIUqEt85MFBU9cLN5/lHNSiycoz25XQdroCrsk3
 U7rZsGOD1Pij0U5eY+58TblHqC+AibjjZB0LNCZ0h9hUtJchaUMV2qncRSPeIYZXdbLM=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncInU-008FYc-S5; Thu, 07 Apr 2022 03:27:05 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236MuBtL000849; 
 Thu, 7 Apr 2022 03:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MwpJLE0ch36RZGcSE+/AeVbeOa9UnzSlj2os7foWWmM=;
 b=BpVrgP7pZM2rYu5nt2t4F2ysbF7RJDV+g9efkP5dlSDOob3JAcqdY2u9AXbeQp1X2+Im
 vMrro2GAz9Ynd9mCgwOafDJ8CRk2pV9i43l+iHJewXJYg1reuA2CVL00+vBPMQnjuau5
 vzUTtYMpLEyWtLwkvvwVt2k+Hw7QsrY5PMlkAensS6qqS7A4356N8aS5Cr2bs1Z9EJbK
 5xbQEKdb9oE2mcV1Jk/OLsVAQA2qfyM1kNXeP24E9wfqVwsb76trveL/s5sMReitLnLP
 t/FS7582ACLN0GXLcJvvOyLgj6pvU3LQW5g+LfnQ+fEkQa9/g0dqfQwTNTetZHI1MdxE 8A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3stj8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:21:47 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373KQC2014128; Thu, 7 Apr 2022 03:21:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wqsnk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdYNcQuSrhOdaCLDcaxSrJ9V7v6c5+HvXVHxNrONOGf+yVIh2n4N3VJbuF1RjHeM9ivvFytMVN+R2YioTghaLlxHNpA0CRv1ggchKbjx3xKkrWm9z8CO5qaJlk9OvtfxqSv9vPdyalQE1XI33YArvQn91vBpqqwmsNJmc2o4pZHJ58RU5CLHQR2RQdqA7buz0+idItVK9H3zNLsBORM2bcfn4gZkOrdgXZqUGSRMKqklFZM1mEfxsJataKVb2A7Ebbw10PunWyi6/yC7uoXGkHn4fUywx4YqMO5PFlEMmBCUnbemYcy3TPZwWRNJ2PuIeG61y1o9SbDYjeqbsDHZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwpJLE0ch36RZGcSE+/AeVbeOa9UnzSlj2os7foWWmM=;
 b=NxdpyKSaHn+GZcCBwC2VICfo06WxGOvE66KBzE6zjbc0DrjSzw9+7N8Z92bdI+mlg2X51EUbjtrUSbg9dIuHrVQ1kBJOxcZJ93D6fU4hn/wcifeFQbErydgNCgdWvKSyK67FEOZSCVPSKJiDCKi310gsAlVcceQtY2EB210+aqkdkXCAfSkC/X5BRRBE2Jp4dfS2OUMQVCtGqJL7B0Nkc88C9g9hCMHu0y/AnpPAMVNK/9CsccTWZI06RsGdyGmvHI3+AORPuQT9YKaY+hVTEHX5XeEmAFaNrITNefYwOpFM1XBGlOtwCOV9spqNnQ+4shEtt/jBl88va8C5Q5ZGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwpJLE0ch36RZGcSE+/AeVbeOa9UnzSlj2os7foWWmM=;
 b=tMcNZkT5xkLgKFbWVgLhopqHkckF7XJnf18ykVhh+q1o39W9Ccu73TKumF/tHb6zkFnfB9v2K9ZOK8Xvk3i50Hao7ter1Wg/aUZkU/cRwOMOd0Ly6EPFjQkFesTlm9k07ftmb2F+sM5bFg7FaDa729P2e/lXrqSSrpiBTn4PWiU=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:21:45 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:21:45 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zgkxh93c.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-20-hch@lst.de>
Date: Wed, 06 Apr 2022 23:21:43 -0400
In-Reply-To: <20220406060516.409838-20-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:08 +0200")
X-ClientProxiedBy: SN6PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:805:ca::24) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b782a8d-1555-41a2-ce83-08da1845be65
X-MS-TrafficTypeDiagnostic: SA2PR10MB4748:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB47487CB30D87456E26BD01E68EE69@SA2PR10MB4748.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3APAev8/yNnvPO2ONPsd55TlLDafMD9/0KkFFmWyCugSoqV/Bo9f/xHUkJ2dYIygJ0zF+rqAdn43HcZNzOqUFsJMUB/aFVj8+Mz6SfiyBDKHKpYoRD996MsYB3gS3ugUG7Vnb/rqkZ6594ReLDXgIpm2+C7RHHqDsvApyrsCc6T3q31HjAgwLE3Rk3o1zLDHWGHMgCZHPLDA9sQuSjGWCvBwEJWlALKdtH0zLhbe5C7mrG+897oLKkM8ie0Q9581uCPEBbNWuFdHFfJOE7gtamyYHpU3mphGp0dLrxZuKiY6Kjb8j8/Z08grsfgK26C/C3oESQHVjew85Er/9KYKOGEX/pBSsfqVDykdvwXE4t8QkOLSv9qYqRHKlDsMlsRZ5IKSnQsRgZh1Imyu3Gg6b/IBRmXhhJU0KyohOY3kYjFSMzPBqmkEBxj9LniXdK6tW02h0JWuSczcfajK6TnsZQQmZb1+pZSwsSUL1m7urMYWtXHpst41qLNOI30C8yrKr7ARifJ3bhZHpHADw9J0oY+LQv4enaY1OcrawmkzqzIPvnBUQ+UhloPhZIngRq2+oLs2cBeX1ozBUqD6e9/u3MVShyUdiR9ZJTTwlgqL+0BcdLUgBsaMWvT310fiDBpMoAK/XvI8NRThp0tl6EABJk/yz1iFQeHm7Xt+1QvVkuUQI9zGcGI8a4BgL2oi80fQVSyG+ppEGPImfcl19rIZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(38100700002)(38350700002)(508600001)(7416002)(8936002)(5660300002)(2906002)(6862004)(66556008)(4326008)(316002)(86362001)(54906003)(36916002)(52116002)(26005)(6512007)(558084003)(66946007)(66476007)(186003)(8676002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZfvgnwv9ipZot9FZJz1YPgJlpD+RpgsBE4GZ57AHVCH8967zIhDPxGzUGcG?=
 =?us-ascii?Q?MCJOkbGbDiv6hmtBKLdr23Kots427V/tH8h4uGLEEbOr54E2HRNbGiuXwesX?=
 =?us-ascii?Q?pFAvjm1u9bFSHNbXXP0pOz0djnwDIRM5+29Yu2M/tL3khxcWpqer4TNoG9o/?=
 =?us-ascii?Q?hhstfA61ymEDe+1/Q590nOjpyF6M4pFdSl4W6B97a+OyCosadCZiI4G1Fpt9?=
 =?us-ascii?Q?I58Zj+/6WugYElT4dlVxUm3gEk+egO+DgqNhPVANmMVlnO3HM8gSArCc9psN?=
 =?us-ascii?Q?w0n+r2LxgNR8U7D0Y2ayWJfmGRpeJg3b7AbeoBHMM9kckwBqynR7L6FHI0bM?=
 =?us-ascii?Q?tjFes7GfvFCEN1jauYK75BLTWZUt0VJrczfQ/Lby2B0rBeKvR1LWtA9pGCMA?=
 =?us-ascii?Q?GVy3FeOSUTKn7De9qeAdyD/GewzDel6KYu9vLEIj0FqPA01eD9nLQQcY4KaM?=
 =?us-ascii?Q?im9/iP/wrZffpdhUNYA66zFYwFWNb1EFCe7oomRT04/nMOGqqTD6nqPR/ZcB?=
 =?us-ascii?Q?h3u8yUgbv+X6W2SW3FHT98GOAivOhpWcmuIEwUmK/4x/+1+UNXh7qCtAIIUZ?=
 =?us-ascii?Q?j2QbTXOQfcGNieGdYaQ0XeSnhGltIDkB/3z5uCjLN03bLoERZOlIfYq0soxW?=
 =?us-ascii?Q?Qwp7k9y6qHJWAzfjCvrgA7esjsswwwzk2CqpaH/tC+Fn6lGfaJlIIDXP38R9?=
 =?us-ascii?Q?xe/IdQlRJW4rrn4KL4j8c6zuzIO/L4PnjOgu9AJ/neCI07U4I/LYGlR/u8Jp?=
 =?us-ascii?Q?m5wB0iOJMvn6+LJ263wdYX7RUArGH1q3H+fhEKnqV9hzx92jOXPiw01PWjbg?=
 =?us-ascii?Q?vEkIixMD7cSFxAXjPUShOlDk9wI8WslUPWerEw2c5tv7OqgSdSULfAzTTi3y?=
 =?us-ascii?Q?PPxiYDtMyVkZf0xkjicexi57XTLXbdqUvKcGN6E4BZMKvGh0/25cf3/oQBFT?=
 =?us-ascii?Q?FFPA+0lPq0drb297tD5PIRi01qu2JHrRMFP0hnPYhh8M860RsAD5dU7k5C8S?=
 =?us-ascii?Q?6NgEikj7oD+bdJxZANBdxtsRgTMMXsNajOyFOsDhAd5+YzHq1UQ0k0NAHu2U?=
 =?us-ascii?Q?P7yK7hfChwn+FVcJGLheqLgIgB7f/2oMV/LXJ6Uk6+9qG0eoWwFdIlMj7Gw1?=
 =?us-ascii?Q?rBZNQo2kzSlDTE0IJLlwPRwfSFD1Y7gitUWEkm/3FFmrneZF3EF3kUFoz7Tg?=
 =?us-ascii?Q?+GqgDsOeAEeqSBcC5c0Jy5OguprAlA3wvp38voi+VW2hefSeMaDn5jOuzUQ0?=
 =?us-ascii?Q?6uGXy1zBzD1CgBGxk+/g3jCSW8gxe/69C+OOlP4aCoLAK1j+DhBwG2Chq3Gz?=
 =?us-ascii?Q?MuBTGhYRXVsiR4Ikr6Xmlv3dNPxG+dKE58+0jBchks5UsLE9a6vOkIGBVpAN?=
 =?us-ascii?Q?wQpGXx6BKoymp2yxKp/+ESJMIg/yPda4edDCBsRnf5QQthsiiTBZwlt8Zu8e?=
 =?us-ascii?Q?au0pW8yGv4Gfy0maGrnNQU4WAhZ1WdWJXySCNNagKrAdLipcysPKuoSCXWNO?=
 =?us-ascii?Q?SHaEyTsyw2NWWL+iYDZcAZe1RHA5HPX0GIm/q8gldgzeBcbeyWb80UcoaDaP?=
 =?us-ascii?Q?2nFduYeVlIHE5l3nMu8PzEtIPDWRQQ+kHab/5nFDgc4gPaqugedvRAtOSyIL?=
 =?us-ascii?Q?UcpzKxRjKCUbjH5ououikKpy9LgPaJdFIrR96Jn3p/LvSYOSTW0CMch+G9ef?=
 =?us-ascii?Q?oLZ8ZO7HouDicqdZEDjOt6aJtfrqvX5aqAJZOcl5tll7mINz8kEuEayOLgYq?=
 =?us-ascii?Q?Dkqh4HaSPMpBRLL3L3RRMAX+WtjMMOY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b782a8d-1555-41a2-ce83-08da1845be65
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:21:45.4061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opcVm0PkPXaf4HZxnKxOHb4X+rGBtfP/T3ZHqBFIIJITSXvlzHF2YwjgNEUwD3W+CDMVYkTMzJaqIE5gg25nzagEcSQ2vILQxddUusffC6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070017
X-Proofpoint-ORIG-GUID: gRrzI3-NrkjWnSzj8q8OSLqgsw1tXcrt
X-Proofpoint-GUID: gRrzI3-NrkjWnSzj8q8OSLqgsw1tXcrt
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph,
 > Just use bdev_alignment_offset in disk_discard_alignment_show
 instead. > That helpers is the same except for an always false branch that
 > doesn't matter in this slow path. Reviewed-by: Martin K. Petersen
 <martin.petersen@oracle.com>
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncInU-008FYc-S5
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 19/27] block: remove
 queue_discard_alignment
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Christoph,

> Just use bdev_alignment_offset in disk_discard_alignment_show instead.
> That helpers is the same except for an always false branch that
> doesn't matter in this slow path.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
