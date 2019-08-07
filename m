Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56784DB8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 15:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvMBQ-0003Ov-SB; Wed, 07 Aug 2019 13:40:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hvMBO-0003On-Vn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 13:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BPx439KzllZydJqyT0u2ZTmSZoa/Tui3w3Vi9Q8Zq70=; b=LLJZVALywPz/upaakvi+Yb9qvn
 ZrpSKqAUmw+Q5RIlXHNKvB66rFa6Wbqneosrf0lhbDvzRm+kvf1NKchBUax36HJgvYkzpP9cHemgh
 i788Edw+dLEQwm9kDlXlAR9IWUShhE9KgJ4Q5EyrqcmQX19PorLUsHySBYnNJLp4RsGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BPx439KzllZydJqyT0u2ZTmSZoa/Tui3w3Vi9Q8Zq70=; b=BLnlvz+UvifZice3v3cH6OfaEW
 Vo64SaTYWpYRXkW0fLjhkJaVCEJrkQv/WqHPCpOtM8FGVdDBZ8R7f2tJgRuFu8Nwfv0yjbYDSmdiD
 8F4839X1GVD5ZB8FY3Fva42qRVPut10tjSQ2WPXUw7iCI2HEX1+OR3MokjQYUOu0QSbw=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvMBM-00EOzP-R1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 13:40:50 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 23A8D619F2; Wed,  7 Aug 2019 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565185243;
 bh=2ctQI7ksz5xKrHUuXNg+YH1WF2zddGhr0Kg45zAzT4A=;
 h=From:To:Cc:Subject:Date:From;
 b=IvuRLoiQovQ4Krf++iFw5k6IHQ3UKgPyTIAQUJn+8qL/vq9c1CXPMFbDgeEMPZHqi
 jmtZtziOyhsgZ4gMUuBG9xlAQuFZ0Mk35/+94BwNswUY/4ImBkxXy79lGk3AZNSN1A
 7W2s39h8hnsRGIWMOAD8RTe1GQD8IBEqYlym+PKA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1CD3619D0;
 Wed,  7 Aug 2019 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565185242;
 bh=2ctQI7ksz5xKrHUuXNg+YH1WF2zddGhr0Kg45zAzT4A=;
 h=From:To:Cc:Subject:Date:From;
 b=ew6L2mhg9jgXMm9daju0iV0+5HWa7iVAqJjwgr2IfwdtouJ2szo/zL4oP9jJGVNsF
 x/iU1hdHevfyNBgoj++5GQBonds9v8xJYAjLPXtojLnQZTOoZiNP7RFSnzQxIBW4i8
 I6CgC28PE4zLZnu/I3zRm67nhHNM8X9dUi+MaCCE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1CD3619D0
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Aug 2019 19:10:32 +0530
Message-Id: <1565185232-11506-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hvMBM-00EOzP-R1
Subject: [f2fs-dev] [PATCH v4] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Policy - Foreground GC, LFS and greedy GC mode.

Under this policy, f2fs_gc() loops forever to GC as it doesn't have
enough free segements to proceed and thus it keeps calling gc_more
for the same victim segment.  This can happen if the selected victim
segment could not be GC'd due to failed blkaddr validity check i.e.
is_alive() returns false for the blocks set in current validity map.

Fix this by keeping track of such invalid segments and skip those
segments for selection in get_victim_by_default() to avoid endless
GC loop under such error scenarios. Currently, add this logic under
CONFIG_F2FS_CHECK_FS to be able to root cause the issue in debug
version.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v4: Cover all logic with CONFIG_F2FS_CHECK_FS

 fs/f2fs/gc.c      | 31 +++++++++++++++++++++++++++++--
 fs/f2fs/segment.c | 14 +++++++++++++-
 fs/f2fs/segment.h |  3 +++
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8974672..cbcacbd 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -382,6 +382,16 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			nsearched++;
 		}
 
+#ifdef CONFIG_F2FS_CHECK_FS
+		/*
+		 * skip selecting the invalid segno (that is failed due to block
+		 * validity check failure during GC) to avoid endless GC loop in
+		 * such cases.
+		 */
+		if (test_bit(segno, sm->invalid_segmap))
+			goto next;
+#endif
+
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
 		if (sec_usage_check(sbi, secno))
@@ -602,8 +612,15 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 {
 	struct page *node_page;
 	nid_t nid;
-	unsigned int ofs_in_node;
+	unsigned int ofs_in_node, segno;
 	block_t source_blkaddr;
+	unsigned long offset;
+#ifdef CONFIG_F2FS_CHECK_FS
+	struct sit_info *sit_i = SIT_I(sbi);
+#endif
+
+	segno = GET_SEGNO(sbi, blkaddr);
+	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 
 	nid = le32_to_cpu(sum->nid);
 	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
@@ -627,8 +644,18 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
 	f2fs_put_page(node_page, 1);
 
-	if (source_blkaddr != blkaddr)
+	if (source_blkaddr != blkaddr) {
+#ifdef CONFIG_F2FS_CHECK_FS
+		if (unlikely(check_valid_map(sbi, segno, offset))) {
+			if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
+				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
+						blkaddr, source_blkaddr, segno);
+				f2fs_bug_on(sbi, 1);
+			}
+		}
+#endif
 		return false;
+	}
 	return true;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac3..ee795b1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -806,6 +806,9 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+#ifdef CONFIG_F2FS_CHECK_FS
+	struct sit_info *sit_i = SIT_I(sbi);
+#endif
 
 	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
 		dirty_i->nr_dirty[dirty_type]--;
@@ -817,9 +820,13 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
 			dirty_i->nr_dirty[t]--;
 
-		if (get_valid_blocks(sbi, segno, true) == 0)
+		if (get_valid_blocks(sbi, segno, true) == 0) {
 			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
 						dirty_i->victim_secmap);
+#ifdef CONFIG_F2FS_CHECK_FS
+			clear_bit(segno, sit_i->invalid_segmap);
+#endif
+		}
 	}
 }
 
@@ -4015,6 +4022,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_i->sit_bitmap_mir = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
 	if (!sit_i->sit_bitmap_mir)
 		return -ENOMEM;
+
+	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!sit_i->invalid_segmap)
+		return -ENOMEM;
 #endif
 
 	/* init SIT information */
@@ -4517,6 +4528,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 	kvfree(sit_i->sit_bitmap);
 #ifdef CONFIG_F2FS_CHECK_FS
 	kvfree(sit_i->sit_bitmap_mir);
+	kvfree(sit_i->invalid_segmap);
 #endif
 	kvfree(sit_i);
 }
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b746028..9370d53 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -229,6 +229,9 @@ struct sit_info {
 	char *sit_bitmap;		/* SIT bitmap pointer */
 #ifdef CONFIG_F2FS_CHECK_FS
 	char *sit_bitmap_mir;		/* SIT bitmap mirror */
+
+	/* bitmap of segments to be ignored by GC in case of errors */
+	unsigned long *invalid_segmap;
 #endif
 	unsigned int bitmap_size;	/* SIT bitmap size */
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
