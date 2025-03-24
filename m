Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC802A6D3BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 06:37:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twaUe-00088h-PD;
	Mon, 24 Mar 2025 05:37:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twaUd-00088P-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 05:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7C6TNIqZctD6LIUlz6dE/FeMhSCHc2vT2l2CPtHs+w=; b=mUZ9ZQQZbXDMSKzxlTvKmGIBE2
 x750cuO4+CwidbKpYkQ5HWkSE7vkcD+WO1CbQ/kAHGySBH+Po1ZoykVIt1jqUQ3Cckzt+vAz0WzuV
 YuCoRHEeJ1ZMSghUFO+xgdTbP7zWmU+EVtbCWRz53TkeYdyP4dksGhy/FMapAJQSpo4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F7C6TNIqZctD6LIUlz6dE/FeMhSCHc2vT2l2CPtHs+w=; b=m
 oUZXj+Mp4QDdyE/G//gobHAbsaq+UfsquLDj9bBrMOeXISrG20tf4A3dTPIMgheu5Vkgz4IvIS9A/
 qdF27+UMCYJ8vWzNZvM6mYTR0ThLCnlK06jPEdg6Jkjjkro+8d5Yxb7WW/ZZyWda5lEzB2ee+u4zN
 tDfrIdpRcUFFDows=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twaUd-0005H0-Gg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 05:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 29BFE61120
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 05:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A7DC4CEDD;
 Mon, 24 Mar 2025 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742794608;
 bh=u4yEktxJvgOGBUZwhHlqH1uqxxYmBZCPi0ZXCvWkUpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Bu53RRUbFe0nltpJyocKhlHOChRZ7fsUBE6XAGlQB0ffphbiXtGh/Db480ZxXZhmg
 x6leV+ZKvXmZ8sJ2rJxMyPC2DgFPjNSRuw0gfqFw70uFGtzBAVG2nTJapn+2d0KDaS
 fdSZDM9mW/M19O/Js3KFa+kBhF7WMTUtTTU8JFc0QvC4N6pocATvM829OxLxZ34oPZ
 uwHpNEQ3WrdMwluQ7e8v9BFmhT2Iga4traq7KmaYvy1os2N8r8w5rcGSIkSKUuro6H
 Jhf9oVfoez2S059QHyyQjMXIPdUtQNhUWoP2POeql1c+qQPk/JHALLEoC1uQ29Odjz
 Z3A8ilSP7b8uA==
To: jaegeuk@kernel.org
Date: Mon, 24 Mar 2025 13:36:39 +0800
Message-ID: <20250324053639.2996261-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. create_null_blk.sh 512 2 1024 1024 "Created /dev/nullb0"
 2. mkfs.f2fs -m /dev/nullb0 3. fsck.f2fs /dev/nullb0 "[FSCK] free
 segment_count matched with CP [Fail] [0x7e8, 0x7e7]" 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twaUd-0005H0-Gg
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: fix to calculate total segments
 correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. create_null_blk.sh 512 2 1024 1024
"Created /dev/nullb0"

2. mkfs.f2fs -m /dev/nullb0

3. fsck.f2fs /dev/nullb0
"[FSCK] free segment_count matched with CP             [Fail] [0x7e8, 0x7e7]"

For the case: there is only one host managed device, and the device has
both convential zones and sequential zones, we didn't calculate total
segments correctly, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs_zoned.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 89ba5ad..6730bba 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -539,6 +539,14 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 		return get_sb(segment_count_main);
 
 	for (i = 0; i < c.ndevs; i++) {
+		/*
+		 * for the case: there is only one host managed device, and
+		 * the device has both convential zones and sequential zones.
+		 */
+		if (c.ndevs == 1) {
+			usable_segs += c.devices[i].total_segments;
+			break;
+		}
 		if (c.devices[i].zoned_model != F2FS_ZONED_HM) {
 			usable_segs += c.devices[i].total_segments;
 			continue;
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
