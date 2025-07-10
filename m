Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A1B0015F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 14:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rgc+kIu35NR4I0xGXAgvD9XBBLEWe4xP6gXPoFG3Zqs=; b=jpVDpUKE06q+XKKBr9fAS1OrFg
	WIe4Bb0KG/iLOkEflWD8hhWMnUsRWNJJMq2ZRj50R1AiicYF1sdl3UWdhYJ1BfCz4qhsLaXsyA8OA
	Mx4aky9oZ3sXvqupaAcWass9VNiuhN36CcwtJAVqn8wbbqNOLmwXTn1bF43N3Qmer4tM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZqBv-0001y2-D9;
	Thu, 10 Jul 2025 12:15:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uZqBt-0001xu-LJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 12:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=raeO66BE1mG4aX0F3H+NdGxeZu/xvCpceySgbAPSDe4=; b=gOlPdv0hVgF/LTEwPIlMm1pkpC
 7IQAxC0hGCjeCMkipUzZIF8X5yJH4FiMsN/qseHvNbCacFmR+Qe3GfN0amOpqvv2OYm+SNXL1rO3K
 xaaJiTSCmV6UHzy/P08lRCb2Aw/4WqxaM4oe05CQOE1Q+7nrRNU+sqQ3P+aC5Jk70ei0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=raeO66BE1mG4aX0F3H+NdGxeZu/xvCpceySgbAPSDe4=; b=gMH0vUZqQ9l+Kmp8kYvOG3U8GQ
 0ZqnzYZpzs8U3ZkFxLOx05oJPgDxuix7tTKEB7goLWlACXGJ5HmcYPh+bKT0S9Inn/nWHWRpnGAFm
 w/hhjdFzWeytQt5dOEpIIpX7T3sgEleUH9ScfR1CrOXJjv1oR3kWYq/4FDlTFJUpoI2s=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZqBs-00020B-1J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 12:15:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bdDJH2h1zz1d1h5;
 Thu, 10 Jul 2025 20:13:03 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 792A2140118;
 Thu, 10 Jul 2025 20:15:43 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Jul
 2025 20:15:42 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 10 Jul 2025 12:14:09 +0000
Message-ID: <20250710121415.628398-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250710121415.628398-1-lihongbo22@huawei.com>
References: <20250710121415.628398-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.162]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use an array of `fs_parameter_spec` called f2fs_param_specs
 to hold the mount option specifications for the new mount api. Add
 constant_table
 structures for several options to facilitate parsing. Signed-off-by: Hongbo
 Li <lihongbo22@huawei.com> [sandeen: forward port, minor fixes and updates,
 more fsparam_enum] Signed-off-by: Eric Sandeen <sandeen@redhat.com> ---
 fs/f2fs/super.c | 122 ++++++++ [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uZqBs-00020B-1J
Subject: [f2fs-dev] [PATCH v5 1/7] f2fs: Add fs parameter specifications for
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
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use an array of `fs_parameter_spec` called f2fs_param_specs to
hold the mount option specifications for the new mount api.

Add constant_table structures for several options to facilitate
parsing.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port, minor fixes and updates, more fsparam_enum]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 73492270ea93..713dc55f086b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -27,6 +27,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/fs_parser.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -196,9 +197,130 @@ enum {
 	Opt_age_extent_cache,
 	Opt_errors,
 	Opt_nat_bits,
+	Opt_jqfmt,
+	Opt_checkpoint,
 	Opt_err,
 };
 
+static const struct constant_table f2fs_param_background_gc[] = {
+	{"on",		BGGC_MODE_ON},
+	{"off",		BGGC_MODE_OFF},
+	{"sync",	BGGC_MODE_SYNC},
+	{}
+};
+
+static const struct constant_table f2fs_param_mode[] = {
+	{"adaptive",		FS_MODE_ADAPTIVE},
+	{"lfs",			FS_MODE_LFS},
+	{"fragment:segment",	FS_MODE_FRAGMENT_SEG},
+	{"fragment:block",	FS_MODE_FRAGMENT_BLK},
+	{}
+};
+
+static const struct constant_table f2fs_param_jqfmt[] = {
+	{"vfsold",	QFMT_VFS_OLD},
+	{"vfsv0",	QFMT_VFS_V0},
+	{"vfsv1",	QFMT_VFS_V1},
+	{}
+};
+
+static const struct constant_table f2fs_param_alloc_mode[] = {
+	{"default",	ALLOC_MODE_DEFAULT},
+	{"reuse",	ALLOC_MODE_REUSE},
+	{}
+};
+static const struct constant_table f2fs_param_fsync_mode[] = {
+	{"posix",	FSYNC_MODE_POSIX},
+	{"strict",	FSYNC_MODE_STRICT},
+	{"nobarrier",	FSYNC_MODE_NOBARRIER},
+	{}
+};
+
+static const struct constant_table f2fs_param_compress_mode[] = {
+	{"fs",		COMPR_MODE_FS},
+	{"user",	COMPR_MODE_USER},
+	{}
+};
+
+static const struct constant_table f2fs_param_discard_unit[] = {
+	{"block",	DISCARD_UNIT_BLOCK},
+	{"segment",	DISCARD_UNIT_SEGMENT},
+	{"section",	DISCARD_UNIT_SECTION},
+	{}
+};
+
+static const struct constant_table f2fs_param_memory_mode[] = {
+	{"normal",	MEMORY_MODE_NORMAL},
+	{"low",		MEMORY_MODE_LOW},
+	{}
+};
+
+static const struct constant_table f2fs_param_errors[] = {
+	{"remount-ro",	MOUNT_ERRORS_READONLY},
+	{"continue",	MOUNT_ERRORS_CONTINUE},
+	{"panic",	MOUNT_ERRORS_PANIC},
+	{}
+};
+
+static const struct fs_parameter_spec f2fs_param_specs[] = {
+	fsparam_enum("background_gc", Opt_gc_background, f2fs_param_background_gc),
+	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
+	fsparam_flag("norecovery", Opt_norecovery),
+	fsparam_flag_no("discard", Opt_discard),
+	fsparam_flag("no_heap", Opt_noheap),
+	fsparam_flag("heap", Opt_heap),
+	fsparam_flag_no("user_xattr", Opt_user_xattr),
+	fsparam_flag_no("acl", Opt_acl),
+	fsparam_s32("active_logs", Opt_active_logs),
+	fsparam_flag("disable_ext_identify", Opt_disable_ext_identify),
+	fsparam_flag_no("inline_xattr", Opt_inline_xattr),
+	fsparam_s32("inline_xattr_size", Opt_inline_xattr_size),
+	fsparam_flag_no("inline_data", Opt_inline_data),
+	fsparam_flag_no("inline_dentry", Opt_inline_dentry),
+	fsparam_flag_no("flush_merge", Opt_flush_merge),
+	fsparam_flag_no("barrier", Opt_barrier),
+	fsparam_flag("fastboot", Opt_fastboot),
+	fsparam_flag_no("extent_cache", Opt_extent_cache),
+	fsparam_flag("data_flush", Opt_data_flush),
+	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_gid("resgid", Opt_resgid),
+	fsparam_uid("resuid", Opt_resuid),
+	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
+	fsparam_s32("fault_injection", Opt_fault_injection),
+	fsparam_u32("fault_type", Opt_fault_type),
+	fsparam_flag_no("lazytime", Opt_lazytime),
+	fsparam_flag_no("quota", Opt_quota),
+	fsparam_flag("usrquota", Opt_usrquota),
+	fsparam_flag("grpquota", Opt_grpquota),
+	fsparam_flag("prjquota", Opt_prjquota),
+	fsparam_string_empty("usrjquota", Opt_usrjquota),
+	fsparam_string_empty("grpjquota", Opt_grpjquota),
+	fsparam_string_empty("prjjquota", Opt_prjjquota),
+	fsparam_flag("nat_bits", Opt_nat_bits),
+	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
+	fsparam_enum("alloc_mode", Opt_alloc, f2fs_param_alloc_mode),
+	fsparam_enum("fsync_mode", Opt_fsync, f2fs_param_fsync_mode),
+	fsparam_string("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("test_dummy_encryption", Opt_test_dummy_encryption),
+	fsparam_flag("inlinecrypt", Opt_inlinecrypt),
+	fsparam_string("checkpoint", Opt_checkpoint),
+	fsparam_flag_no("checkpoint_merge", Opt_checkpoint_merge),
+	fsparam_string("compress_algorithm", Opt_compress_algorithm),
+	fsparam_u32("compress_log_size", Opt_compress_log_size),
+	fsparam_string("compress_extension", Opt_compress_extension),
+	fsparam_string("nocompress_extension", Opt_nocompress_extension),
+	fsparam_flag("compress_chksum", Opt_compress_chksum),
+	fsparam_enum("compress_mode", Opt_compress_mode, f2fs_param_compress_mode),
+	fsparam_flag("compress_cache", Opt_compress_cache),
+	fsparam_flag("atgc", Opt_atgc),
+	fsparam_flag_no("gc_merge", Opt_gc_merge),
+	fsparam_enum("discard_unit", Opt_discard_unit, f2fs_param_discard_unit),
+	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
+	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
+	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
+	{}
+};
+
 static match_table_t f2fs_tokens = {
 	{Opt_gc_background, "background_gc=%s"},
 	{Opt_disable_roll_forward, "disable_roll_forward"},
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
