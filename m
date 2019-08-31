Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27DA43D5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2019 11:54:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i405O-0007hD-JN; Sat, 31 Aug 2019 09:54:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i405M-0007gX-WB
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 09:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8YKC6iaayecafkPjQNtkQwYqsu1G0MNUenaft6l9Qc=; b=b7d4ThvF819lwToyuSy/GxlRMF
 +lxM3BDxClYhWoWuyuT3dflRhF673gTmFhwacRkAEdTAojLqSkDKheEM8lYGLluV6j3k168INTCm6
 WCxnn5LXWC72/KCBms13DZQ6uL7fGl4IAeMaUz3pubNHaGA+Tp3oSkug8HY4/4Rok67o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f8YKC6iaayecafkPjQNtkQwYqsu1G0MNUenaft6l9Qc=; b=c
 Zlko+e4mWwrvgGenis0mlEZsvVX7rNb9snMAOpzHPMfpwm1f7EDSoNvhYlLQikNGPyapxseHXr9vP
 6dNAErtpvYcTcG8AUFwqRm2mziwPJQA5Cgw1iSg0i80WRcOpi2b4MGD5H5ttHoAMaXifT98jTy585
 RohWEwEwoPjoBzZE=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i405L-00AMCl-2R
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 09:54:20 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 330BE740C11891972CF3;
 Sat, 31 Aug 2019 17:54:12 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Sat, 31 Aug 2019 17:54:05 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 31 Aug 2019 17:54:00 +0800
Message-ID: <20190831095401.8142-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i405L-00AMCl-2R
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: introduce
 get_available_block_count() for cleanup
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

There are very similar codes in inc_valid_block_count() and
inc_valid_node_count() which is used for available user block
count calculation.

This patch introduces a new helper get_available_block_count()
to include those common codes, and used it instead for cleanup.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix panic during recovery
 fs/f2fs/f2fs.h | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a89ad8cab821..9c010e6cba5c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1756,6 +1756,27 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
 	return false;
 }
 
+static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
+						struct inode *inode, bool cap)
+{
+	block_t avail_user_block_count;
+
+	avail_user_block_count = sbi->user_block_count -
+					sbi->current_reserved_blocks;
+
+	if (!__allow_reserved_blocks(sbi, inode, cap))
+		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
+
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (avail_user_block_count > sbi->unusable_block_count)
+			avail_user_block_count -= sbi->unusable_block_count;
+		else
+			avail_user_block_count = 0;
+	}
+
+	return avail_user_block_count;
+}
+
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count)
@@ -1782,17 +1803,8 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 	sbi->total_valid_block_count += (block_t)(*count);
-	avail_user_block_count = sbi->user_block_count -
-					sbi->current_reserved_blocks;
+	avail_user_block_count = get_available_block_count(sbi, inode, true);
 
-	if (!__allow_reserved_blocks(sbi, inode, true))
-		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-		if (avail_user_block_count > sbi->unusable_block_count)
-			avail_user_block_count -= sbi->unusable_block_count;
-		else
-			avail_user_block_count = 0;
-	}
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
 		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
@@ -2005,7 +2017,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count, user_block_count;
+	unsigned int valid_node_count;
+	unsigned int avail_user_block_count;
 	int err;
 
 	if (is_inode) {
@@ -2027,16 +2040,10 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 
-	valid_block_count = sbi->total_valid_block_count +
-					sbi->current_reserved_blocks + 1;
-
-	if (!__allow_reserved_blocks(sbi, inode, false))
-		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
-	user_block_count = sbi->user_block_count;
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		user_block_count -= sbi->unusable_block_count;
+	valid_block_count = sbi->total_valid_block_count + 1;
+	avail_user_block_count = get_available_block_count(sbi, inode, false);
 
-	if (unlikely(valid_block_count > user_block_count)) {
+	if (unlikely(valid_block_count > avail_user_block_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
