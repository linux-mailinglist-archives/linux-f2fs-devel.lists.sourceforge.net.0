Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F729661CD0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 04:45:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEj6H-0004gb-6j;
	Mon, 09 Jan 2023 03:45:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pEj6F-0004gO-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddB79ksns4t2a1Y6SpOqk674sSKsAYNx9zfbCxBSxo4=; b=PutR15L3lcJP0CzVHl0n3/TiwL
 9O5R/K6iuqRYlzOqxZYRocfZic36Wws5CXvyJ/BEtWeXRochE5aTmq5q2jJ2Hv6aEmxKNF/4smXUE
 pqGS7v3OQFrRfI1dBpUWUPlFmKJr9ORknw6m6k+QTmQQFp/4YlOxOm5Zf+D47qTd2uHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ddB79ksns4t2a1Y6SpOqk674sSKsAYNx9zfbCxBSxo4=; b=UzBSgXbm4mnMT9GnZVZpKJn0SV
 Kp9er99l1lMYiyhkPvsWH2D8GicYa24VMVmE/hd7rN8Diq15it16gMlgx6700K/LpEIhUYUThjWUL
 pgEVpPTJdm2Kkeg/9HQ7TIG0pixAXjLpHRSMr8Xn5x18epnjJCLAeQMOmX6+XnPH7za4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEj6E-00AtiT-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54A4FB80C9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 03:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FC3C433D2;
 Mon,  9 Jan 2023 03:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673235919;
 bh=hKDOr8JIcD75xkm83bOzZlDNnSHJYgKqfFQhYck7fao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnz5Izj6HLtcxq0IIK6AI95gkyGbaKgKRuG+asb279Pl0s1mm1k0R+E41pV8g8Zew
 4jNTdjkDcybVvv8+/nEOzETVYM7RTOFSYd65UoKD8a7On4TvdZSP2JVXI6TviD4OrE
 U7iySzqLi/1nzSJkYhKTYg80ZDPvm7Z42YvVBWht0Wg+lheknO4vMaCbuf91Y5FlX3
 qwp10urnh9YwPbTsLjAYdLObjGSlGqOEl7aNM+4Cx7q3ZIlzMArRNsG6k0DOvAoW1V
 vwN0Q6yXUSW4drJRhnKnkcWpVaVajeZg82U0UAGynd+/QVfuz8PlL0eCX5d4wxyU3M
 /KHS/LAe3//cA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Jan 2023 11:44:53 +0800
Message-Id: <20230109034453.490176-5-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109034453.490176-1-chao@kernel.org>
References: <20230109034453.490176-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Thread A Kworker - application crashs - do_exit - close_files
 - filp_close - flush (f2fs_file_flush) - writepages - f2fs_write_cache_pages
 - f2fs_write_single_data_page - f2fs_do_write_data_page - che [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pEj6E-00AtiT-JQ
Subject: [f2fs-dev] [PATCH 5/5] f2fs: fix to avoid race condition of atomic
 write
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

Thread A				Kworker
- application crashs
 - do_exit
  - close_files
   - filp_close
    - flush (f2fs_file_flush)
					- writepages
					 - f2fs_write_cache_pages
					  - f2fs_write_single_data_page
					   - f2fs_do_write_data_page
					    - check f2fs_is_atomic_file
     - f2fs_abort_atomic_write
      - check f2fs_is_atomic_file
      - iput(cow_inode)
      - cow_inode = NULL
					    - set_new_dnode(cow_inode)

Fix this issue by covering f2fs_do_write_data_page() with i_atomic_sem.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c940da1c540f..1645b8a1b904 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2637,13 +2637,24 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct dnode_of_data dn;
 	struct node_info ni;
 	bool ipu_force = false;
+	bool atomic_locked = false;
 	int err = 0;
 
 	/* Use COW inode to make dnode_of_data for atomic write */
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_is_atomic_file(inode)) {
+		f2fs_down_write(&F2FS_I(inode)->i_atomic_sem);
+		atomic_locked = true;
+
+		if (!f2fs_is_atomic_file(inode)) {
+			/* atomic write is aborted */
+			err = -ENOENT;
+			goto out_err;
+		}
+
 		set_new_dnode(&dn, F2FS_I(inode)->cow_inode, NULL, NULL, 0);
-	else
+	} else {
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
+	}
 
 	if (need_inplace_update(fio) &&
 	    f2fs_lookup_read_extent_cache_block(inode, page->index,
@@ -2652,7 +2663,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 						DATA_GENERIC_ENHANCE)) {
 			f2fs_handle_error(fio->sbi,
 						ERROR_INVALID_BLKADDR);
-			return -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
+			goto out_err;
 		}
 
 		ipu_force = true;
@@ -2661,8 +2673,10 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	}
 
 	/* Deadlock due to between page->lock and f2fs_lock_op */
-	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi))
-		return -EAGAIN;
+	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi)) {
+		err = -EAGAIN;
+		goto out_err;
+	}
 
 	err = f2fs_get_dnode_of_data(&dn, page->index, LOOKUP_NODE);
 	if (err)
@@ -2710,6 +2724,9 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			set_inode_flag(inode, FI_UPDATE_WRITE);
 		}
 		trace_f2fs_do_write_data_page(fio->page, IPU);
+
+		if (atomic_locked)
+			f2fs_up_write(&F2FS_I(inode)->i_atomic_sem);
 		return err;
 	}
 
@@ -2747,6 +2764,9 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 out:
 	if (fio->need_lock == LOCK_REQ)
 		f2fs_unlock_op(fio->sbi);
+out_err:
+	if (atomic_locked)
+		f2fs_up_write(&F2FS_I(inode)->i_atomic_sem);
 	return err;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
