Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CAE6731D3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXa-0001Sh-Ri;
	Thu, 19 Jan 2023 06:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXY-0001SS-4a for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Q1xLjahu5r3Hpi8KZaN6erKrrcckUykkiJeIuFGVEE=; b=IlUErF5i3b7jZi3XAcRuZ47I3B
 42g12CLaQqhqwHGO8uChh8UOzdiNj82T+OikL3ZHqL/E08eJh74Qqvbl4y2+Lvp9wbTpR4LBbT7Wn
 PWsnvAkPGH6m8EjEo5Rf6zN2AKfu/Gr/+BMJ4+ISE0cjC2JmZpsLABzn10acGEfACGlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Q1xLjahu5r3Hpi8KZaN6erKrrcckUykkiJeIuFGVEE=; b=OTLiXq4nvPxNTLlP1xV5mAQxqv
 heIgOB3ruDEjvIMjMVppWStsoUOKrCeTqvetqe2UZkFvzKkVKlqes7vrSOViQ7wNNeYUWoBygFw1F
 Kehp3P5t3kG+6fOolSZjVTRTQaRCvqN/gXlkErPIBWln+R2AFL/9/8+8T1mcxF9rFStQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXT-0001dS-40 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3Q1xLjahu5r3Hpi8KZaN6erKrrcckUykkiJeIuFGVEE=; b=d3DP1HJYKUhjmxH2khsCX1lzSb
 nYglgL/Luow7+mlgv4t+ID3WyUjWW9WIam85f66YeL15OSsO+J0ymB+slQIbcyGc/3LmvY/aYRZRd
 aH33+vPELLR9WQ/fNMYoAzLixuxhgN6DQqTmZb00SOWavugxADcDu/T8zmnBuK/cAF0AbVKJ7js3N
 gYXpRYnWEcfZh32rhGj4+WiRcQk1W+PcroHK6uclkU+1BzPrhAgLSR0GSpRhG20calAetf2vxQXLe
 aF1of7K1s+92MjOIKVvRtJ1NSXMqX7Qge+/iUw95vdn/jVnMJJezaR6Bs6dNXfUPNHZCJEiB7MhJf
 5tSq7T2g==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXH-003kak-D6; Thu, 19 Jan 2023 06:36:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:18 +0100
Message-Id: <20230119063625.466485-2-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This function just assigns a summary entry. This can be done
 entirely typesafe with an open code struct assignment that relies on array
 indexing. Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/segment.c
 | 23 ++ 1 file changed, 2 insertions(+), 21 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pIOXT-0001dS-40
Subject: [f2fs-dev] [PATCH 1/8] f2fs: remove __add_sum_entry
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

This function just assigns a summary entry.  This can be done entirely
typesafe with an open code struct assignment that relies on array
indexing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 311243dda4cefa..ec6880213e8fa9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2323,19 +2323,6 @@ bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return is_cp;
 }
 
-/*
- * This function should be resided under the curseg_mutex lock
- */
-static void __add_sum_entry(struct f2fs_sb_info *sbi, int type,
-					struct f2fs_summary *sum)
-{
-	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	void *addr = curseg->sum_blk;
-
-	addr += curseg->next_blkoff * sizeof(struct f2fs_summary);
-	memcpy(addr, sum, sizeof(struct f2fs_summary));
-}
-
 /*
  * Calculate the number of current summary pages for writing
  */
@@ -3262,13 +3249,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	f2fs_wait_discard_bio(sbi, *new_blkaddr);
 
-	/*
-	 * __add_sum_entry should be resided under the curseg_mutex
-	 * because, this function updates a summary entry in the
-	 * current summary block.
-	 */
-	__add_sum_entry(sbi, type, sum);
-
+	curseg->sum_blk->entries[curseg->next_blkoff] = *sum;
 	__refresh_next_blkoff(sbi, curseg);
 
 	stat_inc_block_count(sbi, curseg);
@@ -3571,7 +3552,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
-	__add_sum_entry(sbi, type, sum);
+	curseg->sum_blk->entries[curseg->next_blkoff] = *sum;
 
 	if (!recover_curseg || recover_newaddr) {
 		if (!from_gc)
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
