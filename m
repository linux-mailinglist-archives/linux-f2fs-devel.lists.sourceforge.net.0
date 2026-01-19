Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6287D3B0AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgRPvlpIPrjr6VBl5Dh1THAInnkMeRIV7GqsRL6KrmY=; b=ckfXIXZ0yixd/F+zxrP7dzVb/S
	JGBaiPinMVjLMlhAa4obRJk2z+7E1C31PCyonI3VrlICfxaNEup4NXaZJz3mEoI85AphPJPl3gX84
	p7zetEzvN4+keHMFHySE53H6Ul0REFCXsdRTEgW8MWKSzlHMWq+eGpr+tertrgkUpL68=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6I-0006Ne-Ey;
	Mon, 19 Jan 2026 16:27:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6G-0006NO-6Z;
 Mon, 19 Jan 2026 16:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lW38OPk4PkfErZi0faVwbOax0ytdfzP4ktwM5gCuCJs=; b=TOq75GsNBUaOeAfOV9/WVeAyPU
 UwhW5L+r8HK0LIuCuKe3Zl4UfO1fWy5vtksnFsnHGYubXp7MFIDpYgGvQJ3nmt3n1RDfTe5xA+kQ/
 5xZ/MEWSF+8Pw2OifnAkhlx0QykyjlUpaBX56u3no+e12TRB9zcE0hwBl65GO2H0PwSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lW38OPk4PkfErZi0faVwbOax0ytdfzP4ktwM5gCuCJs=; b=H
 /5ISV7qWzW+830QS09nEWXowxGkSOvWgJ2PYnCfXbO17fzKMVuhCeG3NBa6HQsugVGVSndrHNrUdc
 3HNDbtTWLbbgDIwp/YVA52Rq8DdSE/Ej3643NuD8Zx6sE8vPPknUw01GgESWkB2gGE+QB4OieGvJG
 bGLvUn3QkUY97Jwo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6F-0007lF-Gg; Mon, 19 Jan 2026 16:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F17860135;
 Mon, 19 Jan 2026 16:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BF7C116C6;
 Mon, 19 Jan 2026 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840040;
 bh=yX5wj9VHSThOjafnyKvHMJdYbGSk/5OP4p9PS/zazFw=;
 h=From:Subject:Date:To:Cc:From;
 b=f237MPyHkZbdY+WPcsLBi0kuGtUgJbV4HoKceS3Jz1Lmrv4gP0tgEIWx9faQo//X+
 +UUjREu/69qFBMgdHch+q9bk9Ep8RKPHs/QzSabx4v5reJiL9v0kEdJGMeWqOPK39A
 0jSEKULtL05hYKWy8N1WS+HOt5YyvBcESAtJ0ZmYc6dhEbBinazAzj9QJSGklzZ9p9
 LbTYD833qVCL0hCJmQS+SihR6ziWecIunpgB2VxOhgkmSC9roap7mrwb5zOJntllqQ
 se8GRkweMjAwYRoYx2aL3RsVvvEMBUqvD1Pqmz58J3HWTOMdRGmvio/OwXlAFPl4n+
 HkGliBF8cqqKg==
Date: Mon, 19 Jan 2026 11:26:17 -0500
Message-Id: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJsykzZWXfUexYXEUUNLIhMJF
 vHuTYVuuvwfvG+DyOI4QlNsIJxcdMHn0KcC7NT5kZXrc4NGXSLRVfE6B1mGqPwQe0XakMGb5rq
 rIX9m4cGth/doc08uLkHeB5/ou/4k8yclUqgqrpBK5ItFe3+yeH6dg4zQ7vv+ATyiSsWrAAAA
X-Change-ID: 20260114-exportfs-nfsd-12515072e9a9
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Amir Goldstein <amir73il@gmail.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5453; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=yX5wj9VHSThOjafnyKvHMJdYbGSk/5OP4p9PS/zazFw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltSzbGzajTJvmhlV7jB47UePrPRdt3Wu5GHL
 L1B0sA8PKeJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bUgAKCRAADmhBGVaC
 FXY4D/42rFsMWqLxlGJh5AWMBxSb1l17atmfl6mxPzMfAPokDVOiTK0fNOZalTR4OcT31QZxTed
 nkOmw7Qd+RTSm3dThDf1+et1RhMguer4Bj1ll4VmaZ/poVmu4fIUqbDcyU54UE4F3/M+fsmJXJF
 3s1+tqIyC+7WzF6/x/HWQY9RkQLGkUqkteSCoXdzEDc+WnhRgXntOXZFP/HpDfxG/pkaHnd+RBz
 4lFdhCAZ/xSuv67OWqva7ifRVDMiF1E1jM7uLNP2SeE/hd0wYNuORHvkzf0PBL9T0k2Xtf89p3W
 re4QkZpVZiycpFTZTWt04k1pqWuWK0n8tjfz/V3hdvnGOrpI230p/dDpXhnTN9sdFWylM4U9ya4
 qshCtu+DBJBGHEinp1+ZpE1k5xl1aig3/uN9f7VhUaZWww3qx9qr4g5LvGXfxxoxzZ9wBjiF9KO
 N6VxYj2loIjuU0+56wmYIb9mvXWeQ3O5IJtU9xTAV91iUxWYiRU9dcBVDvwk0wF6sm/fKmizn3g
 YPMFjbuTpkp5VsApqvODwDyEo97gF8luB/qvkGPpxV0AKc1MyfjvFpPOyECG1xpqAW1/f4Iph0F
 ju2zuNnVWaPFBf5KCowY4rq8s1kCTJxt/dnIpOlxVJ6FNlp9OpxryB048OYYuKuRfAwjC8gjHz+
 qu3QGNImWfKzpxQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patchset adds a flag that indicates whether the
 filesystem
 supports stable filehandles (i.e. that they don't change over the life of
 the file). It then makes any filesystem that doesn't set that [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs6F-0007lF-Gg
Subject: [f2fs-dev] [PATCH v2 00/31] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
 Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 Dave Kleikamp <dave.kleikamp@oracle.com>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset adds a flag that indicates whether the filesystem supports
stable filehandles (i.e. that they don't change over the life of the
file). It then makes any filesystem that doesn't set that flag
ineligible for nfsd export.

The main only place I found where this was an issue today is cgroupfs,
which sane people don't export anyway. So, I don't see this as
addressing a major problem that we have today. Rather, this patchset
ensures that new filesystems that are added in the future make export
eligibility via nfsd a deliberate step, rather than something they've
inadvertently enabled just by adding filehandle support.

After some lively bikeshedding on v1, I think the consensus is to stick
with EXPORT_OP_STABLE_HANDLES as the flag name. Amir is correct that
checking this in check_export() is the better place to do this, since
the filehandle can't be decoded without resolving the export first.

There are a few other fixes and cleanups, and some doc updates too.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v2:
- don't set flag in ovl_export_fid_operations or fuse_export_fid_operations
- check for flag in check_export() instead of __fh_verify()
- document missing flags in exporting.rst
- convert dprintk() messages in check_export() to static tracepoints
- Link to v1: https://lore.kernel.org/r/20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org

---
Jeff Layton (31):
      Documentation: document EXPORT_OP_NOLOCKS
      exportfs: add new EXPORT_OP_STABLE_HANDLES flag
      tmpfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ext4: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ext2: add EXPORT_OP_STABLE_HANDLES flag to export operations
      erofs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      efs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      xfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ceph: add EXPORT_OP_STABLE_HANDLES flag to export operations
      btrfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      befs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ufs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      udf: add EXPORT_OP_STABLE_HANDLES flag to export operations
      affs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      squashfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      smb/client: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ovl: add EXPORT_OP_STABLE_HANDLES flag to export operations
      orangefs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ocfs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
      ntfs3: add EXPORT_OP_STABLE_HANDLES flag to export operations
      nilfs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
      nfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      jfs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      jffs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
      isofs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      gfs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
      fuse: add EXPORT_OP_STABLE_HANDLES flag to export operations
      fat: add EXPORT_OP_STABLE_HANDLES flag to export operations
      f2fs: add EXPORT_OP_STABLE_HANDLES flag to export operations
      nfsd: only allow filesystems that set EXPORT_OP_STABLE_HANDLES
      nfsd: convert dprintks in check_export() to tracepoints

 Documentation/filesystems/nfs/exporting.rst | 13 ++++++++
 fs/affs/namei.c                             |  1 +
 fs/befs/linuxvfs.c                          |  1 +
 fs/btrfs/export.c                           |  1 +
 fs/ceph/export.c                            |  1 +
 fs/efs/super.c                              |  1 +
 fs/erofs/super.c                            |  1 +
 fs/ext2/super.c                             |  1 +
 fs/ext4/super.c                             |  1 +
 fs/f2fs/super.c                             |  1 +
 fs/fat/nfs.c                                |  2 ++
 fs/fuse/inode.c                             |  1 +
 fs/gfs2/export.c                            |  1 +
 fs/isofs/export.c                           |  1 +
 fs/jffs2/super.c                            |  1 +
 fs/jfs/super.c                              |  1 +
 fs/nfs/export.c                             |  3 +-
 fs/nfsd/export.c                            | 24 ++++++++-----
 fs/nfsd/trace.h                             | 52 +++++++++++++++++++++++++++++
 fs/nilfs2/namei.c                           |  1 +
 fs/ntfs3/super.c                            |  1 +
 fs/ocfs2/export.c                           |  1 +
 fs/orangefs/super.c                         |  1 +
 fs/overlayfs/export.c                       |  1 +
 fs/smb/client/export.c                      |  1 +
 fs/squashfs/export.c                        |  3 +-
 fs/udf/namei.c                              |  1 +
 fs/ufs/super.c                              |  1 +
 fs/xfs/xfs_export.c                         |  1 +
 include/linux/exportfs.h                    | 16 +++++----
 mm/shmem.c                                  |  1 +
 31 files changed, 120 insertions(+), 17 deletions(-)
---
base-commit: c537e12daeecaecdcd322c56a5f70659d2de7bde
change-id: 20260114-exportfs-nfsd-12515072e9a9

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
