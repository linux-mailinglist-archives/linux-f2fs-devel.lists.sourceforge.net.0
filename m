Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 466FEC770A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 03:43:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIOLN8y8e4V4bf1b1HL+xgux9Sqm+8VBJusgHckyN+8=; b=Sv5QQO9eS2KBTmccOxVa57oICb
	hVrlNYxrSxzyAkfUVcFNpwWS/NaU0SN388ZUAiuRkmARjG1MfPc3sq/ztUZJj37/RXwLn0vlpNcZ0
	IUF5Pbdwchyz86LrDxMtGud4Eba5pnUBR8IkoiLqJpvE4A4wRJplBXfc9HEn5QqpRW7M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMH7f-00060S-6N;
	Fri, 21 Nov 2025 02:43:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vMH7d-00060M-1x
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 02:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XEvxk/9TfGchO2vHqKGTKBBr5WMqPsOQocLXVTgOaRw=; b=R/7p5bzVX+mxEHNs3o0mRqxKpE
 4S7N7qm4ibNGJqWor5PxqeGYd0EooqwFzHQQPKPTuzKId49jhm1rnFApUmrHRWUYWnr9/px5LsCGZ
 D6Q+axlPOfm3neE9F9FgLEtM9rlgPjvKTq3JdFo8goWREZNTDTavyPVrK3x5V+s4KLZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XEvxk/9TfGchO2vHqKGTKBBr5WMqPsOQocLXVTgOaRw=; b=J4g25ZYtg6QZb2p4P1YPOmcOkV
 nb85tCYcqUKfdAGD4MXwm4J+Ja4FG+lHzW1RaByIB5uDbTtcMVDgIY/qDjCs/HFznXqMDt1vA5Q2i
 Mfu9kcb02lBePrkQY2xqLlupFaZx1Dxfy+kpCr+kr84TP1mTQgsV3POHna7axNJjrQck=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMH7c-0000mq-9I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 02:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=XE
 vxk/9TfGchO2vHqKGTKBBr5WMqPsOQocLXVTgOaRw=; b=kfAPATmEViiw+SnxkO
 ZRPgXvye5QjoTg8VSU8VIiUm03rC2OAPoDS05cvqoz+KFZ0q/xQWr/JRK0YnycUN
 htZs+sjaN6kg/BToCliAixLb1heF4lH7D/J2hJ7wLp60chCAQo1EU4xSHlHUcmtq
 D6pcFWFzNNG4juFaPssRU0bcE=
Received: from hpz640.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wDnH4mO0R9phKLeAA--.35077S2; 
 Fri, 21 Nov 2025 10:42:23 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 10:42:20 +0800
Message-ID: <20251121024220.29307-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121021342.28133-1-hexiaole1994@126.com>
References: <20251121021342.28133-1-hexiaole1994@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnH4mO0R9phKLeAA--.35077S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW5Jr4fXrW3Ww4DXw4xJFb_yoW8ZFykpF
 nrGFyq9r1rJw1xZ3s7J3WrtFyFk3yqgFs7Crs7Ww1Fy3W3Zws3A348t340yrn8WrZ7ZFya
 qa4Y9w45Cr47ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRBwZxUUUUU=
X-Originating-IP: [202.110.209.182]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbieggNBmkfz0I58wAAsI
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.9 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vMH7c-0000mq-9I
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: fix typo of HAVE_PREAD macro and
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
Cc: Xiaole He <hexiaole1994@126.com>, daehojeong@google.com,
 shengyong1@xiaomi.com, jaegeuk@kernel.org
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

Fixes: 4b7e95300988 ("f2fs-tools: use pread and pwrite when they are available.")
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
Changes in v2:
- Add Fixes tag
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
