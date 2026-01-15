Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4CD26D8E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4pBewHN7c+uVUyACZxv93GIoAKnMmVeKEDu5CjTZ68=; b=FwvRm8RmGP4bm17XZreaoPDueG
	2LabYoDaIp4g8mTh3psrl0Qkrk4XXtZNt5LDQjFUW3esElnPn20FeRercHiYD7ZDV8x++oTJoWcHU
	tE19UUftygw5yM+1hjPApfqiV3jkJDuek7JAew01DsP+YWl9bHOfZ8YWqt+k1l4caSfI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRVB-0001vF-4j;
	Thu, 15 Jan 2026 17:51:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUx-0001sm-87;
 Thu, 15 Jan 2026 17:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CeTtLAo0l1hEDPc9wFcr98gFU2TUKuU91rfiKP4k4aM=; b=DXtcoafxVVhBXQx9/R2J6S6dyN
 5pZ+W4j+QRk4KMTXIhHEAOFH1qEOa+UTRiE6YcmJ8Ck8ZSHOnLz9vlBpk16mhrx1DeDuA4+ReZpaP
 0RSEVW+6GlA651ieK0SDehb+lkOYK0DQTffAc1YRQyzI1R/yGjn8vM+3Zy94ezInKW7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CeTtLAo0l1hEDPc9wFcr98gFU2TUKuU91rfiKP4k4aM=; b=Ztv6AKagaEluZtTvf3zTNs4+s+
 0JIHKwS59Ca7I5nvFir0MME11itCqkmQs/Gd3DyLOaHBCUwNQ5CWSLrxanGaBl8VvONy+83ljRqX3
 dcryx6oo96gaTAoRYiQaHlq7BAcZeUJ8MxKCPUvxkkj73m+GsQrOkRgp5OX434ISF2a8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUv-0007vY-0p; Thu, 15 Jan 2026 17:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6235403BD;
 Thu, 15 Jan 2026 17:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088E6C16AAE;
 Thu, 15 Jan 2026 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499454;
 bh=B3iB8PdtmJXVVjQl2iu1kT0lUCYC1JH1znDIT/qACXY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SEhj0jPg2LUbe6QdHiGaIMEcuXoET7yHO1nhDGM0eDszM0SkzMGpCOh4tVBq0wYyL
 +R5LwCPJYRhA7AK+gW9/IbFUgM08yvctd7ijqfNZ8mQJaevD1wNAREr4FmZNj5n8xf
 GOV5UKGAyGz6u8AbcPgrO7zJ66fc6qmzlj5cvbY15wa96qI/BbwvUh3PKlSbQh5uSX
 CNNtI5BNm5gIP5lr/r+jxSQe6GCtwSrgG1o9W80MyO7XwXb0PCpDUV01pQuwqEtIlD
 rYn5vWgythfAwpUx9EH2EXuifp6whNQDS6ojHLe4tCfa3mdIv5wzqNOWWc7rfo6Wqi
 uqezwqjpSq/yQ==
Date: Thu, 15 Jan 2026 12:47:57 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
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
 Jaegeuk Kim <jaegeuk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=B3iB8PdtmJXVVjQl2iu1kT0lUCYC1JH1znDIT/qACXY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShKjlDTIgJ1oIUxVMm6eLiW1LORyjHFx57KE
 4mWRFnefO2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSgAKCRAADmhBGVaC
 FdvZD/96keRaeqAV/wN3y9Y3bEH/SWZiHa7J2LGHoRLFPk7NkJXw6qUjQ+fQke+zYjm5T8ipf0/
 j6OallhpMjyf76MSGKNtwDM12QPde6749iLhlkzuuiNUiBKcUPf1LB88v2dcrFx7PIrj+UVP27N
 sUNHGdsfD8Mo8NhMj4P4Ur5nrA/R31o39qaYZiHwZ+uv1oMfSYug1mGG5w/HaKvuZzyQWfmlJ00
 QzVRyhynYHefKf3BpO82gyCZ8I7cIIVYrTPM+kxTn9dYmIAJ5l2RY47dTWAWdeWutD0LjZ+crAp
 lDqJc7FuApQgNY2lTf6syc5cEOBAGZbTHhjuGcrfd94N+YvlpW2gHzNaHL+U6NzjA0SYlVgXdJt
 mA6emOY0KnTMNYYPWB58iMZtclcVe1bLiT6ebciSo6h9JK+QgrDInMpWTCaukHrjrXOu9ee1acQ
 OcyyLL7ZWDCXYd1zZMBqsv3sYlWJ9VMlyaJxIn9z3wl2dGnIBe+hW1AJpSRJvtKewKQkAMn7zWQ
 tmM4xAj+ZaBtdPGgPttvVBKKtnwxo/15PysDrxEm8RCLyrPCmV2/T8kMQeUgznoKgFjlS25W4/E
 eJvv4uMPQ/7FIHHyKEG2s54VKAbN9dDeqzkpIfBnZL8eiE9e3xOAUhS5xyNkgdFmxAgqVhQO61T
 Tc9M7AyQCooZV1A==
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
 Jeff Layton <jlayton@kernel.org> --- fs/fuse/inode.c | 2 ++ 1 file changed,
 2 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRUv-0007vY-0p
Subject: [f2fs-dev] [PATCH 26/29] fuse: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
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
Cc: jfs-discussion@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fuse/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 819e50d666224a6201cfc7f450e0bd37bfe32810..1652a98db639fd75e8201b681a29c68b4eab093c 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1208,6 +1208,7 @@ static struct dentry *fuse_get_parent(struct dentry *child)
 /* only for fid encoding; no support for file handle */
 static const struct export_operations fuse_export_fid_operations = {
 	.encode_fh	= fuse_encode_fh,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static const struct export_operations fuse_export_operations = {
@@ -1215,6 +1216,7 @@ static const struct export_operations fuse_export_operations = {
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
