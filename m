Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F126758CC2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Aug 2022 18:32:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oL5fr-0006qs-4D; Mon, 08 Aug 2022 16:32:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oL5fq-0006qm-RP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 16:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xArgFzi13Oi6mK1WvD5cBqi6PHcKxCTx8jcbUZakOCo=; b=GBiH1gHcqTX07hw83s16f8x7cT
 EZrvlWf5EO+bsTcnFzFjx/uPNWSCbLooCIhunGlm/B59Nj23DeXWPJXs/Uf5hLtdphycSPPp34Dam
 sfcw1dwa8DsYoscr5FWJle8DfStbhyAnjqIB62T8ijfnlf2rRkWIiIAetarhotKtDuKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xArgFzi13Oi6mK1WvD5cBqi6PHcKxCTx8jcbUZakOCo=; b=X
 FjHEkXJPExum93kWBACF3ql2ymwjRS6ZpGiez0PAoSEYAkHVEf3ENiry0zjcrKOQLqtI1GUCfIQpK
 3AN16njdAe6avwbKZm+u4bfUBD7jocpFxt7G0ggHp4uxkyHrp+IR6mqCfxprtOQ9KweJjv0wDtu1F
 dQ4GWZmp26TQr38M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oL5fn-0004kI-OI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 16:32:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D99E0B8101F;
 Mon,  8 Aug 2022 16:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F44C433C1;
 Mon,  8 Aug 2022 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659976318;
 bh=cwNxKvCPscZzMfVxaKfuYUk0NZE66nFLFWd0ssdUEOk=;
 h=Date:From:To:Cc:Subject:From;
 b=t68tgDzyCdSC6LtPZIPI/eCQvTRhbqymjJ27LjTeg9+95pCIRpXllkilBrra7LLIK
 AdL4KJ/P25otAyGMAIW0T83PXokxoSMeNA0mNPMK3NvcZjLtqid6VulmRd3/2pKO9B
 w9i3AOzxOXDIZNhJLwOl48mclWK7bCXDSV1f9FxL6APyQ2LGNKl97fo/bFiuCk7hne
 mx79HZ2Xd4Xj3Xnz8oTA1Q3SMOrMLMabmwM+eUM56h13z1Lvpxi4T+w74PUaWsGi5N
 Ml4PoTMnIeHnrNP5lr3z+pB4mSJKR8J92gj0RiKBVuYfu6ZYimG2ZEGhECL/V7XNSA
 IFb0Z4/eKIfXA==
Date: Mon, 8 Aug 2022 09:31:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YvE6fO1r0znOdr60@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oL5fn-0004kI-OI
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.0
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

The following changes since commit 0840a7914caa14315a3191178a9f72c742477860:

  Merge tag 'char-misc-5.19-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc (2022-06-25 10:07:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.0

for you to fetch changes up to 01fc4b9a6ed8eacb64e5609bab7ac963e1c7e486:

  f2fs: use onstack pages instead of pvec (2022-08-05 04:20:55 -0700)

----------------------------------------------------------------
f2fs-for-6.0

In this cycle, we mainly fixed some corner cases that manipulate a per-file
compression flag inappropriately. And, we found f2fs counted valid blocks in a
section incorrectly when zone capacity is set, and thus, fixed it with
additional sysfs entry to check it easily. Lastly, this series includes
several patches with respect to the new atomic write support such as a
couple of bug fixes and re-adding atomic_write_abort support that we removed
by mistake in the previous release.

Enhancement:
 - add sysfs entries to understand atomic write operations and zone
   capacity
 - introduce memory mode to get a hint for low-memory devices
 - adjust the waiting time of foreground GC
 - decompress clusters under softirq to avoid non-deterministic latency
 - do not skip updating inode when retrying to flush node page
 - enforce single zone capacity

Bug fix:
 - set the compression/no-compression flags correctly
 - revive F2FS_IOC_ABORT_VOLATILE_WRITE
 - check inline_data during compressed inode conversion
 - understand zone capacity when calculating valid block count

As usual, the series includes several minor clean-ups and sanity checks.

----------------------------------------------------------------
Chao Liu (2):
      f2fs: allow compression of files without blocks
      f2fs: fix to remove F2FS_COMPR_FL and tag F2FS_NOCOMP_FL at the same time

Chao Yu (8):
      f2fs: initialize page_array_entry slab only if compression feature is on
      f2fs: fix to invalidate META_MAPPING before DIO write
      f2fs: fix to check inline_data during compressed inode conversion
      f2fs: invalidate meta pages only for post_read required inode
      f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
      f2fs: obsolete unused MAX_DISCARD_BLOCKS
      f2fs: fix to do sanity check on segment type in build_sit_entries()
      f2fs: clean up f2fs_abort_atomic_write()

Daeho Jeong (4):
      f2fs: introduce memory mode
      f2fs: introduce sysfs atomic write statistics
      f2fs: revive F2FS_IOC_ABORT_VOLATILE_WRITE
      f2fs: handle decompress only post processing in softirq

Eric Biggers (1):
      f2fs: use the updated test_dummy_encryption helper functions

Eunhee Rho (1):
      f2fs: remove device type check for direct IO

Fabio M. De Francesco (1):
      f2fs: Delete f2fs_copy_page() and replace with memcpy_page()

Fengnan Chang (2):
      f2fs: intorduce f2fs_all_cluster_page_ready
      f2fs: use onstack pages instead of pvec

Jack Qiu (1):
      f2fs: optimize error handling in redirty_blocks

Jaegeuk Kim (5):
      f2fs: do not skip updating inode when retrying to flush node page
      f2fs: enforce single zone capacity
      f2fs: adjust zone capacity when considering valid block count
      f2fs: add a sysfs entry to show zone capacity
      f2fs: do not set compression bit if kernel doesn't support

Jaewook Kim (1):
      f2fs: do not allow to decompress files have FI_COMPRESS_RELEASED

Ye Bin (1):
      f2fs: fix null-ptr-deref in f2fs_get_dnode_of_data

duguowei (1):
      f2fs: remove redundant code for gc condition

qixiaoyu1 (1):
      f2fs: don't bother wait_ms by foreground gc

 Documentation/ABI/testing/sysfs-fs-f2fs |  30 +++++
 Documentation/filesystems/f2fs.rst      |   5 +
 fs/f2fs/compress.c                      | 229 +++++++++++++++++++++-----------
 fs/f2fs/data.c                          |  82 +++++++-----
 fs/f2fs/debug.c                         |   2 +-
 fs/f2fs/f2fs.h                          | 102 ++++++++++----
 fs/f2fs/file.c                          |  79 +++++++----
 fs/f2fs/gc.c                            |  11 +-
 fs/f2fs/gc.h                            |  21 ++-
 fs/f2fs/inode.c                         |   3 +-
 fs/f2fs/node.c                          |  14 +-
 fs/f2fs/segment.c                       |  79 ++++++-----
 fs/f2fs/segment.h                       |  11 +-
 fs/f2fs/super.c                         |  90 ++++++++-----
 fs/f2fs/sysfs.c                         |  56 ++++++++
 include/uapi/linux/f2fs.h               |   2 +-
 16 files changed, 562 insertions(+), 254 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
