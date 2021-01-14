Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0F2F574B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 03:45:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzsds-0008Mo-4e; Thu, 14 Jan 2021 02:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kzsdq-0008Mh-KB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 02:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3G3iMp9o5b3CJJln9yPkIfDpSdJPFL1yRFCzREzUyyE=; b=Q8vRr4fRVMYzOFlQw96hd1slj4
 HtZTnMI6i9x81Qllw1NwcoywNBdZwudfSc22oFDZVKsPgDu30sEjfL82ZGc/3pcPN73FhMa6mqUKV
 KGQ5eyn1AuqZo629Dvfg+8S0gR44QYuHQwt0YYOCCE3ZWJ4oI/8DNnaafTYWdfanfUmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3G3iMp9o5b3CJJln9yPkIfDpSdJPFL1yRFCzREzUyyE=; b=m4pzo3oPui3YGZr852cS9xyXHQ
 S4pTWTfmFRcLTbV4QSvNIQhgf1O0Jv/0ZU/iuhuuJpG5ZxWuUIX/KCPS7LaDFYPx8mi91tW4u4u9J
 2XSAb5yzfyzZ1euew9oDDMKQG/e/V0yuSRHNO6tetvf0BxhW6MkJJ13b6Xw0Prg7KAU8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzsdg-00Clor-0p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 02:45:42 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DGTCb4pQMzMK9m;
 Thu, 14 Jan 2021 10:43:55 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 14 Jan
 2021 10:45:13 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210107093126.116958-1-yuchao0@huawei.com>
 <X/we0NoUqAwuW82+@google.com>
 <6b0060b9-460a-617a-3778-e67f35d551f0@huawei.com>
 <cdd681ad-462d-cb37-2b4b-8f9d547bc718@huawei.com>
 <b44c2af4-d142-baff-387c-6b967f76065c@huawei.com>
 <X/0DxG+AcX54730W@google.com>
 <160f2cf9-73ca-18cd-6ad0-2498821b8db6@huawei.com>
 <X/4kYf11oyoMY8P+@google.com>
 <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
 <X/8UtJU9Dy30kC7I@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <37ba41db-2589-e155-c416-d0c8832026cb@huawei.com>
Date: Thu, 14 Jan 2021 10:45:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X/8UtJU9Dy30kC7I@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kzsdg-00Clor-0p
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/13 23:41, Jaegeuk Kim wrote:
> [58690.961685] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of f2fs_quota_write+0x150/0x1f0 [f2fs]
> [58691.071481] F2FS-fs (vdb): Inconsistent error blkaddr:31058, sit bitmap:0
> [58691.077338] ------------[ cut here ]------------
> [58691.081461] WARNING: CPU: 5 PID: 8308 at fs/f2fs/checkpoint.c:151 f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
> [58691.086734] Modules linked in: f2fs(O) quota_v2 quota_tree dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua ppdev intel_rapl_msr intel_rapl_common sb_edac kvm_intel kvm irqbypass joydev parport_pc parport input_leds serio_raw mac_hid qemu_fw_cfg sch_fq_codel ip_tables x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy asy
> [58691.120632] CPU: 5 PID: 8308 Comm: kworker/u17:5 Tainted: G      D    O      5.11.0-rc3-custom #1
> [58691.125438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
> [58691.129625] Workqueue: f2fs_post_read_wq f2fs_post_read_work [f2fs]
> [58691.133142] RIP: 0010:f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
> [58691.136221] Code: 3c 07 b8 01 00 00 00 d3 e0 21 f8 75 57 83 fa 07 75 52 89 f2 31 c9 48 c7 c6 20 6a a7 c0 48 89 df e8 bc d6 03 00 f0 80 4b 48 04 <0f> 0b 31 c0 e9 5e fe ff ff 48 8b 57 10 8b 42 30 d3 e0 03 42 48 39
> [58691.143142] RSP: 0018:ffffb429047afd40 EFLAGS: 00010206
> [58691.145639] RAX: 0000000000000000 RBX: ffff9c3b84041000 RCX: 0000000000000000
> [58691.148899] RDX: 0000000000000000 RSI: ffff9c3bbbd58940 RDI: ffff9c3bbbd58940
> [58691.152130] RBP: ffffb429047afd48 R08: ffff9c3bbbd58940 R09: ffffb429047afaa8
> [58691.155266] R10: 00000000001ba090 R11: 0000000000000003 R12: 0000000000007952
> [58691.158304] R13: fffff5cc81266ac0 R14: 00000000000000db R15: 0000000000000000
> [58691.161160] FS:  0000000000000000(0000) GS:ffff9c3bbbd40000(0000) knlGS:0000000000000000
> [58691.164286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [58691.166869] CR2: 00007f0fee9d3000 CR3: 000000005ee76001 CR4: 0000000000370ee0
> [58691.169714] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [58691.173102] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [58691.176163] Call Trace:
> [58691.177948]  f2fs_cache_compressed_page+0x69/0x280 [f2fs]
> [58691.180549]  ? newidle_balance+0x253/0x3d0
> [58691.183238]  f2fs_end_read_compressed_page+0x5a/0x70 [f2fs]
> [58691.188205]  f2fs_post_read_work+0x11d/0x120 [f2fs]
> [58691.192489]  process_one_work+0x221/0x3a0
> [58691.194482]  worker_thread+0x4d/0x3f0
> [58691.198867]  kthread+0x114/0x150
> [58691.202243]  ? process_one_work+0x3a0/0x3a0
> [58691.205367]  ? kthread_park+0x90/0x90
> [58691.208244]  ret_from_fork+0x22/0x30

Below patch fixes two issues, I expect this can fix above warning at least.

- detect truncation during f2fs_cache_compressed_page()
- don't set PageUptodate for temporary page in f2fs_load_compressed_page()

From: Chao Yu <yuchao0@huawei.com>

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
  fs/f2fs/compress.c | 20 +++++++++++++-------
  fs/f2fs/data.c     |  3 +--
  fs/f2fs/f2fs.h     |  6 +++---
  3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0fec71e40001..f364c10c506c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1741,7 +1741,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  	if (!test_opt(sbi, COMPRESS_CACHE))
  		return;

-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
  		return;

  	si_meminfo(&si);
@@ -1774,21 +1774,25 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  		return;
  	}

-	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
-	SetPageUptodate(cpage);
-
  	f2fs_set_page_private(cpage, ino);

+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
+		goto out;
+
+	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
+	SetPageUptodate(cpage);
+out:
  	f2fs_put_page(cpage, 1);
  }

-void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  								block_t blkaddr)
  {
  	struct page *cpage;
+	bool hitted = false;

  	if (!test_opt(sbi, COMPRESS_CACHE))
-		return;
+		return false;

  	cpage = f2fs_pagecache_get_page(COMPRESS_MAPPING(sbi),
  				blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS);
@@ -1797,10 +1801,12 @@ void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  			atomic_inc(&sbi->compress_page_hit);
  			memcpy(page_address(page),
  				page_address(cpage), PAGE_SIZE);
-			SetPageUptodate(page);
+			hitted = true;
  		}
  		f2fs_put_page(cpage, 1);
  	}
+
+	return hitted;
  }

  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b3973494b102..3705c272b76a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2211,8 +2211,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  		blkaddr = data_blkaddr(dn.inode, dn.node_page,
  						dn.ofs_in_node + i + 1);

-		f2fs_load_compressed_page(sbi, page, blkaddr);
-		if (PageUptodate(page)) {
+		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
  			if (atomic_dec_and_test(&dic->remaining_pages))
  				f2fs_decompress_cluster(dic);
  			continue;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f79a6825f06..b807970d67b1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3951,7 +3951,7 @@ struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
  void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
  void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  						nid_t ino, block_t blkaddr);
-void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
  								block_t blkaddr);
  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
  #else
@@ -3990,8 +3990,8 @@ static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
  				block_t blkaddr) { }
  static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
  				struct page *page, nid_t ino, block_t blkaddr) { }
-static inline void f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
-				struct page *page, block_t blkaddr) { }
+static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
+				struct page *page, block_t blkaddr) { return false; }
  static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
  							nid_t ino) { }
  #endif
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
