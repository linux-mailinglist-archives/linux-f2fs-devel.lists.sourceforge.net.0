Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31A4F7363
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:25:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncImK-0006FR-0o; Thu, 07 Apr 2022 03:25:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncImI-0006FH-K5; Thu, 07 Apr 2022 03:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/EtCka1eaYsLn4wuLA71mCTmTy3QS19BJ8BeeqSuOU=; b=Zimwpxf/7bgkh/35kvvUMicW4s
 GeEdpkxQ+QV5UAfQqK0zDegJJ14BposifV/E3o8YwgflNuDcTEGHYYEGz9SXknEK5/+QwLeVROvPm
 TWfQlFrYFYzyLh+wGLPnboobVI/E2YxYcrNWv2AzUJRM5LmZscQ1RIwkIy0hQfYYQRnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/EtCka1eaYsLn4wuLA71mCTmTy3QS19BJ8BeeqSuOU=; b=ZVImG18OyQWHsyCPxb9GCkr5Wb
 tXerS7jGEgs3wCGusaQk0t/n9q4+5JZ3yD1VzHM5lJiwSqPQ0b/vqNTlp+Mrf1qLYl7fLBUEtEmAi
 9evq/WjlQy+jjl5Xzvb/K2RAgKf0H4LlifNlINzbnd1jb5bO7mVo9ET/sebcHQMT05RY=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncImI-008FNR-OV; Thu, 07 Apr 2022 03:25:47 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236LenV9000752; 
 Thu, 7 Apr 2022 03:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=m/EtCka1eaYsLn4wuLA71mCTmTy3QS19BJ8BeeqSuOU=;
 b=ZPHXH9uSshBLgJPOxwZdazVTI+3fnYybLxHdKrsDfbz5gkyocWDiaMS5jDrpJhY6dH5t
 e3roP2aEvv+YiJGGj3Z3QpMrYYwBTf9bl4ClquniFhHPfEJr4qm2Ds/oGFYCcZW7QCdw
 vQNumMDNVOrEzJbwGs4lvvr1Ud3XtzCYD36ZWDl8nKE3T0bnZudKB6NDXQ2OkGYiGJ/r
 DBND1X6o67sgshKOphRvOHMKUI7ve5ERUZzP10He02rnpHiV9o6r9EN38BXG5yjXwQQz
 Y28XuFlAWl8LJodhIZpPSjsQxEVlq9XeTW3ytrox3m87QG2hyIs+lG1EQs5JwJqYG3i/ SQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3stj7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:20:32 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373GxPm034237; Thu, 7 Apr 2022 03:20:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f974dk1tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmWMAF6RlPMTPIjba3406fZbNjZKdxfQZWWOhcV0o6F/Dp+mWgSqd97qlv6uvoeAtWXOaHeUbQ026BavoTQH3Jyi1DwXzIk4vscLyyPMEitpGfGtx/uteLJ7/2hMJMSP1aJcFMU2VJG6EZ7WgCWHluw5+mW49NiDWuugF2sFIKD0PuCxiwuk058+YFfQISJCWciRSvf3jUS6fkS53HVcM+7n5yzrjy7ui7J0oAMfeamZfrAP6bJnDv0icjxhbLsWeGrrMj1FdwDAFv0qvdrmHMupUrvKvw5UenIq2fyZRqbMQX2uvT/ujC+tDeccCJmyp1mLU7YPhvcIOcER/iFc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/EtCka1eaYsLn4wuLA71mCTmTy3QS19BJ8BeeqSuOU=;
 b=OGt2jLB3jVL1PllFYKxlo5TLcIdlllHeJdcqh60R/7oYoF89Wevj0nEHIOAV6otkguyyNaAq5MsyVnyvRiZLiySgnlFBhNnT0Ox4t+Y6T+lr8xjnXdRTnpR/ok6hugfx+ubzFxjMxS4+1i7nUQDdVrsXO8UeW2kyT6Oq/Zf420U5BdcVf8R3HgFBGTtuq8fT8V/Z4nagHTS8cr/peh0qOqfJ6kKmRm5w6VR5G5Onk3O1IcO6OZ2ZAUNw9brjn2X67TSrbILtF0XbFm9aq3wSE8vqxNzqdaLicVZz3KdilQ5BfHyfFYZCEGEP1Maz2x6xWDRUcuRqZECpjTjz4LC4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/EtCka1eaYsLn4wuLA71mCTmTy3QS19BJ8BeeqSuOU=;
 b=lOBRSf50M7+euaHqSQJt/7bPr18Dmc+z+Fqe83qmUYBLJJ/bEGizprCo/oEl8XGt6mapacdyPV+3KGVKaLZ8is3TCEoJBoJgCZfZbSxXHItPhMnaVteE3B4spY8AJHFfSKMwrv0MJPLGFcP+6oYuxKa0fqqZkuzccC+75hZgJGM=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:20:25 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:20:24 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1bkxdinq1.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-18-hch@lst.de>
Date: Wed, 06 Apr 2022 23:20:22 -0400
In-Reply-To: <20220406060516.409838-18-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:06 +0200")
X-ClientProxiedBy: DM6PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:5:335::29) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87fc0a92-fd00-4c0d-f908-08da18458e5e
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB440840B4F7573923E7BC21928EE69@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iY05ploJTVvtgWX47V1zhW6/RV6XKHjvY5mGoivTIgaxEm5+fsJ7T5pfciGE+fLIKTpH8ii2QiiwiUQg3ub7h6z7rpyUzQlH3vsLuAlWoRBidRc5cn41WCD/emrmgar3U8HSdbI6d2V3bcVEp1I1zVZZE3Jm22IlXzCd7J7fj87GC1St+e94Wjn6qef1dcvvNvxfdfCyFLMcsHCxn8qJOJUT4WgJ/OhsyodiglU7+FgW+Rs/PDPBMZA2O7ZMFGkj0KgVZGx1FYsJQD2IoJ2wzEzTZB8aBhpmilagNjnTH0HGO0r02Qpe8wpoeXJqsPxV4IL0OZcDgOs6TalGjbFUOzL7iS4N+86+91RWxpHajsffd0X29FYGCNaG4xGNExGVWvNadmNpip9ivamEuFdJMSbBH999J4rrCd1PJva9Xo88GayAGURJO6/aEBC3C2XM1kwpuOkA6Of4JIphWVunTvG+o8P0ta42cNVbZDg/+WQAceg0Ql6THgb49ARJGx+Gb10CoWdph8MIozxbE/lE4kqDHF4+q6ZraItYZV+JHaZk7PBN0meCBzLnygnaz1RO9HXP9NOp/oM05qtfaRRgsY5tV5fZITGEAYGeC8Ut8o1OBwVZg9c2OrqTSqRnVReRpYtyTkHMC4Wvv7po2WrWepJwdnglLNnpMlV+mbcxQ3mF2FQoAxhA1yvSRc4Nuv7JotojJ30sJTdxksjIVUeoBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6512007)(26005)(6506007)(36916002)(52116002)(7416002)(186003)(5660300002)(2906002)(8936002)(54906003)(316002)(66946007)(38350700002)(38100700002)(6486002)(6862004)(66556008)(4326008)(8676002)(66476007)(86362001)(558084003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WYwG50Jvgo3EAvl+oAiS+1EcYzJSp2a+tS4uTNe1bVEEGMy/dSlL6N8ODjjr?=
 =?us-ascii?Q?2LUsW+GdVfcHLijnMn/oRfVm9d0TnEsFkCerkJnRxLMEZLGAl2zW7axQKdPo?=
 =?us-ascii?Q?ANSQZ49XOn4WxRnE3oK8HiSPdCnd0MtZ2RxGclgXQO02zuTkxhRh4v+PiHIi?=
 =?us-ascii?Q?UHMnd7yLKOoj3gi5cjWnfKnyP2YfqyjI44tOXNTGMVCeStelXYQkkfmPV5Cw?=
 =?us-ascii?Q?1rgaPJKuiZCRegtsndOOJFwF5ZoopSOBa9hFDTcn0YZTkbXINBQwzMeAU2Sj?=
 =?us-ascii?Q?Kj/ZWdmcyY3IVJbZlN2/oxJi7dz2yiwEF0dHpsOkD0FG9zwIo1a77kV+pXxo?=
 =?us-ascii?Q?MEfPreCpv3DqnIePj2WlLW9l6LnEbBNo20H0+8cjO+aB6/43TW7K2eKdbcGJ?=
 =?us-ascii?Q?v7G+wHqljHZjeawzrdqbJpDlh4k2oQpYiFplYHOhhmB7J0azEycPm2educ3B?=
 =?us-ascii?Q?lH64+iuwkihF9Pi6EJlzpElscvZfUtrWdPFP6rwE2itkAWDQVNn/y8huIpAx?=
 =?us-ascii?Q?OejbLL8SvvFV5wWNOlDRec8fWv7MYSvggEJMrIqTvmPGsiIlhnlG/n1KjUCl?=
 =?us-ascii?Q?5xvoox4hu/WU0sMZo7yltEYYxLnougfchXjVjc267Vs4mb3yWuMFikGaQaR/?=
 =?us-ascii?Q?AGgII19xr3fwgG1WndBwhcPeiL7BZudnUaqxSXWmx6v2wCjM6WyJ6mHZiUum?=
 =?us-ascii?Q?zK2swo+sdDJJGIau2kXI5PYatR5KgUIxFO/wuJhU+tqmIFTK8QYk6nt+2nrQ?=
 =?us-ascii?Q?CmW9qebYN2uZjJWYVihVukKxrJMOmR6VQiKGixLZqFxNWavKVIV8/tXK1o8P?=
 =?us-ascii?Q?5rP5iQ9kSpDMQazweqo4JYW77AyJccQv8uvL7s+6GqvFqmXpugsmRrfTgNGO?=
 =?us-ascii?Q?EVaRvVUmTYwNZZGbg2Eu7u2LkfidYoeFHFq4me3mheq46qm9HMID8W5lJCdk?=
 =?us-ascii?Q?hMtExzeRzGhPOAt2MgBhKXNyyS9IIGQunLpcx5eQXgHig8LFSw7OsgibOx3J?=
 =?us-ascii?Q?9RTzkls9h/4YgC4dk31S7ckTMbqlXHNyfTn1lu93TozDS03T2nX8UD+GIRL0?=
 =?us-ascii?Q?CZjr1d4mp2g+n22DZ32Ki6ZoqREAIWrY23ZgZo/Tj1rPVbAvq0/HvH96SbVj?=
 =?us-ascii?Q?ATXGfv2C30DbhuXB8s6OScJlP+aC0PyDZ6I2fXU8pkwPc4W1mzfBT6X+/Xst?=
 =?us-ascii?Q?axLrhK7Dno05Y+OS38SM/7Crv5cxx3/OtllEz4Uu2ZTSGw9tVKl/TibYo7AL?=
 =?us-ascii?Q?Syfauvn7vMUzXyzgwPxP0A4FxZfNDANLExKF7XJYojORdXQxA68YbvCbDmgi?=
 =?us-ascii?Q?S729jfTBGFjBsbyQHWStBoF0TPKh0sXj31uHgWzeBwnLBde4S2gFcQ6mca8r?=
 =?us-ascii?Q?takaLfh/5u9/9bbNuB52ixkFVJtsMs0kJSiYdGVl9WwbVvWIqkBQ/reISVTv?=
 =?us-ascii?Q?jFEXxaJVmyOMqdQ3bi1ooxaCb3Or+y6uCFT6MLEumnNeavwA0wiuNdt2PPNk?=
 =?us-ascii?Q?EezKFVLfVzNFBA0XU9tpv88JgLwLWbaCWVJQXnlKXKB3yoNkFALRePTtHN3l?=
 =?us-ascii?Q?EcZQpE3lwQPgn8a/croxHMjWF3r5lGR2oEzpwxnz+MRC2hBkPWjMcX0XS7/S?=
 =?us-ascii?Q?m20OSXL3DeHgnR7IT24C1qTUbz/Lc9Gya0DFtvnUJviUo71gZYuP1mXYNbCj?=
 =?us-ascii?Q?yVU4yMTnArzEV8STEHNMkNGwxOMX3w6ctjo5Xd4W5ubkVwWfd36Z75Po8ReI?=
 =?us-ascii?Q?054/ti2vBNNpUEpz372aNKfV4z9PBEA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fc0a92-fd00-4c0d-f908-08da18458e5e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:20:24.8162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFEnsGp9iNzofXDdWVUeVagsevQzAzfKAOUZ7RC8FjwjaI0mXTbFbRwcCPA8WoGfksB8fb4MPqkE7YwP7Z8bcHVScgdeWqmGWAJHw3IuqJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=899 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070017
X-Proofpoint-ORIG-GUID: vYbDyoypZ9KFYtB9fEf5zDVkTy-enKed
X-Proofpoint-GUID: vYbDyoypZ9KFYtB9fEf5zDVkTy-enKed
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > This does the same as the open coded variant
 except for an extra > branch, and allows to remove queue_alignment_offset
 entirely. Also fine. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncImI-008FNR-OV
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 17/27] block: use
 bdev_alignment_offset in disk_alignment_offset_show
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

> This does the same as the open coded variant except for an extra
> branch, and allows to remove queue_alignment_offset entirely.

Also fine.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
