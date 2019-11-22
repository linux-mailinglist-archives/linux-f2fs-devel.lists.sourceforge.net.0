Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8D107946
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 21:09:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iYFFG-00018j-8p; Fri, 22 Nov 2019 20:09:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iYFFF-00018Y-3z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 20:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2dEkgfgtGXUDaHISHm8TQguIQkMXpmekUBtrf/y81oE=; b=GX+GTXg/CPXcLIe5JPeluiaySh
 alAfgJcY1tyG52xlu3TnJwU2QXhUOi1/ixpzSGpyiDrwOxJ+a4cZvMEbUPbZU/8ggxiRT0nBsLm/j
 BN+dCqdjsBWKz04xVAG0uHFencntD1jAUW9ZZJvuarvccXKg606h76y1aCXKqZPwNtVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2dEkgfgtGXUDaHISHm8TQguIQkMXpmekUBtrf/y81oE=; b=jf3eKo9GaNnPWPJaQweWFdBVui
 rtxtWzZGWtDlkWB2Gq4+7TUBeBRalR6+ByRWaLuZdAcxrjkUuZHlWocBErX0wlDkPj3/UCUFNYYWP
 QSkSKkLWvoAiCCJU98IqpkSyazpIE62oCStkbIh2bs2ujfRBY3kGPU6K0BnU9pGh9kQU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iYFFC-00AjGu-QW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 20:09:33 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 438402070E;
 Fri, 22 Nov 2019 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574453363;
 bh=Dvd17sN9aKtG3WDYVBtYh+HeEMUwJ3hipC55jNi6qBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mG6KoUt4L/RNymmjDaeJHrvG8+kzFySvErqhsboZFRI3tUMmhSD0969niKGARYKa2
 c0jeZ29pWiSrR50IQ2hrTfzU2oECLvzkBfF1n26yZ+WVCUoMWSVnU0eXPYVEkdawpE
 waNaodEt78IsNaJZuJ1i07dwHJLurkcdninAbWds=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Nov 2019 12:09:20 -0800
Message-Id: <20191122200920.83941-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20191122200920.83941-1-jaegeuk@kernel.org>
References: <20191122200920.83941-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iYFFC-00AjGu-QW
Subject: [f2fs-dev] [PATCH 2/2] f2fs: stop GC when the victim becomes fully
 valid
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Ramon Pantin <pantin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We must stop GC, once the segment becomes fully valid. Otherwise, it can
produce another dirty segments by moving valid blocks in the segment partially.

Ramon hit no free segment panic sometimes and saw this case happens when
validating reliable file pinning feature.

Signed-off-by: Ramon Pantin <pantin@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 24a3b6b52210..b3d399623290 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1012,8 +1012,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		block_t start_bidx;
 		nid_t nid = le32_to_cpu(entry->nid);
 
-		/* stop BG_GC if there is not enough free sections. */
-		if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0))
+		/*
+		 * stop BG_GC if there is not enough free sections.
+		 * Or, stop GC if the segment becomes fully valid caused by
+		 * race condition along with SSR block allocation.
+		 */
+		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
+				get_valid_blocks(sbi, segno, false) ==
+							sbi->blocks_per_seg)
 			return submitted;
 
 		if (check_valid_map(sbi, segno, off) == 0)
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
