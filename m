Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FBDD04CE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBvg9KiYYzBHvHuIVCmltWijOjFPHQTiBPi5I5Uh0pE=; b=Ym8kxDfLzKwmEFxIOXr6Te+RU/
	8LQG+f0pANBVrX8i8rOi96haiVVqa66pqRv0okWJSdoBaA2sWb6CCvmDtO4YlQ319t2Gh8RkbqSew
	68UpF3bT8RBs2GrVXu0rQuYDJylvTn49mItG9GGvHs3oBEGHWhVywcTdvtkAn3uV5RPs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtbP-0006fw-8E;
	Thu, 08 Jan 2026 17:15:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbM-0006fb-DS;
 Thu, 08 Jan 2026 17:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8EkRoG1L9zjgQ1DOKG9mWDwPpbdMkoAIHjT4aDgnzY=; b=XZfIT632GigluAxSCvD8rS5nUx
 7nmcaR4u2dRbjUTPUJaUJDMVcXrraiZQnZKdl0QBWvYdRr1auZ3ClBQG4sSUdwOstawwPtOMR2PTC
 H36mdqnWod+G7+QJo4+B+NEELCaNhneOp/nrsFOKZk7uluvhhKZ8lCpIUccdCOqTYUSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+8EkRoG1L9zjgQ1DOKG9mWDwPpbdMkoAIHjT4aDgnzY=; b=b8WyKTmvJNDFDxAgDsTHDYESAo
 s+THeyEWhPgdFb+HZb1LXsO1GFa//oIHNTkZ2UxsjMIhlliCDa9UKlguLOwsGs0j0a03wNPFsi1By
 /lIm532aCjYcsIF34mzcxVO3wHeHpjDmCYpk3KLdCJ3DtZ1QrpXO9n8XneqqoJKC8GTs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtbL-0005vl-QW; Thu, 08 Jan 2026 17:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BBCF417B5;
 Thu,  8 Jan 2026 17:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6360EC2BC86;
 Thu,  8 Jan 2026 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892506;
 bh=f+f4o4ynYy+1SY/DeVfHq3onGDbY5zceG5AUdIXzRFo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TDNJcMd6q902mahde+BO9wSWmbW9wjddkU26c1KViTrFBxwUdgE7cFhjS0dNF3jtf
 6Kk0r/OwVHpHX55siH6IZecEdrCSr2DCgPJoaSgr4zwLDXirwvkRHwnst7SJcRNLcL
 WwkGp1R5Oplpg8ID0G3hFXMyazl85w3U9ThrzJUR7nvfo0YAzzC84krpqTWECQ9+lI
 RRrPBQx4aAyUO/5pyOG0rGiL0sMaMgJkiuOt7MJqeLW4Ry9+VXvGVxqNaTjIopbLYy
 hGMNCDe+LUdCUZ/AYoAp6mt3lNoGuFLlkAljMn08t1i7ZscD156Xj/ScCXO0oBfPnT
 /HctkjSSFO3jA==
Date: Thu, 08 Jan 2026 12:13:06 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-11-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=f+f4o4ynYy+1SY/DeVfHq3onGDbY5zceG5AUdIXzRFo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W7lCQZfgywIvw59WIEginzoekcq167e9p3d
 FIoynspkAuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luwAKCRAADmhBGVaC
 FdDKD/4znaNh5ZW6PAHUf642a8kepq5X6OHMfltH9Cc7L/Be4t+uhH2C2l8lp1cvjF3p8Rpi3oA
 fZ+dR9bUW5GRyCJ3+vRKjVS5PRDra8bHdHtEx7mCNQeTzUhsLWKmjFoTVQ+2z6Dv47T6ZmLUrOW
 vt2kqZpnLjWLWWiPlf0sOMJIeswKuv5uKd88OxRHUWG2kQSOKbcKfwQcQ4bjSnR08ZPqmkmOos0
 TrsoXeTh7E52Ttx+5nLskrvumsAUMiLfNpAYGRnh5zS9deqJ/icejX/Tnm8rp/HfMYW9lZY1JLS
 uAR1InznJLqI5Ra1WMIM+/c+6E9oW407IRy23SocSVro/Mua/BIjEJ7gOfORQmHMPu3+9VYfcyt
 Dlxsr/Vz8PDZc+xqqrW5abevesTWIHsXWA6cp0lDEJG3JmUdmpVGPJ8g8DK8clPYo/rFC+9xN2e
 w+Ol9y3A0g4mbiyDNQShnxdoWa8G24T+TC06gfvWatd7epKfvf+QiHukAAjTB1zsTXPxn1Y3LzI
 +PZQPSYmATnn8m8nyY2wkZ8htVVohDBRW85B3Mp8M3jnGgMP0L7Ea5mp1wDVPTgyjwmRTpNCdV4
 18aUPXvyTh8KR3P0CgCnGA73VzPVfWcUEJ10+JBd6hS248f5/wSH14zMU2VeB2iNpgDdkeSQKbE
 um2oXzdHyzfwuLA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to jffs2_file_operations and
 jffs2_dir_operations, pointing to generic_setlease. A future patch will change
 the default behavior to reject lease attempts with -EINVAL w [...] 
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
X-Headers-End: 1vdtbL-0005vl-QW
Subject: [f2fs-dev] [PATCH 11/24] jffs2: add setlease file operation
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

Add the setlease file_operation to jffs2_file_operations and
jffs2_dir_operations, pointing to generic_setlease.  A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined. Add generic_setlease
to retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jffs2/dir.c  | 2 ++
 fs/jffs2/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index dd91f725ded69ccb3a240aafd72a4b552f21bcd9..2b38ce1fd8e8d8d59e80f6ffb9ea2935f8cb27e4 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/crc32.h>
 #include <linux/jffs2.h>
 #include "jffs2_fs_i.h"
@@ -48,6 +49,7 @@ const struct file_operations jffs2_dir_operations =
 	.unlocked_ioctl=jffs2_ioctl,
 	.fsync =	jffs2_fsync,
 	.llseek =	generic_file_llseek,
+	.setlease =	generic_setlease,
 };
 
 
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index b697f3c259ef25171ce30785d4584d5a53751a0d..5e1ef4bc009b6e5b4818a7467639fc328c137c12 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -14,6 +14,7 @@
 
 #include <linux/kernel.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/time.h>
 #include <linux/pagemap.h>
 #include <linux/highmem.h>
@@ -60,6 +61,7 @@ const struct file_operations jffs2_file_operations =
 	.fsync =	jffs2_fsync,
 	.splice_read =	filemap_splice_read,
 	.splice_write = iter_file_splice_write,
+	.setlease =	generic_setlease,
 };
 
 /* jffs2_file_inode_operations */

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
