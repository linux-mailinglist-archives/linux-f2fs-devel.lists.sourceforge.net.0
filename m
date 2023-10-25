Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4FE7D6662
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Oct 2023 11:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvZwy-0005U8-G9;
	Wed, 25 Oct 2023 09:13:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kazunori.kobayashi@miraclelinux.com>)
 id 1qvZwv-0005Tr-LD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 09:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xIELli7CNarBzKjciVCNTZMcEOSk0wgTFI+5haEbN1c=; b=IRjhn9iwK04ASGy/Z8B9KAHwKV
 xDXgmTZfRLGQjuGOLwffJF3w2M3JSsKNZzUsI4ouT4vjkSjcbieXVDN7K/6J21klOgjw2XlXFjNFy
 0G6Y5MEbgz6F2Ix/2Thw76sAmpD6/IjG5VttoXCTD+I3l8ig0AaeSz+7/gWtqXeOk9LU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xIELli7CNarBzKjciVCNTZMcEOSk0wgTFI+5haEbN1c=; b=Tu5Nx+mLucyZe0mlh7G5O1GcJb
 8b2tH1ygVYzWRDbprgBKNxqrtBMCZWeJ+/qrN4fUtnNd74wFuekO3uxoP9hCV5L/yhVLdSO4ciUXT
 T/jPIlaqLhtjKX0zsxlbIfm7BbD0YqmEDzpu6FRKNMzg+K28/gCmhka91JxTIQ1nVexY=;
Received: from 202x210x215x66.ap202.ftth.ucom.ne.jp ([202.210.215.66]
 helo=smtp.priv.miraclelinux.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qvZwu-0005fk-QB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 09:13:13 +0000
Received: from cip-lava-a.miraclelinux.com (cip-lava-a.miraclelinux.com
 [10.2.1.116])
 by smtp.priv.miraclelinux.com (Postfix) with ESMTP id 5E431140099;
 Wed, 25 Oct 2023 17:55:29 +0900 (JST)
From: Kazunori Kobayashi <kazunori.kobayashi@miraclelinux.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 25 Oct 2023 08:56:57 +0000
Message-Id: <20231025085657.11689-1-kazunori.kobayashi@miraclelinux.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> commit
 9056d6489f5a41cfbb67f719d2c0ce61ead72d9f
 upstream. As report by Wenqing Liu in bugzilla: 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_SORBS_DUL      RBL: SORBS: sent directly from dynamic IP
 address [202.210.215.66 listed in dnsbl.sorbs.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
X-Headers-End: 1qvZwu-0005fk-QB
Subject: [f2fs-dev] [PATCH 5.10] f2fs: fix to do sanity check on inode type
 during garbage collection
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
Cc: hiraku.toyooka@miraclelinux.com, stable@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

commit 9056d6489f5a41cfbb67f719d2c0ce61ead72d9f upstream.

As report by Wenqing Liu in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215231

- Overview
kernel NULL pointer dereference triggered  in folio_mark_dirty() when mount and operate on a crafted f2fs image

- Reproduce
tested on kernel 5.16-rc3, 5.15.X under root

1. mkdir mnt
2. mount -t f2fs tmp1.img mnt
3. touch tmp
4. cp tmp mnt

F2FS-fs (loop0): sanity_check_inode: inode (ino=49) extent info [5942, 4294180864, 4] is incorrect, run fsck to fix
F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=31340049, run fsck to fix.
BUG: kernel NULL pointer dereference, address: 0000000000000000
 folio_mark_dirty+0x33/0x50
 move_data_page+0x2dd/0x460 [f2fs]
 do_garbage_collect+0xc18/0x16a0 [f2fs]
 f2fs_gc+0x1d3/0xd90 [f2fs]
 f2fs_balance_fs+0x13a/0x570 [f2fs]
 f2fs_create+0x285/0x840 [f2fs]
 path_openat+0xe6d/0x1040
 do_filp_open+0xc5/0x140
 do_sys_openat2+0x23a/0x310
 do_sys_open+0x57/0x80

The root cause is for special file: e.g. character, block, fifo or socket file,
f2fs doesn't assign address space operations pointer array for mapping->a_ops field,
so, in a fuzzed image, SSA table indicates a data block belong to special file, when
f2fs tries to migrate that block, it causes NULL pointer access once move_data_page()
calls a_ops->set_dirty_page().

Cc: stable@vger.kernel.org
Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Kazunori Kobayashi <kazunori.kobayashi@miraclelinux.com>
---
 fs/f2fs/gc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8e4daee0171f..dfa99cd195b8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1451,7 +1451,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (phase == 3) {
 			inode = f2fs_iget(sb, dni.ino);
-			if (IS_ERR(inode) || is_bad_inode(inode)) {
+			if (IS_ERR(inode) || is_bad_inode(inode) ||
+					special_file(inode->i_mode)) {
 				set_sbi_flag(sbi, SBI_NEED_FSCK);
 				continue;
 			}
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
