Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096997EE8F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2024 17:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sslOA-0004rl-KM;
	Mon, 23 Sep 2024 15:54:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sslO4-0004ra-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Sep 2024 15:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49B74kpQFpo2UuC/pBQrzpV3QfmwxJSvQ9mPhLybumA=; b=GE/Gtfp2tsvAW1OJuYu3hRS5WE
 wOvPsxgIwBA/xHz49o7WocROqv+dSEzbxCilxhGksyheXzDvrWcvVum8UGVL+1Sor7jYsOS+exsMW
 R60JEyFVHjzhsgC5T8eHynGUAfWSyGg51ju4mjooTyuX3nDYxfE6Qzg+IFW6m1ZP+OWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=49B74kpQFpo2UuC/pBQrzpV3QfmwxJSvQ9mPhLybumA=; b=e
 0UIMm3U+IBDgYW4vZ7XTEb3osNoLExsSkM3UgXY9qjdqXlBjhQCmxPHnGBNuv0ueO9HQEjY6GLJ6H
 G76+zrXt6cICziHmLwGpnuvklal6WkCcdZsJ/nakmLXX1rBRvE6iJKTfOXtq4Tai/+i+rKed8SEU1
 PHk2q7Zvp2uQcu5w=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sslO3-0008Up-55 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Sep 2024 15:54:08 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7191df6b5f5so2779655b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Sep 2024 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727106841; x=1727711641; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=49B74kpQFpo2UuC/pBQrzpV3QfmwxJSvQ9mPhLybumA=;
 b=Lhg3xMs7FLkideKcuX89ku0PosNaWFozDq7Jad6FUPJo5rsSS6xCvj/ozIh5Z3FzJ5
 AA+z4Nqgk6uWfjsDw6zpysr7xWpB/SNndg7iTIBg0K26jTNb48aesjY8BothEz9kEzz2
 lxdqGneJxBniPZgjWRC5sgGbhFBH7N6WsPLzAoQYEVLlLCN1J/UkDm+Sic1WBxff34Se
 KanXqG3+y+znpIA8go2eCpSiGSeZayqOAvIkw5Lbk/U8Vc4frz5dVyfoTWWjuEYHvic7
 O4HHxnxkzYHk+F2qxh8sM/ZX626jpIhOpkQD3NEuIVoIOzobEIQx1N1fqERr/RtWw1Xh
 1BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727106841; x=1727711641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49B74kpQFpo2UuC/pBQrzpV3QfmwxJSvQ9mPhLybumA=;
 b=mzSZZmCw3gSNqEefT+5tM+qOLDm266qzIVQEJ4IVPB5xGJMvgGLewB0J9f0SQLhb2O
 v0VHQ5SmQPF2DMpVPNIv7WcHVBOi0F8tsaTHaVicSXKjC97UFNFBpevVOy5sVp4jpXy5
 acG7h69waYAqGS4bdLbjaYAn2mSVJkMsLXbCalY6UZOFCFEIWQcHiTeRFr6gPC9l9sDv
 hrLkxTcsNCiudsgukVCbhhlt5CLkt8ZyzG9xI9xQ8VzRBfvhcKESrofU4xBpsgMvNwIK
 L6v/MODS4rWcR+0ADnsg1lBgtCNc/IB/0XNKnWR77kNjW8xHb7MuxxB2iXJrYRWHvLJP
 944w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV16C11eiPoEZaq2ek482C+ba6e2yyAwvxKXobo4+Sb/QCY12g1C7MNrZGnRCf4kAOlj2jPjzbXJgu0N/amoqkh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwHAvsNHLwwU4PAF8VObRkd5Wv1DpQpJemMJ9VKSeIHOGHPR1oV
 FYnWsI4+OMc2pbCwU9eiPxDBmuwWH3/UjkVQ1+quOc5eHGhkhOiakTx3xg==
X-Google-Smtp-Source: AGHT+IHWpr+8mWBiOCiwc9VGQ/z9m3DLX+m+6ZilXJI84mJyaaTfKE3EBYKwUugnlpePyKh+GHSY2Q==
X-Received: by 2002:a05:6a00:1784:b0:70e:91ca:32ab with SMTP id
 d2e1a72fcca58-7199cd7abd5mr20310539b3a.6.1727106841131; 
 Mon, 23 Sep 2024 08:54:01 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:af06:d716:c2d4:2ffb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944aba55fsm14009280b3a.80.2024.09.23.08.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 08:54:00 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 23 Sep 2024 08:53:56 -0700
Message-ID: <20240923155356.2313669-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sslO3-0008Up-55
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce device aliasing file
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
---
v2: changed the position of f2fs_destroy_extent_tree() only for device
    aliasing files
---
 fs/f2fs/data.c         |  5 +++++
 fs/f2fs/extent_cache.c | 10 ++++++++++
 fs/f2fs/f2fs.h         |  5 +++++
 fs/f2fs/file.c         | 36 ++++++++++++++++++++++++++++++++----
 fs/f2fs/inode.c        | 12 +++++++++++-
 fs/f2fs/sysfs.c        |  2 ++
 6 files changed, 65 insertions(+), 5 deletions(-)

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
index 62ac440d9416..0c8a705faa8b 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -401,6 +401,11 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
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
@@ -463,6 +468,11 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
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
index 99903eafa7fe..f2d2d84d025b 100644
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
@@ -4764,7 +4791,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	else
 		return 0;
 
-	map.m_may_create = true;
+	if (!IS_DEVICE_ALIASING(inode))
+		map.m_may_create = true;
 	if (dio) {
 		map.m_seg_type = f2fs_rw_hint_to_seg_type(sbi,
 						inode->i_write_hint);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..25f66a0ed831 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if ((fi->i_flags & F2FS_DEVICE_ALIAS_FL) && !f2fs_sb_has_device_alias(sbi)) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but the feature is off",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
@@ -823,7 +829,8 @@ void f2fs_evict_inode(struct inode *inode)
 	f2fs_bug_on(sbi, get_dirty_pages(inode));
 	f2fs_remove_dirty_inode(inode);
 
-	f2fs_destroy_extent_tree(inode);
+	if (!IS_DEVICE_ALIASING(inode))
+		f2fs_destroy_extent_tree(inode);
 
 	if (inode->i_nlink || is_bad_inode(inode))
 		goto no_delete;
@@ -879,6 +886,9 @@ void f2fs_evict_inode(struct inode *inode)
 		goto retry;
 	}
 
+	if (IS_DEVICE_ALIASING(inode))
+		f2fs_destroy_extent_tree(inode);
+
 	if (err) {
 		f2fs_update_inode_page(inode);
 		if (dquot_initialize_needed(inode))
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
-- 
2.46.0.792.g87dc391469-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
