Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3091060C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 06:52:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iY1rW-0004gM-Ea; Fri, 22 Nov 2019 05:52:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iY1rV-0004gF-82
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 05:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dOlEEsN1sM/ZeY3wtKXF1hCnfWPtlHPpkHhsec7O77Y=; b=Y9W8sC6jgIEeS2oYj6GeJRPVkD
 4fduRFo66uX1tpjk54mns+nHWktx2BnmCkvdsQnL7Bvlp/2ZzeraSWGtfDB7X9d3/DQK8kwdB611w
 zO5FP6Zj/7drexa9VvGKd57qRJDfIVxgf20PM8l0eRl9vBMsTAQQWpcY+cMAZvr/NeIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dOlEEsN1sM/ZeY3wtKXF1hCnfWPtlHPpkHhsec7O77Y=; b=de0Vvpo0rAhYOOyMBfOJOx/NG4
 wnjaP1hIjG1IHRYZEsLzk1Jv5j7CEcxuJy5lj+yv5sM6DxT8s1Mla/Ibg3h+Javfv/9Vtydsw0aY7
 YA3tpJS9Lb7dsjAnzlnlN8rez8oA7ryXywzCo8UivwJsP18cBGaqvKysYwzO3qP9GnoU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iY1rS-0000cu-6l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 05:52:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0916520717;
 Fri, 22 Nov 2019 05:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401910;
 bh=pnHoMJ/VIf/bpAE19w6W//LfMUwzElYtDIiJ9wLpwgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rVpGJBIFVn9ld64xGBlidcb1MVObsr3xoN5VZeHEw3BojbKasOoWgHvZzvT8HspwT
 SxNFD44RR/9DN4U6ZaidiTDa+ysR7PIycotTimvc05BqzBn8GRexr5J7G0MyCf7qhG
 auL0SqARIlpdOlIeg1irbs6IBU/WN59fBpFLR1to=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:47:53 -0500
Message-Id: <20191122054911.1750-134-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iY1rS-0000cu-6l
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 141/219] f2fs: fix block address for
 __check_sit_bitmap
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
 Qiuyang Sun <sunqiuyang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qiuyang Sun <sunqiuyang@huawei.com>

[ Upstream commit 9249dded7b5cb539a8c8698b25d08a3c15261470 ]

Should use lstart (logical start address) instead of start (in dev) here.
This fixes a bug in multi-device scenarios.

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 10d5dcdb34be6..01cb87b12d40b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1101,7 +1101,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		list_move_tail(&dc->list, wait_list);
 
 		/* sanity check on discard range */
-		__check_sit_bitmap(sbi, start, start + len);
+		__check_sit_bitmap(sbi, lstart, lstart + len);
 
 		bio->bi_private = dc;
 		bio->bi_end_io = f2fs_submit_discard_endio;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
