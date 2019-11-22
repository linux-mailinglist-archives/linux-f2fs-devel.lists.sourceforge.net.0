Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B237107947
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 21:09:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iYFFR-0006oO-26; Fri, 22 Nov 2019 20:09:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iYFFG-0006nm-FJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 20:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9Dtm7PIfXw0OTDWhLZrVgrukGKnYgFBLqGdjwfqcqI=; b=MDTfu01hS6d5LgUvLa05/ny1lp
 GY0z9I4QiH69XVzDl+dxVFAUm9phbJUMFA4QJ83S5vvLgn2SdZtLOWzLSfEOjwBEYhbr8pUb/UHeE
 D5E3TyedWWuwgvvYdbGKS56XjQJJVXchtQmARFs0LKU8heELRWJdxkhs3RL1JSivS96Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A9Dtm7PIfXw0OTDWhLZrVgrukGKnYgFBLqGdjwfqcqI=; b=j
 7qLQj45/b6jBToFoglyrN/EjW+bMzadekzehDMRxLm/pbzdKGM5NjwhhWpCJZHpA7Ca7BNVFw1BGV
 7TS39KqGMC/kTcXXtSzvnx/g+IHwR7bD0+SsItWZxjMKc8pnCSBNivWlZTPcFWKYI6KtfGYL84dOc
 mPHgLVx0QeEhbDFk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iYFFF-00AZkq-3H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 20:09:34 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B9AF2068F;
 Fri, 22 Nov 2019 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574453362;
 bh=sUU5ZHY5o7dMVF1G7nOuopKx1TMsfFOufwaWDvxep14=;
 h=From:To:Cc:Subject:Date:From;
 b=p3AersLtERcCiWgiHG0s79dPmiHB2nPQF2Ibr+jLXXalGxmxpLAOkIqWFUzaMh813
 HI7a/gu38NO7AIXzEzt0eQETT1sfw7VdV6Mix+D1IQLAbfE2ZruFEtUKCk5PIgqQYD
 AZ9VfK5k9//yIe3EcYAI2HUXUC0IBnTKvYAVPgp0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Nov 2019 12:09:19 -0800
Message-Id: <20191122200920.83941-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iYFFF-00AZkq-3H
Subject: [f2fs-dev] [PATCH 1/2] f2fs: expose main_blkaddr in sysfs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Ramon Pantin <pantin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Expose in /sys/fs/f2fs/<blockdev>/main_blkaddr the block address where the
main area starts. This allows user mode programs to determine:

- That pinned files that are made exclusively of fully allocated 2MB
  segments will never be unpinned by the file system.

- Where the main area starts. This is required by programs that want to
  verify if a file is made exclusively of 2MB f2fs segments, the alignment
  boundary for segments starts at this address. Testing for 2MB alignment
  relative to the start of the device is incorrect, because for some
  filesystems main_blkaddr is not at a 2MB boundary relative to the start
  of the device.

The entry will be used when validating reliable pinning file feature proposed
by "f2fs: support aligned pinned file".

Signed-off-by: Ramon Pantin <pantin@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 Documentation/filesystems/f2fs.txt      | 3 +++
 fs/f2fs/sysfs.c                         | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7ab2b1b5e255..aedeae1e8ec1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -31,6 +31,12 @@ Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
 Description:
 		 Controls the issue rate of segment discard commands.
 
+What:		/sys/fs/f2fs/<disk>/max_blkaddr
+Date:		November 2019
+Contact:	"Ramon Pantin" <pantin@google.com>
+Description:
+		 Shows first block address of MAIN area.
+
 What:		/sys/fs/f2fs/<disk>/ipu_policy
 Date:		November 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 29020af0cff9..3135b80df6da 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -297,6 +297,9 @@ Files in /sys/fs/f2fs/<devname>
 			      reclaim the prefree segments to free segments.
 			      By default, 5% over total # of segments.
 
+ main_blkaddr                 This value gives the first block address of
+			      MAIN area in the partition.
+
  max_small_discards	      This parameter controls the number of discard
 			      commands that consist small blocks less than 2MB.
 			      The candidates to be discarded are cached until
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f164959e4224..70945ceb9c0c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -445,6 +445,7 @@ F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
+F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, main_blkaddr, main_blkaddr);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
@@ -512,6 +513,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
+	ATTR_LIST(main_blkaddr),
 	ATTR_LIST(max_small_discards),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(batched_trim_sections),
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
