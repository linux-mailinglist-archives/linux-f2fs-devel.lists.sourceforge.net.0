Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1383FD04C52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j60eIr+IC0/kE9bpXdx8HuMwDGQZeDe0iO0hPQmFkjo=; b=Hd7E4jXIDEPcVQumj7vPR8dKB0
	xRuXrMFC2SWtCIXlp5QDIKHtGUfsArpAS+QSNNOjxFjfKBpp/BKR9IQUndIWjg5IXQl9Eiu1gbyLM
	TvZLzArg53hAvOlkuCv8TWBBv/dkIyNOmEUnlAvnFcnRiH82AQ/bHrot7zXQzlFlxLOI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaM-00039z-1O;
	Thu, 08 Jan 2026 17:14:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtaK-00039U-Du;
 Thu, 08 Jan 2026 17:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kp0cU5EsDXHx5F5vjjnuc2Y9kqH0FLsz82OIU+nqh4A=; b=a6gxcWBiB/fK3ENglqZY5M+G1F
 AgjvKHA5kYbPJsk5FMS2k6Fy9oVC7gyT+pDhAquP+bQRiQqBffa3MbRp659003A91F/JF2uTr/ujX
 1ClQ+AoHPmnRPDBQy9NfA3XYC2KisnVfJIQYWU5WJrB/uhLaVvr5ubZIDbTEzPn2jHrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kp0cU5EsDXHx5F5vjjnuc2Y9kqH0FLsz82OIU+nqh4A=; b=P9uMBZ+PBKzFzkb8sK+gBkSJB/
 dsInTkME7N/ntLFAe8SthrAoo1N+NQ60rjvW2wMic7HvVRWQhsPKqa6z8kGWQFbX/utKi1aDfLPax
 SMYge66H87T8R8PMWE9hHnVAKs41zI2zFfYARbitNLCRyMsxDyAebJPDJJ3HOwo7LPaI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtaK-0005mv-ND; Thu, 08 Jan 2026 17:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB9F660133;
 Thu,  8 Jan 2026 17:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF7C2BCB2;
 Thu,  8 Jan 2026 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892437;
 bh=Pwijv5Tuh+c+DiE+MHlFZRInxzA5YXBkChKqagFjptw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M2tNeCP8JvCAJC9IUlu2e0zizZP6ZQBZzWNHPfmEbBZ0zetXBKM296NJhSU7YqSpn
 LteILbCxA57A7S+IeYEMwiideMe3sfW/5gv7fDscFgTzPh5AYvo8Ujt78vUZkXiSAq
 m50i91DWk2yAUn0Wttdfcm4F0FCACyOm4gftTSpYTz65kZKap5L1nyrcppapkoefLG
 6fC+lCadiEiJ+EQxkokfsvynFT8eNPgBYsf4u+HfENvfgtRSO1SFmQrfASP2UE3kgZ
 ZPn7g9odE8Y1aCsATQnyJnrCkGD+QdO7d41CD4Pf0PJGo4XJP2HaCvnDm6S43fg6rg
 Tht7Vqc7FmdcQ==
Date: Thu, 08 Jan 2026 12:12:57 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-2-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Pwijv5Tuh+c+DiE+MHlFZRInxzA5YXBkChKqagFjptw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W5Y9ye+Dm/rtqwxFL2Hdd+tE3YmpGaoSkLN
 ZcMw6xn0rGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luQAKCRAADmhBGVaC
 FeCBEACsTpjyfgcjG/GsZ4xzpgWq74Juli0DXZ1WVIUf0ss6GvOpMkY+uxFacz45n1ArzsjFBYA
 qSoTluOJD41qHwdDKGAdhFEsGj26fA3v7FUhqoN+IA0XCM7Q5JilKfVic1Jb7GnApj7qMRdR6gU
 B5xmOIsaXas0JxxmsF6a74mqSRmXo3ohjUjkSGHB0dYxgwAhQl6frG8PJmO6BmdhMf6j+Qcvjf4
 +pWs8jy2sS+8Vn5ZYPzH46DiFJ6bNqoETmBwWpG9FTmQ8zzlV8lq+QBuQTPpg9JMmE87T3mY79A
 PB3woVowC2Voz820ZEbCuByTzSYq3zU+nMBlhGuaAtPjtqF2/6aP1yCzRxJ8VoiE4KO0gyHUkFs
 84qO4+ZPqv/lRUPEXn+z28VYVWtzy6SV9Bxwx1K4iIKZLcwHj03Tk5Ay3OwbUdHHvmJea70tKU/
 Pnd8p8r3Zh3wZ0Zm3SHFL7CyUryOZe3NayKJMBsSodI8c6BqEpcbGSM/IwmjtuuuSt9aFAENA/t
 LqZWDcQTC8onUUXMCy0ila0bxBHfF2VUouHTVvO47koLUMpxSRy/v4XjRZyRDFIyv21c3Ja9RFB
 SSA/Pejl2la0pHZH2Ld420/K4HhPpbvOeD+lB6GWqkw69u+rZ5I9HhHwUM2EGpaC9H305b1sO18
 jw5ReV+iUjgSjOQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to affs_file_operations and
 affs_dir_operations, pointing to generic_setlease. A future patch will change
 the default behavior to reject lease attempts with -EINVAL whe [...] 
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
X-Headers-End: 1vdtaK-0005mv-ND
Subject: [f2fs-dev] [PATCH 02/24] affs: add setlease file operation
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

Add the setlease file_operation to affs_file_operations and
affs_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/affs/dir.c  | 2 ++
 fs/affs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/affs/dir.c b/fs/affs/dir.c
index bd40d5f0881042e7e6b15b09a76a1793169a1d50..fe18caaf4d6557c67f5c0542ad86a6fe4c512aaf 100644
--- a/fs/affs/dir.c
+++ b/fs/affs/dir.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/iversion.h>
+#include <linux/filelock.h>
 #include "affs.h"
 
 struct affs_dir_data {
@@ -55,6 +56,7 @@ const struct file_operations affs_dir_operations = {
 	.iterate_shared	= affs_readdir,
 	.fsync		= affs_file_fsync,
 	.release	= affs_dir_release,
+	.setlease	= generic_setlease,
 };
 
 /*
diff --git a/fs/affs/file.c b/fs/affs/file.c
index 765c3443663e6f542dce2ad5d9e055e14b0574e3..6c9258359ddb9ba344976dd5a9a435f71f3fabc1 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -15,6 +15,7 @@
 
 #include <linux/uio.h>
 #include <linux/blkdev.h>
+#include <linux/filelock.h>
 #include <linux/mpage.h>
 #include "affs.h"
 
@@ -1008,6 +1009,7 @@ const struct file_operations affs_file_operations = {
 	.release	= affs_file_release,
 	.fsync		= affs_file_fsync,
 	.splice_read	= filemap_splice_read,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations affs_file_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
