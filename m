Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513688A672
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Mar 2024 16:27:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1romEi-0000bz-PS;
	Mon, 25 Mar 2024 15:27:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1romEh-0000bq-LF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5Pe9GVXVwxZzSpSsIvwg3FStmuOFfFebPRoALQnWTw=; b=RfXV3pXUN9K43tIP4zSKnPKacM
 8r0d8RYllW9zztDBENVVyqM9wbkvxFNMwIkL8uy+tFt65VQbeBc11qxF6YBUT4A9+fyOB7Eoq3mK3
 FvdYXs96By24EBnYQyZcp1hQifIaEBsljdIKCQpyq5L8Y9rUQLqioL97TsKEl1hUwwY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+5Pe9GVXVwxZzSpSsIvwg3FStmuOFfFebPRoALQnWTw=; b=S
 NZYNWqorh5raS2+eKnVDujClOqf9Hr+TA3df45za69phQOj0i7foqkipks5P42GhKnSzc3QAO5+0W
 6wqxM/tvEkopaR7e9SfcujWMNMJ5hZxCecP5Ixwl2BsSs3k4wUki29BLaKIxRiHZ/TyR8jeVMbWDw
 2DpmntjtxxYCYLFU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1romEf-0006V2-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E55A561041
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Mar 2024 15:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30A5C433C7;
 Mon, 25 Mar 2024 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711380456;
 bh=bYZG5pNg1OWqiulIpBARahqIyHHQkI5zrD80VoIQK0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=GBjHiojbSc3MWX4fAZuZ2TnKpEkMthvhxaoCec4169pTA63MnK8Wl6PIBiPALq0t9
 ziS1E8AxNvudgpkOGpY7VIO+OHKo3lWjqjVt/q1nH7906H8RzWD0F1Pk+zUtaxSznw
 Me180qDYEg1eSICiOC261/dfJGqmGpEM2gdScfa+69N2QGDFT9oWqYepausBiUDo0s
 3a72LRom7rt5dDMYFMOjSSWX+yXdi0w4tZB/eKkZCmjb0EiKYHQ4mawf9XmkeuEJkv
 yUuHVXIy8X3JAjBvia+glNKr2QGk4eUlt1DWBVaQ/jXszZ+MdnQ5zUihwTdkuGErsI
 VnbLu+QYGXVOw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 25 Mar 2024 23:27:25 +0800
Message-Id: <20240325152726.797423-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 24 ++++++++++++++++++------ 1 file changed,
 18 insertions(+), 
 6 deletions(-) diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index
 5ef1874b572a..9c000ca4f808
 100644 --- a/fs/f2fs/data.c +++ b/fs/f2fs/data.c @@ -1507, 6 +1507,
 23 @@ static bool f2fs_map_blocks_cached(struct inode *i [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1romEf-0006V2-W2
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce map_is_mergeable() for
 cleanup
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

No logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5ef1874b572a..9c000ca4f808 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1507,6 +1507,23 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
 	return true;
 }
 
+static bool map_is_mergeable(struct f2fs_sb_info *sbi,
+				struct f2fs_map_blocks *map,
+				block_t blkaddr, int flag, int bidx,
+				int ofs)
+{
+	if (map->m_multidev_dio && map->m_bdev != FDEV(bidx).bdev)
+		return false;
+	if (map->m_pblk != NEW_ADDR &&
+		blkaddr == (map->m_pblk + ofs))
+		return true;
+	if (map->m_pblk == NEW_ADDR && blkaddr == NEW_ADDR)
+		return true;
+	if (flag == F2FS_GET_BLOCK_PRE_DIO)
+		return true;
+	return false;
+}
+
 /*
  * f2fs_map_blocks() tries to find or build mapping relationship which
  * maps continuous logical blocks to physical blocks, and return such
@@ -1653,12 +1670,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 		if (map->m_multidev_dio)
 			map->m_bdev = FDEV(bidx).bdev;
-	} else if ((map->m_pblk != NEW_ADDR &&
-			blkaddr == (map->m_pblk + ofs)) ||
-			(map->m_pblk == NEW_ADDR && blkaddr == NEW_ADDR) ||
-			flag == F2FS_GET_BLOCK_PRE_DIO) {
-		if (map->m_multidev_dio && map->m_bdev != FDEV(bidx).bdev)
-			goto sync_out;
+	} else if (map_is_mergeable(sbi, map, blkaddr, flag, bidx, ofs)) {
 		ofs++;
 		map->m_len++;
 	} else {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
