Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 725665FA798
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Oct 2022 00:16:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oi142-0007NJ-I4;
	Mon, 10 Oct 2022 22:15:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oi141-0007NC-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrE5MTYJQKbKVrV0dNPfwimBQ/yEyWEfCRZhjiOkbig=; b=I+cd+gnNGvjdgbZwJEjVN3TNPb
 DpRAJuhKrr97WWHh+L6hOSa8MqC/ZoxFdNarU51Gij6NCICXg2cxLW5SbtIq0KE4zZ8+teeK4BTBN
 CdzEturxb5GLYG2Tiommo0jdK6nRW1St2ZXZEeep+p4oVFMHLaMto9sRZLpiOONjjL68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YrE5MTYJQKbKVrV0dNPfwimBQ/yEyWEfCRZhjiOkbig=; b=U
 Neo5Q/niB6ggKBx9xANXnX9H94v8vNyXNOWGUAxxtS2zTeQd8DavC+JiA4Q1LTIi803UzG6UXN15E
 K/BKcpKe7LRNgIgivKODBx2cAUcIIEb4ffJJZ9Ezry2uNt7ytwnEU6DxU1OSLqX/JNYO+QRTMAUNt
 ahE9/aOX9LlN/4G4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oi140-001Qqj-4x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9B4C61035
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Oct 2022 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A376C433D6;
 Mon, 10 Oct 2022 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665440150;
 bh=T7d/Lk1p3bpEMjqFqlLDQQoMrHQ8pCgJmNYnAdOscw4=;
 h=From:To:Cc:Subject:Date:From;
 b=FhClyaxNiudotiPb5GqiTQqMJlG5tL/tlaNu+bMQ2DjhB9oeIEVJOFxryiErflREj
 TLGtW7iv2bgeVS/p8SxLrz3RGN0OHLZVTJt4mBOHx5GJKf781WsgNr49ZFFOrKVYTD
 /SPWUembpkWyTOH2gvC7sYO+4BNsKt6YYmRp/26SSiL+UbpG8awRF6g2/PKyV5LK1a
 ODmWvz0MDvXKATF9/6ETUGXS31V1vDLspnVVSJ1dJSKfJcFBLMuj7b02pRs+D19vat
 v7jjY0RRgQIkH9U1kSTzEeraz/NbPfaw4uYNjAEnqKr0qApnSvPmoRGtuxwMqUrEFd
 5jW/RTPA3G5kA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 Oct 2022 15:15:46 -0700
Message-Id: <20221010221548.2728860-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs becomes more resilient for GCs,
 let's give the marginal
 overprovision space back to user. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fsck/resize.c | 8 ++++---- include/f2fs_fs.h | 6 ++++-- mkfs/f2fs_format.c
 | 9 ++++++--- 3 files changed, 14 insertions(+), 9 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oi140-001Qqj-4x
Subject: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning space
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

As f2fs becomes more resilient for GCs, let's give the marginal overprovision
space back to user.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/resize.c      | 8 ++++----
 include/f2fs_fs.h  | 6 ++++--
 mkfs/f2fs_format.c | 9 ++++++---
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 3d8ea466dacd..c048b16e76fb 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -150,7 +150,7 @@ safe_resize:
 		c.new_overprovision = get_best_overprovision(sb);
 
 	c.new_reserved_segments =
-		(2 * (100 / c.new_overprovision + 1) + 6) *
+		(100 / c.new_overprovision + 1 + NR_CURSEG_TYPE) *
 						get_sb(segs_per_sec);
 
 	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
@@ -475,8 +475,9 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	set_cp(overprov_segment_count, (get_newsb(segment_count_main) -
 			get_cp(rsvd_segment_count)) *
 			c.new_overprovision / 100);
-	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-						get_cp(rsvd_segment_count));
+
+	if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count))
+		ASSERT_MSG("Cannot support wrong overprovision ratio\n");
 
 	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
 	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
@@ -607,7 +608,6 @@ static int f2fs_resize_check(struct f2fs_sb_info *sbi, struct f2fs_super_block *
 	overprov_segment_count = (get_newsb(segment_count_main) -
 			c.new_reserved_segments) *
 			c.new_overprovision / 100;
-	overprov_segment_count += c.new_reserved_segments;
 
 	user_block_count = (get_newsb(segment_count_main) -
 			overprov_segment_count) * c.blks_per_seg;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 5fa9931648cf..8ca574aeba0f 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1631,10 +1631,12 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 	}
 
 	for (; candidate <= end; candidate += diff) {
-		reserved = (2 * (100 / candidate + 1) + 6) *
+		reserved = (100 / candidate + 1 + NR_CURSEG_TYPE) *
 				round_up(usable_main_segs, get_sb(section_count));
 		ovp = (usable_main_segs - reserved) * candidate / 100;
-		space = usable_main_segs - reserved - ovp;
+		if (reserved >= ovp)
+			continue;
+		space = usable_main_segs - ovp;
 		if (max_space < space) {
 			max_space = space;
 			max_ovp = candidate;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 8d0f41063458..5daf1a17c77d 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -484,7 +484,7 @@ static int f2fs_prepare_super_block(void)
 		c.overprovision = get_best_overprovision(sb);
 
 	c.reserved_segments =
-			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
+			(100 / c.overprovision + 1 + NR_CURSEG_TYPE) *
 			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
@@ -764,8 +764,11 @@ static int f2fs_write_check_point_pack(void)
 	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
-	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-			get_cp(rsvd_segment_count));
+
+	if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count)) {
+		MSG(0, "\tError: Wrong overprovision ratio\n");
+		goto free_cp_payload;
+	}
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
-- 
2.38.0.rc1.362.ged0d419d3c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
