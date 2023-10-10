Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 079537C04BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Oct 2023 21:36:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qqIX3-0004s1-Jj;
	Tue, 10 Oct 2023 19:36:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qqIX2-0004rv-Ff
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Oct 2023 19:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=INY/SzLXsAM+QGsHgo0WCQKlaTJNpU+Xp7b/wSnGcRY=; b=LCOWU06BIvfmRlB5+aYeLzMzqE
 VueiqyYwBBWtewoYTJtDJNL3umNjhlf8gu6lFz6i54GINl+KZshdhumBi5ebAiN4VjvW0sP2u72MT
 KI/3Tb+/Jfy13p6dQ8SljqjTb58OR3F1G69raJ33rdwWB1tbmh/lYIfXFTXU6pmIebBY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=INY/SzLXsAM+QGsHgo0WCQKlaTJNpU+Xp7b/wSnGcRY=; b=k
 D3d7AX2FS/fRyLqLBSlJxr4WnsOM02bB87ULusQQLp2I/nfAswdoivDeSdx25r+K/evuWYNUhorFZ
 2JRDQZ9pRTWMP74oL2Tv45M2i7t1Ai6kqEl7RgcNNwEhgyyCD1aOFrqTxa85gw86x+1TtG1nb0u1k
 zn2pNtW1beoYeI38=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qqIWy-0005Mn-U8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Oct 2023 19:36:38 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1c8a1541233so20883235ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Oct 2023 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696966591; x=1697571391; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=INY/SzLXsAM+QGsHgo0WCQKlaTJNpU+Xp7b/wSnGcRY=;
 b=Im2DEkyvN5x+PVJVUQ6V/5DjevwJ9ND+BjrfZSSWC5KAq3/hLUB1QjC5vXRmv8rSbJ
 oOWR5G9I1zwpx9pM900lLHXo/V5rXcAgvc6NmLQPGv2SDVIToSbSlfdxtly2rkCqlnOj
 hxw8FpmyiX3R/DXWUcbGDyDlG/w/GvPa+xWqps/FIp6WPvIks3hluNtpURV7nrMge0pw
 Hc9+5Doehy/GarbOCH3xu4LKHUdpg0U9RmLso//K2MvkJNc7QQkZ2ckLZkP/HPV0OnN7
 FNveHafAeoziGVCuCwMWhw1JdrUpZxFwrlnKSDQixsU9ktTFg8S+10hh3cx1yIfQJ5ov
 nBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696966591; x=1697571391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=INY/SzLXsAM+QGsHgo0WCQKlaTJNpU+Xp7b/wSnGcRY=;
 b=i1r579c7B7B4/JY7nnU88ebui62WSJbl72zl0Qkc7wIfnE5LkUKJs/nTAZBqUCVm7G
 /drTz53lfD9BNGUk0RcE/j8ovrjLLZqo+k/atBA3A+dtwtxyrutiHfIBF2ZpXSuGfv40
 mAfGix5YjarayYldr550PiqZ/8enrcQudrzrRWrz3tJepc8+K9jdIfHcZbZ3BYg7HDM4
 pas0UTa3DnriZXBDlH/gEUUV+EoYmUh+1+pz9CeHBhA5o7hX4g9afZTMAwG5rF51HHyL
 FRHsu90Ir6RhA1CtjXvDWjRsjMYivLGrp8iDTIJ+9cYAF0eTKmH3IvDTFJ+3bycOjLJa
 xY8Q==
X-Gm-Message-State: AOJu0YyY9SxVKHsT7x9niv68E9aAS/w1218TFc2PKMDQ7JUGNbhYragl
 /qyrpJ3Efvc4uGbZwx3ewUf/F4u6qWo=
X-Google-Smtp-Source: AGHT+IGy6D6GOlaIAhGMMOonaJooiC82u2oFSkvNb9FV19mJHBuMBfhfHgdV9Vw51g2lGIiNd+CZ6A==
X-Received: by 2002:a17:903:22cb:b0:1c4:5e9e:7865 with SMTP id
 y11-20020a17090322cb00b001c45e9e7865mr19584082plg.0.1696966591381; 
 Tue, 10 Oct 2023 12:36:31 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b6de:85b9:6077:28b4])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a170902c19400b001b890009634sm12142703pld.139.2023.10.10.12.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 12:36:31 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 10 Oct 2023 12:36:28 -0700
Message-ID: <20231010193628.2629168-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We can't trust write pointers when the
 previous
 mount was not successfully unmounted. Signed-off-by: Daeho Jeong ---
 fs/f2fs/segment.c
 | 92 ++++++++++++++++++++++++++++ 1 file changed, 56 insertions(+),
 36 deletions(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qqIWy-0005Mn-U8
Subject: [f2fs-dev] [PATCH] f2fs: clean up zones when not successfully
 unmounted
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

We can't trust write pointers when the previous mount was not
successfully unmounted.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 92 ++++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d05b41608fc0..727d016318f9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4910,22 +4910,31 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	}
 
 	/*
-	 * The write pointer matches with the valid blocks or
-	 * already points to the end of the zone.
+	 * When safely unmounted in the previous mount, we can trust write
+	 * pointers. Otherwise, finish zones.
 	 */
-	if ((last_valid_block + 1 == wp_block) ||
-			(zone->wp == zone->start + zone->len))
-		return 0;
-
-	if (last_valid_block + 1 == zone_block) {
+	if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
 		/*
-		 * If there is no valid block in the zone and if write pointer
-		 * is not at zone start, reset the write pointer.
+		 * The write pointer matches with the valid blocks or
+		 * already points to the end of the zone.
 		 */
-		f2fs_notice(sbi,
-			    "Zone without valid block has non-zero write "
-			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
-			    wp_segno, wp_blkoff);
+		if ((last_valid_block + 1 == wp_block) ||
+				(zone->wp == zone->start + zone->len))
+			return 0;
+	}
+
+	if (last_valid_block + 1 == zone_block) {
+		if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
+			/*
+			 * If there is no valid block in the zone and if write
+			 * pointer is not at zone start, reset the write
+			 * pointer.
+			 */
+			f2fs_notice(sbi,
+			      "Zone without valid block has non-zero write "
+			      "pointer. Reset the write pointer: wp[0x%x,0x%x]",
+			      wp_segno, wp_blkoff);
+		}
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
 		if (ret)
@@ -4935,18 +4944,20 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 		return ret;
 	}
 
-	/*
-	 * If there are valid blocks and the write pointer doesn't
-	 * match with them, we need to report the inconsistency and
-	 * fill the zone till the end to close the zone. This inconsistency
-	 * does not cause write error because the zone will not be selected
-	 * for write operation until it get discarded.
-	 */
-	f2fs_notice(sbi, "Valid blocks are not aligned with write pointer: "
-		    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
-		    GET_SEGNO(sbi, last_valid_block),
-		    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
-		    wp_segno, wp_blkoff);
+	if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
+		/*
+		 * If there are valid blocks and the write pointer doesn't match
+		 * with them, we need to report the inconsistency and fill
+		 * the zone till the end to close the zone. This inconsistency
+		 * does not cause write error because the zone will not be
+		 * selected for write operation until it get discarded.
+		 */
+		f2fs_notice(sbi, "Valid blocks are not aligned with write "
+			    "pointer: valid block[0x%x,0x%x] wp[0x%x,0x%x]",
+			    GET_SEGNO(sbi, last_valid_block),
+			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
+			    wp_segno, wp_blkoff);
+	}
 
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
 				zone->start, zone->len, GFP_NOFS);
@@ -5020,18 +5031,27 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
-	wp_segno = GET_SEGNO(sbi, wp_block);
-	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-	wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
-
-	if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
-		wp_sector_off == 0)
-		return 0;
+	/*
+	 * When safely unmounted in the previous mount, we could use current
+	 * segments. Otherwise, allocate new sections.
+	 */
+	if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
+		wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
+		wp_segno = GET_SEGNO(sbi, wp_block);
+		wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+		wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
+
+		if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
+				wp_sector_off == 0)
+			return 0;
 
-	f2fs_notice(sbi, "Unaligned curseg[%d] with write pointer: "
-		    "curseg[0x%x,0x%x] wp[0x%x,0x%x]",
-		    type, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
+		f2fs_notice(sbi, "Unaligned curseg[%d] with write pointer: "
+			    "curseg[0x%x,0x%x] wp[0x%x,0x%x]", type, cs->segno,
+			    cs->next_blkoff, wp_segno, wp_blkoff);
+	} else {
+		f2fs_notice(sbi, "Not successfully unmounted in the previous "
+			    "mount");
+	}
 
 	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
-- 
2.42.0.609.gbb76f46606-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
