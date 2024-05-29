Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 101488D3101
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 10:23:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCEaC-0002xx-JA;
	Wed, 29 May 2024 08:22:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sCEaA-0002xo-OU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJhVg8X5DiwWA1ReBbYvYJtINdPHP78WrvBWgrIXXcE=; b=gRLCT71CX10eQWEWiQ0s/uqYoH
 kgw/ckmhC51ZqjT5ukuo0MAJnGsP+ZDMW7uQvi/vyO2xREcSYAc7Fm6hiL9Kz78YU3hjSit5l/Dg2
 888L+KCWTIUOorjW1SG7Ho7nt5muq8NAOfU4ySbNx5hHb2BTc3f4laP4zXDBT69FN36Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PJhVg8X5DiwWA1ReBbYvYJtINdPHP78WrvBWgrIXXcE=; b=A
 4L/gM9Ol2gTSBBe+um8vWrAYDHy/6lkN0KnqOm8+Lf6MzQeS/fkwFLffhW8Fn2ZcD3j4wdq62gnLm
 swger154kufgquiFwX7Mb/b2IzE/pEl4p3xEpUhGyNvviBoW23z9G3XUiGGGPS2ONZuiOsJdyMkZq
 ZuuIgDRqh60R61ME=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCEaA-0008DB-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:22:51 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 44T8MCFq075923;
 Wed, 29 May 2024 16:22:12 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Vq2MQ1J15z2QjGgT;
 Wed, 29 May 2024 16:18:26 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 29 May 2024 16:22:10 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 29 May 2024 16:19:39 +0800
Message-ID: <1716970779-27896-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 44T8MCFq075923
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  SSR allocate mode will be used when doing file defragment
 if ATGC is working at the same time, that is because set_page_private_gcing
 may make CURSEG_ALL_DATA_ATGC segment type got in f2fs_allocate_da [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCEaA-0008DB-Hz
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid use SSR allocate when do
 defragment
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SSR allocate mode will be used when doing file defragment
if ATGC is working at the same time, that is because
set_page_private_gcing may make CURSEG_ALL_DATA_ATGC segment
type got in f2fs_allocate_data_block when defragment page
is writeback, which may cause file fragmentation is worse.

A file with 2 fragmentations is changed as following after defragment:

----------------file info-------------------
sensorsdata :
--------------------------------------------
dev       [254:48]
ino       [0x    3029 : 12329]
mode      [0x    81b0 : 33200]
nlink     [0x       1 : 1]
uid       [0x    27e6 : 10214]
gid       [0x    27e6 : 10214]
size      [0x  242000 : 2367488]
blksize   [0x    1000 : 4096]
blocks    [0x    1210 : 4624]
--------------------------------------------

file_pos   start_blk     end_blk        blks
       0    11361121    11361207          87
  356352    11361215    11361216           2
  364544    11361218    11361218           1
  368640    11361220    11361221           2
  376832    11361224    11361225           2
  385024    11361227    11361238          12
  434176    11361240    11361252          13
  487424    11361254    11361254           1
  491520    11361271    11361279           9
  528384     3681794     3681795           2
  536576     3681797     3681797           1
  540672     3681799     3681799           1
  544768     3681803     3681803           1
  548864     3681805     3681805           1
  552960     3681807     3681807           1
  557056     3681809     3681809           1

A new FI flag FI_DEFRAG_IN_PROGRESS is introduced to avoid
this scenarios.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/file.c    | 2 ++
 fs/f2fs/segment.c | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4044e67..9281c5e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -803,6 +803,7 @@ enum {
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
+	FI_DEFRAG_IN_PROGRESS,	/* indicate file was defragmenting */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c0b281..93d2767 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2717,6 +2717,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		goto out;
 	}
 
+	set_inode_flag(inode, FI_DEFRAG_IN_PROGRESS);
 	map.m_lblk = pg_start;
 	map.m_len = pg_end - pg_start;
 	total = 0;
@@ -2772,6 +2773,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 clear_out:
 	clear_inode_flag(inode, FI_SKIP_WRITES);
 out:
+	clear_inode_flag(inode, FI_DEFRAG_IN_PROGRESS);
 	clear_inode_flag(inode, FI_OPU_WRITE);
 unlock_out:
 	inode_unlock(inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7caf20a..dd6f8ac 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3482,7 +3482,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (page_private_gcing(fio->page)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
-				(fio->sbi->gc_mode != GC_URGENT_HIGH))
+				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
+				!is_inode_flag_set(inode, FI_DEFRAG_IN_PROGRESS))
 				return CURSEG_ALL_DATA_ATGC;
 			else
 				return CURSEG_COLD_DATA;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
