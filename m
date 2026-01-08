Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E08D04D3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24pyZW+0EkJt/vmDXkYRaL2ZLnqUIvswuSNxcnI1KUo=; b=PmpzdIQHjKPpDM4kYgKIrT2NuF
	aBbxUbnMcdJ/DKZn8Sl+RF7YFEWUEdvhvF6KMpsO7tsBatMpDmVsVbiqrg6TTdxSiBHhf5Pl18nl6
	Rm1gsSdwYMDzCalPfX6a4u4lAusLb1QmLogVYDgVJD6pE/8jI9V1Nw8U69Hjbas5CMIM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcB-0006lM-9r;
	Thu, 08 Jan 2026 17:16:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtc8-0006kX-C3;
 Thu, 08 Jan 2026 17:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GacgX3gma1Dc93Uid85Rw+Mr1nuhJfogW8HRstIGR0Q=; b=DYiBt4gHdvWqFOrYLKcBtu3uwV
 dR4HES6oOl1Ib9ocHwkUnAMIAFzVB9+IlaMKm5Z/wUGcU+ZrDgpDa1DdDUHZrNiCpoPoH5jkYc8MC
 UgZijLRFwLlAXA93abaGsNobSg2WXJCByTcD5ZE67l39L+GstTF0LP9rNLVeiKPwazEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GacgX3gma1Dc93Uid85Rw+Mr1nuhJfogW8HRstIGR0Q=; b=Ese/J6Cim4wKXYxONtU8KLGBkw
 GNK32cSfCjFzfWqPppRVC7tJFGiFyqR+wbjKXoffswOH4BT9gQQDHu+5YlOfb+lJ8LI163Z820NGP
 6/LGbET0vM54n+hwd3U2U59q0CP6C7yLgJyq9LVJiKOZW+p8zmt84lE/wYnymPCBeULA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtc5-00062J-NA; Thu, 08 Jan 2026 17:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 120E06014D;
 Thu,  8 Jan 2026 17:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74598C19424;
 Thu,  8 Jan 2026 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892551;
 bh=/QjFws5fePN18OBYa8bISKhX2yIiYoWbwKUyTsCKvi8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PEjw0/vgT6GLsQDvxChTEJJWrZnAQSwT/oOYtarnEr1mnlXneb12dRn/+E7ODlH3e
 lEscuNaICbpX+q+/6dO9siSu+ISv3W0K9wwdJ/mDEw92/56eNocyUzJjpaC6QdgIyG
 TXJksMFDlSytDs24skqoMve70gF6oZNa7uvLK/sesVf1BfG3jX47nbuodaLg5SaXh5
 LmcwS/E2mZY6CTlzB8FWEcmq3mPVRu19tuFt5HFUJmWTID9UfJc3ZPIB70pwGbpr4f
 vHcBl/oxvixj+KEoGwXKpq84pv0rNzyvfBOZbbD9Nf9EOol0+LhwcwkX8AyEiOq27a
 b5nd9nZ8BtLsg==
Date: Thu, 08 Jan 2026 12:13:12 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-17-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=/QjFws5fePN18OBYa8bISKhX2yIiYoWbwKUyTsCKvi8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W87k4FcETAMephFZz/qe7wC4C41gmjqLLfA
 Q/kBv6HQmOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvAAKCRAADmhBGVaC
 FYTHD/9CJrqt0jlrMR3MPzOXX6TESjSMY5U+1+dwGCcCtiGwGSBiK1ZY1GBC73psRJ+mYjVfSic
 MNCosL0YefLDvCp7QfNs9/ejLx7RUtyNCes+plJwrTahfnVJZ1uNYdK5DEZ44L2DqTFmrzcD4wQ
 oy1zj93AjNBYypMHV/k+qL1usyMtFr3jPnged5fSSsBkJ0C5Si0L3ZpP6TqWEWeOleYjDy2urwR
 fGkQUW+9Y6Xar5xRYHpGJwt5PKYAatcXU+SveMXOFbp35GKe+fnfNWZiABMI8W02Qp4Mf9CV2ZS
 45JLWGX1Hhj/0H/KewEpFamsXAQz298u+NwRFRypHdABGYAFB1wzK1r/D5p2LnmLKqrTaQe5bmi
 9Jgmywfj0M6wILCz2dDyEET+5PE0sipM9aPV9cHp/v/kpE/99FxGIVlFijqG1YuygTZ3CnEMEJu
 y6HITTLBUusNTrhTU0Khne6zJzbhrbr4Ank1yRCl3u3cBFZxLvFFUf7YuQpp9L+6yqXasB7W63h
 VKAGaSoSzMKxT87yMNEdOlgZcotY/MTm6wihQM7wiAsC80uzL7LVT26vWynyqiZeva+dO6UcZet
 rUCqoy4q+/P7Ir1xCA0rQQCgb99iKp2pznNbBKq1+cYFA4N3yihYKFOnTD8jO/9X9fRvFIvZWGS
 bhGnYs9Awrd5yCw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the setlease file_operation to ovl_file_operations and
 ovl_dir_operations, pointing to generic_setlease. A future patch will change
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
X-Headers-End: 1vdtc5-00062J-NA
Subject: [f2fs-dev] [PATCH 17/24] overlayfs: add setlease file operation
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

Add the setlease file_operation to ovl_file_operations and
ovl_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/overlayfs/file.c    | 2 ++
 fs/overlayfs/readdir.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index cbae894572348acb3ba6c2b6e7f84558379110c2..8269431ba3c66d49d2eea24c4ca63a3d2879580a 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -5,6 +5,7 @@
 
 #include <linux/cred.h>
 #include <linux/file.h>
+#include <linux/filelock.h>
 #include <linux/mount.h>
 #include <linux/xattr.h>
 #include <linux/uio.h>
@@ -647,4 +648,5 @@ const struct file_operations ovl_file_operations = {
 
 	.copy_file_range	= ovl_copy_file_range,
 	.remap_file_range	= ovl_remap_file_range,
+	.setlease		= generic_setlease,
 };
diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index 160960bb0ad0b0cd219cb2d8e82d8bda08885af0..7fd415d7471ed58849710da9f8a414b2b7aca1b4 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/namei.h>
 #include <linux/file.h>
+#include <linux/filelock.h>
 #include <linux/xattr.h>
 #include <linux/rbtree.h>
 #include <linux/security.h>
@@ -1070,6 +1071,7 @@ const struct file_operations ovl_dir_operations = {
 	.llseek		= ovl_dir_llseek,
 	.fsync		= ovl_dir_fsync,
 	.release	= ovl_dir_release,
+	.setlease	= generic_setlease,
 };
 
 int ovl_check_empty_dir(struct dentry *dentry, struct list_head *list)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
