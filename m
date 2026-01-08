Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24205D04D92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0gzSzNsbkJNq1/cph7BN8a24MXhoFGOWyuy2yF+Fvc=; b=B5kY/tCBwC9UXbUsjC5yJX9wQ+
	8+wyPDavNw7WibAkKGkgNeL97sEFVvnDbFqfsvaZ5nRgMfkRqs4lwmx4dlfwv6xIuxYwk/DDRlWP2
	qe4pTUEVwx3Guj1DXGduyhhRylE88xFidLlhNXTym/kXHXkIS5ausg9eRtyXYJpaHGdo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcr-0003et-Se;
	Thu, 08 Jan 2026 17:16:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtcq-0003eP-Oy;
 Thu, 08 Jan 2026 17:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTP2GMbNVlF1e3foN13NRmrwrf+3zjUemaOdq32B5HY=; b=EwjzEV/BDfA9SqkqAsevXR8sdo
 x59xy6j5YSrQQkOZes6mcVjRyddFOVudnkMn1s3w7Kejg7yASncCESSXB5snKReykXecBtE6YN3Ra
 NMG73JMYIcdBMO7jOjsUDYZBsr6bmDm/4NrRSFd14FOSLV+llmL/9SA4a8d3AwyGscEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mTP2GMbNVlF1e3foN13NRmrwrf+3zjUemaOdq32B5HY=; b=BH2eXbG8TG93eJp1STfAuA+MdZ
 Py40qllNaWyJbUyYJCg8tPhwz5hKtEaM1bEsBHSYYVEYYyQeBxny5iY9eN6KIcn8RAcyWtzU/31KE
 RvMu/nMSA1DbZibcotgZ4Ik/doXH3/4ZyG/Clok1/BRreCfdiWo0xHgbTSvuAEYhoWNE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtcm-0006DY-RZ; Thu, 08 Jan 2026 17:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F3396014F;
 Thu,  8 Jan 2026 17:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5037FC19422;
 Thu,  8 Jan 2026 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892589;
 bh=31kaSpuGA79pOQvjYXOIwkMusZ5I/9kl0pI7vxo79B0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ka0wy7tfVbqJ8biZkl1dnF7zdBNpw2I/HL9Z4qvT7canG8yWttWmWRQ8y2bA5H2Ne
 Hg1kLSaeL/MJqN/eLQrJ+0D74nyBul/1dg48cm4KybwYHPFxN2jDA0DG0JbZS9GgJH
 YX0bgPuTqTt2qOuABV3Sh0WjERkrVZ8mA5j1puaJ7vvJQEjbKd1eF8mVQZSJI+ZJKN
 +fRHCYR9Jhj0ZnSLSNSehLByTqec+/NNwTFW6FjkwP2zNBKgrJjpIbdazH4MUrGCoN
 YFM4uhC2WPpbzqLdGmh6J9z/myyIQ398y3DCiuGgy6lIDUaJ/QXycwYIOEvZGejZ9n
 yymoliwZ3EoMw==
Date: Thu, 08 Jan 2026 12:13:17 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-22-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=31kaSpuGA79pOQvjYXOIwkMusZ5I/9kl0pI7vxo79B0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W+/CMV6M0nr3SG7lwo2cpM9G7b0LqWdi9Ol
 v2q/8PSRRqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvgAKCRAADmhBGVaC
 FVSQEAChykiIZZ2qCoDgb3e10KiOX4j3Kq9XSCEqphrg9Pr8U0yza5P36Vy+bUEGsdgKPjDLqTQ
 q/949XOcYbiBcP+IEI7/gYaaYVJMEiIGImK6lABXNO2oMGOM6vLmEd3C+hnmhZlK8h2vCSnhIkw
 CqkUAOpj20VyRsjZhxXC62TQQO8/8Y1QDjwRM24rZXa9NLMVNIb9Nn085XnNY8+Ppa3eFSktXW9
 ihb7fODPt1Vn6Y+eTsFtU5FsC6SwCxOTMnfRJEfY2C9Yl+7ldIyvY+NSWFbd1iWDZ7EmBaqU6PK
 qrBu72lJYpbsDQz6g8wjru4v4bG8N8o0uQm0wo9K5ZDw3DyjYaa3ja3+c2uHUSiA7BKqCAx4smU
 Q5mE5CbEcfBU8OthZWBuIhfbrZeYXgiGW0722Wz/sF8uiPVXx0NNUtIVMw1iSvsgI2McyL2JLrj
 4VZm70XFpXu8ld9+0yoAZ/mUgmn4HBfNNG5qyOqJfFnnEteSMeBnpbPbC7mihmnqF+bUwfFMpx2
 rPK/34X8VljljNjLqhFk7XbPZz6v6m6AhuTblY7PbDlKBRzMM6jNhafVfVXrC23FeDGkeeeS0wq
 afbmnpmPSBOCXki9yf314rYtODExHP9j/c/bZvezn9USBq8VM89wiKzdf3Lm2UXyjR/QYwfw5Or
 Ae8nSsnmq7yvMOQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation pointing to generic_setlease
 to the xfs file_operations structures. A future patch will change the default
 behavior to reject lease attempts with -EINVAL when there is [...] 
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
X-Headers-End: 1vdtcm-0006DY-RZ
Subject: [f2fs-dev] [PATCH 22/24] xfs: add setlease file operation
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

Add the setlease file_operation pointing to generic_setlease to the xfs
file_operations structures. A future patch will change the default
behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 7874cf745af372fe8d90af09c6916d4c635472e0..ecd7bf42446b38e075986d1c774dea4e8c0c0d01 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -36,6 +36,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/filelock.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -2007,6 +2008,7 @@ const struct file_operations xfs_file_operations = {
 	.fop_flags	= FOP_MMAP_SYNC | FOP_BUFFER_RASYNC |
 			  FOP_BUFFER_WASYNC | FOP_DIO_PARALLEL_WRITE |
 			  FOP_DONTCACHE,
+	.setlease	= generic_setlease,
 };
 
 const struct file_operations xfs_dir_file_operations = {
@@ -2019,4 +2021,5 @@ const struct file_operations xfs_dir_file_operations = {
 	.compat_ioctl	= xfs_file_compat_ioctl,
 #endif
 	.fsync		= xfs_dir_fsync,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
