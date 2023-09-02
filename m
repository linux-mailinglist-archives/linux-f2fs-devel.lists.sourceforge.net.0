Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AA790463
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Sep 2023 02:01:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcE4s-00029t-BC;
	Sat, 02 Sep 2023 00:01:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qcE4r-00029n-5Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 00:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aq3DDP72/3gGhlDUR9Him4GD4CLShsP2W5NIIc9mxE=; b=fuWNykT5nWuBvGRFDqhULl84ZY
 M1trkIr7LepdeJLK95+7MXIoV6sxFQK4KBbNUTHfrx+8lmraWMsTwxz5hUf3zsCxhkZJahh4rcfg8
 4T0LqdL84iWoK8dtjkS46bcOAGlxXyuBIm8G8l4dk44DNL7CfwoM1ANT35PgaehffRGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5aq3DDP72/3gGhlDUR9Him4GD4CLShsP2W5NIIc9mxE=; b=P
 CDQTyIXGRO2pO15xdqKgLUFYTWgHgub8hbTkfOvXLzmWe8SkHtBaQ7tE2UsaSawctalDQejxJ9SUM
 rgwyNe17WdEHHokWVkS1L/zQ6zhdUwxtRb2c1xUnE1MptcIPt83LUeT8pNW418kJTLoWI2Mm7vV9O
 V4AxhF71bqKA8Vnc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qcE4l-0004UF-PX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 00:01:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3AC55B826B8;
 Sat,  2 Sep 2023 00:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AB3C433C9;
 Sat,  2 Sep 2023 00:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693612865;
 bh=2lY72EZOdDo4UdttgZLYLQ0k+vBebrNVKUbwVgsCBMI=;
 h=Date:From:To:Cc:Subject:From;
 b=f6Y6dWWwd1DNKxEVrcVDMliGUtOpL5Vy9eyDVnJFLi8J2R1RLCO6Z4+BBA6rRWw0J
 tHMArJccg5KuhoafAStKoXTKCrwlR1kOJPEqNMN1V289gUBo1mrCPec9I1nBTz6P30
 j60+pMiYSBu+omcD+WpA9cXaw1v7wFuQGA3K/ZDT4cJCoEwF7fFSbGWNGxh6VT/o4F
 wEEPUxR3UsD+SO2w7GfsXufBCHClEtYaO/zU0c4Ts1xh+135vzvbZfDKxf//Th41O4
 Ty3gbb0IyGT7meprrN1rPDJNhC7xNHOijlHdfS3c1WSXxmaiwC2lDn7rDPdbXIaaUd
 IWPmoNhkjQ1zw==
Date: Fri, 1 Sep 2023 17:01:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZPJ7P1J+jbyL6Mve@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qcE4l-0004UF-PX
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.6
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6-6-rc1

for you to fetch changes up to 3b7166121402a5062d18dcf4e3bce083fb9e4201:

  f2fs: use finish zone command when closing a zone (2023-08-25 10:30:37 -0700)

----------------------------------------------------------------
f2fs update for 6.6-rc1

In this cycle, we don't have a highlighted feature enhancement, but mostly
have fixed issues mainly in two parts: 1) zoned block device, 2) compression
support. For zoned block device, we've tried to improve the power-off recovery
flow as much as possible. For compression, we found some corner cases caused by
wrong compression policy and logics. Other than them, there were some reverts
and stat corrections.

Bug fix:
 - use finish zone command when closing a zone
 - check zone type before sending async reset zone command
 - fix to assign compress_level for lz4 correctly
 - fix error path of f2fs_submit_page_read()
 - don't {,de}compress non-full cluster
 - send small discard commands during checkpoint back
 - flush inode if atomic file is aborted
 - correct to account gc/cp stats

And, there are minor bug fixes, avoiding false lockdep warning, and clean-ups.

----------------------------------------------------------------
Chao Yu (14):
      f2fs: don't handle error case of f2fs_compress_alloc_page()
      f2fs: fix to avoid mmap vs set_compress_option case
      f2fs: allow f2fs_ioc_{,de}compress_file to be interrupted
      f2fs: compress: don't {,de}compress non-full cluster
      Revert "f2fs: fix to do sanity check on extent cache correctly"
      f2fs: fix to update i_ctime in __f2fs_setxattr()
      f2fs: remove unneeded check condition in __f2fs_setxattr()
      f2fs: fix to account gc stats correctly
      f2fs: fix to account cp stats correctly
      f2fs: doc: fix description of max_small_discards
      Revert "f2fs: do not issue small discard commands during checkpoint"
      f2fs: clean up error handling in sanity_check_{compress_,}inode()
      f2fs: fix error path of f2fs_submit_page_read()
      f2fs: compress: fix to assign compress_level for lz4 correctly

Christoph Hellwig (1):
      f2fs: don't reopen the main block device in f2fs_scan_devices

Chunhai Guo (1):
      f2fs: Only lfs mode is allowed with zoned block device feature

Daeho Jeong (1):
      f2fs: use finish zone command when closing a zone

Jaegeuk Kim (4):
      Revert "f2fs: clean up w/ sbi->log_sectors_per_block"
      f2fs: flush inode if atomic file is aborted
      f2fs: get out of a repeat loop when getting a locked data page
      f2fs: avoid false alarm of circular locking

Minjie Du (1):
      f2fs: increase usage of folio_next_index() helper

Randy Dunlap (1):
      f2fs: fix spelling in ABI documentation

Shin'ichiro Kawasaki (1):
      f2fs: check zone type before sending async reset zone command

Zhiguo Niu (1):
      f2fs: should update REQ_TIME for direct write

 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++---
 fs/f2fs/checkpoint.c                    |  2 +-
 fs/f2fs/compress.c                      | 14 +----
 fs/f2fs/data.c                          | 14 +++--
 fs/f2fs/debug.c                         | 33 +++++++++---
 fs/f2fs/f2fs.h                          | 96 +++++++++++++++++++++------------
 fs/f2fs/file.c                          | 60 +++++++++++++++------
 fs/f2fs/gc.c                            | 18 ++++---
 fs/f2fs/inline.c                        |  3 +-
 fs/f2fs/inode.c                         | 35 ++++--------
 fs/f2fs/recovery.c                      |  1 +
 fs/f2fs/segment.c                       | 89 +++++++++++++++++++-----------
 fs/f2fs/super.c                         | 41 +++++++-------
 fs/f2fs/sysfs.c                         | 18 +++++--
 fs/f2fs/xattr.c                         |  6 +--
 15 files changed, 268 insertions(+), 176 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
