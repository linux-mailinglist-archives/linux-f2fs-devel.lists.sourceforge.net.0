Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D576B24598
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4cb1w1CLqM4+Qlod7yWed+gfqob9Eg3VNDOUh92hQc=; b=gepXncmcHpNH82p1NgKgbpgYXC
	6r7FujDujiXfUaOM1sfWBvA00AkgC89HxWpeL0YyRDUBx0MV0qOURv/yf2mJ10QsEQgrYB46Gjapf
	feJxVOysXIXxXkDs7CgSeIN8t5UqpK7ClG+Li3G7b5m5WQw6C5ZJEN67V2fiQGcKo5y0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wg-00047B-59;
	Wed, 13 Aug 2025 09:38:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7we-00046k-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXrrH1GuF3TyhMQNJeF8+XDV9FdDsRz5WCLevGpnP98=; b=kZseJHRPWGndo2Yu3VVHV4tR47
 ub+Aq8chTLWWaHeZ4cPozqwf9y7jSd6mfL8BsW3PjthLWUI/YJhlb7kBj/HV7GkmDGt22fnQmbl7b
 u/KdFMdp4x8fVwmb9Xpw7PDDxPcoKyP1zJBh+2VLwbVgvCcOQmA9L6w3WBiQfq121gss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JXrrH1GuF3TyhMQNJeF8+XDV9FdDsRz5WCLevGpnP98=; b=WHgB6aX0THRNWFKBEVmuMmnebC
 xw+nZGN6Tuf1yU/QR3oCEJ0dloruVaR6+LH5dArMSBjtfJPCkUdXmOouuXGN7jWpVgJoNh8HlZ2xH
 vsludlcqFdR+I+oiCSBvSlXk8tvJ6l9d1aa4pueWNNn3XcAVDMedyxIZjw6Tr0f9A+jE=;
Received: from m16.mail.126.com ([117.135.210.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7we-0004VL-20 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=JX
 rrH1GuF3TyhMQNJeF8+XDV9FdDsRz5WCLevGpnP98=; b=CHl88+t/JfbXKe8jVE
 9mrhoSWaalCxHNXpwdKTRNpqWxs4hNuxNH3IC14HSicpRg5j5t4fUQhyuk0QEDt9
 zFOz7IXt8Y/R7fOAxv9AzTQXwQxi52NCeQQ9jGYuePfoCSkfDprXsDACD0MefpAC
 BI6mXr4pac9M+rmXBjhhEdknI=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S9; 
 Wed, 13 Aug 2025 17:38:29 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:53 +0800
Message-Id: <20250813093755.47599-8-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4DXFW7WryDXw45JrW5Jrb_yoWrJw18pF
 W5GF9xGrs5JF17urn2yFn8Zr1rta4Ivr4UAFWxCw4xXa1UXwn5K3W0y3WfZF1DtrykArWI
 qF1rtry5WF4UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRPl1PUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiZA6oz2icUlqdGgABs3
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, the GC (Garbage Collection) logic for performing
 I/O and marking folios dirty only supported order-0 folios and lacked
 awareness
 of higher-order folios. To enable GC to correctly handle hi [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7we-0004VL-20
Subject: [f2fs-dev] [RFC PATCH 7/9] f2fs:Make GC aware of large folios
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, the GC (Garbage Collection) logic for performing I/O and
marking folios dirty only supported order-0 folios and lacked awareness
of higher-order folios. To enable GC to correctly handle higher-order
folios, we made two changes:

- In `move_data_page`, we now use `f2fs_iomap_set_range_dirty` to mark
  only the sub-part of the folio corresponding to `bidx` as dirty,
  instead of the entire folio.

- The `f2fs_submit_page_read` function has been augmented with an
  `index` parameter, allowing it to precisely identify which sub-page
  of the current folio is being submitted.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 13 +++++++------
 fs/f2fs/gc.c   | 37 +++++++++++++++++++++++--------------
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b7bef2a28c8e..5ecd08a3dd0b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1096,7 +1096,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 /* This can handle encryption stuffs */
 static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 				 block_t blkaddr, blk_opf_t op_flags,
-				 bool for_write)
+				 pgoff_t index, bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1109,7 +1109,8 @@ static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0)) {
+	if (!bio_add_folio(bio, folio, PAGE_SIZE,
+			   (index - folio->index) << PAGE_SHIFT)) {
 		iostat_update_and_unbind_ctx(bio);
 		if (bio->bi_private)
 			mempool_free(bio->bi_private, bio_post_read_ctx_pool);
@@ -1276,8 +1277,8 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		return folio;
 	}
 
-	err = f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
-						op_flags, for_write);
+	err = f2fs_submit_page_read(inode, folio, dn.data_blkaddr, op_flags,
+				    index, for_write);
 	if (err)
 		goto put_err;
 	return folio;
@@ -3651,8 +3652,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 			goto put_folio;
 		}
 		err = f2fs_submit_page_read(use_cow ?
-				F2FS_I(inode)->cow_inode : inode,
-				folio, blkaddr, 0, true);
+			F2FS_I(inode)->cow_inode : inode, folio,
+			blkaddr, 0, folio->index, true);
 		if (err)
 			goto put_folio;
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 098e9f71421e..6d28f01bec42 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1475,22 +1475,31 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
-		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+		if (!folio_test_large(folio)) {
+			folio_mark_dirty(folio);
+		} else {
+			f2fs_iomap_set_range_dirty(folio, (bidx - folio->index) << PAGE_SHIFT,
+				PAGE_SIZE);
+		}
+#else
+		folio_mark_dirty(folio);
+#endif
 	} else {
-		struct f2fs_io_info fio = {
-			.sbi = F2FS_I_SB(inode),
-			.ino = inode->i_ino,
-			.type = DATA,
-			.temp = COLD,
-			.op = REQ_OP_WRITE,
-			.op_flags = REQ_SYNC,
-			.old_blkaddr = NULL_ADDR,
-			.folio = folio,
-			.encrypted_page = NULL,
-			.need_lock = LOCK_REQ,
-			.io_type = FS_GC_DATA_IO,
-		};
+		struct f2fs_io_info fio = { .sbi = F2FS_I_SB(inode),
+					    .ino = inode->i_ino,
+					    .type = DATA,
+					    .temp = COLD,
+					    .op = REQ_OP_WRITE,
+					    .op_flags = REQ_SYNC,
+					    .old_blkaddr = NULL_ADDR,
+					    .folio = folio,
+					    .encrypted_page = NULL,
+					    .need_lock = LOCK_REQ,
+					    .io_type = FS_GC_DATA_IO,
+					    .idx = bidx - folio->index,
+					    .cnt = 1 };
 		bool is_dirty = folio_test_dirty(folio);
 
 retry:
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
