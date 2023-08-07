Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458A772F1A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64p-0008Fl-5o;
	Mon, 07 Aug 2023 19:39:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64o-0008Ff-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V7VUV40AHb30+wl7s1L9oeo+r+o83Q0MloeOa8M3GeQ=; b=C66vrqgTt85ZxMCG2LZn5eoEQd
 v19D80aY+YYIKyZG+AdMIymEgOJ7qQtjCScEwI0Xntum3MRjMDmvFJFrUc9K4MG5omi47rLNBEQvq
 M1a5PTHcnJhOO1M36d9//hJF95ZGyb9RH/+F7xO9kr5WHpZFrtspj8QHgypE5pZ4FIp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V7VUV40AHb30+wl7s1L9oeo+r+o83Q0MloeOa8M3GeQ=; b=PfRdviFHU22nEEKaSqBoGn5XXK
 wfV14tWFSjC7pHfxcG5z85RL7MWkcUtlg4zIxy9Wmjz6RQRP3QVKzeFPfgdg6uQvephfhS5fI3TOp
 4X2pAiaa3h1L+i0oRjpeQQjjqWJsqKkbiZ22LjYt9xI4xjly2FTJn2iQzKGUTbMhxPvA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64o-00GNTO-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E0CF621C0;
 Mon,  7 Aug 2023 19:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E95C433AD;
 Mon,  7 Aug 2023 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437172;
 bh=BbICkmDBBgSwVYXS6EZd0IrAvg6Sna2OcPY/ygsvt9A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=To4OoZRwZMZhtMOzlC110JtHszU7IBQi+eF0kpdySXfLmiqOD0w0yv+SVbm9/RWPW
 6+qTqh7chbUbK1cB7KNEd7CzthwW3pvOWmnzVy/F0HEB3bKBfYzPz5sGkAwAvIzz7B
 YtwY/TdyqI39hIdIUyKejqo7jet75+X94OKSM2cIBBFpshpVckDv04dsV4FjoR+Ij/
 fqREz9gj2E4mhd6RDJ+zkFdH3IjF/iknH4D7DA/h2OV3jG1JxbM50o3qRbPjdQhIsi
 51mY/jMlCA/D65p0sDAVkB5bJM4sjLRSG+kwLJ+3ZKphnRpcdJjMaGhbgcd3Cr2dgG
 7x5nw+HV/Yhbw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:38 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=BbICkmDBBgSwVYXS6EZd0IrAvg6Sna2OcPY/ygsvt9A=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+aVcwKVBDp9E8rOPtssDQbh7IcGxvS0rwI
 c1S2hBt9TuJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 FSPAEACPlCK3EgTnJat9G2lrCllZiR9HeXocxcWOoiDdqnOhA+LCdHCG7FPdv/tU6u5WnxoUH7B
 ARY5BR/8sjxizcFksE2rWBMWCvo/lCt3fEvv/TumLj+HamcwMPPGMuPB/bHhgM4O53ozb4mxyXc
 lBk42qVLhXQ3MpJKcdrAWqVbo5LnY8ffNoMTI9BljHoAWIZZA/FjxrWUD10PTuyI/p95JNSIDCB
 6MjkGDIc9Aa41sfJVYJIe8fYFiGCsBhIgJwOYv44zu1wI4AJx5ZynU4UbweZHqkp2dc8U17oDEG
 8MZvUycGi4MbEufJuFsQMH4rn7w9ETKsguIBXgoT/zt3aRI/dhj4ZBfQcMCgJXkbBEqz0K2cQx9
 tUWV8oyU96vyxSzufIbhSczkroS2v5Uk9TpTq21U2Q3/lLA0Kh02dmR+sN5DgRGjgs8PcsIyumE
 D+5GYVvwgcyhHgdLN2ZLUDDOYzxGk0zl8gn1BuXb0iVHMlEjajc701wdqK191Yz1E8OOA8mx5Gz
 /ZWTo657yfwR4rLHHNlU2jA2S3EjuD9deqANKCDsth+oSL7VOVcmdG+vA7CwskS2JFW3KISHb/o
 EVZxdxxPBB7VOEROYbHIE4wJsXavHzD/Z9/+n6qkWcPntfHcdKgrVLfDRkHmM7z3U4pO5Pssc3p
 xOm62tN6CQuYYsQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In later patches we're going to drop the "now" parameter from
 the update_time operation. Prepare XFS for this by reworking how it fetches
 timestamps and sets them in the inode. Ensure that we update t [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT64o-00GNTO-Mc
Subject: [f2fs-dev] [PATCH v7 07/13] xfs: have xfs_vn_update_time gets its
 own timestamp
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In later patches we're going to drop the "now" parameter from the
update_time operation. Prepare XFS for this by reworking how it fetches
timestamps and sets them in the inode. Ensure that we update the ctime
even if only S_MTIME is set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_iops.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 731f45391baa..72d18e7840f5 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1037,6 +1037,7 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
+	struct timespec64	now = current_time(inode);
 
 	trace_xfs_update_time(ip);
 
@@ -1056,12 +1057,15 @@ xfs_vn_update_time(
 		return error;
 
 	xfs_ilock(ip, XFS_ILOCK_EXCL);
-	if (flags & S_CTIME)
-		inode_set_ctime_to_ts(inode, *now);
+	if (flags & (S_CTIME|S_MTIME))
+		now = inode_set_ctime_current(inode);
+	else
+		now = current_time(inode);
+
 	if (flags & S_MTIME)
-		inode->i_mtime = *now;
+		inode->i_mtime = now;
 	if (flags & S_ATIME)
-		inode->i_atime = *now;
+		inode->i_atime = now;
 
 	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
 	xfs_trans_log_inode(tp, ip, log_flags);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
