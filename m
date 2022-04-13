Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F474FF304
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 11:09:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neZ0E-0006cZ-8l; Wed, 13 Apr 2022 09:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <wu-yan@tcl.com>) id 1neZ0C-0006cT-O7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 09:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKtk9cCEDC5JDIsaBlfZmwe423s06Vmyll/fYBhcEGg=; b=S0XZH77XrWa3TxS7Kw+Z7le800
 MarMpx37TPURUabHd18vL4GtBTRSk7oVG4vjujS/K/5QaYjZ1ZNCak4hZoLfq89G/Ua4CkcDNz5b4
 lPR/uyPTLy80gbbRo2YaBsSMaea83c495dfVatbGS9uhAFtQafrm+mfUOxdvPoSS29qw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VKtk9cCEDC5JDIsaBlfZmwe423s06Vmyll/fYBhcEGg=; b=C
 UOlEXxlVF/BfJNT1V3lont2Yx+qlDB3nXXutbLFaB+tiy7d7z2f8v1TSyA5toZqhiuWlXV9pn7UDg
 tXtWkng9BZ7lJIBT2qkiYQcT9Lw4LDdW8fpaO6TMHjsov1pGQu9A7SYFlRPihvuRqbml8yuTIKRoU
 DgUj6l47h08zMXsQ=;
Received: from 186.whitelist.crbl.net ([162.243.126.186])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neZ0B-0007Ag-3C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 09:09:29 +0000
Received: from ([114.119.32.142])
 by support.corp-email.com ((D)) with ASMTP (SSL) id IEG00038;
 Wed, 13 Apr 2022 16:44:38 +0800
Received: from localhost.localdomain (172.16.35.4) by GCY-MBS-28.TCL.com
 (10.136.3.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 13 Apr
 2022 16:44:38 +0800
From: Rokudo Yan <wu-yan@tcl.com>
To: <jaegeuk@kernel.org>
Date: Wed, 13 Apr 2022 16:44:32 +0800
Message-ID: <20220413084432.1312900-1-wu-yan@tcl.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.16.35.4]
X-ClientProxiedBy: GCY-EXS-27.TCL.com (10.74.128.67) To GCY-MBS-28.TCL.com
 (10.136.3.28)
tUid: 2022413164438f383f1451cf81c4bc895e3d2271acda2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a potential deadlock in gc thread may happen under
 low memory as below: gc_thread_func -f2fs_gc -do_garbage_collect
 -gc_data_segment
 -move_data_block -set_page_writeback(fio.encrypted_page);
 -f2fs_submit_page_write
 as f2fs_submit_page_write try to do io merge when possibl [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [162.243.126.186 listed in dnsbl-1.uceprotect.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1neZ0B-0007Ag-3C
Subject: [f2fs-dev] [PATCH] f2fs: avoid deadlock in gc thread under low
 memory
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
Cc: wu-yan@tcl.com, tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a potential deadlock in gc thread may happen
under low memory as below:

gc_thread_func
 -f2fs_gc
  -do_garbage_collect
   -gc_data_segment
    -move_data_block
     -set_page_writeback(fio.encrypted_page);
     -f2fs_submit_page_write
as f2fs_submit_page_write try to do io merge when possible, so the
encrypted_page is marked PG_writeback but may not submit to block
layer immediately, if system enter low memory when gc thread try
to move next data block, it may do direct reclaim and enter fs layer
as below:
   -move_data_block
    -f2fs_grab_cache_page(index=?, for_write=false)
     -grab_cache_page
      -find_or_create_page
       -pagecache_get_page
        -__page_cache_alloc --  __GFP_FS is set
         -alloc_pages_node
          -__alloc_pages
           -__alloc_pages_slowpath
            -__alloc_pages_direct_reclaim
             -__perform_reclaim
              -try_to_free_pages
               -do_try_to_free_pages
                -shrink_zones
                 -mem_cgroup_soft_limit_reclaim
                  -mem_cgroup_soft_reclaim
                   -mem_cgroup_shrink_node
                    -shrink_node_memcg
                     -shrink_list
                      -shrink_inactive_list
                       -shrink_page_list
                        -wait_on_page_writeback -- the page is marked
                       writeback during previous move_data_block call

the gc thread wait for the encrypted_page writeback complete,
but as gc thread held sbi->gc_lock, the writeback & sync thread
may blocked waiting for sbi->gc_lock, so the bio contain the
encrypted_page may nerver submit to block layer and complete the
writeback, which cause deadlock. To avoid this deadlock condition,
we mark the gc thread with PF_MEMALLOC_NOFS flag, then it will nerver
enter fs layer when try to alloc cache page during move_data_block.

Signed-off-by: Rokudo Yan <wu-yan@tcl.com>
---
 fs/f2fs/gc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e020804f7b07..cc71f77b98c8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -38,6 +38,12 @@ static int gc_thread_func(void *data)
 
 	wait_ms = gc_th->min_sleep_time;
 
+	/*
+	 * Make sure that no allocations from gc thread will ever
+	 * recurse to the fs layer to avoid deadlock as it will
+	 * hold sbi->gc_lock during garbage collection
+	 */
+	memalloc_nofs_save();
 	set_freezable();
 	do {
 		bool sync_mode, foreground = false;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
