Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070D37D1AF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 20:03:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgtCp-00046c-OH; Wed, 12 May 2021 18:03:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1lgtCj-00045Y-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 18:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYCppHNtKetmzhgA2QfXghgj5xmBZ8FCbnD/f+xYh5o=; b=i6JyFKWZRBsE1g4DmPuvr2Brt3
 Gs802qGf4ZKOUXmhnkDTdzHTiGaOWBK6kYHjBjv+Vcs+r6W1ppGTiszqF3yw5MiW7xsKT7Z7AwI90
 3+4eV9epr7RIFNL6YhtRAMtAfy71EO9U5wdOx4MgdAcPJrk42hKEMSFD79t2pv2CDfIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qYCppHNtKetmzhgA2QfXghgj5xmBZ8FCbnD/f+xYh5o=; b=lwGkw49oFLeluNPA14ZzuKtLLq
 fq+cnap1kJFcay6c038e6i3AxltBee9W+zrf+vD47Ywbr60e3J4wqNbHoO6D7YJ9mrm9NYDH8SA6t
 iASIaTmpnkQtaei9HuQ6IBcqGAf2q5SsQ8kMix8Miwi/JLKsQniqoi7BdWjgfTXbYXao=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgtCZ-0003wb-NM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 18:03:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0DFB6143A;
 Wed, 12 May 2021 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842594;
 bh=1CxHdvG1cSrlAvqM7XtdR5H9HWD+Rguez63BZ63/NDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S0np439Fwe4v0m1rK6x7HAMBffv374ZbR0lMso7NajQLuqxi6Ac66u243KXXr2K4A
 KaDxt5OLgIeNmgiqcAhWykuT70hZXDQik/WjSMfCJj8A2C1FBoWdwuVdkeO20cSN62
 iUp/LU9AdE3EGlJ/E9k/oQiieht5sNXpCNEmK5yv6ctShZXe/mpOLSx+BkDdwkpewN
 wT2cwROpOcUPQLwpFh+SOfYZygkszltKiJZhBHv7q66x9szwZPBDTfqU4xmBSu6W7e
 Xebuf6l/cNypUSYL/jguOKepvOhS2gH8nnKQrthBGmPnu+iGABrmhG4nm7jmsFUl4Z
 SLiKxoLz968lQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 12 May 2021 14:02:36 -0400
Message-Id: <20210512180306.664925-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180306.664925-1-sashal@kernel.org>
References: <20210512180306.664925-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.8 (/)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgtCZ-0003wb-NM
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 05/34] f2fs: fix to avoid
 out-of-bounds memory access
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
Cc: Sasha Levin <sashal@kernel.org>, butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit b862676e371715456c9dade7990c8004996d0d9e ]

butt3rflyh4ck <butterflyhuangxx@gmail.com> reported a bug found by
syzkaller fuzzer with custom modifications in 5.12.0-rc3+ [1]:

 dump_stack+0xfa/0x151 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x82/0x32c mm/kasan/report.c:232
 __kasan_report mm/kasan/report.c:399 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
 f2fs_test_bit fs/f2fs/f2fs.h:2572 [inline]
 current_nat_addr fs/f2fs/node.h:213 [inline]
 get_next_nat_page fs/f2fs/node.c:123 [inline]
 __flush_nat_entry_set fs/f2fs/node.c:2888 [inline]
 f2fs_flush_nat_entries+0x258e/0x2960 fs/f2fs/node.c:2991
 f2fs_write_checkpoint+0x1372/0x6a70 fs/f2fs/checkpoint.c:1640
 f2fs_issue_checkpoint+0x149/0x410 fs/f2fs/checkpoint.c:1807
 f2fs_sync_fs+0x20f/0x420 fs/f2fs/super.c:1454
 __sync_filesystem fs/sync.c:39 [inline]
 sync_filesystem fs/sync.c:67 [inline]
 sync_filesystem+0x1b5/0x260 fs/sync.c:48
 generic_shutdown_super+0x70/0x370 fs/super.c:448
 kill_block_super+0x97/0xf0 fs/super.c:1394

The root cause is, if nat entry in checkpoint journal area is corrupted,
e.g. nid of journalled nat entry exceeds max nid value, during checkpoint,
once it tries to flush nat journal to NAT area, get_next_nat_page() may
access out-of-bounds memory on nat_bitmap due to it uses wrong nid value
as bitmap offset.

[1] https://lore.kernel.org/lkml/CAFcO6XOMWdr8pObek6eN6-fs58KG9doRFadgJj-FnF-1x43s2g@mail.gmail.com/T/#u

Reported-and-tested-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e65d73293a3f..597a145c08ef 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2781,6 +2781,9 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 		struct f2fs_nat_entry raw_ne;
 		nid_t nid = le32_to_cpu(nid_in_journal(journal, i));
 
+		if (f2fs_check_nid_range(sbi, nid))
+			continue;
+
 		raw_ne = nat_in_journal(journal, i);
 
 		ne = __lookup_nat_cache(nm_i, nid);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
