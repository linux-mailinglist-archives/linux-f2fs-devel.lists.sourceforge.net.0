Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF68D797C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 03:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sDwBB-0007SV-Vr;
	Mon, 03 Jun 2024 01:08:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sDwBA-0007SJ-Ln
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 01:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TG0W7PxAtanmcoxyAxGMshJFPoOMPjFrebDI8mi6bKk=; b=TnCINPpEvI8qjgqtYI/fXbVNoM
 dp0oFtwn64wE7iGVfn3aTLUFizLnNOg7i3tO/KaKgltWcT0FCcvd1q4rlATPyd8GvSkZTlrTRo6+1
 QwIgEIGX7wldh0CcQRMYhHdYZTHt+5oQapj8Z3vpwO0LqfU02Ldkty8fgL3S/XSUE5Kw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TG0W7PxAtanmcoxyAxGMshJFPoOMPjFrebDI8mi6bKk=; b=h
 dvhIBOW2hKIWydPhPCcUjLwZRhkPe2a0T4loddywlrU5pCqh7vE0j59pcoe7zoy6VRZF/4bDWqoZU
 AVtRyyEhzJ8jLVmr02s6MOKSVDydkP4HwgB/8U1y90i5hlhc6j2hCRCDSTzpldbM4+CTAxxIrFSrD
 ylq+RPlIYL6484BQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sDwBA-0003Zs-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 01:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 390F7CE013C;
 Mon,  3 Jun 2024 01:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA742C2BBFC;
 Mon,  3 Jun 2024 01:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717376871;
 bh=GyS3Y18rQu9OR8fVI2mcAQN7lotZDqwO7TwKorRv4EU=;
 h=From:To:Cc:Subject:Date:From;
 b=D8I6psrOyyBzeNkPVfedoZlzta/z5THqXNORMTgZ5A0RQI/v+TJOqRqmH4D7+/PUj
 gHTflezQyoMqWeED145AQQ3KUlN3HipnoZnclRTN8m2aodbbtowkSf7PoWHuoUy7UO
 L1lLnFlyxMedO0CZhiH6sqPRMouCrLxpJ5tnpgeYtp8pelFoNC9jCCtMgllMvemqPI
 FWIMtR4GWWlz8i1M2OQ/GbhOkyb9xO3xpG3qowJE88M+jv/CiAasmw1xSH6ueqTuTz
 gRHkq4SxsKSKuvle9yl8+4TCYQpgBYI3vQ+QYC8lHDhp+CtM/ToFNNxniYIx06zlLV
 avCdw2mc20OHA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  3 Jun 2024 09:07:45 +0800
Message-Id: <20240603010745.2246488-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If device is readonly,
 make f2fs_convert_inline_inode() return
 EROFS instead of zero, otherwise it may trigger panic during writeback of
 inline inode's dirty page as below: f2fs_write_single_data_page+0xbb6/0x1e90
 fs/f2fs/data.c:2888 f2fs_write_cache_pages fs/f2fs/data.c:3187 [inline]
 __f2fs_write_data_pages
 fs/f2fs/data.c:3342 [inline] f2fs_write_data_pages+0x1efe/0x3a [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sDwBA-0003Zs-Qh
Subject: [f2fs-dev] [PATCH] f2fs: fix return value of
 f2fs_convert_inline_inode()
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
Cc: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If device is readonly, make f2fs_convert_inline_inode()
return EROFS instead of zero, otherwise it may trigger
panic during writeback of inline inode's dirty page as
below:

 f2fs_write_single_data_page+0xbb6/0x1e90 fs/f2fs/data.c:2888
 f2fs_write_cache_pages fs/f2fs/data.c:3187 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3342 [inline]
 f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3369
 do_writepages+0x359/0x870 mm/page-writeback.c:2634
 filemap_fdatawrite_wbc+0x125/0x180 mm/filemap.c:397
 __filemap_fdatawrite_range mm/filemap.c:430 [inline]
 file_write_and_wait_range+0x1aa/0x290 mm/filemap.c:788
 f2fs_do_sync_file+0x68a/0x1ae0 fs/f2fs/file.c:276
 generic_write_sync include/linux/fs.h:2806 [inline]
 f2fs_file_write_iter+0x7bd/0x24e0 fs/f2fs/file.c:4977
 call_write_iter include/linux/fs.h:2114 [inline]
 new_sync_write fs/read_write.c:497 [inline]
 vfs_write+0xa72/0xc90 fs/read_write.c:590
 ksys_write+0x1a0/0x2c0 fs/read_write.c:643
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Cc: stable@vger.kernel.org
Reported-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000d103ce06174d7ec3@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inline.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 0203c3baabb6..1fba5728be70 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -221,8 +221,10 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	struct page *ipage, *page;
 	int err = 0;
 
-	if (!f2fs_has_inline_data(inode) ||
-			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
+	if (f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	if (!f2fs_has_inline_data(inode))
 		return 0;
 
 	err = f2fs_dquot_initialize(inode);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
