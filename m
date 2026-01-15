Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74ED26BCF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGBS7zHLMbol9fRb0YeS9GqK31WcXTci0xRYLcrcjjw=; b=AX/py2Cus9Sdjvj2VpXxShqXfA
	3mhHrWOGCr8FQvUFoFoRaw8Nqe03920nib8oFJCAw0dZOteJr8QPkMMr3c8RnZXB6JJu5lpcMNLPD
	YEmdYg4bXrUvD95mTWiWWSnrTZt2OZYs30v//2EOBLxWaO70YRplxHd9D/PYZUyYPFxg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRS5-0001VC-MF;
	Thu, 15 Jan 2026 17:48:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRS3-0001Uq-FI;
 Thu, 15 Jan 2026 17:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vvXSkSgvuvBAdCYEw/mOnChggvFl3hZbp3O+rIZGmKs=; b=lYMlqBTHiw2jeDYITr1pCtTUm7
 DdhRp8bgZQKjBmeVhhOHZT5fudQ2aefS+yRmiVd8O6hWj3ANDpKGpUIaLsIvRqoqxHgR3SKTTxq5I
 msDVCz6oPd6GPRFAgcmAPkM4fYwf+kmgaOxh/su7OpmCo0UaLgUIgp/QmOmz5TctKzdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vvXSkSgvuvBAdCYEw/mOnChggvFl3hZbp3O+rIZGmKs=; b=R
 Tp70mFPAmvTTxXN4KBMIa7wzYlZWg5E7w8nvHIStQbDiBfY9r/rE6fb6rMDstvGd/sMo2iDLv+k8O
 NQW8dKVEf66h5AmCc+fyApV/JeizvUOwq7kk1ejxJNJrJ4XcVNkp7EmE8JAsuTu+SkxNI9tLwmAxA
 0A8BCkW9rSL9iL1Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRS3-0007cL-OB; Thu, 15 Jan 2026 17:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B75441B3A;
 Thu, 15 Jan 2026 17:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A44C16AAE;
 Thu, 15 Jan 2026 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499282;
 bh=Jgrg+43s0ldgv37NKbEktTlLcn8JlZ4Z62/aDsJl2fE=;
 h=From:Subject:Date:To:Cc:From;
 b=sv2wZs8WpKeI0wpddsdCzx5FPuJfiv0htyo+0abzJrCCFK9q4146ZE28BG441jorg
 Qo1tIee7N/1MnShJaAey62z4lfLsmhIXMLkZMLSEMlmEhDwdr2qsSYaFrVZPxb77cF
 i3aSCJl0gIo+M7JBkTxdAg7VvCpYnqzbG7R2Ohvdin1j12CbILNcI3w/DNWL7f9jbe
 DBukUrRoDDoNluFnmhgrGDxPlIkvSUMcrjLUpjjJ1T7VqZOaz0YENa8tKyKu6CaX47
 KOmCoEsEsYyGz5wli5gj5MnM7JWLaAPtkHWHG4sSZOBoGuAC5psY5ECRaP4FTl6A5n
 5/8prxsy2NgBw==
Date: Thu, 15 Jan 2026 12:47:31 -0500
Message-Id: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMcyaKuEi0kx5qNhhMRiHdPW
 r7F/wWEMpPA0hXI9LBwig3Yd7CfLh6k2DeD0WbUiIOi90r5DqJiEK/QWLR6MjS7GVpzZQr8/r9
 1q/UDI1yMc18AAAA=
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
 Jaegeuk Kim <jaegeuk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Jgrg+43s0ldgv37NKbEktTlLcn8JlZ4Z62/aDsJl2fE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaSg9V9dGf/ZUraP4b1Pq5RtyBLPKPHN6qkaxn
 8S9nULay2GJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoPQAKCRAADmhBGVaC
 FU2HEACr1dom+IcUewiIOnk7xEbGWbqcKSzh/u8bfD7LubFnaY7GNt5n6p3PgjmIFAgE/Lfk2v+
 Do5G648LuI9AgNBffpq3Rou0EGw9+wxjXyRaSItdEWDshxbLnMS5D2dtmXeB4x2mF6Xo8wPho9c
 ncOUEwjZL61T/UOLGxpSOojluUsBXenixeUCTgPYWeDSKZSd1PrbfIIvNT3wwmmIpQAv0lasork
 Zl4qe+BiG1G0IPtketcJGFYIgXNp76Hnll+P8/EqVrDG+4nPn8MGAy3xqMQyq4+dCzENDy0DmS3
 AJMlGepQMU/y0tAmS4R1R2P27jpCMwpBj8HhdNo0JThYFgmCYeGwPxsTOTNG8XmrWn4zye1BAl9
 Oz/kXfQnSFwMzweZ9J7fT16IxYVpb12aXvYdwcnZ+IE/Suh66Nx8n52d4tuSwNkKYQf6d05G1bU
 I+lA7kAnXjIh/p4o4pNnALEld2Rn49OAx/yxtN5VOYrjpBIK6yRyYTXjz0PnCRFsn3V65+xhhPM
 CJTSVK9ZzU4nspmDSK5hdCvs1pnGqYR9dLF7QV60eUBpiDYnfsiOG+KZmrsLuWOd2/7/8V8giqf
 SBbuLOXJmeBQ1IbyaaZbzwsaK+7PAPY92+HTJ8jsZ6+vQhAXLJ40Y1ug6UAG1bGirhSbW+Ru3JH
 SgoO6jBDoISNHpA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In recent years, a number of filesystems that can't present
 stable filehandles have grown struct export_operations. They've mostly done
 this for local use-cases (enabling open_by_handle_at() and the l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRS3-0007cL-OB
Subject: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
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
Cc: jfs-discussion@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In recent years, a number of filesystems that can't present stable
filehandles have grown struct export_operations. They've mostly done
this for local use-cases (enabling open_by_handle_at() and the like).
Unfortunately, having export_operations is generally sufficient to make
a filesystem be considered exportable via nfsd, but that requires that
the server present stable filehandles.

This patchset declares a new EXPORT_OP_STABLE_HANDLES flag, adds it to
all of the filesystems that have stable filehandles, and then adds a
check in nfsd to ensure that that flag is set for any filesystem to
which it has been presented a handle. When a filesystem doesn't have
this flag, it will treat the filehandle as stale.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Jeff Layton (29):
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

 fs/affs/namei.c          |  1 +
 fs/befs/linuxvfs.c       |  1 +
 fs/btrfs/export.c        |  1 +
 fs/ceph/export.c         |  1 +
 fs/efs/super.c           |  1 +
 fs/erofs/super.c         |  1 +
 fs/ext2/super.c          |  1 +
 fs/ext4/super.c          |  1 +
 fs/f2fs/super.c          |  1 +
 fs/fat/nfs.c             |  2 ++
 fs/fuse/inode.c          |  2 ++
 fs/gfs2/export.c         |  1 +
 fs/isofs/export.c        |  1 +
 fs/jffs2/super.c         |  1 +
 fs/jfs/super.c           |  1 +
 fs/nfs/export.c          |  3 ++-
 fs/nfsd/nfsfh.c          |  4 ++++
 fs/nilfs2/namei.c        |  1 +
 fs/ntfs3/super.c         |  1 +
 fs/ocfs2/export.c        |  1 +
 fs/orangefs/super.c      |  1 +
 fs/overlayfs/export.c    |  2 ++
 fs/smb/client/export.c   |  1 +
 fs/squashfs/export.c     |  3 ++-
 fs/udf/namei.c           |  1 +
 fs/ufs/super.c           |  1 +
 fs/xfs/xfs_export.c      |  1 +
 include/linux/exportfs.h | 16 +++++++++-------
 mm/shmem.c               |  1 +
 29 files changed, 45 insertions(+), 9 deletions(-)
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
