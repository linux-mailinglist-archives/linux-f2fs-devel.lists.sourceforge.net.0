Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7B772F2F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:40:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT65J-00058z-Bg;
	Mon, 07 Aug 2023 19:40:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT65H-00058o-1s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXmeQta2YnDvYvm7pY7KY7bX0E4AZ538puGeB+V7R8o=; b=UBvMRv3PMUUrbitR+euQYsHFJM
 bp8pFf1lrrN6mvVH946D7QwP6Fg8Y1F62SzTJyx9aS8VKe85U1YshnWRa1OTzZ7HRzgFI9Jju0PHn
 5ZJqqxyIZOMfb+xB6CyC6nwmIWk/495ypczi9UGy0WjlgVf+I2vTwHHarQ122Ff4Owfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cXmeQta2YnDvYvm7pY7KY7bX0E4AZ538puGeB+V7R8o=; b=VxFovllrhu5UZK43RiWfEMEbzJ
 3d8B+NDpAjSXkjARcENVRU6RzSZtkhVyi1d/A1m30ZRa3L290o/yarS8YNxv3yici3L1dKdGhCKhA
 qVtxefsydxqqx/5o2WM7JBmv1cfd1IGayUou9vF10ah/an9GksaRM7sC48shwwrRURU8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT65G-00GNUf-CE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:40:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B89FC621D9;
 Mon,  7 Aug 2023 19:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4372C433AD;
 Mon,  7 Aug 2023 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437199;
 bh=5z/xbylGSvl+hXVOci3wcsIYNghIXwAhUC+C2rSRnrI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eCx3/6EO8nhuSLWw0qDzOpJidfwZx2HcOMAzpuXVPelkhCF2pcVuHSibcbmbGhJK5
 GPDWyb00fES2Y8U2hc4HPbLSOmDE7Su02vtAnoiobTUkmON6PETOCYUQHwP7kMw7Wm
 SurDPWNuVLHgzN3z1a924L8xntZgd0ZB34prPRmheOuqc1k1I3BDawuiVlPk/BJxMa
 FIULYvuynB3vyHPnurz9KmqIkjEcbVU31dmg+bhQha2QX3b2veQwSii1wkra7TQn5C
 jFKr6fs5IKw4Uks3PpfbmHgYb6SFOCbVlyvslacFUm5BMV8Z6NipSFBNbV/JLIKsBm
 FTv+mFcfo1CQw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:42 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-11-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2949; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=5z/xbylGSvl+hXVOci3wcsIYNghIXwAhUC+C2rSRnrI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+ahpKwIw68/bt2wjNnF2D/E8cVJSHtX8/R
 sXB1tpcF9OJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 Fc+TD/9lkfr49t1rf4jw+BkwpfhPF+kXhDXXn3JpvdSRXx2GnfpdpGAjnd90Z8aGsx1BFxKE/U1
 4SnV5bD7hd4pTxXoYonVw1Au0ScYhllztfa2Hoo6YscHqdI0YFfYuTOhIKpf/TqFhPt5LXShftq
 akT7g5jSAyFqMcvc34edKo52PSy2ZDZFn3fCKzuh8JMbxOPW0vHTXUR9yfqsptnG02lViGcDLD/
 usJGZnShDoatUOAxVBdS2VCHlNAmhuPg6/GSFQAfYSiUSAgIS/4nnihBj5HcOkdg614hVQzoepW
 NZleVbruxT4TtqCIItw72wFSRiod6LYA4EoqeEnO7wZbI/tNUVN3trpz6y/fIbjGv6jHhuClnv6
 wwOv7I31YG5jvzYf1fSy/PTr2oON8d9hfkUbAYbwnTNYgJCTqRmDAJVdywazPPMg3AU1IHKfqcN
 DkWBDtFjjgn53eKNgj832Is8wO3G/xHb1a3KJfNIIVIL5Tia+Bz9OWrrvGueMAq5Oa+ffbRHKg8
 yvGkRqpZLrGhy2sjzzcQ5fzgs0MRVXxFFv+WD50ZANZ4cpN7ZGps63xtDnwy8nadXecAb1McpGY
 uMniWQ8CVTofdNKp0AlscttAtXLOcBoKTT8g1aTXg8PxvDKrAPFzf8U6VxFBT9ZCtw3/4kG/jlE
 8U/73oVup4s0oKg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Enable multigrain timestamps, which should ensure that there
 is an apparent change to the timestamp whenever it has been written after
 being actively observed via getattr. Also, anytime the mtime changes, the
 ctime must also change,
 and those are now the only two options for xfs_trans_ichgtime.
 Have that function unconditionally bump the ctime, and ASSERT that XFS_ICHGT
 [...] Content analysis details:   (-5.2 points, 6.0 required)
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
X-Headers-End: 1qT65G-00GNUf-CE
Subject: [f2fs-dev] [PATCH v7 11/13] xfs: switch to multigrain timestamps
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

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

Also, anytime the mtime changes, the ctime must also change, and those
are now the only two options for xfs_trans_ichgtime. Have that function
unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
always set.

Acked-by: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
 fs/xfs/xfs_iops.c               | 8 ++++----
 fs/xfs/xfs_super.c              | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index 6b2296ff248a..ad22656376d3 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -62,12 +62,12 @@ xfs_trans_ichgtime(
 	ASSERT(tp);
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 
-	tv = current_time(inode);
+	/* If the mtime changes, then ctime must also change */
+	ASSERT(flags & XFS_ICHGTIME_CHG);
 
+	tv = inode_set_ctime_current(inode);
 	if (flags & XFS_ICHGTIME_MOD)
 		inode->i_mtime = tv;
-	if (flags & XFS_ICHGTIME_CHG)
-		inode_set_ctime_to_ts(inode, tv);
 	if (flags & XFS_ICHGTIME_CREATE)
 		ip->i_crtime = tv;
 }
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index c73529f77bac..2ededd3f6b8c 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -573,10 +573,10 @@ xfs_vn_getattr(
 	stat->gid = vfsgid_into_kgid(vfsgid);
 	stat->ino = ip->i_ino;
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
 	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
 
+	fill_mg_cmtime(stat, request_mask, inode);
+
 	if (xfs_has_v3inodes(mp)) {
 		if (request_mask & STATX_BTIME) {
 			stat->result_mask |= STATX_BTIME;
@@ -917,7 +917,7 @@ xfs_setattr_size(
 	if (newsize != oldsize &&
 	    !(iattr->ia_valid & (ATTR_CTIME | ATTR_MTIME))) {
 		iattr->ia_ctime = iattr->ia_mtime =
-			current_time(inode);
+			current_mgtime(inode);
 		iattr->ia_valid |= ATTR_CTIME | ATTR_MTIME;
 	}
 
@@ -1036,7 +1036,7 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
-	struct timespec64	now = current_time(inode);
+	struct timespec64	now;
 
 	trace_xfs_update_time(ip);
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 818510243130..4b10edb2c972 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -2009,7 +2009,7 @@ static struct file_system_type xfs_fs_type = {
 	.init_fs_context	= xfs_init_fs_context,
 	.parameters		= xfs_fs_parameters,
 	.kill_sb		= kill_block_super,
-	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
+	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 MODULE_ALIAS_FS("xfs");
 

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
