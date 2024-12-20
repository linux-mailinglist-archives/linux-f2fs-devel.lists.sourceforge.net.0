Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 228429F986A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 18:44:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOh3N-0007By-GJ;
	Fri, 20 Dec 2024 17:44:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3u6dlZwcKAOIGLYPPIIKSSKPI.GSQ@flex--chullee.bounces.google.com>)
 id 1tOh3M-0007Bs-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 17:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P9Low56i6kWFMERnPlXDnXQsrHpNmKP0VHgnNh47lzM=; b=hSktFfxm5tz0uvbZqQ9XjtSVb3
 sa5igQTo9mSAGQZX0H6JKYEEujnsXOPKOZbeClzDNSR/gJ2UTC3eHgLRFs5oIyottZYnyLse5y55u
 rdCwcU85lc8jiSffjDKYQsFi6lSMiOBCvD8yAxegIc+8ZtXzzOhGADSHUwCJ4DZ04Fa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P9Low56i6kWFMERnPlXDnXQsrHpNmKP0VHgnNh47lzM=; b=O
 kYJ2ve1ai5aytwVJPevb/MbLQxOK0azuA7+b0q26O9JMVvqY1VyE2cApnSUB52IH/9Oto7aiw9lUi
 rR2EdmGBxJ6DIOiSpbkyMhQvMcRxADsK+Fi7caktvFj06HskY9yY8fl/0U/AuqWh2LMCoR095HvtN
 RAjhHx+EAbzpEBFU=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tOh3L-0005o6-KR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 17:44:44 +0000
Received: by mail-ua1-f73.google.com with SMTP id
 a1e0cc1a2514c-85c5bcc6b54so1536508241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Dec 2024 09:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734716678; x=1735321478;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P9Low56i6kWFMERnPlXDnXQsrHpNmKP0VHgnNh47lzM=;
 b=OCRr+Don06OroJNT/UGsVDAZffF24mb+iq/MFmo65nb/KSR9UHwcVjoj+Gx4GS9+jQ
 gpfmI37F6KzfSn88RSoozH677RikD0qXWTnkzFQnmHPfG8soV9mP01o5ECUl3AvyqHGV
 XC480S1wIsGY/O1Cs6/OH5mHFTmhE/dooaI9JvWph6eYcRMR8RUv3hNE2qH7E7aJMOS/
 Jv3QgzHz6YARWXGX3dlfGdTaKG5UbRdPSigOWPH0rqE1jJxGcL2k+zJ4osVZw1YjP1s4
 bJxqbWIZDBzOw9X1caZ2ysMfm4bXvy+21Kc0tuNwZyUsDsXUj7o4ysvmCD9AfD2/7plT
 RzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734716678; x=1735321478;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P9Low56i6kWFMERnPlXDnXQsrHpNmKP0VHgnNh47lzM=;
 b=DeqM5Yu0xybUXCaywAGYrBEUI5hX2rNyjNEHomN7GYozDZsiyR6Y+Ulfq/dLzTGOGg
 FVf+8AKKYqan72N9KYpohm9Q7L0Rd186W2BkOjuqwT6C70tlX7qbGImHyvpSpYU7AS2d
 iiCyvV8Ei+P0k65Lvpj99ZHW+dIF3Nmpj+oIWcs2lskR13ifoQ9bdldZSUiVBD5M3SB8
 qf2Yixm7hKNsusXql1hRrz29EhtpDJkUSsysXvHRWEGgJW+gWOdhPVVlEOwOf1rhtEis
 WtoV8eZf42K0n8BBXzNPm7DKTgQL2LVjn7jU8zrAbg+w07tn2+mBmd0AIVsoAoU374qu
 JrkQ==
X-Gm-Message-State: AOJu0YwxbcxSH6YnzrFx/XLak7dTajDdj8v66VOKPKAmEXxLN4D072Ww
 +/r03HKh6TTDKLXa3pw6XOzK0aZ81Y6isOquSsIFUcIZdBM1GKX2g+DkQFiCEj706ho4T+ilyJy
 Can1PfA==
X-Google-Smtp-Source: AGHT+IHOSurQEe7cBvOXyFMYUvOQ+el07sIHHf1mWVWO5u52tZNW1gMZCYlmhRBTb0opBuFfeBlaey9ha1Qq
X-Received: from pfwz30.prod.google.com ([2002:a05:6a00:1d9e:b0:725:df7a:f4e3])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ac5:b0:726:41e:b310
 with SMTP id d2e1a72fcca58-72abdec84b4mr4229289b3a.12.1734715323924; Fri, 20
 Dec 2024 09:22:03 -0800 (PST)
Date: Fri, 20 Dec 2024 09:21:36 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220172136.1028811-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -8.8 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.73 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.73 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.73 listed in list.dnswl.org]
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tOh3L-0005o6-KR
Subject: [f2fs-dev] [PATCH v2] f2fs: Introduce linear search for dentries
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

Fixes: 5c26d2f1d3f5 ("unicode: Don't special case ignorable code points")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219586
Signed-off-by: Daniel Lee <chullee@google.com>
---
v2:
- Only update chash if use_hash is true
 fs/f2fs/dir.c    | 40 +++++++++++++++++++++++++++++-----------
 fs/f2fs/f2fs.h   |  6 ++++--
 fs/f2fs/inline.c |  5 +++--
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 47a5c806cf16..3e8e5ddf9dbc 100644
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
@@ -307,7 +313,10 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 		bidx++;
 	}
 
-	if (!de && room && F2FS_I(dir)->chash != fname->hash) {
+	if (!use_hash && !de && ++bucket_no < nbucket)
+		goto start_find_bucket;
+
+	if (use_hash && !de && room && F2FS_I(dir)->chash != fname->hash) {
 		F2FS_I(dir)->chash = fname->hash;
 		F2FS_I(dir)->clevel = level;
 	}
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
