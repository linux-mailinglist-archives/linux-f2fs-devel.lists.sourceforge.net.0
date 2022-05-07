Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C051E587
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 10:17:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnFdB-0004lS-1d; Sat, 07 May 2022 08:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nnFd8-0004kq-Es
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1pqBRFfa/YPhA/uRSQRve3FvueelPx91w1fy7HiAkY=; b=SlWJ2czBmLXzeYZohazXmVnaxN
 raqzwbkjlASEoXQIkON55nfUQF59EVXrcmv7claNN8bpYaaCF72G6pvC5NGUqbPO6/pM3uEX65byT
 HvkEKFdTqL12fjp/MSVc/TlewNpxGjqAiz++2zdPp8Mp2JAjftLOhq+P4msb4zVoWIGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L1pqBRFfa/YPhA/uRSQRve3FvueelPx91w1fy7HiAkY=; b=N
 /1U8z7NU8Yr11h70/0Pu7l7N3yLVcpx2c0WNPun1xtPECZHKn/Kvv/vqORfSZKRtD9SqWGP5Dn/BX
 JPqFtEeCz0kOQPbv70ODw+a2Z5A234kYURB51n8C6lthIgZ/65izujzz2ap+uPjqtvl7jOMy8nAnN
 JQTqwfbJ++riuY0g=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnFd2-0003r9-Er
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMJ4kFuFQBDMRUgczbEtbmOPheHyOZaDqpVF1SblL923AmGfXt5W4YAMfM8ILoCfebHd3FkNEgKiprOpIbPkZjwAHpyJklWVnEVhzICDsq2wotxYObhOxJJw+FbiXnEy4ehRV5YUYAGz7+BjA7ALUe/nh9h8f5Lgtu1LeLYmoXLNxOmq9hnLMQu2iur5BcCBikbus+LH1vgA5xckmK8K3NxtpHASLCZqyk/GGJnqxgEokt2/Jp9PUnspOh+KgVwjhvvvNlcGeLSbrytleE7FM0pCHBO6nmYWe4Gkwq2wNwYWiXoJl7rJlc1RZGUBOM2jvllQTtWOMhgVG3NaMjVoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1pqBRFfa/YPhA/uRSQRve3FvueelPx91w1fy7HiAkY=;
 b=jKo6bEJOZaEnrakpZfA5NeDW5VC78DICrtAmPeqwvqRm1LfbGLiWFp5LcAAC+N9HvhLO+cl56+DSM7NEHHpeTJcxuhNwSzgf+ecaL2hyEoKpnm7PCLdqc+KlPAfwn0zN0tLV/dWfvpgKKsxuwZVUA202eHlCTvXBfklRF2sIRYGEO66JwhMZi1ygViPGYJJBV2S8ruJg7xlf4a/fdAlSkIY8eQJeDv0FPwp0OoVfOtNn6zz5ZrbI4eNi+3aLwFWnpS9TB1RoIH4czpHAz/x7rBpPMTluk6VWEpmSI/5+0oUtu0hTwisVKvm99/7HPLip8RUoSl+dHXKSM0uHX/Y4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1pqBRFfa/YPhA/uRSQRve3FvueelPx91w1fy7HiAkY=;
 b=IpY8LPCVhog+hA7w7dVO6ken5qu1HO6+wPRnGcC4nUykcPgQlgMwW2CXzYMFam+M72uxPc4M70lqWHGHJ4DVlbDIZE4pqPnVlyQEf3hJWfDPEe3h8pvfYKBr8vNby/4FIP+JLC+ShbS6eGdLtaq2ZchmJ6Z7SGnl7zEjq6e/Hs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PS2PR06MB2917.apcprd06.prod.outlook.com (2603:1096:300:52::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 08:17:19 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%7]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 08:17:19 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  7 May 2022 16:17:07 +0800
Message-Id: <20220507081710.117162-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5026c81-4269-4e78-9271-08da3002010f
X-MS-TrafficTypeDiagnostic: PS2PR06MB2917:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB2917ED741C09FC736FF6B159BBC49@PS2PR06MB2917.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNwBrxDh60EygHh7POx1aBp9D9jaATuCArT2rn9XpltCLQzZejq/1RGhyGI7bh5C7ODeCUNeid1MgqFx2+i1LcS9Y5P2wDiR2sZcRdqi10WfiwMe+ogWOdmUqqdPubsjrpPvq6kLmuOJIE5GmXGdraIam9ycEgUnQI/HDvbwfW5XSGXEiLj+QItVYEfOiPfo3djmSGFkNSjKlcjwTcXkC9pVNPhik3eMsIdIvR02LBZrqNUDk7CMKkkzMD0kB8+xXcRudthu+WIv8ZFDyYld9bL6o7UCyj1nvZpwLe+fccWln8Qfob0BB6Eg3glBhQ3qvexTWH6XVMzr3WbgpiHPlraLwVE02CMMsRpNSWN9+w0BwaJWEOQ2+RLZnwO73t60SpxLHgzJ20D0w9cbDxX83TlHfc42ETgBxk7IyW1YhPmuxv3wcarE8K6NVihut4UZ2I5kmNwo2N5vMUvXQ+jyC5OydVuAjn04tyNpYmMezC9vHoshARR1I6ypyqcCXypFAz2KQ5RxbZ/DKd81pDIlyvcDrgUQo18oz0dzSiiqAQJ84DGf1O1atKOI0PYMscHWnFM9kBebH0i3AzECwGoeu5eKUeyo7NwEOQE/h/BIjB5t7aQjzE7VIhYhRQfu93jnAVP7mZRO9Ut8/ewHTH+SNQezAV8Y56Lnp4Fp6bJ2B7Tr+ONVUqNm0ywYBgjHEvRGkgAng6PfIylEu/7sLcqNUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6486002)(107886003)(83380400001)(66946007)(1076003)(8676002)(66556008)(508600001)(4326008)(8936002)(66476007)(6506007)(186003)(316002)(4744005)(36756003)(38100700002)(38350700002)(2616005)(6666004)(5660300002)(2906002)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8GsPghzuAPPzULhZkKqWOpspRt+UeZUbKEw77Lzyyha00RDnwrVNFUivqbMa?=
 =?us-ascii?Q?Iggy18exk/VkxTViyHVyPHVSva65DjwmEAL61rtP1ehn7VLhENSSjTm42D7o?=
 =?us-ascii?Q?x3awa+Gohc7Y4tf+v22MIuGZelA5AK2+sL3rFkMxiKuSaW5wyoHlLBRRofm7?=
 =?us-ascii?Q?wee0ZbcToCiMeGCK8wWOfize7W0AsnCyVxcR3/otyUy+0aHqwKc187YWld/b?=
 =?us-ascii?Q?OhqHeSd8/2ClHyPI7n+DERSg7ZG8hfKt5VzWuqp9A1lL0KfXkRO8Sqvz0T03?=
 =?us-ascii?Q?R9PEdNhnXRWEn/VChgHyALqZI6WlNmQzb8tC6zGkscbr0Opxv9/7h/Hj738e?=
 =?us-ascii?Q?mIoyaSXm2VBchZYPVmSuvELQ4DPKqB3OROkeMd/qDxjQEdDp/PBcM5buRPID?=
 =?us-ascii?Q?/3seh39iP6HBISguEMGoalGqD/jG2Ti9g91NzA/pI5srXgPCm/S7VdkyHGSs?=
 =?us-ascii?Q?jeazyFmhMDNCXYcd+UruvXrGHF+y4nxPhDiSt00yArV6ReLZ/pWnVL6Dc4ot?=
 =?us-ascii?Q?ZgCvfdKPMezXJi4lwUGZLWPFOoa0Tnr2jEue1uyrVU/StIasUKiyEXtmMEEy?=
 =?us-ascii?Q?vW6SFMH7i9UBEe60AmaQ7EZQLGOe0SvcYMM+n698JAKYCaGu/ZjUNKHDdF1X?=
 =?us-ascii?Q?z0Af3f1vEMrjPTn7cn2lUandshHWTMsEdX9AHYvfoAGWkYEISCDnaQga6a6n?=
 =?us-ascii?Q?2tB3219nYvDtPS1xeVIK5uR6g1hT7ooI69lrLQ5mHHnGJX/4Pz8Pxa6cMuGS?=
 =?us-ascii?Q?sYTz7tO+AhdsXtap2lesfJVWNuPMJlZYdSXfK52tmM70wpkwts4hkDXVo89M?=
 =?us-ascii?Q?l1MdpnJkD8HwJ37U+w5qsTt5EnWZMhuhUZm+OxGxLKAuBeMKC++K9wnhFXZs?=
 =?us-ascii?Q?smVZnvqfIF6DfDNjCUgJNLCCTIQqFX30RkIZQlK+J1HvY0ik8Kz2TT8T+FxI?=
 =?us-ascii?Q?L4ojZfJ1kB9J4WhsDZpnGo0b8hdorVjfHnf19MTd6WwySTU/DWBBr3R1+B/d?=
 =?us-ascii?Q?AFt16oHsxf5LYgNj2zNVB9CWLNfBnvGCIMRJK6JmVYnpwK6dXSJOQXb3S8Kn?=
 =?us-ascii?Q?I983QVyN+W+Wmr+s3oOcQYbXX2Rj9P0BmKuDQEB9L9Ur8dqaF3rvIGTlA+ue?=
 =?us-ascii?Q?khD3rZdqGByp1LsKZ0cL4xVCeBJkvVXIC2EOyMxQqs942Af4mPwpBq1fAyOR?=
 =?us-ascii?Q?CvaZtQFny4CqhCeqzJuEYVOD6Uu95inMPFbog/w1C26g4pTeDtrGL9pY9zdp?=
 =?us-ascii?Q?qiwlDVV7MQ60eEM2LvGVX9O9sVMyVnDPLsB4rbzqdI72bVGEyHaVurdUVXfG?=
 =?us-ascii?Q?s7k/XyrRBOAY6C51FmjrEbk46GyiF8opimAq6T46qEsgTSMc22IgquT12TAb?=
 =?us-ascii?Q?hmwfuzEL+Xl14G1aSiEoUlK/Y2WVuyaO9qzw2uaknubEav/xyepNoj/+8vDa?=
 =?us-ascii?Q?VgWhXD9BWWulk0zTN0r4tXbRZkoQJ6B04Ae4RqhobBgujbd/Z86AWAC4wx2B?=
 =?us-ascii?Q?5DGZsvU7OskDTL0qXhrijwcTLrImHbGqjEqS4El3PbgPmqFZaCNNVZeGX5a+?=
 =?us-ascii?Q?ROtERosZgOtqGqJqFQjv6je7Vn+P3b2gza5LHZSfRfV8QX25Uoz/79S5Kl+j?=
 =?us-ascii?Q?JQzE4I96hCXdil4iXkgMFbGBSgBzHuzdusqO858Ilc5u1Y2eTKCt1BFHigIT?=
 =?us-ascii?Q?dqWb5xieOmTdfT/5gGIlHBXe8Tmo8iLT8YmdIkACMr3VEVKpby2pb+xne115?=
 =?us-ascii?Q?obapTq0euA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5026c81-4269-4e78-9271-08da3002010f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 08:17:19.4399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpNnsvwGUO1cJqiOGD0uNgO05epccqHfxu06L9zVMSo3NgaqEfvPNVMRJa35Qj19l1BHdweiwlQG7BDm+dJcsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2917
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Optimise f2fs_write_cache_pages, and support compressed file
 write/read amplifiction accounting. Fengnan Chang (3): f2fs: intorduce
 f2fs_all_cluster_page_ready
 f2fs: use onstack pages instead of pvec f2fs: support compressed file
 write/read amplifiction 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nnFd2-0003r9-Er
Subject: [f2fs-dev] [PATCH v2 0/3] support compressed file write/read
 amplifiction
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Optimise f2fs_write_cache_pages, and support compressed file write/read
amplifiction accounting.

Fengnan Chang (3):
  f2fs: intorduce f2fs_all_cluster_page_ready
  f2fs: use onstack pages instead of pvec
  f2fs: support compressed file write/read amplifiction

 fs/f2fs/compress.c | 15 ++++++++++-----
 fs/f2fs/data.c     | 40 +++++++++++++++++++++++++++-------------
 fs/f2fs/debug.c    |  7 +++++--
 fs/f2fs/f2fs.h     | 40 ++++++++++++++++++++++++++++++++++++++--
 4 files changed, 80 insertions(+), 22 deletions(-)

-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
