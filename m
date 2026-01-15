Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B189D26D94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3wS0/MBs2aX/08Y68JBKLraMuB/gK0HA4XWFvodNfM=; b=YMhsO3w//yM9WXliu1yUm/s9rJ
	HmUycE8/TEyYQOiCFay1p3tioyw03FfAhPRbO2sA0BsrMTqhE+UNnqhKEqh7dYjcfpIvTTXmUd1OY
	4UbTshhALwAYd39RyD8v81wthU2QYMs/FG740disfA9zBRdZxaz6+z0G1Jf0evbjoTFg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRVD-0001x4-8C;
	Thu, 15 Jan 2026 17:51:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRVA-0001uU-0L;
 Thu, 15 Jan 2026 17:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQr/NA267cZ3g24Kg8aAk7oc7aW4N/K+I8syFSJ/ypY=; b=VAJ2cJxa9rWtEpv1HgR64y7twq
 JUwFCsxnAHTojgoaC/4RBxECFW0FdJPFVjfb0O9K9B2q1J+64UDiPOVa931Uyn65DeITnHKTpcq9e
 8VPuOJ9D0z89P/7evLnTQLPwbuNHwOouPqw3qvMEfU5v0ndlrk4A15i4a5lUPTL0Sl0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sQr/NA267cZ3g24Kg8aAk7oc7aW4N/K+I8syFSJ/ypY=; b=VqE44jlUQVb2DZpFdIgbueMrDc
 yDgBA8OL3zMqT+aBcpyKh77MoZbfZadqQ6MPNjjdjT2vWtg3GwXp3zljnnAtecIAXyYEaUBok1gQA
 v+A6yqFxmv+tnQh22Z8SX/ovc+Cg+AsDoxLykmjI9ps+2ZZnYAHRkavVDPcoJb1avrII=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRV8-0007xZ-6d; Thu, 15 Jan 2026 17:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D38AD43CF9;
 Thu, 15 Jan 2026 17:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F23C116D0;
 Thu, 15 Jan 2026 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499467;
 bh=htvmJ8h5f0pVu8ImvWNw/JEkkap4HdmaXUH9XULOP2k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dneG3VhUX0Ru23kykpC7XajwKkRKVHqAceMX7jvLNqTRePFNaBuM4ayubTkUvny9N
 P6EMimUbmvqOqRKadRkQ6T7qroO5u9MrJ+DI/HjwjvI04e2SMcpBqTgzoBJXVzCVj8
 R5V2wa7+oi6y8sxhLKnZsOoY4DX784WY7uMLk4lb4Vc6Kd/4OLd2SC3Kzlq8kw4pdj
 8cARkudpqQaRPHHhqvPOw9xFFGDEn4QLQufxN7dtMK+XuU9P8Un4FgC8HH/KwF/e2C
 moyzLlfSM3DumjxHD5fSrAeTyGV8QjhVSQG+YNhDelzpN0HchBhm/5dLFgin2CwyUD
 uo+ijlmJDN9PQ==
Date: Thu, 15 Jan 2026 12:47:59 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-28-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=htvmJ8h5f0pVu8ImvWNw/JEkkap4HdmaXUH9XULOP2k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL3pTOMCAQjYksxun5CypfXLq0xcfQ0yLyW
 65BR+drKTWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 FUFkD/96PWmPhmWuooqOKgSLg+pqHnRgUaL7/ZNDUsAhBKEADaxTrSuVXnu5y06MU9W3lXn3Jki
 tJG1xqeTtwFPfjupnxuGii5/cJK3grEucHSsaObz/C/IPgm2RajqPlObTc5yWQzLajH/ZdsmKuz
 iaN++m5BA2rgnLkFTWSjYb/rOq4ox7mbDacV7EnxfZLef3pg4hlNbFjixmHWZq1YxNtv1GM1PKB
 bYlU5nOry0N5MLT5mJJyhUCXgfMSr69UikdXegrkYuuEal8PA7L2A3UO2DuRcocHdchHdO1mIiI
 aPpzI8SRvE1DQ1wGC2Rr0ZjiolVqjHMERqoPeTbmyNDwFpv+OBpjtjiUYOyD3M4aW7gTYR0+cKV
 E++nhLNIBtBmmCSujF5Gfgbm5rpaJOjnUYkeEDI8zW8AKDwmT4OztE+PvBlPE9xUsIp1A3S5Xdo
 envgJF0kLa1c3oxdciypY/zYLzOtZCb6nL3ixs/MEvwxq9rGiFPOjLC7ctPUSdQni2by6qtQPGL
 w2gOWH1cGO52N67mW9gfCQswe2gXtfZ4GWZLWj9tnHRqmUbdUXBRIFYxRZRcu5CTuplDEOB8K2P
 SNqUouDQZv8sR9URZ+uLTShPnRPM48oApHkWHBLVd0u7cElK7NOCQVx+XgJcY4pkTTaS8REV/+m
 9YQ7wwUNgBGz9iA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to f2fs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/f2fs/super.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRV8-0007xZ-6d
Subject: [f2fs-dev] [PATCH 28/29] f2fs: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to f2fs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4701f009dec4338f2eaba1820ea7d..260c26771c431bbb36e99be8daff6cde40662751 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3750,6 +3750,7 @@ static const struct export_operations f2fs_export_ops = {
 	.fh_to_dentry = f2fs_fh_to_dentry,
 	.fh_to_parent = f2fs_fh_to_parent,
 	.get_parent = f2fs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 loff_t max_file_blocks(struct inode *inode)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
