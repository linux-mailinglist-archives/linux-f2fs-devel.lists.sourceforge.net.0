Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93A803C3B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 19:05:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rADJz-0002sP-Do;
	Mon, 04 Dec 2023 18:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rADJo-0002sH-54
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42FM9Lmlz3ljAIiJllHUD6LJzJkhOHhnO7eCP4sRhgQ=; b=DRrAu3lkC3gaEuboEUiaQF2gi6
 m4ThnQEqOBHMmCJGus7eSv2/0/qPgZ+FVdnEB2qY4vnQzoKWY7RWq0vMX+Pbkmkm5TmGnVZX92bVE
 KzOpSbs2y8S1CcfoyxUBGJ2VlPA8PAyUcS7CQDwYjfEmoQrZu5O36STWDqEF9ErVo28Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=42FM9Lmlz3ljAIiJllHUD6LJzJkhOHhnO7eCP4sRhgQ=; b=J
 pkc5msFPIEhFNQCO8yDCTge+kunh/r/lCOCB08ntEWhZGxXm3PAu15INc/uVviQJW16MkAYa6TlDi
 csgj85cPb/taAb5Ns084Me9HEYdIcUZJ1aYRj9LMKspL3EkxuV2YF4OBNwPXEOcA8qzmhfj7Iqu5v
 19IFSNq/TNJNHY1w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rADJl-0003Tr-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B43BD61012
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Dec 2023 18:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B42C433C8;
 Mon,  4 Dec 2023 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701713070;
 bh=mUugqGoNQY22hq7LD3Ng4JWWKEvMHSmLjfx04YNhku8=;
 h=From:To:Cc:Subject:Date:From;
 b=Ur12VQb4BP2PBWEsFOMmdyNuhOyOq9zdSRy80z1wC0D7+LaHAetoEvrqRb8zl2OrA
 V6RUsswTmytl3T/Q13d4lM8GRErmj202ovcKxAKrbhk+YnskL2w2+5Nq8eHkrxWsSA
 U2ytjP22b1y1jF4ckQB7Hs47rrKovgL1lslvSRsTvx93ilLOhIqHfJ9x+cdD0LjX8u
 oFYTcniGkb2iMOVXhyuHeDgrQ+8HQHyu9uiYJdaFF5AXSmyXEkOk4LkSb4bdzbSi5B
 HOAihdb8gM/T0oxKmrfe0hdiPqSB7hNaTXN/qGqnsvchwh26BFRLDq6SMfwBz/qrNy
 2IRyswgB7RFHg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Dec 2023 10:04:25 -0800
Message-ID: <20231204180428.925779-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If fsck can allocate a new zone, it'd be better to use that
 instead of allocating a new one. And,
 it modifies kernel messages. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 33 +++++++++++++++++
 1 file changed, 17 insertions(+), 16 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rADJl-0003Tr-UJ
Subject: [f2fs-dev] [PATCH 1/4] f2fs: allocate new section if it's not new
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If fsck can allocate a new zone, it'd be better to use that instead of
allocating a new one.

And, it modifies kernel messages.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 08e2f44a1264..9081c9af977a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4949,20 +4949,18 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 		return ret;
 	}
 
-	if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
-		/*
-		 * If there are valid blocks and the write pointer doesn't match
-		 * with them, we need to report the inconsistency and fill
-		 * the zone till the end to close the zone. This inconsistency
-		 * does not cause write error because the zone will not be
-		 * selected for write operation until it get discarded.
-		 */
-		f2fs_notice(sbi, "Valid blocks are not aligned with write "
+	/*
+	 * If there are valid blocks and the write pointer doesn't match
+	 * with them, we need to report the inconsistency and fill
+	 * the zone till the end to close the zone. This inconsistency
+	 * does not cause write error because the zone will not be
+	 * selected for write operation until it get discarded.
+	 */
+	f2fs_notice(sbi, "Valid blocks are not aligned with write "
 			    "pointer: valid block[0x%x,0x%x] wp[0x%x,0x%x]",
 			    GET_SEGNO(sbi, last_valid_block),
 			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
 			    wp_segno, wp_blkoff);
-	}
 
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
 				zone->start, zone->len, GFP_NOFS);
@@ -5053,15 +5051,18 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		f2fs_notice(sbi, "Unaligned curseg[%d] with write pointer: "
 			    "curseg[0x%x,0x%x] wp[0x%x,0x%x]", type, cs->segno,
 			    cs->next_blkoff, wp_segno, wp_blkoff);
-	} else {
-		f2fs_notice(sbi, "Not successfully unmounted in the previous "
-			    "mount");
 	}
 
-	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
-		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
+	/* Allocate a new section if it's not new. */
+	if (cs->next_blkoff) {
+		unsigned int old_segno = cs->segno, old_blkoff = cs->next_blkoff;
 
-	f2fs_allocate_new_section(sbi, type, true);
+		f2fs_allocate_new_section(sbi, type, true);
+		f2fs_notice(sbi, "Assign new section to curseg[%d]: "
+				"[0x%x,0x%x] -> [0x%x,0x%x]",
+				type, old_segno, old_blkoff,
+				cs->segno, cs->next_blkoff);
+	}
 
 	/* check consistency of the zone curseg pointed to */
 	if (check_zone_write_pointer(sbi, zbd, &zone))
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
