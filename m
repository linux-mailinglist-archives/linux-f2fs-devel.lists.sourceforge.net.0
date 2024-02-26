Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F286678D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:32:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePrH-0003ra-7X;
	Mon, 26 Feb 2024 01:32:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rePrF-0003rU-Bp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsYdnGmit0kwgplmuGgycR7o7ZBQPU1A1t8X48r2Hhs=; b=BVHM1ascalR7XCvTdJ9PHAKWKO
 mJGbCwXVxUUCXCJLYdvcc/9ndFhjvSZ5ZgcSQnsYjQgSFqCwAud3Hybp2b5C+wntXAHEbWz32E9H3
 xgqzw/TFKDzImCZZKGfP13n0nG/WE4bMBts2dn6OJaqOZfhnXSXBRPKaJolkr1Lpq2tU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsYdnGmit0kwgplmuGgycR7o7ZBQPU1A1t8X48r2Hhs=; b=i2Mh0k0ZhVp1B2b5iBr9T9u8i3
 OhTmDxI5UUl0eh/+HhVX/aCmuNBYpSlpDlNLLHcOdpsSud6bk8saGRigF4IyeTY0BoJkbsQh+V+mG
 ZklPqj0xY7bqbi8U+FkbqBjkzKeA/5cCTUZGqIQZhzkzdKb3sFMuUcLV5oRI99FScP8E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePrB-0007wZ-6c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3DBC60E75
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 01:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8815C433C7;
 Mon, 26 Feb 2024 01:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708911146;
 bh=swCJRsLLHSfSL70VZ8N2jxsoH3eh6oxUKRyJYOvWmVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FwvylUGmaR3/VKWOxYxEaJZFu7yTShWFdpZBHMKyTV7/KhCdXYdJQM4qdlXZ1cMVj
 AVyHxWq2CW3omXby49h2WXemiInYv1+c3I7DL9A0PFq1qe+AtnLDIQr7ZSnWHEG+xZ
 B/5L3O00WoJmT7Gu1CwyIF2pWGI4qDAcbkctSH1v9tDAhrofkeVJsl9MdcXOKqTyoK
 cyYyg0iYkBIWb2Ogv5MJksLuVfAFi53CIeJMLbuyARUq8xPJY8Y+UvcCGpMM57RXgn
 2xOrCsUd9OAvfpT7mXQQAVQOY3+Drbudsbcw8GsZRJutXUiPF9IvxrZFS4cIUg3IzC
 L54KRQ7EBb9UA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 09:32:08 +0800
Message-Id: <20240226013208.2389246-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240226013208.2389246-1-chao@kernel.org>
References: <20240226013208.2389246-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_allocate_data_block(), before skip allocating new
 segment for DATA_PINNED log header, it needs to tag log header as unloaded
 one to avoid skipping logic in locate_dirty_segment() and __f2fs_sa [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rePrB-0007wZ-6c
Subject: [f2fs-dev] [PATCH 4/4] f2fs: fix to reset fields for unloaded curseg
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

In f2fs_allocate_data_block(), before skip allocating new segment
for DATA_PINNED log header, it needs to tag log header as unloaded
one to avoid skipping logic in locate_dirty_segment() and
__f2fs_save_inmem_curseg().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c159b0985596..5e45afd69f3f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3101,12 +3101,16 @@ static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
 
+	if (type == CURSEG_COLD_DATA_PINNED && !curseg->inited)
+		goto allocate;
+
 	if (!force && curseg->inited &&
 	    !curseg->next_blkoff &&
 	    !get_valid_blocks(sbi, curseg->segno, new_sec) &&
 	    !get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
 		return 0;
 
+allocate:
 	old_segno = curseg->segno;
 	if (new_curseg(sbi, type, true))
 		return -EAGAIN;
@@ -3451,6 +3455,13 @@ static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
 		get_random_u32_inclusive(1, sbi->max_fragment_hole);
 }
 
+static void reset_curseg_fields(struct curseg_info *curseg)
+{
+	curseg->inited = false;
+	curseg->segno = NULL_SEGNO;
+	curseg->next_segno = 0;
+}
+
 int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
@@ -3516,8 +3527,10 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	 */
 	if (segment_full) {
 		if (type == CURSEG_COLD_DATA_PINNED &&
-		    !((curseg->segno + 1) % sbi->segs_per_sec))
+		    !((curseg->segno + 1) % sbi->segs_per_sec)) {
+			reset_curseg_fields(curseg);
 			goto skip_new_segment;
+		}
 
 		if (from_gc) {
 			get_atssr_segment(sbi, type, se->type,
@@ -4595,9 +4608,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 			array[i].seg_type = CURSEG_COLD_DATA;
 		else if (i == CURSEG_ALL_DATA_ATGC)
 			array[i].seg_type = CURSEG_COLD_DATA;
-		array[i].segno = NULL_SEGNO;
-		array[i].next_blkoff = 0;
-		array[i].inited = false;
+		reset_curseg_fields(&array[i]);
 	}
 	return restore_curseg_summaries(sbi);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
