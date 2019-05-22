Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07A26966
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 19:50:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTVO4-0003zN-G5; Wed, 22 May 2019 17:50:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hTVO3-0003zC-J6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 17:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzyiZKKn6DwwbXjvzsGQRx8f4ujj7B/KRFoeu7mqvVY=; b=QwJcIYD95r/sEzR1DjWU7iM+uG
 EVM2dsjrX9Rl5llMj867kQZeAnYoOxM4JU+Dd2RnLfjYn1AeSos9D5LACI633VWgFNUESJcn1jKkv
 owIsdEt+DHqBTLGrv1rn/RLJTKd5la4Ja9MhiSmC/mvsP1RzxMm3FfRAEUpNcnM44lWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tzyiZKKn6DwwbXjvzsGQRx8f4ujj7B/KRFoeu7mqvVY=; b=Owc1KmCYSQ6h/Mf+lXEF2fGEvo
 qPjIsjxTt3TYsYS7CR/tvtb8v6ZlEe6XZ44R7KRQLbTlu/a8R4VoivhXIjAlCLxQY9zJP6ElbNR9c
 DcSE6QKUOBO1MwVcwZUyu6JwQy0CfcnVfWAt5ewQQCkWjz2WtjhCQUYPcXhLxfL/VbJk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTVNy-006mtI-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 17:50:47 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76C0521019;
 Wed, 22 May 2019 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558547436;
 bh=8l0wC+To+O/9i3Py9n5jB7vJaXBBrSeToGmiDJXpbCY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=dpp4DZgZPiLdjl96mLdiiBYbBZ67BTR+pSgmh2eF5+NDxYZa8ykhtAv/e+F3qIdCd
 f1TIxR6x7N/xOKcz2QJFTnkE/po7UYdhveFdaSxrJMJDbUcNzqbxQx5UPDA4ORGbjh
 hIiuv9szNlbeKy7KjIDrLDekAtsDaKppU09avdXg=
Date: Wed, 22 May 2019 10:50:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190522175035.GB81051@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190521180606.10461-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521180606.10461-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1hTVNy-006mtI-Uo
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add missing sysfs entries in
 documentation
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

This patch cleans up documentation to cover missing sysfs entries.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2 from v1:
 - fix some typos and adjust suggestions

 Documentation/filesystems/f2fs.txt | 89 +++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 9 deletions(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index f7b5e4ff0de3..e4139af88d78 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -246,11 +246,14 @@ Files in /sys/fs/f2fs/<devname>
 ..............................................................................
  File                         Content
 
- gc_max_sleep_time            This tuning parameter controls the maximum sleep
+ gc_urgent_sleep_time         This parameter controls sleep time for gc_urgent.
+                              500 ms is set by default. See above gc_urgent.
+
+ gc_min_sleep_time            This tuning parameter controls the minimum sleep
                               time for the garbage collection thread. Time is
                               in milliseconds.
 
- gc_min_sleep_time            This tuning parameter controls the minimum sleep
+ gc_max_sleep_time            This tuning parameter controls the maximum sleep
                               time for the garbage collection thread. Time is
                               in milliseconds.
 
@@ -270,9 +273,6 @@ Files in /sys/fs/f2fs/<devname>
                               to 1, background thread starts to do GC by given
                               gc_urgent_sleep_time interval.
 
- gc_urgent_sleep_time         This parameter controls sleep time for gc_urgent.
-                              500 ms is set by default. See above gc_urgent.
-
  reclaim_segments             This parameter controls the number of prefree
                               segments to be reclaimed. If the number of prefree
 			      segments is larger than the number of segments
@@ -287,7 +287,16 @@ Files in /sys/fs/f2fs/<devname>
 			      checkpoint is triggered, and issued during the
 			      checkpoint. By default, it is disabled with 0.
 
- trim_sections                This parameter controls the number of sections
+ discard_granularity	      This parameter controls the granularity of discard
+			      command size. It will issue discard commands iif
+			      the size is larger than given granularity. Its
+			      unit size is 4KB, and 4 (=16KB) is set by default.
+			      The maximum value is 128 (=512KB).
+
+ reserved_blocks	      This parameter indicates the number of blocks that
+			      f2fs reserves internally for root.
+
+ batched_trim_sections	      This parameter controls the number of sections
                               to be trimmed out in batch mode when FITRIM
                               conducts. 32 sections is set by default.
 
@@ -309,11 +318,35 @@ Files in /sys/fs/f2fs/<devname>
 			      the number is less than this value, it triggers
 			      in-place-updates.
 
+ min_seq_blocks		      This parameter controls the threshold to serialize
+			      write IOs issued by multiple threads in parallel.
+
+ min_hot_blocks		      This parameter controls the threshold to allocate
+			      a hot data log for pending data blocks to write.
+
+ min_ssr_sections	      This parameter adds the threshold when deciding
+			      SSR block allocation. If this is large, SSR mode
+			      will be enabled early.
+
+ ram_thresh                   This parameter controls the memory footprint used
+			      by free nids and cached nat entries. By default,
+			      10 is set, which indicates 10 MB / 1 GB RAM.
+
+ ra_nid_pages		      When building free nids, F2FS reads NAT blocks
+			      ahead for speed up. Default is 0.
+
+ dirty_nats_ratio	      Given dirty ratio of cached nat entries, F2FS
+			      determines flushing them in background.
+
  max_victim_search	      This parameter controls the number of trials to
 			      find a victim segment when conducting SSR and
 			      cleaning operations. The default value is 4096
 			      which covers 8GB block address range.
 
+ migration_granularity	      For large-sized sections, F2FS can stop GC given
+			      this granularity instead of reclaiming entire
+			      section.
+
  dir_level                    This parameter controls the directory level to
 			      support large directory. If a directory has a
 			      number of files, it can reduce the file lookup
@@ -321,9 +354,47 @@ Files in /sys/fs/f2fs/<devname>
 			      Otherwise, it needs to decrease this value to
 			      reduce the space overhead. The default value is 0.
 
- ram_thresh                   This parameter controls the memory footprint used
-			      by free nids and cached nat entries. By default,
-			      10 is set, which indicates 10 MB / 1 GB RAM.
+ cp_interval		      F2FS tries to do checkpoint periodically, 60 secs
+			      by default.
+
+ idle_interval		      F2FS detects system is idle, if there's no F2FS
+			      operations during given interval, 5 secs by
+			      default.
+
+ discard_idle_interval	      F2FS detects the discard thread is idle, given
+			      time interval. Default is 5 secs.
+
+ gc_idle_interval	      F2FS detects the GC thread is idle, given time
+			      interval. Default is 5 secs.
+
+ umount_discard_timeout       When unmounting the disk, F2FS waits for finishing
+			      queued discard commands which can take huge time.
+			      This gives time out for it, 5 secs by default.
+
+ iostat_enable		      This controls to enable/disable iostat in F2FS.
+
+ readdir_ra		      This enables/disabled readahead of inode blocks
+			      in readdir, and default is enabled.
+
+ gc_pin_file_thresh	      This indicates how many GC can be failed for the
+			      pinned file. If it exceeds this, F2FS doesn't
+			      guarantee its pinning state. 2048 trials is set
+			      by default.
+
+ extension_list		      This enables to change extension_list for hot/cold
+			      files in runtime.
+
+ inject_rate		      This controls injection rate of arbitrary faults.
+
+ inject_type		      This controls injection type of arbitrary faults.
+
+ dirty_segments 	      This shows # of dirty segments.
+
+ lifetime_write_kbytes	      This shows # of data written to the disk.
+
+ features		      This shows current features enabled on F2FS.
+
+ reserved_blocks	      This shows # of blocks currently reserved.
 
 ================================================================================
 USAGE
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
