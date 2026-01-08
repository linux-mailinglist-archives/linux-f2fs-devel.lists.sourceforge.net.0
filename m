Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF527D04D7C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66DvBTyP/0Z73TgIoltIHGGrnlUFW6ecP7ZDywPYNHg=; b=TA9wSmCv7vvElmID6lCVjfYdKY
	RLD4LRLkmphV2NQLCOEpq46bx3GbthfiRieOsSm+/1/k3Twi8f0LQfJPD+bNegHiR3UOO9AwND1Da
	tA+EGKyaqBA5W6tHDXWsNKlz8b37MdJT15xjCn6pN6nTd14A40VWhxVoFJlI0MpI1QvA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcg-0003bF-LB;
	Thu, 08 Jan 2026 17:16:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtce-0003ag-Ui;
 Thu, 08 Jan 2026 17:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxI57s6/K+xSGvKm8JB2Aq9p64eelY1MHz0jZWF74oU=; b=Gag71koMuYfRwghivufPyHYTX/
 fM1gKW4rjuWx9frWQXcJgkVWbc9qnw30L6jo/sMCQqutSGPoZ6SB6GaXv8Z/f1Cv0KhYVow1NG4WW
 R+adr8Mb0C870NLagQSmZWnx0T85WGqbqjXRtGOkNmMgYEpWJnS8C/OGo/H6WR6WvcAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YxI57s6/K+xSGvKm8JB2Aq9p64eelY1MHz0jZWF74oU=; b=SlLIaDe2WVTjPlrOK41FHnwiAm
 wX+oncFSdnjrZFnIgpXfzegfgR+y9pzoQMooADx/2mwmGy5qT1nA95L/BO3n9c0wwuBzdCr1fLU0M
 RMp/dh81w9/CrZE7q8iVU1eyXo7EogjVkwiqrexnNIYgSpmYNmJYiv7GSbAOfYAckyZs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtce-0006Bt-H1; Thu, 08 Jan 2026 17:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3859A42BAD;
 Thu,  8 Jan 2026 17:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9066C2BCAF;
 Thu,  8 Jan 2026 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892582;
 bh=uKAoYiUzb2k4mWk3DPDn1qw2MlMadC9ZK+Ro0COSfEk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N+KAwUSN5aLOeh58U18x1Ce3wnLpBZV5zhe4kxwBm8fPRX5wOYoSQkrqxYodHIYXJ
 aw/tNdkO6s3F+xmbKKmGdGwZPQ7OcAFF6cZu+pkYIBzXkHIXu/l1HGZ9m9oVzb233T
 pb1QsAcwbdSOEG0g3hYn9b8h5rMA3FQ1auQxixaZPSb3Gnid38yhHfa7DN45lRpFNy
 HnYLVP3j5rN6nuQ5tFXKqOBNLvl4XnhrEDVD/oaSpKYeACD6sLQ5WeBkAwtRRf89Oj
 Mszb3PGelES2eFWGjjvA1vTJCZKTNjzsErMgOooBsTzqIDIIX6sREpum3rJfPfbZjq
 ncrWyVUiaiNNQ==
Date: Thu, 08 Jan 2026 12:13:16 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-21-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=uKAoYiUzb2k4mWk3DPDn1qw2MlMadC9ZK+Ro0COSfEk=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W9x3bW7J65LYqA4RAoS8vIXUjkwwPn2jjsp
 UmXLATAbCmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvQAKCRAADmhBGVaC
 FSNEEACZcBsWRq9qFYTe80h8vRRw2k3rdL23HiT2BsxfSAAZFyBsEvwK9+kuhY3wgeDrU4j9WnH
 /GIsJmvdTFgf55rZbEZRkM+UjSpTNkca8KYJYfCKqOUpyDrGNxHkRKAibGXOuEhKan0kUm3i96K
 UpbDBsdke1UPupTK3TAK6QO1LnUpZROD/waUOPEAqTpxmgOGUircRjljFXwTtS4WNtwDpwaw9/v
 59rhsifvhQg50TiVS3DGlyav9p3uOTznw2pu1n016JFbPDKtUHQQTKWCFllVRGBBN0SrVjUZCvZ
 ysFLmyL6FEXsBc06lpevB/4OZTOHEMAKH6GCviniXzi/Q9mNaGzw7SywSs2UpLRuBEl1F0o2nC/
 gSEYJYJtSUyPrcLRO+sqctPdB0z0c9N5ja1qbzwPysDOGONbqHHZRAwl+/fAm03pvjcgj+Ek4y1
 z4l9I32yHoGA0elIfZ94CnUbSLjHhHp99E6+gneCtLeJNF/V2UdqW8YbC7syjZmYsL9/32uBR+F
 Y05Bwybcvu6omNnCSV8mOat6qwJVat/Xp9cczO7bcMz5ufYYpeQfx8tSA4zKqAhTV7fCQ+3WbrC
 B4bB30ktO7leILwAVHcE6hs0zFGzhxVYBn5+WP2mhpy5Eq42GL6xsEhdCeW6GB9eJoBmuml53dB
 1zKY0MNAGgIkj8w==
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
 to the ufs file_operations structures. A future patch will change the default
 behavior to reject lease attempts with -EINVAL when there is [...] 
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
X-Headers-End: 1vdtce-0006Bt-H1
Subject: [f2fs-dev] [PATCH 21/24] ufs: add setlease file operation
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

Add the setlease file_operation pointing to generic_setlease to the ufs
file_operations structures. A future patch will change the default
behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ufs/dir.c  | 2 ++
 fs/ufs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
index 0388a1bae326ba41bc03471fcb7ed01098a707d8..43f1578ab8666a9611d4a77f5aababfce812fbe4 100644
--- a/fs/ufs/dir.c
+++ b/fs/ufs/dir.c
@@ -19,6 +19,7 @@
 
 #include <linux/time.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/swap.h>
 #include <linux/iversion.h>
 
@@ -653,4 +654,5 @@ const struct file_operations ufs_dir_operations = {
 	.iterate_shared	= ufs_readdir,
 	.fsync		= generic_file_fsync,
 	.llseek		= ufs_dir_llseek,
+	.setlease	= generic_setlease,
 };
diff --git a/fs/ufs/file.c b/fs/ufs/file.c
index c2a391c17df7f34d9961973909d1985f5f786e92..809c7a4603f863025caa947b2e08f0c2922ad619 100644
--- a/fs/ufs/file.c
+++ b/fs/ufs/file.c
@@ -25,6 +25,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 
 #include "ufs_fs.h"
 #include "ufs.h"
@@ -43,4 +44,5 @@ const struct file_operations ufs_file_operations = {
 	.fsync		= generic_file_fsync,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
