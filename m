Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF377AD2C1E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 05:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pO3DrMUXKcJW7dLCUYQqgv41lpJZx31OZJSJYcq8ttA=; b=I7NfuxxiDWgInQpxilgvmFcXPJ
	wCzYrWbjV2Oa2XuZiIbvPEa8al8clFTjVY5ytw753Osy5iygY9IJ/2kD6VGi/hkdumdSHd7HhQ0MI
	yqnV17A7o/vj/hn7sGqySrMFd4UqxqRFpjmXwLaAU067mvXto9zpXCmG9AH3bbdJGD8k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOpQf-0000Lk-K7;
	Tue, 10 Jun 2025 03:13:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uOpQe-0000Le-29
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 03:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RuqNRMF3EnAZDBbJ/HRat1w2quH3bBrYFTnwWL0OoMU=; b=PZuw4OW0xYnOyrdhWc4AJ2mMhg
 I+EeoNNfw0C86KvhQCCTkLsdkch1a7pK8OgQsnEZ47n1gFPjIqhAyjMeVJS+wZopizFt0L3W92AQ9
 LF3l26OiVOZ94mmFU0lF3WKAzH5IwVQXXhCvTxMZz+MdHdYmzr40Fmk+amyLJTM77+i0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RuqNRMF3EnAZDBbJ/HRat1w2quH3bBrYFTnwWL0OoMU=; b=F
 ZPw4UFgk+ibckYlB7h1/aq7MzJllCcD/yNXBEE7fmqQwFcsPs40OULZGnajez5CEIEwwC4M5bsksu
 rAX+B4g8UC7NyCt8Bw/Kk6/e6aC0DVvcOZsu2zRpyE+ZsdA87nhdizZaZtLOO404GfcvFIcxiXWYD
 xmIzqg7inhxbk9iA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOpQd-0005UG-L0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 03:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F336BA50463
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 03:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1241DC4CEEB;
 Tue, 10 Jun 2025 03:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749525204;
 bh=BSiQJhCcYWAN/A2STP7AiIic5RGj2SD+iwQKZkZYSFY=;
 h=From:To:Cc:Subject:Date:From;
 b=DkdQi2WRsVIrh1GetZHOeJHmKewjdez5k+KgwhiRO5+v23kAMrQKFoGe9k2QQLeob
 JyNeCA8YKh5sg/jZdX8gBkwzkqEMOKviPIvbX6fFwVGIw2nhYKiwvz+coEuksNnLw/
 3900DBQlbjr2OIGtvhTG7tAeUUBF3MtQPldqyDi0ZTnF2RbR2wD9Qqs2CIfKMPd/Hm
 X1IFH12TY+tBSQllYOH57h+itBSNJOdcmWr5xe2mKFzXQbgM5NP05sx8ZnRjh5F/uf
 hKcl84uxHpLN5ZM+yzQ4UvWHQ8g2uXuVkzRXjr4/rmwR65N/PRp7JyhGE9QNkG4aGq
 Ec1OboW8NP2VA==
To: jaegeuk@kernel.org
Date: Tue, 10 Jun 2025 11:13:15 +0800
Message-ID: <20250610031315.1067993-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS-fs (dm-55): access invalid blkaddr:972878540 Call trace:
 dump_backtrace+0xec/0x128 show_stack+0x18/0x28 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4 f2fs_is_v [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOpQd-0005UG-L0
Subject: [f2fs-dev] [PATCH] f2fs: do sanity check on fio.new_blkaddr in
 do_write_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS-fs (dm-55): access invalid blkaddr:972878540
Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4
 f2fs_is_valid_blkaddr+0x10/0x20
 f2fs_get_node_info+0x21c/0x60c
 __write_node_page+0x15c/0x734
 f2fs_sync_node_pages+0x4f8/0x700
 f2fs_write_checkpoint+0x4a8/0x99c
 __checkpoint_and_complete_reqs+0x7c/0x20c
 issue_checkpoint_thread+0x4c/0xd8
 kthread+0x11c/0x1b0
 ret_from_fork+0x10/0x20

If f2fs_allocate_data_block() fails, we may update nat.blkaddr w/
uninitialized fio.new_blkaddr.

- __write_node_folio
 - f2fs_do_write_node_page
  - do_write_page
   - f2fs_allocate_data_block
   : once it fails, it may not allocate new blkaddr
 - set_node_addr
 : update w/ uninitialized fio.new_blkaddr variable

I've checked all error paths in f2fs_allocate_data_block(), it should
be tagged w/ CP_ERROR_FLAG.

In addition, f2fs_allocate_data_block() succeeds, fio.new_blkaddr should
be valid.

Let's add f2fs_bug_on() to check above two conditions to detect any
potential bugs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dad5a92b7e70..5653716460ea 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3948,8 +3948,14 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		folio_end_writeback(folio);
 		if (f2fs_in_warm_node_list(fio->sbi, folio))
 			f2fs_del_fsync_node_entry(fio->sbi, folio);
+		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
+							CP_ERROR_FLAG));
 		goto out;
 	}
+
+	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr(fio->sbi,
+				fio->new_blkaddr, DATA_GENERIC_ENHANCE));
+
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
 		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr, 1);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
