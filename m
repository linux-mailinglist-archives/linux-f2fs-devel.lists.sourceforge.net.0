Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A5601E40
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 02:08:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oka9z-00052f-MZ;
	Tue, 18 Oct 2022 00:08:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1oka9x-00052W-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=osyWWN+U3GmQbI8q1uhaWJ4HRxQIaetgXsxCmMMhiwk=; b=OSROnMOUmGY0dLT4PEqD1iULM4
 /L9zfgqIw1TaD43zIl65J9mtABZYpRIDVFlnBjArFjreO+yetNpYTlIEoLsFXUZ9jnRoKcs2pp2ZU
 bRjcY8hFFoBWAknnF/1wgQWEaA6lmv3CUjLWWyWGVc3WYthYp6owBm5OuAtc+pNRLS+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=osyWWN+U3GmQbI8q1uhaWJ4HRxQIaetgXsxCmMMhiwk=; b=h0OdDwsDSrSVkgx5ShC8HSWL0R
 3bisoZ+8KmbkK2vKt6CkWQVyNHc/ewA3M5DqVXZxoJ4HtjAHuDv1CftS2YJbJIo7TU7rI2sCwnFKo
 jAhRMndNrmNrEkhaWszaWfgcVkm2zIttpKG7M6V91Cf7kjfg22b8EtL2EJaXYamEOhVo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oka9w-0001zR-Jz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:08:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B71061324;
 Tue, 18 Oct 2022 00:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787D7C433D7;
 Tue, 18 Oct 2022 00:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666051707;
 bh=I3GLPK0WFhPsxDMDC5son/+AwQqpDdM1jgXLEctMlaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dMedekVaFOV1cGgqLM0mTMw/85nN+daqrUL9cGuL69gFbt77BGqizgdqoyeALl0px
 QjodY9VC9RG5Q3jh80+d7EZ2sGbzJObZN3PTFmIHv2qb5MHDQUjSjOjpoMIrAGZ0u6
 m4pFGUdGn404NGe5wDa6wtHn8CRI1Pe7JP/DYa1yhl0ZblnorEgMW7iCnBg+Z86N3Y
 023O+e8CText41hLuzwlY3+2DRChrF3FdRZu2x9t4228FbA7pokrZVMTXfHf1uTwhh
 GYDY2ucLGwWQ33n0+ZEgdGLuD52NCVyfzPxI5fWSvcPYWVYg6vYmjRcSVtdgOYSjPi
 nnlBmH/yR3W/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:07:22 -0400
Message-Id: <20221018000729.2730519-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000729.2730519-1-sashal@kernel.org>
References: <20221018000729.2730519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Zhang Qilong <zhangqilong3@huawei.com> [ Upstream
 commit
 544b53dadc208278fd0796f2c22ea24a3fe16564 ] ERROR: code indent should use
 tabs where possible ERROR: spaces required around that ':' ERROR: incorrect
 tab Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oka9w-0001zR-Jz
Subject: [f2fs-dev] [PATCH AUTOSEL 6.0 25/32] f2fs: code clean and fix a
 type error
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhang Qilong <zhangqilong3@huawei.com>

[ Upstream commit 544b53dadc208278fd0796f2c22ea24a3fe16564 ]

ERROR: code indent should use tabs where possible
ERROR: spaces required around that ':'
ERROR: incorrect tab

Found serveral code type errors when review the code and fix it.
There is no function change.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c         | 2 +-
 fs/f2fs/debug.c        | 2 +-
 fs/f2fs/extent_cache.c | 2 +-
 fs/f2fs/file.c         | 2 +-
 fs/f2fs/node.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 16c39bd948a0..252938419ef0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -723,7 +723,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, page, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(page): WB_DATA_TYPE(fio->page));
+			__read_io_type(page) : WB_DATA_TYPE(fio->page));
 
 	__submit_bio(fio->sbi, bio, fio->type);
 	return 0;
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c01471573977..29cf5b6b2341 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -347,7 +347,7 @@ static int stat_show(struct seq_file *s, void *v)
 
 		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
 			si->sbi->sb->s_bdev, i++,
-			f2fs_readonly(si->sbi->sb) ? "RO": "RW",
+			f2fs_readonly(si->sbi->sb) ? "RO" : "RW",
 			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
 			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
 		if (si->sbi->s_flag) {
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 866e72b29bd5..d6b4a1c8ed2f 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -583,7 +583,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 		org_end = dei.fofs + dei.len;
 		f2fs_bug_on(sbi, pos >= org_end);
 
-		if (pos > dei.fofs &&	pos - dei.fofs >= F2FS_MIN_EXTENT_LEN) {
+		if (pos > dei.fofs && pos - dei.fofs >= F2FS_MIN_EXTENT_LEN) {
 			en->ei.len = pos - en->ei.fofs;
 			prev_en = en;
 			parts = 1;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce4905a073b3..ab9844eaa62c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4619,7 +4619,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 skip_write_trace:
 		/* Do the actual write. */
 		ret = dio ?
-			f2fs_dio_write_iter(iocb, from, &may_need_sync):
+			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
 			f2fs_buffered_write_iter(iocb, from);
 
 		if (trace_f2fs_datawrite_end_enabled())
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3506ffcb31f8..cc832ad995ce 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -585,7 +585,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		ne = nat_in_journal(journal, i);
 		node_info_from_raw_nat(ni, &ne);
 	}
-        up_read(&curseg->journal_rwsem);
+	up_read(&curseg->journal_rwsem);
 	if (i >= 0) {
 		f2fs_up_read(&nm_i->nat_tree_lock);
 		goto cache;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
