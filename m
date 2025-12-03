Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36BC9E6F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 10:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KU4p97xXow0Y36Zk8mTCKxmcsIiozaRJQX9RP6kqPWw=; b=b0ak7NgrZ+QmIlRyI5evoZuGh5
	x7ekyoTjZWkM87l+K9gccCMSgJ0+E5TBtC4gbqH/rRl5jQnOnh2PmCGVnEP00AlOAkoz90C706KMN
	mhf/ZP1QL4vENhGybBVO+DzdiV3dVUOqlm/A006y67mvzlTPVjZ004x7fs1TDNek8Tx4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQizU-0005wl-3G;
	Wed, 03 Dec 2025 09:17:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vQizS-0005wc-05
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 09:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ajoBRUTBt71ZYOJqir81AKyXdIAqrTQbJpFRp3cR2EY=; b=ZfK2kOnJbHO6BuM/PCGzkO1mlH
 XKkk13YMQSQKNyKR5Knf0R3GD4N7EzOteO/GJslcnReB9QWfBRQlIkiZpvMdP3CfV3yRCzRrK1HX1
 M/uJlzTJYFDSwmUdrwPJgHsVoDHaDznbDTT0AemgR6AezR6MFoCFxIxNHc2+9L2Cf4gE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ajoBRUTBt71ZYOJqir81AKyXdIAqrTQbJpFRp3cR2EY=; b=K
 mbBZDk9BmIrc/74HQgHNLIptqXCSpNcoC/mIKi8gT4nNitHnMQZDNBaXJNi3d3wmeQyQ7J/OvbHQL
 6MPdJk/rsJYq6u3uYt9S1hM/v1cH8jzjejClNRU9piG/86dLpq42sc3b+tTl3pcMzF6Yc1pyTkGsZ
 I38RhW6VrHUEkfWc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQizQ-00040S-Fc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 09:17:37 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 5B38wUfC091391
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 3 Dec 2025 16:58:30 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 5B38vh44085996;
 Wed, 3 Dec 2025 16:57:43 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dLryr0SR1z2KcbFD;
 Wed,  3 Dec 2025 16:53:40 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 3 Dec 2025 16:57:41 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 3 Dec 2025 16:56:19 +0800
Message-ID: <1764752179-1936-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 5B38vh44085996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1764752274;
 bh=ajoBRUTBt71ZYOJqir81AKyXdIAqrTQbJpFRp3cR2EY=;
 h=From:To:CC:Subject:Date;
 b=OWZyw+3yelMcNSxdwCldYu1MDnBKLXszhsGySqaCxkF0pY5tXJGB1X48ZEzKil/ay
 Ioxbt/Cws49lgWIj1aIrk3oq4rNwyEV4eY+hM6gqHhvgPT3GpD0VhlBp9DtQzr2KQm
 Pmqi1Q5A0u6odzEoiI5OaVi/kWMoRecmVhE+4HRNyZ7o5VY8ZDgGYEMw5EmnUmPeH4
 ilIrabJ5Y0bp7bMIDU1DGrdRgrFegavoxq5qjxTXekfigc6OHpN9h6sEb90GcX2yAX
 RtKG8/FspFQa5aYyx/GuAAdKwoDSBPSYQlRJYRBYu2W9LcBOFYMOGleA68HOUhMa1P
 ZmX2FQEpLNmDQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I'm currently encountering the same issue as shown in commit
 bbf9f7d90f21e ("f2fs: Fix indefinite loop in f2fs_gc()"), but this commit
 only works when CONFIG_F2FS_CHECK_FS is enabled and blkaddr check [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vQizQ-00040S-Fc
Subject: [f2fs-dev] [PATCH RFC] f2fs: fix infinite foreground gc loop in
 f2fs_gc
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I'm currently encountering the same issue as shown in
commit bbf9f7d90f21e ("f2fs: Fix indefinite loop in f2fs_gc()"),
but this commit only works when CONFIG_F2FS_CHECK_FS is enabled
and blkaddr check fails. This doesn't seem to cover all
!is_alive cases, and CONFIG_F2FS_CHECK_FS is currently disabled
on Android devices.

Here's the problem flow:
1. Some high-pressure read/write/random power-down tests corrupted
the content of the nid=4 entry in the NAT block. ino/bock_addr are
both corrupted to 0, and the mount log also indicates this.
crash_arm64> f2fs_nat_block ffffff8097bfe000 -x
      version = 0x0,
      ino = 0x3,
      block_addr = 0x86da9
    }, {
      version = 0x0,
      ino = 0x0,
      block_addr = 0x0
[    6.495406] F2FS-fs (dm-56): quota file may be corrupted, skip loading it
2. Insufficient free space triggers foreground garbage collection (GC) during boot.
crash_arm64> bt 1
PID: 1        TASK: ffffff80801cec00  CPU: 6    COMMAND: "init"
[ffffffc00806b870] rwsem_read_trylock at ffffffc00826d5c8
[ffffffc00806b980] gc_data_segment at ffffffc0088a2720
[ffffffc00806ba40] do_garbage_collect at ffffffc0088a21d8
[ffffffc00806bb60] f2fs_gc at ffffffc0088a17ac
[ffffffc00806bbf0] f2fs_balance_fs at ffffffc0088cbf44
[ffffffc00806bc20] f2fs_setattr at ffffffc00885e67c
[ffffffc00806bc70] notify_change at ffffffc008610ae0
[ffffffc00806bd30] chown_common at ffffffc0085c8a3c
[ffffffc00806bdb0] do_fchownat at ffffffc0085c9154
[ffffffc00806be00] __arm64_sys_fchownat at ffffffc0085c908c
[ffffffc00806be20] invoke_syscall at ffffffc0081221b4
[ffffffc00806be40] el0_svc_common at ffffffc008122114

Infinite GC loop causes critical processes to be blocked, preventing
the device from booting up properly.
3. The GC process enters an infinite loop because the victim segment
contains a data block belongs to nid=4, but the is_alive check fails
as the following calling flow:
is_alive->f2fs_get_node_page->__get_node_page->read_node_page return -ENOENT
This will prevent the data in this segment from being completely migraged out.
4. This segment has low cost, which is chosen for GC again in next time.

Although the problem should be addressed by finding the cause of
NAT block corruption, but this will prevent the device from booting up.
This patch records each `!is_alive` case as an invalid
segment to avoid selecting the same one in next time.
BTW, some debug information output has been enhanced in is_alive.

Cc: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/gc.c      | 32 +++++++++++++++-----------------
 fs/f2fs/segment.c |  6 ++----
 fs/f2fs/segment.h |  3 +--
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 384fa7e..a95ade9 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -872,7 +872,6 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		p.offset = segno + p.ofs_unit;
 		nsearched++;
 
-#ifdef CONFIG_F2FS_CHECK_FS
 		/*
 		 * skip selecting the invalid segno (that is failed due to block
 		 * validity check failure during GC) to avoid endless GC loop in
@@ -880,7 +879,6 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		 */
 		if (test_bit(segno, sm->invalid_segmap))
 			goto next;
-#endif
 
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
@@ -1145,16 +1143,19 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	unsigned int ofs_in_node, max_addrs, base;
 	block_t source_blkaddr;
 
+	unsigned int segno = GET_SEGNO(sbi, blkaddr);
 	nid = le32_to_cpu(sum->nid);
 	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
 
 	node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
-	if (IS_ERR(node_folio))
-		return false;
+	if (IS_ERR(node_folio)) {
+		f2fs_err(sbi, "get_node_folio err(%ld) for nid(%u)", PTR_ERR(node_folio), nid);
+		goto check_invalid;
+	}
 
 	if (f2fs_get_node_info(sbi, nid, dni, false)) {
 		f2fs_folio_put(node_folio, true);
-		return false;
+		goto check_invalid;
 	}
 
 	if (sum->version != dni->version) {
@@ -1165,7 +1166,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	if (f2fs_check_nid_range(sbi, dni->ino)) {
 		f2fs_folio_put(node_folio, true);
-		return false;
+		goto check_invalid;
 	}
 
 	if (IS_INODE(node_folio)) {
@@ -1180,7 +1181,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		f2fs_err(sbi, "Inconsistent blkaddr offset: base:%u, ofs_in_node:%u, max:%u, ino:%u, nid:%u",
 			base, ofs_in_node, max_addrs, dni->ino, dni->nid);
 		f2fs_folio_put(node_folio, true);
-		return false;
+		goto check_invalid;
 	}
 
 	*nofs = ofs_of_node(node_folio);
@@ -1188,21 +1189,18 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	f2fs_folio_put(node_folio, true);
 
 	if (source_blkaddr != blkaddr) {
-#ifdef CONFIG_F2FS_CHECK_FS
-		unsigned int segno = GET_SEGNO(sbi, blkaddr);
 		unsigned long offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
-
 		if (unlikely(check_valid_map(sbi, segno, offset))) {
-			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
-				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
-					 blkaddr, source_blkaddr, segno);
-				set_sbi_flag(sbi, SBI_NEED_FSCK);
-			}
+			f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
+				blkaddr, source_blkaddr, segno);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			goto check_invalid;
 		}
-#endif
-		return false;
 	}
 	return true;
+check_invalid:
+	set_bit(segno, SIT_I(sbi)->invalid_segmap);
+	return false;
 }
 
 static int ra_data_block(struct inode *inode, pgoff_t index)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8375dca..6a55e20 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -826,9 +826,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		if (valid_blocks == 0) {
 			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
 						dirty_i->victim_secmap);
-#ifdef CONFIG_F2FS_CHECK_FS
 			clear_bit(segno, SIT_I(sbi)->invalid_segmap);
-#endif
 		}
 		if (__is_large_section(sbi)) {
 			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
@@ -4899,12 +4897,12 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 					sit_bitmap_size, GFP_KERNEL);
 	if (!sit_i->sit_bitmap_mir)
 		return -ENOMEM;
+#endif
 
 	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
 					main_bitmap_size, GFP_KERNEL);
 	if (!sit_i->invalid_segmap)
 		return -ENOMEM;
-#endif
 
 	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
 	sit_i->sit_blocks = SEGS_TO_BLKS(sbi, sit_segs);
@@ -5862,8 +5860,8 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 	kfree(sit_i->sit_bitmap);
 #ifdef CONFIG_F2FS_CHECK_FS
 	kfree(sit_i->sit_bitmap_mir);
-	kvfree(sit_i->invalid_segmap);
 #endif
+	kvfree(sit_i->invalid_segmap);
 	kfree(sit_i);
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 07dcbcb..2437a7e2 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -211,10 +211,9 @@ struct sit_info {
 	char *sit_bitmap;		/* SIT bitmap pointer */
 #ifdef CONFIG_F2FS_CHECK_FS
 	char *sit_bitmap_mir;		/* SIT bitmap mirror */
-
+#endif
 	/* bitmap of segments to be ignored by GC in case of errors */
 	unsigned long *invalid_segmap;
-#endif
 	unsigned int bitmap_size;	/* SIT bitmap size */
 
 	unsigned long *tmp_map;			/* bitmap for temporal use */
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
