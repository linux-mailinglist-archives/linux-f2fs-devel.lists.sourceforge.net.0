Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63115687928
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 10:42:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNW6T-0002Up-HY;
	Thu, 02 Feb 2023 09:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNW6J-0002Uf-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 09:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6ey7vAAt2izQwAOGBj5q+b3OAqGK6rdZflWN1o2NPQ=; b=KIsFqegLLz9Qt3FeBi48eCGA5K
 L02qCDEcvQGHl/GAC8uWQuU2G7K5xN5SxwSAgExtTTc42B+q5t/9esJLuyau13S8ohSUJT5+awwVM
 3EXyrrKpC3JvN7c2ynvGJAW4hgrwL1ss8CDDhn53kKEymCN13C/+5m5Tt4EL+UGigYU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d6ey7vAAt2izQwAOGBj5q+b3OAqGK6rdZflWN1o2NPQ=; b=T
 dU7F3RkSJgWttscGBZl1hIS3epUopkA41jP1A4U4i4psHM1EzWsjDPFzffN8sy4GUjyz2UDBL3+zo
 gMSXPDSWtalfCF5nvVAYPpzGYxOz15wnKSpAIxEC8ILyEDDS/AdpSy5AdOfy8w1/cYthUx2+8o+Mj
 eP4aNoI06LHOibKg=;
Received: from mail-psaapc01on2128.outbound.protection.outlook.com
 ([40.107.255.128] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNW6E-0006PB-M6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 09:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEElaf3lY/RUOe5vKLzxuqGTJQktpAMJZ8tgGyGIktPs+kTn9VlSO18PMqlXFL/71EDzMA7kfjoT5dyIS0YsIb0YB2jRLfQwgu8Y4ejjmqOLaTWrq01u4VLx8mxlv8bGXr4Z2GOQeHEW5T0NmbhxYwcXZvLTvSOdZcAwhdYKJncV7JriyFlMtYnfmZZAaB/il2GVfAQ7GQQbi/samFtOS4kGq1Ipi7cAfd9zqAGNJoWtd/b84MUGDf1wGIC05cAHqNLIkOKiaV8OiLwSfnUG5KxuAP1VSLigF0dTDKkaPwpTitKlYTlFEneKCRC2R4cN2RlEFzoNs1rl1ZaXZ5AQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6ey7vAAt2izQwAOGBj5q+b3OAqGK6rdZflWN1o2NPQ=;
 b=MMDOmiGmHMa/hbbENpizCB3oT8/ZKOQj/T4hjx973DEzYqSx1ufkWvWqLmW/+E7eCmF3ru69KZeRhCzenIMzQpclPZisMoulNVXHKy4OCtnAGboAcpI29YfCcUrAgIB/zQey1/CVwjq8w65HHGY4JpzCEVD4fM3ttotKVKAMCehmCd68DN+Q+31SyQX5bOjkR+iQ5ZSsnbGLAtMWAMFw12X1MYDCBMXMcleZoa7jonH9yv4sWUwu07AvfjoulS4HE+tCP/agLYrsQQo8vMvAPaI4yMb6v7m5kTBXWWqkCHQDKv/LWsHYQ1Qj+mDmIEjlURJARR9R1zaDT31G4L+tDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6ey7vAAt2izQwAOGBj5q+b3OAqGK6rdZflWN1o2NPQ=;
 b=UdgCOSI/xuKi+TrwBHFiKwrw3CDWteK2fdTVRMS+1Q5iiQKgQVYbIXGAym1Tw3fDlX88FcLBvz4PyhDWyXo7rHXenpNH34jam+pL2OPJrPJCn1HhsMRLLKyArmFbNIkmHa54U2fvXTgabGUuzcr6eyaMHBvmXKNkof8IZE+P163Hu7d8waArLeVHWxIwUdZZQk9UZwRFApy5xHm1SkUfyubOyfaIct9cYebDMsIqOWhb0w3scX6x5FWMoFBR7d2bnZEqAfeOXQPTVrxuJX6nvjUREpt4G4W1Pyqs41+nJEyy9pKXQ/ijgT7+UMNt+ib7qW77EJUlQ9o0VxwSgCG8bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3914.apcprd06.prod.outlook.com (2603:1096:4:f8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.6; Thu, 2 Feb 2023 09:41:36 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 09:41:36 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 17:41:23 +0800
Message-Id: <20230202094123.74342-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB3914:EE_
X-MS-Office365-Filtering-Correlation-Id: fd24b0b3-d606-4efe-4daf-08db0501ad31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wK7R86B++jA7rn0z9MGp3xX9PXipJTHAKxDCNrXuQdCjzi0YPpzv3RHdLD5p6pofck7msTmfi8JeUfoA6RYT7JUx/n6pn0hiEtGO8IdwB+tuW061KkDIOphRy6F62l9DLlYyalIJY0FwSiBttXx1xbeFJSfnE7YK/8iz2SD9XROmq5hFn7ws0kp//yIdTV4t9bi6Q2lQvYy5S0CJxbjmL3TLB21EUq1drCv2pM1f+5CES50dbQq+10Z5mmFB4nOK8Y7apilL93wl6wjVei3aLtMZnUfNQNvHTFFv3r3mkE7xX6YtfYBvJgnGHJROvb326WB24mCmAp3v1g7vbUF6gqVwYREQk/jphZRZ8ObD/v4TCjTBsZ3dgObVJovISTNISz8vpeQiK9sV11Dzp4MesLWYuclGw68qUbV2aTMVMF3TFy6BQRioKOeJcHgbmDFAKj/V0VYx5TeFIlVe2lfBaf8lye+mp6nwNfs9CBKFgr4wZRh5FkbMFSR9u8NyhO7Fj/hL2sVKI9G1rM0IqDXLugQvXLXVUhM3bXO1I43YIztO1OB8nSENg4BNDcSPECa7MmS5h/lcUjhIqTfa6cC43k681ryHqeA/xX66/H9Fzw1NvM0Qhjqqcf6e6rTLSrr1PZg1aml9p7Xiotkot7+xplryqTP43Hn3ENzYfR+GrcRjlVe2H+S3Em320xEoarkFYqSNg2WRg2P6ZC3yNN9nbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199018)(38100700002)(38350700002)(5660300002)(316002)(2616005)(86362001)(36756003)(186003)(6512007)(2906002)(26005)(52116002)(6486002)(6666004)(478600001)(107886003)(66556008)(66476007)(4744005)(4326008)(66946007)(6506007)(1076003)(8936002)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/ftA8Cl1iE9vq16Fac2xg9EeCc6rNpJFjorX5hf8RGDTtPI8zgQ/XlFAieN?=
 =?us-ascii?Q?BqY5yUGXnTmQFX/Fl42N9yFTV/3CDTz6AZrSB6kVLmBP0NYuVLvPhF7iK8IP?=
 =?us-ascii?Q?S8QvKjRLW21h2wS1ztSsO6DZQuRjQni7ijZ9x39V6iXNqEiAjOpYhP3b4wRk?=
 =?us-ascii?Q?o1PTCXM1yrZNcXhwN5snEtPJfIlf3hsc3pbgH1Cx7L2dxnDqOD1o6rK9e6EW?=
 =?us-ascii?Q?LyCkdDPEoGejTbbMOA9pUEG08uiVvo3s4QHckUm6LlTy2iPB2mS3Y1QiuVqP?=
 =?us-ascii?Q?mvlAezOVAL7dI58MaJa6a+j3JYvcD/38nqYG/iBdQp0ciCIBAZ8VkuQzUIDZ?=
 =?us-ascii?Q?YH9v6voRRi6wPy8U1FwqQPc0lqDQFUmry3pa53GaFxNHAfO5yPhJBIZQWbEC?=
 =?us-ascii?Q?JJpHDiKIL60VzaVT6ne3YSge6xLtf0aqBQEI0Ysro4yVA8mzfVLFsnBX3lI8?=
 =?us-ascii?Q?GJ+FaIUkt11B2yImg3y3GZbhG46ThLl+xRDweSwOB9emCA7+XfcgM36Kvg0l?=
 =?us-ascii?Q?g3WGHLEFWBvZj38z29Uq5LUk6eO9ibjq0q0WOFQ8bqYIusc29ybchZ24Xlzh?=
 =?us-ascii?Q?T1tDIikF1QGdMjwO4ydywy2MGSqE87gg1cNZgeu6IE597YfvCk25QfR6kuBS?=
 =?us-ascii?Q?hLUCy9NQWkhXPGD8RFosv98iit7j2tDbsnWaIILLoKGXD1BhVtwKwD/yKaAe?=
 =?us-ascii?Q?oGyWt6mO+GTb2PyZkGb5fuSxPgbs6osV7IMDz1xoKfX7Rlnq1wZolWS6wJQG?=
 =?us-ascii?Q?MV/47vtK2nid4F5FHrfed+kNpM/ULPAGfRDTLFPmR1i46BnaS4pvZ6LXhmbL?=
 =?us-ascii?Q?9ReZUx/c1a5eVdl2NTGyAgSrH1nnYGwkgYqEiyXxsT0JeK1AU0doaiExvHDq?=
 =?us-ascii?Q?tnb3BcR5euISe9FRSUaDI9efw15eavF7dOSOOETc6VpiTt+Th8FsaXsNKDMz?=
 =?us-ascii?Q?uS3ee04+zfO2FSoP9vDHA1X6BlT8UvYYrg5NrIj9cV3gPV6KV1aNBIfHuGyK?=
 =?us-ascii?Q?YWS5yxkNIXp5i3FN8fp8px4/evH/dZ8tzxsfOhAnw/J9bWBvVz5e9JgV05rX?=
 =?us-ascii?Q?8IafrMTejcuAciceg/G5bifpoATO7ock29Hg5i9Qj84icqXVC8mvwZXkEBUs?=
 =?us-ascii?Q?s+YpLFG8V2sQheT0Tmo5Fzn1uWkVLrDmlQdmY1vMdO0vvwZsuY3U3Osg4uAA?=
 =?us-ascii?Q?9CP9cDPhl/44A6NmCaxpdg4vYKQG4UA5IGmWBjL5DXNVy8urtyt3KZBK1joL?=
 =?us-ascii?Q?amkevqkTTthdFd45GOgupD4kTP043BBb6pearajimTNEodVFCiOItJSM+xQF?=
 =?us-ascii?Q?FcPyFYhxgADwdXy5L4mfJoR0OrooW5mShbFYCwvxqvETEspp0YntP1XZ6jeO?=
 =?us-ascii?Q?LUx+GNdyxtf7taISTDAkvNGCdSmFm8/rQnlfI2ITaUc7GhiI1zeWQuC7zUBN?=
 =?us-ascii?Q?w/Da1zoZR4qUluAfKM6tW6zoOeqv4oF4KCkv8P3owmTBta0gk0jBtzXdqYSf?=
 =?us-ascii?Q?hYoexoXgqA8vxlB5rCNlGQwJ2KH6QyN1AMomUBoguP4mCyUjDQ8DmK6Uvnvo?=
 =?us-ascii?Q?zX2hvnyx4Tcjj4CiZCH74EKsuyfJgVWsDsE8i1MV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd24b0b3-d606-4efe-4daf-08db0501ad31
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:41:36.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxM6B2m2XwS9TKeC4koMrsj3mTEq5NG67Kjcfz7Yt7ascz4id3T/IOJwYmL4AYX969s3Ds6pEbRqMN6pSQDomg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3914
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
 forgot to show nogc_merge option, let's fix it. Signed-off-by: Yangtao Li
 <frank.li@vivo.com> --- fs/f2fs/super.c | 2 ++ 1 file changed, 2 insertions(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.128 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.128 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pNW6E-0006PB-M6
Subject: [f2fs-dev] [PATCH] f2fs: fix f2fs_show_options to show nogc_merge
 mount option
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option") forgot
to show nogc_merge option, let's fix it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fddff5deaed2..4ec2cbbc47eb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1902,6 +1902,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 
 	if (test_opt(sbi, GC_MERGE))
 		seq_puts(seq, ",gc_merge");
+	else
+		seq_puts(seq, ",nogc_merge");
 
 	if (test_opt(sbi, DISABLE_ROLL_FORWARD))
 		seq_puts(seq, ",disable_roll_forward");
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
