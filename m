Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE96F7384
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 21:43:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puerp-0005VM-NY;
	Thu, 04 May 2023 19:43:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1puero-0005VF-S8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OBY7npNncmLDFan583z0XSTuBA+O2ygvCOdZroimIxo=; b=UXHJk1M4RhqTg+gTS/tBK6zNFA
 izVtbjNWLuekYcg8muELLKUouxDApECwhkhj/8CRNF2vJIJYepr87j3m2u45/JJiAF+MY0IgT+0ey
 RTViQa8ScoMZtGlbDB0M73Z5dkmo22r0PNug9HH/+zeD/kmo5/AX96WeYbL3+b5y2qTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OBY7npNncmLDFan583z0XSTuBA+O2ygvCOdZroimIxo=; b=MPmsJ+wtm6En6Dv+Qmtj3C6j9z
 gWDBmRMuFocUSeNeODDY+5k34w8+hhSoaj9TCnGggFv7rISvl4pFrLVnD5egN12HnVWbp7RVBtay1
 rvV5hA67pNFye+Uoi6j268swbuBrMmZKZOwnod5NxOJPK82eHDiRzH81iJT81lndz/cA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puerj-00EKa8-KH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:43:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4293463733
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 19:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163EEC433D2;
 Thu,  4 May 2023 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683229421;
 bh=VZY5km8ttGA4lFXP4uir4dWru8YDf4d/uHraHcdDKFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/CohPXAY3Q+HAgb3aV5c7+7hwkdHd0Fuu6x8ObPrhSbxoVyN1utRuZ1hnaEukBcr
 Ffo9cqLwiMdK1wJfQp9Tb/b6iSgm6mp9xMNAAkNTUNUROj0PJtlKcc0hMwrT1YUKBY
 yJn5b5PWaCNr4IK6JOvAhh39oX5438jzUhHqxPSXy4yfF+bK6y1Ta1J7fvurFb4iH1
 e6fCm04k8/i4iMjrz5TDJwL6BcFDr7gfcKdQSTlRQVekGgIAW9fqUhiHMEYwuymPms
 9CAjB030EZ0TGlpFhPiqHhfkwh7toSmnjr5OBrLXhHgm9j/BYr1Bzvf6E+WhYXfK7s
 fVteOUgDi+DGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  4 May 2023 15:41:26 -0400
Message-Id: <20230504194142.3805425-43-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194142.3805425-1-sashal@kernel.org>
References: <20230504194142.3805425-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 bd90c5cd339a9d7cdc609d2d6310b80dc697070d
 ] 1. extent_cache - let's drop the largest extent_cache 2. invalidate_block
 - don't show the warnings 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puerj-00EKa8-KH
Subject: [f2fs-dev] [PATCH AUTOSEL 6.3 43/59] f2fs: relax sanity check if
 checkpoint is corrupted
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

[ Upstream commit bd90c5cd339a9d7cdc609d2d6310b80dc697070d ]

1. extent_cache
 - let's drop the largest extent_cache
2. invalidate_block
 - don't show the warnings

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c   | 10 ++++++++++
 fs/f2fs/data.c         |  4 ++++
 fs/f2fs/extent_cache.c | 22 +++++++++++++++-------
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 96af24c394c39..d4c862ccd1f72 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -152,6 +152,11 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	se = get_seg_entry(sbi, segno);
 
 	exist = f2fs_test_bit(offset, se->cur_valid_map);
+
+	/* skip data, if we already have an error in checkpoint. */
+	if (unlikely(f2fs_cp_error(sbi)))
+		return exist;
+
 	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
 		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
 			 blkaddr, exist);
@@ -202,6 +207,11 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 	case DATA_GENERIC_ENHANCE_UPDATE:
 		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
 				blkaddr < MAIN_BLKADDR(sbi))) {
+
+			/* Skip to emit an error message. */
+			if (unlikely(f2fs_cp_error(sbi)))
+				return false;
+
 			f2fs_warn(sbi, "access invalid blkaddr:%u",
 				  blkaddr);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4677656215db9..30c15acc81dbb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2235,6 +2235,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;
 
+	if (unlikely(f2fs_cp_error(sbi))) {
+		ret = -EIO;
+		goto out_put_dnode;
+	}
 	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
 
 skip_reading_dnode:
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 28b12553f2b34..bd02f0260db9b 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -23,18 +23,26 @@ bool sanity_check_extent_cache(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct extent_tree *et = fi->extent_tree[EX_READ];
 	struct extent_info *ei;
 
-	if (!fi->extent_tree[EX_READ])
+	if (!et)
+		return true;
+
+	ei = &et->largest;
+	if (!ei->len)
 		return true;
 
-	ei = &fi->extent_tree[EX_READ]->largest;
+	/* Let's drop, if checkpoint got corrupted. */
+	if (is_set_ckpt_flags(sbi, CP_ERROR_FLAG)) {
+		ei->len = 0;
+		et->largest_updated = true;
+		return true;
+	}
 
-	if (ei->len &&
-		(!f2fs_is_valid_blkaddr(sbi, ei->blk,
-					DATA_GENERIC_ENHANCE) ||
-		!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
-					DATA_GENERIC_ENHANCE))) {
+	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
+	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
+					DATA_GENERIC_ENHANCE)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
 			  __func__, inode->i_ino,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
