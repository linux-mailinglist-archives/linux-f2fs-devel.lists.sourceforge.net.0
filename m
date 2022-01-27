Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A549D868
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 03:49:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCuqa-0002Zh-2j; Thu, 27 Jan 2022 02:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nCuqZ-0002Zb-2Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZDgYM8qwS7cEjgCZQh3dYscA/4Dgjn5wr47tYjWHxQ=; b=BDOVX8l7/ujp3vZIUOdsgcQHNn
 SAF9NOqSRJ8NwvcWOl57iMGVyjqBqZoULu2Ubm0GeuZb9WeSnCVPkW2eZB3XaCyZg2IGz+7vCBwix
 kcHUld2X6m5qYOjXhKM+K7exW1IiwVT6cJJW8H08xOCw2nvY630lxzpJQMsQHvGUh8KQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cZDgYM8qwS7cEjgCZQh3dYscA/4Dgjn5wr47tYjWHxQ=; b=Ldz4OrkG6lOC5yDyThrj9YLw1a
 +8p+XyeiEqjMRfOjZ1wJFvnjIUDQAzwYxrOYhxikazIcF300P7xHgWnDcjlqTGwGZCE9cTyDY9yiu
 4d4LpnLQm1/ioGY40MJCLACThIpzC4YkXuqUWUSkhkDk6NpJuF6P8WagidldFyhz8AJ4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nCuqX-0007iN-25
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:49:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D36CF1F45F;
 Thu, 27 Jan 2022 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643251746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZDgYM8qwS7cEjgCZQh3dYscA/4Dgjn5wr47tYjWHxQ=;
 b=OabKjx61FrTXFFxOiTH9E0UU6VNFC44VWp7PWLnKiKXP6g2ugD0tfQ02c4R1eM0eHNLx9S
 G2jSPZ8PxVtwKkHPLyq1DoOJE8/o9xInUSEIPNVQw3bZ9rdhv0nRfFw1T3aU0HrltaTx4Z
 Wl5jPTVqSxQVC9k6/tLDDrT2ibDEDcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643251746;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZDgYM8qwS7cEjgCZQh3dYscA/4Dgjn5wr47tYjWHxQ=;
 b=D98bulEbZ/C02MAVX9285ZaaoqlEkffCcUaXh/N7JqN3KhqQHCrwZ5n3haM36DVFvGMwjK
 I4U0mIHIzRrzrODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3ED9513E46;
 Thu, 27 Jan 2022 02:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KeWrOhgI8mFFLAAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:48:56 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325158959.29787.14903007819591774556.stgit@noble.brown>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Linux no longer uses the bdi congestion tracking framework.
 So remove code from bdi which tries to support it. Also remove the
 "nfs_congestion_kb"
 sysctl. This is a user-visible change, but unlikely to be a problematic one.
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCuqX-0007iN-25
Subject: [f2fs-dev] [PATCH 7/9] NFS: remove congestion control.
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Linux no longer uses the bdi congestion tracking framework.
So remove code from bdi which tries to support it.

Also remove the "nfs_congestion_kb" sysctl.  This is a user-visible
change, but unlikely to be a problematic one.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/nfs/sysctl.c           |    7 ------
 fs/nfs/write.c            |   53 +--------------------------------------------
 include/linux/nfs_fs.h    |    1 -
 include/linux/nfs_fs_sb.h |    1 -
 4 files changed, 1 insertion(+), 61 deletions(-)

diff --git a/fs/nfs/sysctl.c b/fs/nfs/sysctl.c
index 7aea195ddb35..18f3ff77fd0c 100644
--- a/fs/nfs/sysctl.c
+++ b/fs/nfs/sysctl.c
@@ -22,13 +22,6 @@ static struct ctl_table nfs_cb_sysctls[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_jiffies,
 	},
-	{
-		.procname	= "nfs_congestion_kb",
-		.data		= &nfs_congestion_kb,
-		.maxlen		= sizeof(nfs_congestion_kb),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
-	},
 	{ }
 };
 
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 987a187bd39a..1c22ea6f23c3 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -397,33 +397,8 @@ static int wb_priority(struct writeback_control *wbc)
 	return ret;
 }
 
-/*
- * NFS congestion control
- */
-
-int nfs_congestion_kb;
-
-#define NFS_CONGESTION_ON_THRESH 	(nfs_congestion_kb >> (PAGE_SHIFT-10))
-#define NFS_CONGESTION_OFF_THRESH	\
-	(NFS_CONGESTION_ON_THRESH - (NFS_CONGESTION_ON_THRESH >> 2))
-
-static void nfs_set_page_writeback(struct page *page)
-{
-	struct inode *inode = page_file_mapping(page)->host;
-	struct nfs_server *nfss = NFS_SERVER(inode);
-	int ret = test_set_page_writeback(page);
-
-	WARN_ON_ONCE(ret != 0);
-
-	if (atomic_long_inc_return(&nfss->writeback) >
-			NFS_CONGESTION_ON_THRESH)
-		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
-}
-
 static void nfs_end_page_writeback(struct nfs_page *req)
 {
-	struct inode *inode = page_file_mapping(req->wb_page)->host;
-	struct nfs_server *nfss = NFS_SERVER(inode);
 	bool is_done;
 
 	is_done = nfs_page_group_sync_on_bit(req, PG_WB_END);
@@ -432,8 +407,6 @@ static void nfs_end_page_writeback(struct nfs_page *req)
 		return;
 
 	end_page_writeback(req->wb_page);
-	if (atomic_long_dec_return(&nfss->writeback) < NFS_CONGESTION_OFF_THRESH)
-		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
 }
 
 /*
@@ -617,7 +590,7 @@ static int nfs_page_async_flush(struct nfs_pageio_descriptor *pgio,
 	if (IS_ERR(req))
 		goto out;
 
-	nfs_set_page_writeback(page);
+	set_page_writeback(page);
 	WARN_ON_ONCE(test_bit(PG_CLEAN, &req->wb_flags));
 
 	/* If there is a fatal error that covers this write, just exit */
@@ -1850,7 +1823,6 @@ static void nfs_commit_release_pages(struct nfs_commit_data *data)
 	struct nfs_page	*req;
 	int status = data->task.tk_status;
 	struct nfs_commit_info cinfo;
-	struct nfs_server *nfss;
 
 	while (!list_empty(&data->pages)) {
 		req = nfs_list_entry(data->pages.next);
@@ -1891,9 +1863,6 @@ static void nfs_commit_release_pages(struct nfs_commit_data *data)
 		/* Latency breaker */
 		cond_resched();
 	}
-	nfss = NFS_SERVER(data->inode);
-	if (atomic_long_read(&nfss->writeback) < NFS_CONGESTION_OFF_THRESH)
-		clear_bdi_congested(inode_to_bdi(data->inode), BLK_RW_ASYNC);
 
 	nfs_init_cinfo(&cinfo, data->inode, data->dreq);
 	nfs_commit_end(cinfo.mds);
@@ -2162,26 +2131,6 @@ int __init nfs_init_writepagecache(void)
 	if (nfs_commit_mempool == NULL)
 		goto out_destroy_commit_cache;
 
-	/*
-	 * NFS congestion size, scale with available memory.
-	 *
-	 *  64MB:    8192k
-	 * 128MB:   11585k
-	 * 256MB:   16384k
-	 * 512MB:   23170k
-	 *   1GB:   32768k
-	 *   2GB:   46340k
-	 *   4GB:   65536k
-	 *   8GB:   92681k
-	 *  16GB:  131072k
-	 *
-	 * This allows larger machines to have larger/more transfers.
-	 * Limit the default to 256M
-	 */
-	nfs_congestion_kb = (16*int_sqrt(totalram_pages())) << (PAGE_SHIFT-10);
-	if (nfs_congestion_kb > 256*1024)
-		nfs_congestion_kb = 256*1024;
-
 	return 0;
 
 out_destroy_commit_cache:
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 02aa49323d1d..17045c229277 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -569,7 +569,6 @@ extern void nfs_complete_unlink(struct dentry *dentry, struct inode *);
 /*
  * linux/fs/nfs/write.c
  */
-extern int  nfs_congestion_kb;
 extern int  nfs_writepage(struct page *page, struct writeback_control *wbc);
 extern int  nfs_writepages(struct address_space *, struct writeback_control *);
 extern int  nfs_flush_incompatible(struct file *file, struct page *page);
diff --git a/include/linux/nfs_fs_sb.h b/include/linux/nfs_fs_sb.h
index ca0959e51e81..3444ebbc63b6 100644
--- a/include/linux/nfs_fs_sb.h
+++ b/include/linux/nfs_fs_sb.h
@@ -137,7 +137,6 @@ struct nfs_server {
 	struct rpc_clnt *	client_acl;	/* ACL RPC client handle */
 	struct nlm_host		*nlm_host;	/* NLM client handle */
 	struct nfs_iostats __percpu *io_stats;	/* I/O statistics */
-	atomic_long_t		writeback;	/* number of writeback pages */
 	unsigned int		flags;		/* various flags */
 
 /* The following are for internal use only. Also see uapi/linux/nfs_mount.h */




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
