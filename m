Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D31999245
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 21:26:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syyo9-00072K-Cg;
	Thu, 10 Oct 2024 19:26:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1syyo7-00072C-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 19:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XTg/FxnMOuXyYVOtivpweihctMP4/bOEkn6tW4HRGpY=; b=c9NjrCoDf1qwHth0pYnqHkj7XS
 14vFmwZOLfx4e0Zp5jKq4LT9vyrctVetDFZ1aHQDsRFFiIcl1xVneYXlczB7BDBLhRIb7z8R5/WMA
 uB//2WQOCK4u+v7mBYV4zCGyqZ/JK36GfCBVAri6yryGa5Xevx7c0ak+V/h4nYLKa3G4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XTg/FxnMOuXyYVOtivpweihctMP4/bOEkn6tW4HRGpY=; b=F
 gpg+tWmGvjUCwTS7jL+MhF3xartKVCVcQyFrS48sEs+bfg0WnYscdhNPG2Zu6xESTF163ufb2P4kv
 +jwtCfW+gr7EcmJz02X5WIY5K8mE5K3Z3gf29N+QuqtOklUYAAvVhSbqbWgaoQoGxJeW/gfXkSADS
 ETeP9tKTZrpvaisg=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1syyo6-0002cO-2i for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 19:26:43 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20c544d34bcso12319165ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728588391; x=1729193191; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XTg/FxnMOuXyYVOtivpweihctMP4/bOEkn6tW4HRGpY=;
 b=ev/LfInx3oc9rxUcMwHD/UpKqbyD70TSOu7KYPml4OJ5jJwqtZnDJDo2Ml5m6OIda/
 F8M3EaimAQmYDv0et3yWSAz4HggP0+sngB6rTKXe4p7HEFcG6DD7HhNJvGv0ClZ8cMQs
 0cQ7VedWXF+yWnMujFLgTkLJ23+sqNjLhXX24NRXCx/OjQgdJ/xlxLs0P6KSKFZqlT3W
 KKhS77jW2kMqWZcE0HVgUn+KPiCA5Xhey9+QpgsK5d8iOV8uXURtxw7oOJnsBMHYt4mN
 Xnglc671YC0gkevtfVR9vorlMZhpxezyJJwaAp3Yj/j2jdCHHgTtrT7NVJOcS61yuG5U
 5MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728588391; x=1729193191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XTg/FxnMOuXyYVOtivpweihctMP4/bOEkn6tW4HRGpY=;
 b=PoWCrNfDDD5vjoifkUZylQ+ewZgdNgE/LsdlPVWwNTHKU1+gYjaQtD5m4YEUvaC4rT
 KufdiwDcW5aBxIxHEqwg+h9wyUzwRtW8ZgoD9gZ0499DsqFxa61Yh6HpZCkSmt4h07Q9
 htH9hdxKEaOcsR6sZl94Gc0h/uqL3QLHT5YSxmZ06FzYWSunKpC5m9pqeG3baB2M7zfq
 X2vgt6SYneErhgk/U75hqOOKVyHkxd4edsiVQYnX3Z0BKl7ic7OX1C3s8SxDDLTR/HEA
 AnJGFQs2pcyVAF1gWG2OHyfRTwUJJuaqIuBsT1uKZM2Y6pT0xJMnjAVLc/GbHqTBcbgu
 TVgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn8hMy1Wpm5PU8Z1fQWmTAlWQtGY+ZAvHV9x2DmEpatVin5NP53ZLcriQQ/o3zubV5C/n1xXrmzjnntxj66UQC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyhnXht7qp1sYqhI2YGmv/xmO2F9SFOT1tgRlFe3OSzKujSQuuj
 nBFwPz2+s8J6JUj204vw6JmWWArfhq4TU6Vlu7EjJXjlMRE0MRrc
X-Google-Smtp-Source: AGHT+IEwL2Hkw0Mjts0Qt+M4jUsiUB3klaAxEDtnWBczKTw+AT+tqFELH5xxsuf+uGpRf6CCIFxRUw==
X-Received: by 2002:a17:903:2302:b0:1fb:90e1:c8c5 with SMTP id
 d9443c01a7336-20c6374838fmr112208695ad.33.1728588391291; 
 Thu, 10 Oct 2024 12:26:31 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:7a57:7c49:3cfe:4dec])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8c33e448sm12630815ad.246.2024.10.10.12.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 12:26:30 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 10 Oct 2024 12:26:26 -0700
Message-ID: <20241010192626.1597226-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong F2FS should understand how the device
 aliasing
 file works and support deleting the file after use. A device aliasing file
 can be created by mkfs.f2fs tool and it can map the whole device with an
 extre [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1syyo6-0002cO-2i
Subject: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

F2FS should understand how the device aliasing file works and support
deleting the file after use. A device aliasing file can be created by
mkfs.f2fs tool and it can map the whole device with an extrent, not
using node blocks. The file space should be pinned and normally used for
read-only usages.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v5: added a ioctl to know whether a file is for device aliasing
v4: added file pinning check in sanity check
v3: merged Chao's extent cache sanity check.
    prevented device aliasing support with noextent mount option
v2: changed the position of f2fs_destroy_extent_tree() only for device
    aliasing files
---
 fs/f2fs/data.c            |  5 +++++
 fs/f2fs/extent_cache.c    | 45 ++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h            |  5 +++++
 fs/f2fs/file.c            | 44 ++++++++++++++++++++++++++++++++++----
 fs/f2fs/inode.c           | 19 ++++++++++++++++-
 fs/f2fs/super.c           |  4 ++++
 fs/f2fs/sysfs.c           |  2 ++
 include/uapi/linux/f2fs.h |  1 +
 8 files changed, 119 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b94cf6eea2f9..385b46e62ede 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3441,6 +3441,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
+		if (IS_DEVICE_ALIASING(inode)) {
+			err = -ENODATA;
+			goto out;
+		}
+
 		if (locked) {
 			err = f2fs_reserve_block(&dn, index);
 			goto out;
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 62ac440d9416..019c1f7b7fa5 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -24,6 +24,7 @@ bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
 	struct extent_info ei;
+	int devi;
 
 	get_read_extent_info(&ei, i_ext);
 
@@ -38,7 +39,36 @@ bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
 			  ei.blk, ei.fofs, ei.len);
 		return false;
 	}
-	return true;
+
+	if (!IS_DEVICE_ALIASING(inode))
+		return true;
+
+	for (devi = 0; devi < sbi->s_ndevs; devi++) {
+		if (FDEV(devi).start_blk != ei.blk ||
+				FDEV(devi).end_blk != ei.blk + ei.len - 1)
+			continue;
+
+		if (devi == 0) {
+			f2fs_warn(sbi,
+			    "%s: inode (ino=%lx) is an alias of meta device",
+			    __func__, inode->i_ino);
+			return false;
+		}
+
+		if (bdev_is_zoned(FDEV(devi).bdev)) {
+			f2fs_warn(sbi,
+			    "%s: device alias inode (ino=%lx)'s extent info "
+			    "[%u, %u, %u] maps to zoned block device",
+			    __func__, inode->i_ino, ei.blk, ei.fofs, ei.len);
+			return false;
+		}
+		return true;
+	}
+
+	f2fs_warn(sbi, "%s: device alias inode (ino=%lx)'s extent info "
+			"[%u, %u, %u] is inconsistent w/ any devices",
+			__func__, inode->i_ino, ei.blk, ei.fofs, ei.len);
+	return false;
 }
 
 static void __set_extent_info(struct extent_info *ei,
@@ -76,6 +106,9 @@ static bool __init_may_extent_tree(struct inode *inode, enum extent_type type)
 
 static bool __may_extent_tree(struct inode *inode, enum extent_type type)
 {
+	if (IS_DEVICE_ALIASING(inode) && type == EX_READ)
+		return true;
+
 	/*
 	 * for recovered files during mount do not create extents
 	 * if shrinker is not registered.
@@ -401,6 +434,11 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 	if (atomic_read(&et->node_cnt) || !ei.len)
 		goto skip;
 
+	if (IS_DEVICE_ALIASING(inode)) {
+		et->largest = ei;
+		goto skip;
+	}
+
 	en = __attach_extent_node(sbi, et, &ei, NULL,
 				&et->root.rb_root.rb_node, true);
 	if (en) {
@@ -463,6 +501,11 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
 		goto out;
 	}
 
+	if (IS_DEVICE_ALIASING(inode)) {
+		ret = false;
+		goto out;
+	}
+
 	en = __lookup_extent_node(&et->root, et->cached_en, pgofs);
 	if (!en)
 		goto out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33f5449dc22d..b6ba22a1da47 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -213,6 +213,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_CASEFOLD			0x00001000
 #define F2FS_FEATURE_COMPRESSION		0x00002000
 #define F2FS_FEATURE_RO				0x00004000
+#define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -3046,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
+#define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
 
 #define F2FS_QUOTA_DEFAULT_FL		(F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL)
 
@@ -3061,6 +3063,8 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 /* Flags that are appropriate for non-directories/regular files. */
 #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
 
+#define IS_DEVICE_ALIASING(inode)	(F2FS_I(inode)->i_flags & F2FS_DEVICE_ALIAS_FL)
+
 static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
 {
 	if (S_ISDIR(mode))
@@ -4510,6 +4514,7 @@ F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
 F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
+F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 99903eafa7fe..6363d23221b2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -725,6 +725,11 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 
 	trace_f2fs_truncate_blocks_enter(inode, from);
 
+	if (IS_DEVICE_ALIASING(inode) && from) {
+		err = -EINVAL;
+		goto out_err;
+	}
+
 	free_from = (pgoff_t)F2FS_BLK_ALIGN(from);
 
 	if (free_from >= max_file_blocks(inode))
@@ -739,6 +744,21 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
+	if (IS_DEVICE_ALIASING(inode)) {
+		struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
+		struct extent_info ei = et->largest;
+		unsigned int i;
+
+		for (i = 0; i < ei.len; i++)
+			f2fs_invalidate_blocks(sbi, ei.blk + i);
+
+		dec_valid_block_count(sbi, inode, ei.len);
+		f2fs_update_time(sbi, REQ_TIME);
+
+		f2fs_put_page(ipage, 1);
+		goto out;
+	}
+
 	if (f2fs_has_inline_data(inode)) {
 		f2fs_truncate_inline_inode(inode, ipage, from);
 		f2fs_put_page(ipage, 1);
@@ -774,7 +794,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	/* lastly zero out the first data page */
 	if (!err)
 		err = truncate_partial_data_page(inode, from, truncate_page);
-
+out_err:
 	trace_f2fs_truncate_blocks_exit(inode, err);
 	return err;
 }
@@ -992,7 +1012,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
-		if (!f2fs_is_compress_backend_ready(inode))
+		if (!f2fs_is_compress_backend_ready(inode) ||
+				IS_DEVICE_ALIASING(inode))
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
@@ -1860,7 +1881,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 		return -EIO;
 	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
 		return -ENOSPC;
-	if (!f2fs_is_compress_backend_ready(inode))
+	if (!f2fs_is_compress_backend_ready(inode) || IS_DEVICE_ALIASING(inode))
 		return -EOPNOTSUPP;
 
 	/* f2fs only support ->fallocate for regular file */
@@ -3296,6 +3317,9 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
+	if (IS_DEVICE_ALIASING(inode))
+		return -EINVAL;
+
 	if (fi->i_gc_failures >= sbi->gc_pin_file_threshold) {
 		f2fs_warn(sbi, "%s: Enable GC = ino %lx after %x GC trials",
 			  __func__, inode->i_ino, fi->i_gc_failures);
@@ -3326,6 +3350,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (!pin && IS_DEVICE_ALIASING(inode))
+		return -EOPNOTSUPP;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
@@ -3391,6 +3418,12 @@ static int f2fs_ioc_get_pin_file(struct file *filp, unsigned long arg)
 	return put_user(pin, (u32 __user *)arg);
 }
 
+static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
+{
+	return put_user(IS_DEVICE_ALIASING(file_inode(filp)) ? 1 : 0,
+			(u32 __user *)arg);
+}
+
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -4490,6 +4523,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_decompress_file(filp);
 	case F2FS_IOC_COMPRESS_FILE:
 		return f2fs_ioc_compress_file(filp);
+	case F2FS_IOC_GET_DEV_ALIAS_FILE:
+		return f2fs_ioc_get_dev_alias_file(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4764,7 +4799,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	else
 		return 0;
 
-	map.m_may_create = true;
+	if (!IS_DEVICE_ALIASING(inode))
+		map.m_may_create = true;
 	if (dio) {
 		map.m_seg_type = f2fs_rw_hint_to_seg_type(sbi,
 						inode->i_write_hint);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..194dc0f53ad8 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,19 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if (IS_DEVICE_ALIASING(inode)) {
+		if (!f2fs_sb_has_device_alias(sbi)) {
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but the feature is off",
+				  __func__, inode->i_ino);
+			return false;
+		}
+		if (!f2fs_is_pinned_file(inode)) {
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but is not pinned",
+				  __func__, inode->i_ino);
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -823,7 +836,8 @@ void f2fs_evict_inode(struct inode *inode)
 	f2fs_bug_on(sbi, get_dirty_pages(inode));
 	f2fs_remove_dirty_inode(inode);
 
-	f2fs_destroy_extent_tree(inode);
+	if (!IS_DEVICE_ALIASING(inode))
+		f2fs_destroy_extent_tree(inode);
 
 	if (inode->i_nlink || is_bad_inode(inode))
 		goto no_delete;
@@ -879,6 +893,9 @@ void f2fs_evict_inode(struct inode *inode)
 		goto retry;
 	}
 
+	if (IS_DEVICE_ALIASING(inode))
+		f2fs_destroy_extent_tree(inode);
+
 	if (err) {
 		f2fs_update_inode_page(inode);
 		if (dquot_initialize_needed(inode))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc2c586c7619..95097498b544 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -834,6 +834,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, READ_EXTENT_CACHE);
 			break;
 		case Opt_noextent_cache:
+			if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_DEVICE_ALIAS)) {
+				f2fs_err(sbi, "device aliasing requires extent cache");
+				return -EINVAL;
+			}
 			clear_opt(sbi, READ_EXTENT_CACHE);
 			break;
 		case Opt_noinline_data:
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c56e8c873935..e51304bc65ea 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1313,6 +1313,7 @@ F2FS_SB_FEATURE_RO_ATTR(sb_checksum, SB_CHKSUM);
 F2FS_SB_FEATURE_RO_ATTR(casefold, CASEFOLD);
 F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
 F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
+F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
 
 static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_encryption),
@@ -1329,6 +1330,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_casefold),
 	ATTR_LIST(sb_compression),
 	ATTR_LIST(sb_readonly),
+	ATTR_LIST(sb_device_alias),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be104..f7aaf8d23e20 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -43,6 +43,7 @@
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.47.0.rc1.288.g06298d1525-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
