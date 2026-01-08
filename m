Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063ED04C64
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atf2QzSgKaBPXBUqgKRPXfPYVuJYfgsV28mYvY/aEdo=; b=RZ2Q7u43+twDJ1zkpwCgzTnxXO
	T5WXBnGrZkmvooEAjXEJNW4Xo1HdEz1p6l3QW9yvfL491AWk5PeWUd6hOMOmB+HkubbYguYthhGcm
	QTybaEXNjeZZzRuBh1w4Jq8iEXQrr5iNyNYs+QMbzaKFj74iXY+Ne8tcP5C+W2aAwk3c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaQ-00040a-D3;
	Thu, 08 Jan 2026 17:14:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtaN-00040G-R4;
 Thu, 08 Jan 2026 17:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ommrtXllry4Rl2LM+IwJb1/6AWt5QR3CgIf+tO8IrVU=; b=eEnPAxxwUHcJoeu9pHbvPwhDAk
 G8qZFEN0XXzoinKBWsovSDyiBNVP0xdh7h/jH1Ox0VHxq0gIprpCNGLTHoQSonLVlmeFhR98+4QEe
 aRoJw9ZLdE1LzzbpEAdc9Nyg+UzQrMvUhjFfEPOFHa4mnXcb9b3EmMNb0nlQG3XgMjIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ommrtXllry4Rl2LM+IwJb1/6AWt5QR3CgIf+tO8IrVU=; b=K87jAQSuqVgl52DM24AFik06+w
 emvQtheQE1YaiMl3lr4PGiFr2ssexe3GhAvIivg9FRMI/kmCwG5jvmyyNixucPoT8yQWaBgnfoYLa
 keMw2RPd9XIIPCmq4NnYxmj8AvQJi9FUGQFVu2sqKYIh6+Rx7BdViSJxk0+3Ll6cxMkg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtaM-0005n8-VV; Thu, 08 Jan 2026 17:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C6A06012B;
 Thu,  8 Jan 2026 17:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8029C116D0;
 Thu,  8 Jan 2026 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892445;
 bh=r6yK8bK+kkMgdLh1w8q65yIEqjkb/IjmfMvjzt63UDI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qr7TVxvjzjLDifiDNwgbz5Utlv1xXYOFRFXz45doMG8Cdh5Klxpemaa34l6LJokhA
 LFa84+w6J2qISvcYOsLfUBUSL9MwYOCY+AMEM0SAde8YfqlKywdQkHZSg+Ogf9pjzQ
 aFpq+UOCKzyyuR2vxCOphzBHlhmhgOw3MDspuwMRqEYAJz9tNnga4+EJpK1D2ociJW
 SANMkPyTno9YLvlxnw/Lsx6RGruAjUhICO986WMabplDp+6TiuUuX2xPPwNcBFGQfF
 69HtUgtVBqbMsF7uMl1/aNC1vnXN6NRGfWYioeAlTU2AE6rPRYyHHQqJes8E1lstCt
 KWb4D2+xXXgCQ==
Date: Thu, 08 Jan 2026 12:12:58 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-3-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=r6yK8bK+kkMgdLh1w8q65yIEqjkb/IjmfMvjzt63UDI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W59KQJzkynnqRywsxn8vf6E7WkYLaalZHcn
 hqXE1iesQmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luQAKCRAADmhBGVaC
 FaJdD/4l9fv7mklHKjKkjTHpTVCuJPpIKuHhUtEoAqSprUNpwgQfDYLR6f54jMEQA9jS1LBj+Dy
 QyeVCVp55DoP+wWIXayOwD+klKX2cjtKHEwQH5WNOE+citJTM6zNMzIBsDuWMPletL+BrqbrBxR
 HQDrOyGoBCNw3T1Y3bJodEqe17RMpbrM5KQW+uFl//FLm8KIwd3cLbRjHZuex9cILVJooiBg9l7
 hUE52fcXEYxfjxHGR+zyVf6kogJj4y74vQx4i8b8B2Ji0IdoaBOVwiZpxIuDdQRGx00T4PkN5pE
 bI0JaolvkVkIP58mQT0gLpRrctVhJ7Fm0DRISz+BmhTcfaaeTwcgO2m35EL5Df2ExhjnuyRvPIR
 79MM+Z+RIyV4mUCgXq2Ew49Qxpsd50AoG1moCPbZ/o5bQwqkL1OW1HDV8svhp7gU1n4Pmsf5he6
 U8/NR75X8fqtFciebf0UxTzmneWSw0zcIw2QKAsBUmQukDXYH/gJYnWSF9UAj/JrIC3fNunArUq
 llAH6702SuQcGU6kAt4IxAZNCFIjdu1g5UiVgOaxJcCh3emmvOFhVMzCWpAuGiOFbdbwEed/7pH
 iNMhOMoloJOXkThvtx3egvJavKsX+vhYLTgSnhPuQ83dhuILLuHFQaySEbcaXOac64sdVpwJc3b
 Yr+dTsCBfX540XQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to btrfs_file_operations and
 btrfs_dir_file_operations, pointing to generic_setlease. A future patch will
 change the default behavior to reject lease attempts with -EIN [...] 
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
X-Headers-End: 1vdtaM-0005n8-VV
Subject: [f2fs-dev] [PATCH 03/24] btrfs: add setlease file operation
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

Add the setlease file_operation to btrfs_file_operations and
btrfs_dir_file_operations, pointing to generic_setlease.  A future
patch will change the default behavior to reject lease attempts with
-EINVAL when there is no setlease file operation defined. Add
generic_setlease to retain the ability to set leases on this
filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/file.c  | 2 ++
 fs/btrfs/inode.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 1abc7ed2990e0e956dc0550cba8b0cfc90109e65..aca2b541e72df3638bdc6cd7551a018ae959039b 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -10,6 +10,7 @@
 #include <linux/string.h>
 #include <linux/backing-dev.h>
 #include <linux/falloc.h>
+#include <linux/filelock.h>
 #include <linux/writeback.h>
 #include <linux/compat.h>
 #include <linux/slab.h>
@@ -3867,6 +3868,7 @@ const struct file_operations btrfs_file_operations = {
 	.remap_file_range = btrfs_remap_file_range,
 	.uring_cmd	= btrfs_uring_cmd,
 	.fop_flags	= FOP_BUFFER_RASYNC | FOP_BUFFER_WASYNC,
+	.setlease	= generic_setlease,
 };
 
 int btrfs_fdatawrite_range(struct btrfs_inode *inode, loff_t start, loff_t end)
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 599c03a1c5737ee4129c0bc1743b345847fa5dfc..5d1bdc862ed2711e349af085512f3bda6cb63278 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8,6 +8,7 @@
 #include <linux/bio.h>
 #include <linux/blk-cgroup.h>
 #include <linux/file.h>
+#include <linux/filelock.h>
 #include <linux/fs.h>
 #include <linux/fs_struct.h>
 #include <linux/pagemap.h>
@@ -10573,6 +10574,7 @@ static const struct file_operations btrfs_dir_file_operations = {
 #endif
 	.release        = btrfs_release_file,
 	.fsync		= btrfs_sync_file,
+	.setlease	= generic_setlease,
 };
 
 /*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
