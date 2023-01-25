Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 391ED67B12F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jan 2023 12:29:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKdyE-000667-UX;
	Wed, 25 Jan 2023 11:29:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pKdyD-000660-0I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 11:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XArVxmj+IwvPr9caruOG1hNSMWRWNwrrhrJGhaz21Gc=; b=BWVQieRzmPJzeGryTPT30uOA6L
 AXUX/vPgb4/WvYzp7ezOvqIKGpuVTIcorx5O3x8xwGxNfXusbqTPNf1rmKjSfA64wZ0xMmVhBULme
 hU5ixR4AoiIV+Vw4CQYlCnPgZ/VnK2Vjee/r9Xghx9ukPj3j5CS/RFM31Dqu7jdICfaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XArVxmj+IwvPr9caruOG1hNSMWRWNwrrhrJGhaz21Gc=; b=S
 0yUzAMQCCuO/c0OnXBIZYpwMlAKtVbofFN0Fl8aXfm+HAArwfksEC8NNtgWFSDE/OMwTolk6hW/od
 0Lm7luEokUD36o57n1CHl/7v0tyqsnHIyco3on4OJdNajwlKbAXSmA3JQrXTaZ90dKiEF4Lr7yR2K
 Hrbo4Thga55b71fY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKdy7-0006qR-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 11:29:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0714B61356;
 Wed, 25 Jan 2023 11:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAC2C433EF;
 Wed, 25 Jan 2023 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674646165;
 bh=iVepgeT7psmWqr/2L8LpCH4RngFmQJ2i/zddXU3Ybms=;
 h=From:Subject:Date:To:Cc:From;
 b=aa0adWk8JIHYbDKjUCphZ1mzhrcTx2e5m+zTBZn9obQWuMBhYiKhvxE/PfkC0DrMo
 n+Ti2ja6VfjxgUnPOpsi1+/EmtHqmyra/AonZ5w9wjQlfzKpsP+4TOI050CJaL0N1y
 bKz7YhLgOmOvqok9PjXvsoVl3tKqVYUbksPXEapn+w0KefS9YB16xUcTypEO9pAwIN
 evQ3wG1KZlyA608u+IFmR08EX1UGoUJze8vveYRXvWqAxEv1eQ5rc5zD6Fc879yXFq
 13JMMXTEhD0lFVC6szsgPPomAG4klotXLnPAg8gEVmP0MH1tcrAZMyEp+bDrceHz66
 q2f2/uwZQY7jw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 25 Jan 2023 12:28:45 +0100
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG4S0WMC/x2O0QqDMBAEf0XuuSeaVgj9ldKHmGw0YGO5UxHEf
 2/s47DMsAcpJEHpWR0k2JKmORdobxX50eUBnEJhMo25N63pOCo7P7HgM2/gAbn4nne3LMJFCBN
 E+eEjgu06G6ylkuqdgntx2Y9XLGodV0VdQtf6FcS0/0+83uf5A07KJIqUAAAA
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964; i=brauner@kernel.org;
 h=from:subject:message-id; bh=iVepgeT7psmWqr/2L8LpCH4RngFmQJ2i/zddXU3Ybms=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRfFJq42SCo7mej0syzO7/VS69Ps21sFO48f9znuHr/fZEX
 p52lO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYSeIbhn+X/3zmPrKtsko21fh3Smv
 5k/WvP2Uo6Sw92TuXesanV+BYjw7wCO68bLxsFprMsyP59RaXIcbL7hMBFnntnmxRL2pSJsAIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hey everyone, after we finished the introduction of the new
 posix acl api last cycle we still left the generic POSIX ACL xattr handler
 around for two reasons. First, because a few filesystems relied on the ->list()
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pKdy7-0006qR-E7
Subject: [f2fs-dev] [PATCH 00/12] acl: remove remaining posix acl handlers
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
 Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hey everyone,

after we finished the introduction of the new posix acl api last cycle
we still left the generic POSIX ACL xattr handler around for two
reasons. First, because a few filesystems relied on the ->list() method
of the generic POSIX ACL xattr handlers in their ->listxattr() inode
operation. Second, during inode initalization in inode_init_always() the
registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
inode->i_opflags.

With the removal of the legacy POSIX ACL handlers it is at least
possible for a filesystem to only implement POSIX ACLs but no other
xattrs. If that were to happen we would miss to raise IOP_XATTR because
sb->s_xattr would be NULL.

Fix these things and then get rid of the misleading and effectively
already unused generic POSIX ACL handlers.

For most filesystems it is a trivial removal of the generic POSIX ACL
handlers. Only for erofs, ext2, ext4, f2fs, jffs2, reiserfs, oc2fs the
handler is used but rather easy to fix.

All filesystems with reasonable integration into xfstests have been
tested with:

        ./check -g acl,attr,cap,idmapped,io_uring,perms,unlink

All tests pass without regression on xfstests for-next branch.

Since erofs doesn't have integration into xfstests yet afaict I have
tested it with the testuite available in erofs-utils. They also all pass
without any regressions.

This branch depends on [1] which hopefully should be merged soon and can
be pulled from [2] which already includes [1] so it's easy to test and
compile.

With this all remnants of the old POSIX ACL xattr handling will be gone.

Thanks!
Christian

[1]: https://lore.kernel.org/lkml/20230125100040.374709-1-brauner@kernel.org
[2]: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git tags/fs.acl.remove.generic.xattr.handlers.v1

Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Christian Brauner (12):
      xattr: simplify listxattr helpers
      xattr, posix acl: add listxattr helpers
      xattr: remove unused argument
      fs: drop unused posix acl handlers
      erofs: drop posix acl handlers
      ext2: drop posix acl handlers
      ext4: drop posix acl handlers
      f2fs: drop posix acl handlers
      jffs2: drop posix acl handlers
      ocfs2: drop posix acl handlers
      reiserfs: drop posix acl handlers
      acl: remove posix acl handlers

 fs/9p/xattr.c                   |   4 --
 fs/btrfs/xattr.c                |   4 --
 fs/ceph/xattr.c                 |   4 --
 fs/cifs/xattr.c                 |   4 --
 fs/ecryptfs/inode.c             |   4 --
 fs/erofs/xattr.c                |  49 ++++++++++++----
 fs/erofs/xattr.h                |  21 -------
 fs/ext2/xattr.c                 |  60 +++++++++++--------
 fs/ext4/xattr.c                 |  71 +++++++++++++----------
 fs/f2fs/xattr.c                 |  63 ++++++++++++--------
 fs/gfs2/xattr.c                 |   2 -
 fs/jffs2/xattr.c                |  42 +++++++-------
 fs/jfs/xattr.c                  |   4 --
 fs/nfs/nfs3_fs.h                |   1 -
 fs/nfs/nfs3acl.c                |   6 --
 fs/nfs/nfs3super.c              |   3 -
 fs/nfsd/nfs4xdr.c               |   3 +-
 fs/ntfs3/xattr.c                |   4 --
 fs/ocfs2/xattr.c                |  41 +++++++------
 fs/orangefs/xattr.c             |   2 -
 fs/overlayfs/super.c            |   8 ---
 fs/posix_acl.c                  |  20 -------
 fs/reiserfs/xattr.c             |  38 ++++++------
 fs/xattr.c                      | 124 ++++++++++++++++++++--------------------
 fs/xfs/xfs_xattr.c              |   4 --
 include/linux/posix_acl_xattr.h |   6 +-
 include/linux/xattr.h           |   8 ++-
 mm/shmem.c                      |   4 --
 28 files changed, 290 insertions(+), 314 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230125-fs-acl-remove-generic-xattr-handlers-4cfed8558d88



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
