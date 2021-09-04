Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9C4008EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 03:27:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMKT8-0006Yc-SG; Sat, 04 Sep 2021 01:27:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mMKT7-0006YV-0j
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 01:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7UCgRO9mp8LCVF6svRw/wvbB7QV7nKEKTjywR/c8S8=; b=GFMQCMpfQyPrTcdSzODmsUTqm3
 frLyxKoml29Mua8SN6Ag72xsm8rKzx4J4/X+SdUDYhfYcQ/2U0SFkSovxTJZ0C111Lg1jB1fzTwp7
 EpLGU9dS4NoxnHqAg2/TLSj541b0XHORutPIQQeja09rVdlWjJFsccMSTBXnq9Z2jj8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H7UCgRO9mp8LCVF6svRw/wvbB7QV7nKEKTjywR/c8S8=; b=J
 43jHxukAgfWFckH+Az9R5ei+HCT1csWcKUyqivvJDDWJuJt6AA35xdg/UQ5OpFJLlzDOFzwnngUiw
 6Rfgj3zOEiTRzoExjXldHzUdXKJTpKgJH1wiS4wRlH7YLnQj6L+N4aB4f6tCPgUJ8lkyEB4uI9knx
 fEtifcEyR+3pDqZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMKT6-00DoEm-8E
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 01:27:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B5660E76;
 Sat,  4 Sep 2021 01:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630718849;
 bh=D2o7Hi7RNZvEjo+CGLrSu9GeeM481v3eSSagovSn6Wk=;
 h=Date:From:To:Cc:Subject:From;
 b=BKQPFE1nHHNuvMqSVcIK7Rps6Huz6VehH0Hch94zLXb6+SfPmcBFBrcVzgzdAO1sw
 HrgRlxGDobU6RKBe0mPZ2eOe6rFddFLx8nPzFqdPCr8pX2J+N0p14UAcRRT1ir1Nhq
 lsWbvEgExwSLVGCrmLv8LFclnCbQ3hDtx76xhnqvJFUOqG5BToBMLKMer5efBXxa9/
 3zBIvnY4tepECzIYjeHJRzTdxW4fq6+i7Zdu/ruB9tF754rQDiwBcrHPI7YAPIk1Bz
 3ULHQ2h2w2DK9ZIo6IyRlvnux835xd5y2ZFTutxONz7ttsfqjBw6f7LmZYu3WrCkc/
 EvOhM4KJZaGNQ==
Date: Fri, 3 Sep 2021 18:27:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YTLLgFTaal2+EC1c@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMKT6-00DoEm-8E
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.15-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.15-rc1

for you to fetch changes up to 9605f75cf36e0bcc0f4ada07b5be712d30107607:

  f2fs: should put a page beyond EOF when preparing a write (2021-08-31 14:39:39 -0700)

----------------------------------------------------------------
f2fs-for-5.15-rc1

In this cycle, we've addressed some performance issues such as lock contention,
misbehaving compress_cache, allowing extent_cache for compressed files, and new
sysfs to adjust ra_size for fadvise. In order to diagnose the performance issues
quickly, we also added an iostat which shows the IO latencies periodically. On
the stability side, we've found two memory leakage cases in the error path in
compression flow. And, we've also fixed various corner cases in fiemap, quota,
checkpoint=disable, zstd, and so on.

Enhancement:
 - avoid long checkpoint latency by releasing nat_tree_lock
 - collect and show iostats periodically
 - support extent_cache for compressed files
 - add a sysfs entry to manage ra_size given fadvise(POSIX_FADV_SEQUENTIAL)
 - report f2fs GC status via sysfs
 - add discard_unit=%s in mount option to handle zoned device

Bug fix:
 - fix two memory leakages when an error happens in the compressed IO flow
 - fix commpress_cache to get the right LBA
 - fix fiemap to deal with compressed case correctly
 - fix wrong EIO returns due to SBI_NEED_FSCK
 - fix missing writes when enabling checkpoint back
 - fix quota deadlock
 - fix zstd level mount option

In addition to the above major updates, we've cleaned up several code paths such
as dio, unnecessary operations, debugfs/f2fs/status, sanity check, and typos.

----------------------------------------------------------------
Chao Yu (18):
      f2fs: compress: fix to set zstd compress level correctly
      f2fs: quota: fix potential deadlock
      f2fs: fix wrong checkpoint_changed value in f2fs_remount()
      f2fs: fix to force keeping write barrier for strict fsync mode
      f2fs: introduce discard_unit mount option
      f2fs: fix to stop filesystem update once CP failed
      f2fs: extent cache: support unaligned extent
      f2fs: avoid unneeded memory allocation in __add_ino_entry()
      f2fs: fix to do sanity check for sb/cp fields correctly
      f2fs: support fault injection for f2fs_kmem_cache_alloc()
      f2fs: fix to keep compatibility of fault injection interface
      f2fs: compress: do sanity check on cluster
      f2fs: rebuild nat_bits during umount
      f2fs: adjust unlock order for cleanup
      f2fs: fix to account missing .skipped_gc_rwsem
      f2fs: fix unexpected ENOENT comes from f2fs_map_blocks()
      f2fs: fix to unmap pages from userspace process in punch_hole()
      f2fs: enable realtime discard iff device supports discard

Daeho Jeong (6):
      f2fs: add sysfs nodes to get GC info for each GC mode
      f2fs: change fiemap way in printing compression chunk
      f2fs: turn back remapped address in compressed page endio
      f2fs: add sysfs node to control ra_pages for fadvise seq file
      f2fs: separate out iostat feature
      f2fs: introduce periodic iostat io latency traces

Eric Biggers (2):
      f2fs: make f2fs_write_failed() take struct inode
      f2fs: remove allow_outplace_dio()

Fengnan Chang (4):
      f2fs: compress: remove unneeded read when rewrite whole cluster
      f2fs: compress: avoid duplicate counting of valid blocks when read compressed file
      f2fs: compress: allow write compress released file after truncate to zero
      f2fs: Don't create discard thread when device doesn't support realtime discard

Jaegeuk Kim (7):
      f2fs: let's keep writing IOs on SBI_NEED_FSCK
      f2fs: don't sleep while grabing nat_tree_lock
      f2fs: do not submit NEW_ADDR to read node block
      f2fs: show sbi status in debugfs/f2fs/status
      f2fs: guarantee to write dirty data when enabling checkpoint back
      f2fs: deallocate compressed pages when error happens
      f2fs: should put a page beyond EOF when preparing a write

Jia Yang (1):
      f2fs: Revert "f2fs: Fix indefinite loop in f2fs_gc() v1"

Laibin Qiu (1):
      f2fs: fix min_seq_blocks can not make sense in some scenes.

Tiezhu Yang (1):
      f2fs: Kconfig: clean up config options about compression

Wang Xiaojun (1):
      f2fs: avoid to create an empty string as the extension_list

Yangtao Li (5):
      f2fs: reduce the scope of setting fsck tag when de->name_len is zero
      f2fs: improve sbi status info in debugfs/f2fs/status
      f2fs: correct comment in segment.h
      f2fs: convert S_IRUGO to 0444
      f2fs: fix description about main_blkaddr node

 Documentation/ABI/testing/sysfs-fs-f2fs |  23 ++-
 Documentation/filesystems/f2fs.rst      |  17 +-
 fs/f2fs/Kconfig                         |  19 ++-
 fs/f2fs/Makefile                        |   1 +
 fs/f2fs/checkpoint.c                    |  57 +++++--
 fs/f2fs/compress.c                      |  97 ++++++++++-
 fs/f2fs/data.c                          | 198 +++++++++++++++-------
 fs/f2fs/debug.c                         |  39 ++++-
 fs/f2fs/dir.c                           |  18 +-
 fs/f2fs/extent_cache.c                  |  46 ++++-
 fs/f2fs/f2fs.h                          | 177 ++++++++++----------
 fs/f2fs/file.c                          |  66 +++++++-
 fs/f2fs/gc.c                            |  14 +-
 fs/f2fs/iostat.c                        | 287 ++++++++++++++++++++++++++++++++
 fs/f2fs/iostat.h                        |  84 ++++++++++
 fs/f2fs/node.c                          | 165 +++++++++++++-----
 fs/f2fs/recovery.c                      |   3 +-
 fs/f2fs/segment.c                       | 137 ++++++++++-----
 fs/f2fs/segment.h                       |   4 +-
 fs/f2fs/super.c                         | 242 ++++++++++++++++++++-------
 fs/f2fs/sysfs.c                         | 156 +++++++----------
 fs/f2fs/xattr.c                         |   3 +-
 include/trace/events/f2fs.h             |  97 +++++++++++
 23 files changed, 1493 insertions(+), 457 deletions(-)
 create mode 100644 fs/f2fs/iostat.c
 create mode 100644 fs/f2fs/iostat.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
