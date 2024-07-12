Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406892F3E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 04:02:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sS5bp-00055v-4L;
	Fri, 12 Jul 2024 02:02:05 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sS5bm-00055l-OE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nt0cWdOqig7czSjUTz25M+Z16EFBsMGMkFRprWfIGkw=; b=mwYirsk6dZxlp8hmzey2tzIItZ
 EBxmNIxl7DcY/0FPVKMyBRADljia0N83PSsnSk5tVk4iht7kPbgUx9Fp9/8hJsSbqkNEw8JoqRuly
 1xyAzJBiZwQNukhejOrj7YObKirLMNmZLvCOuLTiaOk3g21N02uHFeXHYKE8pRNi7EZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nt0cWdOqig7czSjUTz25M+Z16EFBsMGMkFRprWfIGkw=; b=C+us9cWhJ/A6Vs2BeqYC0ZsOrw
 9+r7+E1g26OdZ4F8t0ht3dCqHB9so1JzZ2PQcgh1hdoo/q8CdTsrM65bP7/wl/h+NJJMtLBx9FWyD
 elPaR5EJXPvBDe/YAZ92lUXmylXGHgwsSrw1HGM4rc76Zmh30jJbWJT/B8vM3OlKJUVM=;
Received: from mail-tyzapc01on2047.outbound.protection.outlook.com
 ([40.107.117.47] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sS5bn-0003QU-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhCg8n3eazZf8yNhF/Qqr9PIYJ+BEmknNMANlipDdcWlM1h+PqBp5p0iy03tSc9srtqW4WvPpPpNkVJ4/j2KeTIzB+zShKBsUxsw8UnSA3BzJpAZlW5smNHYUogBuBXETIjFtCFYHkxKqg5YYHUDXsbhbrBD9ZqU8Ja/5P+nJN6XaUEF7A2uM+z15e4tdFQnwd6z3+eE/RD3oTu8ei5/RakIiCG7Ua9RarPNQOUJCuRB5qEpV9EpX/LDstyO2OBMd+tHojGHcw8KJXpd+v3dBj88qkmR8gUqc8vyM8tiirizlVLu7khkq6Ezv5GTRMvDLqX3Ou89r25UFzrkY6vSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt0cWdOqig7czSjUTz25M+Z16EFBsMGMkFRprWfIGkw=;
 b=swLcoQeGuyEtGt0reWwOcBGhbLleAHlZ+Oy0KPIkiXYq4Mq0aKA6AIyzcmLuRYXlTLaAVeQdd/8NCG4e9q78AHRqs58sf/S8CQrLl6ZIfa/oLE6k3a6k5uYI3B3PMpHD8tK3TNYmJ7KWaKqOz6f9ItRbszfFlwl4HSbf85Br8x8qoswowBJwMaQdyYMckpXWPylcArpK0KfOiezLSUspasxpjhKGmSxXvpUgXZaOWRgtLgDqHzfoi2BQZNpA4iHQmnxpHkrxJwmEitaseaSVSACcG4RU3o3uQkW4FTWje7W8Cnwqkzs3v/0L5Gp2wFS6/cqABSNe9fftFtEajzr2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt0cWdOqig7czSjUTz25M+Z16EFBsMGMkFRprWfIGkw=;
 b=dmxWOf2EzkAvebOAXU9zSho2bQeKqGNdKG7FR8DOcViMG8FVZq9J+qUrmGKgN6p+PEihNuYtGhTl2My2yFBZNcSMUniFCTM13VHwsXY8xVYf/q81hyriOHAv9Igiwtq+IH0vj8+bjtyj3qXBvqck5iq6f0ONHgQYh+qclc06HGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6621.apcprd02.prod.outlook.com (2603:1096:405:28::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 02:01:49 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 02:01:49 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 10:01:33 +0800
Message-Id: <20240712020133.140148-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712020133.140148-1-shengyong@oppo.com>
References: <20240712020133.140148-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b800ec1-74d3-4f51-e8a3-08dca2169794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZ0gY0FM6ZbmC/EbspmDQ/Et9euaMuoEFrl2PIHR27nP7olaIE98H+BLYCoh?=
 =?us-ascii?Q?KTqvLQiL4flwM9N5fR4HqxTzGtd7uWVz5r7VBbV4gEcoIRdZuXBIH6OFLjIC?=
 =?us-ascii?Q?CKDcmrf5vO5EpTWfWK6pPXrZXC5cLruddbmUTvEUO+pdhEijM49ZRKlxypIe?=
 =?us-ascii?Q?zirCXwOEBC+Wg8Ssrs9vI5WTT5++pJUmIk+Kbd9KbbTIXZg3hzNAOeAazKbe?=
 =?us-ascii?Q?88x12q2b9d/Kmfh8lFrzirF6wG4GgcVY0/4fNRUVG0+uEDC9+hp8ZVQa3OAO?=
 =?us-ascii?Q?OYZ5JC2h38k2s8/W4ZRRmiA36pRUAzoNJjlzm6Ragck4aASMzyLdDjAKDd/N?=
 =?us-ascii?Q?LQ8mv52mR3wIn/7oPqLTxeW4NGMxvlpiiFatS7zYCTgok0bUbfIdjoQrt+P9?=
 =?us-ascii?Q?uD/u78kphe3oZUs7iHdWcHfvYwzNFuTPMQsyiMvl+yAIeYxBcB5ByX0nRPYe?=
 =?us-ascii?Q?HO2QuL4wYu7TldhrN6CRuXYrmdUWNpdKOBIUQ7poISLZkpi3q1N7xME20fYD?=
 =?us-ascii?Q?YAoG2+x0NK0p4Wb602qf+FxTu37UHS/fgeUauazLl6CezcGyqMM/qvnfNsJN?=
 =?us-ascii?Q?9LMV03S4HcS2LDEHm3La5osPkhJmW/Bb9MXiWb+2mraptMqqyQyAFwbIzOID?=
 =?us-ascii?Q?nNhheQC43u/AhHroWlzXot6+PV0WWwolXPUcRxUQFqXyc4swq3j3elFBbcV2?=
 =?us-ascii?Q?Hy8BhyZ1Y/+B/jw2udsyvHndQAMXOd9QqrnVadnCZr6wP9aLTURsXoZgki4s?=
 =?us-ascii?Q?VSGoMQJfYSr5/QNTSI3UAgvM8blj7HkwYXXSBM8ZsJHiiCRvbDES3k0Mk14m?=
 =?us-ascii?Q?G1PgyJHU9ecXn9+ZGHQzpxML2hV6pFAawy7FCdUZnMUZP9+3HvUqVjnICMmb?=
 =?us-ascii?Q?qhH/mYlG6YYly0RzmSHej6zxliQas35aws/d5vf5H8G14zhszSU+piuIrDPv?=
 =?us-ascii?Q?cqr+OWGehgd19Zg+jMskclRIHjBbQ2TeVf7L794h9C1K24ZBvgKVlD2dYX6I?=
 =?us-ascii?Q?Qi6RwYBBadbErjDibeNoYYcGqZBWKYnwp9ngWW84Xg8YK6cY+kX7UfDJ9M1b?=
 =?us-ascii?Q?jzNva8TDtP96eaY+CKj7km5AKI+Kt64BfF6BPlQW0W7G2n4xb7mRUGy1mGmI?=
 =?us-ascii?Q?0BtRQn6RupyCnaD2zRd5JQOCrUuo8/ti079j75fPlHrH+jjwjz2VLvdeiz/r?=
 =?us-ascii?Q?vn+8Ml+/HJoco+RvWvGITI/wpXuNPBnkpg+MHaP7DQmYgAEMFVKmfXDVLLf6?=
 =?us-ascii?Q?REkiPLIweJRsxitoLAOBN1+Bm5tsWaucZNYP6wFZV4fgX2WlQEDr8W+mBfxc?=
 =?us-ascii?Q?SntrS3oOyamj6n0+U5cfN/jj40mJ4q+O0B1hNQQgM8DIsgnZOMn47OGh3XiR?=
 =?us-ascii?Q?weH8pk3FeJfrVBMBCGFSJmToG9oS7+m1mWLqyF9T5a6sJcuKpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PaTQ6lh/9mIvTiESPoIck/4h8c26qn5t4dqDSJJMsxvb5jp3p8m7wK+vVbIv?=
 =?us-ascii?Q?FJCyX1ntxVKSdw4xOJpHDqQtUOOqPnrQaffocXvPNFFzRKFlb0XRxmObgmRY?=
 =?us-ascii?Q?YapcbtdQ4EHc63adqjiIClHkYa9atRBc/omCBJDldLGB7PHYGqprR5a8Hmzw?=
 =?us-ascii?Q?q23eC3V9yL6I6squVEP9ZmkriLkdhUVbF+xdf7NAsjb5H/bZGa1BUR3CXz3D?=
 =?us-ascii?Q?sT0vFd2QX7Xk0eZTigMOB3UFufedtVwtUl382ShHA43LY5UU+h2UK8w4yDpB?=
 =?us-ascii?Q?/RgmtMdIzNmMS8phVGyF1EkeuUbEVewN6TSIegyxJiETbVgyuNxPAlf5itFN?=
 =?us-ascii?Q?Xzmz/y1sfEU0cRy4Fx9h1dIp8YMlXbPiTAA30mA4dbiyD64VTFTcdB938jl1?=
 =?us-ascii?Q?YvXAGRe+M7IEvkhECcBgneZaOjwEBD2vSvOowf23IYnfJJrLcFCBHQMaitxU?=
 =?us-ascii?Q?fLMiWl2v6+oiDdpoYJMEEhZzGWZEdCZbTh7CDfu6aE8MH1nSrd71Hn0VZQwO?=
 =?us-ascii?Q?hLLGoyi3sjU0aK8pbDC4GTLCbDcq5PCLZNRPPolonQxar/qXFM/kbJ3H4Sls?=
 =?us-ascii?Q?kQwugqJ8OeDzdZfzxAcBsCRf5XBkEoSSUv16EURkHC3x3apxVRUpb/FvxPJU?=
 =?us-ascii?Q?RyW33VW/XjaxOddzwhPpTmdsfiilS9HPclCF0DboTotZb6kbqDgQBaJHOgMl?=
 =?us-ascii?Q?m+pwZefpwFyDmLM9hIcdxGlyqbayqyjneHp4LBs5RHVwduQaaXFCx3Q6Jc9d?=
 =?us-ascii?Q?dxqEHh09NXC8jAwJ4bakQObAwt8eEY7s9As8lYC3Q8RRi8hJf5pbqgITpBHT?=
 =?us-ascii?Q?fZtZ8pDGca2QQoqJtocrJRt11wBG0s/e3twvhHLhuuypfYPwM6O+00jy3XLy?=
 =?us-ascii?Q?R1wu4IdLcCKJlvx854dSgQ3Z8EmGQVKNG4NdnCnoSZM3qR4EKQPe0+TQLKze?=
 =?us-ascii?Q?iK5ZeW4JbdLvA9rd9pYeNJcZEBvV5iZ9SrSiyjvsYkQM3eoswxEirRxcpsFm?=
 =?us-ascii?Q?gZA2dJe+wmXyYBgmuHmdNjDYECn/srxXqLWZO/RupzuJvYil39xmSW5oOQ6O?=
 =?us-ascii?Q?IwcK4XFk2buFGXhf9iJnILJMLYrLVA8PDoY4Vjs6xeky9l9/ti/XSstTuyLa?=
 =?us-ascii?Q?3VnbW014XC9phjv/pIHq76ZRWvm13lSUwBGbPOhQcNgpjPMnpKxSqjZ4JIx9?=
 =?us-ascii?Q?z35Id+/Yalmk0kbLSLNq1iw/k1aC0hIDaPDHgHKUL1xhc3t+QLq6Wkk5wqLS?=
 =?us-ascii?Q?02a22nj4ThMGcMBdvAX8T+KnsTgknQjsscsG+z52klOqj/1j8ETp1lMbNryf?=
 =?us-ascii?Q?Lm0ZSvfIAT6plm4VLsxuaag9k2pbT8tdLnScSPVxy9Z8k9GFldYCwcEJpRhN?=
 =?us-ascii?Q?d0BeNYjmDLv0GrwROxq8niOujCMiHBIAjR18eBhfScvAsgS/DsCuONzk6H07?=
 =?us-ascii?Q?yiR3w3MkUu7T2Du/H6VaHMbPXN70VPGdfpLkRLfmhcbOcWbhkcCPjArtlOtI?=
 =?us-ascii?Q?e17gpA14BNc/TSmBk9RMXAS+pNEkY904o07DkH8cvM8B3olwYqXE8o4wE9nm?=
 =?us-ascii?Q?RTyL+kPcVUctzGJsL119I1MvfkfB1ZiNuj4QmnXG?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b800ec1-74d3-4f51-e8a3-08dca2169794
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 02:01:49.7581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBHI3Dt4nyBHO7Jy/dBv8pejZPbLKKvX8bqUeAwJKcmSDr5MYh3cDY8f3rGOlu+O3XRtaPYczY0iHwk0WA/SAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6621
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a superblock failed in sanity check, it should be fixed.
 This patch add a new state `sb_invalid' to tell fsck needs to update
 superblock
 at the end of all checkings. This patch also cleans up force_stop,
 abnormal_stop, 
 fs_errors and sb_invalid by merging them into an `invalid_sb' flags, and
 each of them is indicated using one bit. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sS5bn-0003QU-1Q
Subject: [f2fs-dev] [PATCH] fsck.f2fs: update superblock if invalid
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a superblock failed in sanity check, it should be fixed. This patch
add a new state `sb_invalid' to tell fsck needs to update superblock
at the end of all checkings.

This patch also cleans up force_stop, abnormal_stop, fs_errors and
sb_invalid by merging them into an `invalid_sb' flags, and each of
them is indicated using one bit.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c       |  6 +++---
 fsck/mount.c      | 16 ++++++++++------
 include/f2fs_fs.h | 11 ++++++++---
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b15931eba3a0..89a5913f4a26 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3661,13 +3661,13 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			write_checkpoints(sbi);
 		}
 
-		if (c.abnormal_stop)
+		if (c.invalid_sb & SB_ABNORMAL_STOP)
 			memset(sb->s_stop_reason, 0, MAX_STOP_REASON);
 
-		if (c.fs_errors)
+		if (c.invalid_sb & SB_FS_ERRORS)
 			memset(sb->s_errors, 0, MAX_F2FS_ERRORS);
 
-		if (c.abnormal_stop || c.fs_errors)
+		if (c.invalid_sb & SB_NEED_FIX)
 			update_superblock(sb, SB_MASK_ALL);
 
 		/* to return FSCK_ERROR_CORRECTED */
diff --git a/fsck/mount.c b/fsck/mount.c
index 93ca351ef41c..e92e64e6feab 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -701,7 +701,7 @@ void print_sb_stop_reason(struct f2fs_super_block *sb)
 	u8 *reason = sb->s_stop_reason;
 	int i;
 
-	if (!c.force_stop)
+	if (!(c.invalid_sb & SB_FORCE_STOP))
 		return;
 
 	MSG(0, "Info: checkpoint stop reason: ");
@@ -739,7 +739,7 @@ void print_sb_errors(struct f2fs_super_block *sb)
 	u8 *errors = sb->s_errors;
 	int i;
 
-	if (!c.fs_errors)
+	if (!(c.invalid_sb & SB_FS_ERRORS))
 		return;
 
 	MSG(0, "Info: fs errors: ");
@@ -1171,9 +1171,12 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 				VERSION_NAME_LEN);
 		get_kernel_version(c.init_version);
 
-		c.force_stop = is_checkpoint_stop(sbi->raw_super, false);
-		c.abnormal_stop = is_checkpoint_stop(sbi->raw_super, true);
-		c.fs_errors = is_inconsistent_error(sbi->raw_super);
+		if (is_checkpoint_stop(sbi->raw_super, false))
+			c.invalid_sb |= SB_FORCE_STOP;
+		if (is_checkpoint_stop(sbi->raw_super, true))
+			c.invalid_sb |= SB_ABNORMAL_STOP;
+		if (is_inconsistent_error(sbi->raw_super))
+			c.invalid_sb |= SB_FS_ERRORS;
 
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
@@ -1186,6 +1189,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 
 	free(sbi->raw_super);
 	sbi->raw_super = NULL;
+	c.invalid_sb |= SB_INVALID;
 	MSG(0, "\tCan't find a valid F2FS superblock at 0x%x\n", sb_addr);
 
 	return -EINVAL;
@@ -1456,7 +1460,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 		if (flag & CP_FSCK_FLAG ||
 			flag & CP_DISABLED_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
-			c.abnormal_stop || c.fs_errors ||
+			c.invalid_sb & SB_NEED_FIX ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
 			c.fix_on = 1;
 		} else if (!c.preen_mode) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4823d2..fbd20d207e42 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1443,6 +1443,13 @@ enum {
 	SSR
 };
 
+/* invalid sb types */
+#define SB_FORCE_STOP		0x1	/* s_stop_reason is set */
+#define SB_ABNORMAL_STOP	0x2	/* s_stop_reason is set except shutdown */
+#define SB_FS_ERRORS		0x4	/* s_erros is set */
+#define SB_INVALID		0x8	/* sb is invalid */
+#define SB_NEED_FIX (SB_ABNORMAL_STOP | SB_FS_ERRORS | SB_INVALID)
+
 #define MAX_CACHE_SUMS			8
 
 struct f2fs_configuration {
@@ -1494,9 +1501,7 @@ struct f2fs_configuration {
 	int force;
 	int defset;
 	int bug_on;
-	int force_stop;
-	int abnormal_stop;
-	int fs_errors;
+	unsigned int invalid_sb;
 	int bug_nat_bits;
 	bool quota_fixed;
 	int alloc_failed;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
