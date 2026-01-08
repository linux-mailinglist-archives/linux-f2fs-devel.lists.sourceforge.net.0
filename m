Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE03D04C90
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lS5g0FlOEzFtJYQR8ImGy5cu981ddlgTsCmcPX9Rf4o=; b=CwuSiggeuna9d5KDSIp14ptawb
	Zc13MbMfcIYHzfEKd1cvAHVrWuN4au4kDFZZmaDrazUY1fOaSs/tokkakKs1cClQaSSsEKZDXzu4N
	3sYPJO7SUFHElSDjUyyeGnKsTDgQkDtnjOWZFoa3PmUdeg9G39XRo34g8x30KaSYqC/w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaj-0006bt-7f;
	Thu, 08 Jan 2026 17:14:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtah-0006bX-47;
 Thu, 08 Jan 2026 17:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxDU6h8fD93a8T/FHybHd8/P8j79IMMptX36dqNJSKE=; b=VHcagFGtZT3/TfAMWADS03QKUC
 9Jwhca4A7HGGAr09zCjsv2OcpJfaoZ5z1ISORiFUHCMWNCde7GUC3fwyuNw/HSX/P+MpaNsQnq/m3
 hrBiletIWsXRiR0cOiVd2uOTw/76lbSqI1XUOhRtXuHQ7bUG58yygj43aQ3LFez0oakI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZxDU6h8fD93a8T/FHybHd8/P8j79IMMptX36dqNJSKE=; b=i0EIORFZK1Rz9Zm+/WsDeDByrr
 eVo1EIfvtkTfSEFG7KuKEan4lpbIdcLCyN4lExDiztZTiwMQsqUXmt7sAoLGsQ9InczJoxoAQT2ec
 NOMw+LZbLsqtjfpPzt3YdAaPY4Q9Xk5gJwhCk3K/o3OxlYWrxECGpU/tcwZ2pPtiS9a0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtag-0005pN-N0; Thu, 08 Jan 2026 17:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5959942D65;
 Thu,  8 Jan 2026 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C1FC116C6;
 Thu,  8 Jan 2026 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892460;
 bh=oF6oBWJVqDuAAjKOQDrehLsz3iDowLXPik5JXzWYc9k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZSaPnWwgsRoKS590NDK2nAb5RgiDV815lEy8151AZJxlLARMNFc8t5dQmMkUz0JST
 rhKyFwUz1dAGUm2NJr8lAPlp3DwDOHv/02nIAnvGd2M3IupL9oZhj0Grg9oVi4lN4w
 g7D3z2STHURmDZ7NplBhcLcj2za4gZrXAivQc4lPJdJghdWPCkspzxfRd6035DGdLn
 2CdUmU6nzbxgjhHov4TVJabLWt5UsKGi/wQpmKn+Y5aGNWkmIaPLTlfGqI9EjM04b5
 SrCcVTmQGHH/I/azeRLaSBDgCI3GPNs34GWUzC/P/4BqmjEidn0sUaA6O/AFyqFh6q
 wdrZtmGzHbQUw==
Date: Thu, 08 Jan 2026 12:13:00 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-5-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=oF6oBWJVqDuAAjKOQDrehLsz3iDowLXPik5JXzWYc9k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W51+myyOp3T7N9nKeOj1w9UGryiKEWXK2c4
 uBs1ppIWy6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luQAKCRAADmhBGVaC
 FRkZD/9X9AfDEXdOTU0p1NyunRENOiWMn7NFym0pJGC1a/vMqoagJhOg8DJ6MWl0AR4frQh9bjS
 RRdYTAntz/vRZdUXQNmip65bTzlDHP+7il44wPVMcjDwHIsz/pUXTZ8ZNiOAV1M30DKxFJ9CT3u
 PdA9yreUBmEt/UK4x4lDQYF2NTE/9bbfJyB+jEe6nZoAWmq9g5u2qXSDCWUAoaJMshmpGRsAT9b
 iFxzTB72klqyvrmWMKxhZBRZ7rOm2zCChTQJjZ3/SIQPBG5ZVNNy45nlpsM5xHtfjk1j1n0c1rR
 nrs6DQmLE9iFxTz7Ls8SOyBXRP58fsWMaOjwWX3QAQjt9zdsJY/xkWuEg4E9VMD874HkO7HNI/G
 JO0oJrQplsRc/CdexbsnS88REfIKqU+aHZrP7FcdSMkiJkUllzUIg6KsHM1NeBhRaOKJu8BOVJl
 vP9oTLwaLmDSKUTSEmJuGeYeZGycAu7M3/Gjg5DMImjB8r7YXFJ+i6AwSZhrbin+pvpRRt5YdNG
 tS85T0sG8bfmsbqZA+Ehp5mxN15t+NE0o8yVF91nO8z++bAqPBiK11NiIq/J9xBYUp3zqQchc3c
 JtymSVf1sO2KPVdy+/ujVxsyUinNYAssa0lgopwLrTE1n2rzFWAEuElJ4wunlge9cvt2wpYCZNv
 NTn8dDHxmIim2RQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to ext2_file_operations and
 ext2_dir_operations, pointing to generic_setlease. A future patch will change
 the default behavior to reject lease attempts with -EINVAL whe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdtag-0005pN-N0
Subject: [f2fs-dev] [PATCH 05/24] ext2: add setlease file operation
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

Add the setlease file_operation to ext2_file_operations and
ext2_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext2/dir.c  | 2 ++
 fs/ext2/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index b07b3b369710c4848d6091742cdd0b5c42d4674d..395fc36c089b7bb6360a8326727bd5606c7e2476 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -24,6 +24,7 @@
 
 #include "ext2.h"
 #include <linux/buffer_head.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
 #include <linux/swap.h>
 #include <linux/iversion.h>
@@ -734,4 +735,5 @@ const struct file_operations ext2_dir_operations = {
 	.compat_ioctl	= ext2_compat_ioctl,
 #endif
 	.fsync		= ext2_fsync,
+	.setlease	= generic_setlease,
 };
diff --git a/fs/ext2/file.c b/fs/ext2/file.c
index 76bddce462fced77b24d64416cb9fdb172d8270b..ebe356a38b185e0d8662f704ad20e42fe618284e 100644
--- a/fs/ext2/file.c
+++ b/fs/ext2/file.c
@@ -22,6 +22,7 @@
 #include <linux/time.h>
 #include <linux/pagemap.h>
 #include <linux/dax.h>
+#include <linux/filelock.h>
 #include <linux/quotaops.h>
 #include <linux/iomap.h>
 #include <linux/uio.h>
@@ -325,6 +326,7 @@ const struct file_operations ext2_file_operations = {
 	.get_unmapped_area = thp_get_unmapped_area,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations ext2_file_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
