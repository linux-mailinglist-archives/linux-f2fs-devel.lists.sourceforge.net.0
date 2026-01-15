Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7765D26BFD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3z3Q2MX0AtbG9zRNpuRqOmO0vHp9GuN7mvlCjnoGkg=; b=Nh+UrzLxecybfEautm2QKSdXyD
	KaoP6rD4+rQgxB46kM6o1FOoqFoIaEXSiwwJfrcAmFQZMNKcy7Wzd4fWXyZGpNExrydBwSP8mSgPo
	gFf5VNAZ+Hz+8lBGc7OJzcFEhfCy7m5J2PGy7Bw32gYKImZnf7NArMkvXUN9liFAM9SI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRSe-0001XK-Ic;
	Thu, 15 Jan 2026 17:48:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRSb-0001WY-VN;
 Thu, 15 Jan 2026 17:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zt0OOY8HyG5hoN0E0x8SeNq+jwTJvLea9QHt4A47vpU=; b=Erdc6nraQtn3Z3aR7INrpOZWPE
 yWgvgQ3Z1fbrVscnzYIUfDSS7t0Ez1deER8rh5fw1bjke9vj/9ajLYh0lupbpqn5W/JV6KuO3CO9D
 /0SK+JwvK3dfyvop7f5l11tYjDiBH4itYAbt230/SeUV404hDICmlV1bqeTawMuTQ7yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zt0OOY8HyG5hoN0E0x8SeNq+jwTJvLea9QHt4A47vpU=; b=jYVZusYjrvzGqKG83UD0uWBvp5
 5xcJpe6OtLdx0UHysG7riMnJwoUaPEsM018Z8n4Gwj9m/YThrAhLbnke/p2/uSBhgRkiY8k9W9fXI
 +k8I2+Aqi+SZ2DaPOXiGR14M6mTc78iqXcnK7Q64fJto031UhXyEhhmPT+TWe+W/XRrk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRSS-0007di-LR; Thu, 15 Jan 2026 17:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DFF143C8A;
 Thu, 15 Jan 2026 17:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F22C2BCB2;
 Thu, 15 Jan 2026 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499302;
 bh=cRlpRhg6xvxKE1542vTz8cBp9dDE4OGqd+9j2b595OM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fu31I0C1mcdk48lMcGV6EtvSTJtTvS7viT/oyZx3ky95KhA1IgSibc8Tcjmzk5uog
 JhOfSN0w8eh5Z08O9hxA03062iTTRyFy4/ENNq/6sLAeHiEPsDHmsbAIgQEI0IjWpV
 T/St+kEHBMhdyyRL/SqavuasePDHiTIF3g2iGd/j+IqyY/GUdWdAZidh6pKv4L+QqD
 OMgBs/gdxX2ELQ7SDfAgshPh0CFXbDJQc4/Tduuex3ApWZoagP4zA/NahKjB8yVq/x
 z2ul5X5032MbJsxbTe9zc46WwFLwjcxopwaev5EqdvJLAaXHPOxDwVojVBE/xr7G9f
 0k+rR/8yf65yA==
Date: Thu, 15 Jan 2026 12:47:34 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-3-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=cRlpRhg6xvxKE1542vTz8cBp9dDE4OGqd+9j2b595OM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShEgnrZ5MvNZeLKEb4VrTRZtcLcYgm2Rrva6
 3/6K7cxfryJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRAAKCRAADmhBGVaC
 FVmlD/9gn1qIb6YReb8Ce9KEi8lP9mKlXfsYUelY1yljVioBDtrsj6dPS9mWtSjm8Uo0e8RBQUw
 3u+AYBYfiZztHHSK5RCTNlUjYWpIOmHSfhaFA+4R6tA1I1k+wi7KMOlFd56rQZv6qHSt1ux4hQV
 fOQZ4dgdIp+5Y02KZSKXCJO8T49s7NnWaTpmoqrRPKxAITVwK8tY4j+dYksoEjkWEYlmEseo48A
 hdWLdh0SSUK/KUBfEg7RBnvNnLiGIhzgdB4vbIZuQnGL7grlU1sE3BKU17GNyLtiCggOZi+ZybD
 Fw9/2DcXJRON+wjA49hKtjHtEfKG1Y8qAaH3idaqGpnoC8r+m4b79j8mE0sXsSd27plq8MRIOuF
 pMlERSHj1ExH6xOwzd6jpuVJkfOxWw/bBUNDlNsX+gw041SuiwHaGaMSyESM09G/84gr2guNJkB
 7aVdZndIARxy14e/XPziyJG0nJ2et7ls7dVfhAkrcFjxtqtS1qBZDCH+O5EojKDDoQkHXF/56fA
 kYYYvjqZCke8Jga71v8k+MdprNGd0kb9Cc+lhK3Jw+k7EbYR3AhygOt0L4FjWbOKZNYmJIxuENm
 J7q3k6kEC1/G0mhmtZHabQpfhJkZJRdW6fzCMS5Q4y3EE9WnfYwtVOrERWZLvlhEohG7qjkztgp
 GZ0EXfbh6QvTyTA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ext4 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ext4/super.c | 1 + 1 file changed,
 1 insertion(+) 
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
X-Headers-End: 1vgRSS-0007di-LR
Subject: [f2fs-dev] [PATCH 03/29] ext4: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to ext4 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext4/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 87205660c5d026c3a73a64788757c288a03eaa5f..09b4c4bb8e559da087ec957de3115e4f7d450923 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1651,6 +1651,7 @@ static const struct export_operations ext4_export_ops = {
 	.fh_to_parent = ext4_fh_to_parent,
 	.get_parent = ext4_get_parent,
 	.commit_metadata = ext4_nfs_commit_metadata,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 enum {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
