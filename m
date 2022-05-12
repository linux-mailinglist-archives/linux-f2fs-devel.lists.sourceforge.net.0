Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA25248C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 11:21:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np50i-0007T2-KR; Thu, 12 May 2022 09:21:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dan.carpenter@oracle.com>) id 1np50h-0007Sw-69
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 09:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ms1UpWer5buEMqtRvGHe2xwt0+Zbn9g/eCSa4PVmf40=; b=Txj+//eve35QUXPztacU2ne95I
 EyBOEvm64J82C0oCURY4dOj42U4kRaQq9ghPEPUu/DE/TtL2mRashcNWzcaCQYBnDnGYyXTyZslCZ
 arFZPqzeWFhZIjYn2dyrsr21gFWe0QCfyNVJ0t4XGpQMdErC1O96P0b7Pd98WJrMZ7lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ms1UpWer5buEMqtRvGHe2xwt0+Zbn9g/eCSa4PVmf40=; b=g34BH6u+xZoM00810mdurPmJBQ
 Uat5eEYhvTTXfwpBnU5VT4TavPJEu3gjkDTa39UHkAtn/NEVtOZ/M/iwsXzQrHLBZTgwvUi8tpW+Y
 CWFsXBR8OcU1Ekf1aYxGijqV0Jc7Yk0Yx0sgkMtbWCKeqSkQplw9JhYtMSd4ZLuSF0PI=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np50W-009bok-1r
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 09:21:25 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C91k04024581;
 Thu, 12 May 2022 09:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Ms1UpWer5buEMqtRvGHe2xwt0+Zbn9g/eCSa4PVmf40=;
 b=A/Fnr+mcy2aJtnH2BOmVUeAQmNjO8jm1vjIfZCDuqAdF8clfrsTexvLyRxYUHTShTUDk
 QDT3bAH8uO9hYKRVyz5j5nss/6Q37Bkg29OdDYUi8IZwEDMcWVqRSQJnhQy9HYXrXItp
 me3KVAbd9Hm9QoOfT7RIizifa2PJ2tYd0YOx+f+qzKygosyfBkUHvkU0hvSpL0S6tMiK
 TK6SFo5ptaiFCsK/zn8ll9H2psawskWOSKYwhidxAer8nlBaqaZ3oIMEupat544rVeEV
 0BP+49BkhwGGnU6dlrKuS/WtoPlisNYSWKdfhYRhfPgsl7be9HIcY75dwiAfTqoV8OO0 HA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0v5sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 09:21:04 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24C9BiUZ022565; Thu, 12 May 2022 09:21:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf75d215-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 09:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4meiCXCWCOjBXpLt2HQGVMlVcWvTjp5NpKjBAH4Q8Y7WMsaYnzE9EBFK1GNW8/p7ZgkOl5wqToF5T+UK3Vrj/NagrkpxrRTaWIgUNNlWa6CzMmSfIxngyQPBoMLp//4/ZaZIdn8jXTF/r8O5yYP3qDweYzIRBJuF1R3qrYFlMuU+atAytHl13fzW9687lrnTZ2M/DaoOsQIK2jt9pP33tU7pmWL7nNEjI5F/ektwwtfZlJomyR8GiqNS4hxxnKS2NuhrdWd2bAELA6mgpkeT2fyj1qGWd009JLktl9+g3W6WnNfd2XKhX2ONeopGir5fP9AWwFulX9bZup9rW566A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms1UpWer5buEMqtRvGHe2xwt0+Zbn9g/eCSa4PVmf40=;
 b=LBfPJcHNQQ9ZRP32r3dUt7cjkFYUJBIvX84pOSGQgGrPJZdOrVys9tYKFclF3YTuZvjkHfbswxzen/ggIgmiYjSREMF6Rngyj+6Xy3Bcy0hX+OjvD685q7BFD4tpvXq5vU6qHjTiN42U3aJsNz87kv0xkchcSTMNwEdJIrxk0ZTkHXIUFRXgT01xsAq1B4aPw3XTuRnZtCLW6drQk0WujbnvyPBFiBK/lyGqDJBoS/dpAK61cNn+pe5ZMZR4YGDCjGqEgt48sXyaEK24TBHBtMoM5+bdtUrWCOYgij88vXx5ogp06F6Z9ak/9FHO/mhPG2VTF205fUDg+MtpJ042Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ms1UpWer5buEMqtRvGHe2xwt0+Zbn9g/eCSa4PVmf40=;
 b=Z+AIT0r5RAgxrE2S0UtfrYYPOo9ZSPEhvxRWQIOcfAzSmg3cn5DBA0W5exeg2NFINA9JRuXVRMGU8De2g6eGdaF0FJ59yNcAqL9+bo0pS6hidEZqfgYyxK/PEFDLuidxQafRQJ/nmwRa5Z3iZHC2SBC0orxEJDy9L77HDyZ3vMI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB4857.namprd10.prod.outlook.com
 (2603:10b6:610:c2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 09:21:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 09:21:02 +0000
Date: Thu, 12 May 2022 12:20:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20220512092043.GD29930@kadam>
References: <Ynu4CGiqiU4l2vdf@kili>
 <Ynv0ddBz91EoyWwl@google.com>
Content-Disposition: inline
In-Reply-To: <Ynv0ddBz91EoyWwl@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0031.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2e3995-4ebc-46cd-093a-08da33f8bb83
X-MS-TrafficTypeDiagnostic: CH0PR10MB4857:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB4857BBFAA3F93DBA31C18B008ECB9@CH0PR10MB4857.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: teOXHtGx/DZiJWaWdcbU9coRGHU+ps+enRT8Eq4rqetpVEFBFldkRM++/FV//ft29bG8yd+DXBFNSHuMKWDQG2Zm0I/LOkbrLAVHnvTDNl+RNDLKbCmVZas8ioTJNfS6E0DQq+e/h4Z+wos3NxDED658/BXfkXafL/ZWeSA2wUjFzBA0hs7QuGzs9EWi/Xd1uKTRGmBMWJCFlIJkQg78WPHH4qyUkpAT0P/0PIcA1n6de5lNxcC+fJ5tTIUyZs/rfGizu+SFv2kJ+k4grP1uPctRio4HMLOp+l2iDpTHYB86pVJT3jM+JebXaUkiHdu5BqzZ0poODNQRMBcKhCiDT61YUII8obbgcHXP+lMyIdmn+W/Bq+AxULS2binrLOy8tt34PJQULtTU+75rhJWy9ppHbiB/TMyPdXdiHvUJNRT4iKFf5j2z6D9aNeY4n/92tdS0nB8zSGtlihqKSiIzOSbxeeb0UPEByhXEEMBCinndgYoMHi6XYpcZn5cGY+1yQB9L6kqmuFpBQ1Thf2GNrVsYryNaL1mLUNgBcw9cdk1v/saVP+O1jCum6gqLr+1qTK1XmKIxUPEW//5f4lcl/d42wMgCegWLm+Adv0NY08RBG5Cas050xGzsBa5qU0KI+Kijyb+GuV97if0BZnbJdblNEguagP2I8d9o5OjjDVqSn3b287wC+RDpqUOvhEb8nrSmmqSRJ1HeWN9IHYu79Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(86362001)(8936002)(38100700002)(38350700002)(316002)(2906002)(5660300002)(33716001)(44832011)(1076003)(6506007)(52116002)(26005)(508600001)(9686003)(6666004)(6512007)(33656002)(54906003)(6916009)(6486002)(4326008)(66946007)(66556008)(66476007)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eN3j1/70SBqG77LtZ60Wzl7qabEIuzrq5ae0HJyomXYYxOzYy5JbBhqDIQx+?=
 =?us-ascii?Q?KL946EfoFfRFlB0QevtpTBcvz8tP6KDj5gwI5bOE1lVHZLWkRehMtyP1NNQE?=
 =?us-ascii?Q?pyLBolu3x4ce6q28vDfO8UCBE6voQqs03vJhElgkoVMpG+YBAXXPfatUmbZb?=
 =?us-ascii?Q?ynnXRCYx/vFLevnH0Gdc279JM4hnbmYJI9Jz+qGeYssENK3+18tOekSpZC0m?=
 =?us-ascii?Q?2KPTiaoY36QMFblFfxcl2DmVZSCavjvSJTgxrDTzoYdZHb+uL7OWFDZQurml?=
 =?us-ascii?Q?CB+vwDSqPM/rvPOduvzPTVgT3/WsokA1fzale87cujXdo1rFcVOCTvX4k+Uh?=
 =?us-ascii?Q?TROrP48ovXs5B1AUDWKZ896eUwYjtw4vQD5pQL3Grgd72RNkYYl9R6GKQzk8?=
 =?us-ascii?Q?6xhZ4X4OjIS/U8lbcnBqHUC+RozV3VUUuN3tpnaCZ6FEjuFS69Qpdf1yaDZm?=
 =?us-ascii?Q?kf4m7BXkCRvan6KpoPwzWFmRfU3EZKlDV+Ty83LEonF/7zbe+XsWZhDdpHsK?=
 =?us-ascii?Q?8bQ++ynW8upse3FGF4/2yLQRK+xVSiyxt8yDExafetcQeBGc0441/jGb/913?=
 =?us-ascii?Q?HaGEOUIvtR3RyZO6cM5PHBk9tGfgdmA5jD5l7SkxmrIb14n0N5BnjcaIV+Vz?=
 =?us-ascii?Q?QevmwdGuVvCpa3aGvytVvrACmJaKwcP61h4AHxWw+Sg6b03j4tY9YF+cNXQk?=
 =?us-ascii?Q?vOXt0Tv9P5oq3SULoZW3MDwv1S3kNjIjJYalI0pFgxGdzQ4svkF+K8JMiT0R?=
 =?us-ascii?Q?0v1UmfvN28KtVoZc9vwrp9fqyC3JQ2Q8/f0R47CZy1OlgrIOpw2kvHLmV3pl?=
 =?us-ascii?Q?Jj74Aga0I/6gnf0Mia/YpucfXIxF7sRouYnRL9QC+GKQ7f4ZPhmL7crIaJXh?=
 =?us-ascii?Q?Dy9fazSNY8fXtVyk68SrRCEFx6O1Vb7BoWCBshiGkcahqisR4H89Oew/QzrC?=
 =?us-ascii?Q?q9wkk1nSbMXbJ3Brc2ChOogPcfWroyLK+4JEyuOhKK7dle2EUGD0i2em2kN6?=
 =?us-ascii?Q?cnN5QgAShPU3WgqJcg6MVyHJ3okGZpJZbsqg+VeusigvIQrhg+66uklBmFjy?=
 =?us-ascii?Q?/eS9xhXmBb0OKCyQKKUE5CjhaLIoo3NBUoEqUosRATxfpgdcUgXju6i5umeV?=
 =?us-ascii?Q?JL50KQUDf/rGp6L8LZw7g7a89YX911SwnlD/duzcYadWRJS5sl/MavYTlUvh?=
 =?us-ascii?Q?Qj5KHW5vSZB47RvGU3FblFybT6jSEqYQWcXyWLRLDQPcuNG+oSDe2Ya1GMdH?=
 =?us-ascii?Q?krUqu+lNpVTTfeZbKJiIm9V7zjm2A+Q5O/jGcJKWrV9HD5uI+uaWYtXMlLmV?=
 =?us-ascii?Q?RkyIXKktdKN8B5AG0ADAXUHl3Zn1D67g+ipRbMgxs/Rv8DLRwD47xGNWUX78?=
 =?us-ascii?Q?BbXoban2dvOuhs2bKTEzSL8EdZkCp+sxyURYPFrtD21NWMiF2r63bBftz8DO?=
 =?us-ascii?Q?iWU//3nzHZDgnbaKSX85PDHp8pueEP/o4IkAdIPm/mQqFLr794pHxaarpJXn?=
 =?us-ascii?Q?Ye/VVSXclUESDHdnkioNRzvy4pglJuoztngQYlehxQ4IcsMXwXZvN36L/Rup?=
 =?us-ascii?Q?mPQZPoSk4heHwQPFBtRMcKZcgICIYe5e4bqmWaMyxLw734Oy5lyNswz182o7?=
 =?us-ascii?Q?f10E+79BZP86gvcACGxvBz/dsSwcZ/W3ud7dwnfF92gl51YQXStL8akA4w3/?=
 =?us-ascii?Q?RsEnOvPWbajb8s5VY4Nyl802WOEvQO2RXmjQ/70Cm+4wTSuIT2sWrg6ewmMy?=
 =?us-ascii?Q?f6VJB8529gsroG5I1wMtFYr5RA568jo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2e3995-4ebc-46cd-093a-08da33f8bb83
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 09:21:02.0147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/SIxEU6NtF+XK9kWCrrx6MziCTS2lXy5SYGbFNlzNRo45SWDAIgWcGJlb0BDzGNPv52U32ztM9Jcj4dCPFAieWb1JD/K6AOFnCA9BjrXEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4857
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-12_02:2022-05-12,
 2022-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120043
X-Proofpoint-ORIG-GUID: 1gkIISdZY7a1UnebemkP17_I2fwHZvyY
X-Proofpoint-GUID: 1gkIISdZY7a1UnebemkP17_I2fwHZvyY
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 10:37:57AM -0700, Jaegeuk Kim wrote:
 > Hi Dan, > > Thank you for the fix. If you don't mind, can I integrate this
 fix into > the original patch which is in -next? > Yeah, that's not a problem.
 Feel free. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1np50W-009bok-1r
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error code in
 f2fs_ioc_start_atomic_write()
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
Cc: kernel-janitors@vger.kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 10:37:57AM -0700, Jaegeuk Kim wrote:
> Hi Dan,
> 
> Thank you for the fix. If you don't mind, can I integrate this fix into
> the original patch which is in -next?
> 

Yeah, that's not a problem.  Feel free.

regards,
dan carpenter

> Thanks,
> 
> On 05/11, Dan Carpenter wrote:
> > Return an error code if f2fs_iget() fails.  Currently it returns
> > success.
> > 
> > Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  fs/f2fs/file.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 79d1a20fbda9..cd768fadfd67 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >  	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> >  	if (IS_ERR(pinode)) {
> >  		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > +		ret = PTR_ERR(pinode);
> >  		goto out;
> >  	}
> >  
> > -- 
> > 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
