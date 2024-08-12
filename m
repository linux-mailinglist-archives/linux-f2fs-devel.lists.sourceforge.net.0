Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553994E9B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2024 11:26:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdRJM-0004Y0-BS;
	Mon, 12 Aug 2024 09:25:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1sdRJ9-0004XF-0f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 09:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GYllwYQCI3oRA0Bvt/CXHmjU7RNpfzGKgX5tEQIIDw=; b=inkSzhPZizdvVo0Rh9QJIJBH8Q
 u43xf0xLaoAU5Xzz3RH3I3PVBGOfA/dg+i168htuSmjxZ490X5CQX/E+GMrEZuZk7IUYNMJrq6qt1
 rrYjSXwBfLhEvg4AXszyq4YF9aSky8AbD/feCTyr0ZdpObPjR9Am0d/G0S1u3EhQJSJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1GYllwYQCI3oRA0Bvt/CXHmjU7RNpfzGKgX5tEQIIDw=; b=Cjyuh4BKwMGSyFWHyY+3hf/3Ek
 NPgSRO0Jb2giOEgIzKoF8Bhrbq7yuTinMedJvsV7nployTOWafGINdHPTDYs1B682PN5vcqN8E93p
 0ySvgoarAMf/50ZjJa/83349dqZ10N/98WrBhvh2Ej/LWqEdyuzoluUw2phaMFJIX9GA=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdRJ8-0002Ph-3J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 09:25:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wj7rk6flnz1T75l;
 Mon, 12 Aug 2024 17:05:10 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id EE66A140137;
 Mon, 12 Aug 2024 17:05:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 12 Aug
 2024 17:05:37 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 12 Aug 2024 17:12:10 +0800
Message-ID: <20240812091218.2922787-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812091218.2922787-1-lihongbo22@huawei.com>
References: <20240812091218.2922787-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use an array of `fs_parameter_spec` called f2fs_param_specs
 to hold the mount option specifications for the new mount api. Signed-off-by:
 Hongbo Li <lihongbo22@huawei.com> --- fs/f2fs/super.c | 86
 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+) 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.255 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.255 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdRJ8-0002Ph-3J
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
Cc: lihongbo22@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use an array of `fs_parameter_spec` called f2fs_param_specs to
hold the mount option specifications for the new mount api.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/f2fs/super.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3959fd137cc9..dee482bcf6e9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -28,6 +28,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/fs_parser.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -190,6 +191,91 @@ enum {
 	Opt_age_extent_cache,
 	Opt_errors,
 	Opt_err,
+	Opt_jqfmt,
+	Opt_checkpoint,
+};
+
+static const struct constant_table f2fs_param_jqfmt[] = {
+	{"vfsold",	QFMT_VFS_OLD},
+	{"vfsv0",	QFMT_VFS_V0},
+	{"vfsv1",	QFMT_VFS_V1},
+	{}
+};
+
+static const struct constant_table f2fs_param_checkpoint[] = {
+	{"disable",	Opt_checkpoint_disable},
+	{"enable",	Opt_checkpoint_enable},
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
+	fsparam_string("checkpoint", Opt_checkpoint_disable_cap),
+	fsparam_enum("checkpoint", Opt_checkpoint, f2fs_param_checkpoint),
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
 };
 
 static match_table_t f2fs_tokens = {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
