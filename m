Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E74B0552
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 06:40:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI2Bf-0002ov-T4; Thu, 10 Feb 2022 05:40:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nI2Bd-0002ol-GO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=; b=UW2OfZ64yQEdbjvbohP/Pp76hC
 PXKRHhPpWVaEY7fJHe2/vCi10S7c3fQRSETynVLBy0KKxQQ0cEx555EEEeVph0GUg97ky7TzQiEle
 F7ZPzK7VTXBJW8rgRtiuyxkANd+awKmW3Ub0xB3XJ6kHlp6tQyeqhH38E4FH6Wgz8HAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=; b=T/mOcygpqgQxJ93ptTZiXvz+dG
 lXt8nHAQrZdjwpS1v+Z5ovPu4H1CwarGCDVpCCT6Q3G1beNcUlqjKACxuM2Ydf7qInyfkR05l1Bw5
 7Alk7+hdJDkCivIxedIZYE27PedeDjFoZsvQadmuc12AjSWSg4oYHFQBUj5qUagc0YC8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nI2Ba-0006xK-RT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:40:07 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70DD91F43D;
 Thu, 10 Feb 2022 05:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644471600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=;
 b=yqtSqHyxwgEcFQ7tdufVmzaUi5fzX/LrzaAkzdhIXE5cnkTbkkI3ey9uCvPzGq0EJK8rda
 +E9mWICL33Dcuy7EPilwaTHUIuOW26UmS0BKCDRpVFIaT/aGIr40dAeK5kQwab4f7Y/7nd
 gFlh18fk9z+J+gUjbfTujF0HzFVklpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644471600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBfA0J1VAN4vDciFet8kyITCSUUXphOKJM0dbNgQDlg=;
 b=CLVBNBE0ot5kjIcVDwlr6NGjjMHQwRokAo5rn1m3cMUkvfX1d7EUuwl81RGB0IMKB7NGBI
 Q3kdl10ckIPVZ6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2284A13519;
 Thu, 10 Feb 2022 05:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zTSyNCilBGIvOQAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:39:52 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147260.23354.2337728875894445797.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bdi congestion tracking in not widely used and will be
 removed. CEPHfs is one of a small number of filesystems that uses it, setting
 just the async (write) congestion flags at what it determines are appropriate
 times. Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nI2Ba-0006xK-RT
Subject: [f2fs-dev] [PATCH 06/11] ceph: remove reliance on bdi congestion
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The bdi congestion tracking in not widely used and will be removed.

CEPHfs is one of a small number of filesystems that uses it, setting
just the async (write) congestion flags at what it determines are
appropriate times.

The only remaining effect of the async flag is to cause (some)
WB_SYNC_NONE writes to be skipped.

So instead of setting the flag, set an internal flag and change:
 - .writepages to do nothing if WB_SYNC_NONE and the flag is set
 - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
    and the flag is set.

The writepages change causes a behavioural change in that pageout() can
now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
be called on the page which (I think) wil further delay the next attempt
at writeout.  This might be a good thing.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/ceph/addr.c  |   22 +++++++++++++---------
 fs/ceph/super.c |    1 +
 fs/ceph/super.h |    1 +
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index c98e5238a1b6..dc7af34640dd 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -563,7 +563,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 
 	if (atomic_long_inc_return(&fsc->writeback_count) >
 	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
-		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		fsc->write_congested = true;
 
 	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
 				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
@@ -623,7 +623,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 
 	if (atomic_long_dec_return(&fsc->writeback_count) <
 	    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
-		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
+		fsc->write_congested = false;
 
 	return err;
 }
@@ -635,6 +635,10 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	BUG_ON(!inode);
 	ihold(inode);
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    ceph_inode_to_client(inode)->write_congested)
+		return AOP_WRITEPAGE_ACTIVATE;
+
 	wait_on_page_fscache(page);
 
 	err = writepage_nounlock(page, wbc);
@@ -707,8 +711,7 @@ static void writepages_finish(struct ceph_osd_request *req)
 			if (atomic_long_dec_return(&fsc->writeback_count) <
 			     CONGESTION_OFF_THRESH(
 					fsc->mount_options->congestion_kb))
-				clear_bdi_congested(inode_to_bdi(inode),
-						    BLK_RW_ASYNC);
+				fsc->write_congested = false;
 
 			ceph_put_snap_context(detach_page_private(page));
 			end_page_writeback(page);
@@ -760,6 +763,10 @@ static int ceph_writepages_start(struct address_space *mapping,
 	bool done = false;
 	bool caching = ceph_is_cache_enabled(inode);
 
+	if (wbc->sync_mode == WB_SYNC_NONE &&
+	    fsc->write_congested)
+		return 0;
+
 	dout("writepages_start %p (mode=%s)\n", inode,
 	     wbc->sync_mode == WB_SYNC_NONE ? "NONE" :
 	     (wbc->sync_mode == WB_SYNC_ALL ? "ALL" : "HOLD"));
@@ -954,11 +961,8 @@ static int ceph_writepages_start(struct address_space *mapping,
 
 			if (atomic_long_inc_return(&fsc->writeback_count) >
 			    CONGESTION_ON_THRESH(
-				    fsc->mount_options->congestion_kb)) {
-				set_bdi_congested(inode_to_bdi(inode),
-						  BLK_RW_ASYNC);
-			}
-
+				    fsc->mount_options->congestion_kb))
+				fsc->write_congested = true;
 
 			pages[locked_pages++] = page;
 			pvec.pages[i] = NULL;
diff --git a/fs/ceph/super.c b/fs/ceph/super.c
index bf79f369aec6..4a3b77d049c7 100644
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -802,6 +802,7 @@ static struct ceph_fs_client *create_fs_client(struct ceph_mount_options *fsopt,
 	fsc->have_copy_from2 = true;
 
 	atomic_long_set(&fsc->writeback_count, 0);
+	fsc->write_congested = false;
 
 	err = -ENOMEM;
 	/*
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index 67f145e1ae7a..0bd97aea2319 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -121,6 +121,7 @@ struct ceph_fs_client {
 	struct ceph_mds_client *mdsc;
 
 	atomic_long_t writeback_count;
+	bool write_congested;
 
 	struct workqueue_struct *inode_wq;
 	struct workqueue_struct *cap_wq;




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
