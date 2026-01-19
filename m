Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A21ACD3B102
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnjwc1Fus4MFiBQmosjDebzbQUynKneRdTgNQKePG/I=; b=QWo3MnMNUjnH7nAUI54gSYQlNW
	IwpXzEX4xogbEb5L0iNsVRl4D0JfBcXcTq+ETSmhQ0wf7AEFyj1SmJgr4oouG60hjZXymX/4R3gxI
	oYykOHpd/Gbn/EXILsFufFYUFYAaddlCZJak3rym+wN91CAdfdoxIxusnYsNhQO7E/Ik=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs9K-0005RG-JE;
	Mon, 19 Jan 2026 16:30:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs9I-0005QR-Rf;
 Mon, 19 Jan 2026 16:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WuwnkLUgDQXbd/SOy/5k80yei661iYq3HAqCi2vEuXw=; b=DEqYZg1ZnmMIUBJUsa03Tyej/q
 4hZrdJGDNYRoEMsIymAVkuxH6MZYDCEDhwUsVPH58ISDcEf/KS1VU68TLVPocZpUirUrYQvhWV/Sd
 LUYFMtEW6fcRbKQeUpnes4URu2l2QSfe06r5UWuWC9hgLZFSX8czvqg2fp2LL3+EeaBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WuwnkLUgDQXbd/SOy/5k80yei661iYq3HAqCi2vEuXw=; b=ke6flQcPUTg7lURjURFPRyQhQy
 9DMNP8DSgh3mspkrB6mr+Rjx17BBgGU1H8vEs6vPnbEcTsWaeSOaucag5xi8ncfRbpf5TiN2BNn0i
 8MDZxQBl3F5Wll+tuW58nZeOt9MKCZTvvKeONlFwwCRNhrwLk6BVjM1ZjoiPxfoMKGVc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs9H-00089u-Vi; Mon, 19 Jan 2026 16:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C5B060167;
 Mon, 19 Jan 2026 16:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22817C19425;
 Mon, 19 Jan 2026 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840234;
 bh=tb2VPLHr94Dp22tk5fzRHLdxd/4iteNlVo/o/3ilPx4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N+/nI7pA5qB+2Wz8qmSRVw4ZurFxnPM9ckLYAe+J8efO1KKkatPx0ewmIZNlxvWXb
 ehSxxq977A1EuK8KJylqhf1esVoZqPGBZhoZJcBoA3mqYaLaW9B30srSQpH9hhu8Hp
 PhKT/itkrIVlWPv18zFYArEJrHAxv5Hh5hdum9w4ASu2Koqkh2R0ETKB9RjvkwvnHe
 ZsPzKT3ukVUd5DpTIIKnZ/kWFchLil9blOQXOgHLTeyPwYzf/prSDarZt0MgmoTCQ3
 1WFKnzQCCnQHor68WzbSce1iBiR3KYVLHyBpGf+FocFkapRxQcbWCo7gewPvNqKVbB
 RYKYSblZfnPuw==
Date: Mon, 19 Jan 2026 11:26:44 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
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
 h=from:subject:message-id; bh=tb2VPLHr94Dp22tk5fzRHLdxd/4iteNlVo/o/3ilPx4=;
 b=kA0DAAoBAA5oQRlWghUByyZiAGluW1/IaPfueYIufakRk1Wy7VajFvE5Mi0rJeiI8SyJNibea
 4kCMwQAAQoAHRYhBEvA17JEcbKhhOr10wAOaEEZVoIVBQJpbltfAAoJEAAOaEEZVoIV1NgP/3Hx
 4TQHJF/6t36D5pyiFxAckKtnLQWuKxq4WEPD5FlhEh6Ptylt+qeF3wJM2gvcXH2VxwirFBR8cjd
 6bOvlXOHQH+nhfO1lRSkytQlbq6UxY0vPkg30u3xphifyBZ5UaEOu9j18/mTiVDYtgOjthfRJMZ
 ixd2vn9fIZvVGyjLubw8BKozpjyEV42epDShz263DxizQ9ckGpQvOd/lNNLM00tT+zhK1rYHDRN
 uAqizwREj9nMJnsCwEzqbAGURMWTq7KKRWlVJSAU7NcmZsCO06+eW6E00PRDYFP+SqsG2ALbkZ3
 0rdBMRTbkJnt8WWL6dwrqSZnGFnkJhVeyMXXqHaieZau2yPGuevBcMUnHmJfUAcZMZLK02tC4KZ
 BfRCYFjEorMqchCziN1COr5DxREd6c09F5IYSy8V6aRDl+OIhwzO/BVZegkxZI9XsUmExpocSoE
 D8kpU2BZ3GGA+GD6NuzTDTyzE3kbEB+2rbIMCT29YSv69mYy8L9D3tCmVEVSKG1D/amCfPatX/s
 xYwgFAsXGOSnsGGzgCLoU4p/mXsV2cdq0yj5uYa+h3U2/yQIu3OEeNDdsXCTSZJ4XzcSdg8wM36
 DVfZqz28XNdL0SYvbvvCiuQShuu9bYTFT639GxoqXNPIKhIKveBMs+6uqXLUqbbYBYUdDy1RDVd
 kClwI
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to fuse export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/fuse/inode.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs9H-00089u-Vi
Subject: [f2fs-dev] [PATCH v2 27/31] fuse: add EXPORT_OP_STABLE_HANDLES flag
 to export operations
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

Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fuse/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 819e50d666224a6201cfc7f450e0bd37bfe32810..df92414e903b200fedb9dc777b913dae1e2d0741 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1215,6 +1215,7 @@ static const struct export_operations fuse_export_operations = {
 	.fh_to_parent	= fuse_fh_to_parent,
 	.encode_fh	= fuse_encode_fh,
 	.get_parent	= fuse_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static const struct super_operations fuse_super_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
