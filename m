Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE114603A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 02:14:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuR4b-0000kx-Ct; Thu, 23 Jan 2020 01:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iuR4Y-0000kV-96
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 01:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tx1IUkqYgz4GMIh6uGukp6P5vot6Qcoy+RM0sVqmNYw=; b=V1ifdMk1SW04yTmz6vz3ZZ+AGX
 VIZDh2b8Vb7YHWYd8NQHO7JGnL1RR/YByRwm3iiSLEfRXF93Qpn1tvC53kZXBdyF5h2hgTmYtVkzS
 /09iot0tpfGA0Cmj7fXHjqv3TzmZtOdsqZN3LySPUVVbWUzOXhED22z+tppsjFgmeWxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tx1IUkqYgz4GMIh6uGukp6P5vot6Qcoy+RM0sVqmNYw=; b=R
 PmGBIkH0dgIYNV2wm5yWNw/yj72UWLjAOQuDZ56D+TFJdMsh2kap1i/8n7U+Rcb2qarJeeZdIWfpJ
 7VVouVhhlAMRl+e+nh+VHQTjtjFoEPg06ksq9YbcYE+0Uagpmqadrb+kIAXY/2Hbfa824izSd/S+n
 j9LPaHrQNNewwaro=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuR4U-00FGzQ-NH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 01:14:14 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEA392253D;
 Thu, 23 Jan 2020 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579742036;
 bh=2Ti8pvrOpnf2lhuovzT1xPLtjJgfu8I/ABWnusaCMN4=;
 h=From:To:Cc:Subject:Date:From;
 b=syHKLJmbh9bN5x5pOMqDJnLu0+zYybygI+dsT5fOuJPHiF16BO9UVYcdUK9KP6OhA
 3O+oEwcmOMLKH2XqMZ62bEDZ7AMDvzUFQOOa7nJ6OpaCXbaNHrtGpVJ559lTZGA97l
 fsL8v+35rbX+Ov3ZumkXzWYJ2fkQ0H+y1tsixjhg=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 Jan 2020 17:13:53 -0800
Message-Id: <20200123011354.75282-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iuR4U-00FGzQ-NH
Subject: [f2fs-dev] [PATCH 1/2] f2fs: delete duplicate information on sysfs
 nodes
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
Cc: Hridya Valsaraju <hridya@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hridya Valsaraju <hridya@google.com>

This patch merges the sysfs node documentation present in
Documentation/filesystems/f2fs.txt and
Documentation/ABI/testing/sysfs-fs-f2fs
and deletes the duplicate information from
Documentation/filesystems/f2fs.txt. This is to prevent having to update
both files when a new sysfs node is added for f2fs.
The patch also makes minor formatting changes to
Documentation/ABI/testing/sysfs-fs-f2fs.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 233 ++++++++++++------------
 Documentation/filesystems/f2fs.txt      | 166 -----------------
 2 files changed, 120 insertions(+), 279 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index aedeae1e8ec1..7cdaed02981a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1,37 +1,40 @@
 What:		/sys/fs/f2fs/<disk>/gc_max_sleep_time
 Date:		July 2013
 Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
-Description:
-		 Controls the maximun sleep time for gc_thread. Time
-		 is in milliseconds.
+Description:	Controls the maximum sleep time for gc_thread. Time
+		is in milliseconds.
 
 What:		/sys/fs/f2fs/<disk>/gc_min_sleep_time
 Date:		July 2013
 Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
-Description:
-		 Controls the minimum sleep time for gc_thread. Time
-		 is in milliseconds.
+Description:	Controls the minimum sleep time for gc_thread. Time
+		is in milliseconds.
 
 What:		/sys/fs/f2fs/<disk>/gc_no_gc_sleep_time
 Date:		July 2013
 Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
-Description:
-		 Controls the default sleep time for gc_thread. Time
-		 is in milliseconds.
+Description:	Controls the default sleep time for gc_thread. Time
+		is in milliseconds.
 
 What:		/sys/fs/f2fs/<disk>/gc_idle
 Date:		July 2013
 Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
-Description:
-		 Controls the victim selection policy for garbage collection.
+Description:	Controls the victim selection policy for garbage collection.
+		Setting gc_idle = 0(default) will disable this option. Setting
+		gc_idle = 1 will select the Cost Benefit approach & setting
+		gc_idle = 2 will select the greedy approach.
 
 What:		/sys/fs/f2fs/<disk>/reclaim_segments
 Date:		October 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the issue rate of segment discard commands.
-
-What:		/sys/fs/f2fs/<disk>/max_blkaddr
+Description:	This parameter controls the number of prefree segments to be
+		reclaimed. If the number of prefree segments is larger than
+		the number of segments in the proportion to the percentage
+		over total volume size, f2fs tries to conduct checkpoint to
+		reclaim the prefree segments to free segments.
+		By default, 5% over total # of segments.
+
+What:		/sys/fs/f2fs/<disk>/main_blkaddr
 Date:		November 2019
 Contact:	"Ramon Pantin" <pantin@google.com>
 Description:
@@ -40,227 +43,231 @@ Description:
 What:		/sys/fs/f2fs/<disk>/ipu_policy
 Date:		November 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the in-place-update policy.
+Description:	Controls the in-place-update policy.
+		updates in f2fs. User can set:
+		0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
+		0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
+		0x10: F2FS_IPU_FSYNC, 0x20: F2FS_IPU_ASYNC,
+		0x40: F2FS_IPU_NOCACHE.
+		Refer segment.h for details.
 
 What:		/sys/fs/f2fs/<disk>/min_ipu_util
 Date:		November 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the FS utilization condition for the in-place-update
-		 policies.
+Description:	Controls the FS utilization condition for the in-place-update
+		policies. It is used by F2FS_IPU_UTIL and F2FS_IPU_SSR_UTIL policies.
 
 What:		/sys/fs/f2fs/<disk>/min_fsync_blocks
 Date:		September 2014
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the dirty page count condition for the in-place-update
-		 policies.
+Description:	Controls the dirty page count condition for the in-place-update
+		policies.
 
 What:		/sys/fs/f2fs/<disk>/min_seq_blocks
 Date:		August 2018
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the dirty page count condition for batched sequential
-		 writes in ->writepages.
-
+Description:	Controls the dirty page count condition for batched sequential
+		writes in writepages.
 
 What:		/sys/fs/f2fs/<disk>/min_hot_blocks
 Date:		March 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the dirty page count condition for redefining hot data.
+Description:	Controls the dirty page count condition for redefining hot data.
 
 What:		/sys/fs/f2fs/<disk>/min_ssr_sections
 Date:		October 2017
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Controls the fee section threshold to trigger SSR allocation.
+Description:	Controls the free section threshold to trigger SSR allocation.
+		If this is large, SSR mode will be enabled early.
 
 What:		/sys/fs/f2fs/<disk>/max_small_discards
 Date:		November 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the issue rate of small discard commands.
+Description:	Controls the issue rate of discard commands that consist of small
+		blocks less than 2MB. The candidates to be discarded are cached until
+		checkpoint is triggered, and issued during the checkpoint.
+		By default, it is disabled with 0.
 
-What:          /sys/fs/f2fs/<disk>/discard_granularity
-Date:          July 2017
-Contact:       "Chao Yu" <yuchao0@huawei.com>
-Description:
-		Controls discard granularity of inner discard thread, inner thread
+What:		/sys/fs/f2fs/<disk>/discard_granularity
+Date:		July 2017
+Contact:	"Chao Yu" <yuchao0@huawei.com>
+Description:	Controls discard granularity of inner discard thread. Inner thread
 		will not issue discards with size that is smaller than granularity.
-		The unit size is one block, now only support configuring in range
-		of [1, 512].
+		The unit size is one block(4KB), now only support configuring
+		in range of [1, 512]. Default value is 4(=16KB).
 
-What:          /sys/fs/f2fs/<disk>/umount_discard_timeout
-Date:          January 2019
-Contact:       "Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		Set timeout to issue discard commands during umount.
-		Default: 5 secs
+What:		/sys/fs/f2fs/<disk>/umount_discard_timeout
+Date:		January 2019
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Set timeout to issue discard commands during umount.
+	        Default: 5 secs
 
 What:		/sys/fs/f2fs/<disk>/max_victim_search
 Date:		January 2014
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the number of trials to find a victim segment.
+Description:	Controls the number of trials to find a victim segment
+		when conducting SSR and cleaning operations. The default value
+		is 4096 which covers 8GB block address range.
 
 What:		/sys/fs/f2fs/<disk>/migration_granularity
 Date:		October 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Controls migration granularity of garbage collection on large
-		 section, it can let GC move partial segment{s} of one section
-		 in one GC cycle, so that dispersing heavy overhead GC to
-		 multiple lightweight one.
+Description:	Controls migration granularity of garbage collection on large
+		section, it can let GC move partial segment{s} of one section
+		in one GC cycle, so that dispersing heavy overhead GC to
+		multiple lightweight one.
 
 What:		/sys/fs/f2fs/<disk>/dir_level
 Date:		March 2014
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the directory level for large directory.
+Description:	Controls the directory level for large directory. If a
+		directory has a number of files, it can reduce the file lookup
+		latency by increasing this dir_level value. Otherwise, it
+		needs to decrease this value to reduce the space overhead.
+		The default value is 0.
 
 What:		/sys/fs/f2fs/<disk>/ram_thresh
 Date:		March 2014
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
-Description:
-		 Controls the memory footprint used by f2fs.
+Description:	Controls the memory footprint used by free nids and cached
+		nat entries. By default, 1 is set, which indicates
+		10 MB / 1 GB RAM.
 
 What:		/sys/fs/f2fs/<disk>/batched_trim_sections
 Date:		February 2015
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the trimming rate in batch mode.
-		 <deprecated>
+Description:	Controls the trimming rate in batch mode.
+		<deprecated>
 
 What:		/sys/fs/f2fs/<disk>/cp_interval
 Date:		October 2015
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the checkpoint timing.
+Description:	Controls the checkpoint timing, set to 60 seconds by default.
 
 What:		/sys/fs/f2fs/<disk>/idle_interval
 Date:		January 2016
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls the idle timing for all paths other than
-		 discard and gc path.
+Description:	Controls the idle timing of system, if there is no FS operation
+		during given interval.
+		Set to 5 seconds by default.
 
 What:		/sys/fs/f2fs/<disk>/discard_idle_interval
 Date:		September 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Contact:	"Sahitya Tummala" <stummala@codeaurora.org>
-Description:
-		 Controls the idle timing for discard path.
+Description:	Controls the idle timing of discard thread given
+		this time interval.
+		Default is 5 secs.
 
 What:		/sys/fs/f2fs/<disk>/gc_idle_interval
 Date:		September 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Contact:	"Sahitya Tummala" <stummala@codeaurora.org>
-Description:
-		 Controls the idle timing for gc path.
+Description:    Controls the idle timing for gc path. Set to 5 seconds by default.
 
 What:		/sys/fs/f2fs/<disk>/iostat_enable
 Date:		August 2017
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Controls to enable/disable IO stat.
+Description:	Controls to enable/disable IO stat.
 
 What:		/sys/fs/f2fs/<disk>/ra_nid_pages
 Date:		October 2015
 Contact:	"Chao Yu" <chao2.yu@samsung.com>
-Description:
-		 Controls the count of nid pages to be readaheaded.
+Description:	Controls the count of nid pages to be readaheaded.
+		When building free nids, F2FS reads NAT blocks ahead for
+		speed up. Default is 0.
 
 What:		/sys/fs/f2fs/<disk>/dirty_nats_ratio
 Date:		January 2016
 Contact:	"Chao Yu" <chao2.yu@samsung.com>
-Description:
-		 Controls dirty nat entries ratio threshold, if current
-		 ratio exceeds configured threshold, checkpoint will
-		 be triggered for flushing dirty nat entries.
+Description:	Controls dirty nat entries ratio threshold, if current
+		ratio exceeds configured threshold, checkpoint will
+		be triggered for flushing dirty nat entries.
 
 What:		/sys/fs/f2fs/<disk>/lifetime_write_kbytes
 Date:		January 2016
 Contact:	"Shuoran Liu" <liushuoran@huawei.com>
-Description:
-		 Shows total written kbytes issued to disk.
+Description:	Shows total written kbytes issued to disk.
 
 What:		/sys/fs/f2fs/<disk>/features
 Date:		July 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Shows all enabled features in current device.
+Description:	Shows all enabled features in current device.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
 Contact:	"Sheng Yong" <shengyong1@huawei.com>
-Description:
-		 Controls the injection rate.
+Description:	Controls the injection rate of arbitrary faults.
 
 What:		/sys/fs/f2fs/<disk>/inject_type
 Date:		May 2016
 Contact:	"Sheng Yong" <shengyong1@huawei.com>
-Description:
-		 Controls the injection type.
+Description:	Controls the injection type of arbitrary faults.
+
+What:		/sys/fs/f2fs/<disk>/dirty_segments
+Date:		October 2017
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Shows the number of dirty segments.
 
 What:		/sys/fs/f2fs/<disk>/reserved_blocks
 Date:		June 2017
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Controls target reserved blocks in system, the threshold
-		 is soft, it could exceed current available user space.
+Description:	Controls target reserved blocks in system, the threshold
+		is soft, it could exceed current available user space.
 
 What:		/sys/fs/f2fs/<disk>/current_reserved_blocks
 Date:		October 2017
 Contact:	"Yunlong Song" <yunlong.song@huawei.com>
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Shows current reserved blocks in system, it may be temporarily
-		 smaller than target_reserved_blocks, but will gradually
-		 increase to target_reserved_blocks when more free blocks are
-		 freed by user later.
+Description:	Shows current reserved blocks in system, it may be temporarily
+		smaller than target_reserved_blocks, but will gradually
+		increase to target_reserved_blocks when more free blocks are
+		freed by user later.
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent
 Date:		August 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Do background GC agressively
+Description:	Do background GC agressively when set. When gc_urgent = 1,
+		background thread starts to do GC by given gc_urgent_sleep_time
+		interval. It is set to 0 by default.
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent_sleep_time
 Date:		August 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:
-		 Controls sleep time of GC urgent mode
+Description:	Controls sleep time of GC urgent mode. Set to 500ms by default.
 
 What:		/sys/fs/f2fs/<disk>/readdir_ra
 Date:		November 2017
 Contact:	"Sheng Yong" <shengyong1@huawei.com>
-Description:
-		 Controls readahead inode block in readdir.
+Description:	Controls readahead inode block in readdir. Enabled by default.
+
+What:		/sys/fs/f2fs/<disk>/gc_pin_file_thresh
+Date:		January 2018
+Contact:	Jaegeuk Kim <jaegeuk@kernel.org>
+Description:	This indicates how many GC can be failed for the pinned
+		file. If it exceeds this, F2FS doesn't guarantee its pinning
+		state. 2048 trials is set by default.
 
 What:		/sys/fs/f2fs/<disk>/extension_list
 Date:		Feburary 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Description:
-		 Used to control configure extension list:
-		 - Query: cat /sys/fs/f2fs/<disk>/extension_list
-		 - Add: echo '[h/c]extension' > /sys/fs/f2fs/<disk>/extension_list
-		 - Del: echo '[h/c]!extension' > /sys/fs/f2fs/<disk>/extension_list
-		 - [h] means add/del hot file extension
-		 - [c] means add/del cold file extension
+Description:	Used to control configure extension list:
+		- Query: cat /sys/fs/f2fs/<disk>/extension_list
+		- Add: echo '[h/c]extension' > /sys/fs/f2fs/<disk>/extension_list
+		- Del: echo '[h/c]!extension' > /sys/fs/f2fs/<disk>/extension_list
+		- [h] means add/del hot file extension
+		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
 Date		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
-Description:
-		If checkpoint=disable, it displays the number of blocks that are unusable.
-                If checkpoint=enable it displays the enumber of blocks that would be unusable
-                if checkpoint=disable were to be set.
+Description:	If checkpoint=disable, it displays the number of blocks that
+		are unusable.
+		If checkpoint=enable it displays the enumber of blocks that
+		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
 Date		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
-Description:
-		Displays name and version of the encoding set for the filesystem.
-                If no encoding is set, displays (none)
+Description:	Displays name and version of the encoding set for the filesystem.
+		If no encoding is set, displays (none)
diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index ee61ace30276..4eb3e2ddd00e 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -270,172 +270,6 @@ The files in each per-device directory are shown in table below.
 
 Files in /sys/fs/f2fs/<devname>
 (see also Documentation/ABI/testing/sysfs-fs-f2fs)
-..............................................................................
- File                         Content
-
- gc_urgent_sleep_time         This parameter controls sleep time for gc_urgent.
-                              500 ms is set by default. See above gc_urgent.
-
- gc_min_sleep_time            This tuning parameter controls the minimum sleep
-                              time for the garbage collection thread. Time is
-                              in milliseconds.
-
- gc_max_sleep_time            This tuning parameter controls the maximum sleep
-                              time for the garbage collection thread. Time is
-                              in milliseconds.
-
- gc_no_gc_sleep_time          This tuning parameter controls the default sleep
-                              time for the garbage collection thread. Time is
-                              in milliseconds.
-
- gc_idle                      This parameter controls the selection of victim
-                              policy for garbage collection. Setting gc_idle = 0
-                              (default) will disable this option. Setting
-                              gc_idle = 1 will select the Cost Benefit approach
-                              & setting gc_idle = 2 will select the greedy approach.
-
- gc_urgent                    This parameter controls triggering background GCs
-                              urgently or not. Setting gc_urgent = 0 [default]
-                              makes back to default behavior, while if it is set
-                              to 1, background thread starts to do GC by given
-                              gc_urgent_sleep_time interval.
-
- reclaim_segments             This parameter controls the number of prefree
-                              segments to be reclaimed. If the number of prefree
-			      segments is larger than the number of segments
-			      in the proportion to the percentage over total
-			      volume size, f2fs tries to conduct checkpoint to
-			      reclaim the prefree segments to free segments.
-			      By default, 5% over total # of segments.
-
- main_blkaddr                 This value gives the first block address of
-			      MAIN area in the partition.
-
- max_small_discards	      This parameter controls the number of discard
-			      commands that consist small blocks less than 2MB.
-			      The candidates to be discarded are cached until
-			      checkpoint is triggered, and issued during the
-			      checkpoint. By default, it is disabled with 0.
-
- discard_granularity	      This parameter controls the granularity of discard
-			      command size. It will issue discard commands iif
-			      the size is larger than given granularity. Its
-			      unit size is 4KB, and 4 (=16KB) is set by default.
-			      The maximum value is 128 (=512KB).
-
- reserved_blocks	      This parameter indicates the number of blocks that
-			      f2fs reserves internally for root.
-
- batched_trim_sections	      This parameter controls the number of sections
-                              to be trimmed out in batch mode when FITRIM
-                              conducts. 32 sections is set by default.
-
- ipu_policy                   This parameter controls the policy of in-place
-                              updates in f2fs. User can set:
-                               0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
-                               0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
-                               0x10: F2FS_IPU_FSYNC, 0x20: F2FS_IPU_ASYNC,
-                               0x40: F2FS_IPU_NOCACHE.
-                              Refer segment.h for details.
-
- min_ipu_util                 This parameter controls the threshold to trigger
-                              in-place-updates. The number indicates percentage
-                              of the filesystem utilization, and used by
-                              F2FS_IPU_UTIL and F2FS_IPU_SSR_UTIL policies.
-
- min_fsync_blocks             This parameter controls the threshold to trigger
-                              in-place-updates when F2FS_IPU_FSYNC mode is set.
-			      The number indicates the number of dirty pages
-			      when fsync needs to flush on its call path. If
-			      the number is less than this value, it triggers
-			      in-place-updates.
-
- min_seq_blocks		      This parameter controls the threshold to serialize
-			      write IOs issued by multiple threads in parallel.
-
- min_hot_blocks		      This parameter controls the threshold to allocate
-			      a hot data log for pending data blocks to write.
-
- min_ssr_sections	      This parameter adds the threshold when deciding
-			      SSR block allocation. If this is large, SSR mode
-			      will be enabled early.
-
- ram_thresh                   This parameter controls the memory footprint used
-			      by free nids and cached nat entries. By default,
-			      1 is set, which indicates 10 MB / 1 GB RAM.
-
- ra_nid_pages		      When building free nids, F2FS reads NAT blocks
-			      ahead for speed up. Default is 0.
-
- dirty_nats_ratio	      Given dirty ratio of cached nat entries, F2FS
-			      determines flushing them in background.
-
- max_victim_search	      This parameter controls the number of trials to
-			      find a victim segment when conducting SSR and
-			      cleaning operations. The default value is 4096
-			      which covers 8GB block address range.
-
- migration_granularity	      For large-sized sections, F2FS can stop GC given
-			      this granularity instead of reclaiming entire
-			      section.
-
- dir_level                    This parameter controls the directory level to
-			      support large directory. If a directory has a
-			      number of files, it can reduce the file lookup
-			      latency by increasing this dir_level value.
-			      Otherwise, it needs to decrease this value to
-			      reduce the space overhead. The default value is 0.
-
- cp_interval		      F2FS tries to do checkpoint periodically, 60 secs
-			      by default.
-
- idle_interval		      F2FS detects system is idle, if there's no F2FS
-			      operations during given interval, 5 secs by
-			      default.
-
- discard_idle_interval	      F2FS detects the discard thread is idle, given
-			      time interval. Default is 5 secs.
-
- gc_idle_interval	      F2FS detects the GC thread is idle, given time
-			      interval. Default is 5 secs.
-
- umount_discard_timeout       When unmounting the disk, F2FS waits for finishing
-			      queued discard commands which can take huge time.
-			      This gives time out for it, 5 secs by default.
-
- iostat_enable		      This controls to enable/disable iostat in F2FS.
-
- readdir_ra		      This enables/disabled readahead of inode blocks
-			      in readdir, and default is enabled.
-
- gc_pin_file_thresh	      This indicates how many GC can be failed for the
-			      pinned file. If it exceeds this, F2FS doesn't
-			      guarantee its pinning state. 2048 trials is set
-			      by default.
-
- extension_list		      This enables to change extension_list for hot/cold
-			      files in runtime.
-
- inject_rate		      This controls injection rate of arbitrary faults.
-
- inject_type		      This controls injection type of arbitrary faults.
-
- dirty_segments 	      This shows # of dirty segments.
-
- lifetime_write_kbytes	      This shows # of data written to the disk.
-
- features		      This shows current features enabled on F2FS.
-
- current_reserved_blocks      This shows # of blocks currently reserved.
-
- unusable                     If checkpoint=disable, this shows the number of
-                              blocks that are unusable.
-                              If checkpoint=enable it shows the number of blocks
-                              that would be unusable if checkpoint=disable were
-                              to be set.
-
-encoding 	              This shows the encoding used for casefolding.
-                              If casefolding is not enabled, returns (none)
 
 ================================================================================
 USAGE
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
