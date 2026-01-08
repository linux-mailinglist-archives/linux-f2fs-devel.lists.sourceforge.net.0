Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA61D04D70
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajrAE9liwTG2Rx1JNsuDw2HbERf7gYBFXEbZ7QYeRzk=; b=A3vzLnffWPLE3jiiKdrqx0/3VY
	A+I3ONhM3a2lyEaxRF4asFlr1n73wj7BL7SnIWu1ysK0gCX1UR79+SFcEwN0m6Q68/nEByp4+0qMD
	YvCSkTeknR7A+FNNW4/6BsgwKCd7Ty3Hsb0sptI91HjBF6W5PCcP0ePzfWfaQJgTYkNE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcW-0006q2-9G;
	Thu, 08 Jan 2026 17:16:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtcT-0006pI-SA;
 Thu, 08 Jan 2026 17:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqBcLfl2WphGXAUeYg0RsVdiZ/sKtC0U50Gg9uwBBi4=; b=Y/PwU6Mx3DdyJ3amRklTk1eNix
 0g6tPsYFsN07VFTiGRLEMAvAs6v1IG7UIdOnh/5YS8yJ4tx6xnf7zA25VTTfEuduF26em+mNdr5c8
 sFx7q02gTrPPtJMe6HKD9ohyU0XHVmgC5ZS7EBjhSY6koQrq15jgNDrldeWo7T62JevM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lqBcLfl2WphGXAUeYg0RsVdiZ/sKtC0U50Gg9uwBBi4=; b=aop0c9y6GX84cbeEfAQqKZBFRR
 gqYg0dsS6LheEiKAp5oo3b3GlIJS6mgePTzp8gtu8x1NG76LwKO6AtlaOqnoHEAfZ1mpzzdIxocaN
 qn1emJkO8iGZMzESf2wCbqfj9NQAdbJvRUfTGcu4GeCfPgTQqIFi0Yg+1ChQfHh0y9bM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtcP-000671-9y; Thu, 08 Jan 2026 17:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBAAD43A12;
 Thu,  8 Jan 2026 17:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A71C116D0;
 Thu,  8 Jan 2026 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892566;
 bh=JE4GNVPNVKkNcA1jpqmX8IvYzHB+7PmSrfcDyeXRZLs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=O3j/8ZnOjlQ0r4lnYmPtsUkuQLHckXO+a7lG3tqb9TexBpJCI54gOjdY+y8cCsSsQ
 IxvwGEq3OuP4iFsa+dfO35ddGb2HgrELjQ3ao8l3pK8jjF+Rjy20EonfaYh8Llt5bn
 /RB0tjx0w8p0Z73/B/w0EDupGFZC6EL5Ujzfd5x4fov1xGuwtJQ2yYnkADQmROHfwj
 vsL2HbTZgjFTrxJnnt1JgX9uon1ZUYyi2U3LH7fBkbHEoUA/5KeCjcqPEx8Q1c2XKb
 ox1Hu8zNl8p9EtF8EvUx/ekvx2wfL1yY6MIxC64QcUBwdDJOmA+8NHq3bU3g6XawLT
 nDl4cYMCkWQAw==
Date: Thu, 08 Jan 2026 12:13:14 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-19-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=JE4GNVPNVKkNcA1jpqmX8IvYzHB+7PmSrfcDyeXRZLs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W9gK75PTtPWqOZdqkgSnHiF5/+OLjav5BQh
 LQ6WSLzNoSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvQAKCRAADmhBGVaC
 Fc2MEADKg6yklkAvCj4E7HbZuYhukcahYUkhiJr6s9Cmx08ysx8VeUMh6v2VkTsecYbC4+70tAV
 l8nv4WOUsUTDowp1tvc0/sz7/2Hzf+BrQ+/oLXazFQWMU+qAIDE2KG1fZ4eXH5/RziCIzTjsyVV
 WQfLt52vOVUhkx2Q9O2OsO8mq0omg1wvLgAwAtHGrvKOAP9KLOriK/cA5dyUAchlKMIgFpuo3UL
 naSDa/ODULEppeZRcUSiegKPxpZHgpJUzekiHgNKO1ef1uGJWyPmadrRMQTxDKgHU3d0QUBFPRy
 e4vMD3bsfS/hnKP+Q3YGKp4vT8pZBvAp3S0nY7TbIF8Gno7YQ6wLMTrwNRF7Ksus564DZpikQyQ
 Z1vp/C0eCi6Y1/9BACOuv/AaxipBGDR2sU43QFy7S3g1dFlmiokwOIZFB2+jvgiptQ+2Kqv+OkG
 2Et3Hg81At5S+sSz/MRyswGtr///ik0I7sPxkuHS72u0fhJxRBf92xon93aDj6aTIs+psF2EefR
 HUU5h7Km3+IAmuCDehZFAfanpbV4j2wEDY2a6PvPJ6QpsGWA7AB5705Oh8k3uV4EThmdpqmcqJc
 aSve0hv+Cc2HgVoaAFhypkfr9I4QNt1+P+/3feGfcoYp9R1OzGlgDJE4iURN4iMA6uvvliMP9FA
 /t5jn5rkkAqVo3w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation pointing to generic_setlease
 to the tmpfs file_operations structures. A future patch will change the
 default
 behavior to reject lease attempts with -EINVAL when there i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdtcP-000671-9y
Subject: [f2fs-dev] [PATCH 19/24] tmpfs: add setlease file operation
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the setlease file_operation pointing to generic_setlease to the
tmpfs file_operations structures. A future patch will change the
default behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/libfs.c | 2 ++
 mm/shmem.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 591eb649ebbacf202ff48cd3abd64a175daa291c..697c6d5fc12786c036f0086886297fb5cd52ae00 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -6,6 +6,7 @@
 
 #include <linux/blkdev.h>
 #include <linux/export.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
 #include <linux/slab.h>
 #include <linux/cred.h>
@@ -570,6 +571,7 @@ const struct file_operations simple_offset_dir_operations = {
 	.iterate_shared	= offset_readdir,
 	.read		= generic_read_dir,
 	.fsync		= noop_fsync,
+	.setlease	= generic_setlease,
 };
 
 struct dentry *find_next_child(struct dentry *parent, struct dentry *prev)
diff --git a/mm/shmem.c b/mm/shmem.c
index ec6c01378e9d2bd47db9d7506e4d6a565e092185..88ef1fd5cd38efedbb31353da2871ab1d47e68a5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -29,6 +29,7 @@
 #include <linux/pagemap.h>
 #include <linux/file.h>
 #include <linux/fileattr.h>
+#include <linux/filelock.h>
 #include <linux/mm.h>
 #include <linux/random.h>
 #include <linux/sched/signal.h>
@@ -5219,6 +5220,7 @@ static const struct file_operations shmem_file_operations = {
 	.splice_read	= shmem_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= shmem_fallocate,
+	.setlease	= generic_setlease,
 #endif
 };
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
