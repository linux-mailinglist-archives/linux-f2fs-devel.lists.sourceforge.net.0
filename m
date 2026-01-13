Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08647D16D0A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 07:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9vKgI5WIzoESm+5nAfMqzAq/AFmpjBmWzIS8kwgAm8=; b=hjKI3qkctjBgiET6EFxDRRf/nZ
	1LayMUBgJCHoCm3syahqwc064Em7oDP2iwMWjUGJC1wcGP/4FOnYwx9rBdH9ptfBHEE1I9JSsBgr5
	RWBZzHCjLXDFekb6zS8bidtI3b7GIm8h6tco2rXaa+g5sAdz3Jr5/RiPBGMYzC1yzoOg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfXnl-0001pN-UF;
	Tue, 13 Jan 2026 06:22:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfXnj-0001pE-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHbrSWMjhUTKn4GLPfh3IZfi2s3lpJUyzYRybQlx9A0=; b=g6cigEwetglGtDdG0D8I9uGgJc
 UrOMh2USZgHr0wFTd0ffcr2XFZ0UFKMf+GksWFk+8ETFfIPLUiQknVJpnwDP+FKsBp4ezKtreA7vP
 HDywWhWgniqr/vji4+WG6AAPcFgu1ig8ADCpCaxfZfmL+Q7Da7oAHqLiLqPo6O2QC2Hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rHbrSWMjhUTKn4GLPfh3IZfi2s3lpJUyzYRybQlx9A0=; b=S
 v1N44VrngbUcygrvRs9Qyxay4rr8g5850yhdHO8GhUOVOJT+M5SqPjjP6AJpiqCasgDN3N9SpNlRM
 PSp1T8rMerc+NBgZcWNYjNGuaPoujJdSlRfPf7vp6qdERs9Lz5Id/jUIwihlHScVY/QSIPvVLm2T9
 C4KgoKxUskDQbTuY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfXni-0004r6-QC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D52C4089B;
 Tue, 13 Jan 2026 06:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7C6C116C6;
 Tue, 13 Jan 2026 06:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768285356;
 bh=zRr7rMbJ2ARx4Z/TuMxKy5Qs8jYhMbcVBO5jFgP3AcA=;
 h=From:To:Cc:Subject:Date:From;
 b=C47KMuhZBHHN3evJwIdrdhqdmaxnguI54p9oCpUjIuo1IiIZPu8musvF96NTZhNgP
 hGKFiJ5VndeeVlfrI0HMK7inno7ehnnWzliztLg4WBE1JzuOtnDm/Oz+fze2q9XG/L
 2W5W7lRMLvKVPtS2g86+BmrxpioJC/KKiEqrjf84Lsdm3XeQh8IgFB+m+Qav2Z/INz
 HA1YPHNQPeKuEu4Tb7vIUq6d7ws6bdVheJ8UF+OIAQqduVlfW4hrFk5aN9jjxpzu9x
 ZhttcQxGtS02DnGjMcXeIPfguaTQxV6s6PYYNgi/PydryVafEU6O06FespJ+AOeBC/
 0zR+QoeUKYAdg==
To: jaegeuk@kernel.org
Date: Tue, 13 Jan 2026 14:22:29 +0800
Message-Id: <20260113062229.4062-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Xiaolong Guo reported a f2fs bug in bugzilla [1] [1]
 https://bugzilla.kernel.org/show_bug.cgi?id=220951 Quoted: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfXni-0004r6-QC
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid mapping wrong physical block
 for swapfile
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Xiaolong Guo <guoxiaolong2008@gmail.com>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Xiaolong Guo reported a f2fs bug in bugzilla [1]

[1] https://bugzilla.kernel.org/show_bug.cgi?id=220951

Quoted:

"When using stress-ng's swap stress test on F2FS filesystem with kernel 6.6+,
the system experiences data corruption leading to either:
1 dm-verity corruption errors and device reboot
2 F2FS node corruption errors and boot hangs

The issue occurs specifically when:
1 Using F2FS filesystem (ext4 is unaffected)
2 Swapfile size is less than F2FS section size (2MB)
3 Swapfile has fragmented physical layout (multiple non-contiguous extents)
4 Kernel version is 6.6+ (6.1 is unaffected)

The root cause is in check_swap_activate() function in fs/f2fs/data.c. When the
first extent of a small swapfile (< 2MB) is not aligned to section boundaries,
the function incorrectly treats it as the last extent, failing to map
subsequent extents. This results in incorrect swap_extent creation where only
the first extent is mapped, causing subsequent swap writes to overwrite wrong
physical locations (other files' data).

Steps to Reproduce
1 Setup a device with F2FS-formatted userdata partition
2 Compile stress-ng from https://github.com/ColinIanKing/stress-ng
3 Run swap stress test: (Android devices)
adb shell "cd /data/stressng; ./stress-ng-64 --metrics-brief --timeout 60
--swap 0"

Log:
1 Ftrace shows in kernel 6.6, only first extent is mapped during second
f2fs_map_blocks call in check_swap_activate():
stress-ng-swap-8990: f2fs_map_blocks: ino=11002, file offset=0, start
blkaddr=0x43143, len=0x1
(Only 4KB mapped, not the full swapfile)
2 in kernel 6.1, both extents are correctly mapped:
stress-ng-swap-5966: f2fs_map_blocks: ino=28011, file offset=0, start
blkaddr=0x13cd4, len=0x1
stress-ng-swap-5966: f2fs_map_blocks: ino=28011, file offset=1, start
blkaddr=0x60c84b, len=0xff

The problematic code is in check_swap_activate():
if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
    nr_pblocks % blks_per_sec ||
    !f2fs_valid_pinned_area(sbi, pblock)) {
    bool last_extent = false;

    not_aligned++;

    nr_pblocks = roundup(nr_pblocks, blks_per_sec);
    if (cur_lblock + nr_pblocks > sis->max)
        nr_pblocks -= blks_per_sec;

    /* this extent is last one */
    if (!nr_pblocks) {
        nr_pblocks = last_lblock - cur_lblock;
        last_extent = true;
    }

    ret = f2fs_migrate_blocks(inode, cur_lblock, nr_pblocks);
    if (ret) {
        if (ret == -ENOENT)
            ret = -EINVAL;
        goto out;
    }

    if (!last_extent)
        goto retry;
}

When the first extent is unaligned and roundup(nr_pblocks, blks_per_sec)
exceeds sis->max, we subtract blks_per_sec resulting in nr_pblocks = 0. The
code then incorrectly assumes this is the last extent, sets nr_pblocks =
last_lblock - cur_lblock (entire swapfile), and performs migration. After
migration, it doesn't retry mapping, so subsequent extents are never processed.
"

In order to fix this issue, we need to lookup block mapping info after
we migrate all blocks in the tail of swapfile.

Cc: stable@kernel.org
Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Reported-and-tested-by: Xiaolong Guo <guoxiaolong2008@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220951
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eea6311998c1..ed5e28352a92 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4196,6 +4196,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 
 	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
+		bool last_extent = false;
 retry:
 		cond_resched();
 
@@ -4221,11 +4222,10 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		pblock = map.m_pblk;
 		nr_pblocks = map.m_len;
 
-		if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
-				nr_pblocks % blks_per_sec ||
-				f2fs_is_sequential_zone_area(sbi, pblock)) {
-			bool last_extent = false;
-
+		if (!last_extent &&
+			((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
+			nr_pblocks % blks_per_sec ||
+			f2fs_is_sequential_zone_area(sbi, pblock))) {
 			not_aligned++;
 
 			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
@@ -4246,8 +4246,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
 				goto out;
 			}
 
-			if (!last_extent)
-				goto retry;
+			/* lookup block mapping info after block migration */
+			goto retry;
 		}
 
 		if (cur_lblock + nr_pblocks >= sis->max)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
