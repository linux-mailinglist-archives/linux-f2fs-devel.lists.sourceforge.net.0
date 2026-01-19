Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3CD3B0C9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvktedee49wrhfccNgBRxa2vYCPTcor4euN+yFStd2k=; b=LQAZrXWQJW3ySdi67DIT9bNAaz
	jZY+6miKBZJXJUJPzxjL4D4h8hJhnfFEgKE9YkbfdI/uiXDyP0lzbWAruAj1IPikQ/OF1UeyC7tYU
	CkKTVT3kaTwlfxQrXhc0H5XHMcU7MXgKxE/M7CZl+8KjgGz9bTRMM3Uu63rIaEcI9/Wg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7F-0005Kf-71;
	Mon, 19 Jan 2026 16:28:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7D-0005KJ-9o;
 Mon, 19 Jan 2026 16:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBphuM+k5rUsfY8pXRdrXBBG+auSp5TPclN3VGfMpMw=; b=A4tcU+Jl28XXdpr4J2ZfIBIC56
 l93mGLkvmRoBCaUnO6+SJLRA0DdwNOc2YaeB0VIFXH4gtZ3RuK7QrHsxx31YI1JJgpFSay3zKaFsf
 Ci0fzJr9PEsFsooNeS/qXEK7/oPojqnSBLMw8eVH5r5D4eMuqCg2+2TTwbpULtdsw8/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBphuM+k5rUsfY8pXRdrXBBG+auSp5TPclN3VGfMpMw=; b=hT0VPsMTPDUXBV50Zo5J/68y2N
 QXN2vWG5fJqr7byZaDgXYEF9BfCJcbAozQ5ol864SG2cZRpUoHfi0VGLqsBbVrDwIDhv5SDgzv3zf
 dO5bnegafQ4GRGCkOwI5yIFBZuLKTdWjND/0IfodAWdbETHoeK1b9pHBFJA6XOrCYjNY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7C-0007p0-Lo; Mon, 19 Jan 2026 16:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA31C6015F;
 Mon, 19 Jan 2026 16:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC61C116C6;
 Mon, 19 Jan 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840104;
 bh=x2khPUUCfCV6ZHITK1kpgcwN39t2U+Jx7hzhd06hCuU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NJKjaF8o2BvQf0lZo3JR5j8yKQWUqbZaVMaucg0C2gAY7K613riepptLGYNGkjS5B
 LW1AiCj8azKp5kKcfysLFFkKHO036/KjYmTimnvt40NtB2a6GLrAx3+Jntr1TP5P5F
 MDzaqdPTdSpMulnzOIN9JyqH5T/xodDX1QSS+ItEd/mnwf+DMO5ERX0odk5EVZWTiF
 m7G3rt08Hg7HgPZDSuqwG7w1v91ex1fNu9EHbC7dhc5Wn8hE19ATEpvra+Pl3Nsykk
 Zb0la5tlztNcL7LlQQx+i3zLc50jGfipuklNdgVLg+ANoGPjsTH3MOa8nnQroHJOak
 EmL7aV9aoTdcg==
Date: Mon, 19 Jan 2026 11:26:26 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-9-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=x2khPUUCfCV6ZHITK1kpgcwN39t2U+Jx7hzhd06hCuU=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbP/9gZQV2DEc3YZ56hrcGZmfoDaIAhNhl8
 71GFh2V4kiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 Fcz7EAC3hszuWhkIWgvqtaP7NMpfIAj4jYdz8JhqYJHCVh1jzoSx8uhtsLlz4U8StET9O2eo5QK
 6MUGG5HqfNER6iLS5bgRkjG2wDjX8E9iopPSx43wvER0Vkjgq1U8jBg2RzFYANb+9PjMsYmpiWb
 YutyhYiK4by/a8827D+ieAR0CuGxGHBirD+Dl+CLFunH8qtmyJ8d77FX1nTSt+klSc3oBcDXKjR
 TRgPy3m8aIZM4/I6lUMfZt5JHOlbTRz8odScA9LNItp+gtQGMpbSLvNJEUdeoT11kESD9/Y208A
 rF71Oan1XbCh6q5s55NXTzBtazswwEfEXh/8hPTfcO8dJy6l8Aud8vEZKw+QKAmuYX5i8tdF2tM
 kd3GQlDlMeJYcWI4zneadkxvBu3gYPsWGm4fh4HrC6rvP4zqbILG+yYKE1QsXaeqex1BGmTOlCy
 RtGWqZkQAjB2hrrQJWzZL5fGhELvmxcrTBzfucyMLCSu343EsfyuubtnISeEcFvdu5JJfiaFKbZ
 jWcfxHqkXjfiD/GaZ5U8UJBPdPcbFa9yEpm17SCHbm/7rEbaooK/jSO6FmTB4edy9zYyi2ERZyd
 5ifYN2ou0miM92U7fBoOt5pE1/cBzxuvwcIB3IVbfwrzbVr1BVGnX40AA0P2jOAylEtUN5FRTY3
 na81VuEcE6bQ0cQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ceph export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by:
 Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com> Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/ceph/export.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs7C-0007p0-Lo
Subject: [f2fs-dev] [PATCH v2 09/31] ceph: add EXPORT_OP_STABLE_HANDLES flag
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
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to ceph export operations to indicate
that this filesystem can be exported via NFS.

Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ceph/export.c b/fs/ceph/export.c
index b2f2af1046791d8423c91b79556bde384a2fe627..10104d20f736a8092ed847ecb27030be286c0ede 100644
--- a/fs/ceph/export.c
+++ b/fs/ceph/export.c
@@ -615,4 +615,5 @@ const struct export_operations ceph_export_ops = {
 	.fh_to_parent = ceph_fh_to_parent,
 	.get_parent = ceph_get_parent,
 	.get_name = ceph_get_name,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
