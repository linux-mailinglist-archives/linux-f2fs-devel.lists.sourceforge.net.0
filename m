Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173AD04CA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOc99n5SMCNAouDDwL/dUn1Wg9TvnhsxWab+OB1RQsc=; b=BibybkLnNCrPd2/bDytuI9TZKR
	fa36fhpcY8rBa4vgIsyepDQhJVoX78Q5WB1NeDk/TvaMiE2vX24HvezdUx+DRLrADEW5VZt2GGul/
	aWqkOafUjHNTOKExufFrWAE4ybQgOJ6QMQkI6YShVU5rkBENcl4KkSt4RJAV0QGCPGdE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaq-0008Es-Qq;
	Thu, 08 Jan 2026 17:14:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtap-0008ET-19;
 Thu, 08 Jan 2026 17:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ans1oOdE3NYLSz974mpEX/DcKF2I12Io514v9DbvaY=; b=OHhvH/oKHOb17C9SNvvQfFxM2i
 ZSfxjS2xEEAYoJUTwFyhae437+Y4KK4366pC3udjwUXwaXhS+e5QpG6ZO9ftcXO87zL80G9nLKxiX
 mDrr7ltiPJY1/bn/V2oqtaW07ePGripkVo5IT9EB1qVmCySWAImN93KDjJ90hfYZbx60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Ans1oOdE3NYLSz974mpEX/DcKF2I12Io514v9DbvaY=; b=GKT3JrC/FkY74MTXw2887NLk93
 AKRgPN3iDLDVkeBYngrLlILuPAmlY3gvkt5r8NvHXZ2u8qDDXMsxYJx0ghfiSOahVdWLCNsSGuUVF
 PsNT2FwFZ2er62keFov7xzN9plzCcxIrpCmCcjHTUYyr6j/7jVtBvBdIf0OjXZqGa26A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtao-0005qh-AP; Thu, 08 Jan 2026 17:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EEBB444451;
 Thu,  8 Jan 2026 17:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7486EC19422;
 Thu,  8 Jan 2026 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892467;
 bh=hlxGHkYb3xkFH9tUolL/syLb6jWJ/uBVgo3tjpiBxyY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d9MmB1m04Yq51+yvLj5Igg5jvjt2pHNxTK/fBefOXh8TeU4uLphzQaxU6IN9Pl04A
 tBoV9hqBlk7GrHjFDyAHkh6LbqS7sqpCYUy/uoeiRJFegNbaFGoIR6bSSAPvq95x5b
 3b0SAShJkVnakBG128c5vI/jQfrSS/P2TDGfDgGUgi59ILalooVkG0diDEYBmCbaSk
 iqhZQYGDY3tXw2lXE6dkvpWeMQR+GcH0PTKSfpBqJDNYo/o+MTaFT+NUjuvjcrOq3e
 msPZWt4sPG8TodhD1Ox97c2Oy73trggOtjHggajWT0gizYqDghDAFLpOjOEnQ7tPwQ
 GG2zYe58TRBpw==
Date: Thu, 08 Jan 2026 12:13:01 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-6-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=hlxGHkYb3xkFH9tUolL/syLb6jWJ/uBVgo3tjpiBxyY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W6t0mhuGkERJYbFwmyCbgn+H1ouSbEbBOhS
 BmnbuhF9HOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lugAKCRAADmhBGVaC
 FUEED/9lGYU2hYsgRrdekmYbHARu7YG2VzVJ9YJTF7i9daxcdOeAV+CM9pvICZhlQXj7ksl2zyk
 +MlC/fF9o43MeuUs82UhWCwUlrjoQWEHCxkZi/kEGCtyrXZStdPHmGPs/jBMBERxfYcccrVRote
 Af82hjhi7S8o/SeYi72kfMiuEbK+TrD5GIbE/l8Pg07AYvM82MejivNSUusmV3nW9TgqpebQOU8
 igqsQPEsODeiWZHFiXaR5yJjNhDdogUGW+iBWXFcfC9EZTc3nSGO83mSmVqTcFNnMJ3ojOQaOa4
 JuNqiG7LDyYmfHkVs8jgVxjYG/PUKziFr6CYquQnsGZi5E39ZVl8HX4iSqKoPh6FjDpc1PDG8yr
 QYPwrdKSZBX5fr5wwy7yrWcwlZeMlCXzoid+Fop70v07YQPWJ5OmwUD7N9Bg0dxArH+srCGIgTR
 p3f2C5FWpQ05m0xTZ7E7oc6KD34XFgwXIJLCPTEwp3nfRY3+IYLQcH4qfJuCCQSB0waZJ/jDV88
 30C0Sp5Ujwb281ckPPKOaDzTtEThYd9Z6U5y6u/ov+PhxJrsPh9JtyAW4Mq+D1+Ds+b5ysfCvDu
 fGntd6Oj1rEilxy6v1snzESsLykyBBKAn/sMaXn4sW1rixrdAHhQ+hW+SLj+O2Z3iVmdb1IRscZ
 CKvOoSCXs9sf55Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to ext4_file_operations and
 ext4_dir_operations, pointing to generic_setlease. A future patch will change
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
X-Headers-End: 1vdtao-0005qh-AP
Subject: [f2fs-dev] [PATCH 06/24] ext4: add setlease file operation
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

Add the setlease file_operation to ext4_file_operations and
ext4_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext4/dir.c  | 2 ++
 fs/ext4/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 256fe2c1d4c1619eb2cd915d8b6b05bce72656e7..00c4b3c82b6534790962dc3964c0c557162b6dff 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -24,6 +24,7 @@
 
 #include <linux/fs.h>
 #include <linux/buffer_head.h>
+#include <linux/filelock.h>
 #include <linux/slab.h>
 #include <linux/iversion.h>
 #include <linux/unicode.h>
@@ -690,4 +691,5 @@ const struct file_operations ext4_dir_operations = {
 #endif
 	.fsync		= ext4_sync_file,
 	.release	= ext4_release_dir,
+	.setlease	= generic_setlease,
 };
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 7a8b3093218921f26a7f8962f94739ba49431230..534cf864101f8d1e5f4106b61c0580c858bc0e27 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -25,6 +25,7 @@
 #include <linux/mount.h>
 #include <linux/path.h>
 #include <linux/dax.h>
+#include <linux/filelock.h>
 #include <linux/quotaops.h>
 #include <linux/pagevec.h>
 #include <linux/uio.h>
@@ -980,6 +981,7 @@ const struct file_operations ext4_file_operations = {
 	.fop_flags	= FOP_MMAP_SYNC | FOP_BUFFER_RASYNC |
 			  FOP_DIO_PARALLEL_WRITE |
 			  FOP_DONTCACHE,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations ext4_file_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
