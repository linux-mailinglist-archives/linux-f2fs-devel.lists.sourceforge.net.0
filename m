Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C918D04C49
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqSNdenIEjKgOgm4vWXFCCLE9l6Z7dBranGNqP4qbPQ=; b=Wr1UtN5btNgYEByRcGEZewhMNI
	8ydnKSjyYjSIoujfrRmz2js8i+KKgZLzdSuH+qbNWS6E4vm4tFfoiQLcw6NxGQkkx/ax2gj3hHJLU
	TxwAiFnBU6amHRVhbDoaE/btVzo3B9p2HSyTUjdt6xmdqXVr4Q7B7pTuBW1v7E9g64/8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaD-0006Yd-Dk;
	Thu, 08 Jan 2026 17:14:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdta4-0006Y9-Gh;
 Thu, 08 Jan 2026 17:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UORsbIn2DznlIyVO6qJ4lZnfdd6OvlDWHFK9Nh7h01Y=; b=L2+7nHMAEEQil3IH4RPhKPpTVc
 uEnfjHGRhB0MNv82oLm9fN2VqM/EV6Tbl17mCoYqXsYMIgcplpR2bDGcpWbT5SnAUgF+vPp0Aicl1
 AxJTzoduhEQxx8P/2/RiORfLxiQKsPqbgykqR6RjOFyJh9o1kj+rJqvY4P2i5sz6PQ2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UORsbIn2DznlIyVO6qJ4lZnfdd6OvlDWHFK9Nh7h01Y=; b=a
 IVdA4P5UX+bPtY7X4vIHBznlNLAkBfj1TU/TXW2VvM2MYKPEpXqrGzteu7Hcp0Rc67gW0DUuqeslU
 ySjnTAwn6kkqTUIbFYey+GRsuZk+2MR+iYsPSoCwJqtP9nwbGyRz7RbGvrGV2nZgU0nJDLUlDldln
 9yB78mp4R9BlTJLk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdta0-0005kV-4h; Thu, 08 Jan 2026 17:13:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C545434D8;
 Thu,  8 Jan 2026 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2D4C116C6;
 Thu,  8 Jan 2026 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892422;
 bh=Oo05LcV8B4ObeCq3rrJEiTXLheQXnmVPy6EWKbJpWYY=;
 h=From:Subject:Date:To:Cc:From;
 b=sMLaSOnD+Lb34DqAv4+l1KIbr+z8ayCyntGOlgw1db2MmJQhOdIkWIrWeRcdIdKWS
 S/zZ1aldQOEJt+M4gNNpgwr8njA+kY57ueYyzw69x62DB2y8ZdsNP0n7O2v8cGXFpi
 Rqu92gjEkqK5VGOhWZChnPJ4VjzfqdTkQ5Pb550IY/fptv7JSzPczGvy4XqdhjJ5sA
 l0a72cVjGZa+Jo45PjkXSM0qO0LbjExULNMK8lG/BaoQzQWxdDW9x19wy15yv5tDSd
 cgmarBCaj12d1puK7fN4kFXY72IDiwfR7r7m0gQbOzLxetlMXGRug7hJ9c8PA8IU9d
 DvLLUdQgizFew==
Date: Thu, 08 Jan 2026 12:12:55 -0500
Message-Id: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBRG4VfRXbs1pmY0XkUWgx+3hOZKSt7dZ
 PktznlIkQRKTfFQwiUq+5ZRlQUNS9xmsIzZZI31pjI1K84VUcGerWEbAnrngxtcpNwcCZPc/6/
 t3vcDWdlQRF8AAAA=
X-Change-ID: 20260107-setlease-6-20-299eb5695c5a
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5826; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Oo05LcV8B4ObeCq3rrJEiTXLheQXnmVPy6EWKbJpWYY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+WzBv3HT+d1Fmmb4WJNh3VjXhmOx5cl7E+0X
 98Wl1lzspuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lswAKCRAADmhBGVaC
 FYaFD/49dAmx6k9hJ/TPfTiX5MGWuIm/Bb6hiQ3wYU8z7D5mM7bDA0JzI4uNC4IC4k7DtSaeW+t
 HW0GXcfmOc/2RNtvIURgrbNIKtr02nzAYWch3n94PXAZNhcygbpjjekIxTTpfmIp6Q3JR0VXmgj
 FPOGz1G9+W5jTp8JkJCS7rK3QI1nR+/TS195gfflVDsyGMEA252ZaGAWOXQucH8aMmL3SmL4Sw3
 SQIvSgZPcin8ppqmJM+SMqpJjims+KsIvBeiZ5RAX2koRTuCEpaimiM9mi7uvZTjn9qDUXstfCl
 j6vVSQyDrhB6qaSgIjGD31+J/UHY4GmSW7EXpo9hwYld6pajZ7JmgvQYyorZSADZQ1buPawi578
 2S+AKCmbogE/0eu1rDPfSf7+pgKL0PHCFCUHmNfl5kyVzMdQ5fEfhZa0HY103UgMpyn9CWEA426
 pzh9DY5Q7TVq+/Ml0m/iauvJ1NRfOvo1XZ6qodWqnFZEO7/lzreoUi45cpyDZzLiSQuca/VsCjV
 6m4pCflt/f0Ao2+yx3/gP9YDsugBwKA59y5BZvauge564wraKaWFFPDoPNSNY9aww3L7L1579eX
 mhWasindF/bS2ZuJ3k3obfEbzGrzZnRus+vFi5LvzlZIlOMMPaJ/pY9IJPoJjhxxacuSawLXV7W
 2iGXbdzTGfcW99w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yesterday, I sent patches to fix how directory delegation
 support is handled on filesystems where the should be disabled [1]. That set
 is appropriate for v6.19. For v7.0, I want to make lease support [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdta0-0005kV-4h
Subject: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yesterday, I sent patches to fix how directory delegation support is
handled on filesystems where the should be disabled [1]. That set is
appropriate for v6.19. For v7.0, I want to make lease support be more
opt-in, rather than opt-out:

For historical reasons, when ->setlease() file_operation is set to NULL,
the default is to use the kernel-internal lease implementation. This
means that if you want to disable them, you need to explicitly set the
->setlease() file_operation to simple_nosetlease() or the equivalent.

This has caused a number of problems over the years as some filesystems
have inadvertantly allowed leases to be acquired simply by having left
it set to NULL. It would be better if filesystems had to opt-in to lease
support, particularly with the advent of directory delegations.

This series has sets the ->setlease() operation in a pile of existing
local filesystems to generic_setlease() and then changes
kernel_setlease() to return -EINVAL when the setlease() operation is not
set.

With this change, new filesystems will need to explicitly set the
->setlease() operations in order to provide lease and delegation
support.

I mainly focused on filesystems that are NFS exportable, since NFS and
SMB are the main users of file leases, and they tend to end up exporting
the same filesystem types. Let me know if I've missed any.

[1]: https://lore.kernel.org/linux-fsdevel/20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org/

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Jeff Layton (24):
      fs: add setlease to generic_ro_fops and read-only filesystem directory operations
      affs: add setlease file operation
      btrfs: add setlease file operation
      erofs: add setlease file operation
      ext2: add setlease file operation
      ext4: add setlease file operation
      exfat: add setlease file operation
      f2fs: add setlease file operation
      fat: add setlease file operation
      gfs2: add a setlease file operation
      jffs2: add setlease file operation
      jfs: add setlease file operation
      nilfs2: add setlease file operation
      ntfs3: add setlease file operation
      ocfs2: add setlease file operation
      orangefs: add setlease file operation
      overlayfs: add setlease file operation
      squashfs: add setlease file operation
      tmpfs: add setlease file operation
      udf: add setlease file operation
      ufs: add setlease file operation
      xfs: add setlease file operation
      filelock: default to returning -EINVAL when ->setlease operation is NULL
      fs: remove simple_nosetlease()

 Documentation/filesystems/porting.rst |  9 +++++++++
 Documentation/filesystems/vfs.rst     |  9 ++++++---
 fs/9p/vfs_dir.c                       |  2 --
 fs/9p/vfs_file.c                      |  2 --
 fs/affs/dir.c                         |  2 ++
 fs/affs/file.c                        |  2 ++
 fs/befs/linuxvfs.c                    |  2 ++
 fs/btrfs/file.c                       |  2 ++
 fs/btrfs/inode.c                      |  2 ++
 fs/ceph/dir.c                         |  2 --
 fs/ceph/file.c                        |  1 -
 fs/cramfs/inode.c                     |  2 ++
 fs/efs/dir.c                          |  2 ++
 fs/erofs/data.c                       |  2 ++
 fs/erofs/dir.c                        |  2 ++
 fs/exfat/dir.c                        |  2 ++
 fs/exfat/file.c                       |  2 ++
 fs/ext2/dir.c                         |  2 ++
 fs/ext2/file.c                        |  2 ++
 fs/ext4/dir.c                         |  2 ++
 fs/ext4/file.c                        |  2 ++
 fs/f2fs/dir.c                         |  2 ++
 fs/f2fs/file.c                        |  2 ++
 fs/fat/dir.c                          |  2 ++
 fs/fat/file.c                         |  2 ++
 fs/freevxfs/vxfs_lookup.c             |  2 ++
 fs/fuse/dir.c                         |  1 -
 fs/gfs2/file.c                        |  3 +--
 fs/isofs/dir.c                        |  2 ++
 fs/jffs2/dir.c                        |  2 ++
 fs/jffs2/file.c                       |  2 ++
 fs/jfs/file.c                         |  2 ++
 fs/jfs/namei.c                        |  2 ++
 fs/libfs.c                            | 20 ++------------------
 fs/locks.c                            |  3 +--
 fs/nfs/dir.c                          |  1 -
 fs/nfs/file.c                         |  1 -
 fs/nilfs2/dir.c                       |  3 ++-
 fs/nilfs2/file.c                      |  2 ++
 fs/ntfs3/dir.c                        |  3 +++
 fs/ntfs3/file.c                       |  3 +++
 fs/ocfs2/file.c                       |  5 +++++
 fs/orangefs/dir.c                     |  4 +++-
 fs/orangefs/file.c                    |  1 +
 fs/overlayfs/file.c                   |  2 ++
 fs/overlayfs/readdir.c                |  2 ++
 fs/qnx4/dir.c                         |  2 ++
 fs/qnx6/dir.c                         |  2 ++
 fs/read_write.c                       |  2 ++
 fs/smb/client/cifsfs.c                |  1 -
 fs/squashfs/dir.c                     |  2 ++
 fs/squashfs/file.c                    |  4 +++-
 fs/udf/dir.c                          |  2 ++
 fs/udf/file.c                         |  2 ++
 fs/ufs/dir.c                          |  2 ++
 fs/ufs/file.c                         |  2 ++
 fs/vboxsf/dir.c                       |  1 -
 fs/vboxsf/file.c                      |  1 -
 fs/xfs/xfs_file.c                     |  3 +++
 include/linux/fs.h                    |  1 -
 mm/shmem.c                            |  2 ++
 61 files changed, 116 insertions(+), 42 deletions(-)
---
base-commit: 731ce71a6c8adb8b8f873643beacaeedc1564500
change-id: 20260107-setlease-6-20-299eb5695c5a

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
