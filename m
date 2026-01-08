Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7ED04D31
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2npCEDaylTFY8FD2RJMb+oNDmGeBYOq2bik2KWA3FCo=; b=Dgdd9qqjOKRsv8VXlebnZEcL5H
	eOxP/i3B0aU1Oqgry7jo+0gLc13bbBhs5rwAF9VMBJrpdYG4izoEBUqJqGy2jlZOvNNaj0AWUsIdO
	EnudXq15meu17NDdf6ZfEnYeZ7QRrHsMADIEMkU1i9KZEzV7GElxSDLZ7Mzn+B8qV8Mw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtc7-0003Th-U3;
	Thu, 08 Jan 2026 17:16:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbz-0003S4-Mu;
 Thu, 08 Jan 2026 17:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XcFh/czpyXOajdzHyALx2Xni8o9OGe6EhHADm2EuoZg=; b=lTkMx9HTcL/XNwX29ZXbisOKLt
 Oq/bLAwcLr2mIUXQ3ycaCX23HWkHlFcRsWgdUcFxJa1bd9JRarE3WMX9VNg2pE+Cv5qoOJtzGwxWc
 uLTed9mp3pDsCxaqnpreRQH26ZIkppZeWP65N9zhlFZxC6/6aHXDwx9tzAJg9RtOGf6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XcFh/czpyXOajdzHyALx2Xni8o9OGe6EhHADm2EuoZg=; b=ZGWvy8JaKvIixK6Mn2mXvnXn0X
 ZBz4Qsl6sPmV/L8vRQJerItE921zn4L47Kc8KFfceT1Zusy9lknF1O0l12N6pz4RNAjtFkjtU8BHa
 CKoM6hr1dCVemsPdj6+HkXuIDwhorELTOXk8da7Ywgh7hWk5ewefRh5JiphhLk0o3LN8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtby-00060z-3F; Thu, 08 Jan 2026 17:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 81A2F6014E;
 Thu,  8 Jan 2026 17:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEF5C116D0;
 Thu,  8 Jan 2026 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892544;
 bh=yVN7kiv7Ur9Q7AnxVgFewkb0L/ZX8mnNajC6Hfb4ItY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SJag7iH3Ulhau+TT2S0OSUAXBwy5iFmcU6Lcje37qhWyUrVVIS0QTH2e5wxI2OWuV
 uM0Dam7qLl6fl4teot25YDB/0LrIoV6VDVLM3R3t7DnQHbujCZPv6ddb9BKAedtSKV
 t7+lntHNYOrLgAPao6XUgZGgqu8HjC4jex629eXoSfP4riBGPiL79zD76/2NIF5M+N
 uX1qwg88WzADWZnJTDvKeIPDL1RrhDcY9+1Tyo7ILZF8wYpjcPUZbG8Kk/7gsRnW7M
 UsjdAKxfEW+GG6kp5DFxc22CxtnZQjt0Ua7js1IxpNyLl6YAFmV6M9UkWWvJcPJkR3
 TovnFOD6YpvAA==
Date: Thu, 08 Jan 2026 12:13:11 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-16-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=yVN7kiv7Ur9Q7AnxVgFewkb0L/ZX8mnNajC6Hfb4ItY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W8gf6yTM9PqdgCO6Yh8PQSc1Poy4aktqHXE
 EqXCbQwiOyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvAAKCRAADmhBGVaC
 FRuXD/4oWPnRKMqdVVRPF71peTc836Dva171JxklgwmgsfBGNY9Coh6fglKyMqQ9V24XwbsVH7q
 SRxFfC/rZ6jRd8MVmFU4q1T864Bnzpra/VJ4veI4DPnrg77egeKX2Jx4mb0mba4rht+TFrkFCDK
 mhcPTMUj9KmWha9AOJ4147BC7Qf3qLGG9uxvqeIxHVjUN1BTNY7/BNqyZDjaygnRUIqJCWtjTOv
 YUN4eNnfRQLRKyfHAlMfbB/dlZgDLx7Q/W7Vou66JjuFzzyB17eRnChjoMC93Q44naBsb3lFX3K
 yvzZpsHh5/dCXj0hGaJ1QYi0Jg9b96rKOyntmvJpG9LPz7ciN3od6SzIH9dIvxov45RkSSGaEpy
 IuODOTTn6S41W6SKtB8fubBQCalo87arg2F+fCtLTgaMB0MsteZMBW4HgQnOFNQ9et5q4MSGTZ4
 gD/Xf6MItMTAI4y+k66u7nf3hJ5aYHRsVtsVqjfA2nWqduNGthfEsAjx0U/R/sxbYQXikUfsiOK
 2Q/74eTQIZa2aisqeUf91C+8I05nZsfE96suNoVb/cEL/V57lNG3stvWfm+owGEN3dovr8YFNqD
 lwM/fCzJuwDoCBqjnWCQ4bOIop1NH95s7W++pbtI3bHQhWhN7B3NYsK7YTHsRJOGC1ngl5pluTK
 +CL061T+fPDjdpw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to orangefs_file_operations
 and orangefs_dir_operations, pointing to generic_setlease. A future patch
 will change the default behavior to reject lease attempts with -EI [...] 
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
X-Headers-End: 1vdtby-00060z-3F
Subject: [f2fs-dev] [PATCH 16/24] orangefs: add setlease file operation
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

Add the setlease file_operation to orangefs_file_operations and
orangefs_dir_operations, pointing to generic_setlease.	A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined. Add generic_setlease
to retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/orangefs/dir.c  | 4 +++-
 fs/orangefs/file.c | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/orangefs/dir.c b/fs/orangefs/dir.c
index 6d1fbeca9d8172a2155f5b524cd19bc896748d64..3c32bf9f1296e5eb62a7a603faaf4a5493c57166 100644
--- a/fs/orangefs/dir.c
+++ b/fs/orangefs/dir.c
@@ -3,6 +3,7 @@
  * Copyright 2017 Omnibond Systems, L.L.C.
  */
 
+#include <linux/filelock.h>
 #include "protocol.h"
 #include "orangefs-kernel.h"
 #include "orangefs-bufmap.h"
@@ -392,5 +393,6 @@ const struct file_operations orangefs_dir_operations = {
 	.read = generic_read_dir,
 	.iterate_shared = orangefs_dir_iterate,
 	.open = orangefs_dir_open,
-	.release = orangefs_dir_release
+	.release = orangefs_dir_release,
+	.setlease = generic_setlease,
 };
diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 919f99b16834160dd8cc87faf9b8802aa02796cf..afd610a3fc68855eba1c892d91a5c0686876cfc3 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -583,4 +583,5 @@ const struct file_operations orangefs_file_operations = {
 	.flush		= orangefs_flush,
 	.release	= orangefs_file_release,
 	.fsync		= orangefs_fsync,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
