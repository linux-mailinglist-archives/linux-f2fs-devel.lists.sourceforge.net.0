Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE66731DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:37:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXm-0005gi-C5;
	Thu, 19 Jan 2023 06:37:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXl-0005gQ-4O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q90SBhhzV2/wQOli658ZOhCekhuARCeHpkXve95IZF8=; b=DMYdIOvkPRF58ov1y2+61v7gix
 Oxe1VcEqyDWk9xdGCRyboJO/hbBjl0i6PY3P68x5CzDYjTp63NVSi/L6OC2In5UCIxTyl0bTLLh2X
 5YTjA4KIPyeRDg/fmFIha3gfqp2d5HrXrhPMXQQaQaeqC2mUVnJDJinIFj0OqW6wTfqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q90SBhhzV2/wQOli658ZOhCekhuARCeHpkXve95IZF8=; b=Rs3t1VNnraDbtSbcl8Ac7AClxZ
 15wi6XHOuN7ai2GPN7G7fXgjlZ44+IF2JWRwOCwo/mccvv+cifpqz7won0GU/Aifd3o+u1rdwV3Be
 xl9x6D7MOpP11Ey5/pUKEngHLzi73Bh1RABWtwIunt+niJrFeB/P+Vr+rIf/RVHysFDA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXj-008fSe-TY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q90SBhhzV2/wQOli658ZOhCekhuARCeHpkXve95IZF8=; b=c4tJ0kYNTyZTmOv6CwFucf107c
 ESUH4mM9IYf5bUteUUaaV3i01GnVRcjuPBe+1J41wuHiszLnPYd4mhf/FTNvqHs8exGlb1d9C7P7C
 ELjHROHq/CQnluKRm9mOJ7Xwuzo9ZyequrQVbc2OeN2g1H2LtY775sDVP2K8Ppmh/kUnE1j9mSXE6
 DbXslzcOBZwWogC6L0GalzJBRMe+X60OVsLJ8o/ILR6fyQib9cV+f8MB/ThUx30FITgMeXrWJtsnd
 tXd/UMbN0LPye7ure/0J8swcJ/ClhbdIzmiFm0jv0X2BVvFbXMYJlF4kyCsGumEkovG8hsX0DjFfv
 0dugKAxw==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXd-003kdk-U9; Thu, 19 Jan 2023 06:36:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:25 +0100
Message-Id: <20230119063625.466485-9-hch@lst.de>
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
 Content preview:  Just open code the logic in the only caller, where it is more
 obvious. Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/segment.c
 | 19 ++++++++ 1 file changed, 8 insertions(+), 11 deletions(-) 
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
X-Headers-End: 1pIOXj-008fSe-TY
Subject: [f2fs-dev] [PATCH 8/8] f2fs: remove __has_curseg_space
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

Just open code the logic in the only caller, where it is more
obvious.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6f588e440c7575..4646c2ca2d55c2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3071,13 +3071,6 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	return err;
 }
 
-static bool __has_curseg_space(struct f2fs_sb_info *sbi,
-					struct curseg_info *curseg)
-{
-	return curseg->next_blkoff < f2fs_usable_blks_in_seg(sbi,
-							curseg->segno);
-}
-
 int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
 {
 	switch (hint) {
@@ -3219,6 +3212,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	unsigned long long old_mtime;
 	bool from_gc = (type == CURSEG_ALL_DATA_ATGC);
 	struct seg_entry *se = NULL;
+	bool segment_full = false;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 
@@ -3245,6 +3239,8 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 			f2fs_randomize_chunk(sbi, curseg);
 	}
+	if (curseg->next_blkoff >= f2fs_usable_blks_in_seg(sbi, curseg->segno))
+		segment_full = true;
 	stat_inc_block_count(sbi, curseg);
 
 	if (from_gc) {
@@ -3263,10 +3259,11 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
 		update_sit_entry(sbi, old_blkaddr, -1);
 
-	if (!__has_curseg_space(sbi, curseg)) {
-		/*
-		 * Flush out current segment and replace it with new segment.
-		 */
+	/*
+	 * If the current segment is full, flush it out and replace it with a
+	 * new segment.
+	 */
+	if (segment_full) {
 		if (from_gc) {
 			get_atssr_segment(sbi, type, se->type,
 						AT_SSR, se->mtime);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
