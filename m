Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E032392174
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 22:24:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lm04q-0004xN-Ev; Wed, 26 May 2021 20:24:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <joe@perches.com>) id 1lm04o-0004xC-CK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 20:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hyGtBRe+dyH6+cmiEcchQ6WGP8W0V0raP2RyW/ucRI8=; b=Kfa4bBK7YPBj91+MspTR68R8JH
 xQiM9NZ8jIn1LpHfpIBjd1qmhRl/J/qJ7Da9QtobRA3ECifcyx93p6B2JjXkxrA2PZe+RL3QrsWlQ
 gwHTw9mw/XgL34zJuJ3FYNghhQGKqyW3Dgvyfn+DGwev3wyYAnzLqAn45T2I2/txSigE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From:
 Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hyGtBRe+dyH6+cmiEcchQ6WGP8W0V0raP2RyW/ucRI8=; b=W
 v5CO5B3I6jljx9svmfl+tU9ZD2xppr6KJN3hDh1KkKJj3LcRtGZp8xVmwOMvIhTP/7P7le7yZpb0l
 WqPRa/2XPjFlwUtfh+73XXLKw/AvRVlf49cjsS7m8JMvRBFeN7L7V4VdVL3/idob5AK7wamH+aKPl
 pBEmLQ5hUWW+1750=;
Received: from smtprelay0201.hostedemail.com ([216.40.44.201]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lm04g-006umT-MM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 20:24:27 +0000
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 783DB181CA096
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 May 2021 20:05:45 +0000 (UTC)
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 6DD36837F24C;
 Wed, 26 May 2021 20:05:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 219641A29FD; 
 Wed, 26 May 2021 20:05:38 +0000 (UTC)
Message-ID: <1703a46c87dff3dbfdab008f1d268fe0b24c7db1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Wed, 26 May 2021 13:05:36 -0700
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 219641A29FD
X-Spam-Status: No, score=-2.68
X-Stat-Signature: ug7h9zepu4g4uyqgxq1puiqwraq1m35i
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18A1Rzd4sQ/htvceLOWlsdhNRXuSc3/URk=
X-HE-Tag: 1622059538-128403
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: perches.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.201 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lm04g-006umT-MM
Subject: [f2fs-dev] [PATCH] f2fs: logging neatening
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the logging uses that have unnecessary newlines as the f2fs_printk
function and so its f2fs_<level> macro callers already adds one.

This allows searching single line logging entries with an easier grep and
also avoids unnecessary blank lines in the logging.

Miscellanea:

o Coalesce formats
o Align to open parenthesis

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/f2fs/data.c    | 16 +++++++---------
 fs/f2fs/file.c    | 12 +++++-------
 fs/f2fs/gc.c      |  4 ++--
 fs/f2fs/segment.c |  2 +-
 fs/f2fs/super.c   |  4 ++--
 5 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d4795eda12fa2..37f4ab79d0148 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3833,7 +3833,7 @@ static int f2fs_is_file_aligned(struct inode *inode)
 
 		/* hole */
 		if (!(map.m_flags & F2FS_MAP_FLAGS)) {
-			f2fs_err(sbi, "Swapfile has holes\n");
+			f2fs_err(sbi, "Swapfile has holes");
 			ret = -ENOENT;
 			goto out;
 		}
@@ -3854,9 +3854,8 @@ static int f2fs_is_file_aligned(struct inode *inode)
 		cur_lblock += nr_pblocks;
 	}
 	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
+			  not_aligned);
 out:
 	return ret;
 }
@@ -3904,7 +3903,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 
 		/* hole */
 		if (!(map.m_flags & F2FS_MAP_FLAGS)) {
-			f2fs_err(sbi, "Swapfile has holes\n");
+			f2fs_err(sbi, "Swapfile has holes");
 			ret = -EINVAL;
 			goto out;
 		}
@@ -3950,9 +3949,8 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	sis->highest_bit = cur_lblock - 1;
 
 	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
+			  not_aligned);
 out:
 	return ret;
 }
@@ -4060,7 +4058,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 out:
 	return ret;
 bad_bmap:
-	f2fs_err(sbi, "Swapfile has holes\n");
+	f2fs_err(sbi, "Swapfile has holes");
 	return -EINVAL;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4714925e1974e..6afd4562335fc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3235,7 +3235,7 @@ static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
 
 	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
 		f2fs_warn(F2FS_I_SB(inode),
-			  "Can't enable fs-verity on inode %lu: the verity feature is not enabled on this filesystem.\n",
+			  "Can't enable fs-verity on inode %lu: the verity feature is not enabled on this filesystem",
 			  inode->i_ino);
 		return -EOPNOTSUPP;
 	}
@@ -4019,9 +4019,8 @@ static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
 							LLONG_MAX);
 
 	if (ret)
-		f2fs_warn(sbi, "%s: The file might be partially decompressed "
-				"(errno=%d). Please delete the file.\n",
-				__func__, ret);
+		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
+			  __func__, ret);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
@@ -4093,9 +4092,8 @@ static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
 	clear_inode_flag(inode, FI_ENABLE_COMPRESS);
 
 	if (ret)
-		f2fs_warn(sbi, "%s: The file might be partially compressed "
-				"(errno=%d). Please delete the file.\n",
-				__func__, ret);
+		f2fs_warn(sbi, "%s: The file might be partially compressed (errno=%d). Please delete the file.",
+			  __func__, ret);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index bcb3b488dbca4..ab1c0123904f5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1031,8 +1031,8 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (unlikely(check_valid_map(sbi, segno, offset))) {
 			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
-				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
-						blkaddr, source_blkaddr, segno);
+				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
+					 blkaddr, source_blkaddr, segno);
 				f2fs_bug_on(sbi, 1);
 			}
 		}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 57c3966e16ebf..5d9df24e705b3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3920,7 +3920,7 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
 	/* sanity check for summary blocks */
 	if (nats_in_cursum(nat_j) > NAT_JOURNAL_ENTRIES ||
 			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES) {
-		f2fs_err(sbi, "invalid journal entries nats %u sits %u\n",
+		f2fs_err(sbi, "invalid journal entries nats %u sits %u",
 			 nats_in_cursum(nat_j), sits_in_cursum(sit_j));
 		return -EINVAL;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 700a73e5518cb..4dedec3ab6d0f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1153,7 +1153,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	}
 
 	if (test_opt(sbi, DISABLE_CHECKPOINT) && f2fs_lfs_mode(sbi)) {
-		f2fs_err(sbi, "LFS not compatible with checkpoint=disable\n");
+		f2fs_err(sbi, "LFS not compatible with checkpoint=disable");
 		return -EINVAL;
 	}
 
@@ -3571,7 +3571,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_BLK_DEV_ZONED
 		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
 				!f2fs_sb_has_blkzoned(sbi)) {
-			f2fs_err(sbi, "Zoned block device feature not enabled\n");
+			f2fs_err(sbi, "Zoned block device feature not enabled");
 			return -EINVAL;
 		}
 		if (bdev_zoned_model(FDEV(i).bdev) != BLK_ZONED_NONE) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
