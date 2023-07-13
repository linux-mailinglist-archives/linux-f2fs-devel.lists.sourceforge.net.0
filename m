Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2376752D73
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 01:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qK5K3-0004JQ-GK;
	Thu, 13 Jul 2023 23:02:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qK5K1-0004JJ-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uf8fzofxnNcmoauKYc81EqlxvQyndJgVuHBZzE2ZMg0=; b=iCSCcmZkGYqG9LQsJ+IGTOzz/D
 zPDuSuGFGjtx85uVH7jDvf+J6B4kA0ogUMH1ynXUb/+P/msz6hjX8UTjXalO+mhK+7+WxoswK0f9/
 hTZgPPA5uvrHMdbUPdmVi+IUPQykH+PxJWCakTRqN5cuoO9igxErBA0o2lMeo0VFY6zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uf8fzofxnNcmoauKYc81EqlxvQyndJgVuHBZzE2ZMg0=; b=cWwbqI2NH8JE7zRyHqfi41dX99
 0pD3BJAA2lorFww8dsFEJIzQd6YMQ01elRq1vi5ncEeA7zLUhndki6U9VXYZlYY12hVmTU4O5ReC5
 9u9ZAhZy8vweOV9g7MSA0Mrx5H9xZdH/ITjIsXHhJ8tGTpNiSUlf/01RJT6SL3y3l4sA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qK5K3-0006Fa-Dr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:02:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA1F561BB5;
 Thu, 13 Jul 2023 23:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2C8C433BD;
 Thu, 13 Jul 2023 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289319;
 bh=t187d4hlj7Hd2B853hoiIPlXJE4vBx7O1lkOZGTYDW8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BS7k3xvm0kV8VQrl/+Nc8umWhgO+pb9JT0LHiIqUglobFvawLeTwqlzQHpVKTDZvB
 uzCvx/VSEkD7rBjIYWrgFJPCVeqzpiWP8yPt0omTj30LLcay2tknCTfGbRYu6T8MHO
 XUKoIaSo5n/Bd8IGVTxHqLGvMrjMe0fw+PscScTZ4jWUdNZ+2byzzdy+o175llL7m5
 o50SLzukRXrSYzl6VaWT8ZrHwmm4KFENLB31WgFlIK5T2Pi03WKPiptSSMpQZPxFLm
 ct6V/7uDGKKjKZCyDiQclhCznfyT/lEVKO0vqyqaIX9NPJI1Mx1EUf0gKBJYoL63GW
 31d2FfqFHu4Cw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:57 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-8-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
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
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=t187d4hlj7Hd2B853hoiIPlXJE4vBx7O1lkOZGTYDW8=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIv0d3fY46+2hyVZzGgFlf73uVo9uOX8lOx6
 K4UVJ9Da6yJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLwAKCRAADmhBGVaC
 FbztD/4uZXXSyTwCnSezUKeydXdyB1DOo4czPXF+iJ085mANTre9b4XbUvuEDf9bQijKjYvAiIF
 T6aBATLxstNxy4RGAHDXtSLWG232Ink6G1PNMhMC9R96FpJsuPjmMk8NUBog9j/mjyhM2PlaAMX
 tX5JL88Tb2gI1FbBxP6pQJCDRkYxbfydZ/FGNzZuAcvlJMt3BH7bGga81LPIjr5UOfLB+GnI8oe
 i5BFOw+r7A+Xu+KDGowTNXor3TGmR763yaM7A/mcig5Jp20jEJIXDGO1tVgSdAP0LebIstIif+9
 kiMe/3MWPnPs0eVd+mEtYR53HfccdkA9ShOKV+Jx7qg5v2TSojDh7bRQBVb22NQZGRPBlgv2560
 X83w+MU7yhsMU1MCxv2Whg6ooLLErWX5Zp68rM1FJYdQ/3YbvfDj6sg+4Aa3PF5ifwLM33BLCLr
 pXwEOeLySTL3OWSfSzMqbNqkSShHhPhxZs+ZtZsqAM1fTRTO3svFqI7T/IFjBt7NKwvQJKyhtIJ
 syGts3Gf66X08k1+2iwyGMuP2FA8o0TGMTCwUBXZtxQhhH4KlMpwsdFurHxhcT/j4CtVbSAH4Uc
 fB3KEuG+QiBPD89OSHahxCRhPa+vWgmHHVnmaRK/PJC6un6LOOBM1as6ikNxs/Lc9yixCPrHMNq
 /XZRVwDe3wtNV8A==
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
 being actively observed via getattr. Beyond enabling the FS_MGTIME flag,
 this patch eliminates update_time_for_write, which goes to great pains to
 avoid in-memory stores. Just have it overwrite the timestamps unconditionally.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qK5K3-0006Fa-Dr
Subject: [f2fs-dev] [PATCH v5 8/8] btrfs: convert to multigrain timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

Beyond enabling the FS_MGTIME flag, this patch eliminates
update_time_for_write, which goes to great pains to avoid in-memory
stores. Just have it overwrite the timestamps unconditionally.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/file.c  | 24 ++++--------------------
 fs/btrfs/super.c |  5 +++--
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index d7a9ece7a40b..b9e75c9f95ac 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1106,25 +1106,6 @@ void btrfs_check_nocow_unlock(struct btrfs_inode *inode)
 	btrfs_drew_write_unlock(&inode->root->snapshot_lock);
 }
 
-static void update_time_for_write(struct inode *inode)
-{
-	struct timespec64 now, ctime;
-
-	if (IS_NOCMTIME(inode))
-		return;
-
-	now = current_time(inode);
-	if (!timespec64_equal(&inode->i_mtime, &now))
-		inode->i_mtime = now;
-
-	ctime = inode_get_ctime(inode);
-	if (!timespec64_equal(&ctime, &now))
-		inode_set_ctime_to_ts(inode, now);
-
-	if (IS_I_VERSION(inode))
-		inode_inc_iversion(inode);
-}
-
 static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
 			     size_t count)
 {
@@ -1156,7 +1137,10 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
 	 * need to start yet another transaction to update the inode as we will
 	 * update the inode when we finish writing whatever data we write.
 	 */
-	update_time_for_write(inode);
+	if (!IS_NOCMTIME(inode)) {
+		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_inc_iversion(inode);
+	}
 
 	start_pos = round_down(pos, fs_info->sectorsize);
 	oldsize = i_size_read(inode);
diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f1dd172d8d5b..8eda51b095c9 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -2144,7 +2144,7 @@ static struct file_system_type btrfs_fs_type = {
 	.name		= "btrfs",
 	.mount		= btrfs_mount,
 	.kill_sb	= btrfs_kill_super,
-	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA,
+	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA | FS_MGTIME,
 };
 
 static struct file_system_type btrfs_root_fs_type = {
@@ -2152,7 +2152,8 @@ static struct file_system_type btrfs_root_fs_type = {
 	.name		= "btrfs",
 	.mount		= btrfs_mount_root,
 	.kill_sb	= btrfs_kill_super,
-	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA | FS_ALLOW_IDMAP,
+	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA |
+			  FS_ALLOW_IDMAP | FS_MGTIME,
 };
 
 MODULE_ALIAS_FS("btrfs");

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
