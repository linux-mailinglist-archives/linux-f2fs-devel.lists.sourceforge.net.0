Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0431C61
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3ws-00011E-KW; Sat, 01 Jun 2019 13:21:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3wr-000116-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QIkTEoBJmKsQ9//HWEe8WkDMYp2ERTZxJPygrgkXXbw=; b=fuOseAyyjl8I0maQZ0DFVMY9O5
 Rp/h7bKNYvnk2Qe2ta1qunY98JnIvqEwSLsE+DXHPTFsu5hp9OIVfrIxGguhyX6cUUa23IwSUACpI
 bLhJXRQN5QnSl7n2ETzzN3bGlrsdUae2+2wFuOiHsI5u4L8ql0hK4zJ5/6If8h4ktrUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QIkTEoBJmKsQ9//HWEe8WkDMYp2ERTZxJPygrgkXXbw=; b=bXvl0sytdMe68OoTICGpprZc91
 P1uwtlGAe5OdJhiOqQW03wb7ilPEpWNHVWzEovLraACr8cE9/5Y8qLKuO59AI6sRk2M4qlVSvz0wi
 cUQZB7bErbQTPVu8D68cmWJGzbBqUc3IKW79f3i7+nBPTfN+qETYEHUtlGEBcNzXLgAQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3wq-00EcG6-AP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:25 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18B9D272F6;
 Sat,  1 Jun 2019 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395278;
 bh=KyJQPpQA3t/kHSchWa3aIy96jwgQX46ZurVe8ZfdpHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ow1fWcHKgSB2mq5ntdSS8dz4MwkZiJuEH3VlN812O60LQtG4Uy81wDZ/fAf+bDfvO
 D8oFJYD+K5RByUh11HuOolOVLkUtnyxlcB5e3Ot0odCV29QJlaV2lRvuMF8poJCGHi
 ApYo6DTzuksxJObf9yijAOh8k4yl4HVHBO8Vnxro=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:14 -0400
Message-Id: <20190601131934.25053-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3wq-00EcG6-AP
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 042/173] f2fs: fix error path of
 recovery
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 988385795c7f46b231982d54750587f204bd558b ]

There are some places in where we missed to unlock page or unlock page
incorrectly, fix them.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 73338c432e7e4..b14c718139a96 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -325,8 +325,10 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			break;
 		}
 
-		if (!is_recoverable_dnode(page))
+		if (!is_recoverable_dnode(page)) {
+			f2fs_put_page(page, 1);
 			break;
+		}
 
 		if (!is_fsync_dnode(page))
 			goto next;
@@ -338,8 +340,10 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			if (!check_only &&
 					IS_INODE(page) && is_dent_dnode(page)) {
 				err = f2fs_recover_inode_page(sbi, page);
-				if (err)
+				if (err) {
+					f2fs_put_page(page, 1);
 					break;
+				}
 				quota_inode = true;
 			}
 
@@ -355,6 +359,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 					err = 0;
 					goto next;
 				}
+				f2fs_put_page(page, 1);
 				break;
 			}
 		}
@@ -370,6 +375,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				"%s: detect looped node chain, "
 				"blkaddr:%u, next:%u",
 				__func__, blkaddr, next_blkaddr_of_node(page));
+			f2fs_put_page(page, 1);
 			err = -EINVAL;
 			break;
 		}
@@ -380,7 +386,6 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 
 		f2fs_ra_meta_pages_cond(sbi, blkaddr);
 	}
-	f2fs_put_page(page, 1);
 	return err;
 }
 
@@ -674,8 +679,10 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		 */
 		if (IS_INODE(page)) {
 			err = recover_inode(entry->inode, page);
-			if (err)
+			if (err) {
+				f2fs_put_page(page, 1);
 				break;
+			}
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, page, dir_list);
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
