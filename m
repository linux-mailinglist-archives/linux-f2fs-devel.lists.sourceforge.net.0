Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D133AA69E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 May 2025 06:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2e5FSSnTHkDsJRrrwk5qJCo2H4AM6YvFirflFrSuEA=; b=bTUV8xeqrSuY9k9WQ0Eg2A2HUB
	hE+HGJ599+Jwg/+lcrT7WCa4YZ+OchO8wA6HPmCTuT+WEpYWKHo29d2L2Yu7Wn/cUG0jpNGYYrqLm
	n9H8gyuYMPYb+ZihnxbcS1vrFyR0VhIVu2GWf24Yqqr/GI9C8BU/jAdWV1QAFSOjJNnU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAiEL-00005f-5g;
	Fri, 02 May 2025 04:42:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uAiEJ-00005Y-7a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 04:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xbRzLoLD20tUTo2OkI2z3n6SCSvUPX+Z5Ylk7Nj5e8=; b=Ojn6kXt0ACuLPXQc9KhBVTLaJx
 epuKLHrWPeKu3hH9TA43+TtMADHgQssCsXf971FsbvMfvnjutdh1o3vCYOxTIoKyyo3EwNwClcf8+
 Qngo31+khA6NHus2qKirni5yQbLPRy7sGTIZza0KW2reESKALw5q9hnOxfmQjWWlGTV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4xbRzLoLD20tUTo2OkI2z3n6SCSvUPX+Z5Ylk7Nj5e8=; b=T
 ck5nZmlbSecCgnR8tNX4eM+JQtqwKnyKUlCA0RktqMiVFTb2pLnSX58awi8fxU5Z1syDiEFjP6xnT
 uGnszLSehqHUnePTOGSroVUA1LrcAAp7CHlEVwCCx7C09VgxGOfMiYjiSKfSTVDJgPllvj1vkHfok
 r6IhSgR+/YdIK/3Y=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uAiE1-00030t-RF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 04:42:31 +0000
X-AuditID: a67dfc59-03fff7000000aab6-39-68144d1992a3
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Fri,  2 May 2025 13:41:44 +0900
Message-ID: <20250502044146.552-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnoa6kr0iGQXuLvsXpqWeZLKa272W0
 eLJ+FrPFpUXuFpd3zWFzYPVYsKnUY9OqTjaP3Qs+M3l83iQXwBLFZZOSmpNZllqkb5fAldH0
 8xtbwSHeir7fG5gbGBu5uxg5OSQETCQ6D1xl6WLkALM377IDCbMJaEj86e1lBrFFBJwk/t9o
 Z+9i5OJgFmhjlGg/2sQKkhAWKJa4MfM6G4jNIqAqse7AdDCbV8BU4v7v1ywQ8zUldnw5zwQR
 F5Q4OfMJWJxZQF6ieetsZoiat6wSP+ZYQdiSEgdX3GCZwMg7C0nLLCQtCxiZVjGKZOaV5SZm
 5hjrFWdnVOZlVugl5+duYgSG17LaP5E7GL9dCD7EKMDBqMTDG1AgnCHEmlhWXJl7iFGCg1lJ
 hDfGACjEm5JYWZValB9fVJqTWnyIUZqDRUmc1+hbeYqQQHpiSWp2ampBahFMlomDU6qBUeLL
 Zs/3ra7NfdXCZZ8vLVwrIN4hpqJooSmsKW1+4sqEXKE/S74c6Kzdt6dYwiZq4e72KN9p3Ic8
 8qzlXSyNJZN2LCngtGZQZ1etv/za1/nxZYVJhVW3L3/hudR4ynXRj69nuneLTGa1MGyd4P5H
 Z9MaNuXFFkIvc6VNAnvmaRzUEbidvq1KiaU4I9FQi7moOBEASLZSBysCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LhmqEyR1fSVyTD4PNvOYvTU88yWUxt38to
 8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
 yyYlNSezLLVI3y6BK6Pp5ze2gkO8FX2/NzA3MDZydzFycEgImEhs3mXXxcjJwSagIfGnt5cZ
 xBYRcJL4f6OdvYuRi4NZoI1Rov1oEytIQligWOLGzOtsIDaLgKrEugPTwWxeAVOJ+79fs4DY
 EgKaEju+nGeCiAtKnJz5BCzOLCAv0bx1NvMERq5ZSFKzkKQWMDKtYhTJzCvLTczMMdMrzs6o
 zMus0EvOz93ECAyZZbV/Ju1g/HbZ/RCjAAejEg9vQIFwhhBrYllxZe4hRgkOZiUR3hgDoBBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXFer/DUBCGB9MSS1OzU1ILUIpgsEwenVANj/9xQxfuxsy6u
 Xnv1+7ULD6aJs2wu6dU8c7zQ7p//upiNL9UX5vBPn7Ijd5H2BrEjQdoLl0uobXhfrnie2XnX
 t6ql3bv5L0RtcZ/t+Tg8QW6HcRm7ZLjf7Yeuu6wmVN1icXpy/v7da2qVWbWMyRd63racvFD+
 ZcnMDVYGloXhsxWPPs3atP/6fyWW4oxEQy3mouJEAOc8jr8VAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In LFS mode, the previous segment cannot use invalid blocks, 
 so the remaining blocks from the next_blkoff of the current segment to the
 end of the section are calculated. Signed-off-by: yohan.joung
 <yohan.joung@sk.com>
 --- fs/f2fs/segment.h | 21 +++++++++++++++++---- 1 file changed,
 17 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uAiE1-00030t-RF
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Add a method for calculating the
 remaining blocks in the current segment in LFS mode.
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 03c0f59be5a8..345da052f0e1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -582,8 +582,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 		if (unlikely(segno == NULL_SEGNO))
 			return false;
 
-		left_blocks = CAP_BLKS_PER_SEC(sbi) -
-				get_ckpt_valid_blocks(sbi, segno, true);
+		if (f2fs_lfs_mode(sbi)) {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
+				CURSEG_I(sbi, i)->next_blkoff;
+		} else {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
 
 		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
 		if (blocks > left_blocks)
@@ -596,8 +602,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	if (unlikely(segno == NULL_SEGNO))
 		return false;
 
-	left_blocks = CAP_BLKS_PER_SEC(sbi) -
-			get_ckpt_valid_blocks(sbi, segno, true);
+	if (f2fs_lfs_mode(sbi)) {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
+				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
+	} else {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				get_ckpt_valid_blocks(sbi, segno, true);
+	}
+
 	if (dent_blocks > left_blocks)
 		return false;
 	return true;
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
