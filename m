Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19F6DFB14
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:17:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmdAA-0003iG-Hx;
	Wed, 12 Apr 2023 16:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmdA9-0003i9-2t
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fCIm5guctr+B9AFF1TdwFH1IVbSkXULZa9GBxUdjmpU=; b=MtvOjPBSrKvw+OsUfbpOzbPkoy
 12bMVhl1QTLG6MAGvEgkRmszeWpPXhaBefInZC2J9bN/Ox4PxI590gaSGLYX3kbqvroWzV+2FGWOz
 8r4aaDYx2d89jKbhr1FtzzbW+losrBHEiYrp/ONx7EUabiKnIsjo4IOOz9GnNC2SH2wM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fCIm5guctr+B9AFF1TdwFH1IVbSkXULZa9GBxUdjmpU=; b=VOw9++96gnyCVOfAnszCruOVJt
 3eLRB2REGdj8cGBFYHvsZeEvRNxA3hve3WIxOLt9ob2LnHLERX3DrPn9AVNbE3nNjNXL0YD44WcwV
 ash0eCNTMEnkBWsqICvcs+FgMN/uUWjPnUF8YeRhb8nyCA8hEJNqWyt3c8bbxzWeWpFw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmdA7-005RdH-FI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:17:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10FC3636D8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 16:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6678EC4339B;
 Wed, 12 Apr 2023 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681316249;
 bh=nB+s4y1cVa3fwfi6O40cHZ5sEurmUD9JrP46j7oa/iw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=tkNlceuD6IFLx3n848LVw7iSIM/8b59KKvDgNmk4GitWKO87cmeAKZ58AeH3oqhhx
 aIPXElT3Tziag0CttNFJjgVqHW1FP2hqaTvtei44x2jhhyt7qmQzIgRePxG3KEyn46
 EGuOE4eNt22DiOYlCxV7jIWTLJuIHKlAKyu+l75AaIX50/OLH5qen/4/+WliKyURl5
 Raax/uRBov0eNfmjkHKB1fUXwlGd6NxMaaZlhwebN3qmixBzsaC3L/ScUTaHrLIK37
 +B4v3OLfEUzRK8Mcz5TOq87iRpzl4hP9tGfpuo8TWhbxFU5xDQwmqiMaMmWpZCNWrk
 XaQDVCGZq4m9Q==
Date: Wed, 12 Apr 2023 09:17:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZDbZlwH5u3/nOTwL@google.com>
References: <20230407181539.4136580-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230407181539.4136580-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. extent_cache - let's drop the largest extent_cache 2.
 invalidate_block
 - don't show the warnings Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- Change log from v1: - add one more case to skip the error message 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmdA7-005RdH-FI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: relax sanity check if checkpoint is
 corrupted
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. extent_cache
 - let's drop the largest extent_cache
2. invalidate_block
 - don't show the warnings

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - add one more case to skip the error message

 fs/f2fs/checkpoint.c   | 10 ++++++++++
 fs/f2fs/extent_cache.c | 22 +++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 448ecf5000b8..64b3860f50ee 100644
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
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 9a8153895d20..bea6ab9d846a 100644
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
2.40.0.577.gac1e443424-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
