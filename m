Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75927D3B0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtZZ15llLiEBU608bidixVjZ1T9D51meNk5rqbgP4xo=; b=lnJbbRG0H4y6j2VFliulR+c21+
	mSghVWhA4PTo6FshCgSlW/gEXGZSopM1Vn4qj699tuDb4x97dH9mI0xx2uGP856CaoMqufNbC4luj
	GWXB0iCKl8AyXyqvuFFK9p6uPjbdGZtT+aS8fINsc+cw+ms2wwYfMYuTBLrD8WqjesPE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7C-0006SC-Ox;
	Mon, 19 Jan 2026 16:28:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7A-0006Ru-R9;
 Mon, 19 Jan 2026 16:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tDRbj5Fxnvu6c0vddUL7gT1ZEgkO2T0V5oWM2pNPI8=; b=h8+kQ6MQoXkes6c98qvj9Hk51Q
 6fDyumEvce/AZtVLhjqcXzSa3VaXV77ZpGcZb5K0A7GhiJ1deXR8UQ04x5X5AIlxSUde5UCgxC3ct
 ivVJbqnlFZuXLOc2XUiaQJMiwr33B7R1BNYwWvgf0QqkqPUpGbJkkzOswKnqIp4SH7IY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tDRbj5Fxnvu6c0vddUL7gT1ZEgkO2T0V5oWM2pNPI8=; b=QZkPvOpd6dUwRQjK5zdCkILwzM
 PytkqP2aEiGF0GVlU1j6hHtBgljICdfcznIHaWZjMfrME63NcTqCB6wvJMB0FAxJjPpwdBofcmyf5
 qagxmVXFUj6r4BC/riwSxY/jbDTZYBg/ZQEllGd2O6zm2hXTjwVxtnG4EvJmogpjWuIs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7A-0007ov-CJ; Mon, 19 Jan 2026 16:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6F6460054;
 Mon, 19 Jan 2026 16:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760FEC19423;
 Mon, 19 Jan 2026 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840097;
 bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZYOGK1VSRXACZeDxcscK+G9U9iCzh8RYdqzxqGEujLuLvnhaqjIV3+VkBZfMy2rcg
 t2XDYiWm4k4KPyqKqQuAnYVUqlbfpzdlMU1PgjKGtLOwistXirQ6chVNO7DBZokyOX
 dbDqFLCNfsdil/ZVlEzgV4i9bWiZmvaZb3Uj2IifUE951bkVp0g1+9kQCgKPt5s14w
 jGIAGRqwIi6t6KXhScWDQKAD1EGtXltlRnvikyIbEG1wJt0T1i5m92CNBc5548ovH4
 koPlpGs5tITCnz8DpOXHiA44n7PTT8A/24+hE1GREFJwg3qF3RfSyPpCTz7I8JQD96
 s6DCFiIOWie6Q==
Date: Mon, 19 Jan 2026 11:26:25 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-8-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=676; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbS1/gS87Fn1RMvrDvoHV4aPNyruq7ExJ+5
 KnMaUQSoVeJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 FaUyD/oDeaN+fXfmhxPOpvTOzolk/VR3OchPyVvXe+E5EhjCHh1jymVUx3uvwikAy9fYjMN0Yh5
 TBJdgthKwBaSef0VlO9K/tqroHJgSUuWYt1RWaayKPv7pcNAvg2vYPF2+47mnjW4oEd64FNc2q1
 KPYE+nsjlmhby424b88cryxdRuZxcN2v2uEG7cl6PwFOvE16DnfqSxermqFyoJgY5qEYZ/xwijR
 M5i6wHmGE4PT5FqZ/Qg2sdhp3OGpgaG2ZucL5z5dSpIdW2kLN+XyL0goqMorfHE7zQ/t9/WlcVY
 cqhuR2sBBhjOjevPC6q+dpPIj6MOqI4htdmPyTw3QPilfBWHOiN8K4U9wMcU/o6m97vJSQSITBo
 9vugz0H9ZdGtTk2sHoGrowrCuSMep3rzOO5TtBVsgToWJiwyTgb/6R78u8MV9niANumJcV7XIF7
 dBYK/xlEdG4R5Xg2si2xDeFLTLXnq+Ue6O+FTfxRerRoW7CMxu0FwCFx6C6U7flR7x+TJGxXPgj
 ipk84703+E9Qvr0WKAkRSBb4jy8D7Z1ymCtTKfeG9udWpg6mLIa4DWPo7mH3p1VF3psiwr6aZCR
 4iRqciC7NmkzUXJ+J47lsq7xeqLJqhykqUqqvVfFWBBQ+SnOCbcOwwYIeNz7/YrIDYunt8bD2JR
 /g5/yPaRpC9yzaw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs7A-0007ov-CJ
Subject: [f2fs-dev] [PATCH v2 08/31] xfs: add EXPORT_OP_STABLE_HANDLES flag
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
