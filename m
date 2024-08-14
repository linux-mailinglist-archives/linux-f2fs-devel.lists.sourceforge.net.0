Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750595126E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 04:32:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se3oe-0007u5-TK;
	Wed, 14 Aug 2024 02:32:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1se3od-0007tx-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cxSAG1Dt6z3vTnaLtIDP98M0vbyUnxcgEXYmsOfDo3M=; b=ERlJUt84fgVJsV8kh6n+YjtzQG
 PoM+K8aUNBGC4djKxFLuMLTxLUF8DWH5ebG4al2mwUmmJm8HwkFxjwYqBxY8LH5OTwdnjyg0Bgtlo
 3rePpif3HJdu043GGLfDNisbTkWrOrVpP2Cqy9xKVzNzrlXRvmPjFOLARA50PXpouh40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cxSAG1Dt6z3vTnaLtIDP98M0vbyUnxcgEXYmsOfDo3M=; b=dI1IDqV/lTyuMXGpxvfRGQbGBG
 s7e8hJNT4UWM2aouQQ5+8b0fZf8dnSE1l2M+8kHj6mwT4Xd7y+aabp8VAEvMSz5PGfN31gPZFF1UH
 c6eW2lBZ/rUbl6z+Xw3FUEHGn71u6O6Og31czaJkD38e00bq0GrMbYG752mdutBxw03E=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se3oc-0005Uy-8j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WkBxH3Sh3z1j6Pv;
 Wed, 14 Aug 2024 10:27:47 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id D8CDC140109;
 Wed, 14 Aug 2024 10:32:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 10:32:38 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 14 Aug 2024 10:39:04 +0800
Message-ID: <20240814023912.3959299-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use an array of `fs_parameter_spec` called f2fs_param_specs
 to hold the mount option specifications for the new mount api. Signed-off-by:
 Hongbo Li <lihongbo22@huawei.com> --- fs/f2fs/super.c | 79
 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+) 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.191 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1se3oc-0005Uy-8j
Subject: [f2fs-dev] [PATCH 1/9] f2fs: Add fs parameter specifications for
 mount options
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 lihongbo22@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use an array of `fs_parameter_spec` called f2fs_param_specs to
hold the mount option specifications for the new mount api.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/f2fs/super.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3959fd137cc9..1bd923a73c1f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -28,6 +28,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/fs_parser.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -189,9 +190,87 @@ enum {
 	Opt_memory_mode,
 	Opt_age_extent_cache,
 	Opt_errors,
+	Opt_jqfmt,
+	Opt_checkpoint,
 	Opt_err,
 };
 
+static const struct constant_table f2fs_param_jqfmt[] = {
+	{"vfsold",	QFMT_VFS_OLD},
+	{"vfsv0",	QFMT_VFS_V0},
+	{"vfsv1",	QFMT_VFS_V1},
+	{}
+};
+
+static const struct fs_parameter_spec f2fs_param_specs[] = {
+	fsparam_string("background_gc", Opt_gc_background),
+	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
+	fsparam_flag("norecovery", Opt_norecovery),
+	fsparam_flag("discard", Opt_discard),
+	fsparam_flag("nodiscard", Opt_nodiscard),
+	fsparam_flag("no_heap", Opt_noheap),
+	fsparam_flag("heap", Opt_heap),
+	fsparam_flag("user_xattr", Opt_user_xattr),
+	fsparam_flag("nouser_xattr", Opt_nouser_xattr),
+	fsparam_flag("acl", Opt_acl),
+	fsparam_flag("noacl", Opt_noacl),
+	fsparam_s32("active_logs", Opt_active_logs),
+	fsparam_flag("disable_ext_identify", Opt_disable_ext_identify),
+	fsparam_flag("inline_xattr", Opt_inline_xattr),
+	fsparam_flag("noinline_xattr", Opt_noinline_xattr),
+	fsparam_s32("inline_xattr_size", Opt_inline_xattr_size),
+	fsparam_flag("inline_data", Opt_inline_data),
+	fsparam_flag("inline_dentry", Opt_inline_dentry),
+	fsparam_flag("noinline_dentry", Opt_noinline_dentry),
+	fsparam_flag("flush_merge", Opt_flush_merge),
+	fsparam_flag("noflush_merge", Opt_noflush_merge),
+	fsparam_flag("barrier", Opt_barrier),
+	fsparam_flag("nobarrier", Opt_nobarrier),
+	fsparam_flag("fastboot", Opt_fastboot),
+	fsparam_flag("extent_cache", Opt_extent_cache),
+	fsparam_flag("noextent_cache", Opt_noextent_cache),
+	fsparam_flag("noinline_data", Opt_noinline_data),
+	fsparam_flag("data_flush", Opt_data_flush),
+	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_u32("resgid", Opt_resgid),
+	fsparam_u32("resuid", Opt_resuid),
+	fsparam_string("mode", Opt_mode),
+	fsparam_s32("fault_injection", Opt_fault_injection),
+	fsparam_u32("fault_type", Opt_fault_type),
+	fsparam_flag("quota", Opt_quota),
+	fsparam_flag("noquota", Opt_noquota),
+	fsparam_flag("usrquota", Opt_usrquota),
+	fsparam_flag("grpquota", Opt_grpquota),
+	fsparam_flag("prjquota", Opt_prjquota),
+	fsparam_string_empty("usrjquota", Opt_usrjquota),
+	fsparam_string_empty("grpjquota", Opt_grpjquota),
+	fsparam_string_empty("prjjquota", Opt_prjjquota),
+	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
+	fsparam_string("alloc_mode", Opt_alloc),
+	fsparam_string("fsync_mode", Opt_fsync),
+	fsparam_string("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("inlinecrypt", Opt_inlinecrypt),
+	fsparam_string("checkpoint", Opt_checkpoint),
+	fsparam_flag("checkpoint_merge", Opt_checkpoint_merge),
+	fsparam_flag("nocheckpoint_merge", Opt_nocheckpoint_merge),
+	fsparam_string("compress_algorithm", Opt_compress_algorithm),
+	fsparam_u32("compress_log_size", Opt_compress_log_size),
+	fsparam_string("compress_extension", Opt_compress_extension),
+	fsparam_string("nocompress_extension", Opt_nocompress_extension),
+	fsparam_flag("compress_chksum", Opt_compress_chksum),
+	fsparam_string("compress_mode", Opt_compress_mode),
+	fsparam_flag("compress_cache", Opt_compress_cache),
+	fsparam_flag("atgc", Opt_atgc),
+	fsparam_flag("gc_merge", Opt_gc_merge),
+	fsparam_flag("nogc_merge", Opt_nogc_merge),
+	fsparam_string("discard_unit", Opt_discard_unit),
+	fsparam_string("memory", Opt_memory_mode),
+	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
+	fsparam_string("errors", Opt_errors),
+	{}
+};
+
 static match_table_t f2fs_tokens = {
 	{Opt_gc_background, "background_gc=%s"},
 	{Opt_disable_roll_forward, "disable_roll_forward"},
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
