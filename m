Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96643D3B0F4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy0c5kZmw51GY+PlhU9p1ZJlEFau3EWNeGoIBuVPrVk=; b=ZErQe6AeV5MULrJss+eQsH8NBo
	VtGeLWQjIa1M93uCLjPFkCwBlEnQpyMIBoBnhEeRSeqplLZTGvwQVGS2sooCvP2pfVPcQYEaiGWhN
	NFJsS4CDAPAm5J5PgUHh3A2QAv/XLuv1hr/jolhdriA4a2IiKK0N47eKqa52jwcAxJnY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8s-0005Ia-G3;
	Mon, 19 Jan 2026 16:30:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8p-0005HJ-7w;
 Mon, 19 Jan 2026 16:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hnkHhj6VpugZZG6VDwQVVf1Gx3N8PdGnaR3BX2i7Ek=; b=VP5VS61ndY9wMGBO9mXOILQjBm
 wIfQFlkfiQLtV5SiF1gfLe5DgDFylEFZXLbKSYChtBX2bqcrHiuvgJ8HRWREoSbCWe1FWJPbbx5SB
 TfmltwPZmK0rGlZugS/qj/DUnbr5hI9ZeGzn4tKN6wRSK9SlUEo94RcM9LsgdZtDsOwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4hnkHhj6VpugZZG6VDwQVVf1Gx3N8PdGnaR3BX2i7Ek=; b=Mp25iNrHm5+BMW//ePe341z6Ug
 wo1N6XRpfWL4eGKyXmkHhH+LosaZeUXts+oFZJO7fqf/Ar8nPDHV52uCZNRZ0YvdJ9P/6zChT0YWT
 X+PBo9rdHovUIMnhzjgjRyM6kJE7trIjGfj3YUqMxQcS02HcxZeNrSb63ziY3g2USUY4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8o-00084Z-T5; Mon, 19 Jan 2026 16:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 894E643394;
 Mon, 19 Jan 2026 16:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655B2C19424;
 Mon, 19 Jan 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840205;
 bh=vQTd4Jo5nWm0BtlMXBC/zeTqN+exhfZBAyMeslzDnKc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AWFPBI+DGZ6l+36k9cUcFG0hNFFKJ0WMx66O5cEYb4l62RB3MHZqQrMyu+l8KoFc1
 TGdwQ1vZg0M8ySuA4DCPjGa2HYdhlWYqJglFLc8XmqEPvUHdJxxXLwvvLRoWe8vbm6
 0aPh3Sk1rMoZ6/5Omzvw5StQLtIn16fGFg9VDhx/A2qqLLjS4Nqm5rKYDXgHs8gK0A
 ok7XQ/JY5MkIHVzgoTLqIWhH1U/zaKEFZ2BnohVbeU/Hd0P7u/5wSiCw35RX4erZMO
 zxVhM5nZ8z9dtS9jXJmWWwdhg+pY0UAUbzMiE5GZfJeJOnjoq3NzGXfuvGSE4FaPk9
 OHv1hYqPynnMg==
Date: Mon, 19 Jan 2026 11:26:40 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-23-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vQTd4Jo5nWm0BtlMXBC/zeTqN+exhfZBAyMeslzDnKc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpblteCXSwo2a+8YGLaQolNYDg9J+5h600R9sGY
 lTKG5OkIWmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXgAKCRAADmhBGVaC
 FQ4+EACdlT3kWBo+HI6ruDanrebZFrOPBF8E+b+dbln0HfDwLb6pNFCgmgym+bnP/ZirP+ltIqG
 uJNypDGY1ttctOOFStuOce/RWd3J82M2fSTS4KTePxme9FxgWvfzlPqz43ArAM+CIkWGVgeaGKd
 mHaIKzNzUqg1BfEV3B9neORWkEe7FLYHuRjtd1leg8qBCG7g/NAJnxTEf6IhLFb6zUVI8WbEwXf
 SWw8IxyniAcvvpWPhkQEFgLr0JwYPezris3doWzeAyaa2RJuQcnk/HoA9+0NKyT3hW8nQyO4Fe+
 s5DfgIZe23cBvNTYaSp0xBbkqXcHoOX9oowmU7Y8Ke2Qk/sO3PNoy1GWQUlU7U1JMGB+Rh/80vl
 gzuUVkFpOWWFtTFkUayRdJta8LzXqmKzllI5a6Pi0c73/LLUxESAQFBh6barp4IuMUnmulh/03j
 NejtTplGwWPkizI1bVDryTcbMGjt1rPCpyN7gteUKA9FYFCci2pCBozoV8YVMbcgu8bMO0xSBj3
 g8cdqKbuYMp4kjSkuCkG/rs45okw8w7j/eQ/cStRAbHsUL9+mbf3ALihR7DcksQu0or91YqhDru
 hbkk9t9wwE/tcAokrVSpplMMM9ODfSLZ4IZwKUeWEpvMoVv3um/271BHFxRjaAyh2iKbaAlStLk
 7XhpMkBicI0ylbA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to jfs export
 operations
 to indicate that this filesystem can be exported via NFS. Acked-by: Dave
 Kleikamp <dave.kleikamp@oracle.com> Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/jfs/super.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs8o-00084Z-T5
Subject: [f2fs-dev] [PATCH v2 23/31] jfs: add EXPORT_OP_STABLE_HANDLES flag
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
 Dave Kleikamp <dave.kleikamp@oracle.com>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to jfs export operations to indicate
that this filesystem can be exported via NFS.

Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 3cfb86c5a36e8f0c46a2734a24fba6ffd36c7ad9..ac9b6d754f8c203baa7e91362aeb0dc9b3ce209f 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -864,6 +864,7 @@ static const struct export_operations jfs_export_operations = {
 	.fh_to_dentry	= jfs_fh_to_dentry,
 	.fh_to_parent	= jfs_fh_to_parent,
 	.get_parent	= jfs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static void jfs_init_options(struct fs_context *fc, struct jfs_context *ctx)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
