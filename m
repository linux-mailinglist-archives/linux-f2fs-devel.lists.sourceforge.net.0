Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8CD04D1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTTIEp6BlWNSxr1QdlX55XpGVKxx+9vo7shz94aYoas=; b=nWHxOZFKgbzCQjmQjLqEQqRKRq
	AWr7bcM17txoOjC2ky4zkWV826ydZ9DgbizG+GHmkq4dcKAJZjAW5cdQEbRgUvgHbfpcmpgFp0o3S
	y9S6bUoYkvuLxEprmYAf2n+5ZB9pdLO9EcTvVbSKknqUVuP44PhQVdAJ88Modq7mgzuo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtbr-0003QL-Vc;
	Thu, 08 Jan 2026 17:15:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbq-0003Pl-9X;
 Thu, 08 Jan 2026 17:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wPEBBYiLs5UpRatTHzdR858ldBQc1bQKs9678P4woJo=; b=YnLV/wukVu/u9u+nSNuPVd5M2J
 5mQ7MzvAY7OvZ7OSycdxupT4n2NsPW6x0uynqDuaiHOK99gkWgu6FjfJCris84LniijJH9BLfkchD
 R6BQcQUn8Nt6wv43R0H4atK4KdDcqa+d6N04CTyPkLctCg3eUTfvd3+MnwGR7NKSxIqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wPEBBYiLs5UpRatTHzdR858ldBQc1bQKs9678P4woJo=; b=V12hXp74jyAhIgCFnnZIkKvXj2
 L3K+DwfMVbRTZeJTeGLs31B5qkKT0n6HIBdjaMV1rLsbWK/kRsIBmrFB/SZxex1MbF8AZ1DTD9cRj
 Oz+aJctLw6pAD6Ki2ujWg8aWrI0CGX0lwnWRWnpdZ2k8tBZBqStS5VMWa1c0v3dC8elI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtbq-000601-FS; Thu, 08 Jan 2026 17:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C71DD60147;
 Thu,  8 Jan 2026 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30428C19423;
 Thu,  8 Jan 2026 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892536;
 bh=MiPWr2DLJcKasX6F9v8+9rGglnlyvJqPKW48zd1al60=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FEfgxOSR26Tj6ECCXQ1kDI71xuD1hXG0pdgsfNZC4qjP9PM5lbfSx+Yybs1gCcecZ
 5xVezzMwDcSNmCAOhMvgtKsCodYaQQ0THMfjeYU1Lka0ZfBQvNJSo7ZROk/8DWqqwS
 z9CfvD4AgySuAldM2dO7tTufE31f/BCPAdnxWn1/LB9kJnwnj1jV/Nw1ca2KACETGl
 J8f4IuU7G8YKWo7cRmlJQR4C0vPm9DRtuy04I5l4PODkstZAHL3jw8Nx1K9gAKC3OK
 YiODwtzqw2h8Mvyvp8pwAs4PfIZ4y1YWFa7ryDGScMUbzDbIQyzQGIbkZGDOaQEX+r
 xeKOdpkRHCqKw==
Date: Thu, 08 Jan 2026 12:13:10 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-15-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=MiPWr2DLJcKasX6F9v8+9rGglnlyvJqPKW48zd1al60=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W8O17HuY23tKG5Hc516pzPRtZ6MOWS5N7vz
 r/iJxDtMHOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvAAKCRAADmhBGVaC
 Fa41D/9uuWhzztHYPgXgRluKnu7erDAhmYdtz6gCOWZcNAGtLmln17MgKeXnmkqDLMrPGVckwT4
 fC7PobhFhcSNz2sSkcjk425Ir4n/1vzlHrGwFkpJLw4Kn2fjqQnx7gF8IbKic0lGeIbkIQbiv/M
 8jFiA/irOYflPM9HaGteXeTCHJ8i0+ULeKKhr/udChrv8wCSN/dIEHMDqryp0IfOtpmJQTvb5RZ
 3HCC4ofBYEz4ZCwq3xOjBjH9yLnbP9AIyEGC2LegAIND0PfwLhjS46AnEIEsUDiaDbhbzFxL134
 48fiomWRdRAG+WQ+FJmxb6WzuE5z5JyudmKfckYinC3ZMkz+qNgDfidFdXNBevMLS2ukjoWJ+iJ
 2EfSfdIaSUtE9amWUXmyMljqiLZWlHGyTMebwgN+VoRxnvGxD3vd0+HDPL0R7kJzKhsfgoRwH2n
 Dgdq4fET9XNtzIN9TzuFmn3ga2hYH6AG+x8d4Ll+Nk0C2jMtDJZZI57nFOVXELVh+mTrTvljKih
 nvP/dVB9FoRi/l1JWdbfaX74VqUwinlSeT/iqLJucuPyQG0GWP6nBGRB6iYgcNBqJXT2kVB0ats
 dVPUdyWpL93BCT7a1h/PdHaO2xKWw4Phq16fB9qNI1evyBT5qrdO1Ol8oCTrYo/VZNl7rhK29IJ
 9CXrYp95PfaAsQw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the setlease file_operation to ocfs2_fops, ocfs2_dops,
 ocfs2_fops_no_plocks, and ocfs2_dops_no_plocks, pointing to generic_setlease.
 A future patch will change the default behavior to reject lease [...] 
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
X-Headers-End: 1vdtbq-000601-FS
Subject: [f2fs-dev] [PATCH 15/24] ocfs2: add setlease file operation
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

Add the setlease file_operation to ocfs2_fops, ocfs2_dops,
ocfs2_fops_no_plocks, and ocfs2_dops_no_plocks, pointing to
generic_setlease.  A future patch will change the default behavior to
reject lease attempts with -EINVAL when there is no setlease file
operation defined. Add generic_setlease to retain the ability to set
leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ocfs2/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 732c61599159ccb1f8fbcbb44e848f78678221d9..ed961a854983d5e7abe935e160e3029c48e6fca4 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -19,6 +19,7 @@
 #include <linux/mount.h>
 #include <linux/writeback.h>
 #include <linux/falloc.h>
+#include <linux/filelock.h>
 #include <linux/quotaops.h>
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
@@ -2823,6 +2824,7 @@ const struct file_operations ocfs2_fops = {
 	.fallocate	= ocfs2_fallocate,
 	.remap_file_range = ocfs2_remap_file_range,
 	.fop_flags	= FOP_ASYNC_LOCK,
+	.setlease	= generic_setlease,
 };
 
 WRAP_DIR_ITER(ocfs2_readdir) // FIXME!
@@ -2840,6 +2842,7 @@ const struct file_operations ocfs2_dops = {
 	.lock		= ocfs2_lock,
 	.flock		= ocfs2_flock,
 	.fop_flags	= FOP_ASYNC_LOCK,
+	.setlease	= generic_setlease,
 };
 
 /*
@@ -2871,6 +2874,7 @@ const struct file_operations ocfs2_fops_no_plocks = {
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= ocfs2_fallocate,
 	.remap_file_range = ocfs2_remap_file_range,
+	.setlease	= generic_setlease,
 };
 
 const struct file_operations ocfs2_dops_no_plocks = {
@@ -2885,4 +2889,5 @@ const struct file_operations ocfs2_dops_no_plocks = {
 	.compat_ioctl   = ocfs2_compat_ioctl,
 #endif
 	.flock		= ocfs2_flock,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
