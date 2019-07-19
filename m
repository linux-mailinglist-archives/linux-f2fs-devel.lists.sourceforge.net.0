Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D26DAB3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 06:04:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoK7j-0002jZ-Su; Fri, 19 Jul 2019 04:03:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hoK7h-0002jJ-Du
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hje7GY3MD9kSj47egMuG+7c7i5qtc4xNW5xSSrUiLf4=; b=JiqP/RX2DCyhiMeO8qjQ5ND9sz
 jFpLjtw69kbtYBncPz2ZUj8oM7i9agduLIyzKIGjZZ4F9IryjQRuyJcW9NNnZYdpBeDHvRX++UeYx
 N1bWPQLhrCjCL3NMgcH0w2HNoufEy+cR5UpT0H7WIXSirvH5xL7mnQn/8G8eEXg0qVWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hje7GY3MD9kSj47egMuG+7c7i5qtc4xNW5xSSrUiLf4=; b=ejY33gJeDT1wTCxHAFATnuyYvY
 FeF/DmOZgbdAjYnlLLk5RN0Tmj8uh13vD07Hj/nbzahN06RaR0mxyQLq2NC/Sm1gxaFVb/2Mx3o6M
 SVeqOuBBaUzLVgKiF9cqlvdJgzc3cL9szzrAOqgkM5DzGGO9gpVrDl5cD+QDxKhp3P2o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoK7f-007kd2-4w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:03:56 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5EF321852;
 Fri, 19 Jul 2019 04:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509029;
 bh=xJWM+tZIoapFv4GSwx0sVFSPmPqZfVRBUqtRa8P7R8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HApRB9/gQQkXuywsTkwBsZnXrZn/zcLA7WzWUhPBXG6nhIJpWiPcUAQB1WMspeWeL
 SDbjvgDytLfwEClJCRhR3udON5KQk5f9MepyTJZYesWQ1G6OazZEkTbKjHpUe2204x
 WUoOKoX2KiZv4KT0LO40ONybMwPGIwYRFDjjXukA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 19 Jul 2019 00:00:54 -0400
Message-Id: <20190719040246.15945-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hoK7f-007kd2-4w
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 029/141] f2fs: Lower threshold for
 disable_cp_again
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daniel Rosenberg <drosen@google.com>

[ Upstream commit ae4ad7ea09d32ff1b6fb908ff12f8c1bd5241b29 ]

The existing threshold for allowable holes at checkpoint=disable time is
too high. The OVP space contains reserved segments, which are always in
the form of free segments. These must be subtracted from the OVP value.

The current threshold is meant to be the maximum value of holes of a
single type we can have and still guarantee that we can fill the disk
without failing to find space for a block of a given type.

If the disk is full, ignoring current reserved, which only helps us,
the amount of unused blocks is equal to the OVP area. Of that, there
are reserved segments, which must be free segments, and the rest of the
ovp area, which can come from either free segments or holes. The maximum
possible amount of holes is OVP-reserved.

Now, consider the disk when mounting with checkpoint=disable.
We must be able to fill all available free space with either data or
node blocks. When we start with checkpoint=disable, holes are locked to
their current type. Say we have H of one type of hole, and H+X of the
other. We can fill H of that space with arbitrary typed blocks via SSR.
For the remaining H+X blocks, we may not have any of a given block type
left at all. For instance, if we were to fill the disk entirely with
blocks of the type with fewer holes, the H+X blocks of the opposite type
would not be used. If H+X > OVP-reserved, there would be more holes than
could possibly exist, and we would have failed to find a suitable block
earlier on, leading to a crash in update_sit_entry.

If H+X <= OVP-reserved, then the holes end up effectively masked by the OVP
region in this case.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e9778f06ac0b..60373930b1b7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -876,7 +876,9 @@ void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi)
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
-	block_t ovp = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
+	int ovp_hole_segs =
+		(overprovision_segments(sbi) - reserved_segments(sbi));
+	block_t ovp_holes = ovp_hole_segs << sbi->log_blocks_per_seg;
 	block_t holes[2] = {0, 0};	/* DATA and NODE */
 	struct seg_entry *se;
 	unsigned int segno;
@@ -891,10 +893,10 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	if (holes[DATA] > ovp || holes[NODE] > ovp)
+	if (holes[DATA] > ovp_holes || holes[NODE] > ovp_holes)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
-		dirty_segments(sbi) > overprovision_segments(sbi))
+		dirty_segments(sbi) > ovp_hole_segs)
 		return -EAGAIN;
 	return 0;
 }
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
