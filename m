Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDDA16B64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2025 12:20:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZppD-0003mr-Di;
	Mon, 20 Jan 2025 11:20:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tZpp9-0003mU-QK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 11:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B1euPOla7Xdsh3TwEP/WynReSTQTfLAGf+bqiwcAiIc=; b=PYOtd1LSKYhvid8XjozD6F8z4M
 cy+oLkVecQzh55gug8rwWk0t45EnCDEw46OOcnruMBOfIgPCDJFjVyCTphSgW/vuv/c+upDZtKELL
 ApEutXQCxuhHrBa5G63lPxLQu2ltV37J6mxznCGsiW7sT6RvwXE3c+ME1HAQVR+SVb5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B1euPOla7Xdsh3TwEP/WynReSTQTfLAGf+bqiwcAiIc=; b=d
 Q5AYhxIFzsRCNkw0XhOY7cygEbpgTDTMIkcEF2VttnOLlLlSQBkBSu9/mORYcPs40GgONEiDRnQvm
 Cs/I0tbjN8VgOjieq+pcebyjKHzoGiiEQ0UuAgErp8kxQC96hLnFpVMkqiqyWGM/hxKutTcPTqK18
 /xNJN+AdtVXXjRgs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tZpp8-0005zi-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 11:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 620AFA40CEF;
 Mon, 20 Jan 2025 11:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6100DC4CEDD;
 Mon, 20 Jan 2025 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737371995;
 bh=TKs5CC+IL2ohkDXFCrAcHck72rKRy7TNOASh6xQP2po=;
 h=From:To:Cc:Subject:Date:From;
 b=XGKeAXT24/nsIcATkdDXBZD9LP9kevWQRac5VyzoXXCgRgrMjvCFxasJhVlbXaWga
 jvjyabmpt0O84HMpi4xwbVUM0pif5Y4sNqpCje4nE2tKfICwGOsYoNMnqPYNsaUelT
 vW6rez16cOR31LiYG22+GKsJ9R7VVnQ05IBPPGWN/Vja9A1fValpcdozgrNiO3kRk5
 aVDEHDkYt+b+XfYZGVBhxSMtKOHGLGChTj3deHXdUcYkzrgJuJ5N04bgr11aYD6otF
 gDrvJjGQKNdMsnijEaIuGUVThIBWsMHLPPFw7/e7m1G3Prr9P5e8NHHfgurdHOZn0h
 8fiLKYXrSddfA==
To: jaegeuk@kernel.org
Date: Mon, 20 Jan 2025 19:19:40 +0800
Message-ID: <20250120111941.191621-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported a f2fs bug as below: [ cut here ] kernel BUG
 at fs/f2fs/gc.c:373! CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 Not tainted
 6.13.0-rc3-syzkaller-00044-gaef25be35d23
 #0 RIP: 0010:get_cb_cost fs/f2fs/gc.c:37 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tZpp8-0005zi-R7
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to avoid return invalid mtime from
 f2fs_get_section_mtime()
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
Cc: syzbot+b9972806adbe20a910eb@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reported a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/gc.c:373!
CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 Not tainted 6.13.0-rc3-syzkaller-00044-gaef25be35d23 #0
RIP: 0010:get_cb_cost fs/f2fs/gc.c:373 [inline]
RIP: 0010:get_gc_cost fs/f2fs/gc.c:406 [inline]
RIP: 0010:f2fs_get_victim+0x68b1/0x6aa0 fs/f2fs/gc.c:912
Call Trace:
 <TASK>
 __get_victim fs/f2fs/gc.c:1707 [inline]
 f2fs_gc+0xc89/0x2f60 fs/f2fs/gc.c:1915
 f2fs_ioc_gc fs/f2fs/file.c:2624 [inline]
 __f2fs_ioctl+0x4cc9/0xb8b0 fs/f2fs/file.c:4482
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

w/ below testcase, it can reproduce directly:
- dd if=/dev/zero of=/tmp/file bs=1M count=64
- mkfs.f2fs /tmp/file
- mount -t f2fs -o loop,mode=fragment:block /tmp/file /mnt/f2fs
- echo 0 >  /sys/fs/f2fs/loop0/min_ssr_sections
- dd if=/dev/zero of=/mnt/f2fs/file bs=1M count=5
- umount /mnt/f2fs
- for((i=4096;i<16384;i+=512)) do inject.f2fs --sit 0 --blk $i --mb mtime --val -1 /tmp/file; done
- mount -o loop /tmp/file /mnt/f2fs
- f2fs_io gc 0 /mnt/f2fs/file

static unsigned int get_cb_cost()
{
	...
	mtime = f2fs_get_section_mtime(sbi, segno);
	f2fs_bug_on(sbi, mtime == INVALID_MTIME);
	...
}

The root cause is: mtime in f2fs_sit_entry can be fuzzed to INVALID_MTIME,
then it will trigger BUG_ON in get_cb_cost() during GC.

Let's change behavior of f2fs_get_section_mtime() as below for fix:
- return INVALID_MTIME only if total valid blocks is zero.
- return INVALID_MTIME - 1 if average mtime calculated is
INVALID_MTIME.

Fixes: b19ee7272208 ("f2fs: introduce f2fs_get_section_mtime")
Reported-by: syzbot+b9972806adbe20a910eb@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/6768c82e.050a0220.226966.0035.GAE@google.com
Cc: liuderong <liuderong@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 813254dcc00e..b3a82a8cdc5f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5549,8 +5549,10 @@ unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
 	secno = GET_SEC_FROM_SEG(sbi, segno);
 	start = GET_SEG_FROM_SEC(sbi, secno);
 
-	if (!__is_large_section(sbi))
-		return get_seg_entry(sbi, start + i)->mtime;
+	if (!__is_large_section(sbi)) {
+		mtime = get_seg_entry(sbi, start + i)->mtime;
+		goto out;
+	}
 
 	for (i = 0; i < usable_segs_per_sec; i++) {
 		/* for large section, only check the mtime of valid segments */
@@ -5563,7 +5565,11 @@ unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
 	if (total_valid_blocks == 0)
 		return INVALID_MTIME;
 
-	return div_u64(mtime, total_valid_blocks);
+	mtime = div_u64(mtime, total_valid_blocks);
+out:
+	if (unlikely(mtime == INVALID_MTIME))
+		mtime -= 1;
+	return mtime;
 }
 
 /*
-- 
2.48.1.262.g85cc9f2d1e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
