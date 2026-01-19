Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A8D3B105
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IILeYvc0q8w1XBXkcsl6tVRD+UD+o2hW492vmY9j2h4=; b=OQNJ7P5IyM1tcxOw8as3M6VUjV
	efMifAxMmNfx0Hxp7LRb8ugk8zGYTR4649yZkyMhKpRWz/nAd5HG1xwBLc1GOq8Q04lQIFwbbojHM
	x0r27B94Zfy+Nec9rwTTACqhR/t1HorloQTlTBs29v5OVf41YEGWol1CAcsFIw5ww738=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs9Q-0006eZ-Da;
	Mon, 19 Jan 2026 16:30:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs9P-0006eE-7p;
 Mon, 19 Jan 2026 16:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehBSJ++W2cPkB0J1WK/qzYleqmCU+xmhuZ52acFYXD4=; b=CV7V+2HxcH8gOHrjs6Gj0jnnWU
 ARfgRFEEBaEEyNerU+IUTzmbNS6gUchud1lTffikvtjqY69CHYEfbRX2fQlBuPYB8GDCecIwU3Ded
 VPiGl2lxczckN6JekVxsxZ5s6YtaBwft9Ie/g9gg/WvxhdqstN7F2tK1WW8znycPAWvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ehBSJ++W2cPkB0J1WK/qzYleqmCU+xmhuZ52acFYXD4=; b=RpyfViPZ09/47nSpBqBhysvt4l
 lXDlld8lJyyQush3xcOwqTNTVyyGqJQr/8IVf31AMjVOhhyfsx+9JHIAB0aHatJ+6GU+POG6Ms0Js
 KrvV4P0DjJ73ZZ7IuESnh2v8pfAW5boJep0fDR6k2ix4Afa5qW35RNohsUgMFFEXci5c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs9A-00088V-Bo; Mon, 19 Jan 2026 16:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0479143394;
 Mon, 19 Jan 2026 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD2BC19423;
 Mon, 19 Jan 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840226;
 bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Z5mgImMYuu+vDaC5OsfyoFU4eAFJAkeUyQjSB6CRWktgD4KibfHiZ5CUg7Ays48l9
 EjX1kGAqQQ+zZZ+UE7TUs/w3PWzjdeI3SjHaQUfxMbdJQjJNZGwYgqnowTGdH9AvHx
 HdNKl9RxTyhrRJRxujGvwNkZ/Ifho0GuYndVwdirg+j36y+QMn0GE/ZUUpUPsm/s53
 6Q3Rt2Tm7RurcqvI08fLVS7BsOgFE8BKgiHmQBA4X/eT+4hE4wfXAxn5WbcVQwMCyX
 vSUrwRUb76V4rU/VmlnCa1I+cPShEEdWszkToxnNVTYZmhAyoHZLsmqagjwkUUQ9IL
 vBJ2dSWQ0auqQ==
Date: Mon, 19 Jan 2026 11:26:43 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-26-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltfAB1NrPj6vyLXaIZcARRV83kUQ0X6tnkqr
 rSH7KQc5nWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXwAKCRAADmhBGVaC
 Fc8YD/0T6/loL/0QUUXJpbqWAX29+wqZxsSH2ChHCMfmatnCljrw6rJW3ydd07PbCixgYxwa7dH
 zSI0UF2LvqlhJ4mr0JxiBXQN7XS8u4Lo+ji3M/Bdy7P9S2bcTQ01P8NbN7pWDALsXrOr4UwH/O5
 eIGCDRIvfIgg/JtilUi5Xw9J+WnBRW2/K6XL++bUEq7yaQpKuM3ExrBRnr/pLhRRW8KEbhOaXjk
 niizneAenTAevWvDRARxsjp4DCTlaVlWjnR5NKvqzsWbG8yNALPj3vH3g7tXi/JMieDIoovTugr
 zXQbQCushHy74btLy45zEvS0yxgoctX+LagcmgmtXgvYi7tksxbpXuTkNIpjTVPubcoN1wK5lVG
 0f4yqTtexJUdRyM6ZQSxbaCuvTulJy9+m/X0PvdfOBbH60lbjJfdkrY0CPVfwbzPiGqA7MzVo5u
 1is7wiL/+kvOlN4wDqKpE5hDJGZ7rlEOp+CAjjGKBYuWUsfMEcZ2aNC7ux1WmiW9qSjYbit4/Ua
 qnexquVoCAxIWVeOuXSEcbt+cpR3DW+9+uBYKgAINDiLSKyVAZvtG0z4IyOHVSCZ8BqpFOD1OEd
 pYVBEwtKLQpy/jKqBhtFB4GzhRaWAE8rKVayjBX06AYj+r+wYbEdOiHXCjjVbuo0EaMrsZrTArA
 /DiBfK7BTM2dyIg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to gfs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/gfs2/export.c | 1 + 1 file changed,
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
X-Headers-End: 1vhs9A-00088V-Bo
Subject: [f2fs-dev] [PATCH v2 26/31] gfs2: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to gfs2 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index 3334c394ce9cbe26969809874a94e79bf068b11b..43fd2203b34fb0894d2b71e50278e5cd68216ce7 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -190,5 +190,6 @@ const struct export_operations gfs2_export_ops = {
 	.fh_to_parent = gfs2_fh_to_parent,
 	.get_name = gfs2_get_name,
 	.get_parent = gfs2_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
