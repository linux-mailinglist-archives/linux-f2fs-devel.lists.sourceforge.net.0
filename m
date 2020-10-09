Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436C288161
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 06:31:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQk4Q-0000Cg-7B; Fri, 09 Oct 2020 04:31:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kQk4N-0000CX-D0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqxzwskjQUJ/AgY1eGzwIaJpbj1CKsJgIHeVpIjmkxc=; b=djKyWZPbciKQ8eyv3robXQxZhH
 xn1sT5iduK3thRncO6YpV99QHd3pOMdL4OAGhg3FHmkgcpOCd8VcBOnK0/QAafSGbW0aTNZBfFuCn
 WQ/bX86j7UntZrzdLPu+PxdqWYv4yWYTLMZpjy0JxF82lCdGVTfN1NHUgPu63U+K9lSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oqxzwskjQUJ/AgY1eGzwIaJpbj1CKsJgIHeVpIjmkxc=; b=Pmrf+tiNv2ntBuL8LHyUqoYJU4
 gq6oBniPrzoJBRQ+3UQGXtWhw7TLBxp3LNGsbllAvJI8RwfbOKvLCkW3tS1F3rraZcXj864Cqwda6
 7N0L+Q0Rk1nA9U/hbhiUxXbLg2vOinH4cmVQ8CETbIppiMhAexJupFaVTz/aenCOv8A0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQk4D-003kwm-BO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:31:51 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3F752223C;
 Fri,  9 Oct 2020 04:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602217895;
 bh=lcMTEuAIauNFQXeQzLSIjhCNIZtoQDsUjhK/lQf6OyA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UbCEniWMvoHXgwziU5NGi+hgCEK34a0+Mvs3pcgo4vyML15VLaMdD/OTT9X9gcPye
 hqc/YbhRax+0m+dZBQRnG/7SwQC8hv5fJjz4FBrVxm1MyjFerN/6+K0t1KN26wqeOU
 AwkjERcQVIiAT2xouKH7FJ3SmglpHquFBKigBnUA=
Date: Thu, 8 Oct 2020 21:31:35 -0700
From: jaegeuk@kernel.org
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20201009043135.GA1973455@google.com>
References: <20201002213226.2862930-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002213226.2862930-1-jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: appspotmail.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQk4D-003kwm-BO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: f2fs_get_meta_page_nofail should
 not be failed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, f2fs can break the the consistency.
(e.g., BUG_ON in f2fs_get_sum_page)

Then, this reveals another issue where we go into an infinite loop on normal
error case. It turns out we abused f2fs_get_meta_page_nofail() in this path.

- f2fs_fill_super
 - f2fs_build_segment_manager
  - build_sit_entries
   - get_current_sit_page

Actually, we didn't have to use _nofail in this case, since we could return
error to mount(2) already with the error handler.

This was caught by syzbot as follows.

INFO: task syz-executor178:6870 can't die for more than 143 seconds.
task:syz-executor178 state:R
 stack:26960 pid: 6870 ppid:  6869 flags:0x00004006
Call Trace:

Showing all locks held in the system:
1 lock held by khungtaskd/1179:
 #0: ffffffff8a554da0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6242
1 lock held by systemd-journal/3920:
1 lock held by in:imklog/6769:
 #0: ffff88809eebc130 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:930
1 lock held by syz-executor178/6870:
 #0: ffff8880925120e0 (&type->s_umount_key#47/1){+.+.}-{3:3}, at: alloc_super+0x201/0xaf0 fs/super.c:229

Reported-by: syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

v2 log:
 - fix syzbot issue

 fs/f2fs/checkpoint.c | 9 +++------
 fs/f2fs/f2fs.h       | 2 --
 fs/f2fs/segment.c    | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f18386d30f031..7bb3a741a8f16 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -110,15 +110,12 @@ struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
 struct page *f2fs_get_meta_page_nofail(struct f2fs_sb_info *sbi, pgoff_t index)
 {
 	struct page *page;
-	int count = 0;
-
 retry:
 	page = __get_meta_page(sbi, index, true);
 	if (IS_ERR(page)) {
-		if (PTR_ERR(page) == -EIO &&
-				++count <= DEFAULT_RETRY_IO_COUNT)
-			goto retry;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_flush_merged_writes(sbi);
+		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		goto retry;
 	}
 	return page;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ae46d44bd5211..ce79b9b5b1eff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -593,8 +593,6 @@ enum {
 					 */
 };
 
-#define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO count */
-
 /* congestion wait timeout value, default: 20ms */
 #define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 13ecd2c2c361b..40001d80fa86d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3964,7 +3964,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 static struct page *get_current_sit_page(struct f2fs_sb_info *sbi,
 					unsigned int segno)
 {
-	return f2fs_get_meta_page_nofail(sbi, current_sit_addr(sbi, segno));
+	return f2fs_get_meta_page(sbi, current_sit_addr(sbi, segno));
 }
 
 static struct page *get_next_sit_page(struct f2fs_sb_info *sbi,
-- 
2.28.0.1011.ga647a8990f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
