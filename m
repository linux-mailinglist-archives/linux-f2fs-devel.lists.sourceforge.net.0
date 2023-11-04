Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD37E10B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Nov 2023 20:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qzLwT-0006tV-Fr;
	Sat, 04 Nov 2023 19:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qzLwR-0006tL-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Nov 2023 19:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jEQaeb0f0ki5ShEc2QgtyJC3ciB9eBv77EJC8QMG18s=; b=Ln/QjhZq2AdNFy7Vp6oVDY4q5v
 K1SKCi/JMZ07SdNJ4KkxOCZedQ+A0mCKuJf3gGp03e7Pdz69riUwNMDT5FTtVC2+LsJ1o+GOd/MoV
 MCAr/nJsumJpo6oksu1zl8BNBpcopt5p2Oncq6+s5TQWsBYp/xcQIbigMVOvCaAOdpHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jEQaeb0f0ki5ShEc2QgtyJC3ciB9eBv77EJC8QMG18s=; b=X
 nA/m4NUh0f8VTYF6P/dFdog+tDiTGbGuRJ8K/Ah3v5MIlV/JTiavb9SNkw8z5Wtz4atZwebdqpPAB
 ktW57O03H5Qz+xKml1vuLG9VZTjgWLeCI6gc1NvOejnTEbBtEq9wg1GS1OkamvSjKjGwNq79KeREl
 nz2HzXer7v312P3U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qzLwQ-008jKt-25 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Nov 2023 19:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B1DF8B80023;
 Sat,  4 Nov 2023 19:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC7BC433C7;
 Sat,  4 Nov 2023 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699124650;
 bh=CJ5CvH2XKc3qIHFJg91oPL9wmqC3HtPop6Zvp2wfKU4=;
 h=Date:From:To:Cc:Subject:From;
 b=SjvuLTLkbH2wTuPAZ4n3+hJ6FNhKX5CDC5YQ/hSwwp0q+LLQMrqVkzmCX2C4RvSqY
 4zPUeJd+Hke9yTWBTu8avItJKnk00ciQxFiJtlOXTAVrr8zHsvo2PxFt2OQXtPE5DU
 lEvc/9JEV8tWrN/zly7kKhcZQyHsWw+VfRtGLRd1wfXdrzv83SoRouAyNYRX+8T159
 UjPpo9fZ3W6Q6Wfzlio5mZvODJtEc0qC00cHDQ/+ZyATtqNs1gGMa1pfmY3p3wlQjI
 KgtH+En8K4LpoqDTz8J+IAeEnY8KPghWbdxMQ7lF1otjJSKvhSANTMm5DNwsNyQsxy
 AbjpCksZYvh2g==
Date: Sat, 4 Nov 2023 12:04:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZUaVqCoMnLi7bV6P@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull reuqest? Thank
 you! Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qzLwQ-008jKt-25
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.7
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

Could you please consider this pull reuqest?

Thank you!

The following changes since commit 3669558bdf354cd352be955ef2764cde6a9bf5ec:

  Merge tag 'for-6.6-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2023-09-12 11:28:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.7-rc1

for you to fetch changes up to 1e7bef5f90ed69d903768d78369f251b77e5d2f5:

  f2fs: finish previous checkpoints before returning from remount (2023-10-22 06:42:02 -0700)

----------------------------------------------------------------
f2fs update for 6.7-rc1

In this cycle, we introduce a bigger page size support by changing the internal
f2fs's block size aligned to the page size. We also continue to improve zoned
block device support regarding the power off recovery. As usual, there are some
bug fixes regarding the error handling routines in compression and ioctl.

Enhancement:
 - Support Block Size == Page Size
 - let f2fs_precache_extents() traverses in file range
 - stop iterating f2fs_map_block if hole exists
 - preload extent_cache for POSIX_FADV_WILLNEED
 - compress: fix to avoid fragment w/ OPU during f2fs_ioc_compress_file()

Bug fix:
 - do not return EFSCORRUPTED, but try to run online repair
 - finish previous checkpoints before returning from remount
 - fix error handling of __get_node_page and __f2fs_build_free_nids
 - clean up zones when not successfully unmounted
 - fix to initialize map.m_pblk in f2fs_precache_extents()
 - fix to drop meta_inode's page cache in f2fs_put_super()
 - set the default compress_level on ioctl
 - fix to avoid use-after-free on dic
 - fix to avoid redundant compress extension
 - do sanity check on cluster when CONFIG_F2FS_CHECK_FS is on
 - fix deadloop in f2fs_write_cache_pages()

----------------------------------------------------------------
Chao Yu (8):
      f2fs: compress: fix deadloop in f2fs_write_cache_pages()
      f2fs: compress: fix to avoid use-after-free on dic
      f2fs: compress: do sanity check on cluster when CONFIG_F2FS_CHECK_FS is on
      f2fs: compress: fix to avoid redundant compress extension
      f2fs: fix to drop meta_inode's page cache in f2fs_put_super()
      f2fs: compress: fix to avoid fragment w/ OPU during f2fs_ioc_compress_file()
      f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
      f2fs: let f2fs_precache_extents() traverses in file range

Daeho Jeong (2):
      f2fs: clean up zones when not successfully unmounted
      f2fs: finish previous checkpoints before returning from remount

Daniel Rosenberg (1):
      f2fs: Support Block Size == Page Size

Jaegeuk Kim (5):
      f2fs: split initial and dynamic conditions for extent_cache
      f2fs: set the default compress_level on ioctl
      f2fs: preload extent_cache for POSIX_FADV_WILLNEED
      f2fs: stop iterating f2fs_map_block if hole exists
      f2fs: do not return EFSCORRUPTED, but try to run online repair

KaiLong Wang (1):
      f2fs: Clean up errors in segment.h

Su Hui (1):
      f2fs: avoid format-overflow warning

Zhiguo Niu (2):
      f2fs: fix error path of __f2fs_build_free_nids
      f2fs: fix error handling of __get_node_page

 fs/f2fs/compress.c      | 63 +++++++++++++++++--------------
 fs/f2fs/data.c          | 35 ++++++++++++++----
 fs/f2fs/extent_cache.c  | 53 +++++++++++---------------
 fs/f2fs/file.c          | 17 ++++++++-
 fs/f2fs/inode.c         |  2 +-
 fs/f2fs/node.c          | 20 +++++++---
 fs/f2fs/segment.c       | 92 ++++++++++++++++++++++++++++------------------
 fs/f2fs/segment.h       |  4 +-
 fs/f2fs/super.c         | 98 ++++++++++++++++++++++++++++++++++---------------
 fs/f2fs/xattr.c         | 20 ++++++----
 include/linux/f2fs_fs.h | 70 +++++++++++++++++++++--------------
 11 files changed, 296 insertions(+), 178 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
