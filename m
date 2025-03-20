Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D84A69E5A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Mar 2025 03:39:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tv5oM-00085F-Gm;
	Thu, 20 Mar 2025 02:39:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tv5oK-000857-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 02:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aab7cQaaqPedLyeOwaeMNPGRH4++V2h8zn8+pMkTxmI=; b=MyLKZCdxO4Y3INgVynfZfNpKFP
 MxhAMCEoPa3OU5cv+C4khnUsz638htiq60r8ob0Ji1nq1m1bFT9mKza7nSquCWRWxdEgI+dQJzJ/7
 SI7bTsXr5rsqN0WXwERy780W/eGgB5LGbM897C8yuPoSvgupzZ7TrppqRWP9Vd0heCyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Aab7cQaaqPedLyeOwaeMNPGRH4++V2h8zn8+pMkTxmI=; b=hNXkgk+BT+aOHhBYlrorHTt+4B
 M3nlbx6dAdxv6CwJO/T1o0lgnESyHYBzSQLRPDxXcmtUG8R9KlrqWOJm8di6kxsJFXZs9R37WCQ1B
 G59P0RYHczDFv4e0jszCfC3p0WqMy2UecH2H192W1VAWjKpgkSUKV/aspoqUZFcCF9ww=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tv5oE-0000XL-8z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 02:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C0F843751
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Mar 2025 02:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00BDC4CEE8;
 Thu, 20 Mar 2025 02:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742437366;
 bh=7+Yts5LeHOxEOmhtkUAzJyFa7c2XWV7zaUXjWc0iIys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=keVJ3O1xNqwhqCBcZqW6EL+MgA/8ihCfTSSHVEXzvWr4LqmEC2FukSJtwyAshe4Sp
 CSAQRRPpSn3kQXiw68iAjeGkaArinWIXG/r8dJs4cYoJ2AYiJkzjWknynLmcz3RiEL
 4Mv2LAjtbM6jS6mkaND29O6a0gB+O09od9YVd8yvrl7AfaiYh1CJnfIOT0Ct0vYYFa
 rnaDimRlj4aZNPNDPkg9KYomRiz60G/3K5gqTZFGPSYlWwdj3eQft84NQ1ST6lOZ5z
 Y66tJArcOhBH7ATz0hq4UDq1BO8MaBcqrW8LdgeHU9r83uKWzHJW26PGf4yIBPku/Z
 HrbSy4+6dfiXg==
To: jaegeuk@kernel.org
Date: Thu, 20 Mar 2025 10:22:30 +0800
Message-ID: <20250320022230.1938110-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250320022230.1938110-1-chao@kernel.org>
References: <20250320022230.1938110-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When we update inject type via sysfs, it shows wrong rate
 value as below, there is a same problem when we update inject rate, fix it.
 Before: F2FS-fs (vdd): build fault injection attr: rate: 0, type: 0xffff
 F2FS-fs (vdd): build fault injection attr: rate: 1, type: 0x0 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tv5oE-0000XL-8z
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: fix to update injection attrs
 according to fault_option
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When we update inject type via sysfs, it shows wrong rate value as
below, there is a same problem when we update inject rate, fix it.

Before:
F2FS-fs (vdd): build fault injection attr: rate: 0, type: 0xffff
F2FS-fs (vdd): build fault injection attr: rate: 1, type: 0x0

After:
F2FS-fs (vdd): build fault injection type: 0x1
F2FS-fs (vdd): build fault injection rate: 1

Meanwhile, let's avoid turning on all fault types when we enable fault
injection via fault_injection mount option, it will lead to shutdown
filesystem or fail the mount() easily.

mount -o fault_injection=4 /dev/vdd /mnt/f2fs
F2FS-fs (vdd): build fault injection attr: rate: 4, type: 0x7fffff
F2FS-fs (vdd): inject kmalloc in f2fs_kmalloc of f2fs_fill_super+0xbdf/0x27c0

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2
- no changes
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/f2fs.h       | 14 ++++++++++----
 fs/f2fs/super.c      | 26 +++++++++++++-------------
 fs/f2fs/sysfs.c      |  4 ++--
 4 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index cf77987d0698..85b7141f0d89 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -29,7 +29,7 @@ struct kmem_cache *f2fs_inode_entry_slab;
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 						unsigned char reason)
 {
-	f2fs_build_fault_attr(sbi, 0, 0);
+	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
 	if (!end_io)
 		f2fs_flush_merged_writes(sbi);
 	f2fs_handle_critical_error(sbi, reason);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 986ee5b9326d..ca884e39a5ff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -66,9 +66,14 @@ enum {
 	FAULT_MAX,
 };
 
-#ifdef CONFIG_F2FS_FAULT_INJECTION
-#define F2FS_ALL_FAULT_TYPE		(GENMASK(FAULT_MAX - 1, 0))
+/* indicate which option to update */
+enum fault_option {
+	FAULT_RATE	= 1,	/* only update fault rate */
+	FAULT_TYPE	= 2,	/* only update fault type */
+	FAULT_ALL	= 4,	/* reset all fault injection options/stats */
+};
 
+#ifdef CONFIG_F2FS_FAULT_INJECTION
 struct f2fs_fault_info {
 	atomic_t inject_ops;
 	int inject_rate;
@@ -4765,10 +4770,11 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-							unsigned long type);
+					unsigned long type, enum fault_option fo);
 #else
 static inline int f2fs_build_fault_attr(struct f2fs_sb_info *sbi,
-					unsigned long rate, unsigned long type)
+					unsigned long rate, unsigned long type,
+					enum fault_option fo)
 {
 	return 0;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfe0604ab558..011925ee54f8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -68,29 +68,30 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-							unsigned long type)
+				unsigned long type, enum fault_option fo)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
 
-	if (rate) {
+	if (fo & FAULT_ALL) {
+		memset(ffi, 0, sizeof(struct f2fs_fault_info));
+		return 0;
+	}
+
+	if (fo & FAULT_RATE) {
 		if (rate > INT_MAX)
 			return -EINVAL;
 		atomic_set(&ffi->inject_ops, 0);
 		ffi->inject_rate = (int)rate;
+		f2fs_info(sbi, "build fault injection rate: %lu", rate);
 	}
 
-	if (type) {
+	if (fo & FAULT_TYPE) {
 		if (type >= BIT(FAULT_MAX))
 			return -EINVAL;
 		ffi->inject_type = (unsigned int)type;
+		f2fs_info(sbi, "build fault injection type: 0x%lx", type);
 	}
 
-	if (!rate && !type)
-		memset(ffi, 0, sizeof(struct f2fs_fault_info));
-	else
-		f2fs_info(sbi,
-			"build fault injection attr: rate: %lu, type: 0x%lx",
-								rate, type);
 	return 0;
 }
 #endif
@@ -897,8 +898,7 @@ static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remoun
 		case Opt_fault_injection:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			if (f2fs_build_fault_attr(sbi, arg,
-					F2FS_ALL_FAULT_TYPE))
+			if (f2fs_build_fault_attr(sbi, arg, 0, FAULT_RATE))
 				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
@@ -906,7 +906,7 @@ static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remoun
 		case Opt_fault_type:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			if (f2fs_build_fault_attr(sbi, 0, arg))
+			if (f2fs_build_fault_attr(sbi, 0, arg, FAULT_TYPE))
 				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
@@ -2209,7 +2209,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	set_opt(sbi, POSIX_ACL);
 #endif
 
-	f2fs_build_fault_attr(sbi, 0, 0);
+	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
 }
 
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 46fa94db08a8..3a3485622691 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -494,12 +494,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (a->struct_type == FAULT_INFO_TYPE) {
-		if (f2fs_build_fault_attr(sbi, 0, t))
+		if (f2fs_build_fault_attr(sbi, 0, t, FAULT_TYPE))
 			return -EINVAL;
 		return count;
 	}
 	if (a->struct_type == FAULT_INFO_RATE) {
-		if (f2fs_build_fault_attr(sbi, t, 0))
+		if (f2fs_build_fault_attr(sbi, t, 0, FAULT_RATE))
 			return -EINVAL;
 		return count;
 	}
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
