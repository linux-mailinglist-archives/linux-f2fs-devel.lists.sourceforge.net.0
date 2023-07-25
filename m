Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14396761C70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 16:59:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOJV5-0003U8-JB;
	Tue, 25 Jul 2023 14:59:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qOJV3-0003U2-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 14:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GocjAOPmzyscTT3gG2qPG5sm82nrhCcD+0oqPXhROfM=; b=d4LUDHskpaC2d0zSPvs4TMwM/7
 /czZqFnxLQ4r6ruX9gAz6xrY5P/OAQWOv3Q0OXaYDW524+apcVxSxvyU8FwbEdHivGF0Fq5YVHhrL
 8578SKGwq8yZLMpgAOO7PM/0PDVa8CUpoxMpMKOFoXKb/liQyJuNMbDsR0rhv/O3qDZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GocjAOPmzyscTT3gG2qPG5sm82nrhCcD+0oqPXhROfM=; b=H
 T3BASh24R1qRniR+P14GnWE9D5qoGGFru5HrKHmbP2POWSLMOUi5BO72QOhbU/xwqScS8GE6DLnLG
 +tFtwuk94BZ24XuStPrIu/TwtrReSco8RM9LciLH4WjHHeV/er9SF4kVnga10q82R3oRJ2bwBfj07
 qI1UGUXTPOQK/KIc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOJV3-0007AP-CO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 14:58:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7709061788;
 Tue, 25 Jul 2023 14:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1AFC433C7;
 Tue, 25 Jul 2023 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690297130;
 bh=kJmXJEYOHolov3dHsrtrgrStBu4dP1/spGmtmesqCM4=;
 h=From:Subject:Date:To:Cc:From;
 b=tew70jtU4OJWY1VbyooHq/A2VejA7/kDYVzXCKKk0H55cxVTHNA5fhMx/XsjUHQdE
 k5N+TCbrt7BP6IVsZV/kGZrQ02GB42Vzuf0A/KFgIUnPd4ROGpWY2ZHkqKjdfticNu
 OMaM7K65I6mQEbZGCqcmN0tUAgZUl/rzmSoYBUrwJChy9IKciiWQK4nWbSqxwsObTI
 WPQKI9eXf8A84+Mo2pDjNDrS2sLAG7LjBgXOQD6AC8ZVS0weRNDBcGZHDJasTY4XM+
 XZNGcH/BVwcKp56pkarr6oFqhSjNamDWitCJbkz8MEmn3MzaR1dixLan1haVIWlNtj
 Ymp6wr5QNgrPg==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 25 Jul 2023 10:58:13 -0400
Message-Id: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAbjv2QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI2MDc0Nj3dz05JLM3FTdNKNEy7RkYyMTS0MLJaDqgqLUtMwKsEnRsbW1AIV
 mFAhZAAAA
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4902; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kJmXJEYOHolov3dHsrtrgrStBu4dP1/spGmtmesqCM4=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBkv+Mj+zS9rris6Kf5SxMrXR2Y/k9AOCJ9z8KPq
 j3S+WlmJceJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZL/jIwAKCRAADmhBGVaC
 FZ/jD/0evq59eIdKfJ48vhkQ834Ov7dXXLAsoPLIBwuMPbqc7pSVOjxB5ATFSwfM9htZKolZ+oY
 lIU2tVkrgEvzBSvtptGWRr2sarmS792/ET3Q94ZYyI3yGrHeRSXFOCIw1j7WwH2CAixPP7tV3iI
 CEyu3vkzTFYYrJrAjpZayoN4FMelRFKm9TkDeBNDMR2dHxzPYji2KfnLM8E0QyicvhzMp748ezo
 gSFE9vYIQeyfCsc0tsb3+xvNeyfrgwWW0Xt+iWheDXhWb2JezV0qwPzhrTI2o0lUu3y5Ak6moUv
 mxg4LjTEyDiFJS1gFG359AOMdd1Fqe+/hBI/KRZw1FJgHJNrojM6CcefRT/9ld8QucjdHCaei+j
 wdbwbxqSPCnXE7EyPm6OfdKrz1QY8quS0w28VGDMEoqvWsdi5KDYgaliGZ4xMdeR24lwCGeO1sO
 CcTk+9XkDMSViFJpiCvlZ1wqjbcy+7bpDotGULl660l29vxwtUOL4OzsFLorGw8J6AVtpr1WcSZ
 qiHQFHKm0p8TmStpgYdlGpNtZsiMWV5W5ebzMwtMfdk+ItSXAkX5AccmgWA8SF2Lu6i9FkiaOJK
 8np/ZINHFrUnnqcT0RhtcBRNRofFbPWW2FPTzqKgpU9tTsrmpbASbI+M+rPlDhulz5q2G6Ka/vp
 WLXgwe/aGNDuUZQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The VFS always uses coarse-grained timestamps when updating
 the ctime and mtime after a change. This has the benefit of allowing
 filesystems
 to optimize away a lot metadata updates, down to around 1 p [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOJV3-0007AP-CO
Subject: [f2fs-dev] [PATCH v6 0/7] fs: implement multigrain timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, Anthony Iliopoulos <ailiop@suse.com>,
 ecryptfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The VFS always uses coarse-grained timestamps when updating the
ctime and mtime after a change. This has the benefit of allowing
filesystems to optimize away a lot metadata updates, down to around 1
per jiffy, even when a file is under heavy writes.

Unfortunately, this coarseness has always been an issue when we're
exporting via NFSv3, which relies on timestamps to validate caches. A
lot of changes can happen in a jiffy, so timestamps aren't sufficient to
help the client decide to invalidate the cache.

Even with NFSv4, a lot of exported filesystems don't properly support a
change attribute and are subject to the same problems with timestamp
granularity. Other applications have similar issues with timestamps (e.g
backup applications).

If we were to always use fine-grained timestamps, that would improve the
situation, but that becomes rather expensive, as the underlying
filesystem would have to log a lot more metadata updates.

What we need is a way to only use fine-grained timestamps when they are
being actively queried. The idea is to use an unused bit in the ctime's
tv_nsec field to mark when the mtime or ctime has been queried via
getattr. Once that has been marked, the next m/ctime update will use a
fine-grained timestamp.

This patch series is based on top of Christian's vfs.all branch, which
has the recent conversion to the new ctime accessors. It should apply
cleanly on top of linux-next.

The first two patches should probably go in via the vfs tree. Should the
fs-specific patches go in that way as well, or should they go via
maintainer trees? Either should be fine.

The first two patches should probably go in via Christian's vfs tree.
The rest could go via maintainer trees or the vfs tree.

For now, I'd like to get these into linux-next. Christian, would you be
willing to pick these up for now? Alternately, I can feed them there via
the iversion branch that Stephen is already pulling in from my tree.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
base-commit: cf22d118b89a09a0160586412160d89098f7c4c7
---
Changes in v6:
- drop the patch that removed XFS_ICHGTIME_CHG
- change WARN_ON_ONCE to ASSERT in xfs conversion patch

---
Jeff Layton (7):
      fs: pass the request_mask to generic_fillattr
      fs: add infrastructure for multigrain timestamps
      tmpfs: bump the mtime/ctime/iversion when page becomes writeable
      tmpfs: add support for multigrain timestamps
      xfs: switch to multigrain timestamps
      ext4: switch to multigrain timestamps
      btrfs: convert to multigrain timestamps

 fs/9p/vfs_inode.c               |  4 +-
 fs/9p/vfs_inode_dotl.c          |  4 +-
 fs/afs/inode.c                  |  2 +-
 fs/btrfs/file.c                 | 24 ++--------
 fs/btrfs/inode.c                |  2 +-
 fs/btrfs/super.c                |  5 ++-
 fs/ceph/inode.c                 |  2 +-
 fs/coda/inode.c                 |  3 +-
 fs/ecryptfs/inode.c             |  5 ++-
 fs/erofs/inode.c                |  2 +-
 fs/exfat/file.c                 |  2 +-
 fs/ext2/inode.c                 |  2 +-
 fs/ext4/inode.c                 |  2 +-
 fs/ext4/super.c                 |  2 +-
 fs/f2fs/file.c                  |  2 +-
 fs/fat/file.c                   |  2 +-
 fs/fuse/dir.c                   |  2 +-
 fs/gfs2/inode.c                 |  2 +-
 fs/hfsplus/inode.c              |  2 +-
 fs/inode.c                      | 98 +++++++++++++++++++++++++++++------------
 fs/kernfs/inode.c               |  2 +-
 fs/libfs.c                      |  4 +-
 fs/minix/inode.c                |  2 +-
 fs/nfs/inode.c                  |  2 +-
 fs/nfs/namespace.c              |  3 +-
 fs/ntfs3/file.c                 |  2 +-
 fs/ocfs2/file.c                 |  2 +-
 fs/orangefs/inode.c             |  2 +-
 fs/proc/base.c                  |  4 +-
 fs/proc/fd.c                    |  2 +-
 fs/proc/generic.c               |  2 +-
 fs/proc/proc_net.c              |  2 +-
 fs/proc/proc_sysctl.c           |  2 +-
 fs/proc/root.c                  |  3 +-
 fs/smb/client/inode.c           |  2 +-
 fs/smb/server/smb2pdu.c         | 22 ++++-----
 fs/smb/server/vfs.c             |  3 +-
 fs/stat.c                       | 59 ++++++++++++++++++++-----
 fs/sysv/itree.c                 |  3 +-
 fs/ubifs/dir.c                  |  2 +-
 fs/udf/symlink.c                |  2 +-
 fs/vboxsf/utils.c               |  2 +-
 fs/xfs/libxfs/xfs_trans_inode.c |  6 +--
 fs/xfs/xfs_iops.c               |  4 +-
 fs/xfs/xfs_super.c              |  2 +-
 include/linux/fs.h              | 47 ++++++++++++++++++--
 mm/shmem.c                      | 16 ++++++-
 47 files changed, 248 insertions(+), 125 deletions(-)
---
base-commit: 810b5fff7917119ea82ff96e312e2d4350d6b681
change-id: 20230713-mgctime-f2a9fc324918

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
