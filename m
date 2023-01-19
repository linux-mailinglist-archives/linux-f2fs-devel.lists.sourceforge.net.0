Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3676731D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXa-0001Sa-AQ;
	Thu, 19 Jan 2023 06:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXY-0001SN-0s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wI3Vffj/Y5/w+tGLiOXfNC6bTn/YLU1DHa2oGPTIuIQ=; b=WxVHh5/CfIv8zJv/j3PEoooibG
 bobyle4jOLg2f+HgNvEJjUTzoZLRYoViHm3gDjcQ4KCQVBjQwcALUnKn10RZiaOA2l/4F4RI/MQHL
 YTP69bVr09xhpTGD4c97qnlpzVJYPGl0EJtSbW4dP67AgqhaMFFHnzRIZ52PehLjMxkM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wI3Vffj/Y5/w+tGLiOXfNC6bTn/YLU1DHa2oGPTIuIQ=; b=KDzaAAkMxRFwnY4uF45ykGpydn
 ckog4af0Hj0/mVuKiN1OgoqI+P4jX7hXVCbSGSkDhsCOOS7hPGhogl38F8FkFP43Qv/VRJ7yVJe9N
 xyB4tCecNm6q37F6UqfB6oV0q+h1oDLBi7MWmghBmXh59AKttsPwV5hQ9gVYJr+tiW6A=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXW-008fSH-0P for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wI3Vffj/Y5/w+tGLiOXfNC6bTn/YLU1DHa2oGPTIuIQ=; b=1KyRE5AhwCYkbKr83BICy8/GOT
 KhN8x8857MD1XgWYJpfVavUrxnHBkIOaffuw13sCDl8VUBx4pv7ZDMf6ptflhn8dOV+4IBRnGEPJl
 8VlUcHTQ7nrNcbXCcf15DIs04qWO4Gzch8PYMNrxO+sLwWi62oBYxcsbSdWIKHhQ4qhM4uqY0wkvA
 iTDXECiS6uOZLO6pcLrBw5wYpNxuHRysjG93U+RnS0m971nIxioIFRwcFB58UubAhE8h9eXlDWKij
 m2CAAsUo7DO3HJqJz+qqkYu4LBHNYJ8CaFp2aZ2xNJ3RIrpXaZItZA7V6WsyQ7CG1+7BiUPnpKngU
 vMjrthSg==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXL-003kb4-6L; Thu, 19 Jan 2023 06:36:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:19 +0100
Message-Id: <20230119063625.466485-3-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: For each loop add a local curseg_info pointer insted of
 looking
 it up for each of the three fields. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 --- fs/f2fs/checkpoint.c | 22 ++++++++++ 1 file changed, 10 insertions(+),
 12 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIOXW-008fSH-0P
Subject: [f2fs-dev] [PATCH 2/8] f2fs: simplify do_checkpoint
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For each loop add a local curseg_info pointer insted of looking it up
for each of the three fields.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/checkpoint.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d68b3c991888df..641165c8299231 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1470,20 +1470,18 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	ckpt->elapsed_time = cpu_to_le64(get_mtime(sbi, true));
 	ckpt->free_segment_count = cpu_to_le32(free_segments(sbi));
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
-		ckpt->cur_node_segno[i] =
-			cpu_to_le32(curseg_segno(sbi, i + CURSEG_HOT_NODE));
-		ckpt->cur_node_blkoff[i] =
-			cpu_to_le16(curseg_blkoff(sbi, i + CURSEG_HOT_NODE));
-		ckpt->alloc_type[i + CURSEG_HOT_NODE] =
-				curseg_alloc_type(sbi, i + CURSEG_HOT_NODE);
+		struct curseg_info *curseg = CURSEG_I(sbi, i + CURSEG_HOT_NODE);
+
+		ckpt->cur_node_segno[i] = cpu_to_le32(curseg->segno);
+		ckpt->cur_node_blkoff[i] = cpu_to_le16(curseg->next_blkoff);
+		ckpt->alloc_type[i + CURSEG_HOT_NODE] = curseg->alloc_type;
 	}
 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
-		ckpt->cur_data_segno[i] =
-			cpu_to_le32(curseg_segno(sbi, i + CURSEG_HOT_DATA));
-		ckpt->cur_data_blkoff[i] =
-			cpu_to_le16(curseg_blkoff(sbi, i + CURSEG_HOT_DATA));
-		ckpt->alloc_type[i + CURSEG_HOT_DATA] =
-				curseg_alloc_type(sbi, i + CURSEG_HOT_DATA);
+		struct curseg_info *curseg = CURSEG_I(sbi, i + CURSEG_HOT_DATA);
+
+		ckpt->cur_data_segno[i] = cpu_to_le32(curseg->segno);;
+		ckpt->cur_data_blkoff[i] = cpu_to_le16(curseg->next_blkoff);
+		ckpt->alloc_type[i + CURSEG_HOT_DATA] = curseg->alloc_type;
 	}
 
 	/* 2 cp + n data seg summary + orphan inode blocks */
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
