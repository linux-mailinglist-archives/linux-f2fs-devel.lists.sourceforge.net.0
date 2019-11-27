Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79110B725
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Nov 2019 21:01:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ia3VZ-0000bN-HV; Wed, 27 Nov 2019 20:01:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ia3VX-0000bC-VA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 20:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T59rpuIWzO5pvebuiDK5VkARitBUNrGtS/BTKfnG5+w=; b=ahleXgs4IINmLkyh8wNslIqNJw
 ToTOCBDTGwx0zFYphESw+ybDyOTIjeR6vHLUy9P1681tAQpm1g6adnmDOWrSx5cajQnxW+cG6sOVE
 aE+obowEJJGXYsNdUW48lw3R+dWE6M6azDu7wEnKeXjskePdGa4AHAVJ8JGL0ORlkSkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T59rpuIWzO5pvebuiDK5VkARitBUNrGtS/BTKfnG5+w=; b=B
 dueyLyRKBEgGOq4l5IYO7SP5Q7fg8a4CWCcm4lcbkCt1zeUNWDxIWMzlHSMhkItdfrr4qtB0GDaW1
 9AwC8UgdTR4b+40qzccSwkLWTSLxO6HRERg4Kq7H3znOQ4XxSkoEQY2QNvwCPTatVQSXGDy19y6s6
 lbaZaqJS6SlQNwqQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ia3VW-00FJcO-0p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 20:01:51 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52F09205ED;
 Wed, 27 Nov 2019 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574884899;
 bh=o6w7PgA47rzSdbjn85d9GgkgbdSbOIW/GWwPXGXodEE=;
 h=Date:From:To:Cc:Subject:From;
 b=sP308u2hbDXMR2q3dZZo0JBwDMksE1GhaFfilJEywtHZ9B2ypm5TxWvNtauRR1VI2
 NPkhuCiAm3Utir3jIaNyly1yLhyWGvfDvhH3qwI5k5S5o3bdjmPur1+pI6uAGvFSmH
 W+2JLVhxK6WBnVw4g5njwl88mwmw7B22ETUlMXkw=
Date: Wed, 27 Nov 2019 12:01:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191127200138.GA47793@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ia3VW-00FJcO-0p
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.5
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

The following changes since commit b145b0eb2031a620ca010174240963e4d2c6ce26:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2019-10-04 11:17:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.5

for you to fetch changes up to 803e74be04b32f7785742dcabfc62116718fbb06:

  f2fs: stop GC when the victim becomes fully valid (2019-11-25 10:01:28 -0800)

----------------------------------------------------------------
f2fs-for-5.5-rc1

In this round, we've introduced fairly small number of patches as below.

Enhancement:
 - improve the in-place-update IO flow
 - allocate segment to guarantee no GC for pinned files

Bug fix:
 - fix updatetime in lazytime mode
 - potential memory leak in f2fs_listxattr
 - record parent inode number in rename2 correctly
 - fix deadlock in f2fs_gc along with atomic writes
 - avoid needless data migration in GC

----------------------------------------------------------------
Chao Yu (6):
      f2fs: fix to update time in lazytime mode
      f2fs: cache global IPU bio
      f2fs: fix wrong description in document
      f2fs: fix to update dir's i_pino during cross_rename
      f2fs: fix potential overflow
      f2fs: show f2fs instance in printk_ratelimited

Chengguang Xu (1):
      f2fs: choose hardlimit when softlimit is larger than hardlimit in f2fs_statfs_project()

Chengguang Xu via Linux-f2fs-devel (1):
      f2fs: mark recovery flag correctly in read_raw_super_block()

Jaegeuk Kim (4):
      f2fs: avoid kernel panic on corruption test
      f2fs: support aligned pinned file
      f2fs: expose main_blkaddr in sysfs
      f2fs: stop GC when the victim becomes fully valid

Qiuyang Sun (2):
      f2fs: update multi-dev metadata in resize_fs
      f2fs: check total_segments from devices in raw_super

Randall Huang (1):
      f2fs: fix to avoid memory leakage in f2fs_listxattr

Sahitya Tummala (1):
      f2fs: Fix deadlock in f2fs_gc() context during atomic files handling

 Documentation/ABI/testing/sysfs-fs-f2fs |   6 +
 Documentation/filesystems/f2fs.txt      |   5 +-
 fs/f2fs/checkpoint.c                    |   2 +-
 fs/f2fs/data.c                          | 190 +++++++++++++++++++++++++-------
 fs/f2fs/dir.c                           |   7 +-
 fs/f2fs/f2fs.h                          |  63 +++++++----
 fs/f2fs/file.c                          |  47 ++++++--
 fs/f2fs/gc.c                            |  46 +++++++-
 fs/f2fs/inode.c                         |   8 +-
 fs/f2fs/namei.c                         |  15 ++-
 fs/f2fs/node.c                          |   3 +-
 fs/f2fs/recovery.c                      |   2 +-
 fs/f2fs/segment.c                       |  64 ++++++++---
 fs/f2fs/segment.h                       |   2 +
 fs/f2fs/super.c                         |  50 +++++++--
 fs/f2fs/sysfs.c                         |   4 +
 fs/f2fs/xattr.c                         |  14 ++-
 17 files changed, 421 insertions(+), 107 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
