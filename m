Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB984A713AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 10:28:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txN3V-0008WP-Ty;
	Wed, 26 Mar 2025 09:28:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1txN3U-0008WH-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WvNzPzKYMQs35dIuA8YlPhzb7stiEsuTHIA2wee+9TE=; b=OxyduazK3XnxC+3LrZc13mWX21
 fTK6ig9qU2tO+OYG0YouF4ebXwriNiXmAJAyp/0oAK5ac7RPhCplXl9Qf9BiIBtoH6k+XQPLa8MZ1
 UkdAS6y9SfnynYLug5CbMXMHPgjWJPS4R+M0+pwTN58KOwbgtrT/9ncRqvfIjFhG1Tpg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WvNzPzKYMQs35dIuA8YlPhzb7stiEsuTHIA2wee+9TE=; b=S
 IXxi7Hixq5j0wmd6RLmPw6E6+2soOo6VCVHe3J9I0gyFro/D/PS9DbBd6HKqIhF9gQqoi8DaTnWPF
 Y6gpImgPS1iVOYJtx3m88ZyLS4lF+7NbPu2MsWp5KX1wJmBS6ZP69kpx9CSVVWBCL3QyGMXiuoJYe
 jzOvTPyChWQowUz8=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txN3N-0000vY-EF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 09:28:12 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 52Q8lZ4r037628
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 16:47:35 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 52Q8kcNi031891;
 Wed, 26 Mar 2025 16:46:38 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZN0kQ3yz2z2KhRXC;
 Wed, 26 Mar 2025 16:46:06 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 26 Mar 2025 16:46:36 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 26 Mar 2025 16:46:01 +0800
Message-ID: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 52Q8kcNi031891
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit fccaa81de87e ("f2fs: prevent atomic file from being
 dirtied before commit") adds the processing of FI_ATOMIC_DIRTIED in the
 following
 two positions, [1] f2fs_commit_atomic_write - __f2fs_commit [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1txN3N-0000vY-EF
Subject: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
adds the processing of FI_ATOMIC_DIRTIED in the following two positions,
[1]
f2fs_commit_atomic_write
 - __f2fs_commit_atomic_write
  - sbi->committed_atomic_block += fi->atomic_write_cnt;
  - set_inode_flag(inode, FI_ATOMIC_COMMITTED);
  - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
  -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
  -    f2fs_mark_inode_dirty_sync(inode, true);
  - }
[2]
f2fs_abort_atomic_write
  - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
  -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
  -    f2fs_mark_inode_dirty_sync(inode, true);
  - }

but [1] seems to be redundant:
The atomic file flag FI_ATOMIC_FILE is still set here, so f2fs_mark_inode_dirty_sync
still does not set the dirty state to vfs. If FI_ATOMIC_DIRTIED was originally set
when atomic file is committing, then FI_ATOMIC_DIRTIED is just cleared here, and
then do the repeating action of setting FI_ATOMIC_DIRTIED?
So is it enough to do this only in [2]?

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/segment.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 396ef71..d4ea3af 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -376,10 +376,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
 		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
-		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
-			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
-			f2fs_mark_inode_dirty_sync(inode, true);
-		}
 	}
 
 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
