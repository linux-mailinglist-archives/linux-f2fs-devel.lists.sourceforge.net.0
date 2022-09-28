Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F32A5EE0A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 17:39:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odZ9n-0002qM-GH;
	Wed, 28 Sep 2022 15:39:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1odZ9d-0002pY-0r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 15:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QRwIeQ7mcPRQI+aSescAecqXjyqMU8bPkOBZKwhFgJk=; b=l3C04yc3snLIChBMuW+OlCYtHw
 m/KQshKPGO2tACNi5czpxCRlPTKQ+ER+1LPFsYs2cyqOXIfeHxtT5MOL29Y9Atu5VTxezokkTFJVV
 RKS4zl67r6V9r/e63eMbgSyuIo/V4lVXjYER94qWODVKo4DhujMfSY8ijURci4CeC6iI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QRwIeQ7mcPRQI+aSescAecqXjyqMU8bPkOBZKwhFgJk=; b=E
 tPT4JnaKUP3u1BVhg47qLax7kJHwU0a/iUOAfBek1fhQN1sE1SpgWdoE80aZai2+s8kjixP7VS99A
 SBYPyRcSkZyxQYc/rXTylx9h4QP7zxjL+dR7LmAsLTqD5cJNazDnP2qkH+S9eNFdV4zkXzbyfMZ9l
 0OtcdvU1/MSGfTww=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odZ9c-0003Rz-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 15:39:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBD6861EE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 15:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D03DC433D7;
 Wed, 28 Sep 2022 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664379549;
 bh=LmZFLmKf+TBz/taw6MmN/uDum8XcFIbr43HYrWvm7+k=;
 h=From:To:Cc:Subject:Date:From;
 b=ueKglqYK5O8Kova6B+K910ThMmcAyvOz+gVPpmCtEmEkaobgodLEMX/p7flwwlKJ+
 YDglBB0wAwlpgaaNa7D7hR8TeJ0TIZzjoiOS3QoO0wknb/We1FgV3MP9xPgXk/PWoZ
 w4mRxq/aAQWKxztFtskz1qRaeSuL6iFu3depi5WMjXhfGmHEmlkP7zyDmctIv81lrd
 jS0xdSdpTRrkGflDc7+zjzlqtGGIq6W6W1t1bgnoggWqlgUuxxe/fJQ3qFrGCjEZwO
 37VBPudNq93w0ItrWsb4b7rr8BwiAWHDZwww5w4J3sm07s2pB0jv/wRaFf/PvIDYeq
 ngTA4Nbvd6c9g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 28 Sep 2022 23:38:53 +0800
Message-Id: <20220928153855.4634-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to record stop_checkpoint error into
 f2fs_super_block.s_stop_reason[].
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/checkpoint.c | 10
 +++++++---
 fs/f2fs/data.c | 6 ++++-- fs/f2fs/f2fs.h | 4 +++- fs/f2fs/file.c | 11
 ++++++----- fs/f2fs/gc.c | 6 ++++-- fs/f2fs/inod [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odZ9c-0003Rz-4Z
Subject: [f2fs-dev] [PATCH 1/3] f2fs: support recording stop_checkpoint
 reason into super_block
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to record stop_checkpoint error into
f2fs_super_block.s_stop_reason[].

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c    | 10 +++++++---
 fs/f2fs/data.c          |  6 ++++--
 fs/f2fs/f2fs.h          |  4 +++-
 fs/f2fs/file.c          | 11 ++++++-----
 fs/f2fs/gc.c            |  6 ++++--
 fs/f2fs/inode.c         |  3 ++-
 fs/f2fs/segment.c       |  5 +++--
 fs/f2fs/super.c         | 20 ++++++++++++++++++++
 include/linux/f2fs_fs.h | 17 ++++++++++++++++-
 9 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 308b70812cbd..0c82dae082aa 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -26,12 +26,16 @@
 static struct kmem_cache *ino_entry_slab;
 struct kmem_cache *f2fs_inode_entry_slab;
 
-void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
+void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
+						unsigned char reason)
 {
 	f2fs_build_fault_attr(sbi, 0, 0);
 	set_ckpt_flags(sbi, CP_ERROR_FLAG);
-	if (!end_io)
+	if (!end_io) {
 		f2fs_flush_merged_writes(sbi);
+
+		f2fs_handle_stop(sbi, reason);
+	}
 }
 
 /*
@@ -122,7 +126,7 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
 		if (PTR_ERR(page) == -EIO &&
 				++count <= DEFAULT_RETRY_IO_COUNT)
 			goto retry;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_META_PAGE);
 	}
 	return page;
 }
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e5be2c1dab9..20c8d835a87b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -333,7 +333,8 @@ static void f2fs_write_end_io(struct bio *bio)
 			mempool_free(page, sbi->write_io_dummy);
 
 			if (unlikely(bio->bi_status))
-				f2fs_stop_checkpoint(sbi, true);
+				f2fs_stop_checkpoint(sbi, true,
+						STOP_CP_REASON_WRITE_FAIL);
 			continue;
 		}
 
@@ -349,7 +350,8 @@ static void f2fs_write_end_io(struct bio *bio)
 		if (unlikely(bio->bi_status)) {
 			mapping_set_error(page->mapping, -EIO);
 			if (type == F2FS_WB_CP_DATA)
-				f2fs_stop_checkpoint(sbi, true);
+				f2fs_stop_checkpoint(sbi, true,
+						STOP_CP_REASON_WRITE_FAIL);
 		}
 
 		f2fs_bug_on(sbi, page->mapping == NODE_MAPPING(sbi) &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d680a051cba4..30ddd77115e6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3559,6 +3559,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
+void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
 int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
@@ -3718,7 +3719,8 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
 /*
  * checkpoint.c
  */
-void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io);
+void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
+							unsigned char reason);
 void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2f9b387fef54..da45798d7fe5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2153,7 +2153,8 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		if (ret) {
 			if (ret == -EROFS) {
 				ret = 0;
-				f2fs_stop_checkpoint(sbi, false);
+				f2fs_stop_checkpoint(sbi, false,
+						STOP_CP_REASON_SHUTDOWN);
 				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 				trace_f2fs_shutdown(sbi, in, ret);
 			}
@@ -2166,7 +2167,7 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		ret = freeze_bdev(sb->s_bdev);
 		if (ret)
 			goto out;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		thaw_bdev(sb->s_bdev);
 		break;
@@ -2175,16 +2176,16 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		ret = f2fs_sync_fs(sb, 1);
 		if (ret)
 			goto out;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NOSYNC:
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_METAFLUSH:
 		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NEED_FSCK:
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3a820e5cdaee..6e42dad0ac2d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -74,7 +74,8 @@ static int gc_thread_func(void *data)
 
 		if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
 			f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_FAULT_INJECT);
 		}
 
 		if (!sb_start_write_trylock(sbi->sb)) {
@@ -1712,7 +1713,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
 				 segno, type, GET_SUM_TYPE((&sum->footer)));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+				STOP_CP_REASON_CORRUPTED_SUMMARY);
 			goto skip;
 		}
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index f6cb8b78b5d5..7880596b51ee 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -716,7 +716,8 @@ void f2fs_update_inode_page(struct inode *inode)
 			cond_resched();
 			goto retry;
 		} else if (err != -ENOENT) {
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_UPDATE_INODE);
 		}
 		return;
 	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e35be4116767..4ed84510f195 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -390,7 +390,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
 	if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
 		f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
 	}
 
 	/* balance_fs_bg is able to be pending */
@@ -708,7 +708,8 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 		} while (ret && --count);
 
 		if (ret) {
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_FLUSH_FAIL);
 			break;
 		}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b8e5fe244596..2533d309a924 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3846,6 +3846,26 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	return err;
 }
 
+void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
+{
+	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
+	int err;
+
+	f2fs_bug_on(sbi, reason >= MAX_STOP_REASON);
+
+	f2fs_down_write(&sbi->sb_lock);
+
+	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
+		raw_super->s_stop_reason[reason]++;
+
+	err = f2fs_commit_super(sbi, false);
+	if (err)
+		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
+								reason, err);
+
+	f2fs_up_write(&sbi->sb_lock);
+}
+
 static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index d445150c5350..5dd1e52b8997 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -73,6 +73,20 @@ struct f2fs_device {
 	__le32 total_segments;
 } __packed;
 
+/* reason of stop_checkpoint */
+enum stop_cp_reason {
+	STOP_CP_REASON_SHUTDOWN,
+	STOP_CP_REASON_FAULT_INJECT,
+	STOP_CP_REASON_META_PAGE,
+	STOP_CP_REASON_WRITE_FAIL,
+	STOP_CP_REASON_CORRUPTED_SUMMARY,
+	STOP_CP_REASON_UPDATE_INODE,
+	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_MAX,
+};
+
+#define	MAX_STOP_REASON			32
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -116,7 +130,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
+	__u8 reserved[274];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
