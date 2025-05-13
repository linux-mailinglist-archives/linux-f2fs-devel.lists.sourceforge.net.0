Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC9AB4B49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 07:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1gD5PTtNA5Qydh8/srlOdd5T5Af7EJ9HAETFIyM4nq8=; b=IO6pk1cl3Ci0TvCurgeOkUzzdy
	qhPIBkdxfUUT0zDOk2cC+6PCInizl17ZZ5xVuow2KgYV44rWmuQH0eD6RmSKscwnCRTUjvQ0L5g1/
	tE6XmddUHsZ8hM2Vm3gHf00KzY9XUXyX9MciD6t09Jpeuiqw5wReJV6U7tbGrMeasxj8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEiWF-0005r0-Ez;
	Tue, 13 May 2025 05:49:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uEiWD-0005qr-Qm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEqDlvVKjfPGmWc03LutGVNmhQzUJg+B7HwDgjkkcrc=; b=RQ0r/SoPkeQcXjKbRK8znTkFwh
 HqRNzTGAMisw66sd02KUlflBOUTKQM2Ko/8Sy/To4xwh5slNIrEZzi6783ifcBtDZoujNpWnquDon
 Xq2WrjiD+GzAK5lm3Ol9uuxjumauFzIfyxyhVOSkjAStsLtn0l0Q9OVxwvsnum/yomMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kEqDlvVKjfPGmWc03LutGVNmhQzUJg+B7HwDgjkkcrc=; b=O
 6hk4CppX6ap/onvs5rIUxEzAFZigkoAnWxejLp/6OPjD2h2vXlLIR2IBVpHEl18sBWABiQXdO05aS
 E1rkRnlaVt0276ywe2dgXMNyTsfhc9kMYgW4C9gLj4F3CAEUQ54PatYxU7GXkTeQulH84J+05LnYO
 Wvji594PpgsiR4RA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEiWC-0007Iz-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F09F3A40865
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 05:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909AFC4CEE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747115361;
 bh=G2ytM0uApXxYidTSaN7eypFWQ6uBRy55tuldjF2gcM4=;
 h=From:To:Subject:Date:From;
 b=EifdMehDf8Qd6afoUTBC2Rceq7sEAbyGmvb3ZfghvYtFCTnDUYug/aP50KrteO+X0
 pvTN3b5inyhRGHsfp5ZV7gm7rnR1efsEkL+FixS96lDigTHNvcuQBdXP/ujr6Svlu/
 SduEkM9YZEIFFEHsjkpsmwPf0vMGSi91O9/3huC0MZALLVZ3+dlP27Kb3tBx8xSRSM
 9jGjrtaRetYI9PgnKKQHid8cegS8Q3Ct4DI7uEh7mkf/ULZC2pkYtbHtMv/hqAVM5a
 0IT/baIK22unspO6zEUQ7ksD7zJCPk8vZW1LIKg/JNz6F76+C/mxcP+s+CRWSppLmo
 OLgmjiSBSBkDg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 12 May 2025 22:48:25 -0700
Message-ID: <20250513054825.727898-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Since __f2fs_crc32()
 now calls crc32() directly, it no longer uses its sbi argument. Remove that,
 and simplify its callers accordingly. Signed-off-by: Eric Biggers
 <ebiggers@google.com>
 --- fs/f2fs/checkpoint.c | 13 ++++++------- fs/f2fs/compress.c | 5 ++---
 fs/f2fs/f2fs.h | 20 ++++++ fs/f2fs/inode.c | 13 ++++++------- f [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEiWC-0007Iz-Qg
Subject: [f2fs-dev] [PATCH] f2fs: remove unused sbi argument from checksum
 functions
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since __f2fs_crc32() now calls crc32() directly, it no longer uses its
sbi argument.  Remove that, and simplify its callers accordingly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/checkpoint.c | 13 ++++++-------
 fs/f2fs/compress.c   |  5 ++---
 fs/f2fs/f2fs.h       | 20 ++++++--------------
 fs/f2fs/inode.c      | 13 ++++++-------
 fs/f2fs/super.c      |  8 ++++----
 5 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e7907858eb70..39ee75321d14 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -824,21 +824,20 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 		folio_mark_dirty(folio);
 		f2fs_folio_put(folio, true);
 	}
 }
 
-static __u32 f2fs_checkpoint_chksum(struct f2fs_sb_info *sbi,
-						struct f2fs_checkpoint *ckpt)
+static __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *ckpt)
 {
 	unsigned int chksum_ofs = le32_to_cpu(ckpt->checksum_offset);
 	__u32 chksum;
 
-	chksum = f2fs_crc32(sbi, ckpt, chksum_ofs);
+	chksum = f2fs_crc32(ckpt, chksum_ofs);
 	if (chksum_ofs < CP_CHKSUM_OFFSET) {
 		chksum_ofs += sizeof(chksum);
-		chksum = f2fs_chksum(sbi, chksum, (__u8 *)ckpt + chksum_ofs,
-						F2FS_BLKSIZE - chksum_ofs);
+		chksum = f2fs_chksum(chksum, (__u8 *)ckpt + chksum_ofs,
+				     F2FS_BLKSIZE - chksum_ofs);
 	}
 	return chksum;
 }
 
 static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
@@ -860,11 +859,11 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
 		f2fs_folio_put(*cp_folio, true);
 		f2fs_warn(sbi, "invalid crc_offset: %zu", crc_offset);
 		return -EINVAL;
 	}
 
-	crc = f2fs_checkpoint_chksum(sbi, *cp_block);
+	crc = f2fs_checkpoint_chksum(*cp_block);
 	if (crc != cur_cp_crc(*cp_block)) {
 		f2fs_folio_put(*cp_folio, true);
 		f2fs_warn(sbi, "invalid crc value");
 		return -EINVAL;
 	}
@@ -1503,11 +1502,11 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* update SIT/NAT bitmap */
 	get_sit_bitmap(sbi, __bitmap_ptr(sbi, SIT_BITMAP));
 	get_nat_bitmap(sbi, __bitmap_ptr(sbi, NAT_BITMAP));
 
-	crc32 = f2fs_checkpoint_chksum(sbi, ckpt);
+	crc32 = f2fs_checkpoint_chksum(ckpt);
 	*((__le32 *)((unsigned char *)ckpt +
 				le32_to_cpu(ckpt->checksum_offset)))
 				= cpu_to_le32(crc32);
 
 	start_blk = __start_cp_next_addr(sbi);
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e62fdffda07..b322b9a14293 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -677,12 +677,11 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	}
 
 	cc->cbuf->clen = cpu_to_le32(cc->clen);
 
 	if (fi->i_compress_flag & BIT(COMPRESS_CHKSUM))
-		chksum = f2fs_crc32(F2FS_I_SB(cc->inode),
-					cc->cbuf->cdata, cc->clen);
+		chksum = f2fs_crc32(cc->cbuf->cdata, cc->clen);
 	cc->cbuf->chksum = cpu_to_le32(chksum);
 
 	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
 		cc->cbuf->reserved[i] = cpu_to_le32(0);
 
@@ -774,11 +773,11 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 
 	ret = cops->decompress_pages(dic);
 
 	if (!ret && (fi->i_compress_flag & BIT(COMPRESS_CHKSUM))) {
 		u32 provided = le32_to_cpu(dic->cbuf->chksum);
-		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
+		u32 calculated = f2fs_crc32(dic->cbuf->cdata, dic->clen);
 
 		if (provided != calculated) {
 			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
 				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
 				f2fs_info_ratelimited(sbi,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9432fd15766a..d1ea0441a4f4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1974,32 +1974,24 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
 }
 
 /*
  * Inline functions
  */
-static inline u32 __f2fs_crc32(struct f2fs_sb_info *sbi, u32 crc,
-			      const void *address, unsigned int length)
+static inline u32 __f2fs_crc32(u32 crc, const void *address,
+			       unsigned int length)
 {
 	return crc32(crc, address, length);
 }
 
-static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
-			   unsigned int length)
+static inline u32 f2fs_crc32(const void *address, unsigned int length)
 {
-	return __f2fs_crc32(sbi, F2FS_SUPER_MAGIC, address, length);
+	return __f2fs_crc32(F2FS_SUPER_MAGIC, address, length);
 }
 
-static inline bool f2fs_crc_valid(struct f2fs_sb_info *sbi, __u32 blk_crc,
-				  void *buf, size_t buf_size)
+static inline u32 f2fs_chksum(u32 crc, const void *address, unsigned int length)
 {
-	return f2fs_crc32(sbi, buf, buf_size) == blk_crc;
-}
-
-static inline u32 f2fs_chksum(struct f2fs_sb_info *sbi, u32 crc,
-			      const void *address, unsigned int length)
-{
-	return __f2fs_crc32(sbi, crc, address, length);
+	return __f2fs_crc32(crc, address, length);
 }
 
 static inline struct f2fs_inode_info *F2FS_I(struct inode *inode)
 {
 	return container_of(inode, struct f2fs_inode_info, vfs_inode);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 747857a5b143..083d52a42bfb 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -142,19 +142,18 @@ static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
 	__u32 chksum, chksum_seed;
 	__u32 dummy_cs = 0;
 	unsigned int offset = offsetof(struct f2fs_inode, i_inode_checksum);
 	unsigned int cs_size = sizeof(dummy_cs);
 
-	chksum = f2fs_chksum(sbi, sbi->s_chksum_seed, (__u8 *)&ino,
-							sizeof(ino));
-	chksum_seed = f2fs_chksum(sbi, chksum, (__u8 *)&gen, sizeof(gen));
+	chksum = f2fs_chksum(sbi->s_chksum_seed, (__u8 *)&ino, sizeof(ino));
+	chksum_seed = f2fs_chksum(chksum, (__u8 *)&gen, sizeof(gen));
 
-	chksum = f2fs_chksum(sbi, chksum_seed, (__u8 *)ri, offset);
-	chksum = f2fs_chksum(sbi, chksum, (__u8 *)&dummy_cs, cs_size);
+	chksum = f2fs_chksum(chksum_seed, (__u8 *)ri, offset);
+	chksum = f2fs_chksum(chksum, (__u8 *)&dummy_cs, cs_size);
 	offset += cs_size;
-	chksum = f2fs_chksum(sbi, chksum, (__u8 *)ri + offset,
-						F2FS_BLKSIZE - offset);
+	chksum = f2fs_chksum(chksum, (__u8 *)ri + offset,
+			     F2FS_BLKSIZE - offset);
 	return chksum;
 }
 
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b65d24a39d03..deb31d85ab65 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3556,11 +3556,11 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 			f2fs_info(sbi, "Invalid SB checksum offset: %zu",
 				  crc_offset);
 			return -EFSCORRUPTED;
 		}
 		crc = le32_to_cpu(raw_super->crc);
-		if (!f2fs_crc_valid(sbi, crc, raw_super, crc_offset)) {
+		if (crc != f2fs_crc32(raw_super, crc_offset)) {
 			f2fs_info(sbi, "Invalid SB checksum value: %u", crc);
 			return -EFSCORRUPTED;
 		}
 	}
 
@@ -4112,11 +4112,11 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 		return -EROFS;
 	}
 
 	/* we should update superblock crc here */
 	if (!recover && f2fs_sb_has_sb_chksum(sbi)) {
-		crc = f2fs_crc32(sbi, F2FS_RAW_SUPER(sbi),
+		crc = f2fs_crc32(F2FS_RAW_SUPER(sbi),
 				offsetof(struct f2fs_super_block, crc));
 		F2FS_RAW_SUPER(sbi)->crc = cpu_to_le32(crc);
 	}
 
 	/* write back-up superblock first */
@@ -4573,12 +4573,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
 	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
 
 	/* precompute checksum seed for metadata */
 	if (f2fs_sb_has_inode_chksum(sbi))
-		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid,
-						sizeof(raw_super->uuid));
+		sbi->s_chksum_seed = f2fs_chksum(~0, raw_super->uuid,
+						 sizeof(raw_super->uuid));
 
 	default_options(sbi, false);
 	/* parse mount options */
 	options = kstrdup((const char *)data, GFP_KERNEL);
 	if (data && !options) {

base-commit: 80f31d2a7e5f4efa7150c951268236c670bcb068
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
