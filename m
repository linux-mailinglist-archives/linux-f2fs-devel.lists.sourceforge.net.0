Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D7446EAA6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Dec 2021 16:08:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvL1X-0007zu-2i; Thu, 09 Dec 2021 15:07:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dan.carpenter@oracle.com>) id 1mvL1V-0007zo-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 15:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zLyFJ5l/dpjQqXlrzfee4CEJaB2jcKZFxY3fUe4v6ko=; b=LMEdiD234Q/on7jp5KP6eUT8aN
 J4fYiSe1zFuOxdAd1sNWo7PTxmJUrIR7GjuknfuhLHSTHC2ICT/xzkmw3BjWn495cAgxnSA2cdnRc
 BOdqK+XDvdaqc2iP5OuMQDjdK+YNM7iywm3x3qkHRO4iN754cwMlruwB8QQrbhbVWW10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zLyFJ5l/dpjQqXlrzfee4CEJaB2jcKZFxY3fUe4v6ko=; b=F
 NwvVUi2bBNeztEGCnpOg7eDY4qDUwU0HyHNZoyUe5LAzig4m9HQPZDE2mFz/MwYCdbia0vTY2KBjD
 n1gISPWDD+xZh73InWnLnyqPibZz25Ui5obcPD/NNz1xlTqA3Sv7E+IZl+ACHqaCwrupf/reeTPG4
 79Rz4BjVOYw0BkVg=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvL1Q-00A6WZ-Op
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 15:07:53 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9DtlPw021507; 
 Thu, 9 Dec 2021 15:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zLyFJ5l/dpjQqXlrzfee4CEJaB2jcKZFxY3fUe4v6ko=;
 b=Qf7nWROtsj7+HjjJE25I2J3JxafNGLZCD5yHj8HX+ouVCZug/kCYsUjxd9RTUGs84y/6
 1ERrNKSicOOU2xQrtZyr94Vfr0gHWl8MRo6NIjkTz5gjLRxU8Fseceq5AOuqD3N8eYcV
 lXLtrcy6FvGfWKJFiRWMEHN8UhfGnLekAzHtl4Fn3rHg68gzVCvywGmnXZv9+QOha0gk
 g1trhcdobRVzUfCKrnlNq6vnTh9NvPaUZ58sUpfM7lV+ls7mC/IYMzrQzQVIqtsUH0Zb
 3FWrBD1gsrU+37Ezlvo/ArcJ64vCo00ez/JMxqDRGCvJpX0j3OrYHQd+466zcoFGIEnQ Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctup539t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 15:07:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9F6nRP100799;
 Thu, 9 Dec 2021 15:07:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3cr1ssnb36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 15:07:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD9E4HmWfmWq2rXrRSzl7sBtR+rmqOJX2GMFL6CWPwZyq30hIvbeo1J3gRiy/wKSQgsu1LPRPzrt3TWgh1ynAR49mWT2lIptqAVm19pt8bumDV6q2oo3NPtoTPwRBgmbCZxP4JbiU5O5Yj/vVY6quU0aXKLNiqU+JPKvTBeYSigeCUMSqeA85hGn2r2dPuIkU0ZNpCdwa8zYJfgf8Q4nPicu8L2RIlG3eUWt5KuZf6gG6gYbkNI6plAneYuoroVmLjp2poi1KMCPXHHK03LWHhwyjUVvqxMhGdDwkWjqNlAIYlpLV11+h9jTMjDEp5rfyDXR7MS6afbzGuw3IjjUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLyFJ5l/dpjQqXlrzfee4CEJaB2jcKZFxY3fUe4v6ko=;
 b=P/mJvgbZf5KB0Zqdg3Met+nv+r29voM/k25vhA6TBNyDrJy2YndNaH9jp6j8FYecaHsqpTFmLYyOADU4t3+TOozqM0RYDD2p83tmcNi/CqQ/vhcMk7A12oKehwpsGxb76N7hEdjMhtPxK24o2GAlqm38ZMLt5FeyhHvXaSP0ealtVsa+5mfD+f51dZQx5ZqMxQ2kkRa9wZqbHDuvGB3hn4hONas0FoUfpvknPKRp8H8CdTqTtpKUZ9mlAGAxNEcjKv/lgOc1BRptfQc6UrZy9ICpO+0o16p1UtI8sf753LrO0UW19nlR/tMJGBT9NIST+focykOMVWo4jFDPMjkQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLyFJ5l/dpjQqXlrzfee4CEJaB2jcKZFxY3fUe4v6ko=;
 b=r0teGAelXIZPl8gn5FwJz28oRwUvqqPgWSAr2gGgRgjNnFlRAOUvhl61DxkLWSm9cxxBhobMu5OqbSDnpSx79IOcOFsflwt4Oy0+JzBP+Gt5fRUSPAPd6fxtiiqM+0VdaGJwgfJhKXOFcnMd/VIfqPRJf7UtpusWqsVJLRLwHxU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 9 Dec
 2021 15:07:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:07:37 +0000
Date: Thu, 9 Dec 2021 18:07:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: daehojeong@google.com
Message-ID: <20211209150728.GA13714@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0399.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by
 LO4P123CA0399.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:189::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Thu, 9 Dec 2021 15:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142532e1-2a2a-4b2f-c02e-08d9bb25a2d8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1616A2B8262F5EA57F6824118E709@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n02JcIApx6vLLIsMomYmAm2AOTbW5F5EhZtzU5RpwdvNHx6zLy/k3G3X9+vUC4J+u28vse0IrOh4i9GfcxaZxMQqHxmsG1hWE4sgIVRmoywd8PsW7Gy374w9DyT0U6vqh/bOyCYaebsvYzRHxtYJBd7ulIVX2ozuoXPRxRuGtLgWuDS3irb/3VLRMMGht6qH/2SWqjKKhhEquUjhUVz2F+1MtpBARwqQ5d+GaTK4Lb0dfcs/gXt+FrwfxQkrN5FzNRQYHVpNIi0c6jfxw0e3I5p4GZ7O8orojlDgkvauyRYc0wRe15GcSuzWU2IlZPUpJjDflk8cX1xXS7KJMgJO0ttlwhy1BRv7VAqBkdZFcqODlL70WYahcAqVXQjF0krI03U0rFVWJ77sUa5E0AtIwiWwjJju0s1GVIf3z4V6XTUke5Pgbr+enNmihLmPGp4gUMUGL//usBB8rR5lBxamavi7c8pe5l94E4AXqHLTxhkMAsW8068vBYeGkBwNwvy+BUT3GkxFep/ln1A08sTByJoq2PFub1F0lLaE5xXdvRGsSSJbiwQOfumhESGgUOTTdT3wGv3zqjOCRDoPZ7JT2Vhqb5quddU0gclZ2e9vkj3r3ajGQUXepFJM7C6cJUR38r6IXXA6XiVg9+aAERaC+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(5660300002)(2906002)(4326008)(44832011)(66946007)(9686003)(316002)(66476007)(33716001)(66556008)(8936002)(508600001)(186003)(6916009)(9576002)(6666004)(6496006)(33656002)(1076003)(38100700002)(52116002)(55016003)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0XXyf5gtNyUFifHX/KH0gKuTGKbfLP2qz/9Zx6mccMkRrwgjETp48WuNRim7?=
 =?us-ascii?Q?KS4d2CZ0uTkmHHPzkZUSbB9JsMOHMct/SjEfeeTwjoEpjGQ0TklNAAKhjeIM?=
 =?us-ascii?Q?r7KWHTpKBQZWjdhEZXsZ73DAigzLUpCiC+aR9BOdsPciq0etz1F+XFB656ZO?=
 =?us-ascii?Q?Cxc+atRte53o02WsD6/t6byWXOEwUkmBELCLFTV8ufnHpOCmH/oRKehCf9DM?=
 =?us-ascii?Q?UD3rnkClUjr58wwOi1OckfX0Zq5v+F6asaHJDAYyED7fXCLJXlCXluSDAJBS?=
 =?us-ascii?Q?jiPIPmLDksAb/DmDQiVmEca4nCnQVDLmlj6kGBzK1nPMh1UbkCWdbBcraaC/?=
 =?us-ascii?Q?IIuORcjqYzle6C9pyWxCNELPxoBh6IdYxuYH8fHI18AWOiBtzWgVTI0Ytwff?=
 =?us-ascii?Q?pGIVyx7ya1c1ezyk5GQYOsIXqcjfkajb7v+9rlr1HzRLJKzKXH8rH29QpBFC?=
 =?us-ascii?Q?YQkgGoVQd6qMABwpCEMj0VLyGkHW8mGUHkLlky5dMy5p8HOUIcKPxnIqJjd1?=
 =?us-ascii?Q?rC5OmTMa69qy2ARUOIqpcz5z1ZQvMB2lVMhmHPRTN168Ahmxr5ywvxs+eVmZ?=
 =?us-ascii?Q?zSMu2FwvRqIazBb5ukjD7YvXpEg+1nn1ykDgDzPknw70O4kp0xcyp7zsHKQp?=
 =?us-ascii?Q?ufSftSQgAOAr2mxTJ4rtbmxs7Rr5p4D7koqmiHk7OYAc11VArOH3SRwgz7pG?=
 =?us-ascii?Q?C3t9tOg2r2WeW9Vxr/EcncmazG8cOazNmWEsXQVTAcZs+DcIGvrg8UHAoht1?=
 =?us-ascii?Q?M6tXLFeZZ1PjnvBFvVfupb7y6/ELs9iwzLEVN5Qcu1LDOI5cRJjfAStA6Q9U?=
 =?us-ascii?Q?PNzndbcWZmaNhIVFhxOQeGNZHgPWSI33GXg6wIarECCJTOpCt7V1/4LkR6gT?=
 =?us-ascii?Q?PT3kz46m8VPLAmNwCyXtpQVggnL3NuiH/fbzGTUXUi1U2tEG6JCz48xMiSVW?=
 =?us-ascii?Q?0umixTTX8vedF/qMTqwo3yijtDwz6OkB7T3exVMx51L+q5hayuMpZ4D3GwxG?=
 =?us-ascii?Q?pjJCpeWgDnM8d9B51JGvciY3thhRjzhqGswDn0Oe2CXp9IEiuvSeRkHQeLRL?=
 =?us-ascii?Q?YI46WiieDMEaZfj/t46sDaGynoPZuA5COLAQHuR0mdMMclwPmLhzSsUehR2n?=
 =?us-ascii?Q?aVllDxpzXQb9hs+v041qhAlzJvBTVWzszWCXntk8f96VSgmlf1SOhDao2f+Q?=
 =?us-ascii?Q?W7Y2YJro9ZUVZ343L2a6RRQxYFdF5XJkAAwZyp3I5N4YxalywVh9BFDz/NUb?=
 =?us-ascii?Q?4h3+XABDdOU9w9C8P3KI11ns/Q02JVpC1W35qm2GUNBeO67zPBBmEaKGDXgb?=
 =?us-ascii?Q?OnwZg5LdkiXN4fMzhFSmw9AFkAkqmSr0g/B/WxMxMIPHTvn9OHNgxXmvostl?=
 =?us-ascii?Q?Mvl/3d5SsFfOfXhdtP3MZ1K2EntidErCZIBTEf3Q3xYcpXzI+Mpv4Bii+kH0?=
 =?us-ascii?Q?TPSi9NPffbg2D7W5bdnBxQWiWjxTDFqvxP1sUea+n7ylB1T1448THLTBewdL?=
 =?us-ascii?Q?76oJkvNJH9tdfjURPHzxsUTFmOTZmOkd5gGihX8wlGJFInR/lPW5a4dUm/HZ?=
 =?us-ascii?Q?eWX3hPhEscdOkRH5mm4xBtmgHVQxixlIB0dIhz1WosIVazFLVwVqrUSQx7Wp?=
 =?us-ascii?Q?NmRxnw6herwSnErjuuKb0lEU7VbEy9o7yBThSgrF6D7xYDgK1D0YOK/7omFo?=
 =?us-ascii?Q?c0pC19UyJwtbF88zPx20+Ogf21RvR/vy4PvwXHTHbqCW7S8u?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142532e1-2a2a-4b2f-c02e-08d9bb25a2d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:07:37.1732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qureQynXxNelz1KYnvPXu2dINKxjZ10OO5x7QisISLosXSnw7RY+8OBlinOPxaJOjauo7hh9ONsMD+DFiOKr8w49lMBgKQW7pZwocrnyJJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10192
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090082
X-Proofpoint-GUID: jElYK-bs-ArM7Cl4wRvWJhy2ZgTNakoY
X-Proofpoint-ORIG-GUID: jElYK-bs-ArM7Cl4wRvWJhy2ZgTNakoY
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Daeho Jeong,
 The patch 38f953da2e35: "f2fs: add gc_urgent_high_remaining
 sysfs node" from Dec 7, 2021, leads to the following Smatch static checker
 warning: fs/f2fs/sysfs.c:490 __sbi_store() warn: unsigned 't' is never less
 than zero. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mvL1Q-00A6WZ-Op
Subject: [f2fs-dev] [bug report] f2fs: add gc_urgent_high_remaining sysfs
 node
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Daeho Jeong,

The patch 38f953da2e35: "f2fs: add gc_urgent_high_remaining sysfs
node" from Dec 7, 2021, leads to the following Smatch static checker
warning:

	fs/f2fs/sysfs.c:490 __sbi_store()
	warn: unsigned 't' is never less than zero.

fs/f2fs/sysfs.c
    332 static ssize_t __sbi_store(struct f2fs_attr *a,
    333                         struct f2fs_sb_info *sbi,
    334                         const char *buf, size_t count)
    335 {
    336         unsigned char *ptr;
    337         unsigned long t;
                ^^^^^^^^^^^^^^^^

    338         unsigned int *ui;
    339         ssize_t ret;
    340 
    341         ptr = __struct_ptr(sbi, a->struct_type);
    342         if (!ptr)
    343                 return -EINVAL;
    344 
    345         if (!strcmp(a->attr.name, "extension_list")) {
    346                 const char *name = strim((char *)buf);
    347                 bool set = true, hot;
    348 
    349                 if (!strncmp(name, "[h]", 3))
    350                         hot = true;
    351                 else if (!strncmp(name, "[c]", 3))
    352                         hot = false;
    353                 else
    354                         return -EINVAL;
    355 
    356                 name += 3;
    357 
    358                 if (*name == '!') {
    359                         name++;
    360                         set = false;
    361                 }
    362 
    363                 if (!strlen(name) || strlen(name) >= F2FS_EXTENSION_LEN)
    364                         return -EINVAL;
    365 
    366                 down_write(&sbi->sb_lock);
    367 
    368                 ret = f2fs_update_extension_list(sbi, name, hot, set);
    369                 if (ret)
    370                         goto out;
    371 
    372                 ret = f2fs_commit_super(sbi, false);
    373                 if (ret)
    374                         f2fs_update_extension_list(sbi, name, hot, !set);
    375 out:
    376                 up_write(&sbi->sb_lock);
    377                 return ret ? ret : count;
    378         }
    379 
    380         if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
    381                 const char *name = strim((char *)buf);
    382                 struct ckpt_req_control *cprc = &sbi->cprc_info;
    383                 int class;
    384                 long data;
    385                 int ret;
    386 
    387                 if (!strncmp(name, "rt,", 3))
    388                         class = IOPRIO_CLASS_RT;
    389                 else if (!strncmp(name, "be,", 3))
    390                         class = IOPRIO_CLASS_BE;
    391                 else
    392                         return -EINVAL;
    393 
    394                 name += 3;
    395                 ret = kstrtol(name, 10, &data);
    396                 if (ret)
    397                         return ret;
    398                 if (data >= IOPRIO_NR_LEVELS || data < 0)
    399                         return -EINVAL;
    400 
    401                 cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, data);
    402                 if (test_opt(sbi, MERGE_CHECKPOINT)) {
    403                         ret = set_task_ioprio(cprc->f2fs_issue_ckpt,
    404                                         cprc->ckpt_thread_ioprio);
    405                         if (ret)
    406                                 return ret;
    407                 }
    408 
    409                 return count;
    410         }
    411 
    412         ui = (unsigned int *)(ptr + a->offset);
    413 
    414         ret = kstrtoul(skip_spaces(buf), 0, &t);
                                                    ^^^
"t" set here.

    415         if (ret < 0)
    416                 return ret;
    417 #ifdef CONFIG_F2FS_FAULT_INJECTION
    418         if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
    419                 return -EINVAL;
    420         if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
    421                 return -EINVAL;
    422 #endif
    423         if (a->struct_type == RESERVED_BLOCKS) {
    424                 spin_lock(&sbi->stat_lock);
    425                 if (t > (unsigned long)(sbi->user_block_count -
    426                                 F2FS_OPTION(sbi).root_reserved_blocks)) {
    427                         spin_unlock(&sbi->stat_lock);
    428                         return -EINVAL;
    429                 }
    430                 *ui = t;
    431                 sbi->current_reserved_blocks = min(sbi->reserved_blocks,
    432                                 sbi->user_block_count - valid_user_blocks(sbi));
    433                 spin_unlock(&sbi->stat_lock);
    434                 return count;
    435         }
    436 
    437         if (!strcmp(a->attr.name, "discard_granularity")) {
    438                 if (t == 0 || t > MAX_PLIST_NUM)
    439                         return -EINVAL;
    440                 if (!f2fs_block_unit_discard(sbi))
    441                         return -EINVAL;
    442                 if (t == *ui)
    443                         return count;
    444                 *ui = t;
    445                 return count;
    446         }
    447 
    448         if (!strcmp(a->attr.name, "migration_granularity")) {
    449                 if (t == 0 || t > sbi->segs_per_sec)
    450                         return -EINVAL;
    451         }
    452 
    453         if (!strcmp(a->attr.name, "trim_sections"))
    454                 return -EINVAL;
    455 
    456         if (!strcmp(a->attr.name, "gc_urgent")) {
    457                 if (t == 0) {
    458                         sbi->gc_mode = GC_NORMAL;
    459                 } else if (t == 1) {
    460                         sbi->gc_mode = GC_URGENT_HIGH;
    461                         if (sbi->gc_thread) {
    462                                 sbi->gc_thread->gc_wake = 1;
    463                                 wake_up_interruptible_all(
    464                                         &sbi->gc_thread->gc_wait_queue_head);
    465                                 wake_up_discard_thread(sbi, true);
    466                         }
    467                 } else if (t == 2) {
    468                         sbi->gc_mode = GC_URGENT_LOW;
    469                 } else {
    470                         return -EINVAL;
    471                 }
    472                 return count;
    473         }
    474         if (!strcmp(a->attr.name, "gc_idle")) {
    475                 if (t == GC_IDLE_CB) {
    476                         sbi->gc_mode = GC_IDLE_CB;
    477                 } else if (t == GC_IDLE_GREEDY) {
    478                         sbi->gc_mode = GC_IDLE_GREEDY;
    479                 } else if (t == GC_IDLE_AT) {
    480                         if (!sbi->am.atgc_enabled)
    481                                 return -EINVAL;
    482                         sbi->gc_mode = GC_AT;
    483                 } else {
    484                         sbi->gc_mode = GC_NORMAL;
    485                 }
    486                 return count;
    487         }
    488 
    489         if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
--> 490                 if (t < 0)
                            ^^^^^
impossible.

    491                         return -EINVAL;
    492 
    493                 spin_lock(&sbi->gc_urgent_high_lock);
    494                 sbi->gc_urgent_high_limited = t == 0 ? false : true;
    495                 sbi->gc_urgent_high_remaining = t;
    496                 spin_unlock(&sbi->gc_urgent_high_lock);
    497 
    498                 return count;
    499         }

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
