Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E679F47E1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Dec 2024 10:46:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNU9m-0002tV-Gi;
	Tue, 17 Dec 2024 09:46:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jC5hZwcKAK8RWjaaTTVddVaT.Rdb@flex--chullee.bounces.google.com>)
 id 1tNU9l-0002tL-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Dec 2024 09:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzkj+oZY7b1p5AsRN5+ESM/ySLflwyn0YjSlF+T1L78=; b=gDdBkxHp5KCtq2fVZGRZKCjDdI
 72KP22XpF2q4PPsDWg1Z6QejQiY/wjrh+2ntnLmmIP5H6VKExs7t+Ux5mdFBUXM1Mi+pQtrm3yeup
 yEDNMpkUWh+r7iXVecTOJv7dVPzyUjbpHKPDnP+SRLyB2KkKANiQL5N97TUh9jPCGgPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uzkj+oZY7b1p5AsRN5+ESM/ySLflwyn0YjSlF+T1L78=; b=k
 l06vdOyHdqSqGqs+z2WIFBp8789jZfbr3tlCLHqEgDi2c/3W1Wp1iheC+erW6sB69E23LBcAADwna
 lmDW8v72OOwsyngUSVAxieH7te82z/aE/heIi/7abtFgg6/5jrvR+5nc4N46iYxEdBSCEZ3/mqh8R
 DWEeyajHp+B+Q9IQ=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tNU9k-0003YB-79 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Dec 2024 09:46:21 +0000
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7b6f943f5abso837387185a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Dec 2024 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734428769; x=1735033569;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uzkj+oZY7b1p5AsRN5+ESM/ySLflwyn0YjSlF+T1L78=;
 b=D2VovWKGpLGiSQDqVoDxk+I5/Oegq3yfo7UTshVxe9Ipl8WscaQMf8fluiYWPYrncw
 XYRgQKPzqlPOnkvigZGWNKLBHCLRud7s6HqrckJ0hYSPme/SJticJy9nHT6x2BnWJtmk
 MPG6wcVUx35nz6f/exzjO1c4ku0AId1KTQErnmZ0cFfneoljr/PPzde/iE8kvuZadUKS
 aJ4kn4cbGCbl7RTSxsImhkGAo0fMo+lU+u+H8SSrZyhzYZLqh2//GU6wL9YQ5afdcebF
 /ULsojDabXpXvUmyfPNYVXWKd2noSrugWU70k/CSpMqxd4ML1viw1jqw4PzR09BxEkQV
 0jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734428769; x=1735033569;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uzkj+oZY7b1p5AsRN5+ESM/ySLflwyn0YjSlF+T1L78=;
 b=phPZ85HkZNjBrgUfi/8FPLzgorOl050oYR9AXIqEiRIN1sYYvD7C+DcYUdBE+IXT/q
 qvJgwO9AjgCPhbebfgiYbbeov131OWGXEiikWwVVI2PgxxdPm0byIErCIPvaLmU0kMX1
 3PYPuDcUuWerHsM1zkiratJnBLYgJdZBjtwIC2SG7TlId5EW0Xj2JKGL7Lf8pUktOxKy
 fQFwYOvC52ZBJkpeHHwJVm3emfpk3KwkV5vOK5kCXDymgo5r1cGNpaNE5dLtfHn8ylCw
 SgE5m5wBy0HVDl5xVGFGmB0TSuXgr8SFFtxlW29+BFPka7VXfOtXLTl1jPgIdeVk85Y3
 sGHQ==
X-Gm-Message-State: AOJu0Yw3rH/Jc1lCItSeqfmGF4I/sz5jrj8JRiwLaBRW4y0529G/PhTe
 rFNB0Tp60gWjqjXNJOWzs81YXskFkBYoMeVO8otz3JH1Mie2yNXQCHT8xq1R7acdKMQws6w7iVY
 FPiWW5w==
X-Google-Smtp-Source: AGHT+IF2ZLNc9VJ2YJ+9NeEf33wUsyKisCQHejynIqB7XOQN3U9wu0RWjogWkI1guDFhQi+tt9OQ7YYD+A1T
X-Received: from pfcg20.prod.google.com ([2002:a05:6a00:23d4:b0:727:3cbd:60ac])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1591:b0:1e1:bdae:e04d
 with SMTP id adf61e73a8af0-1e1dfe2264amr23361219637.36.1734422156154; Mon, 16
 Dec 2024 23:55:56 -0800 (PST)
Date: Mon, 16 Dec 2024 23:55:52 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241217075552.1167994-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -8.8 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch addresses an issue where some files in
 case-insensitive
 directories become inaccessible due to changes in how the kernel function,
 utf8_casefold(), generates case-folded strings from the co [...] 
 Content analysis details:   (-8.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.201 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.201 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.201 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tNU9k-0003YB-79
Subject: [f2fs-dev] [PATCH] f2fs: Introduce linear search for dentries
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

This patch addresses an issue where some files in case-insensitive
directories become inaccessible due to changes in how the kernel function,
utf8_casefold(), generates case-folded strings from the commit 5c26d2f1d3f5
("unicode: Don't special case ignorable code points").

F2FS uses these case-folded names to calculate hash values for locating
dentries and stores them on disk. Since utf8_casefold() can produce
different output across kernel versions, stored hash values and newly
calculated hash values may differ. This results in affected files no
longer being found via the hash-based lookup.

To resolve this, the patch introduces a linear search fallback.
If the initial hash-based search fails, F2FS will sequentially scan the
directory entries.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219586
Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/dir.c    | 38 ++++++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h   |  6 ++++--
 fs/f2fs/inline.c |  5 +++--
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 47a5c806cf16..a85d19b4e178 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -175,7 +175,8 @@ static unsigned long dir_block_index(unsigned int level,
 static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 				struct page *dentry_page,
 				const struct f2fs_filename *fname,
-				int *max_slots)
+				int *max_slots,
+				bool use_hash)
 {
 	struct f2fs_dentry_block *dentry_blk;
 	struct f2fs_dentry_ptr d;
@@ -183,7 +184,7 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
-	return f2fs_find_target_dentry(&d, fname, max_slots);
+	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
 }
 
 static inline int f2fs_match_name(const struct inode *dir,
@@ -208,7 +209,8 @@ static inline int f2fs_match_name(const struct inode *dir,
 }
 
 struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
-			const struct f2fs_filename *fname, int *max_slots)
+			const struct f2fs_filename *fname, int *max_slots,
+			bool use_hash)
 {
 	struct f2fs_dir_entry *de;
 	unsigned long bit_pos = 0;
@@ -231,7 +233,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 			continue;
 		}
 
-		if (de->hash_code == fname->hash) {
+		if (!use_hash || de->hash_code == fname->hash) {
 			res = f2fs_match_name(d->inode, fname,
 					      d->filename[bit_pos],
 					      le16_to_cpu(de->name_len));
@@ -258,11 +260,12 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 					unsigned int level,
 					const struct f2fs_filename *fname,
-					struct page **res_page)
+					struct page **res_page,
+					bool use_hash)
 {
 	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
 	unsigned int nbucket, nblock;
-	unsigned int bidx, end_block;
+	unsigned int bidx, end_block, bucket_no;
 	struct page *dentry_page;
 	struct f2fs_dir_entry *de = NULL;
 	pgoff_t next_pgofs;
@@ -272,8 +275,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
 	nblock = bucket_blocks(level);
 
+	bucket_no = use_hash ? le32_to_cpu(fname->hash) % nbucket : 0;
+
+start_find_bucket:
 	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
-			       le32_to_cpu(fname->hash) % nbucket);
+			       bucket_no);
 	end_block = bidx + nblock;
 
 	while (bidx < end_block) {
@@ -290,7 +296,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_page, fname, &max_slots);
+		de = find_in_block(dir, dentry_page, fname, &max_slots, use_hash);
 		if (IS_ERR(de)) {
 			*res_page = ERR_CAST(de);
 			de = NULL;
@@ -307,6 +313,9 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 		bidx++;
 	}
 
+	if (!use_hash && !de && ++bucket_no < nbucket)
+		goto start_find_bucket;
+
 	if (!de && room && F2FS_I(dir)->chash != fname->hash) {
 		F2FS_I(dir)->chash = fname->hash;
 		F2FS_I(dir)->clevel = level;
@@ -323,11 +332,13 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	struct f2fs_dir_entry *de = NULL;
 	unsigned int max_depth;
 	unsigned int level;
+	bool use_hash = true;
 
 	*res_page = NULL;
 
+start_find_entry:
 	if (f2fs_has_inline_dentry(dir)) {
-		de = f2fs_find_in_inline_dir(dir, fname, res_page);
+		de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
 		goto out;
 	}
 
@@ -343,11 +354,18 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	}
 
 	for (level = 0; level < max_depth; level++) {
-		de = find_in_level(dir, level, fname, res_page);
+		de = find_in_level(dir, level, fname, res_page, use_hash);
 		if (de || IS_ERR(*res_page))
 			break;
 	}
+
 out:
+#if IS_ENABLED(CONFIG_UNICODE)
+	if (IS_CASEFOLDED(dir) && !de && use_hash) {
+		use_hash = false;
+		goto start_find_entry;
+	}
+#endif
 	/* This is to increase the speed of f2fs_create */
 	if (!de)
 		F2FS_I(dir)->task = current;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f523dd302bf6..1afebb9c4061 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3588,7 +3588,8 @@ int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			struct f2fs_filename *fname);
 void f2fs_free_filename(struct f2fs_filename *fname);
 struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
-			const struct f2fs_filename *fname, int *max_slots);
+			const struct f2fs_filename *fname, int *max_slots,
+			bool use_hash);
 int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			unsigned int start_pos, struct fscrypt_str *fstr);
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
@@ -4224,7 +4225,8 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					const struct f2fs_filename *fname,
-					struct page **res_page);
+					struct page **res_page,
+					bool use_hash);
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct page *ipage);
 int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index cbd2a0d34804..3e3c35d4c98b 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -352,7 +352,8 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					const struct f2fs_filename *fname,
-					struct page **res_page)
+					struct page **res_page,
+					bool use_hash)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
 	struct f2fs_dir_entry *de;
@@ -369,7 +370,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 	inline_dentry = inline_data_addr(dir, ipage);
 
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
-	de = f2fs_find_target_dentry(&d, fname, NULL);
+	de = f2fs_find_target_dentry(&d, fname, NULL, use_hash);
 	unlock_page(ipage);
 	if (IS_ERR(de)) {
 		*res_page = ERR_CAST(de);
-- 
2.47.1.613.gc27f4b7a9f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
