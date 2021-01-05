Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1C2EA1AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadD-0006LJ-1f; Tue, 05 Jan 2021 00:55:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadC-0006L4-CI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PRk5+6EVp3WSU1VS97bf7o8y4AWEtF1SVBGxWq9BCU0=; b=XorPeTdg5Lb5svmNKH7CW2uKf0
 1rNcU1IKwg3fhxcehbs+M15b3duXvHbiWCex/JO4Wlh2vepv5twVPe8yNCfbUEaT5gJ7HkbP+xpnS
 mgY2n3K5r7rorKGA4OZJ1tOZF7gru/pmKsWvf6x1B9q/AuQ2L8KdgrAS4zS78EpTgOkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PRk5+6EVp3WSU1VS97bf7o8y4AWEtF1SVBGxWq9BCU0=; b=h
 cYEolaChH4xPQFt4dloBuSH93rTNoIU71q2qxixxMw/1j/pogMgWc0d7Pz8DOZQ0uTODcCGXBf/0b
 uqw0cYu7OVs+TuoKtrV4KzRiVHLw5bEglgjrbZWrVvHo2wcC9pI+ND8jJmV4JGr/RuDZih0rWGT2q
 QAlksdKR5xLU0F3Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwad3-00E0Ou-0J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86D102253A;
 Tue,  5 Jan 2021 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808106;
 bh=vW1bfeQdX9BhgUQwC/CMk7URLM4cDiT6xtDR+MDGdnQ=;
 h=From:To:Cc:Subject:Date:From;
 b=a/rhmmA4Es5Lzendc5wuI1ciHBAOd3gT6tF/EzCaBjP2l0zF5PZ9pojAY3DnXJva0
 DlZuSQHH92CNOdm1BG+JTmpCMMX4k0kVkV1FHaAQk/vjdhcJwrLg/4WvEw5nF8CE/U
 um4gEedPsGkVB7BgrbxccekFmgV24iTBeM7WkWN2/V0eYeepsznEHuToM9UU3qNMEo
 zp+L2h0LtaCb5rS31RmumwRxoe9N7xVg47WtRrCC7USmlmuDxPXAUIelxMCwACy0GR
 xsyQce5EFxzNpw0gczY5F3PhY2Oy33072x40R1SSLLjFCjTaX0tKIkGfigfe/iOgel
 irKjq6A7uNQiw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:39 -0800
Message-Id: <20210105005452.92521-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwad3-00E0Ou-0J
Subject: [f2fs-dev] [PATCH 00/13] lazytime fixes and cleanups
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

This patchset fixes the lazytime bug which I reported last year
(https://lore.kernel.org/r/20200306004555.GB225345@gmail.com).  This bug
causes inodes with dirty timestamps to remain dirty after a sync, which
causes the inodes to be unnecessarily written again, and also causes the
FS_IOC_REMOVE_ENCRYPTION_KEY ioctl to not work properly.  This bug is
causing xfstest generic/580 to fail when lazytime is enabled.

Ted and Christoph proposed fixes for this.  Ted's fix
(https://lore.kernel.org/r/20200307020043.60118-1-tytso@mit.edu) changed
the call to mark_inode_dirty_sync(inode) in __writeback_single_inode()
to ->dirty_inode(inode, I_DIRTY_TIME_EXPIRED).  However this would have
broken XFS, which wants an I_DIRTY_SYNC notification.  Also, people
preferred a larger rework involving adding a ->lazytime_expired method.

Christoph's fix
(https://lore.kernel.org/r/20200325122825.1086872-3-hch@lst.de)
introduced ->lazytime_expired, but it wasn't correct because it didn't
consider cases in which timestamps are force-expired.

To resolve this, I propose that we first fix the bug by making
__writeback_single_inode() do an I_DIRTY_SYNC notification if the
timestamps expired (patch #1).

Then, the remaining patches introduce ->lazytime_expired and make XFS
use it.  They also clean up various things, such as improving comments.

Also, it turns out that lazytime on XFS is broken because it doesn't
actually write timestamps to disk after a sync() or after 24 hours.
This is fixed by the patch to switch XFS to use ->lazytime_expired.
I've written an xfstest which reproduces this bug.

This patchset applies to v5.11-rc2.

Eric Biggers (13):
  fs: avoid double-writing inodes on lazytime expiration
  gfs2: don't worry about I_DIRTY_TIME in gfs2_fsync()
  fs: only specify I_DIRTY_TIME when needed in generic_update_time()
  fat: only specify I_DIRTY_TIME when needed in fat_update_time()
  fs: don't call ->dirty_inode for lazytime timestamp updates
  fs: pass only I_DIRTY_INODE flags to ->dirty_inode
  fs: correctly document the inode dirty flags
  ext4: simplify i_state checks in __ext4_update_other_inode_time()
  fs: drop redundant checks from __writeback_single_inode()
  fs: clean up __mark_inode_dirty() a bit
  fs: add a lazytime_expired method
  xfs: remove a stale comment from xfs_file_aio_write_checks()
  xfs: implement lazytime_expired

 Documentation/filesystems/locking.rst |  2 +
 Documentation/filesystems/vfs.rst     | 15 ++++-
 fs/ext4/inode.c                       | 20 ++----
 fs/f2fs/super.c                       |  3 -
 fs/fat/misc.c                         | 21 +++---
 fs/fs-writeback.c                     | 94 +++++++++++++++++++--------
 fs/gfs2/file.c                        |  4 +-
 fs/gfs2/super.c                       |  2 -
 fs/inode.c                            | 40 ++++++------
 fs/sync.c                             |  2 +-
 fs/xfs/xfs_file.c                     |  6 --
 fs/xfs/xfs_super.c                    | 12 +---
 include/linux/fs.h                    | 25 +++++--
 13 files changed, 143 insertions(+), 103 deletions(-)


base-commit: e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
