Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA768668B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 14:15:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNCxi-0002mv-J7;
	Wed, 01 Feb 2023 13:15:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pNCxg-0002mp-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 13:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a7TH40Vtfhiz5+dn8HPTikveBj9zvunKTGDtFQ0ivw=; b=CXfD8GLTjPrh5y44e+LBjR8TaR
 Lebs4tR7R67i3IDPyATDn+bDo5+ko7EXcxqRFkEDPb4RnysQ4luFc+AgYY1IOC0Cd8C+nKoThdwqb
 P5sr8ODJN14lutXpTuGYBkio3yZkPbCEim/KtXpzWLWXDr/qP3O6KQ3HcuB1O+lq94fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9a7TH40Vtfhiz5+dn8HPTikveBj9zvunKTGDtFQ0ivw=; b=C
 ChLoaytUzBY1xzEDazmhm38wYPHbVPIq/iAut+ngsOZUVnzjDil3U9WRDflS92nq9V33lX6fyAfnp
 EwEt8WUOF6ifw/sj6msZrOXidEPFMFG18JFmGqQAkTZq3fjm4cY2JEYwDnPQ5p+N7VO+obGcz77Xw
 SGTOpU0FB2cEgrY8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNCxe-0005K5-KV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 13:15:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABAB6179D;
 Wed,  1 Feb 2023 13:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AA1C4339C;
 Wed,  1 Feb 2023 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675257333;
 bh=XAJ9eI3svGJuqVTJUnSxvv9YTA0l+xndj1Jw+Z1jagQ=;
 h=From:Subject:Date:To:Cc:From;
 b=L6kcghG3qlSeMxpxJRTGEDsALZmiJfrEU0V/1HEmYbKdW3rFnVUs9UIDGEzRKYWtg
 tNZzlaYWaIZ/V/zWFYd268DI///8vZp3gH/a3eMLEBUra7aFO5vCuAX3ny4Qg2knsu
 7SkTsf7m5s+phGrgqngNkAkoJynRpIjDp8j8ze7OkExaens9ORzfEpQk0u7+zU+os7
 yzrAYpV28OZVUPw87eK7VkGLUZRaFhvqXpHMjCFYujJU0xpJxhkiKFVDQbZEJW5S2X
 E23YVPr1cktPKIhzi9VOTFNrcHU9h4XmlnPv8G3KBrajxBmW890T7Bup3Dn/V6lTSV
 PrqccGKzSWKiA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 01 Feb 2023 14:14:51 +0100
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMtl2mMC/52PQQ6CMBBFr0K6dggtlFRX3sO4aMsAjdiaKWkwh
 Ltb2LnU5Z/Mf/NmZRHJYWSXYmWEyUUXfA71qWB21H5AcF3OTFSirriQ0EfQdgLCZ0gIA/rct7D
 oeSbIhW5CitDYHjslpeqUYhlldEQwpL0dd9hTxxmpTG0pgGy7b7wIe7ccIrd7zqOLc6D34ZX4P
 v1RIXGooLU9l9I0Z2Ha6wPJ41QGGth+IYl/qCJTBc//GaWMkd/Ubds+iR28gVEBAAA=
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5419; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XAJ9eI3svGJuqVTJUnSxvv9YTA0l+xndj1Jw+Z1jagQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSTfSv1oIS8Y+vZS+2+RiV9u2ffcfnlfcMkFr9JtvM2zv/pV
 e8oXdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExEeRPDP42QU9NFLmeXcj38M226z9
 yHHdvWpMwS360qvenTKoW1lfsZ/rttUTXnv7b10sa2GD7dbdfYvI9mB9qqrE44tEiQ+fXxRcwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hey everyone, After we finished the introduction of the new
 posix acl api last cycle we still left the generic POSIX ACL xattr handlers
 around in the filesystems xattr handlers for two reasons: (1) Because a few
 filesystems rely on the ->list() method of the generic POSIX ACL xattr
 handlers
 in their ->listxattr() inode operation. (2) POSIX ACLs are only available
 if IOP_XATTR is raised. The [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNCxe-0005K5-KV
Subject: [f2fs-dev] [PATCH v3 00/10] acl: drop posix acl handlers from xattr
 handlers
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
 linux-unionfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hey everyone,

After we finished the introduction of the new posix acl api last cycle
we still left the generic POSIX ACL xattr handlers around in the
filesystems xattr handlers for two reasons:

(1) Because a few filesystems rely on the ->list() method of the generic
    POSIX ACL xattr handlers in their ->listxattr() inode operation.
(2) POSIX ACLs are only available if IOP_XATTR is raised. The IOP_XATTR
    flag is raised in inode_init_always() based on whether the
    sb->s_xattr pointer is non-NULL. IOW, the registered xattr handlers
    of the filesystem are used to raise IOP_XATTR.
    If we were to remove the generic POSIX ACL xattr handlers from all
    filesystems we would risk regressing filesystems that only implement
    POSIX ACL support and no other xattrs (nfs3 comes to mind).

This series makes it possible to remove the generic POSIX ACL xattr
handlers from the sb->s_xattr list of all filesystems. This is a crucial
step as the generic POSIX ACL xattr handlers aren't used for POSIX ACLs
anymore and POSIX ACLs don't depend on the xattr infrastructure in a
meaningful way anymore.

Adressing problem (1) will require more work long-term. It would be best
to get rid of the ->list() method of xattr handlers completely if we
can.

For erofs, ext{2,4}, f2fs, jffs2, ocfs2, and reiserfs we keep the dummy
handler around so they can continue to use array-based xattr handler
indexing. The series does simplify the ->listxattr() implementation of
all these filesystems.

This series decouples POSIX ACLs from IOP_XATTR as they don't depend on
xattr handlers anymore. With this we can finally remove the dummy xattr
handlers from all filesystems xattr handlers.

All filesystems with reasonable integration into xfstests have been
tested with:

        ./check -g acl,attr,cap,idmapped,io_uring,perms,unlink

All tests pass without regression on xfstests for-next branch.

Since erofs doesn't have integration into xfstests yet afaict I have
tested it with the testuite available in erofs-utils. They also all pass
without any regressions.

Thanks!
Christian

Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Changes in v3:
- Decouple POSIX ACLs from IOP_XATTR.
- Allow vfs_listxattr() to function without checking for IOP_XATTR
  making it possible to list POSIX ACLs for filesystems that only
  implement POSIX ACLs and no other xattrs.
- Give reiserfs a set of dedicated inode operation for private inodes
  that have turned of xattrs completely.
- Link to v2: https://lore.kernel.org/r/20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org

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
Christian Brauner (10):
      xattr: simplify listxattr helpers
      xattr: add listxattr helper
      xattr: remove unused argument
      fs: drop unused posix acl handlers
      fs: simplify ->listxattr() implementation
      reiserfs: rework ->listxattr() implementation
      fs: rename generic posix acl handlers
      reiserfs: rework priv inode handling
      ovl: check for ->listxattr() support
      acl: don't depend on IOP_XATTR

 fs/9p/xattr.c                   |   4 --
 fs/btrfs/xattr.c                |   4 --
 fs/ceph/xattr.c                 |   4 --
 fs/cifs/xattr.c                 |   4 --
 fs/ecryptfs/inode.c             |   4 --
 fs/erofs/xattr.c                |  12 +---
 fs/erofs/xattr.h                |  20 ++++---
 fs/ext2/xattr.c                 |  25 ++++----
 fs/ext4/xattr.c                 |  25 ++++----
 fs/f2fs/xattr.c                 |  24 ++++----
 fs/gfs2/xattr.c                 |   2 -
 fs/jffs2/xattr.c                |  29 +++++-----
 fs/jfs/xattr.c                  |   4 --
 fs/nfs/nfs3_fs.h                |   1 -
 fs/nfs/nfs3acl.c                |   6 --
 fs/nfs/nfs3super.c              |   3 -
 fs/nfsd/nfs4xdr.c               |   3 +-
 fs/ntfs3/xattr.c                |   4 --
 fs/ocfs2/xattr.c                |  14 ++---
 fs/orangefs/xattr.c             |   2 -
 fs/overlayfs/copy_up.c          |   3 +-
 fs/overlayfs/super.c            |   8 ---
 fs/posix_acl.c                  |  61 +++++++++++++++-----
 fs/reiserfs/file.c              |   7 +++
 fs/reiserfs/inode.c             |   6 +-
 fs/reiserfs/namei.c             |  50 ++++++++++++++--
 fs/reiserfs/reiserfs.h          |   2 +
 fs/reiserfs/xattr.c             |  55 +++++++++---------
 fs/xattr.c                      | 124 ++++++++++++++++++++--------------------
 fs/xfs/xfs_xattr.c              |   4 --
 include/linux/posix_acl.h       |   7 +++
 include/linux/posix_acl_xattr.h |   5 +-
 include/linux/xattr.h           |  19 +++++-
 mm/shmem.c                      |   4 --
 34 files changed, 292 insertions(+), 257 deletions(-)
---
base-commit: ab072681eabe1ce0a9a32d4baa1a27a2d046bc4a
change-id: 20230125-fs-acl-remove-generic-xattr-handlers-4cfed8558d88



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
