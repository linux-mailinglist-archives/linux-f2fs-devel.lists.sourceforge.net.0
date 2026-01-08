Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB00D04CCA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKRsEUAZxTWzBLWbD4aPztZUjLqfLvDRfhaHDXJUH20=; b=GzBGGiEZzH5prDshVWRLsmWfz0
	jW6EwSE2DTNLtmpB+FC9qiB8clZyj7HxcrScqZitIK1cBegsDsml/vgcp6siz0GUkzEQ10dvgSE+n
	fmdGL0/9XE1VZEqEhgGJWltXot6C0BcTlKw/Wn07k+Gl0JiF4eGVy2Jx2dzrFzM49eu4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtbE-0008KE-CH;
	Thu, 08 Jan 2026 17:15:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbC-0008Je-5O;
 Thu, 08 Jan 2026 17:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HFHk+jGYiYNdAMGXV5WQR542mqPeU3BzqR3Gc2vQLoY=; b=Po8pHgT4wcSFKGC3ENphjsssCj
 whGUJ4Wv4p8PbnXc2VMSQWzR9KHTnyNC24p58haRRi2HrX0Al5aPe/lUtnGPH46Ro2ZMW3QqlrFCD
 bUqxTEPJvDDjQW5VZI3gm/IYxS3ciHtmGJsGcTw6GZUXnH2eCxkgzXBnpC2I+x0oPXVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HFHk+jGYiYNdAMGXV5WQR542mqPeU3BzqR3Gc2vQLoY=; b=CFRyuqoHzEEYj4x/vZ81fTGxKi
 u2LCAodgigQLmjqDCvwXOfKyEVEFHnkTBD9JaejVJ2XfDALhELkllZcKm1iilXGmhUkmUVB4JF8Mv
 Z07QT3jMTms3INU3aszETke5x1iT0YvKuUQXqfoq9GIzph2gLbBmDUK5hr67bc15oNI0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtbB-0005uL-8t; Thu, 08 Jan 2026 17:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6A1540847;
 Thu,  8 Jan 2026 17:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C48BC2BCB3;
 Thu,  8 Jan 2026 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892490;
 bh=dYgR/946dJwV9AewaF5e0d1y1o9rSJR9ABQBhS2Sc1E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EE2gZbpwilK+p65zJF+DVJq4MFRPaZe1eMYvJUmFsGZDgMyF9n/0nbfU8VldhCR1Z
 ig2YvmBFJpERXaOR1YuP8VA85WDlJx1s5XTX9JaCi+k8TeGUUxrgEFvZcgCNcmK4jM
 zUWajICcygLLxU/fnv7Bl0PM/k0sAGhrvfexl8QZcHgN41M0I+dTkt3cpSxxsgsmlm
 8VMU/MUbvQcy4wKiuCyibQqAQFhRM8TAJqiPwzb0h9MYwLHKGZXNeFJJU/dHSWsMCt
 hthHXEtbuWS1TAGQjZX+0TQBu0a5iqkHqTAFklVluh7jPWvQ1npZjrBYPStgmQMhhH
 tLNIRSDSTwisA==
Date: Thu, 08 Jan 2026 12:13:04 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-9-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=dYgR/946dJwV9AewaF5e0d1y1o9rSJR9ABQBhS2Sc1E=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W6tow5eWlg3d9LlE4JzeKYs4qhQrQSZqLyH
 28Sqlg8Yd2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lugAKCRAADmhBGVaC
 FXExD/4+xtepcLHtJswdWEgDrfCU1l+JV7R1ZY6za66bEWKzixlzEz5aEKjLNSkfDp6latYm0WV
 nQmECaiV0baGSZOSWYMEDHJxt8XCYei2h8uIIVVGTLuh19g8JU4y6ZwbvI6IbIWBZSML25ObG/k
 BGNBwe/I+4nGuNM4MAI6DzSKz0cnW+TQv9wtK27EfsFB9aE8xFNHtQBXrfbRKkMsFHlt8nRnWgL
 0CZlHx3wVern/FfuVElMRYXy0j8AVkjyUJxjWPvou9n1slugfh22VXcVn485XauIBxfx5F0+oJF
 Rg7mIbM5ZKrWl8BlLK4Nz24ikHNS+GO6Pl5zNOULmo5Avxq7WPmb6fIIotCODNKWbgrZ+WInbFr
 J2Mx450orrxaXQQ+ZxHv/FzG/RCq/jhW5on4+b/h3zDTBMbA9x+9eFRX3r4gmgQazMA3tL5LKmc
 dam7IMlqI1d0VjMQVGvcVYcanw4zoarKDKQoBd2lwX6SpSc4nSezLKBdMQirlmjJUQIF6U2l04P
 nbP0DomAF2vMA9H5kiyvMnMt0ojouLw/0ANYcWfJ3QIB1anSGvKDmmIiR9GgacsdwFbwJOTNCjQ
 xaaBKflgwoM3KB7kjLzZpogI65tiWTabuagt5tmxM4laxXId94a5+ZfJ8v0Vr9W8dJFWBx+K7G4
 +olNbY50fwTUfZg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the setlease file_operation to fat_file_operations and
 fat_dir_operations, pointing to generic_setlease. A future patch will change
 the default behavior to reject lease attempts with -EINVAL when [...] 
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
X-Headers-End: 1vdtbB-0005uL-8t
Subject: [f2fs-dev] [PATCH 09/24] fat: add setlease file operation
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

Add the setlease file_operation to fat_file_operations and
fat_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/dir.c  | 2 ++
 fs/fat/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 92b091783966af6a9e6f5ead1a382a98dd92bba0..807bc8b1bc145a9f15765920670c6233f7e87e55 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -16,6 +16,7 @@
 
 #include <linux/slab.h>
 #include <linux/compat.h>
+#include <linux/filelock.h>
 #include <linux/uaccess.h>
 #include <linux/iversion.h>
 #include "fat.h"
@@ -876,6 +877,7 @@ const struct file_operations fat_dir_operations = {
 	.compat_ioctl	= fat_compat_dir_ioctl,
 #endif
 	.fsync		= fat_file_fsync,
+	.setlease	= generic_setlease,
 };
 
 static int fat_get_short_entry(struct inode *dir, loff_t *pos,
diff --git a/fs/fat/file.c b/fs/fat/file.c
index 4fc49a614fb8fd64e219db60c6d9e7dd100aea1c..d50a6d8bfaae0c75b2dbe838d108135206d0f123 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -13,6 +13,7 @@
 #include <linux/mount.h>
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
+#include <linux/filelock.h>
 #include <linux/fsnotify.h>
 #include <linux/security.h>
 #include <linux/falloc.h>
@@ -212,6 +213,7 @@ const struct file_operations fat_file_operations = {
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= fat_fallocate,
+	.setlease	= generic_setlease,
 };
 
 static int fat_cont_expand(struct inode *inode, loff_t size)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
