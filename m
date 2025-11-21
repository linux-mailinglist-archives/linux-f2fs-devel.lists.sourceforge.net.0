Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50076C76FB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 03:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+BgO/n1chTWYF9Y2+RgiedcwN6SCOhcikvpsMpqfSI=; b=EGF3zcob3NNCbnZDmqik2apoZT
	9xESwds3d5VafWIMmCt1fnxVsdTFbc6JtSnxpd6rehXre+X+IGmZHqrKuJp5UIHohGIbhhOqRZfwW
	DPOq6pRyeGy7eIPyDWNS6F6Wh7HVesPhaWkp8Q5P+ORuOYq3pghZOJStoq80l1ysndNg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMGg7-0003mO-Jq;
	Fri, 21 Nov 2025 02:15:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vMGfu-0003ly-RQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 02:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a9jLvWbsTWAt6U4QML8nPhxeEZeW2viITAJLzIZhP7I=; b=AdvLqPxH71KMZPm2Dxg/xQ/ThE
 0jfQ+45QR++0KYAUxeojxzVguRd6KtTU8tE8CUIhnReqF4k3MoByKFClO9f0dD0kaboxXF8neSW1z
 DTG0OW2HwRk0uPidyJpgoOXrPyDVqUh1G5i1sWzAERTlp0kLyzIHefodg4q90+HnPrgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a9jLvWbsTWAt6U4QML8nPhxeEZeW2viITAJLzIZhP7I=; b=V
 RALRcp8rkoOPDoyYUigMCusjyxt6jgpoD/N6RV2Y00uH12PcpXgzM9RTo7QslalYEWZxde7NfCTjY
 O1dFuEviP5Gv4YGrTHzOY7V0j6e9+zSUkWnmbtYzZOPtP6ODnJRWZooq1J5l8yTHL7J4hWpPAR3Y3
 GldhiLt8QUTh900w=;
Received: from m16.mail.126.com ([220.197.31.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMGft-0007Sn-SY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 02:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=a9
 jLvWbsTWAt6U4QML8nPhxeEZeW2viITAJLzIZhP7I=; b=Lyu3KxDxvMOXYn6/GT
 x/XaIp+04npnnH6Nbp6yLCbTwfK9jk2MjAbIHpCmm8AThxgcDtvfnmo7hKVBrEgV
 WrLX9J5RPnXUSepV3eqUT37Kt1SB1yMLqrXIEHezjdJduX64/cZJoo3gHh7ptHxI
 xPQhBqL5GxVbDMOC0VZ2Cbuso=
Received: from hpz640.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3P3_Zyh9pPW7dAA--.33133S2; 
 Fri, 21 Nov 2025 10:13:46 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 10:13:42 +0800
Message-ID: <20251121021342.28133-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P3_Zyh9pPW7dAA--.33133S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW5Jr4fXrW3Ww4DXw4xJFb_yoW8CFW8pF
 nrCayq9F1rJw18Z3s7Jan3ta4Fv3yqgFs7CrZ7Ww1Fv3ZxZws3Z348t34Fyrn8WrykZFya
 qa4Y9a15ur47ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRco7_UUUUU=
X-Originating-IP: [202.110.209.182]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1S2mOxMLBmkdr+3N6wACs3
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. Fix typo in HAVE_PREAD macro check (lib/libf2fs_io.c:403):
 - Change HAVE_RPEAD -> HAVE_PREAD - The misspelled macro caused pread()
 optimization
 to never be used, forcing the code to always use the [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vMGft-0007Sn-SY
Subject: [f2fs-dev] [PATCH v1] f2fs-tools: fix typo of HAVE_PREAD macro and
 remove duplicate semicolons
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, Xiaole He <hexiaole1994@126.com>,
 daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. Fix typo in HAVE_PREAD macro check (lib/libf2fs_io.c:403):
   - Change HAVE_RPEAD -> HAVE_PREAD
   - The misspelled macro caused pread() optimization to never be used,
     forcing the code to always use the slower lseek() + read() path
     instead of the atomic pread() call.

2. Remove duplicate semicolons:
   - mkfs/f2fs_format.c:211: Remove extra semicolon in hot_ext_count assignment
   - fsck/dump.c:119: Remove extra semicolon in free_segs initialization

These are minor code quality fixes that don't change functionality but
improve code correctness and enable the pread() optimization.

Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
 fsck/dump.c        | 2 +-
 lib/libf2fs_io.c   | 2 +-
 mkfs/f2fs_format.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 21de2ac..f5c95de 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -116,7 +116,7 @@ void sit_dump(struct f2fs_sb_info *sbi, unsigned int start_sit,
 	struct sit_info *sit_i = SIT_I(sbi);
 	unsigned int segno;
 	char buf[BUF_SZ];
-	u32 free_segs = 0;;
+	u32 free_segs = 0;
 	u64 valid_blocks = 0;
 	int ret;
 	int fd, i;
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 2030440..c31f3b8 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -400,7 +400,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 {
 	if (c.sparse_mode)
 		return 0;
-#ifdef HAVE_RPEAD
+#ifdef HAVE_PREAD
 	if (pread(c.kd, buf, len, (off_t)offset) < 0)
 		return -1;
 #else
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 6deb671..d05e897 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -208,7 +208,7 @@ static void cure_extension_list(void)
 		if (i == 0)
 			set_sb(extension_count, pos);
 		else
-			sb->hot_ext_count = pos - get_sb(extension_count);;
+			sb->hot_ext_count = pos - get_sb(extension_count);
 
 		if (!ext_str)
 			continue;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
