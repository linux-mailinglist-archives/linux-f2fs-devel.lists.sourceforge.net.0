Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6CD04CA5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbYlBM2RjyNGmWzjXZH3orgQe+/nlZXbFPrIu9NDm3A=; b=QFHJR/1Xw7grmQwRZQ02s51F73
	0R65lSTx+rPczVlFuvyVP6tW+Q7ZOi0zQ0x9BCTUct0xDYW18dEyQ4CPnXz8XuNBdV9xZ5KzHi6MD
	8fJteULLJf7a4zalDyJlP0VWSuygMjgVpomkJS0+5CFw6ih9PtaVPsb+Ig8G0pMX2ntY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtat-0008G8-N3;
	Thu, 08 Jan 2026 17:14:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtas-0008FZ-EK;
 Thu, 08 Jan 2026 17:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3OlUsuC3/tNLYn+8rD9Zi3/RFls3AiER79V4RwQ4nc0=; b=KY7tXshhM4jcKEfhxWazR7rIgc
 tznCYSL6gNkJMijtr2MvEcmozNsKCMyVlSkLHSyxJywgc/YZFMEkxKd7zIsdwEbgzdmEAXNq1I2+C
 IFSNiKi8v9y557G0OQrCBy9tnYNLOVNiQ0eQZetZr/IffoYp+pZOQIgbuWjWnkL1HiNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OlUsuC3/tNLYn+8rD9Zi3/RFls3AiER79V4RwQ4nc0=; b=Lj7yVBkeUQccUaM924XunW+t4t
 E3Gu2VRJVnCyVXqgeDZdjXOWHhIvQC/Sy0hFifzeiwW0txoHvDsWfvnPiGRva1BhVz0o/h2t0MRWr
 Edu+KXIICUG2qegd1y6CakRZGhXRptE49paPmIdB03Km+6hf6TLS4U+Hw7XTZ9Eo6uaE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtaq-0005r0-T1; Thu, 08 Jan 2026 17:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B6A54098D;
 Thu,  8 Jan 2026 17:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B1DC116C6;
 Thu,  8 Jan 2026 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892475;
 bh=U7S0etaEv8XbcYfILfSSuzi+P7a+aG4oaPVvVEC0yKw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oU0MEVnsPzUmFg1DgiNPR9jxtVRsEn7l/25FyE5LGlckCNBp+ENrt67kCjhVH5n/E
 zUaOzKc9aREGF9AKTJrNr0Rftiq++U8TGZnZjznWIv+syt5eODEn4APKEj9dNLXima
 7JJb6r/6wJUoQd73NcJWDUf+NlabMWRg1s7OqO5z5oMjUirzXGHOCnCcD1RQGcZ95S
 vRocEgo2x33kwDf5L4xrumMgBdS+trBbwKddwqrRjYW6GkjFg8dy1NsDv8/ijKxawe
 fOByUQkqqB9sk2qDeQ/9eAZ5pVn10R/SRrQJmjhnIo9XuAXHFwfyfUzybWFtyBWa8o
 0MPK2Xd8XRorQ==
Date: Thu, 08 Jan 2026 12:13:02 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=U7S0etaEv8XbcYfILfSSuzi+P7a+aG4oaPVvVEC0yKw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W6RfUKKljQL5Cerh3GnT9/0uP0/MXv1o7St
 HVKnAUnvHCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lugAKCRAADmhBGVaC
 FZDVD/oDif45OVfg9r6Fnp2duoc1ElrjVnT9zhMMN8e/dccZgQ+m2endixk1Sa0MscAhPTCtGcu
 x2/DO4X2z41Lo58GZ1NyL5KfL9P/+EOjWPIovpdUVxwwJy7jnZeNnvUz9tSI1aDM7h8A05j4M9p
 fnODqkW02HUKmsM4OggWTlkZ/eQz/FdjIBOKtaFRMIhjK+B/cGbDRxYGCgr/xh9XEMuBXjqUhAo
 mrY76LpHrL5qFr3AqkA8ZeffDzbIoojosSfBAMyJsmiFRP047IjUUogVtqBiZafCWpcXwUVqvEZ
 VZwu0yqPzEolFeWhrCVXFMddwXwwx4yzt+4FcC14VloO5z+nisM9tHC20UHl1I3+MixDfeTRm1d
 hvRgAsLtnlBX7+R+3wEYS+aaR1XzsZkp9UnKpYzDHbnDbTEwn5x7lHENLDa4AIkZUAsxPxjsuC6
 oYzrCHQE9DU840ojM1nH/xuau6QN8GKVRP2gmEJvN29+aOm6SK0Awz6OlXcY07tAsaa5bbgjINN
 kEqi0Ihm/y6NAkhwuv4500UIgyZCvqWAKA195H1vaFW5iPkzwEGsClkorDQP0y+1pk4EzakLSh2
 gKuFpo0wSckYsBecgX4VD990C+dTmOYHY11wmjH5dsqaYfgHtUIq/gKbzngZY+T2nQmxrVNd58f
 ENhaby327F711/g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to exfat_file_operations and
 exfat_dir_operations, pointing to generic_setlease. A future patch will change
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
X-Headers-End: 1vdtaq-0005r0-T1
Subject: [f2fs-dev] [PATCH 07/24] exfat: add setlease file operation
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

Add the setlease file_operation to exfat_file_operations and
exfat_dir_operations, pointing to generic_setlease.  A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined. Add generic_setlease
to retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/exfat/dir.c  | 2 ++
 fs/exfat/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 3045a58e124ae0f193af2caeef7261b20fe42e00..2dbf335eafefc5f51a5c70598786c35b85e2118d 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -7,6 +7,7 @@
 #include <linux/compat.h>
 #include <linux/bio.h>
 #include <linux/buffer_head.h>
+#include <linux/filelock.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -298,6 +299,7 @@ const struct file_operations exfat_dir_operations = {
 	.compat_ioctl = exfat_compat_ioctl,
 #endif
 	.fsync		= exfat_file_fsync,
+	.setlease	= generic_setlease,
 };
 
 int exfat_alloc_new_dir(struct inode *inode, struct exfat_chain *clu)
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 536c8078f0c192688eed5f5ee86dd1bc738be84f..b60ee0e1bec9344145a6328cdd727e35b317c08a 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -12,6 +12,7 @@
 #include <linux/security.h>
 #include <linux/msdos_fs.h>
 #include <linux/writeback.h>
+#include <linux/filelock.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -772,6 +773,7 @@ const struct file_operations exfat_file_operations = {
 	.fsync		= exfat_file_fsync,
 	.splice_read	= exfat_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations exfat_file_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
