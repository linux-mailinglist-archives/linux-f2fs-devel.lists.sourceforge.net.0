Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D432B1D14F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 05:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JqECCdUM5yryysuHRHfvD+Wm9OdptFphY4hq4nm0wz8=; b=QPhOMQUQvucPJZshX27RFsX/57
	Ked29Q09x9xta6wj/JaiG4foHrrDepi4dn40EYob6gAxQ110qS7WiELRge+C87cPuuDxsTlBsrqMe
	nlJyfj1npvKcO15ALbGuGmmdPsb33uj/WwWgI6OB5JkWsqr/01yPDFoLU6uyfNnj9i0g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujrcw-0006bT-7O;
	Thu, 07 Aug 2025 03:49:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujrcv-0006bN-1d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=la+ss9Jd+F06IOEDscdwmO//BgnLOnDVxDg+CUM312w=; b=k7HJ4Ta/QNyRzSVF7AYfHB9EJc
 M1XQAJob7lPWJ6X7nYxvYUm6zj31z4QDyJHkVpqhV2pU3hqux+eSNonmN01mDU3U7aNlklDP64OZN
 HNEwNJXWtZxhrvQsWPGybC3P2v1ei3mt0Pur8UBFioJEF8Jbps9kjUkZgvgyW8kpqr/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=la+ss9Jd+F06IOEDscdwmO//BgnLOnDVxDg+CUM312w=; b=f
 9r2Wwd6SfwtnKF21fEbKExYE+XMaTTJfFu95dszKQTRmrkRqAmNdElmTeCvOmvWplog07eu0DUm7z
 PSH+C75n6ARp4gaWre3/ow8uLnd8EHb+uXhjOCS1+Nug1Q/AVkvq8GVavbnrwyC7jqM+XqAtrEyhh
 OtPhhB6V7Mjs5XSc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujrcu-00009U-ER for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16BB942BB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 03:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81997C4CEEB;
 Thu,  7 Aug 2025 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754538547;
 bh=SbpUgiLSvOk5VbTy5pMfwtfuSKiO5V83JTSvH4O/kIw=;
 h=From:To:Cc:Subject:Date:From;
 b=KJMINS3bie/RxRGwQq252u+wpXE5WZEuaTW3a7ep0vtgj80c/AEPLDttD8tfz+a22
 n5f6LX8qwn9UEarOv8JKja3Dir8eV50DLKqEvUulj3TKu2xqIwXf3h9ewTccStAJi3
 0MroHDSykUDV/84xHg6GuvMlm4vue2Vy0oMmZKU9jqs3JJVNhkoSbDmjaFWwoGHBKj
 q1x44agwYruzf6xNcf3ec82S/+r8vGM6RtGJZWeeNZWOncwDMqsukQZB1zcqOEIEtG
 k4M4s5rqi9P02SeLHFrAaaYWJ8BVzxFSxY/1QZKAcUwg5hPnrh6d3GVbZF4jJ2utMq
 rg1zFvoyYELqQ==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 11:48:38 +0800
Message-ID: <20250807034838.3829794-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new sysfs entry
 /sys/fs/f2fs/<disk>/flush_policy
 in order to tune performance of f2fs data flush flow. For example, checkpoint
 will use REQ_FUA to persist CP metadata, however, some kind device has bad
 performance on REQ_FUA command, result in that checkpoint being blocked for
 long time, w/ this sysfs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujrcu-00009U-ER
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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

This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
in order to tune performance of f2fs data flush flow.

For example, checkpoint will use REQ_FUA to persist CP metadata, however,
some kind device has bad performance on REQ_FUA command, result in that
checkpoint being blocked for long time, w/ this sysfs entry, we can give
an option to use REQ_PREFLUSH command instead of REQ_FUA during checkpoint,
it can help to mitigate long latency of checkpoint.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- export f2fs_submit_flush_wait()
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/checkpoint.c                    | 11 ++++++++++-
 fs/f2fs/f2fs.h                          |  9 +++++++++
 fs/f2fs/segment.c                       |  8 ++++----
 fs/f2fs/sysfs.c                         |  9 +++++++++
 5 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..2fedb44b713b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,12 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/flush_policy
+Date:		July 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	Device has different performance for the same flush methods, this node
+		can be used to tune performance by setting different flush methods.
+
+		policy value		description
+		0x00000001		Use preflush instead of fua during checkpoint
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index db3831f7f2f5..2450e382fe6b 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1419,7 +1419,9 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	f2fs_folio_put(folio, false);
 
 	/* submit checkpoint (with barrier if NOBARRIER is not set) */
-	f2fs_submit_merged_write(sbi, META_FLUSH);
+	f2fs_submit_merged_write(sbi,
+		sbi->flush_policy & BIT(FLUSH_POLICY_CP_NO_FUA) ?
+		META : META_FLUSH);
 }
 
 static inline u64 get_sectors_written(struct block_device *bdev)
@@ -1594,6 +1596,13 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	__set_cp_next_pack(sbi);
 
+	/* flush device cache to make sure last cp pack can be persisted */
+	if (sbi->flush_policy & BIT(FLUSH_POLICY_CP_NO_FUA)) {
+		err = f2fs_submit_flush_wait(sbi, sbi->sb->s_bdev);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * redirty superblock if metadata like node page or inode cache is
 	 * updated during writing checkpoint.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..e7b866a98c92 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1594,6 +1594,11 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
 
+enum flush_policy {
+	FLUSH_POLICY_CP_NO_FUA,
+	FLUSH_POLICY_MAX,
+};
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
@@ -1845,6 +1850,8 @@ struct f2fs_sb_info {
 	/* carve out reserved_blocks from total blocks */
 	bool carve_out;
 
+	unsigned int flush_policy;		/* flush policy */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
@@ -3821,6 +3828,8 @@ int f2fs_commit_atomic_write(struct inode *inode);
 void f2fs_abort_atomic_write(struct inode *inode, bool clean);
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need);
 void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg);
+int f2fs_submit_flush_wait(struct f2fs_sb_info *sbi,
+				struct block_device *bdev);
 int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cc82d42ef14c..d68c903f1ad3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -544,7 +544,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 	f2fs_sync_fs(sbi->sb, 1);
 }
 
-static int __submit_flush_wait(struct f2fs_sb_info *sbi,
+int f2fs_submit_flush_wait(struct f2fs_sb_info *sbi,
 				struct block_device *bdev)
 {
 	int ret = blkdev_issue_flush(bdev);
@@ -562,12 +562,12 @@ static int submit_flush_wait(struct f2fs_sb_info *sbi, nid_t ino)
 	int i;
 
 	if (!f2fs_is_multi_device(sbi))
-		return __submit_flush_wait(sbi, sbi->sb->s_bdev);
+		return f2fs_submit_flush_wait(sbi, sbi->sb->s_bdev);
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
 		if (!f2fs_is_dirty_device(sbi, ino, i, FLUSH_INO))
 			continue;
-		ret = __submit_flush_wait(sbi, FDEV(i).bdev);
+		ret = f2fs_submit_flush_wait(sbi, FDEV(i).bdev);
 		if (ret)
 			break;
 	}
@@ -748,7 +748,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 			continue;
 
 		do {
-			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
+			ret = f2fs_submit_flush_wait(sbi, FDEV(i).bdev);
 			if (ret)
 				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 		} while (ret && --count);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..b69015f1dc67 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -852,6 +852,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "flush_policy")) {
+		if (t >= BIT(FLUSH_POLICY_MAX))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
 		if (t < 1 || t > SEGS_PER_SEC(sbi))
 			return -EINVAL;
@@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
+F2FS_SBI_GENERAL_RW_ATTR(flush_policy);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1371,6 +1379,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
 	ATTR_LIST(reserved_pin_section),
+	ATTR_LIST(flush_policy),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
