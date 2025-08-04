Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A61B1AB4C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 01:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+g4gao2iYVNw9vF9Y++/Q4I5MwMVxzkh8sGXbMUnDyk=; b=TVh02P1XaBjRgZ5s6mm02lqF+j
	QN/byNu4hkN7L8YsYYJyweUpVzvKgcc0dfkgt5SooNGrIZEFh8yxP7yrxZbG/WRV7d1WAE+/RTit9
	SH/XAEKIML1/KHkqROGeyXa5ENAQlQB6g6ohjcNVLrbyONz4WGwjRLRw6c2asRk1GZcE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uj4MN-0002b0-GG;
	Mon, 04 Aug 2025 23:12:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <34TyRaAcKAOoOTgXXQQSaaSXQ.OaY@flex--chullee.bounces.google.com>)
 id 1uj4Le-0002Xz-Qj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 23:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99peTYq7PqSOTmRGzdVy2JEjNepzduj5OBy6x67rWAU=; b=Fq8S7pcsjFqaK74dZQsE9aRCpn
 9OIMTt0DOm9x1p9XLMfTD1j4FAvlBvhwYM1ghE93VdHdHkHQDzSyHEWSkyVctFe2F0s7Pm1NnFeC7
 51ePjvZG62dZgBNaCpZVLqPVFMm50DT9oriQLVMlu8uxzG4IgGutV+DzkYzTe8Oa13Bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=99peTYq7PqSOTmRGzdVy2JEjNepzduj5OBy6x67rWAU=; b=Z
 rVYsdRn1SmxHZYI/+u7IewWoTCJ6Db3vcNSeWXxU6Qvb/8SSGqYspdC4K6p7To6bnUlvPzUDIzcsk
 xHxsTfN/HMXl6dXlr+9K3CE66oFkehm9pGPOdaayVmtIamRA118+ZXuxvJyCqYL15KQg2Md5mX8Xh
 bkx33rg0jZERmEV8=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uj4Le-0004tM-OT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 23:12:07 +0000
Received: by mail-il1-f202.google.com with SMTP id
 e9e14a558f8ab-3e3d492a279so102476455ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Aug 2025 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754349116; x=1754953916;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=99peTYq7PqSOTmRGzdVy2JEjNepzduj5OBy6x67rWAU=;
 b=xsD6m+bGSFisI+tHkvhNHBGaU63A9abEmgW/IsfkPKc07AYZf0PY1yJnWoIPMhL9ie
 kweI06NUjsDWSR2pYsqTdbh2CsMvUSNPZjGUnfad6Pwc1Yw2KE91rjUyEorUtrsBuXQ8
 pF7rOBY5k4jxswHjvM4OCZ4RhpxFnAxgWNBGVB+5qFwX+Ft8w1gSIP3hljQtECSTmA4r
 20cADnjmuRNctlLdm8ChaPaw3IvMqjU35tAs3eJiVJbXFEr5bHd9STSjcN9HARN1J4EG
 uWO9zSyjq9nneumNlIw7Z8WIjcG1qucO0hjUWglzt2eNsGk2+BVs0HV3BRRvVEFwU0q9
 FzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754349116; x=1754953916;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=99peTYq7PqSOTmRGzdVy2JEjNepzduj5OBy6x67rWAU=;
 b=BaAzcu23K0EqoiV6AR1EuvVfJ8OD0s7P3aEa2X2qSCAlb0d8o24yMhrfqnGuyPeddy
 6QEjYAGx02qgjJzouit/JetkSxyoD9q5+QkGITFgBobcNoCjDzXVgILGP0YN+WiuwxwK
 aztEu4687WrIOgflssdybsRLPcD6Qi3bGMRlc10nHYlPVr5Ag1A0etz1JSThp/IQL7Hu
 jD400IbfCKU94sDfCmosEWuFglvao2N9oRmDHySqYNBeb0d9A+cGsaXF6GVcZ+BzFYxu
 RvDSUxEhMItXuaZluMh2YEJ3C7yHLP8HroeDEb2F9XzTUsBuJMn2Xo918euStHEY5+UH
 nWVA==
X-Gm-Message-State: AOJu0YyWqrdMjimPkS+7fJxzPDaOP+qfSHJJiAGhDPUiHVZs71Mocvq5
 5AuWf6d9cL7u3/2WcamrZHqYQTGYU6MI1n0WKxBBhomC+K48gbuCeVFwHGqI82SLQ7nbk8V5FzD
 ezSz4mRBmxQ==
X-Google-Smtp-Source: AGHT+IF6vIIzDerk2cBzZQlvwadLrhR1TOkCtIQIwNCroPKro/RhZzTNUtNZJKpBqXTVX8NlRL0dVCt5620F
X-Received: from pjbsu6.prod.google.com ([2002:a17:90b:5346:b0:312:151d:c818])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3e2f:b0:234:9656:7db9
 with SMTP id d9443c01a7336-24246fdff37mr117055555ad.32.1754348769029; Mon, 04
 Aug 2025 16:06:09 -0700 (PDT)
Date: Mon,  4 Aug 2025 16:05:57 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804230558.746338-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For casefolded directories, f2fs may fall back to a linear
 search if a hash-based lookup fails. This can cause severe performance
 regressions.
 While this behavior can be controlled by userspace tools (e.g. mkfs, fsck)
 by setting an on-disk flag, a kernel-level solution is needed to guarantee
 the lookup behavior regardless of the on-disk stat [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uj4Le-0004tM-OT
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: add lookup_mode mount option
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For casefolded directories, f2fs may fall back to a linear search if
a hash-based lookup fails. This can cause severe performance
regressions.

While this behavior can be controlled by userspace tools (e.g. mkfs,
fsck) by setting an on-disk flag, a kernel-level solution is needed
to guarantee the lookup behavior regardless of the on-disk state.

This commit introduces the 'lookup_mode' mount option to provide this
kernel-side control.

The option accepts three values:
- perf: (Default) Enforces a hash-only lookup. The linear fallback
  is always disabled.
- compat: Enables the linear search fallback for compatibility with
  directory entries from older kernels.
- auto: Determines the mode based on the on-disk flag, preserving the
  userspace-based behavior.

Signed-off-by: Daniel Lee <chullee@google.com>
---
v2:
- rework mount option parsing to use the new mount API.
- add lookup_mode field to struct f2fs_mount_info.
- add show_options support for the new option.
 Documentation/filesystems/f2fs.rst | 19 +++++++++++++++++++
 fs/f2fs/dir.c                      | 17 ++++++++++++++++-
 fs/f2fs/f2fs.h                     |  7 +++++++
 fs/f2fs/super.c                    | 25 +++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 03b1efa6d3b2..a80ed82a547a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -370,6 +370,25 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 ====================== =============== =============== ========
 nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
 			 by default it's disabled.
+lookup_mode=%s		 Control the directory lookup behavior for casefolded
+			 directories. This option has no effect on directories
+			 that do not have the casefold feature enabled.
+
+			 ================== ========================================
+			 Value		    Description
+			 ================== ========================================
+			 perf		    (Default) Enforces a hash-only lookup.
+					    The linear search fallback is always
+					    disabled, ignoring the on-disk flag.
+			 compat		    Enables the linear search fallback for
+					    compatibility with directory entries
+					    created by older kernel that used a
+					    different case-folding algorithm.
+					    This mode ignores the on-disk flag.
+			 auto		    F2FS determines the mode based on the
+					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
+					    flag.
+			 ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index fffd7749d6d1..48f4f98afb01 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -16,6 +16,21 @@
 #include "xattr.h"
 #include <trace/events/f2fs.h>
 
+static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+
+	switch (F2FS_OPTION(sbi).lookup_mode) {
+	case LOOKUP_PERF:
+		return false;
+	case LOOKUP_COMPAT:
+		return true;
+	case LOOKUP_AUTO:
+		return !sb_no_casefold_compat_fallback(sbi->sb);
+	}
+	return false;
+}
+
 #if IS_ENABLED(CONFIG_UNICODE)
 extern struct kmem_cache *f2fs_cf_name_slab;
 #endif
@@ -366,7 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (!sb_no_casefold_compat_fallback(dir->i_sb) &&
+	if (f2fs_should_fallback_to_linear(dir) &&
 		IS_CASEFOLDED(dir) && !de && use_hash) {
 		use_hash = false;
 		goto start_find_entry;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7029aa8b430e..1c0edb8a7134 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -212,6 +212,7 @@ struct f2fs_mount_info {
 	int compress_mode;			/* compression mode */
 	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
 	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
+	unsigned int lookup_mode;
 };
 
 #define F2FS_FEATURE_ENCRYPT			0x00000001
@@ -1448,6 +1449,12 @@ enum {
 	TOTAL_CALL = FOREGROUND,
 };
 
+enum f2fs_lookup_mode {
+	LOOKUP_PERF,
+	LOOKUP_COMPAT,
+	LOOKUP_AUTO,
+};
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..ed17ab4d5cef 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -181,6 +181,7 @@ enum {
 	Opt_nat_bits,
 	Opt_jqfmt,
 	Opt_checkpoint,
+	Opt_lookup_mode,
 	Opt_err,
 };
 
@@ -244,6 +245,13 @@ static const struct constant_table f2fs_param_errors[] = {
 	{}
 };
 
+static const struct constant_table f2fs_param_lookup_mode[] = {
+	{"perf",	LOOKUP_PERF},
+	{"compat",	LOOKUP_COMPAT},
+	{"auto",	LOOKUP_AUTO},
+	{}
+};
+
 static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_enum("background_gc", Opt_gc_background, f2fs_param_background_gc),
 	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
@@ -300,6 +308,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
 	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
 	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
+	fsparam_enum("lookup_mode", Opt_lookup_mode, f2fs_param_lookup_mode),
 	{}
 };
 
@@ -336,6 +345,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 #define F2FS_SPEC_discard_unit			(1 << 21)
 #define F2FS_SPEC_memory_mode			(1 << 22)
 #define F2FS_SPEC_errors			(1 << 23)
+#define F2FS_SPEC_lookup_mode			(1 << 24)
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
@@ -1143,6 +1153,10 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_nat_bits:
 		ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
 		break;
+	case Opt_lookup_mode:
+		F2FS_CTX_INFO(ctx).lookup_mode = result.uint_32;
+		ctx->spec_mask |= F2FS_SPEC_lookup_mode;
+		break;
 	}
 	return 0;
 }
@@ -1652,6 +1666,8 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 		F2FS_OPTION(sbi).memory_mode = F2FS_CTX_INFO(ctx).memory_mode;
 	if (ctx->spec_mask & F2FS_SPEC_errors)
 		F2FS_OPTION(sbi).errors = F2FS_CTX_INFO(ctx).errors;
+	if (ctx->spec_mask & F2FS_SPEC_lookup_mode)
+		F2FS_OPTION(sbi).lookup_mode = F2FS_CTX_INFO(ctx).lookup_mode;
 
 	f2fs_apply_compression(fc, sb);
 	f2fs_apply_test_dummy_encryption(fc, sb);
@@ -2416,6 +2432,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	if (test_opt(sbi, NAT_BITS))
 		seq_puts(seq, ",nat_bits");
 
+	if (F2FS_OPTION(sbi).lookup_mode != LOOKUP_PERF) {
+		if (F2FS_OPTION(sbi).lookup_mode == LOOKUP_COMPAT)
+			seq_show_option(seq, "lookup_mode", "compat");
+		else if (F2FS_OPTION(sbi).lookup_mode == LOOKUP_AUTO)
+			seq_show_option(seq, "lookup_mode", "auto");
+	}
+
 	return 0;
 }
 
@@ -2480,6 +2503,8 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 #endif
 
 	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
+
+	F2FS_OPTION(sbi).lookup_mode = LOOKUP_PERF;
 }
 
 #ifdef CONFIG_QUOTA
-- 
2.50.1.565.gc32cd1483b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
