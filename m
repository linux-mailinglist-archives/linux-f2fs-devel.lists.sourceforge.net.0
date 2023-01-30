Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA56816A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 17:42:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMXEe-0004SO-SK;
	Mon, 30 Jan 2023 16:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pMXEa-0004SE-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 16:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ghUIty1GYfvmhiwH2v7bq5dY3b4OvGJy7CkPEHIvqrE=; b=WMFyPdzZz2MRShhO9PvNXGLPjx
 bzV77Syk3W4ssg1stvziw1ozi9izp+506hoKKurvDIR2l/e4x/jbhnou8XEqpWvEzQlNKfNnO+OER
 ejz9IdH2Zo99+1YIn4YD71VWf14AaTiK4Qgs9SZ3UX4I+7yxD38ZPQZfLOYt1RwpQtbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ghUIty1GYfvmhiwH2v7bq5dY3b4OvGJy7CkPEHIvqrE=; b=k
 FuHnXzCVK8/eB1+a0HEHw0K1SOQHQ6E2L/wXR8Lg5eIfGwohrB4L5SlR0SJToNnnvhAxaCuHdRgVr
 HCv22+yofpkqxf8QclCUa0L2rl8N5/6WbIGMxEZo6pRmcjJdlFZANA5cMcjcmtfMpK5AokTBjpUmb
 H0ZrE7iWyeEKaB64=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMXEW-003vgq-Rg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 16:42:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C1ACB80C9B;
 Mon, 30 Jan 2023 16:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97B4C433EF;
 Mon, 30 Jan 2023 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675096929;
 bh=spTKhIOwCpWESMlTwbq6jQvoegfh5VVyof6YCbDvZiA=;
 h=From:Subject:Date:To:Cc:From;
 b=W4aXvDhu1PQQoT3TqK3C+78F6hJXpfzMa9MQE1upEWlHVyXyzPaFEUR041ZjPTTBt
 UBHuMBtmm6h2rTumdkxVHMKbxpgMvQElm+PbKwyG/4rOyyOUrBCTIsmQiVm8Qv/Owa
 tKVhCJa/VKzEXuE7Royd/+dzxhMgSzXG/aaTnsTmlZRAvAcWwFHkxtzRUgnGBLDeZW
 lbW5F0Ql0CYG8ANGG9O1F4XIs1Vase0A42lQtA+mwoc1d0c6VcQAAubuf0idMYDyv4
 nDjQI47YvRTn6xEZ2Azx5NxkGGTvEnszB5e/usgHav1wSsygcKNDdsKxbCHfuaXcgu
 MGz3AkO5us9hw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 30 Jan 2023 17:41:56 +0100
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFTz12MC/5WOQQ6DIBREr2JY9xulQmxXvUfjAvCjpBaaDyE2x
 rsXvUGXbzIzeRuLSA4ju1cbI8wuuuAL8EvFzKz8hODGwow3/Nq0XICNoMwChO+QESb0ZW9gVSk
 RlMG4IEXojMWxF6If+56VK60igiblzXycvVVMSHWWNQcy8mh8CK1bT5HnUHh2MQX6nl65PdI/F
 XILDUhjWyF0d+NaPl5IHpc60MSGfd9/4XJ8uvsAAAA=
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4824; i=brauner@kernel.org;
 h=from:subject:message-id; bh=spTKhIOwCpWESMlTwbq6jQvoegfh5VVyof6YCbDvZiA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRf/xy7MHzFC0en5pVbFi3YzJht3qr0faqqWs61Wf67Os8+
 /qd+v6OUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiCf4M/3Qlu/9u+8bb5/u4m/OAOP
 Nz3qxiFY6vm27/V3hv7v/+vBjDPxW2ydktxi/v3JxlO2Hxd6YXV1bfsT68X50lk2OapMH5M/wA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hey everyone, after we finished the introduction of the new
 posix acl api last cycle we still left the generic POSIX ACL xattr handlers
 around in the filesystems xattr handler registered at sb->s_xattr for two
 reas [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMXEW-003vgq-Rg
Subject: [f2fs-dev] [PATCH v2 0/8] acl: remove generic posix acl handlers
 from all xattr handlers
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
Cc: "Christian Brauner \(Microsoft\)" <brauner@kernel.org>,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hey everyone,

after we finished the introduction of the new posix acl api last cycle
we still left the generic POSIX ACL xattr handlers around in the
filesystems xattr handler registered at sb->s_xattr for two reasons.
First, because a few filesystems rely on the ->list() method of the
generic POSIX ACL xattr handlers in their ->listxattr() inode operation.
Second, during inode initalization in inode_init_always() the registered
xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
inode->i_opflags.

This series adresses both issues and makes it possible to remove the
generic POSIX ACL xattr handlers from the sb->s_xattr list of all
filesystems. This is a crucial step as the generic POSIX ACL xattr
handlers aren't used for POSIX ACLs anymore. They are never used apart
from the two cases above.

To fix this we make POSIX ACLs independent of IOP_XATTR. For filesystems
like btrfs or reiserfs that want to disable xattrs and POSIX ACLs for
some inodes we give them a dedicated IOP_NOACL flag they can raise as
discussed in the previous iteration.

The series also simplifies a the ->listxattr() implementation for all
filesystems that rely on the ->list() method of the xattr handlers.

After this we've removed the generic POSIX ACL xattr handlers completely
from sb->s_xattr.

All filesystems with reasonable integration into xfstests have been
tested with:

        ./check -g acl,attr,cap,idmapped,io_uring,perms,unlink

All tests pass without regression on xfstests for-next branch.

Since erofs doesn't have integration into xfstests yet afaict I have
tested it with the testuite available in erofs-utils. They also all pass
without any regressions.

Thanks!
Christian

[1]: https://lore.kernel.org/lkml/20230125100040.374709-1-brauner@kernel.org
[2]: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git tags/fs.acl.remove.generic.xattr.handlers.v1

Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Changes in v2:
- Please see changelogs of the individual patches.
- Christoph & Christian:
  Remove SB_I_XATTR and instead introduce IOP_NOACL so filesystems can
  opt out of POSIX ACLs for specific inodes. Decouple POSIX ACLs from
  IOP_XATTR.
- Keep generic posix acl xattr handlers so filesystems that use array
  based indexing on xattr handlers can continue to do so.
- Minor fixes.
- Link to v1: https://lore.kernel.org/r/20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org

---
Christian Brauner (8):
      fs: don't use IOP_XATTR for posix acls
      xattr: simplify listxattr helpers
      xattr: add listxattr helper
      xattr: remove unused argument
      fs: drop unused posix acl handlers
      fs: simplify ->listxattr() implementation
      reiserfs: rework ->listxattr() implementation
      fs: rename generic posix acl handlers

 fs/9p/xattr.c                   |   4 --
 fs/bad_inode.c                  |   3 +-
 fs/btrfs/inode.c                |   2 +-
 fs/btrfs/xattr.c                |   4 --
 fs/ceph/xattr.c                 |   4 --
 fs/cifs/xattr.c                 |   4 --
 fs/ecryptfs/inode.c             |   4 --
 fs/erofs/xattr.c                |  12 +----
 fs/erofs/xattr.h                |  20 +++++---
 fs/ext2/xattr.c                 |  25 +++++-----
 fs/ext4/xattr.c                 |  25 +++++-----
 fs/f2fs/xattr.c                 |  24 +++++-----
 fs/gfs2/xattr.c                 |   2 -
 fs/jffs2/xattr.c                |  29 ++++++------
 fs/jfs/xattr.c                  |   4 --
 fs/libfs.c                      |   3 +-
 fs/nfs/nfs3_fs.h                |   1 -
 fs/nfs/nfs3acl.c                |   6 ---
 fs/nfs/nfs3super.c              |   3 --
 fs/nfsd/nfs4xdr.c               |   3 +-
 fs/ntfs3/xattr.c                |   4 --
 fs/ocfs2/xattr.c                |  14 ++----
 fs/orangefs/xattr.c             |   2 -
 fs/overlayfs/copy_up.c          |   4 +-
 fs/overlayfs/super.c            |   8 ----
 fs/posix_acl.c                  |  53 +++++++++++++++++----
 fs/reiserfs/inode.c             |   2 +-
 fs/reiserfs/namei.c             |   4 +-
 fs/reiserfs/reiserfs.h          |   2 +-
 fs/reiserfs/xattr.c             |  74 +++++++++++++++--------------
 fs/xattr.c                      | 101 +++++++++++++++-------------------------
 fs/xfs/xfs_xattr.c              |   4 --
 include/linux/fs.h              |   1 +
 include/linux/posix_acl.h       |   7 +++
 include/linux/posix_acl_xattr.h |   5 +-
 include/linux/xattr.h           |  30 +++++++++++-
 mm/shmem.c                      |   4 --
 37 files changed, 245 insertions(+), 256 deletions(-)
---
base-commit: ab072681eabe1ce0a9a32d4baa1a27a2d046bc4a
change-id: 20230125-fs-acl-remove-generic-xattr-handlers-4cfed8558d88



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
