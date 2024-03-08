Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC5876AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Mar 2024 19:17:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riemJ-00005d-9Z;
	Fri, 08 Mar 2024 18:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1riemH-00005Q-Nr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 18:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Don58ETJLu3MMttJk2TjQgvjt5Qt3lhRQAH5cABWwSI=; b=FXm+85VegtuT1RsXaPAUes59M5
 s4Dc5YSKIKdbOpZU86RvFfMmNDx/bd9nS8LbX0BXFR25mVqihAg0U2zI8WcOF0fEdVS2f8mci9Tg0
 sofasA4+9eTNRpr3EHccpY3gsf/ZlUudScAMCnEf/sjcMLwiYsCapmljWmEOZ9mFTeWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Don58ETJLu3MMttJk2TjQgvjt5Qt3lhRQAH5cABWwSI=; b=P
 uoFPaffpcF2zT6BbYe7yKekfjjTLh5AN+4cse1OUOZfu6RSWlzxEIWuvHKv169dbLffjD/EUo8Y4r
 d8e83kEXvIc0lojrQAYdVOXgU6Mc8wBGG10G0LIBV9KD/aaqthWTF76j98fd4tqQ/mCLxbwyODHnI
 phsEi2/pI5zMz+OQ=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1riem7-0007zC-LV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 18:17:06 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6e66da40b18so673420b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Mar 2024 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709921811; x=1710526611; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Don58ETJLu3MMttJk2TjQgvjt5Qt3lhRQAH5cABWwSI=;
 b=TcIGCN4Wqy34Jxk8/Ntron0SvWI8FTIqjT++P9P4+zLXz+/lK+lKBi31m7aiZrDgme
 c0bOStgUmvEpObbF+8FkeSHh9pfjksIUETQN2lzE0LDBTJBVfA3+cQqU4bHZ6A/fIP22
 6TQ13JLxVKHDwr8N6PerknviOnSZTi3o7Xk33kEqj3w2iwzD2oIvbpTQOgtyX5B3Eayf
 8vNKs4hBqpjL8MT+VkLHGUXz39mpw/zKi7EAc1cKZW6yOyLMOEzzLZLjRYgwde23BTJO
 WaMKDFm05IKNVhAtkRkdrvA3NVogWNRZfQlZlOH52SPNf0xqRPa8pJEXlEhQexGH51FL
 HTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709921811; x=1710526611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Don58ETJLu3MMttJk2TjQgvjt5Qt3lhRQAH5cABWwSI=;
 b=RBlYOQ9OEjhlmN7lQA/K/7iafLHgIBFGaHhbDy0h75urCrZTMkjMZXgsvNUFiudfc7
 N/dEWqI/mGJMgB3hGrj0mvW7pq81EmfrH1JakLecGCxBoV0a/Ct+QCRBQSwYvEzlBitq
 iw2unuUfHVPqtVrCdVx+CdywhSbUzlCUrDagU9F16OaWBEyf9cQxjPw7tdPmsXPqHJSq
 HwkRxV5tHRFrCuhRQ6yYiUfSDdFfo6ipDOhPd9HG7NqmzSfzCH+jSjRPnXtctvW7bHwt
 OK31IfQVSydpEqVBm2Q9eUrldavF0sDvp1sRhlLe+CYzHTJ8fx2it0WzlcR374T+Xznv
 5ewg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg1HSEamV2NeHRtr/DKUAvSgMuavkdfRBFZ5B9SCTkqMjz+dgge6gYHf4bsenCkECLRQdsBysaFn3cppzALKzTJLkN58hX6LLiN6qh2J2iucTTMau7mA==
X-Gm-Message-State: AOJu0Ywm5RIF/sqB4KPL+izuY4lTJUUsKtCI4HxAwGMBNRqUeg1KjSTk
 Q83vNSv6nCQbF99sABEMDQD89XBfWTsaHMyEkTlvaUqnP8srk6vBH7OZed2Y
X-Google-Smtp-Source: AGHT+IGtYigR3RzqJjLWV3TyD2YNhQJOxexcT2wNT3BQn0QvCIXjwxqQX5KarsbGcgsbx0veEM/XDA==
X-Received: by 2002:a05:6a00:4f96:b0:6e5:3b8e:bb6b with SMTP id
 ld22-20020a056a004f9600b006e53b8ebb6bmr24314668pfb.7.1709921810644; 
 Fri, 08 Mar 2024 10:16:50 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:b29d:b799:71f5:b0e6])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa79f1a000000b006e6660588dasm2123737pfr.128.2024.03.08.10.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 10:16:50 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  8 Mar 2024 10:16:46 -0800
Message-ID: <20240308181646.70959-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Send reset commands to only current zones
 and finish the others. Signed-off-by: Daeho Jeong --- fsck/fsck.c | 53
 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+), 26 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1riem7-0007zC-LV
Subject: [f2fs-dev] [PATCH] f2fs-tools: reset only current zones
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

Send reset commands to only current zones and finish the others.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 3461a52..5b32d1f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3288,38 +3288,39 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 
 	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
 
-	/*
-	 * When there is no valid block in the zone, check write pointer is
-	 * at zone start. If not, reset the write pointer.
-	 */
-	if (last_valid_blkoff < 0 &&
-	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
-		if (!c.fix_on) {
-			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
-			    wp_segno, wp_blkoff);
-			fsck->chk.wp_inconsistent_zones++;
-			return 0;
-		}
-
-		FIX_MSG("Reset write pointer of zone at segment 0x%x",
-			zone_segno);
-		ret = f2fs_reset_zone(wpd->dev_index, blkz);
-		if (ret) {
-			printf("[FSCK] Write pointer reset failed: %s\n",
-			       dev->path);
-			return ret;
-		}
-		fsck->chk.wp_fixed = 1;
-		return 0;
-	}
-
 	/* if a curseg points to the zone, do not finishing zone */
 	for (i = 0; i < NO_CHECK_TYPE; i++) {
 		struct curseg_info *cs = CURSEG_I(sbi, i);
 
 		if (zone_segno <= cs->segno &&
-				cs->segno < zone_segno + segs_per_zone)
+				cs->segno < zone_segno + segs_per_zone) {
+			/*
+			 * When there is no valid block in the zone, check
+			 * write pointer is at zone start. If not, reset
+			 * the write pointer.
+			 */
+			if (last_valid_blkoff < 0 &&
+			    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
+				if (!c.fix_on) {
+					MSG(0, "Inconsistent write pointer: "
+					       "wp[0x%x,0x%x]\n",
+					       wp_segno, wp_blkoff);
+					fsck->chk.wp_inconsistent_zones++;
+					return 0;
+				}
+
+				FIX_MSG("Reset write pointer of zone at "
+					"segment 0x%x", zone_segno);
+				ret = f2fs_reset_zone(wpd->dev_index, blkz);
+				if (ret) {
+					printf("[FSCK] Write pointer reset "
+					       "failed: %s\n", dev->path);
+					return ret;
+				}
+				fsck->chk.wp_fixed = 1;
+			}
 			return 0;
+		}
 	}
 
 	/*
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
