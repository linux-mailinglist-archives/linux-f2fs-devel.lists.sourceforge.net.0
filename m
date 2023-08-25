Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D41097891D3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXd-0002LV-7F;
	Fri, 25 Aug 2023 22:44:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3xS7pZAYKAPQZnkoajckkcha.Yki@flex--drosen.bounces.google.com>)
 id 1qZfXb-0002LJ-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UDdV6uDdBALNxpq/V338GEwwvrnFON/4W2F10W8a3hQ=; b=dByjJv/EJWKx30gNsaGiIespyD
 9oyCGCCxPa2U7pKsBuFZBoMbOtCvpSoDPY6FOjKOeqy1HRQJBfqPlHo5VW4YiTk6r/7gPkrOstHtg
 rza2qY5HGOVRL32EbaQVKzJOWRPZo2h+nUvff+DyMeDRiIb+5JdyaJJnJUZaa9G2iXDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UDdV6uDdBALNxpq/V338GEwwvrnFON/4W2F10W8a3hQ=; b=b50yqJThGNchq6O/ZD4SDQw6k1
 /B/y0ifMGv+C5uCQMdzRDWbW5yBE5RiShGornpdMtN5VRi9fJPhxVp+mww+BZlZDrOC86TYKQ1uET
 li1lgrH3rbAOg/gkTjn8CkRH29wrbNq2+CEN2RBNouWWx5ZLvFjryRRfMMcrJut/27+s=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXX-0007Ne-JV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:31 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-d795e8483f8so1259835276.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003462; x=1693608262;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UDdV6uDdBALNxpq/V338GEwwvrnFON/4W2F10W8a3hQ=;
 b=qGBmxfTojS/mXSjDn+M/7o2GVovQs+SW0YG88qtrNt0aHiEDP4FjUgPPCvRKkTM9jz
 aG2YupGu0XdgPnY80f4oljo2SCzof8Yt19W4NJsRZtZ9J5oWalHHWWdFnDxcTsQGO8Y6
 l6JwOGHy2TcG0bBq8tDC1yxgcT/vwq09pUJGsxR1Uq5+Y3xx/bDEZ4O8czar2Lb5LgU+
 Vq8GH+wn67GM3isD9D5+AaRbzyvxgYIuEbU7IMyi3IhuF2zULeARwWn7vYe9KpK4EbWq
 YngE+Uaw0YnyhZdiBjYjxtxMXt2gBcnxxjIKEjXWykuNRv9TZf2oQZPrfF0oYK5Mkgew
 pgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003462; x=1693608262;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UDdV6uDdBALNxpq/V338GEwwvrnFON/4W2F10W8a3hQ=;
 b=YGPGxh64xRLU1EkzOi0Yf2i2rNImBLPyg5c00ac/9MMDj1eVsOvhW/tIbGOIk9tDrb
 qDkUQImYR2C0Fom4oQi1nv1jRj+mjSga0aTqSMBYIJ+sd9qyZizVEq7xKImnLl33SUEZ
 A7ywg0BeslUZiJM0DKhQGRpIRLLA2697VZ8cK5Q71hBwY0U/ULDjVR9VeSWq0/xkOJ0z
 1tgdudO4D3jV3Kc2+VP7oVLfjAqm/9vsz+VnY/cLDX5AEiaxKe8FmKH/0bQvN+oNGQat
 MD9EaIePvGbU+P7+a+h9fTW1FM0u2si74AW+A41uW5dDGvrmbY8UGK5uuEW1GoZAO1cc
 TENA==
X-Gm-Message-State: AOJu0YyFFVBX/lrUVAH1PZq2g4PWKb5/BfpFJ4olg5utJUJk9aRlc+1w
 0Ky3csI/e7v6lv+U8WTF0JeY43ma+XouWdfYoTiSlrO5kgtvlcJbMpXDlImK9Ixy8H0gXuc5Eao
 Y7nXpXvkwKBOMek/YHshhop1zKk5nQfO6tUdAZroremFbnZj8k07U/kEzg3NvrDlVGo2qY8OT69
 TdpYCPOPQ=
X-Google-Smtp-Source: AGHT+IGYxMCfTEOBOPqeHdJqBocKlh8+eoZpQyjzHu5uRw8ggc/cMVD7AKX8tpaexsU7d0ceTU67cyvkxgw=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a25:ae9c:0:b0:d77:fb00:b246 with SMTP id
 b28-20020a25ae9c000000b00d77fb00b246mr399401ybj.1.1693003461882; Fri, 25 Aug
 2023 15:44:21 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:43:59 -0700
In-Reply-To: <20230825224400.2206278-1-drosen@google.com>
Mime-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-7-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.201 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXX-0007Ne-JV
Subject: [f2fs-dev] [PATCH v2 6/7] f2fs-tools: Refactor f2fs_dentry_block
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
index e6c68b2..adbd381 100644
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
@@ -2040,6 +2053,11 @@ static inline void check_block_struct_sizes(void)
 	/* Check Info Journal Block Size */
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
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
