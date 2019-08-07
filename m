Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FF84835
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 10:52:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvHgT-0001ae-U2; Wed, 07 Aug 2019 08:52:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hvHgS-0001Zx-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 08:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5/67hfQ+6mnRGYBOod0HZzIh7A3Z5TMesWRpIBwsMl4=; b=WAokK1TurXEsPBDGIRfXVcYpHb
 yRQUhjO0y3oxodwl+IpAZYYr7esZCfdeRcxMtrDsWUvuxp7dHdQnKJeBfPc7ORbBdQXfS+wj0F0/o
 2vN8RfZRKqkyA+cRkGWHsoECoEzI4xP1gkHNH6yQoQmjexcGszd0bMHnJcQ+YAe/8aSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5/67hfQ+6mnRGYBOod0HZzIh7A3Z5TMesWRpIBwsMl4=; b=c/1vy7jK+Xr9BB7fOiTmfLImP1
 byBCOJN87cOmTMBAw5tFVjF5ix2e8BqXJPdSqT67Vy+e6xaBdAot86BL7RYVN8Ghq4ZRRtltD4Qoq
 xyo1ZobiAFcQZNHGVlK7/wMmSisc+Zc5aDaXSpWiDFbZKMh1pV0D7t7mSjexqCnYYKUc=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvHgO-00Dgqu-Od
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 08:52:36 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F20F761382; Wed,  7 Aug 2019 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565167943;
 bh=JaEajRU+IxjI/7TzRSEFLT1wAK8wQcmKonkieOXdyf0=;
 h=From:To:Cc:Subject:Date:From;
 b=LZO7SttvRKNiizhLkatJs1zQbxyh16UggxjHlHbgRGXynpPZ66hwiZDfxkprD7y1k
 86NdeHJVSZpmt5w69h2ZOd8mtkpCI27YuioW5DmEOVwqA6ItjE3ge/0vlVuYMKmD2O
 OpIOfPH9DxSX0YcQrhrCDdIPKxO7UfKfdS0J6ITo=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4EEDB6058E;
 Wed,  7 Aug 2019 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565167940;
 bh=JaEajRU+IxjI/7TzRSEFLT1wAK8wQcmKonkieOXdyf0=;
 h=From:To:Cc:Subject:Date:From;
 b=N8UzHViwD8VdUBwbH3A5B0CsirmWA1kNMdAVodKtfkYs2xd9v/23M7gnULVsk8OVH
 wKG6F0il+kZmnfudRCe9e3AUXu3hHvWKp/6oBA1IgzE2wA8fnBmQzeVuSU0TTE/Ebo
 hMS/JMlDDaigNjHbhWZzkBhSRiAFQJCi0qAHwg5s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4EEDB6058E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Aug 2019 14:22:07 +0530
Message-Id: <1565167927-23305-1-git-send-email-stummala@codeaurora.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hvHgO-00Dgqu-Od
Subject: [f2fs-dev] [PATCH v3] f2fs: Fix indefinite loop in f2fs_gc()
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
GC loop under such error scenarios.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v3: address Chao's comments and also add logic to clear invalid_segmap

 fs/f2fs/gc.c      | 25 +++++++++++++++++++++++--
 fs/f2fs/segment.c | 10 +++++++++-
 fs/f2fs/segment.h |  3 +++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8974672..f7b9602 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			nsearched++;
 		}
 
+		/*
+		 * skip selecting the invalid segno (that is failed due to block
+		 * validity check failure during GC) to avoid endless GC loop in
+		 * such cases.
+		 */
+		if (test_bit(segno, sm->invalid_segmap))
+			goto next;
+
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
 		if (sec_usage_check(sbi, secno))
@@ -602,8 +610,13 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 {
 	struct page *node_page;
 	nid_t nid;
-	unsigned int ofs_in_node;
+	unsigned int ofs_in_node, segno;
 	block_t source_blkaddr;
+	unsigned long offset;
+	struct sit_info *sit_i = SIT_I(sbi);
+
+	segno = GET_SEGNO(sbi, blkaddr);
+	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 
 	nid = le32_to_cpu(sum->nid);
 	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
@@ -627,8 +640,16 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
 	f2fs_put_page(node_page, 1);
 
-	if (source_blkaddr != blkaddr)
+	if (source_blkaddr != blkaddr) {
+		if (unlikely(check_valid_map(sbi, segno, offset))) {
+			if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
+				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
+						blkaddr, source_blkaddr, segno);
+				f2fs_bug_on(sbi, 1);
+			}
+		}
 		return false;
+	}
 	return true;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac3..c3ba9e7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -806,6 +806,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	struct sit_info *sit_i = SIT_I(sbi);
 
 	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
 		dirty_i->nr_dirty[dirty_type]--;
@@ -817,9 +818,11 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
 			dirty_i->nr_dirty[t]--;
 
-		if (get_valid_blocks(sbi, segno, true) == 0)
+		if (get_valid_blocks(sbi, segno, true) == 0) {
 			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
 						dirty_i->victim_secmap);
+			clear_bit(segno, sit_i->invalid_segmap);
+		}
 	}
 }
 
@@ -4017,6 +4020,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 #endif
 
+	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!sit_i->invalid_segmap)
+		return -ENOMEM;
+
 	/* init SIT information */
 	sit_i->s_ops = &default_salloc_ops;
 
@@ -4518,6 +4525,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_F2FS_CHECK_FS
 	kvfree(sit_i->sit_bitmap_mir);
 #endif
+	kvfree(sit_i->invalid_segmap);
 	kvfree(sit_i);
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b746028..3918155c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -246,6 +246,9 @@ struct sit_info {
 	unsigned long long min_mtime;		/* min. modification time */
 	unsigned long long max_mtime;		/* max. modification time */
 
+	/* bitmap of segments to be ignored by GC in case of errors */
+	unsigned long *invalid_segmap;
+
 	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
