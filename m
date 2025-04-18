Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A0A93114
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Apr 2025 06:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u5d25-0007Es-Ow;
	Fri, 18 Apr 2025 04:08:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u5d23-0007El-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Apr 2025 04:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TFKMM600dDMLkxpnNAnsdfgAP0OGmqEGN1HrfFlbUg=; b=Vg/tVwpCQuNDBXvrrA9bB4RZQP
 5jEPJ4ULRzqutFsMqED3qQlc/ZeBaXkzU8gG19UkGUTV8gUD4l3C1dzZzGf/QP2e4WYRGLBteP6g+
 yHMTm39yDxdRhEgyIBU7OC35iA2NcvBQufby5oN/9y/0yzXAoqtKu4I5JlkykKx6xBq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2TFKMM600dDMLkxpnNAnsdfgAP0OGmqEGN1HrfFlbUg=; b=U
 YQYwqZmb2p8vaKfk4ek2RE9bev8FD3o6qSzvpZnZDeS0Cadm2rhZIa/6FGaqw9GEbAuoavN/gfDwX
 uFIDg76oH+hg156ErjRV5FKuedW07/4GI/3XBowuyfKi52WAiVhGp+H0lO/DGz/60zEBUNJ7yVqzE
 cnJ4fUW2A4G8bNss=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u5d1l-0001zS-MG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Apr 2025 04:08:50 +0000
X-AuditID: a67dfc59-057ff7000000aab6-c5-6801d0345c5e
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Fri, 18 Apr 2025 13:08:02 +0900
Message-ID: <20250418040803.2118-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnoa7JBcYMg7/tlhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bA6vHzll32T02repk89i94DOTx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
 OxtWsBUc4q3oWnieqYGxkbuLkZNDQsBE4kzTHxYY+1PPDiYQm01AQ+JPby8ziC0iYCfR3fCN
 FcRmFmhjlLj11xfEFhbIkfjXvoOti5GDg0VAVWLyP3EQk1fATOL2l0KIiZoSO76cB5vIKyAo
 cXLmExaIKfISzVtnA03nAqp5ySrRf2MG1AmSEgdX3GCZwMg7C0nPLCQ9CxiZVjGKZOaV5SZm
 5hjrFWdnVOZlVugl5+duYgSG17LaP5E7GL9dCD7EKMDBqMTD6/CWIUOINbGsuDL3EKMEB7OS
 CO8583/pQrwpiZVVqUX58UWlOanFhxilOViUxHmNvpWnCAmkJ5akZqemFqQWwWSZODilGhiL
 4uLMa3/mNNwPe1V3b5HxdI8nG7guv30jvUo0U2x++LcSgaSFAfc7L7z+e72GpfPnyhciH/Jn
 f5/CuO1t4lJP/i+fclvOH/BMMZp0xi4w6NRLH1nO//NPzgv06Pt0a/5We50Ld1cZc8960tH5
 9IDvPIHpB45dm8M4eULc8vnMP0+9VHO5fTS2XImlOCPRUIu5qDgRADlz5ikrAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR9fkAmOGwcKpBhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFz1l12j02rOtk8di/4zOTx7baHx+dNcgGs
 UVw2Kak5mWWpRfp2CVwZOxtWsBUc4q3oWnieqYGxkbuLkZNDQsBE4lPPDiYQm01AQ+JPby8z
 iC0iYCfR3fCNFcRmFmhjlLj11xfEFhbIkfjXvoOti5GDg0VAVWLyP3EQk1fATOL2l0KIiZoS
 O76cB5vIKyAocXLmExaIKfISzVtnM09g5JqFJDULSWoBI9MqRpHMvLLcxMwcM73i7IzKvMwK
 veT83E2MwIBZVvtn0g7Gb5fdDzEKcDAq8fA6vGXIEGJNLCuuzD3EKMHBrCTCe878X7oQb0pi
 ZVVqUX58UWlOavEhRmkOFiVxXq/w1AQhgfTEktTs1NSC1CKYLBMHp1QDY9Yj3/4NrRb/GZf+
 f//82T7fai6Ntsa6UtfV6z2up7UUME3aXrEiZMuFxxVP6iI6zjd9TFp4I3Bh6bHULr29JZtf
 WIQyTDj7qWSiXWplvlpE0pnODVVdN/5rCX276TJB322C0IbPWRu6jh3bIx0reSa9YN72YD6O
 pNZtU1snvly3OqbvY+ipq0osxRmJhlrMRcWJAPocAvQUAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u5d1l-0001zS-MG
Subject: [f2fs-dev] [PATCH] f2fs: Add a method for calculating the remaining
 blocks in the current segment in LFS mode.
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
index 0465dc00b349..07c07b44e21e 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -569,8 +569,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
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
@@ -583,8 +589,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
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
