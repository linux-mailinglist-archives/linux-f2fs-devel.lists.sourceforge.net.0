Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308E78BC54
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 03:06:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qanBG-00086K-Ar;
	Tue, 29 Aug 2023 01:06:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3ckTtZAYKAN0CQNRDMFNNFKD.BNL@flex--drosen.bounces.google.com>)
 id 1qanBE-000864-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+VYP3FCkB9Avc0wEhG1QfSRDsoDUHiUu4wJueREO4y4=; b=AWAVqRkGwmBBuVZ3P0FQh1Ry0L
 q3YSGvEjQseR4V+a2dGKoi3evDg4Yq7NRkxgqazhqPpPzq9zzkNuYVN7uYq1t1VsmgwRD7+lj16vo
 Uxx1PKzHXz/NjpaahQMUfTF/mOoBwefDXKVPrrG2VgVDM7qQ1enXeruJOKZkjVQhbOIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+VYP3FCkB9Avc0wEhG1QfSRDsoDUHiUu4wJueREO4y4=; b=iFkJBHQ9DXzo+zoFiMQBueLpEB
 mkqF7jQvq1/yazoSDEUeVXdS8BsGobApXc2aKLhYUhkSXXGK9S82iChvPkHEzF5kOcED4fj95Uxrg
 imYNkMXgBo8hIW0PipBUnLySTJMee62MbBhwZEatQgVHPpbYH8PmUcK+JV6cU4qWiwWA=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qanB9-0007HU-SU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:06:03 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-d7ac4ef02ffso2990673276.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693271154; x=1693875954;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+VYP3FCkB9Avc0wEhG1QfSRDsoDUHiUu4wJueREO4y4=;
 b=ujwKIHpWQYieX5zWLTPU8ze/RTpnuvcVBnpqlqFfcDIgLMho4rfGkkzeZFCHV7L5yF
 ow1PpVJdcM6caFMdAXOFtAdCSkeHflHDuYelSdwi6LHA2KT0/MXOI64VUYRmvVtb+vV9
 NRw04yfNj2d8/w7gM0KTQFKiUa1L6SkX/SH6Y6qlrI8zJPPSNR6aNH/1rsM4JPHXPU2J
 58sYAdypDcGgUqUjt7Apj5gj4uKnAOktE/Z+V1rZzguIDDVv/U5toCmo1M+XHNycWbdr
 I+qZpWbGCZx52OI/zbiPeUwnTOHTh7cqTT7TbkHEuB6ifLE3BwFhiZEfUIyVYgxt0Uyu
 YmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693271154; x=1693875954;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+VYP3FCkB9Avc0wEhG1QfSRDsoDUHiUu4wJueREO4y4=;
 b=MkkHxApz9/hNEOn2VbXVS+w4aVJT5X4tE/o+n+5sF4rqpMunUZZ2oWoAcOoK4ntF0v
 qtIJQmJgNLd7M31gu6MP9UvUkSHznQmnJ4mkRE1c04Oc6BTA4JE/O01jyj60X1tG1M03
 D51VF6Nl3RY88s+LmvqcstDoQkhS4s6onmswXUIcgWTqSW7keVLnSwKy/o/BX0IBKLnq
 aYXKem79szpZks0jHpPyWimwPicLYJzInsgC5p4dx0aT0itclrxzVRdGAqud99BPZJVJ
 5vvSoB25it6YRUMygl5F7gBIOey2bfaBuAslHnM6dA6vhMVD2UU5wCEijfqVJ1cu6kWO
 w+Yw==
X-Gm-Message-State: AOJu0Yweq6zoT/LovcO365jOnRkRJbN+fn4dhWUWKmZ0kNfs1BoQDnw4
 2dLOxBgaYr2Hqpo6JnJHgmGFukwigHZQtEfb/pwyyHfjFBTrq8qNFf53cJ9d5Wrc7kOEPjHHyGc
 2NmqQT5MjCP5vRiZx3GzDrUoTy9B8gXklKV5OzM0OVIh6EZF8okTV8twYe/oiumLGGEM/rbuiGJ
 9ie1HuzvM=
X-Google-Smtp-Source: AGHT+IFm9crX3pscrMiBS8P4JgG5vht6DKWFEQDhmwEvI81rFmobIQYugaO/euX34D5ldS/8Vii9zsk+nMw=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:d11f:7395:bc0b:a192])
 (user=drosen job=sendgmr) by 2002:a05:6902:106:b0:d77:984e:c770 with SMTP id
 o6-20020a056902010600b00d77984ec770mr773392ybh.5.1693271154093; Mon, 28 Aug
 2023 18:05:54 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:05:35 -0700
In-Reply-To: <20230829010536.3044883-1-drosen@google.com>
Mime-Version: 1.0
References: <20230829010536.3044883-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230829010536.3044883-7-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This moves access to f2fs_dentry_block's dentry list and
 filename
 list behind a macro, as their locations depend on block size. Since struct
 f2fs_dentry_block no longer represents the full block, use F2FS_BLKSIZE instead
 of sizeof(struct f2fs_dentry_block) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.201 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qanB9-0007HU-SU
Subject: [f2fs-dev] [PATCH v3 6/7] f2fs-tools: Refactor f2fs_dentry_block
 struct
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This moves access to f2fs_dentry_block's dentry list and filename list
behind a macro, as their locations depend on block size.

Since struct f2fs_dentry_block no longer represents the full block, use
F2FS_BLKSIZE instead of sizeof(struct f2fs_dentry_block)

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/dir.c         | 26 +++++++++++-----------
 fsck/fsck.c        |  2 +-
 include/f2fs_fs.h  | 30 ++++++++++++++++++++------
 mkfs/f2fs_format.c | 54 +++++++++++++++++++++++-----------------------
 4 files changed, 65 insertions(+), 47 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 64beaad..21d9da3 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -43,8 +43,8 @@ void make_dentry_ptr(struct f2fs_dentry_ptr *d, struct f2fs_node *node_blk,
 		d->max = NR_DENTRY_IN_BLOCK;
 		d->nr_bitmap = SIZE_OF_DENTRY_BITMAP;
 		d->bitmap = t->dentry_bitmap;
-		d->dentry = t->dentry;
-		d->filename = t->filename;
+		d->dentry = F2FS_DENTRY_BLOCK_DENTRIES(t);
+		d->filename = F2FS_DENTRY_BLOCK_FILENAMES(t);
 	} else {
 		int entry_cnt = NR_INLINE_DENTRY(node_blk);
 		int bitmap_size = INLINE_DENTRY_BITMAP_SIZE(node_blk);
@@ -352,17 +352,17 @@ static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 	dent_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(dent_blk);
 
-	dent_blk->dentry[0].hash_code = 0;
-	dent_blk->dentry[0].ino = cpu_to_le32(ino);
-	dent_blk->dentry[0].name_len = cpu_to_le16(1);
-	dent_blk->dentry[0].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[0], ".", 1);
-
-	dent_blk->dentry[1].hash_code = 0;
-	dent_blk->dentry[1].ino = cpu_to_le32(pino);
-	dent_blk->dentry[1].name_len = cpu_to_le16(2);
-	dent_blk->dentry[1].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[1], "..", 2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).ino = cpu_to_le32(ino);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).name_len = cpu_to_le16(1);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 0), ".", 1);
+
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).ino = cpu_to_le32(pino);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).name_len = cpu_to_le16(2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 1), "..", 2);
 
 	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
 	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index e605d3c..13494b0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1963,7 +1963,7 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 
 	dentries = __chk_dentries(sbi, casefolded, child,
 			de_blk->dentry_bitmap,
-			de_blk->dentry, de_blk->filename,
+			F2FS_DENTRY_BLOCK_DENTRIES(de_blk), F2FS_DENTRY_BLOCK_FILENAMES(de_blk),
 			NR_DENTRY_IN_BLOCK, last_blk, enc_name);
 
 	if (dentries < 0 && f2fs_dev_is_writable()) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index fc65670..edc2eaf 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1365,16 +1365,29 @@ struct f2fs_dir_entry {
 
 static_assert(sizeof(struct f2fs_dir_entry) == 11, "");
 
-/* 4KB-sized directory entry block */
+/*
+ * Block-sized directory entry block
+ * On disk structure:
+ * struct f2fs_dentry_block;
+ * __u8 reserved[SIZE_OF_RESERVED];
+ * struct f2fs_dir_entry dentry[NR_DENTRY_IN_BLOCK];
+ * __u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
+ *
+ * Do NOT use sizeof. Use F2FS_BLKSIZE instead
+ */
 struct f2fs_dentry_block {
 	/* validity bitmap for directory entries in each block */
-	__u8 dentry_bitmap[SIZE_OF_DENTRY_BITMAP];
-	__u8 reserved[SIZE_OF_RESERVED];
-	struct f2fs_dir_entry dentry[NR_DENTRY_IN_BLOCK];
-	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
+	__u8 dentry_bitmap[0]; /* size is SIZE_OF_DENTRY_BITMAP, based on block size */
 };
 
-static_assert(sizeof(struct f2fs_dentry_block) == F2FS_BLKSIZE, "");
+#define F2FS_DENTRY_BLOCK_DENTRIES(blk) ((struct f2fs_dir_entry *)\
+			&((blk)->dentry_bitmap[SIZE_OF_DENTRY_BITMAP + SIZE_OF_RESERVED]))
+#define F2FS_DENTRY_BLOCK_DENTRY(blk, i) (F2FS_DENTRY_BLOCK_DENTRIES((blk))[(i)])
+
+#define F2FS_DENTRY_BLOCK_FILENAMES(blk) ((__u8(*)[F2FS_SLOT_LEN])&F2FS_DENTRY_BLOCK_DENTRY(blk,\
+							NR_DENTRY_IN_BLOCK))
+#define F2FS_DENTRY_BLOCK_FILENAME(blk, i) (&((__u8 *)&F2FS_DENTRY_BLOCK_DENTRY(blk,\
+							NR_DENTRY_IN_BLOCK))[(i) * F2FS_SLOT_LEN])
 
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
@@ -2043,6 +2056,11 @@ static inline void check_block_struct_sizes(void)
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
 			+ offsetof(struct f2fs_journal, info)
 			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+
+	/* Check Dentry Block Size */
+	assert(sizeof(__u8) * (SIZE_OF_DENTRY_BITMAP + SIZE_OF_RESERVED)
+			+ NR_DENTRY_IN_BLOCK * sizeof(struct f2fs_dir_entry)
+			+ NR_DENTRY_IN_BLOCK * F2FS_SLOT_LEN * sizeof(u8) == F2FS_BLKSIZE);
 }
 
 #endif	/*__F2FS_FS_H */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 740e752..f2840c8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1217,17 +1217,17 @@ static block_t f2fs_add_default_dentry_root(void)
 		return 0;
 	}
 
-	dent_blk->dentry[0].hash_code = 0;
-	dent_blk->dentry[0].ino = sb->root_ino;
-	dent_blk->dentry[0].name_len = cpu_to_le16(1);
-	dent_blk->dentry[0].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[0], ".", 1);
-
-	dent_blk->dentry[1].hash_code = 0;
-	dent_blk->dentry[1].ino = sb->root_ino;
-	dent_blk->dentry[1].name_len = cpu_to_le16(2);
-	dent_blk->dentry[1].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[1], "..", 2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).ino = sb->root_ino;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).name_len = cpu_to_le16(1);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 0), ".", 1);
+
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).ino = sb->root_ino;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).name_len = cpu_to_le16(2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 1), "..", 2);
 
 	/* bitmap for . and .. */
 	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
@@ -1237,13 +1237,13 @@ static block_t f2fs_add_default_dentry_root(void)
 		int len = strlen(LPF);
 		f2fs_hash_t hash = f2fs_dentry_hash(0, 0, (unsigned char *)LPF, len);
 
-		dent_blk->dentry[2].hash_code = cpu_to_le32(hash);
-		dent_blk->dentry[2].ino = cpu_to_le32(c.lpf_ino);
-		dent_blk->dentry[2].name_len = cpu_to_le16(len);
-		dent_blk->dentry[2].file_type = F2FS_FT_DIR;
-		memcpy(dent_blk->filename[2], LPF, F2FS_SLOT_LEN);
+		F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 2).hash_code = cpu_to_le32(hash);
+		F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 2).ino = cpu_to_le32(c.lpf_ino);
+		F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 2).name_len = cpu_to_le16(len);
+		F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 2).file_type = F2FS_FT_DIR;
+		memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 2), LPF, F2FS_SLOT_LEN);
 
-		memcpy(dent_blk->filename[3], &LPF[F2FS_SLOT_LEN],
+		memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 3), &LPF[F2FS_SLOT_LEN],
 				len - F2FS_SLOT_LEN);
 
 		test_and_set_bit_le(2, dent_blk->dentry_bitmap);
@@ -1494,17 +1494,17 @@ static block_t f2fs_add_default_dentry_lpf(void)
 		return 0;
 	}
 
-	dent_blk->dentry[0].hash_code = 0;
-	dent_blk->dentry[0].ino = cpu_to_le32(c.lpf_ino);
-	dent_blk->dentry[0].name_len = cpu_to_le16(1);
-	dent_blk->dentry[0].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[0], ".", 1);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).ino = cpu_to_le32(c.lpf_ino);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).name_len = cpu_to_le16(1);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 0), ".", 1);
 
-	dent_blk->dentry[1].hash_code = 0;
-	dent_blk->dentry[1].ino = sb->root_ino;
-	dent_blk->dentry[1].name_len = cpu_to_le16(2);
-	dent_blk->dentry[1].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[1], "..", 2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).hash_code = 0;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).ino = sb->root_ino;
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).name_len = cpu_to_le16(2);
+	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 1).file_type = F2FS_FT_DIR;
+	memcpy(F2FS_DENTRY_BLOCK_FILENAME(dent_blk, 1), "..", 2);
 
 	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
 	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
