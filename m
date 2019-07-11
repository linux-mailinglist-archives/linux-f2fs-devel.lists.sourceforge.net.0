Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91B6610C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 23:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rkDKlyyyahSS/qGmhagXziax/H+tjd/6KiqUqN/8fak=; b=U4806M7RJjL/BwVQbIddyApEu
	C+RqxxF40yG786Rrg7p13onAoxo+vjZDA080gT/eVollmNvctWDJ/d2s7xd+hZZPlSyttxqFtptrG
	9mou+cmerZJVqtgqLiu8F8dGgWYsEAvnw1YfcG+TdLLSGy4fS9iq7E7xClHbIa1elS7Ok=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlgQF-0007yR-T2; Thu, 11 Jul 2019 21:16:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3FKAnXQYKAOEGURVHQJRRJOH.FRP@flex--drosen.bounces.google.com>)
 id 1hlgQF-0007yK-07
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 21:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xnSm70G0MmZwrMZozjP4kadCYUQI/ut0JntgOhPiPQA=; b=GuSSZfyrB64TCuJ6APMetWaIL
 BYWbVqggSFOSgbz66rh4D6dpDmEh2crvFIp+AyXF91H9HWa2AlfSE8sFXRpMtInCRVbVxQtXbHaEw
 PWsKvw0UofPKXdJe/J5LN+s0nvBdJ0M/e87YrOjfplnJVcnmnvhoSjQVt58cpkSea5d4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xnSm70G0MmZwrMZozjP4kadCYUQI/ut0JntgOhPiPQA=; b=k/w8yr5IseqqAgQ2FlCpfNLviY
 Yfkg15LgeXO+8hhJhaSmymlAQ3boAfDRNgh+BPaD/qAlRRVO7kxIBIStwCzljGJaNOzC1fL1hoFdf
 EYnrWYAOKFybdGxY3zICyVDeShPwf3s6DpTYxxqroy/HyTjMzAC05jdtbzOu/nJSqHyM=;
Received: from mail-oi1-f202.google.com ([209.85.167.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlgQD-00G0zZ-2Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 21:16:10 +0000
Received: by mail-oi1-f202.google.com with SMTP id u8so3244680oie.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xnSm70G0MmZwrMZozjP4kadCYUQI/ut0JntgOhPiPQA=;
 b=GVgYBajKdkX7Z8ZKF5Pe0z3MNTcyjmdVj5SKrP8xjzeZHbyF0sroE1iD3iIso7mLdz
 eLQeFNWBHF3f2EVLUONm65VLLCu/goEqM+l2AmaYzoW0KmlKw7Gfxwmiu8/3KzIQhQfE
 kA/R11DuH22GMGrFxQRXjdMYtAl2h9kbDRoB/BC7zqETPU7CfiOorWdaRu4MKKiPSWex
 +8LUfQSkwQYNM/PYmsgcOQOBkdk1Q2ZicLyAhi369ZOpr/V1Xs1cWFOX2S/ce98MGOyX
 xyuO4gwhSpkIGuFpXg7f6JWDAC5HnEi+pbxxjgXX8TG6MfiVFfiBHfomModcieHZtiNV
 3uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xnSm70G0MmZwrMZozjP4kadCYUQI/ut0JntgOhPiPQA=;
 b=HBPPuoj1rQGQQvXyv9Grjqbf2cXOYcUCNtepKUxW7QGa4ytzBo2v/6iIqPTdKhzkB/
 xkJ/adfEM/IYINjhv8ok7ynFzA+29i4qkgFZeYpcr1SpK2n+3/Rgjz3hFA2DxgXW6FX+
 12OBvTeWcU51cJ1H4YU/QcxDnKGT/Dbo0p3gVPF7KLdieMzt1IWft/71OUBAdgdDooqE
 20Ir4bzRb/fjk3drY/Oa5pg8Erwe/w1aA+lGw2mu8L1xmT7+ACP7U72XdtV6bIF4g7tG
 CwAaT+wGCJrwUEZFMWgkaMBk16X3Nr0rJ3xczgP/qeWzdDUnjwvFXZ/oCiVS4BqqoMQp
 vPVA==
X-Gm-Message-State: APjAAAWllPDOtVdc62nKx3mujYS5S9VPG2oCyTZjKlcyNV3/259PxwhY
 jMjB6k50NDXrgv2aHR6sNXR+rWH7DYM=
X-Google-Smtp-Source: APXvYqwes5OAlFif6IwUMTmmugeS32OYuNkx35zDtrYRfr0FqmmcF9XHjNND8gg9k6tyZ4ij+yAxCu+KhAc=
X-Received: by 2002:a63:7942:: with SMTP id u63mr6242778pgc.399.1562877972955; 
 Thu, 11 Jul 2019 13:46:12 -0700 (PDT)
Date: Thu, 11 Jul 2019 13:45:56 -0700
In-Reply-To: <20190711204556.120381-1-drosen@google.com>
Message-Id: <20190711204556.120381-2-drosen@google.com>
Mime-Version: 1.0
References: <20190711204556.120381-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.202 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hlgQD-00G0zZ-2Q
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Support case-insensitive file name
 lookups
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Modeled after commit b886ee3e778e ("ext4: Support case-insensitive file
name lookups")

"""
This patch implements the actual support for case-insensitive file name
lookups in f2fs, based on the feature bit and the encoding stored in the
superblock.

A filesystem that has the casefold feature set is able to configure
directories with the +F (F2FS_CASEFOLD_FL) attribute, enabling lookups
to succeed in that directory in a case-insensitive fashion, i.e: match
a directory entry even if the name used by userspace is not a byte per
byte match with the disk name, but is an equivalent case-insensitive
version of the Unicode string.  This operation is called a
case-insensitive file name lookup.

The feature is configured as an inode attribute applied to directories
and inherited by its children.  This attribute can only be enabled on
empty directories for filesystems that support the encoding feature,
thus preventing collision of file names that only differ by case.

* dcache handling:

For a +F directory, F2Fs only stores the first equivalent name dentry
used in the dcache. This is done to prevent unintentional duplication of
dentries in the dcache, while also allowing the VFS code to quickly find
the right entry in the cache despite which equivalent string was used in
a previous lookup, without having to resort to ->lookup().

d_hash() of casefolded directories is implemented as the hash of the
casefolded string, such that we always have a well-known bucket for all
the equivalencies of the same string. d_compare() uses the
utf8_strncasecmp() infrastructure, which handles the comparison of
equivalent, same case, names as well.

For now, negative lookups are not inserted in the dcache, since they
would need to be invalidated anyway, because we can't trust missing file
dentries.  This is bad for performance but requires some leveraging of
the vfs layer to fix.  We can live without that for now, and so does
everyone else.

* on-disk data:

Despite using a specific version of the name as the internal
representation within the dcache, the name stored and fetched from the
disk is a byte-per-byte match with what the user requested, making this
implementation 'name-preserving'. i.e. no actual information is lost
when writing to storage.

DX is supported by modifying the hashes used in +F directories to make
them case/encoding-aware.  The new disk hashes are calculated as the
hash of the full casefolded string, instead of the string directly.
This allows us to efficiently search for file names in the htree without
requiring the user to provide an exact name.

* Dealing with invalid sequences:

By default, when a invalid UTF-8 sequence is identified, ext4 will treat
it as an opaque byte sequence, ignoring the encoding and reverting to
the old behavior for that unique file.  This means that case-insensitive
file name lookup will not work only for that file.  An optional bit can
be set in the superblock telling the filesystem code and userspace tools
to enforce the encoding.  When that optional bit is set, any attempt to
create a file name using an invalid UTF-8 sequence will fail and return
an error to userspace.

* Normalization algorithm:

The UTF-8 algorithms used to compare strings in f2fs is implemented
in fs/unicode, and is based on a previous version developed by
SGI.  It implements the Canonical decomposition (NFD) algorithm
described by the Unicode specification 12.1, or higher, combined with
the elimination of ignorable code points (NFDi) and full
case-folding (CF) as documented in fs/unicode/utf8_norm.c.

NFD seems to be the best normalization method for F2FS because:

  - It has a lower cost than NFC/NFKC (which requires
    decomposing to NFD as an intermediary step)
  - It doesn't eliminate important semantic meaning like
    compatibility decompositions.

Although:

- This implementation is not completely linguistic accurate, because
different languages have conflicting rules, which would require the
specialization of the filesystem to a given locale, which brings all
sorts of problems for removable media and for users who use more than
one language.
"""

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/dir.c    | 133 ++++++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/f2fs.h   |  23 +++++---
 fs/f2fs/file.c   |  10 +++-
 fs/f2fs/hash.c   |  34 +++++++++++-
 fs/f2fs/inline.c |   6 +--
 fs/f2fs/inode.c  |   4 +-
 fs/f2fs/namei.c  |  21 ++++++++
 fs/f2fs/super.c  |   5 ++
 8 files changed, 210 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 59bc460178554..03b5c5d88e647 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -8,6 +8,7 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/sched/signal.h>
+#include <linux/unicode.h>
 #include "f2fs.h"
 #include "node.h"
 #include "acl.h"
@@ -81,7 +82,8 @@ static unsigned long dir_block_index(unsigned int level,
 	return bidx;
 }
 
-static struct f2fs_dir_entry *find_in_block(struct page *dentry_page,
+static struct f2fs_dir_entry *find_in_block(struct inode *dir,
+				struct page *dentry_page,
 				struct fscrypt_name *fname,
 				f2fs_hash_t namehash,
 				int *max_slots,
@@ -94,20 +96,56 @@ static struct f2fs_dir_entry *find_in_block(struct page *dentry_page,
 	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
 
 	make_dentry_ptr_block(NULL, &d, dentry_blk);
-	de = f2fs_find_target_dentry(fname, namehash, max_slots, &d);
+	de = f2fs_find_target_dentry(dir, fname, namehash, max_slots, &d);
 	if (de)
 		*res_page = dentry_page;
 
 	return de;
 }
 
-struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
-			f2fs_hash_t namehash, int *max_slots,
-			struct f2fs_dentry_ptr *d)
+#ifdef CONFIG_UNICODE
+/*
+ * Test whether a case-insensitive directory entry matches the filename
+ * being searched for.
+ *
+ * Returns: 0 if the directory entry matches, more than 0 if it
+ * doesn't match or less than zero on error.
+ */
+int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
+		    const struct qstr *entry)
+{
+	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
+	const struct unicode_map *um = sbi->s_encoding;
+	int ret;
+
+	ret = utf8_strncasecmp(um, name, entry);
+	if (ret < 0) {
+		/* Handle invalid character sequence as either an error
+		 * or as an opaque byte sequence.
+		 */
+		if (f2fs_has_strict_mode(sbi))
+			return -EINVAL;
+
+		if (name->len != entry->len)
+			return 1;
+
+		return !!memcmp(name->name, entry->name, name->len);
+	}
+
+	return ret;
+}
+#endif
+
+struct f2fs_dir_entry *f2fs_find_target_dentry(const struct inode *parent,
+			struct fscrypt_name *fname, f2fs_hash_t namehash,
+			int *max_slots, struct f2fs_dentry_ptr *d)
 {
 	struct f2fs_dir_entry *de;
 	unsigned long bit_pos = 0;
 	int max_len = 0;
+#ifdef CONFIG_UNICODE
+	struct qstr entry;
+#endif
 
 	if (max_slots)
 		*max_slots = 0;
@@ -119,16 +157,29 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 		}
 
 		de = &d->dentry[bit_pos];
+#ifdef CONFIG_UNICODE
+		entry.name = d->filename[bit_pos];
+		entry.len = de->name_len;
+#endif
 
 		if (unlikely(!de->name_len)) {
 			bit_pos++;
 			continue;
 		}
+		if (de->hash_code == namehash) {
+#ifdef CONFIG_UNICODE
+			if (F2FS_SB(parent->i_sb)->s_encoding &&
+					IS_CASEFOLDED(parent) &&
+					!f2fs_ci_compare(parent,
+						fname->usr_fname, &entry))
+				goto found;
 
-		if (de->hash_code == namehash &&
-		    fscrypt_match_name(fname, d->filename[bit_pos],
-				       le16_to_cpu(de->name_len)))
-			goto found;
+#endif
+			if (de->hash_code == namehash &&
+				fscrypt_match_name(fname, d->filename[bit_pos],
+						le16_to_cpu(de->name_len)))
+				goto found;
+		}
 
 		if (max_slots && max_len > *max_slots)
 			*max_slots = max_len;
@@ -157,7 +208,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	struct f2fs_dir_entry *de = NULL;
 	bool room = false;
 	int max_slots;
-	f2fs_hash_t namehash = f2fs_dentry_hash(&name, fname);
+	f2fs_hash_t namehash = f2fs_dentry_hash(dir, &name, fname);
 
 	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
 	nblock = bucket_blocks(level);
@@ -179,8 +230,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dentry_page, fname, namehash, &max_slots,
-								res_page);
+		de = find_in_block(dir, dentry_page, fname, namehash,
+							&max_slots, res_page);
 		if (de)
 			break;
 
@@ -247,10 +298,18 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 			const struct qstr *child, struct page **res_page)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct f2fs_dir_entry *de = NULL;
 	struct fscrypt_name fname;
 	int err;
 
+#ifdef CONFIG_UNICODE
+	if (f2fs_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
+			utf8_validate(sbi->s_encoding, child)) {
+		*res_page = ERR_PTR(-EINVAL);
+		return NULL;
+	}
+#endif
 	err = fscrypt_setup_filename(dir, child, 1, &fname);
 	if (err) {
 		if (err == -ENOENT)
@@ -505,7 +564,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 
 	level = 0;
 	slots = GET_DENTRY_SLOTS(new_name->len);
-	dentry_hash = f2fs_dentry_hash(new_name, NULL);
+	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);
 
 	current_depth = F2FS_I(dir)->i_current_depth;
 	if (F2FS_I(dir)->chash == dentry_hash) {
@@ -945,3 +1004,51 @@ const struct file_operations f2fs_dir_operations = {
 	.compat_ioctl   = f2fs_compat_ioctl,
 #endif
 };
+
+#ifdef CONFIG_UNICODE
+static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	struct qstr qstr = {.name = str, .len = len };
+
+	if (!IS_CASEFOLDED(dentry->d_parent->d_inode)) {
+		if (len != name->len)
+			return -1;
+		return memcmp(str, name, len);
+	}
+
+	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr);
+}
+
+static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
+	const struct unicode_map *um = sbi->s_encoding;
+	unsigned char *norm;
+	int len, ret = 0;
+
+	if (!IS_CASEFOLDED(dentry->d_inode))
+		return 0;
+
+	norm = kmalloc(PATH_MAX, GFP_ATOMIC);
+	if (!norm)
+		return -ENOMEM;
+
+	len = utf8_casefold(um, str, norm, PATH_MAX);
+	if (len < 0) {
+		if (f2fs_has_strict_mode(sbi))
+			ret = -EINVAL;
+		goto out;
+	}
+	str->hash = full_name_hash(dentry, norm, len);
+out:
+	kfree(norm);
+	return ret;
+}
+
+const struct dentry_operations f2fs_dentry_ops = {
+	.d_hash = f2fs_d_hash,
+	.d_compare = f2fs_d_compare,
+};
+#endif
+
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0e101f699eccd..2060613adf525 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2354,10 +2354,11 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define F2FS_INLINE_DATA_FL		0x10000000 /* Inode has inline data. */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
+#define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define F2FS_RESERVED_FL		0x80000000 /* reserved for ext4 lib */
 
-#define F2FS_FL_USER_VISIBLE		0x30CBDFFF /* User visible flags */
-#define F2FS_FL_USER_MODIFIABLE		0x204BC0FF /* User modifiable flags */
+#define F2FS_FL_USER_VISIBLE		0x70CBDFFF /* User visible flags */
+#define F2FS_FL_USER_MODIFIABLE		0x604BC0FF /* User modifiable flags */
 
 /* Flags we can manipulate with through F2FS_IOC_FSSETXATTR */
 #define F2FS_FL_XFLAG_VISIBLE		(F2FS_SYNC_FL | \
@@ -2372,10 +2373,10 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 			   F2FS_SYNC_FL | F2FS_NODUMP_FL | F2FS_NOATIME_FL |\
 			   F2FS_NOCOMPR_FL | F2FS_JOURNAL_DATA_FL |\
 			   F2FS_NOTAIL_FL | F2FS_DIRSYNC_FL |\
-			   F2FS_PROJINHERIT_FL)
+			   F2FS_PROJINHERIT_FL | F2FS_CASEFOLD_FL)
 
 /* Flags that are appropriate for regular files (all but dir-specific ones). */
-#define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL))
+#define F2FS_REG_FLMASK	(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL | F2FS_CASEFOLD_FL))
 
 /* Flags that are appropriate for non-directories/regular files. */
 #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
@@ -2936,11 +2937,16 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set);
 struct dentry *f2fs_get_parent(struct dentry *child);
 
+extern int f2fs_ci_compare(const struct inode *parent,
+			   const struct qstr *name,
+			   const struct qstr *entry);
+
 /*
  * dir.c
  */
 unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de);
-struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
+struct f2fs_dir_entry *f2fs_find_target_dentry(const struct inode *parent,
+			struct fscrypt_name *fname,
 			f2fs_hash_t namehash, int *max_slots,
 			struct f2fs_dentry_ptr *d);
 int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
@@ -3001,8 +3007,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
 /*
  * hash.c
  */
-f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
-				struct fscrypt_name *fname);
+f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
+		const struct qstr *name_info, struct fscrypt_name *fname);
 
 /*
  * node.c
@@ -3440,6 +3446,9 @@ static inline void f2fs_destroy_root_stats(void) { }
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
+#ifdef CONFIG_UNICODE
+extern const struct dentry_operations f2fs_dentry_ops;
+#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 45b45f37d347e..900018d8b0d80 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1678,7 +1678,16 @@ static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
 	flags = f2fs_mask_flags(inode->i_mode, flags);
 
 	oldflags = fi->i_flags;
+	if ((flags ^ oldflags) & F2FS_CASEFOLD_FL) {
+		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
+			return -EOPNOTSUPP;
+
+		if (!S_ISDIR(inode->i_mode))
+			return -ENOTDIR;
 
+		if (!f2fs_empty_dir(inode))
+			return -ENOTEMPTY;
+	}
 	if ((flags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
 		if (!capable(CAP_LINUX_IMMUTABLE))
 			return -EPERM;
@@ -1691,7 +1700,6 @@ static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
 	else
 		clear_inode_flag(inode, FI_PROJ_INHERIT);
-
 	inode->i_ctime = current_time(inode);
 	f2fs_set_inode_flags(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index cc82f142f811f..f5b8e02bde049 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -14,6 +14,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/cryptohash.h>
 #include <linux/pagemap.h>
+#include <linux/unicode.h>
 
 #include "f2fs.h"
 
@@ -67,7 +68,7 @@ static void str2hashbuf(const unsigned char *msg, size_t len,
 		*buf++ = pad;
 }
 
-f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
+static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 				struct fscrypt_name *fname)
 {
 	__u32 hash;
@@ -103,3 +104,34 @@ f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
 	f2fs_hash = cpu_to_le32(hash & ~F2FS_HASH_COL_BIT);
 	return f2fs_hash;
 }
+
+f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
+		const struct qstr *name_info, struct fscrypt_name *fname)
+{
+#ifdef CONFIG_UNICODE
+	const struct unicode_map *um = F2FS_SB(dir->i_sb)->s_encoding;
+	int r, dlen;
+	unsigned char *buff;
+	struct qstr *folded;
+
+	if (name_info->len && IS_CASEFOLDED(dir)) {
+		buff = kzalloc(sizeof(char) * PATH_MAX, GFP_KERNEL);
+		if (!buff)
+			return -ENOMEM;
+
+		dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
+		if (dlen < 0) {
+			kfree(buff);
+			goto opaque_seq;
+		}
+		folded->name = buff;
+		folded->len = dlen;
+		r = __f2fs_dentry_hash(folded, fname);
+
+		kfree(buff);
+		return r;
+	}
+opaque_seq:
+#endif
+	return __f2fs_dentry_hash(name_info, fname);
+}
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 58e23bf562174..9f8e54b2b3125 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -340,12 +340,12 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 		return NULL;
 	}
 
-	namehash = f2fs_dentry_hash(&name, fname);
+	namehash = f2fs_dentry_hash(dir, &name, fname);
 
 	inline_dentry = inline_data_addr(dir, ipage);
 
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
-	de = f2fs_find_target_dentry(fname, namehash, NULL, &d);
+	de = f2fs_find_target_dentry(dir, fname, namehash, NULL, &d);
 	unlock_page(ipage);
 	if (de)
 		*res_page = ipage;
@@ -602,7 +602,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 
 	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 
-	name_hash = f2fs_dentry_hash(new_name, NULL);
+	name_hash = f2fs_dentry_hash(dir, new_name, NULL);
 	f2fs_update_dentry(ino, mode, &d, new_name, name_hash, bit_pos);
 
 	set_page_dirty(ipage);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ccb02226dd2c0..280abef016c04 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -46,9 +46,11 @@ void f2fs_set_inode_flags(struct inode *inode)
 		new_fl |= S_DIRSYNC;
 	if (file_is_encrypt(inode))
 		new_fl |= S_ENCRYPTED;
+	if (flags & F2FS_CASEFOLD_FL)
+		new_fl |= S_CASEFOLD;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
-			S_ENCRYPTED);
+			S_ENCRYPTED|S_CASEFOLD);
 }
 
 static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 0f77f92427515..62470466bc4fa 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -491,6 +491,17 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out_iput;
 	}
 out_splice:
+#ifdef CONFIG_UNICODE
+	if (!inode && IS_CASEFOLDED(dir)) {
+		/* Eventually we want to call d_add_ci(dentry, NULL)
+		 * for negative dentries in the encoding case as
+		 * well.  For now, prevent the negative dentry
+		 * from being cached.
+		 */
+		trace_f2fs_lookup_end(dir, dentry, ino, err);
+		return NULL;
+	}
+#endif
 	new = d_splice_alias(inode, dentry);
 	err = PTR_ERR_OR_ZERO(new);
 	trace_f2fs_lookup_end(dir, dentry, ino, err);
@@ -539,6 +550,16 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}
 	f2fs_delete_entry(de, page, dir, inode);
+#ifdef CONFIG_UNICODE
+	/* VFS negative dentries are incompatible with Encoding and
+	 * Case-insensitiveness. Eventually we'll want avoid
+	 * invalidating the dentries here, alongside with returning the
+	 * negative dentries at f2fs_lookup(), when it is  better
+	 * supported by the VFS for the CI case.
+	 */
+	if (IS_CASEFOLDED(dir))
+		d_invalidate(dentry);
+#endif
 	f2fs_unlock_op(sbi);
 
 	if (IS_DIRSYNC(dir))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a346f5a01370b..2d58b4746b9fa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3425,6 +3425,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_node_inode;
 	}
 
+#ifdef CONFIG_UNICODE
+	if (sbi->s_encoding)
+		sb->s_d_op = &f2fs_dentry_ops;
+#endif
+
 	sb->s_root = d_make_root(root); /* allocate root dentry */
 	if (!sb->s_root) {
 		err = -ENOMEM;
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
