Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0389D89C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2024 16:55:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFbQP-0004xN-Dp;
	Mon, 25 Nov 2024 15:54:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tFbQG-0004x1-6r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 15:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glpj9vfw7KUjy3Vo0uXwmjD5vrLL0jatEor3C2ulUN4=; b=DBtpFApmacaawQuvn0P/ls44B7
 UXWnTVj9pSzCmeeUbSIIlSJz6uI19dMNdVEv2Z0Yer7AdMxe6a/Wx0VSzTUXD4bnndrJRfeufTsOj
 sbGE6ilemaaTITa30QskrWlevkp85qn1QyqG0lz4pRm6YG4OFaidA2ULSrEtOk58ARz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=glpj9vfw7KUjy3Vo0uXwmjD5vrLL0jatEor3C2ulUN4=; b=Q
 mquSVvOjRrrBIXy0dV2WjOd8+GKrZ4s1635byzwYMZHnVPflLIIE0ZfiaDDcEEBGVldSFvTiwzuF5
 ILv4siXUwfiJWdQzmHqbawaaeYLYRRl/CxnU78amGgYR5g1K7m9X3fV8Lh+VPY4udk2+BXYXVc3Jg
 eaWRXTwdrxooLP9o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tFbQF-0005JM-7w for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 15:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FA7FA4182A;
 Mon, 25 Nov 2024 15:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1279EC4CECE;
 Mon, 25 Nov 2024 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550076;
 bh=fDb8cXzJ6711mCKX8xueWhchOvWxtDD7B4KN9b/sYaA=;
 h=Date:From:To:Cc:Subject:From;
 b=bEbcd5MdllLmTjnUK6AbPpSWE+ikv3T0gUc7WTfItclhhhmFTaThen+03NktGMdku
 zh0RBG3LnBVoBMz7fVNxS4qrFYodEdxVHYWFzwxf72zuQ+vXcA25dGY6LfkUtp0Nsw
 G4KOgB1nLZ8mVMQeiwIEkPjl7T96PWoIaC5M+leWztyN0BQeDqOV02YMkyaisbGqKK
 HItUoBI63oZOyYHbfiEXvUXBr/7S2Sf4+3MrustAHimR8WMIDm4KuV6Kc4RPRFpC12
 qN1edFdYAg/jvFyOEleTJ8IG05t8pX/SbYH5VXwnBGzKQ4qTn81lhB6tTAtyODN8tl
 v5D11hsq7UwJg==
Date: Mon, 25 Nov 2024 15:54:34 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Z0SdunZ61-OMaH1o@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus,
 Could you please consideri this pull request? Thanks, 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tFbQF-0005JM-7w
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.13-rc1
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consideri this pull request?

Thanks,

The following changes since commit eca631b8fe808748d7585059c4307005ca5c5820:

  Merge tag 'f2fs-6.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs (2024-10-14 11:19:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.13-rc1

for you to fetch changes up to bc8aeb04fd80cb8cfae3058445c84410fd0beb5e:

  f2fs: fix to drop all discards after creating snapshot on lvm device (2024-11-23 15:48:15 +0000)

----------------------------------------------------------------
f2fs-for-6.13-rc1

This series introduces a device aliasing feature where user can carve out
partitions but reclaim the space back by deleting aliased file in root dir.
In addition to that, there're numerous minor bug fixes in zoned device support,
checkpoint=disable, extent cache management, fiemap, and lazytime mount option.
The full list of noticeable changes can be found below.

Enhancement:
 - introduce device aliasing file
 - add stats in debugfs to show multiple devices
 - add a sysfs node to limit max read extent count per-inode
 - modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable
 - decrease spare area for pinned files for zoned devices

Bug fix:
 - Revert "f2fs: remove unreachable lazytime mount option parsing"
 - adjust unusable cap before checkpoint=disable mode
 - fix to drop all discards after creating snapshot on lvm device
 - fix to shrink read extent node in batches
 - fix changing cursegs if recovery fails on zoned device
 - fix to adjust appropriate length for fiemap
 - fix fiemap failure issue when page size is 16KB
 - fix to avoid forcing direct write to use buffered IO on inline_data inode
 - fix to map blocks correctly for direct write
 - fix to account dirty data in __get_secs_required()
 - fix null-ptr-deref in f2fs_submit_page_bio()
 - f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks

----------------------------------------------------------------
Andrew Kreimer (1):
      f2fs: fix typos

Chao Yu (17):
      f2fs: fix to account dirty data in __get_secs_required()
      f2fs: fix to do sanity check on node blkaddr in truncate_node()
      f2fs: multidevice: add stats in debugfs
      f2fs: zone: introduce first_zoned_segno in f2fs_sb_info
      f2fs: fix to avoid potential deadlock in f2fs_record_stop_reason()
      f2fs: fix to parse temperature correctly in f2fs_get_segment_temp()
      f2fs: clean up opened code w/ {get,set}_nid()
      f2fs: fix to convert log type to segment data type correctly
      f2fs: fix to map blocks correctly for direct write
      f2fs: fix to avoid forcing direct write to use buffered IO on inline_data inode
      f2fs: fix to do cast in F2FS_{BLK_TO_BYTES, BTYES_TO_BLK} to avoid overflow
      f2fs: clean up w/ F2FS_{BLK_TO_BYTES,BTYES_TO_BLK}
      f2fs: fix to requery extent which cross boundary of inquiry
      f2fs: print message if fscorrupted was found in f2fs_new_node_page()
      f2fs: fix to shrink read extent node in batches
      f2fs: add a sysfs node to limit max read extent count per-inode
      f2fs: fix to drop all discards after creating snapshot on lvm device

Daeho Jeong (3):
      f2fs: decrease spare area for pinned files for zoned devices
      f2fs: introduce device aliasing file
      f2fs: adjust unusable cap before checkpoint=disable mode

Daniel Yang (1):
      f2fs: replace deprecated strcpy with strscpy

Jaegeuk Kim (1):
      Revert "f2fs: remove unreachable lazytime mount option parsing"

Long Li (1):
      f2fs: fix race in concurrent f2fs_stop_gc_thread

LongPing Wei (2):
      f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
      f2fs: clean up the unused variable additional_reserved_segments

Qi Han (3):
      f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks
      f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
      f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable

Sheng Yong (2):
      f2fs: fix changing cursegs if recovery fails on zoned device
      f2fs: clear SBI_POR_DOING before initing inmem curseg

Thorsten Blum (1):
      f2fs: Use struct_size() to improve f2fs_acl_clone()

Xiuhong Wang (1):
      f2fs: fix fiemap failure issue when page size is 16KB

Ye Bin (1):
      f2fs: fix null-ptr-deref in f2fs_submit_page_bio()

Yongpeng Yang (1):
      f2fs: check curseg->inited before write_sum_page in change_curseg

Zeng Heng (1):
      f2fs: Fix not used variable 'index'

Zhiguo Niu (3):
      f2fs: fix to avoid use GC_AT when setting gc_mode as GC_URGENT_LOW or GC_URGENT_MID
      f2fs: remove redundant atomic file check in defragment
      f2fs: fix to adjust appropriate length for fiemap

liuderong (1):
      f2fs: introduce f2fs_get_section_mtime

 Documentation/ABI/testing/sysfs-fs-f2fs |  13 ++-
 Documentation/filesystems/f2fs.rst      |  44 +++++++++
 fs/f2fs/acl.c                           |   5 +-
 fs/f2fs/checkpoint.c                    |   2 +-
 fs/f2fs/data.c                          | 114 ++++++++++------------
 fs/f2fs/debug.c                         | 111 +++++++++++++++++++++-
 fs/f2fs/extent_cache.c                  | 119 +++++++++++++++++------
 fs/f2fs/f2fs.h                          |  38 ++++++--
 fs/f2fs/file.c                          |  71 +++++++++++---
 fs/f2fs/gc.c                            |  19 ++--
 fs/f2fs/gc.h                            |   1 +
 fs/f2fs/inode.c                         |  23 ++++-
 fs/f2fs/node.c                          |  28 ++++--
 fs/f2fs/recovery.c                      |   9 +-
 fs/f2fs/segment.c                       | 161 +++++++++++++++++++++++---------
 fs/f2fs/segment.h                       |  72 ++++++++------
 fs/f2fs/super.c                         | 101 ++++++++++++++------
 fs/f2fs/sysfs.c                         |  16 +++-
 include/linux/f2fs_fs.h                 |   7 +-
 include/uapi/linux/f2fs.h               |   1 +
 20 files changed, 700 insertions(+), 255 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
