Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBDA9524D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 16:01:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6rhf-0000IB-Kx;
	Mon, 21 Apr 2025 14:00:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u6rhd-0000I4-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnMSRJ92thPAf8d6gJuz/+gg3IPM/ZWNDFscO+AmVK4=; b=M2YQlc5cSzWiCQnQVi70C3Ydt7
 9g8ZK02B/mRlo3eKepTUEh4Wo86pAG8/FpVbXgknpHRqMS996e7hMXpNjbtGatYEqg4pMAshCd3tG
 lvag6oG7nUwmUgU39Z4JdeiOL0B14UqhUUT71QEA8A+ad178AOTL+EWZd8dbszDGvDtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnMSRJ92thPAf8d6gJuz/+gg3IPM/ZWNDFscO+AmVK4=; b=OEdEWP/hOXOeSmI8zVpErwGPMg
 bZ4Z56oDSDoRZXwvbJtMo6fyjTrEJ7jXKA1iZZGa2mSPgL04fLlAqo5PYmO78Ekr81cSiW1uzA5lr
 sUPU6kdEEUm+uTVgsxMV9kAJBV00MlgQj9QU581h0yU9qHFB/PQS+q8swyaQtYPzBxIs=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u6rhN-0003xZ-O1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745244021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnMSRJ92thPAf8d6gJuz/+gg3IPM/ZWNDFscO+AmVK4=;
 b=Hm1Bx3KLNrLLuIZdulPgKIjQ+XmKGhLWCdn41z/bhk1gz/f9ldHmRTb+BWLqyZ5YGgw2GK
 VWStbiTefUDaqHrtxA2d0rWHs82xr+td0L1FLp+zPYy11AUfptzuHtPmWyOULf1wpLxY+o
 rrLnq1exjcoSugOPPqwy/bEmlZv2yQQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-tZSrPrG7OoC44PR6L5IYIA-1; Mon, 21 Apr 2025 10:00:19 -0400
X-MC-Unique: tZSrPrG7OoC44PR6L5IYIA-1
X-Mimecast-MFC-AGG-ID: tZSrPrG7OoC44PR6L5IYIA_1745244018
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85e4f920dacso357553439f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 07:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745244018; x=1745848818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnMSRJ92thPAf8d6gJuz/+gg3IPM/ZWNDFscO+AmVK4=;
 b=wn7fXWN6q53xre4rC/qJDs5G8SPrJRnt+dYjuN2l0HTf25vMIL3nHqs8HyI+393pA7
 YU8ox9PpqoNWgoRGp24fdRfhdoFLHcclNBt1PS84jeOe6PcrsJuLvFoVvpEo5Od4yVqa
 EXx8nMGiWv+4oGcgCO9Vxna4iyqkhzsbtHs5XXnr9z7qqIs65icjmUpBl0GFOpEo7q3Z
 X8Ffak8olnF6yc50TSaoiABry0QAGDIRSeG8dIM8nyGFDqe81mINw5s9nIhUeFfC+wUS
 GPEyKkJ/VuDSMnrJrZu0g5C+HR6iDD5rLxXt39UXHqSUGsEwV/VW5ZLZdqrs6ibvN2nw
 s1qQ==
X-Gm-Message-State: AOJu0Yz+UiEzgUd3VA/A32SQXwuBCJnJL1yH8H/Xknd+Zj8wCwHwPKSQ
 b4tZ6Jwji2F8z740ewaQH+GiH2uWu3XeqTNGWCIxOTZAFVysLlFCYbCMb62PFfRsQRWaaNjU0wd
 x7McFGaA7cU37FZs+cUQIHEmUvxhWvoTfjVMDoolwG7pCOC1h0fniiWp5+1vqYRX9dDuhkhoug/
 nZgFWiL9QDEVGMmAR53GkepfYl7fVDJEY1UiicRSKD/DxVQZFde1fAf/UMzQ==
X-Gm-Gg: ASbGncvZNU8yr4KJgc969ozvfoFEhaTIkq3TrV1iOeCV9QeSMHcKWezvO8yonuPTTyc
 iIxms8AHY0lBC8vQtduz2kQIhxzW5PbkOD+7dzeB9ZQwu588CuPyXoijFDSyYbwJ/oCP+hPqTwm
 jrynPpytdOHOmfIGBSNNUlqw7c/6UrCamNV/Pxv+1MOk0lmRcqmgQie1sRZfkGvn5BmmotfTlZN
 MkiACcrMzrIQvUUJ/n7zl8paTAP9MuL5EIR+RFxeUHvJjCszFyPyWQoeaCW+K8A5nnwYo1ebcVd
 swCZDdlfmTleUX4=
X-Received: by 2002:a05:6602:2744:b0:85e:2eba:20ad with SMTP id
 ca18e2360f4ac-861dbdd0e20mr971646639f.2.1745244018011; 
 Mon, 21 Apr 2025 07:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjZceBrnW6io/Db5jF8/ovuchTlZqkVCfiBdzbHOG2ADRJhEmL1Qeigz6S80PUNL/BPwvlow==
X-Received: by 2002:a05:6602:2744:b0:85e:2eba:20ad with SMTP id
 ca18e2360f4ac-861dbdd0e20mr971641339f.2.1745244017383; 
 Mon, 21 Apr 2025 07:00:17 -0700 (PDT)
Received: from fedora.. ([65.128.104.55]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f6a3839336sm1788866173.73.2025.04.21.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 07:00:17 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Apr 2025 10:25:00 -0500
Message-ID: <20250420154647.1233033-2-sandeen@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250420154647.1233033-1-sandeen@redhat.com>
References: <20250420154647.1233033-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EDD0buYHn5FRy7UC4zJ1VmEmi9ZknOw5hsW8yubJfJg_1745244018
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hongbo Li <lihongbo22@huawei.com> Use an array of
 `fs_parameter_spec`
 called f2fs_param_specs to hold the mount option specifications for the new
 mount api. Add constant_table structures for several options to facilitate
 parsing. 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6rhN-0003xZ-O1
Subject: [f2fs-dev] [PATCH 1/7] f2fs: Add fs parameter specifications for
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hongbo Li <lihongbo22@huawei.com>

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
index f087b2b71c89..c3623e052cde 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -27,6 +27,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/fs_parser.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -192,9 +193,130 @@ enum {
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
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
