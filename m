Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A565CD3B10A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVeYGIKeE8+P57pja8HX4F5aPUJq7msXskzbbmmu38I=; b=CqcxXUsKQZgo2kO+D4R5WBVK0F
	ME1CO5jcyP7Vvvwl+wmveT7YKpPPE5yyJdrT5Cg2aSqjGImMyfSpPL6KMMIMKzbuL6dnUm5BHgQPX
	UJpHomlb5WnmuMjAhnwjaDcy2eh3Qp8eLdTXHMQ64MgeHBbQQB/O0N2I1vfK3pn6eZUs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs9d-0005eJ-6t;
	Mon, 19 Jan 2026 16:31:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs9b-0005dr-5g;
 Mon, 19 Jan 2026 16:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yuTkwBieDaBYfiVvkErhMkdIL4UCbBwNP1dX5h4YmOE=; b=bFH4hRO1VSdPzyWjVpr/tXj6FD
 jCSxhzKa/rEZn+nw7+4JAAaBCxe08AQeg8Rx0+Bvmm6hN9WBcmG09pEbfVsHa1Pk5cXt7iBxmYwbe
 MHb8nBRgi7A52bCjsikLep2AUL5ZKskwDwSqER47nBAMAXOtbw2ubLz4HUcMgrFJz9Ro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yuTkwBieDaBYfiVvkErhMkdIL4UCbBwNP1dX5h4YmOE=; b=C9QwdDGdUw4aoIJI59JZx9odw3
 uAPQmhU28Y0PMfIP2JtUuHQF9nSG4rGdb8mhXMkcpIEh9sB2FDPDPb0naES1neqrS//RV9vDPdiMd
 AcuBK9Wn91Ks57t+fq6vaGD7SOoA3j+HyEsu2GaKsQLaB9U5P7SnjsUVLOn7nEtmobSQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs9P-0008Ar-2S; Mon, 19 Jan 2026 16:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 609BF6014E;
 Mon, 19 Jan 2026 16:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B28C19424;
 Mon, 19 Jan 2026 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840241;
 bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=L1drpzmOZwhS7wO9cwa19VSsy80i40QcyZlAaGZK3Yn+eev1gLy2tMLiqi6zsQpcX
 g/gWqsJHMJQgBaVzW4ZFeciI1NUhgPlNi5wWsbXGgGL4j0Uv4T4IPHTMt37mKkUYzz
 UD4RtogawKHmef7uBWR19MHXmO2cT1auakcTOXeY4PVe27C6i68OoaNwBKad8GnDtD
 d/nyC4L6XNekUDohSQC4guagkxmqlyAdRj+IVSfTfvVlbK4VUGfXBnjpoUTMP39dmf
 w5jxXL9g7wxExeBthoaxz8pkLK5ytzCmZJipo8hAi1qkrPrOUFFDoHfUqo2F6DW1bS
 Cas8WWW1oS0SA==
Date: Mon, 19 Jan 2026 11:26:45 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-28-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltgaseKc8dYHUYRj77eGOmyavKVHMKU3e7sZ
 sLVNVNiAJmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bYAAKCRAADmhBGVaC
 Fe4cD/49CNUs86PH4v3uTOUHN5kkn9aZB4X8mzMOEw4J/AAiuF0Tml48ByLFtTTwHiqIZrKm2Eu
 x/gkwXTZvO40kPoyN5fIytK8K0yVjl09hrx8Rc9gwq0iGOtxQ7hdMwP35a/JbGT22DLjJONXGnk
 nRgl2lnb1Y2E40m4Hg8msm2FFmpQDusi9gIyl7OLVbIF5BHQ6tF+jnJ0DKHKQDN1MihKoHBbsXw
 OoxRSrcERSMtIY3oqeV9rzbmFmCEeOcFIM5XY+s2aMQE7vgt8BQKML+7avl/HqW+PEZHum4ZKu0
 a96hkWCBzhBniSGFHY78LpqWIV/41RMKi+a9ipC7ltAdNP69CN2VynIyliSsXbKcb85Q5RCaI6a
 iKydYxVLdL3c2SRkPqHe+m9LsbpCzRbOkEuP++7a45+g5/TU4Gcr+zfJ2ZCT5EsA8rU8KaXJBV1
 41BZcMEXMUTK98bUgMNZoBDlYca6mxL0Ldrru8nrqHr6JkrwGZrQFA7i+ztcA8+xSNKoUf7j/JX
 BDHFLN3lZrbj4ksk4mEN/6FV2y6MNHt9vS8x425TyotVmlwlsCG1NOtCndEL+VOZM/PenzdlEnf
 lFXckOYEqH6cS10AeacCinqqkjHbooveZGMvtPbqnMOniZUQv+cdXig9LrFKv+06zxNZikuiFlE
 F3LGgWPUpQR7npw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to fat export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/fat/nfs.c | 2 ++ 1 file changed, 2
 insertions(+) 
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
X-Headers-End: 1vhs9P-0008Ar-2S
Subject: [f2fs-dev] [PATCH v2 28/31] fat: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to fat export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/nfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fat/nfs.c b/fs/fat/nfs.c
index 509eea96a457d41f63f04480da32aceae75a8a4a..f6a5c8c4f5e8a14e549b5aad6643d490f1d062b1 100644
--- a/fs/fat/nfs.c
+++ b/fs/fat/nfs.c
@@ -289,6 +289,7 @@ const struct export_operations fat_export_ops = {
 	.fh_to_dentry   = fat_fh_to_dentry,
 	.fh_to_parent   = fat_fh_to_parent,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct export_operations fat_export_ops_nostale = {
@@ -296,4 +297,5 @@ const struct export_operations fat_export_ops_nostale = {
 	.fh_to_dentry   = fat_fh_to_dentry_nostale,
 	.fh_to_parent   = fat_fh_to_parent_nostale,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
