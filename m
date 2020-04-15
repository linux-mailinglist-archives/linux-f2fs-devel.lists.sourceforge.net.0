Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A41A9CA4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:37:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLv-0003c7-1F; Wed, 15 Apr 2020 11:37:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLt-0003bi-Al
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ovEn6rsyY/RGj6jaBD3PWF7YrlUO6/W4Qyh25ISg0Ko=; b=l5nLxai5CTB67/65uccQPkejQA
 6VI42TEnC9R4jk43/RFSJZdw3p+aWJ6Gr1WknaARyBA3L6ixwxfIRR7k7at0+jATx0hf9BD+35Ii3
 3OdKzdHBfUbiGxGul6h64hlyfaVjO7nc8+shF5X3JrxXQcvDAUDr9Ozxjd0p7BhujN0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ovEn6rsyY/RGj6jaBD3PWF7YrlUO6/W4Qyh25ISg0Ko=; b=R0oj3VssMOcdg3FkSLP340ZnPB
 jMw/x1tphibAr8wN5JRJZv3qm9jhUM/hkeKLiL31+K6BmoftQp8PuXvsOCE2HiSeuCVaTDdsa4K7W
 RRNJWYxgApjffUrgIMEoRGU9mD5xUXFW9zAlnLYuh/ZzDh6CoHRSfsub4RbvP6jAqZhE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLs-000FLX-9o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:09 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3628020768;
 Wed, 15 Apr 2020 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950622;
 bh=8qfY1PhpS8YCU7EkMHPLz0aR2nf5Kwu2pnxThzBrBOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CCL65ug9NLh5aTp7VSqEZLO5n1BousVTOfJdPqrkYtn3ONBDFStS4Jidvj9ygNG+u
 V3rfUvr3Pz0zCx4Irr3dxc/oWOdpeieI0ijKgWGSuazDlkpjrrFeljLjSgcNINlmSZ
 eYC4EM4FYbe4USRReNvVDRuSg/76mBtsam4WHumA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:29 -0400
Message-Id: <20200415113445.11881-114-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLs-000FLX-9o
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 114/129] f2fs: skip GC when section
 is full
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 2bac07635ddf9ed59268e61e415d8de9c5eaded7 ]

This fixes skipping GC when segment is full in large section.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2f645c591a000..3cced15efebc2 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1018,8 +1018,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		 * race condition along with SSR block allocation.
 		 */
 		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
-				get_valid_blocks(sbi, segno, false) ==
-							sbi->blocks_per_seg)
+				get_valid_blocks(sbi, segno, true) ==
+							BLKS_PER_SEC(sbi))
 			return submitted;
 
 		if (check_valid_map(sbi, segno, off) == 0)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
