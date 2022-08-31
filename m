Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F35A7931
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 10:39:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTJG1-0007zx-Ux;
	Wed, 31 Aug 2022 08:39:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1oTJFm-0007zh-B0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 08:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cftc5hA9i185wkJIPxplo6lU+f8BgAWyx3BZSfSTIlM=; b=VYx+BC9tgtcfVqA6YYa+nEgUD7
 b/9huXu64qS1XHh1klDafhupAXfnQJQEyHEBRNzYUvN6lrcg97l8zmadFot0jAg6JFB04IGBSqeM7
 3U0ErYE+XJSQ2Xo3tRaIkT3vISU735BchlcbyQey+kcJKeeV5mzg3WGtBG4ntAGcZA/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cftc5hA9i185wkJIPxplo6lU+f8BgAWyx3BZSfSTIlM=; b=Q
 QIAOxYYu9MxXm/jSZPWfYwDljFIRx6VPD9sE7ls1tM8UxBhbkgrcS0UZPsk/BCo4UvUQhsUL4v+xt
 f7JuAybr0v/ldlMhGbuTPu5aRXqRfdLuODSoWFIIfIm1rnMHqcADqbx+n6NTHKleNmod+WlLnw1qg
 iiTBZPPRiqndlt7M=;
Received: from mail-sgaapc01on2063.outbound.protection.outlook.com
 ([40.107.215.63] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTJFi-008YvB-Q5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 08:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W05kiFQdPzcEUn0M37luSLINydQNmHKJ2VdIRXKk2km4oqso9K0RRjWR6ExojBxNRwljWNeY5C+NnOGz033/Ty149dGix41cNwg1gPMi7jbhjl52+vrCM5A0wnj+xjfQVEb7ifvIKfdG4/fhG6qb4oMMr4/QSsxtw84BO+zLN10RZrCB7HTiB1hMg/+4T1Z16PYBJ2eH+EE9dOdj5P7EInxM8LfBSCKzBy21nRuKY0hOFaMDmE2USfrdJ75KlV4DFnRDfna7/NG8FyDGzcE9J1KMuQw56lgpcHWENIogUAoBeLY6a/CoWPHtzN+CeUaFDTysaj+KTUvf2LwD8bS3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cftc5hA9i185wkJIPxplo6lU+f8BgAWyx3BZSfSTIlM=;
 b=KCv4i4i8c4LBTuEpHcMoiyZUeLSH2x/hkBosC1JmiZO9EJnY23s+UyvtEatXtBvW5l9aeaSZN8mx8sEbijoNIvq3p6TH9xwSl9GIozTPC7J4BN9lsD7j+PgCkrSLvhNHIRzvIZeiM4Jtaup3vL2U/Jtt5LYNpR0qNFgUVI+EScnvkuaCAfxVI+A89uLOjGpHQZe+HfayuzhbimXjTLEtz/0KDBu7JyyXdkTw1fQCkmwx8Qry8YkZcuqVaAVTkp9S4DKEdv9AshmmTIWG9u/O0sYrlIm+jTkl+OZy/UaEuAwMwl+7QuBDXBvx/7om5GggOK52Seo0IRFOBi48uiWPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cftc5hA9i185wkJIPxplo6lU+f8BgAWyx3BZSfSTIlM=;
 b=lQampmsRc+4O2BvWN7lndBx3JNYq4ZL0E9dZl/YjSZW5RQ3PKIGfpJ6+yBzAFnU0XM239Pl9282QRsg4tVNFdxzraja6jGhfevkVtFXizIYpyFbWoRUvwl5psYlYSuFgZOc9kiVqxITJbRvZTa0Ih8dbwhIEu+lVRtPulojOLHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com (2603:1096:4:1f8::10)
 by TY2PR02MB4493.apcprd02.prod.outlook.com (2603:1096:404:800d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 08:39:00 +0000
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f]) by SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 08:39:00 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 31 Aug 2022 16:38:26 +0800
Message-Id: <1661935106-4851-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To SI2PR02MB6118.apcprd02.prod.outlook.com
 (2603:1096:4:1f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c74bc0e2-117c-474e-01ac-08da8b2c406d
X-MS-TrafficTypeDiagnostic: TY2PR02MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CydWI7bdep4l2vDsPDR9LtSB+SmW3otm53TtaIAtSeg4SnudwUrf47U+9rkquxvTYbLaH1s6CmIAjP2XKGyIECbEQJmwUxLZJ7zbqhRuvE26aoIOQt+MRVoknSSZl/dRVIO8Skmfijt1WHcK8jp4IBO9Lz0x424MzaBbasvHBpH7JDGCcTwjFR2QP1yXkVLaO/BAeSbBGQ1VW8+5Yo9h58FRqnetKzmwUYOuNqoIq97cMYK9+0Em3gHgCCh0B2Z1IBvoAwbl1BUAldG/ECpNJ0VdPY+1RorAVsnS/VctkwJ8D8BZU0t+ivWPl4i8zPIDsnJbG6SYEMMuluJDhAnhaFE2w+aYuB7BzsIucTNkDbDrg6TvlFmxWcJv2S2uMuCnoTn22hmPJeGRY6vKqb5dY47nuLY2+UndzQEcVjxbs7gNEKVLWKmlP7RutQ6/JGK38IRLljS03yzByoJMnfI6z3VLYYisYQ5HPsRg3h5PbZWNLi0Vd3JFPkgI8jpxZQXqyYa3mG2bCM0p1xI5fxbCvZwmYmI9hFqW0X2kSDa7Cf5DqvXPd6/g3UFlqHAU4Tf2o1lfpsPKmMf4nDACszLOILTEy5+mTUi8jOupildsLq43vM1/QMqjKVD7PneLXb7WSodSVG4vq2v0qKiLawPjjfw+2UkN9aYpL/PbZd+9QnlphlV+dDLtrkMejVYuYy1qUaBFvStXkwvgczIvewW+nYqr3Cx1lrfRTFkACf+xkHCmgkcHdLVD5bOI8Adz0G33
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB6118.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(5660300002)(52116002)(83380400001)(107886003)(6506007)(41300700001)(6666004)(36756003)(8936002)(478600001)(6486002)(8676002)(66556008)(66476007)(66946007)(4326008)(86362001)(2906002)(38100700002)(38350700002)(26005)(186003)(2616005)(6512007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KwpLBuONXlXv9sHm+YL5PHjUXXf3laC8VJ2XpzvME69LrVWHIiqFePn3fiI4?=
 =?us-ascii?Q?UtUyH16PFm5Cn6DiK2C9S8YEMHsZrckwtU3nN46zWL6M3Pm/LeVJq4KrEogC?=
 =?us-ascii?Q?SMxWS8xq3FgdqZPcTUaSgyGLgS4itWJ50CDf57sVb21S89nEoR4/yoj68qOG?=
 =?us-ascii?Q?srkubSOSb21BhEY4tRw15bHEy3m21lBayO4py/mcvP39KH4z3aKzFLwuCCsQ?=
 =?us-ascii?Q?x0/ktsBskW4c0ja5P6PzgNXXDJ0MeMvtH+RuVgY16BcNWDq91lCtAd1p1IRL?=
 =?us-ascii?Q?f9AmnFsTUwBZ/bLQD59RS+zNOL+HAUunRkg3Ey9Qttw+6r0C9aHotFZLE064?=
 =?us-ascii?Q?Ad3MKVlbx5vfyLh49rJfRtvmTUPihsdxHIslQZvHNuSVllPB2R8a4CI3HDtl?=
 =?us-ascii?Q?xNvqlYBOtpnVKFcimGI2F98sTMx9ooQ3UDOjWZvse/w9evyZ+eBe91zFhRm8?=
 =?us-ascii?Q?jgmuH1XvKsrsru6s0kUu8FxillvbOg6a88hk/k4m0fDbC1ZN5hzJmkhqcafK?=
 =?us-ascii?Q?PZJ3s+ZGnLGvuFpCdsvxqygYYusk//VF7vkGp376xhSKslIJbdjGdeg2jVlt?=
 =?us-ascii?Q?ETcw50ACk7fps56Dksg/Gh8+yGmvhPTdq1iAmxMwDFBnTf9Gvs9Pz0yPYTlE?=
 =?us-ascii?Q?Ce7miayc4UA2/sdNuqs9bOAg//jXFTEw5xEfGXG5n7cwLW5EKHClZRVtkRYG?=
 =?us-ascii?Q?CTpfkMQAcH9MjVWrS2imzFl27IooW8xsAtYcT5k9rGZ3PoJC0RcV9KLaAx2F?=
 =?us-ascii?Q?CIcfYkyPMpApJ/pMirVKxu2sH4EAWxCxFpCR1EVR+dysmBAXQzkV2KdVRQbq?=
 =?us-ascii?Q?BciEAq4hnWAoj7isALqr3e3JX3cWsr1+pABD58cJ2bq2fQTy/L+Lyy7z1XcM?=
 =?us-ascii?Q?fw6VeQP8wkj2MWYcO1aJ+/JkkiPAWhFjK3DI4dWaI+YuczkGwZ1CZl9f+xt1?=
 =?us-ascii?Q?fAg6w0HT43Fb37Zvhps8o3QtG8KxMcFWP3D3xFoUgcxaErXLTuW9Y8w9otdu?=
 =?us-ascii?Q?XPv2VA4cOKkDGf7srPPSy3WIposNMBgbU4KS67Hli88fbwQumpI+PShu59oX?=
 =?us-ascii?Q?5mfFQtJpEm/4mlCVHYJKp0oOuBw9Al0p9IvLjizr9OeO6WbCFCOZINvluBm2?=
 =?us-ascii?Q?0KLzByJ4LkUN09Fg/ztNj7/GqJIWma9pi5hE4gI5xOa1ttBvA4NRiy3Vrk0e?=
 =?us-ascii?Q?Q3O2xlR26ilHMCE1GrT6VKeIxm7Mu0ruO0GEQ+t/j3ZNX50TgcI/1VSGuFcd?=
 =?us-ascii?Q?KWlC9/oWkGImQOF7TCcWu7BLys5TWxQotiLZsQQFX3HYlFelfl0ojyj22UBa?=
 =?us-ascii?Q?sZI1W15pWQVAjVxn6Rr6jQao2/kAamrnpUzJejqipoHn3/Ssei5iksj7Qlkz?=
 =?us-ascii?Q?iM+/pHDGvGRc1yIiLclX9UgXCKngEunHDjlAqUHkCH1CC0FSaT9zmdZULzeS?=
 =?us-ascii?Q?FHYipgKGzyMCbIPzxXhJ77KtUCHpuvaofAnBsKfNHi19WfzGkg/JRBzgKIpt?=
 =?us-ascii?Q?jRN9IwwEhqUA5syoCrQg7J5B++d68faJ0EH35to5L+SixEMmuZvxtedJRr+m?=
 =?us-ascii?Q?gAN9iXuGg3myGmBSN8cQ4OrDOjTNgm6P7lwas0S/7KGf7/8zO7PFIhyu6/mU?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74bc0e2-117c-474e-01ac-08da8b2c406d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB6118.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 08:39:00.4553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6GDpkn65+uJx2UubGaWx34cCFUlJEyy0sAYZyHMsfpkC3fTL0c6bnYaG5PvysD0CQAQINfRCR26Skn7IV2geQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB4493
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We now use walltime for monthly period check. However the
 walltime is: * unstable(timestamp register reset) and settable(modified by
 user) * unreasonable(e.g: device power-off for one month, no data c [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.63 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.63 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oTJFi-008YvB-Q5
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: use elapsed_time in checkpoint for
 period check
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We now use walltime for monthly period check. However the walltime is:
* unstable(timestamp register reset) and settable(modified by user)
* unreasonable(e.g: device power-off for one month, no data changed)

When the walltime changes to the past before one month or the future
after one month, the period check in next fsck will fail to skip or
start a full scan. So, let's use the elapsed_time in checkpoint as
current time for period check.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 85 ++++++++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 43 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e2caac0..af24484 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -969,49 +969,6 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
-#if defined(__APPLE__)
-		if (!c.no_kernel_check &&
-			memcmp(c.sb_version, c.version,	VERSION_NAME_LEN)) {
-			c.auto_fix = 0;
-			c.fix_on = 1;
-			memcpy(sbi->raw_super->version,
-					c.version, VERSION_NAME_LEN);
-			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
-		}
-#else
-		if (!c.no_kernel_check) {
-			struct timespec t;
-			u32 prev_time, cur_time, time_diff;
-			__le32 *ver_ts_ptr = (__le32 *)(sbi->raw_super->version
-						+ VERSION_NAME_LEN);
-
-			t.tv_sec = t.tv_nsec = 0;
-			clock_gettime(CLOCK_REALTIME, &t);
-			cur_time = (u32)t.tv_sec;
-			prev_time = le32_to_cpu(*ver_ts_ptr);
-
-			MSG(0, "Info: version timestamp cur: %u, prev: %u\n",
-					cur_time, prev_time);
-			if (!memcmp(c.sb_version, c.version,
-						VERSION_NAME_LEN)) {
-				/* valid prev_time */
-				if (prev_time != 0 && cur_time > prev_time) {
-					time_diff = cur_time - prev_time;
-					if (time_diff < CHECK_PERIOD)
-						goto out;
-					c.auto_fix = 0;
-					c.fix_on = 1;
-				}
-			} else {
-				memcpy(sbi->raw_super->version,
-						c.version, VERSION_NAME_LEN);
-			}
-
-			*ver_ts_ptr = cpu_to_le32(cur_time);
-			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
-		}
-out:
-#endif
 		print_sb_state(sbi->raw_super);
 		return 0;
 	}
@@ -3582,6 +3539,48 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
+	if (c.func == FSCK) {
+#if defined(__APPLE__)
+		if (!c.no_kernel_check &&
+			memcmp(c.sb_version, c.version,	VERSION_NAME_LEN)) {
+			c.auto_fix = 0;
+			c.fix_on = 1;
+			memcpy(sbi->raw_super->version,
+					c.version, VERSION_NAME_LEN);
+			update_superblock(sbi->raw_super, SB_MASK_ALL);
+		}
+#else
+		if (!c.no_kernel_check) {
+			u32 prev_time, cur_time, time_diff;
+			__le32 *ver_ts_ptr = (__le32 *)(sbi->raw_super->version
+						+ VERSION_NAME_LEN);
+
+			cur_time = (u32)get_cp(elapsed_time);
+			prev_time = le32_to_cpu(*ver_ts_ptr);
+
+			MSG(0, "Info: version timestamp cur: %u, prev: %u\n",
+					cur_time, prev_time);
+			if (!memcmp(c.sb_version, c.version,
+						VERSION_NAME_LEN)) {
+				/* valid prev_time */
+				if (prev_time != 0 && cur_time > prev_time) {
+					time_diff = cur_time - prev_time;
+					if (time_diff < CHECK_PERIOD)
+						goto out;
+					c.auto_fix = 0;
+					c.fix_on = 1;
+				}
+			} else {
+				memcpy(sbi->raw_super->version,
+						c.version, VERSION_NAME_LEN);
+			}
+
+			*ver_ts_ptr = cpu_to_le32(cur_time);
+			update_superblock(sbi->raw_super, SB_MASK_ALL);
+		}
+#endif
+	}
+out:
 	print_ckpt_info(sbi);
 
 	if (c.quota_fix) {
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
