Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914EC64268
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Nov 2025 13:46:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B2qsGjykbG5CDMFZ+5FtEX/OaMMpmUjropCAST3OmdU=; b=epcDMqE2JjH0FBWIj4tOCFOsQD
	c2kinNYl2QoX+rePpt764zP7IpJZwpMG8/ktYqOIaI7Kzq/pJarHNlknDUBFILnl0tRgKMlYQBWyB
	uSvPT5Fkb5oWCsB7URtG5MrWw9vWUONcl14pYARwzKeNd2K7mvaF4ewUs1NjLrLIZ5Wg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKycg-0006ti-Jj;
	Mon, 17 Nov 2025 12:46:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vKyce-0006tZ-BI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 12:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7eESbnWbLaJSfYy6UrXyATQj/0RQBr2ZQKgi+Rcjl6s=; b=hG8xhjwiSfAk0Or2MZaV11AfPM
 9ym/TV18AVwsgCwMJDoPylkk5MHokphrtknGV3WJyXC7GghwO/7mMum5620l21Fqtdka/IvhNthgg
 LF0yzKNgadr/kF98X96ejWEfpcdnsF/yi5SSOD9HmuDgjgUS/zTt6nS3kdZhlCAJov+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7eESbnWbLaJSfYy6UrXyATQj/0RQBr2ZQKgi+Rcjl6s=; b=X
 smHAmYmRRt9GNTk1CDnGFvFKti+JagAG0OnAFIfGi4Tg7qTAE5xKE7aUfFcjvp8VcZWCOyzBBl9gT
 duDYteyKpkJ0ZXgcC85V54L4HHjlkdVgdshJLNyk+oh8pj9hV0nJUEqcR3vXFT4mJ5DgeQo53cgN4
 Ayl0YOJ56mcZj+dM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKyce-0005LI-G1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 12:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D3197601AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Nov 2025 12:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E38C2BC87;
 Mon, 17 Nov 2025 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763383574;
 bh=HivUi9YosfRvvoVNT7TOnBDDKhbW86aXFPoc5OH3G70=;
 h=From:To:Cc:Subject:Date:From;
 b=hSFVvtSsdGiHTt6HFGENoCKhaKTwoaI+SJ5hs3ti5zNSitEppC3XTNNm7csNonU7I
 9ZFLck9jxXITNe5QoPTTUst5m7cA6Rh+mAsKA/evkh/o0nlkR+AVEXsLdDFSAzBJq7
 l1MP6GXOyfRTf/GsvCEA+ShY1fPWBh/IkKcq+XP82RvcVBiddGPetx+3T5r9v0k5S1
 /9fYeXaRSVLYxSOsD10IoBppEuigJzZmLR/yu7tCHCMIhH9l+5bmwCDkCXlE9pVRV9
 /eVgzUSkyz5AMVveIwH/W4GIiat/kWTrOpZshn+wl0yL+KIM1PZVy8/0IrnjQLYzOx
 3tez7QwzThS1Q==
To: jaegeuk@kernel.org
Date: Mon, 17 Nov 2025 20:45:59 +0800
Message-ID: <20251117124559.1634936-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  opt field in structure f2fs_mount_info and opt_mask field
 in structure f2fs_fs_context is 32-bits variable, now we're running out of
 available bits in them, let's expand them to 64-bits for better sca [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vKyce-0005LI-G1
Subject: [f2fs-dev] [PATCH] f2fs: expand scalability of f2fs mount option
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

opt field in structure f2fs_mount_info and opt_mask field in structure
f2fs_fs_context is 32-bits variable, now we're running out of available
bits in them, let's expand them to 64-bits for better scalability.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 85 ++++++++++++++++++++++++++-----------------------
 fs/f2fs/super.c | 36 ++++++++++-----------
 2 files changed, 63 insertions(+), 58 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dffe8958b580..5f104518c414 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -96,47 +96,52 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 /*
  * For mount options
  */
-#define F2FS_MOUNT_DISABLE_ROLL_FORWARD	0x00000001
-#define F2FS_MOUNT_DISCARD		0x00000002
-#define F2FS_MOUNT_NOHEAP		0x00000004
-#define F2FS_MOUNT_XATTR_USER		0x00000008
-#define F2FS_MOUNT_POSIX_ACL		0x00000010
-#define F2FS_MOUNT_DISABLE_EXT_IDENTIFY	0x00000020
-#define F2FS_MOUNT_INLINE_XATTR		0x00000040
-#define F2FS_MOUNT_INLINE_DATA		0x00000080
-#define F2FS_MOUNT_INLINE_DENTRY	0x00000100
-#define F2FS_MOUNT_FLUSH_MERGE		0x00000200
-#define F2FS_MOUNT_NOBARRIER		0x00000400
-#define F2FS_MOUNT_FASTBOOT		0x00000800
-#define F2FS_MOUNT_READ_EXTENT_CACHE	0x00001000
-#define F2FS_MOUNT_DATA_FLUSH		0x00002000
-#define F2FS_MOUNT_FAULT_INJECTION	0x00004000
-#define F2FS_MOUNT_USRQUOTA		0x00008000
-#define F2FS_MOUNT_GRPQUOTA		0x00010000
-#define F2FS_MOUNT_PRJQUOTA		0x00020000
-#define F2FS_MOUNT_QUOTA		0x00040000
-#define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00080000
-#define F2FS_MOUNT_RESERVE_ROOT		0x00100000
-#define F2FS_MOUNT_DISABLE_CHECKPOINT	0x00200000
-#define F2FS_MOUNT_NORECOVERY		0x00400000
-#define F2FS_MOUNT_ATGC			0x00800000
-#define F2FS_MOUNT_MERGE_CHECKPOINT	0x01000000
-#define	F2FS_MOUNT_GC_MERGE		0x02000000
-#define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
-#define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
-#define F2FS_MOUNT_NAT_BITS		0x10000000
-#define F2FS_MOUNT_INLINECRYPT		0x20000000
-/*
- * Some f2fs environments expect to be able to pass the "lazytime" option
- * string rather than using the MS_LAZYTIME flag, so this must remain.
- */
-#define F2FS_MOUNT_LAZYTIME		0x40000000
-#define F2FS_MOUNT_RESERVE_NODE		0x80000000
+enum f2fs_mount_opt {
+	F2FS_MOUNT_DISABLE_ROLL_FORWARD,
+	F2FS_MOUNT_DISCARD,
+	F2FS_MOUNT_NOHEAP,
+	F2FS_MOUNT_XATTR_USER,
+	F2FS_MOUNT_POSIX_ACL,
+	F2FS_MOUNT_DISABLE_EXT_IDENTIFY,
+	F2FS_MOUNT_INLINE_XATTR,
+	F2FS_MOUNT_INLINE_DATA,
+	F2FS_MOUNT_INLINE_DENTRY,
+	F2FS_MOUNT_FLUSH_MERGE,
+	F2FS_MOUNT_NOBARRIER,
+	F2FS_MOUNT_FASTBOOT,
+	F2FS_MOUNT_READ_EXTENT_CACHE,
+	F2FS_MOUNT_DATA_FLUSH,
+	F2FS_MOUNT_FAULT_INJECTION,
+	F2FS_MOUNT_USRQUOTA,
+	F2FS_MOUNT_GRPQUOTA,
+	F2FS_MOUNT_PRJQUOTA,
+	F2FS_MOUNT_QUOTA,
+	F2FS_MOUNT_INLINE_XATTR_SIZE,
+	F2FS_MOUNT_RESERVE_ROOT,
+	F2FS_MOUNT_DISABLE_CHECKPOINT,
+	F2FS_MOUNT_NORECOVERY,
+	F2FS_MOUNT_ATGC,
+	F2FS_MOUNT_MERGE_CHECKPOINT,
+	F2FS_MOUNT_GC_MERGE,
+	F2FS_MOUNT_COMPRESS_CACHE,
+	F2FS_MOUNT_AGE_EXTENT_CACHE,
+	F2FS_MOUNT_NAT_BITS,
+	F2FS_MOUNT_INLINECRYPT,
+	/*
+	 * Some f2fs environments expect to be able to pass the "lazytime" option
+	 * string rather than using the MS_LAZYTIME flag, so this must remain.
+	 */
+	F2FS_MOUNT_LAZYTIME,
+	F2FS_MOUNT_RESERVE_NODE,
+};
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
-#define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
-#define set_opt(sbi, option)	(F2FS_OPTION(sbi).opt |= F2FS_MOUNT_##option)
-#define test_opt(sbi, option)	(F2FS_OPTION(sbi).opt & F2FS_MOUNT_##option)
+#define clear_opt(sbi, option)		\
+	(F2FS_OPTION(sbi).opt &= ~BIT(F2FS_MOUNT_##option))
+#define set_opt(sbi, option)		\
+	(F2FS_OPTION(sbi).opt |= BIT(F2FS_MOUNT_##option))
+#define test_opt(sbi, option)		\
+	(F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
 
 #define ver_after(a, b)	(typecheck(unsigned long long, a) &&		\
 		typecheck(unsigned long long, b) &&			\
@@ -183,7 +188,7 @@ struct f2fs_rwsem {
 };
 
 struct f2fs_mount_info {
-	unsigned int opt;
+	unsigned long long opt;
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	block_t root_reserved_nodes;	/* root reserved nodes */
 	kuid_t s_resuid;		/* reserved blocks for uid */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d47ec718f3be..ccb477086444 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -352,7 +352,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
-	unsigned int	opt_mask;	/* Bits changed */
+	unsigned long long opt_mask;	/* Bits changed */
 	unsigned int	spec_mask;
 	unsigned short	qname_mask;
 };
@@ -360,23 +360,23 @@ struct f2fs_fs_context {
 #define F2FS_CTX_INFO(ctx)	((ctx)->info)
 
 static inline void ctx_set_opt(struct f2fs_fs_context *ctx,
-			       unsigned int flag)
+			       enum f2fs_mount_opt flag)
 {
-	ctx->info.opt |= flag;
-	ctx->opt_mask |= flag;
+	ctx->info.opt |= BIT(flag);
+	ctx->opt_mask |= BIT(flag);
 }
 
 static inline void ctx_clear_opt(struct f2fs_fs_context *ctx,
-				 unsigned int flag)
+				 enum f2fs_mount_opt flag)
 {
-	ctx->info.opt &= ~flag;
-	ctx->opt_mask |= flag;
+	ctx->info.opt &= ~BIT(flag);
+	ctx->opt_mask |= BIT(flag);
 }
 
 static inline bool ctx_test_opt(struct f2fs_fs_context *ctx,
-				unsigned int flag)
+				enum f2fs_mount_opt flag)
 {
-	return ctx->info.opt & flag;
+	return ctx->info.opt & BIT(flag);
 }
 
 void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
@@ -1371,7 +1371,7 @@ static int f2fs_check_compression(struct fs_context *fc,
 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
 			f2fs_info(sbi, "Image doesn't support compression");
 		clear_compression_spec(ctx);
-		ctx->opt_mask &= ~F2FS_MOUNT_COMPRESS_CACHE;
+		ctx->opt_mask &= ~BIT(F2FS_MOUNT_COMPRESS_CACHE);
 		return 0;
 	}
 	if (ctx->spec_mask & F2FS_SPEC_compress_extension) {
@@ -1439,42 +1439,42 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 
 	if (f2fs_hw_should_discard(sbi) &&
-			(ctx->opt_mask & F2FS_MOUNT_DISCARD) &&
+			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "discard is required for zoned block devices");
 		return -EINVAL;
 	}
 
 	if (!f2fs_hw_support_discard(sbi) &&
-			(ctx->opt_mask & F2FS_MOUNT_DISCARD) &&
+			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "device does not support discard");
 		ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
-		ctx->opt_mask &= ~F2FS_MOUNT_DISCARD;
+		ctx->opt_mask &= ~BIT(F2FS_MOUNT_DISCARD);
 	}
 
 	if (f2fs_sb_has_device_alias(sbi) &&
-			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
+			(ctx->opt_mask & BIT(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
 		f2fs_err(sbi, "device aliasing requires extent cache");
 		return -EINVAL;
 	}
 
 	if (test_opt(sbi, RESERVE_ROOT) &&
-			(ctx->opt_mask & F2FS_MOUNT_RESERVE_ROOT) &&
+			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_ROOT)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_ROOT)) {
 		f2fs_info(sbi, "Preserve previous reserve_root=%u",
 			F2FS_OPTION(sbi).root_reserved_blocks);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
-		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_ROOT;
+		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_ROOT);
 	}
 	if (test_opt(sbi, RESERVE_NODE) &&
-			(ctx->opt_mask & F2FS_MOUNT_RESERVE_NODE) &&
+			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
 		f2fs_info(sbi, "Preserve previous reserve_node=%u",
 			F2FS_OPTION(sbi).root_reserved_nodes);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
-		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_NODE;
+		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
 	}
 
 	err = f2fs_check_test_dummy_encryption(fc, sb);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
