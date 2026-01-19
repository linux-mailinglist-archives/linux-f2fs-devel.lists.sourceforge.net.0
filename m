Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC1D3B0BC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u24cdeknwjwSx09lEq/gj7wlx4MCSndXtGy9TpwnOLQ=; b=UN08NrFcYo3hnLNW5rEXAGyM0U
	IhlSVqCwrWKkZwB2SunjhQLxbz5oCDwdt/Yw29eELzDvjAWG2EcaWEnVZSs3k5lnvTwwFOcjs+Odk
	lZj8PTFh34PfKGWVyuI07X/OCsrWUkTRLuQ0dMz6OsVmCzRweNOh+0jeibjaPRnfnkD4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6x-0004vJ-An;
	Mon, 19 Jan 2026 16:28:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6v-0004uj-7s;
 Mon, 19 Jan 2026 16:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iN+TqZC4HgENZZKB8bo4zGbsDfjfItmjIIecQeBE1wg=; b=QGHbd2tA0xodcEYH6CkQQRm/8m
 mjcIcIMdzxVjzhelLIJOU0G8P0dl6sHgXtGL3wSfb5SRnefJRyeO3STju3333FS+giw6hAPbXkWIM
 VppLXuO0IeMu01xKBpp3JLG0nUV2fxzINg+NXGuWKShCIOi0rtnCSkPP4Hu42Mt5zrgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iN+TqZC4HgENZZKB8bo4zGbsDfjfItmjIIecQeBE1wg=; b=jjSUT7RPJZpY7yd+sUYTvlwm1U
 4EUiYvH2iSnW5QIA9WyacoADZ8Lc33k3LKbgk+yDh0v+tR1yLYjeVyAu/d7HURSfdPJyPz40o1kbS
 h2GWnMxSiYF96DJrNzCKVXtxx/CjN0/keU4fMRwmnZhuB632zggBgshhvozrPIyaIoiA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6v-0007o2-Io; Mon, 19 Jan 2026 16:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AAAB44516;
 Mon, 19 Jan 2026 16:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F91C19423;
 Mon, 19 Jan 2026 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840083;
 bh=oaRkoY75Ujoq1dtI6aOA0DBBPdbXoxvn8BccRGOLbSc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GONKFU7SBdZJKpEx/+RyIiOJlKzpw3wad5XygHCQ6SMdbFsR8UygDcqhklmkj9xxa
 DoT6QN0R/2LJRtNAltzb09X5JNXTy6dQB3iI+MgQwCPVrcE66h660Mpm0BQ4JG8Osi
 1VuiKBmR84INye+Bmqe0VouGphLzEaWWZ/of0z2iH7Iwlv3+apcs+X8vO54dsCxOC+
 5OqDr3+O5xIEGAiMqQqigHd9/dgExp99/46jSgaQEIyDO47+mlUpcDbop0KIt/3IDR
 8hwKx6Cno5+vI3d6qqieguhx0KdAqoai2D7nD+ROJ71Ab9hESQgP9QPViDekXMPGb6
 smRbLidWH1LeA==
Date: Mon, 19 Jan 2026 11:26:23 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-6-d93368f903bd@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Amir Goldstein <amir73il@gmail.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=oaRkoY75Ujoq1dtI6aOA0DBBPdbXoxvn8BccRGOLbSc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltaC973DLaT/MM7zKoBAyQm0Vj7HgbhB6Sm/
 nlnrklYVq6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWgAKCRAADmhBGVaC
 FaenD/9BHrGQNmC+s2kvQNgwfP6EEm92NTII9R9h8Ix57czFYsowChpSlIRo0A9Xd4xRCRPGS7L
 HkWGT/3paJqWpLRClUV0PZMel7V5AFRHzEpZYdoc7G0DY1+7NxwSSWsWzFQsSDdiFd5s2qqfldB
 uus4+aXE5PIKQbdjwm7sTXnLZPP7wkWvDbFW15W34xpjLx0dIrUIEiPIyGYcefVklynKBB87PzK
 lVynQnQJPhSUu3hxEXGz4CD3K62WemAfpoXA8elC2tKDt10kqGNU9H+1zmLINg1EJ5bSg3j0rcy
 CcBd6gYBpqnogMMHL4705I2BFm7iVfExvhAZMDz976RnwglpW3txwmK2EFjUPjsIRfagBpSBpGK
 Rli9TAK78IR7UIc9VRFAsIXraY+cgSTnMCPbBl9RcHwZZrKIkr+9cP5A10JLBJRPIw74fXa6gkb
 UYw8P28UY2bXcWrDM/Ji1UKPCyWTG3k8rSLwFdR1dh+MJBLt5EwUbVsg5NNIQN+vLVsAhRyhd+r
 fj3nyTP5t8+DCC1N4v5p5uMqzJ8bCxXrtDQyn1CzDkA3vfg4QrMNApleEXDx1M8TID4oqKVuLMf
 hbo6t/RUnLwizZZh5g9JrEQZ+yXChodcWH0W05XM8ZA8MYIkZntqbIMaslGrsEAClHDBqWhRqV3
 YjtgGIDgn8onLmQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to erofs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/erofs/super.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs6v-0007o2-Io
Subject: [f2fs-dev] [PATCH v2 06/31] erofs: add EXPORT_OP_STABLE_HANDLES
 flag to export operations
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
 Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to erofs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/erofs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 5136cda5972a986dece863290d20ab103791cb98..7b43ad2dd3eada8c132b26f851394492dfe4bfe3 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -608,6 +608,7 @@ static const struct export_operations erofs_export_ops = {
 	.fh_to_dentry = erofs_fh_to_dentry,
 	.fh_to_parent = erofs_fh_to_parent,
 	.get_parent = erofs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 static void erofs_set_sysfs_name(struct super_block *sb)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
