Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A8FAFD42E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh2BdF7sB6yPs8Ym0/Wxz581Aik0q3hQbl7/xjcu+ps=; b=iF0GxlnB9yd4BbwdQJMI5+hCdf
	JcgWiXcMFdoRDo5Ac/YUoXpgN7aD0Y7BOkqDKJgwa6XwVEkYWkrpQqiUddinTVow3Eo7j0TazoKHV
	oJMffo0eh+2ey/kYxFAAzeTfOGTZBhuzW9MpUsF1Iu49/o4ZBIG0LEbeJQkjsPo3Kp1s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjt-0005EX-8r;
	Tue, 08 Jul 2025 17:04:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0005D7-Lu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrH/z7GTvkDXSkXIeClUQotEqnrpsvBmsFfNg8sNsr8=; b=UzBcOO756zlvboIYIsPNiXszK5
 WdXn2vCI33d+2MnN5rwPZCYK2m6FwhcUdwGO5Pr67VvLZFGxRs9Lb8ULDf/U8OABe1sLJ8mTaa7aJ
 +NqMyJ5CwEu4uyvKimvhQkkPzylV/GrK6jACuqLXgmujnN/0OKx/+APs4YDhcaqJw0Lk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nrH/z7GTvkDXSkXIeClUQotEqnrpsvBmsFfNg8sNsr8=; b=UQRHxMJesU+SD/604hCJkDzXHt
 Db19MuJzE9HKR77zo2Abj5yhfd1oRE3i8djIt1Ow8RQf6sgo+wY7LHAh0zesLEFOqPhBSj4CPxdEP
 HXZps90D8qSTY3okPfUcQ0x1x0GWmtdcGCn05D1NqyPA4AIcOsNuOI5Ku9sicF6/5mvo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjm-0006E4-QH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nrH/z7GTvkDXSkXIeClUQotEqnrpsvBmsFfNg8sNsr8=; b=UhsX/ZQsyPPbkysET4pGYa1SNu
 3wYiPmnqY4KXAk4W4qXYIQhFcveVEifRUyoHLB6qYsGUXSJPf7O1LoB7niqik5vCJ/0BLmGwDHYzN
 T0mTBzSZxM8xIkBQk4LuBhsowyHuUUFA2XIH7SA8dTC2fWds1Bla61CQrTMCxngIEc6ke2dcQlcLh
 piCxWbgObOY9VJf70P4oBWOAvgozHcHaoc1vPRc0TIaYHHjURU4Wyzmo+rTXBdRqiQMV+WLqt9GgI
 Guw0IXVZJ4o9xguZMuzmd0XehiSd9Iw5mN58XdSGoFr4pBlXLR+80uSWkGh5/1KhqCAq7FLYTDFgu
 1C9PN7Cw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T5C-20IK;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:17 +0100
Message-ID: <20250708170359.111653-21-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.h | 6 +++---
 fs/f2fs/segment.c | 2 +- 2 files changed, 4 insertions(+), 4 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjm-0006E4-QH
Subject: [f2fs-dev] [PATCH 20/60] f2fs: Pass a folio to
 fill_node_footer_blkaddr()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The only caller has a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.h    | 6 +++---
 fs/f2fs/segment.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 914399113f21..5cbe038bfaab 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -300,10 +300,10 @@ static inline void copy_node_footer(struct page *dst, struct page *src)
 	memcpy(&dst_rn->footer, &src_rn->footer, sizeof(struct node_footer));
 }
 
-static inline void fill_node_footer_blkaddr(struct page *page, block_t blkaddr)
+static inline void fill_node_footer_blkaddr(struct folio *folio, block_t blkaddr)
 {
-	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_P_SB(page));
-	struct f2fs_node *rn = F2FS_NODE(page);
+	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_F_SB(folio));
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 	__u64 cp_ver = cur_cp_version(ckpt);
 
 	if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 28fb844b7921..d0ce8b298d3b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3852,7 +3852,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	up_write(&sit_i->sentry_lock);
 
 	if (folio && IS_NODESEG(curseg->seg_type)) {
-		fill_node_footer_blkaddr(&folio->page, NEXT_FREE_BLKADDR(sbi, curseg));
+		fill_node_footer_blkaddr(folio, NEXT_FREE_BLKADDR(sbi, curseg));
 
 		f2fs_inode_chksum_set(sbi, folio);
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
