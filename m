Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B929BD3B0B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGStO+PDJXl3thiC8vlVrXuSxApnggBORq/Afh8DKiQ=; b=XAwdZhZeoI1krO+8f22fD0MClN
	w7swjcmxozNZG0qZu9VVvh7yYuO9BfNtjXWHdzNN34hDfy0dGGbR2lxTtLVmBtZM6MHNDerfLXJcO
	afKx61qxXLSyCsyHpdbpCgtWFJAHcMClgatg5zShVkh7ddrwo0BsMuAe6Jo4hpw5QzaA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6Y-0004rM-Mb;
	Mon, 19 Jan 2026 16:27:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6V-0004qc-OA;
 Mon, 19 Jan 2026 16:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2uKyHe9bvtS4rRqV9g+HwXpIhfVuwz+cxuTdSbT39m0=; b=f3Ml+ykNght+YBmK9FLkA0cKHm
 k02jRt4guEChnBfU7eaU7qyxpsVe+TxwyRzNygTNPAFKj+W14BJgVtMB9k6hMmdMUP1pE8QBYeqW3
 VJeTFxcdcD/u9e6lieTIvurz3scHLn2RjI8ph0qQXT8r+CGkEe9ffo7I/vZQOWfIDwcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2uKyHe9bvtS4rRqV9g+HwXpIhfVuwz+cxuTdSbT39m0=; b=ctFXjuYoYswhiKisyohOzP2W5b
 bAZqjHW5QUEpP5ous1GKiHbTEj0Xn+Uqe9BQZ+Qb8f66eBChq0k67Od7RyYyKxWNN8Cms/tOv6uQu
 sRwk4Mb37PHtzkyM9MRJAqrwCuZNqFgAZxkU7vQKiGEZesV394IMtJKfk3+PwbuNxeGA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6V-0007mV-6m; Mon, 19 Jan 2026 16:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D3F3D444E6;
 Mon, 19 Jan 2026 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DEDC116C6;
 Mon, 19 Jan 2026 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840061;
 bh=0HPdHuxiDqTtA0YywSuVWS43ZS3BgDMq+Pvu7w00t7Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fhdBn2dBdU8qsd9fov0W3cRwBs6xrhJwrMmju42vZTu0LzeOcag5Mdd3r7MGvyvhc
 YG1QDMIXTVtBeBMOaWEDZkVVxwZu+EAfat7NXseb7Li2I0zzhNkCQy7u7LTQqy4eQ0
 yFx3dacO6OxpJ+t20CfGLKs+fb+h+fjlnywsgqy1yVtebczKM3mdOFE/4kZavk2Q+r
 UnXmGW0DAKOqCQ10ZePYNiGtJT1Pxx1s5rOAc4Z7h8dPo4CkiHrhax+111awiCI+n2
 vSLb86fZMTxXENHYCelmDQ1/Gd/cB5QhTtutKl6phJthJ67CysXayb7i1Qe9n7+pWC
 oI/oX14JZ9AWg==
Date: Mon, 19 Jan 2026 11:26:20 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-3-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=0HPdHuxiDqTtA0YywSuVWS43ZS3BgDMq+Pvu7w00t7Y=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltZJI9z4X2wT98SLfDh2LLMCfOso9BJWBaSl
 4V78G5vaYuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWQAKCRAADmhBGVaC
 FacVEACaj9MFO0nJvhnrbzJlVoaITK++8XVR/P/SlqYInzb6OApdrLCDaYj4o7clJSxoyY2+YXy
 nufOx/AFKfqW2S6FzC3wk0Amea2TLDHxNelOCx/2SIff9t15wvQiA4ZLxpYQVPPFLVxQK2GRK1Y
 GYWpk4R5NQjW8pI6fmnlB1C0Up+pudUOErMNmSgrXnGknVVaCMzqt2Wmc0wQ/KnpYYRDjqWzc9Z
 4aPzlAGV0DjDnRr7i1ILM6O7+x9H1+oqvDf5uPli/I699nETR/nnfhRR9ydxu2O/Y0BcZIQi4L8
 DWiDejEGM1IDAXwNfYeM2L24B9rzknRun4ykATk1QAYlBA8sjY2hW5RA1rtsopmXraY0wgLM+v/
 GF/ZzduMVkxw2L7+3SfIwl9IF4v8+vk8svrrLK2aDrvbA35RDe0QC55Z5Tp+7RGh0S9AL5Tpgz5
 RFL3t9hL/j+ejpsxX+/cYTzdyMe+uIzqVubH4KhniotJHOe3U+wPHnwZXvvfOu0QOutCllL4o4C
 pl735gbPZcgpGxib1cuKMRukAgWC60c2w+jfYn3Vb+VyhwXLbEh8Vg9K7yMsSHYubjYw3a+MP8B
 2PdQ1JkgTqMvc6gHLGaQrzIftI9HQBd8a3otzqg3wULPebh48F1QRniiGaGou9fA4+pe0fcaGK7
 9dnB8OyYRbW/VrA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to tmpfs export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 mm/shmem.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs6V-0007mV-6m
Subject: [f2fs-dev] [PATCH v2 03/31] tmpfs: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to tmpfs export operations to
indicate that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index ec6c01378e9d2bd47db9d7506e4d6a565e092185..c64c4410b4fd9961599a5ea768b469d8184e713e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4477,6 +4477,7 @@ static const struct export_operations shmem_export_ops = {
 	.get_parent     = shmem_get_parent,
 	.encode_fh      = shmem_encode_fh,
 	.fh_to_dentry	= shmem_fh_to_dentry,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 enum shmem_param {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
