Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F64FC6A9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 23:22:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ne1Tv-000549-4I; Mon, 11 Apr 2022 21:21:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ne1Tt-000543-Od
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lm/soXog0eiX/3+ndxodbf8CTPuIdGh6Sqv82JpofAE=; b=UTyI8pR1EVyZjo+bSbki0HlDA0
 DZv5J6JBVFS238ImDx9+EItjQT0LgJlKMmoKLhiZqKjDUTgw5cGEhdd5lXN60QOT5EbSh7V3pSKRC
 nV3kP1loKT6MBavLiwZ8A2Y1geZrn4XgZ2304gXLADDwqHiRwbzEuHQlG8xZv59xDIb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lm/soXog0eiX/3+ndxodbf8CTPuIdGh6Sqv82JpofAE=; b=k6qrmg/4ObjsTmT+VsGG81S7f9
 stgNb/BsB2LK8YAEs2l610zw5Z8Xbgo/a2KZIienS/zNnUX9EL5yYitNtaoJBhYyQfCq8MJEPc7JS
 SiLaSgCIYYtrsH5NGdRWXytG1p4kLNq1K/RnxVQqVExzt9r70CypPZa63oZ/Kem5A1Tc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ne1Tt-0008S5-PY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:21:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 310CE616DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Apr 2022 21:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAFFC385A4;
 Mon, 11 Apr 2022 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649712107;
 bh=gsIunwV9OVTYQPC6kZzO8ZN067jWFIRPVXs3S7CsLN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lYsCjOwC9Ty5ywC0RvLiOo8jCZgnvAbk5XWFxmcVFMM0glXuVxRgz0y2AOwbmIIjl
 Y6ID/1SX0Aj5JETA+peHl0N+f2DDMOnREDYlD94f8lhXXbyWJ+5L4Web/wN3ZBPfcf
 rC7AY9CUfK+YC2hpYBAk8SRWA6lNEwuHEaTleHtr6aF0Wplcn1nlAKsHcV1M4wW33h
 01j02wsy4JIzHRKpKncZCJN8gozh5tI+o+NdfYWpiqTLRK18ej6c4KoQCOpoLAedSw
 FR9DtFFkHlXysCBZueHEjjpMimONIiv9uy36JRqGRRsQVSfT6baSmOKb2e0Q/wTNxZ
 bYCup5/ItUPLw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Apr 2022 14:21:41 -0700
Message-Id: <20220411212141.1775589-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411212141.1775589-1-jaegeuk@kernel.org>
References: <20220411212141.1775589-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  xfstests/generic/475 can give EIO all the time which give
 an infinite loop to flush node page like below. Let's avoid it. [16418.518551]
 Call Trace: [16418.518553] ? dm_submit_bio+0x48/0x400 [16418.518574] ?
 submit_bio_checks+0x1ac/0x5a0
 [16418.525207] __submit_bio+0x1a9/0x230 [16418.525210] ?
 kmem_cache_alloc+0x29e/0x3c [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ne1Tt-0008S5-PY
Subject: [f2fs-dev] [PATCH 2/2] f2fs: avoid infinite loop to flush node pages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

xfstests/generic/475 can give EIO all the time which give an infinite loop
to flush node page like below. Let's avoid it.

[16418.518551] Call Trace:
[16418.518553]  ? dm_submit_bio+0x48/0x400
[16418.518574]  ? submit_bio_checks+0x1ac/0x5a0
[16418.525207]  __submit_bio+0x1a9/0x230
[16418.525210]  ? kmem_cache_alloc+0x29e/0x3c0
[16418.525223]  submit_bio_noacct+0xa8/0x2b0
[16418.525226]  submit_bio+0x4d/0x130
[16418.525238]  __submit_bio+0x49/0x310 [f2fs]
[16418.525339]  ? bio_add_page+0x6a/0x90
[16418.525344]  f2fs_submit_page_bio+0x134/0x1f0 [f2fs]
[16418.525365]  read_node_page+0x125/0x1b0 [f2fs]
[16418.525388]  __get_node_page.part.0+0x58/0x3f0 [f2fs]
[16418.525409]  __get_node_page+0x2f/0x60 [f2fs]
[16418.525431]  f2fs_get_dnode_of_data+0x423/0x860 [f2fs]
[16418.525452]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
[16418.525458]  ? __mod_memcg_state.part.0+0x2a/0x30
[16418.525465]  ? __mod_memcg_lruvec_state+0x27/0x40
[16418.525467]  ? __xa_set_mark+0x57/0x70
[16418.525472]  f2fs_do_write_data_page+0x10e/0x7b0 [f2fs]
[16418.525493]  f2fs_write_single_data_page+0x555/0x830 [f2fs]
[16418.525514]  ? sysvec_apic_timer_interrupt+0x4e/0x90
[16418.525518]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
[16418.525523]  f2fs_write_cache_pages+0x303/0x880 [f2fs]
[16418.525545]  ? blk_flush_plug_list+0x47/0x100
[16418.525548]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
[16418.525569]  do_writepages+0xd5/0x210
[16418.525648]  filemap_fdatawrite_wbc+0x7d/0xc0
[16418.525655]  filemap_fdatawrite+0x50/0x70
[16418.525658]  f2fs_sync_dirty_inodes+0xa4/0x230 [f2fs]
[16418.525679]  f2fs_write_checkpoint+0x16d/0x1720 [f2fs]
[16418.525699]  ? ttwu_do_wakeup+0x1c/0x160
[16418.525709]  ? ttwu_do_activate+0x6d/0xd0
[16418.525711]  ? __wait_for_common+0x11d/0x150
[16418.525715]  kill_f2fs_super+0xca/0x100 [f2fs]
[16418.525733]  deactivate_locked_super+0x3b/0xb0
[16418.525739]  deactivate_super+0x40/0x50
[16418.525741]  cleanup_mnt+0x139/0x190
[16418.525747]  __cleanup_mnt+0x12/0x20
[16418.525749]  task_work_run+0x6d/0xa0
[16418.525765]  exit_to_user_mode_prepare+0x1ad/0x1b0
[16418.525771]  syscall_exit_to_user_mode+0x27/0x50
[16418.525774]  do_syscall_64+0x48/0xc0
[16418.525776]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |  8 +-------
 fs/f2fs/f2fs.h       | 20 ++++++++++++++++----
 fs/f2fs/node.c       |  1 +
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ed61ac99a3cf..a1aa6b8f2ed2 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -98,13 +98,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 	}
 
 	if (unlikely(!PageUptodate(page))) {
-		if (page->index == sbi->metapage_eio_ofs) {
-			if (sbi->metapage_eio_cnt++ == MAX_RETRY_META_PAGE_EIO)
-				set_ckpt_flags(sbi, CP_ERROR_FLAG);
-		} else {
-			sbi->metapage_eio_ofs = page->index;
-			sbi->metapage_eio_cnt = 0;
-		}
+		f2fs_handle_page_eio(sbi, page->index, META);
 		f2fs_put_page(page, 1);
 		return ERR_PTR(-EIO);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9c72a91912ae..2d10f1c8ed12 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -579,8 +579,8 @@ enum {
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
-/* maximum retry of EIO'ed meta page */
-#define MAX_RETRY_META_PAGE_EIO			100
+/* maximum retry of EIO'ed page */
+#define MAX_RETRY_PAGE_EIO			100
 
 #define F2FS_LINK_MAX	0xffffffff	/* maximum link count per file */
 
@@ -1621,8 +1621,8 @@ struct f2fs_sb_info {
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
 	mempool_t *write_io_dummy;		/* Dummy pages */
-	pgoff_t metapage_eio_ofs;		/* EIO page offset */
-	int metapage_eio_cnt;			/* EIO count */
+	pgoff_t page_eio_ofs[NR_PAGE_TYPE];	/* EIO page offset */
+	int page_eio_cnt[NR_PAGE_TYPE];		/* EIO count */
 
 	/* for checkpoint */
 	struct f2fs_checkpoint *ckpt;		/* raw checkpoint pointer */
@@ -4538,6 +4538,18 @@ static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
 }
 
+static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
+					enum page_type type)
+{
+	if (ofs == sbi->page_eio_ofs[type]) {
+		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO)
+			set_ckpt_flags(sbi, CP_ERROR_FLAG);
+	} else {
+		sbi->page_eio_ofs[type] = ofs;
+		sbi->page_eio_cnt[type] = 0;
+	}
+}
+
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index fe8c38c9ac77..87f1a8364f21 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1416,6 +1416,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 
 	err = read_node_page(page, 0);
 	if (err < 0) {
+		f2fs_handle_page_eio(sbi, page->index, NODE);
 		f2fs_put_page(page, 1);
 		return ERR_PTR(err);
 	} else if (err == LOCKED_PAGE) {
-- 
2.35.1.1178.g4f1659d476-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
