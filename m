Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE260EA50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Oct 2022 22:37:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onn9W-0000pM-4z;
	Wed, 26 Oct 2022 20:37:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1onn9R-0000pF-N8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 20:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E4lxokYhYjyrY+eJ/2g09/TYUAolZ5grkBwanZ6fcuI=; b=I8ZyHA+ozg82MuFLwNmNgR6sjW
 qQSB4tOUYs0djhizD1JmRIn351yAvlp0hOQ7oBuPcKqeDkDJjkVm1EiNdFS3FFWdWej9/l+Mj/EHd
 mGMDxwGGVzdIv1xaKu/vlzYGjP+mFjVkC/D8v3Rc2kD09TbYCT6ZmrD6eHKAgGvYgh5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E4lxokYhYjyrY+eJ/2g09/TYUAolZ5grkBwanZ6fcuI=; b=ObD0vuvrtHIB5DRF3VW8Vezq+v
 2YQ/Ri/XwDkUiAtge0gU+BtJkLCRmwDEmcRqm1Z1F883Zfus2HB7bInWAaY7m5IM97xKTC7Pn1pq+
 +xhJenoRxmLg49lk1tCOAADnTst1eK0Y5REJa6EmE3hB3FK8o2iIe/unSi8VqX0OdFJ0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onn9N-0003Gp-6o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 20:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7C3FB82406
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Oct 2022 20:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694D1C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Oct 2022 20:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666816630;
 bh=Vig1+HRJpxB2D+VnrHqYioocqoDvdMH/hUkexCagckE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=p5dMBJmhFyPNGADyH4dsnwR1B4Z18g5UTwqDhH0XPIh6OWEi2uamH9pHiEpYcLrVx
 y74Nk0nN/7gecAevSjG4GBY7gIvtn5VR5QJiuiQkQpLhjNoAmviUT26a+ploGevy9T
 Gc1LrhB07Vbw3WHy9OT6ibtLOmuY2rF5+txMXGDSJkFbYbLUGguqReNxWZWfA59IHP
 ms5sKQa9kPQY/Tv1sczy3gCi1sBu4KlmH8HEUnY2/MqiBw7QfxFhqFMA7nLxRA6/i1
 jrrhpZLPRarhIV1JlVdkw42dFTly0Z38oZ+eqs8w0TNodRvnDTSGxhKiz4ew2QxxZU
 C01+8qyZHOSWQ==
Date: Wed, 26 Oct 2022 13:37:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y1madFzorL21gGZK@google.com>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010221548.2728860-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs becomes more resilient for GCs,
 let's give the marginal
 overprovision space back to user. Fix an issue where reserved_space >
 ovp_space, 
 reported by Shinichiro. Signed-off-by: Shinichiro Kawasaki
 <shinichiro.kawasaki@wdc.com>
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onn9N-0003Gp-6o
Subject: Re: [f2fs-dev] [PATCH 1/3 v2] f2fs-tools: give less
 overprovisioning space
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

As f2fs becomes more resilient for GCs, let's give the marginal overprovision
space back to user.

Fix an issue where reserved_space > ovp_space, reported by Shinichiro.

Signed-off-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - adjust ovp should be larger than reserved to kick f2fs runtime GCs

 fsck/resize.c      | 12 +++++++++---
 include/f2fs_fs.h  |  7 +++++--
 mkfs/f2fs_format.c |  8 ++++++--
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 3d8ea466dacd..c545dd950743 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -150,7 +150,7 @@ safe_resize:
 		c.new_overprovision = get_best_overprovision(sb);
 
 	c.new_reserved_segments =
-		(2 * (100 / c.new_overprovision + 1) + 6) *
+		(100 / c.new_overprovision + 1 + NR_CURSEG_TYPE) *
 						get_sb(segs_per_sec);
 
 	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
@@ -475,8 +475,13 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	set_cp(overprov_segment_count, (get_newsb(segment_count_main) -
 			get_cp(rsvd_segment_count)) *
 			c.new_overprovision / 100);
+
+	/* give 2 sections (DATA and NODE) to trigger GC in advance */
+	if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
+		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
+
 	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-						get_cp(rsvd_segment_count));
+						2 * get_sb(segs_per_sec));
 
 	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
 	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
@@ -607,7 +612,8 @@ static int f2fs_resize_check(struct f2fs_sb_info *sbi, struct f2fs_super_block *
 	overprov_segment_count = (get_newsb(segment_count_main) -
 			c.new_reserved_segments) *
 			c.new_overprovision / 100;
-	overprov_segment_count += c.new_reserved_segments;
+
+	overprov_segment_count += 2 * get_newsb(segs_per_sec);
 
 	user_block_count = (get_newsb(segment_count_main) -
 			overprov_segment_count) * c.blks_per_seg;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 5fa9931648cf..333ae07a5ebd 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1631,10 +1631,13 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 	}
 
 	for (; candidate <= end; candidate += diff) {
-		reserved = (2 * (100 / candidate + 1) + 6) *
+		reserved = (100 / candidate + 1 + NR_CURSEG_TYPE) *
 				round_up(usable_main_segs, get_sb(section_count));
 		ovp = (usable_main_segs - reserved) * candidate / 100;
-		space = usable_main_segs - reserved - ovp;
+		if (ovp < 0)
+			continue;
+		space = usable_main_segs - max(reserved, ovp) -
+					2 * get_sb(segs_per_sec);
 		if (max_space < space) {
 			max_space = space;
 			max_ovp = candidate;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f19a6c5a27d6..f4a49acc498c 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -484,7 +484,7 @@ static int f2fs_prepare_super_block(void)
 		c.overprovision = get_best_overprovision(sb);
 
 	c.reserved_segments =
-			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
+			(100 / c.overprovision + 1 + NR_CURSEG_TYPE) *
 			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
@@ -764,8 +764,12 @@ static int f2fs_write_check_point_pack(void)
 	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
+
+	if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
+		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
+
 	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-			get_cp(rsvd_segment_count));
+			2 * get_sb(segs_per_sec));
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
-- 
2.38.0.135.g90850a2211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
