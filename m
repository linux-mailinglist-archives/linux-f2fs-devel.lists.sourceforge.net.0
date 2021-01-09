Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1B2EFE5E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9AM-0007BQ-S7; Sat, 09 Jan 2021 08:00:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9AK-0007BD-5J
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqG0HFNHreWDPKWL7aNlAqR4US5aMR0UvH7ugvLAnKY=; b=PPBcUD+3+SnU6HDTc7zvJ4LGC2
 uA6LJPe1Cbn/fgSJJ89Oe5nXCIVQQxG6uFTrCE6+wFL7vIrpoCX2e6Fvu4aYd/uFYiWmwlhg3/Syd
 6/BHVeGIz25D/PE0X1+fWTavKLC0mydQJlBhuUGSlfHPBWGDjw7yeDbQBFM2CPbDwdWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lqG0HFNHreWDPKWL7aNlAqR4US5aMR0UvH7ugvLAnKY=; b=K
 A9ocKHcTpCXK44dNKdM69uJkVLlygr/i807fscvQoiaNIFjrz0Lv41fZbq4mNi/nKsF8ZPlELW/qp
 AfGsElpMeXCdGdfs3nvHbUcX1RPcNE8cBbh7F/5B4FIQRGwtK8N2Nu128iSAaAw1spvHqpe8uc1ct
 S5YCUl3TuGaA0tXQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AA-002qXm-1J
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4A01238E8;
 Sat,  9 Jan 2021 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179183;
 bh=ACg45O7fwl+jjbSXOKOgmB8S7GJDMNFMcVb39xwXyqc=;
 h=From:To:Cc:Subject:Date:From;
 b=FUWwrKFxWbAldpKEGaeqArDF0GOisvWQyMA+9vwJkP4Bic2Uq485vNk3j8Xmtjzlu
 4w/JNw6y22kZM6y+CvSS2vYHcsLC/LJ/N3mrIpb2Q0SsiAvgn/0KYmchTVoOf6aJAq
 8vjVL2EEds2Iu/85xLzmecooyeyTMqUVpiZ/381FY3dgeNMe2M1GbuYGZp6wa0eIx6
 /e8aOB7P2P1kY2v/z4a32ovGbtqrFPUp1xeZ/NvOuu+tbD6FOvKAC920ny3Z1ky7mV
 RKnk6udMZy//aHEjWPnP6Lze4YLCscFq1/SlorEcOsou3Pl0TSpc+j2oHB51vPRerl
 BcgHHVXXR3CVw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:51 -0800
Message-Id: <20210109075903.208222-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AA-002qXm-1J
Subject: [f2fs-dev] [PATCH v2 00/12] lazytime fix and cleanups
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

Patch 1 fixes a bug in how __writeback_single_inode() handles lazytime
expirations.  I originally reported this last year
(https://lore.kernel.org/r/20200306004555.GB225345@gmail.com) because it
causes the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl to not work properly, as
the bug causes inodes to remain dirty after a sync.

It also turns out that lazytime on XFS is partially broken because it
doesn't actually write timestamps to disk after a sync() or after
dirtytime_expire_interval.  This is fixed by the same fix.

This supersedes previously proposed fixes, including
https://lore.kernel.org/r/20200307020043.60118-1-tytso@mit.edu and
https://lore.kernel.org/r/20200325122825.1086872-3-hch@lst.de from last
year (which had some issues and didn't fix the XFS bug), and v1 of this
patchset which took a different approach
(https://lore.kernel.org/r/20210105005452.92521-1-ebiggers@kernel.org).

Patches 2-12 then clean up various things related to lazytime and
writeback, such as clarifying the semantics of ->dirty_inode() and the
inode dirty flags, and improving comments.  Most of these patches could
be applied independently if needed.

This patchset applies to v5.11-rc2.

Changed since v1:
  - Switched to the fix suggested by Jan Kara, and dropped the
    patches which introduced ->lazytime_expired().
  - Fixed bugs in the fat and ext4 patches.
  - Added patch "fs: improve comments for writeback_single_inode()".
  - Reordered the patches a bit.
  - Added Reviewed-by's.

Eric Biggers (12):
  fs: fix lazytime expiration handling in __writeback_single_inode()
  fs: correctly document the inode dirty flags
  fs: only specify I_DIRTY_TIME when needed in generic_update_time()
  fat: only specify I_DIRTY_TIME when needed in fat_update_time()
  fs: don't call ->dirty_inode for lazytime timestamp updates
  fs: pass only I_DIRTY_INODE flags to ->dirty_inode
  fs: clean up __mark_inode_dirty() a bit
  fs: drop redundant check from __writeback_single_inode()
  fs: improve comments for writeback_single_inode()
  gfs2: don't worry about I_DIRTY_TIME in gfs2_fsync()
  ext4: simplify i_state checks in __ext4_update_other_inode_time()
  xfs: remove a stale comment from xfs_file_aio_write_checks()

 Documentation/filesystems/vfs.rst |   5 +-
 fs/ext4/inode.c                   |  20 +----
 fs/f2fs/super.c                   |   3 -
 fs/fat/misc.c                     |  23 +++---
 fs/fs-writeback.c                 | 132 +++++++++++++++++-------------
 fs/gfs2/file.c                    |   4 +-
 fs/gfs2/super.c                   |   2 -
 fs/inode.c                        |  38 +++++----
 fs/xfs/xfs_file.c                 |   6 --
 include/linux/fs.h                |  18 ++--
 10 files changed, 132 insertions(+), 119 deletions(-)


base-commit: e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
