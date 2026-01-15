Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B62D26C1D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtZZ15llLiEBU608bidixVjZ1T9D51meNk5rqbgP4xo=; b=Y5J5FzB/cC3XCCOutfG/wZFQRr
	ExuwiNo6VFR/S9TW2h8cuEakRILswpb5RsVdGYWRsQ06q25LjZ4vrAEJ5xl92Plwf3dZXeqoukyGQ
	MAVuA1Kt5vqWbfV3Jy5ZLxbouw/5b0p/WxvJQbpiGozSS6RovGJqnSEgM8l6VoMdoPJ4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRSu-0001HE-Ua;
	Thu, 15 Jan 2026 17:49:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRSt-0001Gq-Fz;
 Thu, 15 Jan 2026 17:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tDRbj5Fxnvu6c0vddUL7gT1ZEgkO2T0V5oWM2pNPI8=; b=H/2+J21nPBbb5Ww82POjix2as6
 v1y9nEZbpjMJ+vb8bKPCV1T1bHBxqyQmRc7EfcNudygDL+tL00cmFoPvX56YfXJ5Aj/tYmcsT1UAk
 2flkMlfhBYh3v9C8UeaQiSXg44DyUdEeweCxv2pjTvKukq/0GbjjhNfm5YciI384Qj2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tDRbj5Fxnvu6c0vddUL7gT1ZEgkO2T0V5oWM2pNPI8=; b=AQE9ZbKRnxLcY9+lPJ3ouX+6++
 cWXDF7fdnj0+tAoveHr5cM6GlIaf6T6QJqO7oe9/7XSDi/R+rWv91qBYkaFsjJ8C5YzqHkyo905sn
 ipWGM0o6Z4/rUKyHCL33pULT+vtPSsbMWPcV1LAQLWgK8jQyfihXjnJiV0aAQltNU80M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRSt-0007em-0q; Thu, 15 Jan 2026 17:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A82CD44448;
 Thu, 15 Jan 2026 17:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A39C16AAE;
 Thu, 15 Jan 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499328;
 bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=K6+XHbKxqod1uaKNGVLt+q96dw+BOnbjMcmu+xcP3xiYddgG/sJuefym6nZHrJfKi
 uH5dyVS/KTA4hRUnraDib1V8YEkjK+G8GVjWdIm826RobU7wYg6pDfMglI8V+Xq9Bx
 9pJ3DpoKFcm1Eq0APjx7imRbBy13g0E356azB26lJtgh0O5ScUdhZNVC/YkdtYSgi8
 gmVhqy2XaaZjGGOepgCkNZyeiVv3OKETq63VZjHg0LQALYupnIm4QywOci9P10oDbV
 pLqK1LQxhagszUU/8zfOn1rer6rnz7Rc+MW2csK90ADeRqcyCjpM3Gf8344us2SQbD
 qJhmn1Zj47U5Q==
Date: Thu, 15 Jan 2026 12:47:38 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-7-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=676; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShFUCOUlu0HwA0s7NudpYH2UNvJincQ80Jwg
 sEsHA/DeX2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRQAKCRAADmhBGVaC
 FSd7D/9HhL3CQRq9CDjJOgHiepYVXs1Z9+kqO1P1hOhsl8D7DDIrPttx5CuWUkhGAcKXXvzcPmi
 9TKdrUzG50aTMKrqulpKqOunGLLFir7B3FcVywRapPfJUqx0KLTsBaCdT8xUU3osoXsoeb3CQbX
 1KMKEJ/pU/MqyHNy1iKPHPkElMxX0QKsgVM69UadFRWjn2R3skLcJHutgI8INVYsrewANQfW4uS
 MscVfjtjTEcOZNxyFRYwlsCfSFUpDGunv543PqvRAVyvv0BQ+SFeO6U2aMErnOE7r56FTfvMOl5
 tuh937foFGakhJ8nJP9ZQy45v4wE4+/hQzwc8EVn3HWLC195i1O8tt+ewt74JopOTmYHtw9HWTd
 xpQiYgGhx4/DEAijagS/DXh1DHSEFxfNDJ0I9ale+NfJBNUS+zgavkkntEAPOI45FfOYcw0yIAp
 +JGVnw9DNGE9V/hefG0jVOiPj9uu5/A/hwgV5sHzf/Ck0PEZIPTmxsZbDRGdzyIzdk0Ht3Fh39p
 tYyLDOLZCOgznQbY65l6VAW/cvZI0oARSGpZJRy4OudPobv3MM1rd0m77loet1e8lq+9V7Y1oxM
 Q4C8bVqfBvhIO/ANW/XxX4fqO06IwLdqLVvdgppj/GI0MovVq4ZgjfwW9cKZ2xEQTiqm4AFJg9j
 k8Hn27V6ZD+gXng==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to xfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/xfs/xfs_export.c | 1 + 1 file changed, 
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
X-Headers-End: 1vgRSt-0007em-0q
Subject: [f2fs-dev] [PATCH 07/29] xfs: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to xfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/xfs/xfs_export.c b/fs/xfs/xfs_export.c
index 201489d3de0899af34f0485e00fb8b36842d419d..1be2de3394841a2960c1b2791897067b83cc7763 100644
--- a/fs/xfs/xfs_export.c
+++ b/fs/xfs/xfs_export.c
@@ -248,4 +248,5 @@ const struct export_operations xfs_export_operations = {
 	.map_blocks		= xfs_fs_map_blocks,
 	.commit_blocks		= xfs_fs_commit_blocks,
 #endif
+	.flags			= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
