Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1076939CBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 10:33:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWAxh-0002dK-47;
	Tue, 23 Jul 2024 08:33:32 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWAxe-0002d9-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FpchObtj1bgKZan3q5qtLR0pzIfvv/hdOK5gMl3pYc=; b=FqcPL5HwoM3b7IakjMAk4pbXSq
 zhy1oPL+6NfvVtypJ1k3l4m03Ceg1l1xGBUwXfnSKmU7ddAsrY6wkeRf2hitXL1tQTo6sJd99wOtm
 JLhvavRwYnNWqFxOBRCh5mX1iH1RHygoyDDkOBX/Qj7TFCOyCzNzhc8fvo/ZkGsoksow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2FpchObtj1bgKZan3q5qtLR0pzIfvv/hdOK5gMl3pYc=; b=IVIwi5DjWTMFtQ7s69hgSoyLmi
 kZxDm/IA5eRT3P7SwLm10a1FPJ+C4vlqkjk8vh3+TCAtUYoJ48zZ1BSF5umBSXvejOZlzHCRF/Fm1
 YbCdik3ixmlM4FsPyUelxa+9XZ/Wm2zGSZbCZtSr/mLft8bBZ/W/5tY8Z3y4MtC0ZVq8=;
Received: from out-185.mta0.migadu.com ([91.218.175.185])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWAxc-0003tf-VG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:30 +0000
X-Envelope-To: arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721723597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FpchObtj1bgKZan3q5qtLR0pzIfvv/hdOK5gMl3pYc=;
 b=d+j7TsDHafpzbLmS3vv6N/qkImQhjEqmin45ALNJBaRxl0qHDTvOB+rqR+HlCL96wm0LOF
 eA2U2qzRIYTczg0xNz8D9dMn0NWdsVOeb8S60GRVOWIpHir2+okklwMqcuf8x5jN+lBWRl
 uhgkDt50wo+N4yrygEF4KSBzYqB6z2U=
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: hch@infradead.org
X-Envelope-To: linux-arch@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Envelope-To: tangyouling@kylinos.cn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Tue, 23 Jul 2024 16:32:38 +0800
Message-Id: <20240723083239.41533-4-youling.tang@linux.dev>
In-Reply-To: <20240723083239.41533-1-youling.tang@linux.dev>
References: <20240723083239.41533-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Use
 module_{subinit, 
 subinit} to ensure that modules init and exit are in sequence and to simplify
 the code. Signed-off-by: Youling Tang <tangyouling@kylinos.cn> ---
 fs/ext4/super.c
 | 115 ++++++++++++++ 1 file changed, 33 insertions(+), 82 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.185 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.185 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWAxc-0003tf-VG
Subject: [f2fs-dev] [PATCH 3/4] ext4: Use module_{subinit,
 subexit} helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-modules@vger.kernel.org, youling.tang@linux.dev,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Youling Tang <tangyouling@kylinos.cn>

Use module_{subinit, subinit} to ensure that modules init and exit
are in sequence and to simplify the code.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/ext4/super.c | 115 ++++++++++++++----------------------------------
 1 file changed, 33 insertions(+), 82 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index e72145c4ae5a..207076e7e7f0 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7302,103 +7302,54 @@ static struct file_system_type ext4_fs_type = {
 };
 MODULE_ALIAS_FS("ext4");
 
+static int register_ext(void)
+{
+	register_as_ext3();
+	register_as_ext2();
+	return register_filesystem(&ext4_fs_type);
+}
+
+static void unregister_ext(void)
+{
+	unregister_as_ext2();
+	unregister_as_ext3();
+	unregister_filesystem(&ext4_fs_type);
+}
+
+static struct subexitcall_rollback rollback;
+
+static void __exit ext4_exit_fs(void)
+{
+	ext4_destroy_lazyinit_thread();
+	module_subexit(&rollback);
+}
+
 /* Shared across all ext4 file systems */
 wait_queue_head_t ext4__ioend_wq[EXT4_WQ_HASH_SZ];
 
 static int __init ext4_init_fs(void)
 {
-	int i, err;
-
 	ratelimit_state_init(&ext4_mount_msg_ratelimit, 30 * HZ, 64);
 	ext4_li_info = NULL;
 
 	/* Build-time check for flags consistency */
 	ext4_check_flag_values();
 
-	for (i = 0; i < EXT4_WQ_HASH_SZ; i++)
+	for (int i = 0; i < EXT4_WQ_HASH_SZ; i++)
 		init_waitqueue_head(&ext4__ioend_wq[i]);
 
-	err = ext4_init_es();
-	if (err)
-		return err;
-
-	err = ext4_init_pending();
-	if (err)
-		goto out7;
-
-	err = ext4_init_post_read_processing();
-	if (err)
-		goto out6;
-
-	err = ext4_init_pageio();
-	if (err)
-		goto out5;
-
-	err = ext4_init_system_zone();
-	if (err)
-		goto out4;
-
-	err = ext4_init_sysfs();
-	if (err)
-		goto out3;
-
-	err = ext4_init_mballoc();
-	if (err)
-		goto out2;
-	err = init_inodecache();
-	if (err)
-		goto out1;
-
-	err = ext4_fc_init_dentry_cache();
-	if (err)
-		goto out05;
-
-	register_as_ext3();
-	register_as_ext2();
-	err = register_filesystem(&ext4_fs_type);
-	if (err)
-		goto out;
+	module_subinit(ext4_init_es, ext4_exit_es, &rollback);
+	module_subinit(ext4_init_pending, ext4_exit_pending, &rollback);
+	module_subinit(ext4_init_post_read_processing, ext4_exit_post_read_processing, &rollback);
+	module_subinit(ext4_init_pageio, ext4_exit_pageio, &rollback);
+	module_subinit(ext4_init_system_zone, ext4_exit_system_zone, &rollback);
+	module_subinit(ext4_init_sysfs, ext4_exit_sysfs, &rollback);
+	module_subinit(ext4_init_mballoc, ext4_exit_mballoc, &rollback);
+	module_subinit(init_inodecache, destroy_inodecache, &rollback);
+	module_subinit(ext4_fc_init_dentry_cache, ext4_fc_destroy_dentry_cache, &rollback);
+	module_subinit(register_ext, unregister_ext, &rollback);
 
 	return 0;
-out:
-	unregister_as_ext2();
-	unregister_as_ext3();
-	ext4_fc_destroy_dentry_cache();
-out05:
-	destroy_inodecache();
-out1:
-	ext4_exit_mballoc();
-out2:
-	ext4_exit_sysfs();
-out3:
-	ext4_exit_system_zone();
-out4:
-	ext4_exit_pageio();
-out5:
-	ext4_exit_post_read_processing();
-out6:
-	ext4_exit_pending();
-out7:
-	ext4_exit_es();
-
-	return err;
-}
-
-static void __exit ext4_exit_fs(void)
-{
-	ext4_destroy_lazyinit_thread();
-	unregister_as_ext2();
-	unregister_as_ext3();
-	unregister_filesystem(&ext4_fs_type);
-	ext4_fc_destroy_dentry_cache();
-	destroy_inodecache();
-	ext4_exit_mballoc();
-	ext4_exit_sysfs();
-	ext4_exit_system_zone();
-	ext4_exit_pageio();
-	ext4_exit_post_read_processing();
-	ext4_exit_es();
-	ext4_exit_pending();
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
