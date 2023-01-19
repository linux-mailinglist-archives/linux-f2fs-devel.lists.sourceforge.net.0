Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEBE6731D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXd-0005fc-05;
	Thu, 19 Jan 2023 06:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXb-0005fK-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IcUKwSAmXzOWW15XJQNwueQJY6OPm3Il580HF26m9M=; b=YRMGOBigXQZP0UXM0alUn7wKe8
 CcVTwzXPuhUZ9JwsuwDGhxEMAnbmMKn/KbTAwST1fwlc5Dx1Ka27o7iKZWLlax8oYqtD0D8wRPrwm
 N+eFd5FpW+iwC5uC7UKb3JgrnQiv8OlgGuA0IJ0o/GX7N9fawfuDXi7Npvzvdqa+wHD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8IcUKwSAmXzOWW15XJQNwueQJY6OPm3Il580HF26m9M=; b=gyDvjfZ6UCqVYPY6B6ejtAk9R1
 4jIjLvEEr2UkBnB5ROVN45Qd06fQps2IG6Vyo4i/gWY5Sv5cocS4whBZhqTfTgoLUPz1jFPCuF//j
 GD3y3nnnh0WWCAObNoUox1O6yLVo7vxML9pN9FGuf8qiYe6SwfEsiUskkOl0vEQ6PGTQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXa-0001dh-6q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8IcUKwSAmXzOWW15XJQNwueQJY6OPm3Il580HF26m9M=; b=f0NWAUj34w/UgYENRZfRE6I508
 BLQvFK0FrtNWuzEk9pEpXUPR4Z+6S8HkVp73u09NIqZsr/+iMGGRslBq6zEEVyKvDF57IDM0NsSq+
 E0uN+QIaMgnP12L96r86ytaUeK0UVmbF7n6/WGirbdIHLWvO1Sj2WYDn2u1lkpzEI0En1Md5xf0Yk
 vepSiRNOvYhP3RIjv2L7qKWq0oAqb+4HqSNDH4d3flN9lIy5D93c8/x74cw2cbDgGf1e0OPK8wRhf
 cPtZrK9gVQtlErPcGfx46aSeNCe2RJA+jBRWxaHHwN4iLsGOP8aLoZ5uqICll99ZcYg0JrzZWerxX
 rJ+pt36Q==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXU-003kcF-6f; Thu, 19 Jan 2023 06:36:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:22 +0100
Message-Id: <20230119063625.466485-6-hch@lst.de>
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
 Content preview: Simplify the check whether to allocate a new segment or reuse
 an open one. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/segment.c
 | 14 +++++--------- 1 file changed, 5 insertions(+), 9 deletions(-) 
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
X-Headers-End: 1pIOXa-0001dh-6q
Subject: [f2fs-dev] [PATCH 5/8] f2fs: refactor __allocate_new_segment
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

Simplify the check whether to allocate a new segment or reuse an open
one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ad323b6e8609cd..b25ee37d0375e2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2897,16 +2897,12 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
 
-	if (!curseg->inited)
-		goto alloc;
-
-	if (force || curseg->next_blkoff ||
-		get_valid_blocks(sbi, curseg->segno, new_sec))
-		goto alloc;
-
-	if (!get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
+	if (!force && curseg->inited &&
+	    !curseg->next_blkoff &&
+	    !get_valid_blocks(sbi, curseg->segno, new_sec) &&
+	    !get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
 		return;
-alloc:
+
 	old_segno = curseg->segno;
 	new_curseg(sbi, type, true);
 	stat_inc_seg_type(sbi, curseg);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
