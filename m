Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC12B8B49
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Nov 2020 07:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhTs2uhNhq4cGc9o6MKBLSSGDBm8hYIGNDlVRl+CVBc=; b=biXpLulPvi/3GC/jemBkxr4Ms
	uaTz6kNKe9lYTq2T90tldJoIYKYriomNYXtmhyJZA+otnQg9o/ZrxrfBEVLCc4IcCL/+6wMUwY9HZ
	tjG70OMOeyG0mtN9FatJBssveAfvGOas8fXIi8kZbSyoMbX1Mm7YsJJvQAcxFU5f3fPJk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfd8Q-0005N6-45; Thu, 19 Nov 2020 06:09:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3CQy2XwYKAPwhvswirksskpi.gsq@flex--drosen.bounces.google.com>)
 id 1kfd8M-0005MX-Go
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Nov 2020 06:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLgs0iQsLlWyiqMNFAp8InT80xc0xnNJ/w2SdIsedrM=; b=QgE0A3Eq4ecl25XYiJ+YlATdo
 eZtPv84/GkjqmggrHccQQh50R7jR7bRAb5pA20wtvGK5G48OUMeCVFpAe3y+KiUnC99B9b4/KIDW+
 bqW1hlco8DS7ztCRRwAX8SDBmEto3Knv0Yw7ytXt3Y9D4kr0XWfLoZ3t7yYUdCXoTqa4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SLgs0iQsLlWyiqMNFAp8InT80xc0xnNJ/w2SdIsedrM=; b=EGrOhvhBBrYTOY8ePQoRKbZ2au
 3oj+pzYOluvOn5gui8OYG9GZeYvvgprUaDkODXL44kZ9IZN9luKwnbRPBXIC/pAEglau23IjY1xYx
 HLddV3gOf2JS5bkk6c9rj6tpmvjS0rRIFERS2rgLuiIih5HE9DuUufzIS6U5HSnAeSdY=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfd8A-00G2Yn-UC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Nov 2020 06:09:30 +0000
Received: by mail-pf1-f201.google.com with SMTP id w79so3048763pfc.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Nov 2020 22:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SLgs0iQsLlWyiqMNFAp8InT80xc0xnNJ/w2SdIsedrM=;
 b=lEc9IwJtnrFU+I4LOy2er5MPCDhqqE/c40hbLUsMFIYsdGfhSZpjSz4jC8JPbz3E9v
 /bQuOLrR5d32nLFwFisNqwWNSPWda2GLLfL/kV1xs2fOGOn2gDiYE+xd5hGEE+NiDtnC
 t0dZXN/ju8qMKRSLtfEPaak7bA5C+rrgRU83NhjMhWqGNClbhVau9HvTtPb+P2VznjXn
 2lpa/o7mvvE1LabacNKeqMTdgBO+s9ph9kugH1csugsZaiVgNUX9EBVt0ROQdAPlk4Rh
 vj1ZY7OlrIVrZ1eYVt3+Tj/wX1MOqVtyMhc5rh34E14ttvK4Lo8jYv24lj4vwWcA22ha
 a8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SLgs0iQsLlWyiqMNFAp8InT80xc0xnNJ/w2SdIsedrM=;
 b=d0E2cVnrApW2H3nWbz7wUO1UrMGzaBK3R9OXGpF47wg/u7PESjHSy2uOifM7r2Lk1s
 e2hrbpwhIJMw+lENYJs5p022dzr115vfGbHtTuIqBUl9s1z7wYPmu2axwkCkwuhXXcIv
 L9BvvElZKP9nW/L3gsBng8vGRH0GAf83nitHje928zGnvq5xnQZQhcNmzIyKgF4YnEmN
 8Walv74nY3eDhIDecEfPsC0L2f3sdp14/rmxE7LRk4yfQ+Uo6L7J2xR34gEonsNEUIZX
 uYa9dqskR9ymXcmyLNlnDdXSV9Mw5yQWTctlN498LcwDwJiJ22XiOvTtYCqUO0GeVaN3
 krsg==
X-Gm-Message-State: AOAM533uVge47PIgDtijds0Za8DE0yLyYOx6JUH2HGT6jIRxUGmYVOZB
 VZQ6jN/CFhUGkbxyP/wbGE+rPGqyYhs=
X-Google-Smtp-Source: ABdhPJyB7QPSPVEs1F2sx8O7KdJNLvoh03OdvLY+1uoa+NQsKLx7MvNb/Uqzugm43Q4OJhg0Fwc8eA2Whf0=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a63:cc07:: with SMTP id
 x7mr9267752pgf.209.1605766153372; 
 Wed, 18 Nov 2020 22:09:13 -0800 (PST)
Date: Thu, 19 Nov 2020 06:09:04 +0000
In-Reply-To: <20201119060904.463807-1-drosen@google.com>
Message-Id: <20201119060904.463807-4-drosen@google.com>
Mime-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kfd8A-00G2Yn-UC
Subject: [f2fs-dev] [PATCH v4 3/3] f2fs: Handle casefolding with Encryption
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
Cc: Daniel Rosenberg <drosen@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Expand f2fs's casefolding support to include encrypted directories.  To
index casefolded+encrypted directories, we use the SipHash of the
casefolded name, keyed by a key derived from the directory's fscrypt
master key.  This ensures that the dirhash doesn't leak information
about the plaintext filenames.

Encryption keys are unavailable during roll-forward recovery, so we
can't compute the dirhash when recovering a new dentry in an encrypted +
casefolded directory.  To avoid having to force a checkpoint when a new
file is fsync'ed, store the dirhash on-disk appended to i_name.

This patch incorporates work by Eric Biggers <ebiggers@google.com>
and Jaegeuk Kim <jaegeuk@kernel.org>.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c      | 98 +++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/f2fs.h     |  8 ++--
 fs/f2fs/hash.c     | 11 +++++-
 fs/f2fs/inline.c   |  4 ++
 fs/f2fs/recovery.c | 12 +++++-
 fs/f2fs/super.c    |  6 ---
 6 files changed, 106 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 71fdf5076461..82b58d1f80eb 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
+#include <asm/unaligned.h>
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/sched/signal.h>
@@ -206,30 +207,55 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 /*
  * Test whether a case-insensitive directory entry matches the filename
  * being searched for.
+ *
+ * Returns 1 for a match, 0 for no match, and -errno on an error.
  */
-static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
+static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
 			       const u8 *de_name, u32 de_name_len)
 {
 	const struct super_block *sb = dir->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
+	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
 	struct qstr entry = QSTR_INIT(de_name, de_name_len);
 	int res;
 
+	if (IS_ENCRYPTED(dir)) {
+		const struct fscrypt_str encrypted_name =
+			FSTR_INIT((u8 *)de_name, de_name_len);
+
+		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
+			return -EINVAL;
+
+		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		if (!decrypted_name.name)
+			return -ENOMEM;
+		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
+						&decrypted_name);
+		if (res < 0)
+			goto out;
+		entry.name = decrypted_name.name;
+		entry.len = decrypted_name.len;
+	}
+
 	res = utf8_strncasecmp_folded(um, name, &entry);
-	if (res < 0) {
-		/*
-		 * In strict mode, ignore invalid names.  In non-strict mode,
-		 * fall back to treating them as opaque byte sequences.
-		 */
-		if (sb_has_strict_encoding(sb) || name->len != entry.len)
-			return false;
-		return !memcmp(name->name, entry.name, name->len);
+	/*
+	 * In strict mode, ignore invalid names.  In non-strict mode,
+	 * fall back to treating them as opaque byte sequences.
+	 */
+	if (res < 0 && !sb_has_strict_encoding(sb)) {
+		res = name->len == entry.len &&
+				memcmp(name->name, entry.name, name->len) == 0;
+	} else {
+		/* utf8_strncasecmp_folded returns 0 on match */
+		res = (res == 0);
 	}
-	return res == 0;
+out:
+	kfree(decrypted_name.name);
+	return res;
 }
 #endif /* CONFIG_UNICODE */
 
-static inline bool f2fs_match_name(const struct inode *dir,
+static inline int f2fs_match_name(const struct inode *dir,
 				   const struct f2fs_filename *fname,
 				   const u8 *de_name, u32 de_name_len)
 {
@@ -256,6 +282,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 	struct f2fs_dir_entry *de;
 	unsigned long bit_pos = 0;
 	int max_len = 0;
+	int res = 0;
 
 	if (max_slots)
 		*max_slots = 0;
@@ -273,10 +300,15 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 			continue;
 		}
 
-		if (de->hash_code == fname->hash &&
-		    f2fs_match_name(d->inode, fname, d->filename[bit_pos],
-				    le16_to_cpu(de->name_len)))
-			goto found;
+		if (de->hash_code == fname->hash) {
+			res = f2fs_match_name(d->inode, fname,
+					      d->filename[bit_pos],
+					      le16_to_cpu(de->name_len));
+			if (res < 0)
+				return ERR_PTR(res);
+			if (res)
+				goto found;
+		}
 
 		if (max_slots && max_len > *max_slots)
 			*max_slots = max_len;
@@ -326,7 +358,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 		}
 
 		de = find_in_block(dir, dentry_page, fname, &max_slots);
-		if (de) {
+		if (IS_ERR(de)) {
+			*res_page = ERR_CAST(de);
+			de = NULL;
+			break;
+		} else if (de) {
 			*res_page = dentry_page;
 			break;
 		}
@@ -448,17 +484,39 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 	f2fs_put_page(page, 1);
 }
 
-static void init_dent_inode(const struct f2fs_filename *fname,
+static void init_dent_inode(struct inode *dir, struct inode *inode,
+			    const struct f2fs_filename *fname,
 			    struct page *ipage)
 {
 	struct f2fs_inode *ri;
 
+	if (!fname) /* tmpfile case? */
+		return;
+
 	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 
 	/* copy name info. to this inode page */
 	ri = F2FS_INODE(ipage);
 	ri->i_namelen = cpu_to_le32(fname->disk_name.len);
 	memcpy(ri->i_name, fname->disk_name.name, fname->disk_name.len);
+	if (IS_ENCRYPTED(dir)) {
+		file_set_enc_name(inode);
+		/*
+		 * Roll-forward recovery doesn't have encryption keys available,
+		 * so it can't compute the dirhash for encrypted+casefolded
+		 * filenames.  Append it to i_name if possible.  Else, disable
+		 * roll-forward recovery of the dentry (i.e., make fsync'ing the
+		 * file force a checkpoint) by setting LOST_PINO.
+		 */
+		if (IS_CASEFOLDED(dir)) {
+			if (fname->disk_name.len + sizeof(f2fs_hash_t) <=
+			    F2FS_NAME_LEN)
+				put_unaligned(fname->hash, (f2fs_hash_t *)
+					&ri->i_name[fname->disk_name.len]);
+			else
+				file_lost_pino(inode);
+		}
+	}
 	set_page_dirty(ipage);
 }
 
@@ -541,11 +599,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			return page;
 	}
 
-	if (fname) {
-		init_dent_inode(fname, page);
-		if (IS_ENCRYPTED(dir))
-			file_set_enc_name(inode);
-	}
+	init_dent_inode(dir, inode, fname, page);
 
 	/*
 	 * This file should be checkpointed during fsync.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 62b4f31d30e2..878308736761 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -533,9 +533,11 @@ struct f2fs_filename {
 #ifdef CONFIG_UNICODE
 	/*
 	 * For casefolded directories: the casefolded name, but it's left NULL
-	 * if the original name is not valid Unicode or if the filesystem is
-	 * doing an internal operation where usr_fname is also NULL.  In these
-	 * cases we fall back to treating the name as an opaque byte sequence.
+	 * if the original name is not valid Unicode, if the directory is both
+	 * casefolded and encrypted and its encryption key is unavailable, or if
+	 * the filesystem is doing an internal operation where usr_fname is also
+	 * NULL.  In all these cases we fall back to treating the name as an
+	 * opaque byte sequence.
 	 */
 	struct fscrypt_str cf_name;
 #endif
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index de841aaf3c43..e3beac546c63 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -111,7 +111,9 @@ void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname)
 		 * If the casefolded name is provided, hash it instead of the
 		 * on-disk name.  If the casefolded name is *not* provided, that
 		 * should only be because the name wasn't valid Unicode, so fall
-		 * back to treating the name as an opaque byte sequence.
+		 * back to treating the name as an opaque byte sequence.  Note
+		 * that to handle encrypted directories, the fallback must use
+		 * usr_fname (plaintext) rather than disk_name (ciphertext).
 		 */
 		WARN_ON_ONCE(!fname->usr_fname->name);
 		if (fname->cf_name.name) {
@@ -121,6 +123,13 @@ void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname)
 			name = fname->usr_fname->name;
 			len = fname->usr_fname->len;
 		}
+		if (IS_ENCRYPTED(dir)) {
+			struct qstr tmp = QSTR_INIT(name, len);
+
+			fname->hash =
+				cpu_to_le32(fscrypt_fname_siphash(dir, &tmp));
+			return;
+		}
 	}
 #endif
 	fname->hash = cpu_to_le32(TEA_hash_name(name, len));
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 70384e31788d..92e9852d316a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -332,6 +332,10 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 	de = f2fs_find_target_dentry(&d, fname, NULL);
 	unlock_page(ipage);
+	if (IS_ERR(de)) {
+		*res_page = ERR_CAST(de);
+		de = NULL;
+	}
 	if (de)
 		*res_page = ipage;
 	else
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4f12ade6410a..0947d36af1a8 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
+#include <asm/unaligned.h>
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include "f2fs.h"
@@ -128,7 +129,16 @@ static int init_recovered_filename(const struct inode *dir,
 	}
 
 	/* Compute the hash of the filename */
-	if (IS_CASEFOLDED(dir)) {
+	if (IS_ENCRYPTED(dir) && IS_CASEFOLDED(dir)) {
+		/*
+		 * In this case the hash isn't computable without the key, so it
+		 * was saved on-disk.
+		 */
+		if (fname->disk_name.len + sizeof(f2fs_hash_t) > F2FS_NAME_LEN)
+			return -EINVAL;
+		fname->hash = get_unaligned((f2fs_hash_t *)
+				&raw_inode->i_name[fname->disk_name.len]);
+	} else if (IS_CASEFOLDED(dir)) {
 		err = f2fs_init_casefolded_name(dir, fname);
 		if (err)
 			return err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f51d52591c99..42293b7ceaf2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3399,12 +3399,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
 
-		if (f2fs_sb_has_encrypt(sbi)) {
-			f2fs_err(sbi,
-				"Can't mount with encoding and encryption");
-			return -EINVAL;
-		}
-
 		if (f2fs_sb_read_encoding(sbi->raw_super, &encoding_info,
 					  &encoding_flags)) {
 			f2fs_err(sbi,
-- 
2.29.2.454.gaff20da3a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
