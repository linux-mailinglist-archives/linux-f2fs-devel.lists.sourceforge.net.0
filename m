Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5039B6028
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t65zu-0001kk-PH;
	Wed, 30 Oct 2024 10:32:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t65zr-0001kd-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hbCTiqgbC1DIBU4qzU/llGrs7QlAA+1MOYHeRIZA/xY=; b=OaWCRCHlNkSKUj/Fi+5ik77VKn
 ypizsq5HIREUijhpAqYzxRAtziYV44XCpkV1j5wOJPPuqeBK2fVb16O2UljLtWepI5lhfIHVfW9Yx
 RnKYcOyGa76ZaG9BztxleV3cmdUXX2p+vMIGr76yD5t1s7P5W07GjWKrnyBhZuQdp1Ig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hbCTiqgbC1DIBU4qzU/llGrs7QlAA+1MOYHeRIZA/xY=; b=jOfXSW2PGxCPJ9BI+mfbznf7Y6
 XVEqy+6pDxU/BAoTtjd+XVkdF+qVUOWjc5Cg0kQM4eDkBeqTAbAgubVGnQbTn5zWRJf2UQ9icPII8
 2lln+vAlGKZsq/zuYg3+rQxCdDWSru7AQQppwVcNXTkg5SCWnhBsEA67MvesuWOvi3Q4=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t65zp-0002Dx-1n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:14 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49UAVhEW026848;
 Wed, 30 Oct 2024 18:31:43 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xdk1P5JHRz2KSK4X;
 Wed, 30 Oct 2024 18:31:05 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 30 Oct 2024 18:31:41 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 30 Oct 2024 18:31:34 +0800
Message-ID: <20241030103136.2874140-4-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030103136.2874140-1-yi.sun@unisoc.com>
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49UAVhEW026848
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: New function can process some consecutive blocks at a time.
 Signed-off-by: Yi Sun <yi.sun@unisoc.com> --- fs/f2fs/data.c | 2 +-
 fs/f2fs/f2fs.h
 | 6 +++--- fs/f2fs/gc.c | 2 +- fs/f2fs/segment.c | 6 +++--- 4 files changed,
 8 insertions(+), 8 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t65zp-0002Dx-1n
Subject: [f2fs-dev] [PATCH v2 3/5] f2fs: add parameter @len to
 f2fs_invalidate_internal_cache()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

New function can process some consecutive blocks at a time.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/f2fs.h    | 6 +++---
 fs/f2fs/gc.c      | 2 +-
 fs/f2fs/segment.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 90fa8ab85194..37bc747aac89 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1420,7 +1420,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 		return err;
 
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
-		f2fs_invalidate_internal_cache(sbi, old_blkaddr);
+		f2fs_invalidate_internal_cache(sbi, old_blkaddr, 1);
 
 	f2fs_update_data_blkaddr(dn, dn->data_blkaddr);
 	return 0;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d3fe66a93a56..addd49af57ec 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4757,10 +4757,10 @@ static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
 }
 
 static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
-								block_t blkaddr)
+						block_t blkaddr, unsigned int len)
 {
-	f2fs_truncate_meta_inode_pages(sbi, blkaddr, 1);
-	f2fs_invalidate_compress_pages_range(sbi, blkaddr, 1);
+	f2fs_truncate_meta_inode_pages(sbi, blkaddr, len);
+	f2fs_invalidate_compress_pages_range(sbi, blkaddr, len);
 }
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e40bdd12e36d..155c1a4a0d74 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1410,7 +1410,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				page_address(mpage), PAGE_SIZE);
 	f2fs_put_page(mpage, 1);
 
-	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr);
+	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr, 1);
 
 	set_page_dirty(fio.encrypted_page);
 	if (clear_page_dirty_for_io(fio.encrypted_page))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a5bd101c63a1..92ddff285a65 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2567,7 +2567,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 		return;
 
-	f2fs_invalidate_internal_cache(sbi, addr);
+	f2fs_invalidate_internal_cache(sbi, addr, 1);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
@@ -3845,7 +3845,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		goto out;
 	}
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
-		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr);
+		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr, 1);
 
 	/* writeout dirty page into bdev */
 	f2fs_submit_page_write(fio);
@@ -4037,7 +4037,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		update_sit_entry(sbi, new_blkaddr, 1);
 	}
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
-		f2fs_invalidate_internal_cache(sbi, old_blkaddr);
+		f2fs_invalidate_internal_cache(sbi, old_blkaddr, 1);
 		if (!from_gc)
 			update_segment_mtime(sbi, old_blkaddr, 0);
 		update_sit_entry(sbi, old_blkaddr, -1);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
