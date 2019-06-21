Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C14EE4C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 20:01:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heNqv-0007mp-It; Fri, 21 Jun 2019 18:01:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heNqu-0007mj-J0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 18:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IuCOCvhMf7PtM3jrx8INuIIPic0rNACtb/SiTwoluRI=; b=X0gC0Xx8AuxIRNtgWtUBWPVSKh
 wbqnws7DCR3s/ZHOSOs5xWjkGEG+KrV9cNCxwyEGoTtIi8dICX1RBKqJYD/XuPgg+/B3xXMqYZPXh
 lLuQALs/U5djNDrUei3n+2lOEYl0XNHQlH+Mr1tCoWRrNTnBbjQcTiYmtNkhMl0LGiPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IuCOCvhMf7PtM3jrx8INuIIPic0rNACtb/SiTwoluRI=; b=g
 p6HjuwA91J2aZcUJ6BOlKm6suIAsaGxZkljCw7564L7kgh+u89FQutQj4L7mItNpjUrpccLoZ5QIH
 SQ0mJu08fkHk5wapREP09wSumdj4O6OO73D4HgUzjsDD7QTPviBNV0Wwiur9qJP7utvLBZieAamTb
 k5vT3abjxivtCpJU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heNqt-0081Ln-WE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 18:01:34 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B4EA2070B;
 Fri, 21 Jun 2019 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561140086;
 bh=kk0SwYShH0N5Cjl23BV6nWVdm/thRR90X/WPRMwddZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=QPDHhuTV5Lp4adKPf7x76+t0LCtvI1RqmFPdfswkG3drnYym8M3wtlFv1OVLZNiv5
 5gft3KQUZ0ZvAkOqYBbWm6gvXN72ZtYmCWqHHDumwMCoPBfzhqbQE9JjCkXQYbCtsd
 MQpA5kBcnidNDMJR88lWU12LI2vUyLbQ/XKN/7Lg=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Jun 2019 11:01:24 -0700
Message-Id: <20190621180124.82842-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heNqt-0081Ln-WE
Subject: [f2fs-dev] [PATCH] f2fs: add wsync_mode for sysfs entry
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@google.com>

This add one sysfs entry to control REQ_SYNC/REQ_BACKGROUND for write bios
for data page writes.

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
 Documentation/filesystems/f2fs.txt      |  4 ++++
 fs/f2fs/data.c                          |  3 +--
 fs/f2fs/f2fs.h                          | 12 ++++++++++++
 fs/f2fs/sysfs.c                         |  2 ++
 5 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index dca326e0ee3e..d3eca3eb3214 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -251,3 +251,10 @@ Description:
 		If checkpoint=disable, it displays the number of blocks that are unusable.
                 If checkpoint=enable it displays the enumber of blocks that would be unusable
                 if checkpoint=disable were to be set.
+
+What:		/sys/fs/f2fs/<disk>/wsync_mode
+Date		June 2019
+Contact:	"Jaegeuk Kim" <jaegeuk.kim@kernel.org>
+Description:
+		0 gives no change. 1 assigns all the data writes with REQ_SYNC.
+                2 does REQ_BACKGROUND instead.
diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index bebd1be3ba49..81c529801a88 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -413,6 +413,10 @@ Files in /sys/fs/f2fs/<devname>
                               that would be unusable if checkpoint=disable were
                               to be set.
 
+ wsync_mode                   0 is by default. 1 gives REQ_SYNC for all the data
+                              writes. 2 gives REQ_BACKGROUND for all. This can
+                              used for the performance tuning purpose.
+
 ================================================================================
 USAGE
 ================================================================================
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4e1672bd96e..18c73a1fdef3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -9,7 +9,6 @@
 #include <linux/f2fs_fs.h>
 #include <linux/buffer_head.h>
 #include <linux/mpage.h>
-#include <linux/writeback.h>
 #include <linux/backing-dev.h>
 #include <linux/pagevec.h>
 #include <linux/blkdev.h>
@@ -2021,7 +2020,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 		.ino = inode->i_ino,
 		.type = DATA,
 		.op = REQ_OP_WRITE,
-		.op_flags = wbc_to_write_flags(wbc),
+		.op_flags = f2fs_wbc_to_write_flags(sbi, wbc),
 		.old_blkaddr = NULL_ADDR,
 		.page = page,
 		.encrypted_page = NULL,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2be2b16573c3..1cc46a6dc340 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/page-flags.h>
 #include <linux/buffer_head.h>
+#include <linux/writeback.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/magic.h>
@@ -1264,6 +1265,7 @@ struct f2fs_sb_info {
 
 	/* writeback control */
 	atomic_t wb_sync_req[META];	/* count # of WB_SYNC threads */
+	int wsync_mode;			/* write mode */
 
 	/* valid inode count */
 	struct percpu_counter total_valid_inode_count;
@@ -3631,6 +3633,16 @@ static inline void set_opt_mode(struct f2fs_sb_info *sbi, unsigned int mt)
 	}
 }
 
+static inline int f2fs_wbc_to_write_flags(struct f2fs_sb_info *sbi,
+				struct writeback_control *wbc)
+{
+	if (sbi->wsync_mode == 1)
+		return REQ_SYNC;
+	if (sbi->wsync_mode == 2)
+		return REQ_BACKGROUND;
+	return wbc_to_write_flags(wbc);
+}
+
 static inline bool f2fs_may_encrypt(struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3aeacd0aacfd..e3c164d921a1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -455,6 +455,7 @@ F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, wsync_mode, wsync_mode);
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
@@ -515,6 +516,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
+	ATTR_LIST(wsync_mode),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
