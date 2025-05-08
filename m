Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E5AAF2B8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3voq7VK6IezH9Ee+qK133dbpUVl/02+U1x/mZb1QHpI=; b=G0wIvLhAOF79rcxvQKoqegLZT3
	PwrF8+DVuyts3dHR5mlYz0BdwgwYMZW2CquEmEwtLVToi0ojOwFVWimPdL9C3yCSdkgrZPyUOS8t3
	4c3fGAVAPQdtFdUQfVU+drAWinXVx2Pv+1MYlClPWKJGyDJP59vD2coALnfD/B/vZaRI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtc4-0003IY-UB;
	Thu, 08 May 2025 05:16:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbv-0003HC-HW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1G4f4sk552Jl077q56Rrcrvm+8Rfw3GwTOMqnkMOeys=; b=irB/VH00wOF6XvwMLvSUeiNyp0
 a+Pm0oqBgiGA94kzC56gWm72mmy2ppVWfPzzIgTm6dWrtu20CxHqxMsOGZQoVz5JgPD9lnQUr2Epz
 2tGRr+V83eCVic/kpjifrfevZt/xMaUKY1Ec0ebst3weZ6UmGHmCePBC27YNPElIIwVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1G4f4sk552Jl077q56Rrcrvm+8Rfw3GwTOMqnkMOeys=; b=WTDMIuAOOZ/9eYk51iekOUsDKT
 w7Nis/1Q+r4th3cmRBJONU2rFafukyXOBuU8aADbkk/Ulrny2Y0dyPJP/pICJge2Ig3AjV5BwdtGQ
 ypdsw09iK4rFLIH21hrdzj+cGvgQWNy/KX9ZJe84FRClRp7Z1j/EGBt1rxtFaqAEWaHU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbq-0003dQ-Or for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1G4f4sk552Jl077q56Rrcrvm+8Rfw3GwTOMqnkMOeys=; b=Rrmamjmozk1BTD7R9CmoYXv3pl
 Bvf1ZNDqPKeTU8uvHnzUdpCqhGO7ZQtAva7CKWlCchQRawXvRLhgn+1K3P+n84ZqRrCnoiQcbjJX/
 yAG2fsdkS5ioxnhyWYMzGdkD5O5yWkviKW3W4QHtI1rQhYq4KKvzzpTQONP14zYRQFTPfagHZrckS
 VFaft3ouWl7q2irQR9wvp46rLXsLzM8wK9BLoDpMC407Pk4l8LTwnBm4g8zqESiTPjlTBx2FWcc4N
 zd68aVAbWkgiBfyOPCG7SYqw2GbBYaDaTBG0Yub1JuqWAdNUQX/nYKA20MSP9+LVIIAgZkcBw5+d6
 S20tqtiA==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbl-0000000HLhe-00t2; Thu, 08 May 2025 05:15:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:32 +0200
Message-ID: <20250508051520.4169795-7-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __write_node_folio can only return 0 or
 AOP_WRITEPAGE_ACTIVATE.
 As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return instead.
 Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/node.c | 29 +++++++++++++ 1 file changed, 13 insertions(+), 16
 deletions(-) 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uCtbq-0003dQ-Or
Subject: [f2fs-dev] [PATCH 6/6] f2fs: return bool from __write_node_folio
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

__write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cbc7e9997b74..3f6b8037d25f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1651,7 +1651,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 	return last_folio;
 }
 
-static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
+static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 				struct writeback_control *wbc, bool do_balance,
 				enum iostat_type io_type, unsigned int *seq_id)
 {
@@ -1681,7 +1681,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
@@ -1707,7 +1707,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		f2fs_up_read(&sbi->node_write);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (__is_valid_data_blkaddr(ni.blk_addr) &&
@@ -1746,11 +1746,12 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 
 	if (do_balance)
 		f2fs_balance_fs(sbi, false);
-	return 0;
+	return true;
 
 redirty_out:
 	folio_redirty_for_writepage(wbc, folio);
-	return AOP_WRITEPAGE_ACTIVATE;
+	folio_unlock(folio);
+	return false;
 }
 
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
@@ -1772,11 +1773,9 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 			goto out_page;
 		}
 
-		if (__write_node_folio(node_folio, false, NULL,
-					&wbc, false, FS_GC_NODE_IO, NULL)) {
+		if (!__write_node_folio(node_folio, false, NULL,
+					&wbc, false, FS_GC_NODE_IO, NULL))
 			err = -EAGAIN;
-			folio_unlock(node_folio);
-		}
 		goto release_page;
 	} else {
 		/* set page dirty and write it */
@@ -1871,11 +1870,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__write_node_folio(folio, atomic &&
+			if (!__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id)) {
-				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
@@ -2078,16 +2076,15 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_folio(folio, false, &submitted,
-						wbc, do_balance, io_type, NULL);
-			if (ret) {
+			if (!__write_node_folio(folio, false, &submitted,
+					wbc, do_balance, io_type, NULL)) {
 				folio_unlock(folio);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
-			} else if (submitted) {
-				nwritten++;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (--wbc->nr_to_write == 0)
 				break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
