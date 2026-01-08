Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ABDD04D41
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJvGG67+l1EZbxhnOFd6gqVeFAgq92nNQx8jhAy0fKU=; b=PAfXlgv+QtZhzHDwAS1TND+rxZ
	/nyaN63GOEUJS5Y7wEnYMGyP9uYoUxZjHPtF79GCWJ2skaa9vIK6oGNu8i0onqm0sS7TI5mks/XCH
	xHD/ukoU62XgY/TTJCq71OTril4+txq+7j9MguUuv8JnGuhy80O3AQ2AiEjR4sETymro=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcF-0006ma-8d;
	Thu, 08 Jan 2026 17:16:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtcE-0006m9-8O;
 Thu, 08 Jan 2026 17:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UOlou/EGobK7lr+WHPiAS5+sabSAacC9g7Qx8GUB6SE=; b=E4uK6HT4IzWyxZnug/R9a6RdLd
 4Q7W+yCmmUQ8ifivMf1+7EKsnCYShMb2Vjr/XgawAgm9qlWbAy5gFy6cUfFoJ/Gf2XhhJLJpV/Yj4
 5+Dp9hcfV4PKxBe1nlQQazrJOrqQTyGqv1SxgiKN2V2vYeC+nbtKh0hX5ddVVigH2Qb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UOlou/EGobK7lr+WHPiAS5+sabSAacC9g7Qx8GUB6SE=; b=I6zpoRMWGQafLS3pI48c6aNNb3
 A5izua+7sDLlSyoCPRD2DpjlebPPpj1RmPIlEtxuWDJ8XIoDibz+TpH9pzY49UKMahXlFG8nhl41Z
 eXleMH9cPvOPJhcRavH01AbeyXYSlvcJ6E5J/5apnw4IqHRF84COljM9QagGszhwjt98=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtcC-000646-RW; Thu, 08 Jan 2026 17:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 645C340B1A;
 Thu,  8 Jan 2026 17:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FABC19423;
 Thu,  8 Jan 2026 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892559;
 bh=9+zOdW5lNGHcGX85wb9WeocgdTAcTrprGG0z5Bzi+RE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=seVFw8zUXzlt4ulIQql8YFbNPIjR9Rf/DPANtIaUVgMB7HrEOnOdJqRINwwlm0c8z
 AvANMGxK1reP6TvY6s1YHftUbyPa1a4D7XQr5wqGFyxwsTfK+cqKWqN9ST57dkVbsO
 SMKtfsN9QT6PXI/gKFQrYHJqE+Lk/Gs6kj6Hvg3XgESuxAUelqN0C73lD4B6KPr95m
 JpqHj+JRZQ0rAggZG1yobkaAZfi3PHEVb3k5rKu0rV7A0tLPvGctl/0eI3eBTKXMGS
 pd8AFhLZOqZHzJMNSVhNeDhMxSBfrogUoW8EaHeLTlg6D3ZEhNgHnFWQ5i2xZhNPw9
 lByRPSrHlyiUw==
Date: Thu, 08 Jan 2026 12:13:13 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-18-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=9+zOdW5lNGHcGX85wb9WeocgdTAcTrprGG0z5Bzi+RE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W99/HrvAnnmzGcblpLXD7F4um4fHAJVhg4+
 LzfwmzDW3eJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvQAKCRAADmhBGVaC
 FUmtD/4jEvDoFR4qieUNgn8rr/UtKPrGyvRvQMWHMSrHBhqUd+/caCds+/vOgFJuPUUC8BBPKaN
 PpWJr3+bB+63HgaLFL5kjBBI84UDuHXUsAdKojmsuX46XRIFCdY4HiLsBRwNlCL3EOFRZb7QMNA
 CLXuPKbYzRdJ5vIeg0PfhFnEee9jhOdU7PhkAlUByzRLB4aRTSgqIksyQLdZtEcq43Mt4+08iOE
 03e8Lyi8MUEQ40+6qwWiOrSbb0RVCZtmy3jlJUPmrRBFnaaSbyXBwQ5pIpRC7Zpjtk9XwyatLAT
 bE7MsYykcOYo7FuP+Eeb0IkX1pY5/khOn3jb8NDXsKQG0ExLeybRnT5n4UB74WPa1yl9VN+yqO3
 QlSW3ny4UUjj19ZXN4Q7048K5CeEiAQBfXtwvEd5vIX7ErHKQXL+VAeFjO3jcXrMc2y9UCvEcfK
 nDXsszCFcuM/T6/I/XGZXHHOGA/FUVvHC/oFF/nix3OCXccHGPKgcXJX8tHP1+t0xqnFretZz8d
 5CypPiszzqEX0oF54cIJjyIzVhzWNzjfhi47ao5Ab42Lu1n7ea420e2etzoD35ai1nWJURpgrC6
 9S21HSVhuCfUGGAqiahZXCHQPulLW/N1GNp7FFtV71kFlOoBok5C+bkbkjXp2uz+F7s/PU8fOEX
 9ml0VlbuQF2h4zA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation pointing to generic_setlease
 to the squashfs file_operations structures. A future patch will change the
 default behavior to reject lease attempts with -EINVAL when ther [...] 
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
X-Headers-End: 1vdtcC-000646-RW
Subject: [f2fs-dev] [PATCH 18/24] squashfs: add setlease file operation
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

Add the setlease file_operation pointing to generic_setlease to the
squashfs file_operations structures. A future patch will change the
default behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/squashfs/dir.c  | 2 ++
 fs/squashfs/file.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/dir.c b/fs/squashfs/dir.c
index a2ade63eccdf38cd7829a1e79efbb6cb607fa54f..cd3598bd034f01c74eb2e840187e14cb05b640f3 100644
--- a/fs/squashfs/dir.c
+++ b/fs/squashfs/dir.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/vfs.h>
 #include <linux/slab.h>
 
@@ -220,4 +221,5 @@ const struct file_operations squashfs_dir_ops = {
 	.read = generic_read_dir,
 	.iterate_shared = squashfs_readdir,
 	.llseek = generic_file_llseek,
+	.setlease = generic_setlease,
 };
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 1582e0637a7ec87c02afee845dce052259e6af1b..4be92206e755dc6b385bc9de456449c5ed4385b7 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -28,6 +28,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/vfs.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -775,5 +776,6 @@ const struct file_operations squashfs_file_operations = {
 	.llseek		= squashfs_llseek,
 	.read_iter	= generic_file_read_iter,
 	.mmap_prepare	= generic_file_readonly_mmap_prepare,
-	.splice_read	= filemap_splice_read
+	.splice_read	= filemap_splice_read,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
