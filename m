Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8E71FC2F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jun 2023 10:36:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q50Gu-0001Sy-7O;
	Fri, 02 Jun 2023 08:36:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q50Gq-0001SZ-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 08:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9c9TEOp1qC+RqaGLm08yJEqprri2QXXjrxHV/hbPc8=; b=FS1n0XqmHw6K5c7GlfV7+j2b65
 SOP4JkAU0RrBqwvdiwM9NT7vNgdPnyeeCQH9jNbR52eHuKe2rr7n6iAWm2/SC9jsNgqVSSmhSuZ5g
 Ga5kBgj3ZWCkwsfQ/ZxBziGNJaZ6FTmMBX7xp0aZU0HS8xGuTQ+oBImmUX7YVoDeeCDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A9c9TEOp1qC+RqaGLm08yJEqprri2QXXjrxHV/hbPc8=; b=M
 fy5F5CR1YIHFZUVIJQbm/gDcI9IE6nlCKdINa/daARWUBb6upJXChRpdnYYj+CrKgG4fZs6T0EV0z
 OKlNO8xfMEQaxuqCVekUO/d9E/8AVzFlj48c2nsF+1oPZP8FozrWVd6itzPC1U73aZ8e6qJewAw4j
 SwE8ipTKses8SFjI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q50Gf-0005h1-IK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 08:36:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7D264D50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  2 Jun 2023 08:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BA0C433D2;
 Fri,  2 Jun 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685694970;
 bh=xlo52tvORIIpAnKK0ye25x2JEs/59m3PnMQ4tQSI3ZI=;
 h=From:To:Cc:Subject:Date:From;
 b=vKm9x52pCunrUIYLGT58atc0EHT0W3vgjHDWxW1OE424s4XXxB8maeMRZHu2WzJB1
 RXAh/H3CitZcjcmlB4ufE6zV1MfdfzBIRP6rsKk/MWCBCzRKkLPWjsRALC5OY9mN9k
 mW0oNk4PlmgXL+3OZ1gfmOLbl4s3cM0wIXAWU0W4T+BNkG50xDK8N1u4hL4w8KymK6
 Nwee5wU/xAePlAXX1EhbQIxoy+MsJlL9+zRXW+yUUhs+bnt7OmNOZ3BBQ1pLhHutRe
 Sa6Jpi6VFuyO4ODb387NZ47hwAORy4H+gvwsokp1cmNHaOmAVzNBOXvBfJMwu6pkwN
 wtl6372lBcKSw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  2 Jun 2023 16:36:05 +0800
Message-Id: <20230602083605.2470674-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  generic/082 reports a bug as below: __schedule+0x332/0xf60
 schedule+0x6f/0xf0 schedule_timeout+0x23b/0x2a0 wait_for_completion+0x8f/0x140
 f2fs_issue_checkpoint+0xfe/0x1b0 f2fs_sync_fs+0x9d/0xb0
 sync_filesystem+0x87/0xb0 dquot_load_quota [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q50Gf-0005h1-IK
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: avoid dead loop in
 f2fs_issue_checkpoint()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/082 reports a bug as below:

__schedule+0x332/0xf60
schedule+0x6f/0xf0
schedule_timeout+0x23b/0x2a0
wait_for_completion+0x8f/0x140
f2fs_issue_checkpoint+0xfe/0x1b0
f2fs_sync_fs+0x9d/0xb0
sync_filesystem+0x87/0xb0
dquot_load_quota_sb+0x41b/0x460
dquot_load_quota_inode+0xa5/0x130
dquot_quota_on+0x4b/0x60
f2fs_quota_on+0xe3/0x1b0
do_quotactl+0x483/0x700
__x64_sys_quotactl+0x15c/0x310
do_syscall_64+0x3f/0x90
entry_SYSCALL_64_after_hwframe+0x72/0xdc

The root casue is race case as below:

Thread A			Kworker			IRQ
- write()
: write data to quota.user file

				- writepages
				 - f2fs_submit_page_write
				  - __is_cp_guaranteed return false
				  - inc_page_count(F2FS_WB_DATA)
				 - submit_bio
- quotactl(Q_QUOTAON)
 - f2fs_quota_on
  - dquot_quota_on
   - dquot_load_quota_inode
    - vfs_setup_quota_inode
    : inode->i_flags |= S_NOQUOTA
							- f2fs_write_end_io
							 - __is_cp_guaranteed return true
							 - dec_page_count(F2FS_WB_CP_DATA)
    - dquot_load_quota_sb
     - f2fs_sync_fs
      - f2fs_issue_checkpoint
       - do_checkpoint
        - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA)
        : loop due to F2FS_WB_CP_DATA count is negative

Calling filemap_fdatawrite() and filemap_fdatawait() to keep all data
clean before quota file setup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- avoid compile warning reported by lkp@intel.com.
 fs/f2fs/super.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2936bc870f5c..8fd23caa1ed9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2923,15 +2923,26 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 		return -EBUSY;
 	}
 
+	if (path->dentry->d_sb != sb)
+		return -EXDEV;
+
 	err = f2fs_quota_sync(sb, type);
 	if (err)
 		return err;
 
-	err = dquot_quota_on(sb, type, format_id, path);
+	inode = d_inode(path->dentry);
+
+	err = filemap_fdatawrite(inode->i_mapping);
 	if (err)
 		return err;
 
-	inode = d_inode(path->dentry);
+	err = filemap_fdatawait(inode->i_mapping);
+	if (err)
+		return err;
+
+	err = dquot_quota_on(sb, type, format_id, path);
+	if (err)
+		return err;
 
 	inode_lock(inode);
 	F2FS_I(inode)->i_flags |= F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
