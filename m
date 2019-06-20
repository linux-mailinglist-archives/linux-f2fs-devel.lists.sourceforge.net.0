Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 137954D097
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 16:42:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdyGo-0002ER-MD; Thu, 20 Jun 2019 14:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1hdyGn-0002EK-LG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCmjUw0zqa+hfqhYL5jnQtmoBlSyYyvxlgahNhH5O/E=; b=KYjTh5diIrhlu5SaxUsqeczN1R
 EbNky1k2L5CKNDx0p2nw9tSyQhvy5U3Gwhn0MyyPhXnIAtjk9Aq+FNzH0VkREnTEYi6LdxiJRViyW
 4hgqXdataaOQd/d9uAqyBr5nGq/U1/dXjykaYGmr0uOdVtbzUyQvAf3FZpd/XjsP6KrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCmjUw0zqa+hfqhYL5jnQtmoBlSyYyvxlgahNhH5O/E=; b=MyJFJkgMAQ3x097RDIHC3GpKrn
 +1QQ4fpTk7kjbfCJE9z/Fl0qAb1TZjA+F3hdGzTk9r36ur2zBxvpgAjgw6B9Uu0V42pKRnJQmteoI
 UV82SBkQNEHMUtbl0iPbj5ssqOyUI8ic1rKqu0TJY9pHqbUIDggR02d5fmo+mwE8FZzw=;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdyGm-006CAM-AH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:42:34 +0000
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 45V4KY38q1zMr8QH
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Jun 2019 16:42:25 +0200 (CEST)
Received: from ramsan ([84.194.111.163]) by michel.telenet-ops.be with bizsmtp
 id T2iG2000D3XaVaC062iGxT; Thu, 20 Jun 2019 16:42:16 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hdyGW-0000yp-2h; Thu, 20 Jun 2019 16:42:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hdyGW-0007Ko-1M; Thu, 20 Jun 2019 16:42:16 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <yuchao0@huawei.com>
Date: Thu, 20 Jun 2019 16:42:08 +0200
Message-Id: <20190620144208.28151-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hdyGm-006CAM-AH
Subject: [f2fs-dev] [PATCH] fsf2: Use DIV_ROUND_UP() instead of open-coding
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Replace the open-coded divisions with round-up by calls to the
DIV_ROUND_UP() helper macro.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 fs/f2fs/f2fs.h    | 4 ++--
 fs/f2fs/file.c    | 6 +++---
 fs/f2fs/segment.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9afe15675dbbd369..52f477eaaee93bc3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -480,8 +480,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode);
 #define NR_INLINE_DENTRY(inode)	(MAX_INLINE_DATA(inode) * BITS_PER_BYTE / \
 				((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * \
 				BITS_PER_BYTE + 1))
-#define INLINE_DENTRY_BITMAP_SIZE(inode)	((NR_INLINE_DENTRY(inode) + \
-					BITS_PER_BYTE - 1) / BITS_PER_BYTE)
+#define INLINE_DENTRY_BITMAP_SIZE(inode) \
+	DIV_ROUND_UP(NR_INLINE_DENTRY(inode), BITS_PER_BYTE)
 #define INLINE_RESERVED_SIZE(inode)	(MAX_INLINE_DATA(inode) - \
 				((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * \
 				NR_INLINE_DENTRY(inode) + \
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1180eca879331eba..fc00d8bdc31c18b0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1211,7 +1211,7 @@ static int __exchange_data_block(struct inode *src_inode,
 static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	pgoff_t nrpages = (i_size_read(inode) + PAGE_SIZE - 1) / PAGE_SIZE;
+	pgoff_t nrpages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 	pgoff_t start = offset >> PAGE_SHIFT;
 	pgoff_t end = (offset + len) >> PAGE_SHIFT;
 	int ret;
@@ -1464,7 +1464,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	pg_start = offset >> PAGE_SHIFT;
 	pg_end = (offset + len) >> PAGE_SHIFT;
 	delta = pg_end - pg_start;
-	idx = (i_size_read(inode) + PAGE_SIZE - 1) / PAGE_SIZE;
+	idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
 	/* avoid gc operation during block exchange */
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -2362,7 +2362,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	if (!fragmented)
 		goto out;
 
-	sec_num = (total + BLKS_PER_SEC(sbi) - 1) / BLKS_PER_SEC(sbi);
+	sec_num = DIV_ROUND_UP(total, BLKS_PER_SEC(sbi));
 
 	/*
 	 * make sure there are enough free section for LFS allocation, this can
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 166ac0f07a4e472d..2ae6df03b9982d12 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -109,7 +109,7 @@
 #define	START_SEGNO(segno)		\
 	(SIT_BLOCK_OFFSET(segno) * SIT_ENTRY_PER_BLOCK)
 #define SIT_BLK_CNT(sbi)			\
-	((MAIN_SEGS(sbi) + SIT_ENTRY_PER_BLOCK - 1) / SIT_ENTRY_PER_BLOCK)
+	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK)
 #define f2fs_bitmap_size(nr)			\
 	(BITS_TO_LONGS(nr) * sizeof(unsigned long))
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
