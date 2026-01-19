Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B3D3B0B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYLWC6bwQWXX1+BwJna+SmUzbBIoRJkZXSZRe43/an4=; b=lrToZ09QjBKXBubv35bYuCfy4S
	BQ+BRJ22JGyP0ayWcEHrT4CorJhybL3OI4Gpq8Sm8RQf3pJFi5AIeEQFf0b5AFPp7v0ZSTF1f0jqf
	K2H/H0cVS4eOEjGKP5XKXBn/CnW9P7BIQNPB4Gsxs35Z5jCYXujTulO+SsjyALQh87v8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6e-0006PG-3a;
	Mon, 19 Jan 2026 16:27:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6c-0006Oq-PW;
 Mon, 19 Jan 2026 16:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NdUVfYLWR8cpz4FK1LdEeOsfAM8FP/V1NlpNec3IH6Q=; b=eebOHomJzBvpdMCGMPqRjsORyN
 C3hPN6UuHAvy9MMo4uS/HrdwQsk2D0wC6fCEiebWpkGCscU0PbLdQ3TiIhk27wkGI5L3MtYOeIcrv
 FgVH5REZ/tEHcu2K5cVziusbUh3O40ITpRXi6sS2uDFhO1BdMsFl+jLPa64/NIHwZRiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NdUVfYLWR8cpz4FK1LdEeOsfAM8FP/V1NlpNec3IH6Q=; b=i8QedS8YFqeA5k5SK2HU5M1YzY
 UOZO1Wm5fBMZ4cvjZL2m1jTFBAAu0KlWl8lqWWAWpFP/umG8kOIgQMaXJCk/zPsqkh2u3JmOiIHF7
 l5DAW2E7Owwfq3eqDdhFTaYTEN+oP7/+ZRpojBDrHzKS91TkaMOkaCYakyNQAUVTth6o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6c-0007ms-Bd; Mon, 19 Jan 2026 16:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 07097429E5;
 Mon, 19 Jan 2026 16:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13C1C2BC86;
 Mon, 19 Jan 2026 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840068;
 bh=AjWutM65jGFPUYxo72jA+Ij0HC7LS8R/VDQO98k+B+U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eSVUryJiGgJALG2ypJ4Yjr568W28w/8A+eXZrbsI4+hMfQOAzJdZQRV9oe+T3lPi5
 4mMm87GheTCUUW69mQQVVSKcxiZ4TOh5VdvYEjNSP49v96zd3u2tkg8lkt9b8MPF60
 AVhGJPZm0T5VDPMCYbVqD1onR6BQ2XhtS7tCp6xAW8IKiFKx/n7v6WobsF/eTJtxjA
 Nd2qg/+nfdwpq+DqIytb+gszW5PETsTfZ44XEt0Fp/CAMv8hCj9bv2Z1ZnVwuMRGLt
 B+ukQbLNhB9K9qN6/51qLpBXKria1HuayrhCMAS5caVGwiDxOhazJhCpK9AMP+L1Zt
 /GayDKKSdC88Q==
Date: Mon, 19 Jan 2026 11:26:21 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-4-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=AjWutM65jGFPUYxo72jA+Ij0HC7LS8R/VDQO98k+B+U=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltaIQXQCdDNYtxGH3/N2irOpG4/iK5HsTT1Z
 4iHLiLUl8KJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWgAKCRAADmhBGVaC
 FbcrEACGpRl8GOPGkb17ykMrM5G/nRGznE7ZxuOH6ewcr6iKf0fOYadqPEBuyp34Xv2zArXNlNf
 459udNfZ2Blhwbz6pQWEwgTtXq3CYdske/+FYkdg++6FgJPzN7mBg76oRaCGCiL+xi4Q6Z+AaZD
 3K4u+njqrYntZw9j30opGiylxImbwjObkXvc/ZNM6L8pLOmEiGGT+ZEis4o1k97QZs3l8XOCmG6
 k+n+j7uS/3v/pHy3SWNTYBWq7OXzS4vn5YGu8nwBXymjuNdX/CijVLY2oV6Pgib5WS46Qvm6WqI
 OwvgpfxqmTcbN15+7Ypr7ATodGgOgeuroQo2DzlZ0JnZ4CVuSGBm6hkp7jnpGmq2q3Hs5TEREaI
 LA4cuyj0BVpV8rDNZAu1OKN+Vi4Ews3TcD5lIl/ZVyu69jsyh4ksqHFfhWmfkx37TnOivChumlO
 1DDGI4PZloQEDOExjfTtn+1xTF5ZPFgLMR69FJyDpexvcN+5uYEO277e+vMFfH9gDhJysYzFjOy
 jCxWdSNLbBll9mFbb3tbLoSV8e/ikoUzSk+vUn+ePpr6l/kwW9EC7NOdrEwECBcRqxpIjioa/Ea
 At0n0Ja2iF2ptFS/RPVXB5xcfDnEZveIInEcsypAva4ckDFGPFoT8TsrJLLrJsPvagzaaa4HHWK
 KsSCkMjtEOBxyZg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ext4 export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Acked-by: Theodore Ts'o <tytso@mit.edu> Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ext4/super.c | 1 + 1 file changed,
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
X-Headers-End: 1vhs6c-0007ms-Bd
Subject: [f2fs-dev] [PATCH v2 04/31] ext4: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to ext4 export operations to indicate
that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Theodore Ts'o <tytso@mit.edu>
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
