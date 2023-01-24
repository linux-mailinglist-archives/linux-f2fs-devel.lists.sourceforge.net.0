Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6919679D94
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jan 2023 16:34:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKLJP-0007uc-PX;
	Tue, 24 Jan 2023 15:34:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pKLJO-0007uR-3H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWTwX2GEQqTlCLwksBsX1n06U4YmhekP4Gv4TwhYbzA=; b=FQ1OWaavhC8/1i2ZIJnDBNe/yi
 hxa6yAC3ofqgwFwD5l1M1CwPLbczK+HkU2olFeRjIhptt8uMgjYp+8ryG7YeKWevxCyXJr9fuCO9q
 vJeL6TG/szdiIYNJLrPGHeFTkO5PcSO+wbtZGrcCJI9qnGQWJ9F1+MWFQUL1kR1B1GVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GWTwX2GEQqTlCLwksBsX1n06U4YmhekP4Gv4TwhYbzA=; b=CVOOhhYX7skr54Re2hrDinyKar
 ssaUSq9qOKQkOOo/5k/kiea2jRfDbPBSoq++aOf2NGajaye5Ex62xrE4yYM/Yyj/PueJPyiA9kmSI
 qQs3hfdY3Ps3IU2P2TbllLmb8h3u+9JYn2RHPpoonqfAkQt0bX+8+WVGg8t/MwF6Dzh8=;
Received: from mail-sgaapc01on2135.outbound.protection.outlook.com
 ([40.107.215.135] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKLJM-0004P9-Ag for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfJiHr3hWxcdzJh3l8qYWBk0Pm6/16ZZXqcrQOsGAk44KciKexclnEpE34Uau/nXQOml79vN1ClSIbevWAxf64C7Zs2oWCfwydIDq250ohaqvcOvpYl6GKm0i5s49BqIA7zyC/LDMCZHb6jbAYStpSUEYFkRsU/q0ivDtTBVGAac39Df9Yos44bpNHOuk36xX+c8j60LVAmdbeM5S0mNS5azDCzHWqiNBQJ9Gzf4CTJbfgDckNQ2DFx5TcU3+r4zHm/tdvg+ZFLx6PW9zQQY3JP/Yiy53fZawKaR2szD0ggMcG7Sx6nYGfCqYs27KVR1WAuLx5m4I1Nf5ouzRWsTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWTwX2GEQqTlCLwksBsX1n06U4YmhekP4Gv4TwhYbzA=;
 b=cSwk+NS2GAzKMas6/UdVQsn8MzNA/lRUOtwdq7Y2CtKYMhqlAz4gpPlfS38DVYn/Pap4frU0aoAIo8GuONMAX11YBabJZQB6NJqaTP9Gr2H5yzfvO5bVr2ofC5Y8k1hg0WHjZUttUmZsLOxRjrwwkVwtQGneT4zkUpq776X46Wu0E32dw9AUij1txRas/HeNRXOJX3hqCSiO6n0E3FN06HQIbXNQHQB6OXXn4oBrfMnUShmTIgmE0HVBO8GCfHd5mVZ7slLt8yDMExDjOLKEvf/8HfJgzStSNHIVt2bzSYHe4FRcELgabahBMWZca07jxDfCx4nGRdqe92TXvdZciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWTwX2GEQqTlCLwksBsX1n06U4YmhekP4Gv4TwhYbzA=;
 b=iJxcMkTZCv9lrjSru1+JdEHghXGE5kE7BXAs5EfcZItrnZtsUfbLV0sr3D7qRi1Kz/wwTgyE7ne+KkL+2fGF2RA5+xJ3TnSjTIjnsmfKkPxYa+DcVqkiM1CuAFz2OXRMYw73KBYwn79lV9Hggb+L4uA3Vg2uquCuBIGoyCSrt8Em1MDcZwNQFFFDfbxc2Bn5WtOWyY/d6DROSKhuBRJHZQv/nbSO/6sjTZDhygOa22Ou7MomhDc8FH5TzRM0WAiDkLYPNMEA7mKew0B11I9ilAaVw00yeDIhL2V5WFhgs43DpvtXa6gtM3Cgc6YUsglI8CDR4UGSscuyBJpoJD1zXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5019.apcprd06.prod.outlook.com (2603:1096:4:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Tue, 24 Jan
 2023 15:33:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6043.016; Tue, 24 Jan 2023
 15:33:59 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 24 Jan 2023 23:33:44 +0800
Message-Id: <20230124153346.74881-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230124153346.74881-1-frank.li@vivo.com>
References: <20230124153346.74881-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6e1fa0-f0a5-4c94-4ecc-08dafe2069a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqLaTs3e0EY/WjmCF4MKS8pt60Cg4kTJMqg8pbVs/GHPMoGR+DEJ5sFsLZzfioJ8ZoMdgT+JoVesq8rWZkaQ9rhQEua0vSzqkr2fpKpJl3hSt1UNqWSVV2KMNc20P84REP1/tK6e3IkM2iIlqLewRJE6BYlnVdA6XshcK1FlbLLNkTVs9McT4CUGrlkHdg49WY6z/1DJ4vHRcB4znDRV9XZMaLFywPDnORDW9Tf+SRaLbppNtnY3kBmG31rU0rZe5YQ14j3sRE/vmgKIYoAm4GrbRtyPY2+1h5Cqlwm0Wf23BMUin8PfgWxcTf3iIrlKfsIUiDcIzqcAQNuHUUAMlP7rrWQbJOzQeNTwgThfX3Ys0/PjCYrh+JDCY0gvoYgKDdssKJQH8HGSBxa50CWztoglO9E2JtA2RF2Kg5YQE2NFnVUzlCTF/cvhG/4ZEElN7rpPKvByHnQUOVzLLeXlJomrJBULNELDkc/K308pJCCE85bQyXColUqgbO+yeB0REzmySlKZH6n7G2A0C15gKWrs4/Wb1KzMHsr2ZhBHKBJRM8dDfo+MTclZa/LDh+CM5s8DQqUWye8x+9V5iScPT0/1uKAIdUkN8qfVT3CjSMDDoUpEjjjxIL3kgf5qpccdzZ4MWysqMbD5pjpDltdO+vD9f8TbreUKkTCkLSuxTrt5eG91kjS83YLu9PmgeO6LKRLRHPTtMHWhpUkbEQ9Smg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(2616005)(2906002)(6512007)(26005)(86362001)(186003)(38350700002)(38100700002)(36756003)(8936002)(52116002)(316002)(5660300002)(83380400001)(41300700001)(6666004)(107886003)(478600001)(6506007)(6486002)(4326008)(8676002)(66476007)(1076003)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSG714e7Ld9oWhlX3QneEh9e4ayOY1MqvVNaA26drbknYP+IxHjU2Nh6gDw6?=
 =?us-ascii?Q?k5O8JN9AbJoR7Npxs12FtYGf94+6T8uQvnzEqF7pF3qIuxKxaNYjxoxK971g?=
 =?us-ascii?Q?/OQ/Y4B62c3CwevDx934BfT5w7/fJ0CjsEP6AG93M/GExl0p1LwywKWhSo15?=
 =?us-ascii?Q?BFDGZR7oE6NzXfEW8N/9gsqN7xxRSQgLU+et1bt39EbHnqIZ3ALfL221vIBt?=
 =?us-ascii?Q?DkUouX0aICCPi7iIWx75VX7RfaWjyug5qKFgzAedFBpwoVReFM/2pn73tv3g?=
 =?us-ascii?Q?iezQlvoaDaEK1kB2qbyq37mveaGC0hPOngm78KVlW+c2wstAcLFaqSGY86Fb?=
 =?us-ascii?Q?wCDaM7298Cnk5nyMs0OOLc/A5kYfukOHYe0itZd1BcXT9R5BkRogqQKmK3R/?=
 =?us-ascii?Q?jC/lC1nNpCWlvtV7TzeAGuxqwQ8HVd/E5H42qbuF1IrZBvCA6FhLoP+aqbmK?=
 =?us-ascii?Q?pL/ssFMXXWz5JCfHQXZCP13TZggqDV9D1ewviVzeTt6NcNoK2s4Zv/0Bsumw?=
 =?us-ascii?Q?u5xuTjG9fjOJBB3JfmCl6tuihXmQMquIFT3qQ7MgEm6gAqmhkWKc4weKWsL6?=
 =?us-ascii?Q?b4vKk3D3lSX1Yj8Vbj8Ktp1DX4J39ilrDYKcKX43sydAIqOdwp7iforrdF0D?=
 =?us-ascii?Q?PONfYxbLLOnqQFFeVslvNCO9Fy5B13VTgrJcb9jP60ni74DyI2PnZC6ECGjK?=
 =?us-ascii?Q?q32MQzupBRvbMj/xLsMFe8xUQnKZpTii/VyLBffvZlhqBIlKUTvcRIOj4iB6?=
 =?us-ascii?Q?7IWO33eEceYZ773wC+xKphHY/gocXE+ocHzOp3xyRVyv1KL8b/etZZHT/Om4?=
 =?us-ascii?Q?QF1KSIxJ/KxLjncDguMEI1/Ll9XDEck1Ty+VlZeTHI5hFIsJSxtE4b2AnmU6?=
 =?us-ascii?Q?/rNlh3EQniAPWp1uHZQk7fpvsZJ7QCF7wjYegcIVhFzdBr/KZxjAAwZ3gTF/?=
 =?us-ascii?Q?fRup1YxOQ9bE1uFT5ZQKVSOe4lwkNtBRO1wvT9sJzxoGaFnCH4Tw0faP5wck?=
 =?us-ascii?Q?DhDR2LAH76GegcshyzCMq/rSGki9M1eh3jNbKt0LfEx6+WqNgl9FcHTIAhMM?=
 =?us-ascii?Q?gyyT45TAjttgFFrBlCwM7wv29wEt14rq99/d8Jhty/GhBI2l/TJ90dqBLCWu?=
 =?us-ascii?Q?YsSfuUGR6V3dNgGKAcb95umo2xYZYxbvhNZOTP4D1WzDnATK1CTWKw4pIT7E?=
 =?us-ascii?Q?N/Lmfy9V13q9t4Uvkz76vSyc6vC9qrC9zG5ByYZPpSOI+dHSr02JvJqx4yfM?=
 =?us-ascii?Q?CslIMq+PllXj+GHhunpQKrQ7nUW1THgpa6fJGjwg8Bk/iu3Q6dA7IaMR5cjK?=
 =?us-ascii?Q?755RVgWLIuXVGzkg7yxXVPVWKGfbN/8EeRLWyE/sCwupdS9tV5BJDB32gZyE?=
 =?us-ascii?Q?L7LvVADg0ebUoDEcNociJfhh8ixw7xBwgbdlTD54IO9cIOtvDOUZrNguGBop?=
 =?us-ascii?Q?2bGc8G/L7rc90NxzRGaNWFNObkYudFbjv6gHpenKDAuXaYHoQRK9uYdVamcU?=
 =?us-ascii?Q?SwVIulw06twaURFkrP1qls3ffGO2MjFq3+APNhdVK8ceSxmzgPBDhOvv0TmN?=
 =?us-ascii?Q?DFgg/TTXbhx/KSL1pRGnbBT+g7onYPLUoQZGxpuH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6e1fa0-f0a5-4c94-4ecc-08dafe2069a2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:33:59.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3YsLk4w62/HtYXRS2GiKu2emPbfS70A/6oR0T6QQ8RJjRZSdeWbadFauECvKTBuxC2z4YjcYtzv9kXOdFdJZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5019
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_set_lz4hc_level() and f2fs_set_zstd_level() have common
 code, let's introduce f2fs_set_compress_level() to do sanity compress level
 check. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/super.c
 | 57 +++++++++++++++ 1 file changed, 17 insertions(+), 40 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.135 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.135 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pKLJM-0004P9-Ag
Subject: [f2fs-dev] [PATCH 2/4] f2fs: introduce f2fs_set_compress_level()
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

f2fs_set_lz4hc_level() and f2fs_set_zstd_level() have common code,
let's introduce f2fs_set_compress_level() to do sanity compress level
check.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 57 +++++++++++++++----------------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ad5df4d5c39a..b5fbe9939390 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -588,40 +588,12 @@ static int f2fs_test_compress_extension(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-#ifdef CONFIG_F2FS_FS_LZ4HC
-static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
+static int __maybe_unused f2fs_set_compress_level(struct f2fs_sb_info *sbi,
+					const char *str, const char *alg_name,
+					unsigned int min, unsigned int max)
 {
 	unsigned int level;
-
-	str += 3;
-
-	if (str[0] != ':') {
-		f2fs_info(sbi, "wrong format, e.g. <alg_name>:<compr_level>");
-		return -EINVAL;
-	}
-	if (kstrtouint(str + 1, 10, &level))
-		return -EINVAL;
-
-	if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
-		f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
-		return -EINVAL;
-	}
-
-	F2FS_OPTION(sbi).compress_level = level;
-	return 0;
-}
-#endif
-
-#ifdef CONFIG_F2FS_FS_ZSTD
-static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
-{
-	unsigned int level;
-	int len = 4;
-
-	if (strlen(str) == len) {
-		F2FS_OPTION(sbi).compress_level = 0;
-		return 0;
-	}
+	int len = strlen(alg_name);
 
 	str += len;
 
@@ -632,8 +604,8 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (!level || level > zstd_max_clevel()) {
-		f2fs_info(sbi, "invalid zstd compress level: %d", level);
+	if (level < min || level > max) {
+		f2fs_info(sbi, "invalid %s compress level: %d", alg_name, level);
 		return -EINVAL;
 	}
 
@@ -641,7 +613,6 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	return 0;
 }
 #endif
-#endif
 
 static int parse_options(struct super_block *sb, char *options, bool is_remount)
 {
@@ -1077,7 +1048,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 					F2FS_OPTION(sbi).compress_level = 0;
 				} else {
 #ifdef CONFIG_F2FS_FS_LZ4HC
-					ret = f2fs_set_lz4hc_level(sbi, name);
+					ret = f2fs_set_compress_level(sbi, name, "lz4",
+						LZ4HC_MIN_CLEVEL, LZ4HC_MAX_CLEVEL);
 					if (ret) {
 						kfree(name);
 						return -EINVAL;
@@ -1094,10 +1066,15 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #endif
 			} else if (!strncmp(name, "zstd", 4)) {
 #ifdef CONFIG_F2FS_FS_ZSTD
-				ret = f2fs_set_zstd_level(sbi, name);
-				if (ret) {
-					kfree(name);
-					return -EINVAL;
+				if (strlen(name) == 4) {
+					F2FS_OPTION(sbi).compress_level = 0;
+				} else {
+					ret = f2fs_set_compress_level(sbi, name, "zstd", 1,
+						zstd_max_clevel());
+					if (ret) {
+						kfree(name);
+						return -EINVAL;
+					}
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
