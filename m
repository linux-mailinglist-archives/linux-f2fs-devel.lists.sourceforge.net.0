Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83AAC62D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 09:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ff3Cx0GdhVj9T8W5oTAqmv729s+u7pcTFBahzRReBOU=; b=Olu6VN7K4JO6+pJUA3dNPMf7co
	+238QSenMJDufxEy+VKiFnyJwNAFz2iAcdudtR7YE4X5+PRr2HYd/4ALjv/H6dO7/mpoy4J1d6kay
	evvbVFWyYwB1AKuQuay7aMt8Gx7WmlpeXxtWDYSu80PUHDGuiFvfc5vtqmpnS3yR0Z4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKB67-0000vJ-7D;
	Wed, 28 May 2025 07:21:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uKB65-0000vB-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 07:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0XyV0jGiPKfC6JWiefDBCI8GptyLffmGk+RIAF9hlA=; b=RADGStnxmPnlTD4SWqmRmys+hK
 0LnWYDlVs9bVPabwpZYl1aJPQT7+jrjaMHb8KyThawhEaVSAwW2WyzX0JOPaGJRK/CikwDmOlKa1q
 6sMDQoNiqt9GdyE+yybWuncmhUbXWi9PWqyltYd2scESvF17sU59stekFA+xTUJ/EEsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A0XyV0jGiPKfC6JWiefDBCI8GptyLffmGk+RIAF9hlA=; b=K
 NaLBRRTQAOoAzf8ZHHjX6pDJT0wnt9cfc10x6LWKHdinVvdDySivHAnOD2feYi/o5F7hd54TKohc1
 BU1JG+WWzY/KRX6+opIIALCEUA9QKd29YJ2OQI96hL0XfJLbFYif9jzHfHkoteFIhlp8LA6Zp02oz
 OhDv1Dy3L/Cyho4Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKB60-0006aG-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 07:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 60B895C1024;
 Wed, 28 May 2025 07:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC39C4CEE7;
 Wed, 28 May 2025 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748416854;
 bh=1d1WGAVVXkGYDtw9DCPpZQCb5ZPBQACYubXaunIzu7M=;
 h=From:To:Cc:Subject:Date:From;
 b=fZ9QK7eYgWzXWJ9hea8LA7KkjNvlOYNMHolRXCAxRMhGFBDhcsMN/C4f8LiuPuC+b
 m9k61EsM13Hc0+mjExS0Q3k84NYuNYPaQvc65I3qZ4Y0TLBoNOMxY8wTyXCu+zCpLd
 fYtFEh7fOTftNV2Wtez4dY6xQhQ1H0eGvOogItcr3ggd6+ZzXIfLeweXWYH31WmWzy
 oNIZWYh18I2i+nx+YzydFJ4uSies36eGZqaYoNNxFK3ZYwzHRB1L3yCS40OMeU/mwk
 uhVyUg+xEbajwZ92z1/ZZqOh23dszT3yXu5uXH5bqJwy3c6sULP4j9rBMZP+Dqi6VO
 VistsSWQQylyQ==
To: jaegeuk@kernel.org
Date: Wed, 28 May 2025 15:20:45 +0800
Message-ID: <20250528072045.416898-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
MIME-Version: 1.0
X-Headers-End: 1uKB60-0006aG-R1
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on section
 ckpt_valid_blocks correctly
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
Cc: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot report a f2fs bug as below:

CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full)
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
 build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
 f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

sanity_check_valid_blocks() should be called after set_ckpt_valid_blocks()
in the loop, otherwise, @segno passed to sanity_check_valid_blocks() will
become invalid, fix it.

Fixes: 313d10d79a82 ("f2fs: add ckpt_valid_blocks to the section entry")
Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68345c8d.a70a0220.253bc2.0097.GAE@google.com
Cc: yohan.joung <yohan.joung@sk.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
Change v1:
- merge this into original patch is fine to me as well.
 fs/f2fs/segment.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..b77b5de71a48 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5054,10 +5054,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	if (__is_large_section(sbi)) {
 		unsigned int segno;
 
-		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
 			set_ckpt_valid_blocks(sbi, segno);
-
-		sanity_check_valid_blocks(sbi, segno);
+			sanity_check_valid_blocks(sbi, segno);
+		}
 	}
 
 	if (err)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
