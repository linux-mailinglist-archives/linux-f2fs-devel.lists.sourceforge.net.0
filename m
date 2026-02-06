Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBs5IlZUhWmV/wMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Feb 2026 03:39:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456DF963D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Feb 2026 03:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=82rFNjwMvbX7oPmBgnLPeWsaf6UAYIlZKpeT0UqcHns=; b=ELb06OX6LLIohFlSbTgO4ZH5ig
	uunkMCFGNMKkFYP4W6r2medeNA/cfVwvrqFKddDC3HXCnbvu2jmYMEm/US46I4CMxRwTNdfM1xHvU
	KocsB6ZRXMd44IqcyURdhp/4MIpOvHMh2T7wvv6So+k/sWOMkxI5xNTNLR3EjtXTrZuA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1voBkQ-0004i9-Sa;
	Fri, 06 Feb 2026 02:39:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1voBkP-0004i1-47
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Feb 2026 02:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yj+ZVGjIXDSaYuBuTlcmprjKlfIDm79CA6/kJvxHaB4=; b=Poh/0Jo7YSZtLDnPr47RF5Nuky
 9tSPD5vbkO2EWIKQZYx0ui6FYELpOHEA3WdZ6wMecIqnVBeerfKlRMqYW5N4xQTlnOLcJS+XREHaE
 O7V/qDamB2HHhzti41dmTcC2qt6EKU2q3DqSX+xUQ8+1CkTE45314FKwxjCqGRo8Xgt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yj+ZVGjIXDSaYuBuTlcmprjKlfIDm79CA6/kJvxHaB4=; b=V
 vA7+Gy7ClwR1n8JzfIRqHXVq+7Gdb5Pg1Ny4ijOwBQHaLpsaS0xqln3GaUk7bsgtOgGBR1MNP5pKL
 Idip1oWA0OnhOoFkKCCTFjeByhxIiBziMycE++aEXujRHwjTvVsLGvg2HwADPLpFA1BQZKSD1dLHJ
 jE3Nie1X3eEJmDpg=;
Received: from r3-24.sinamail.sina.com.cn ([202.108.3.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1voBkN-0003BO-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Feb 2026 02:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1770345543; bh=yj+ZVGjIXDSaYuBuTlcmprjKlfIDm79CA6/kJvxHaB4=;
 h=From:Subject:Date:Message-ID;
 b=KnoJ7FuzSmAAfOdFVRQBB3+NTmDU/sJiFwyt/I4d7Gv56wvytUKO+1jqpvlKa6+ei
 vSBa2mmvxajiHmJ04fh66ZswK3m8GL6GHVhQFYXMWvkZH1UpGRy902xMoSqLbFKkNX
 Hvrq+itFLY45HOmCJ1v1rmvh5eOtPBWeSvxfurgc=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 6985543D0000180D; Fri, 6 Feb 2026 10:38:54 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8394206816255
X-SMAIL-UIID: 98F3D5462D52495A99828EAE590A6448-20260206-103854-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  6 Feb 2026 10:38:31 +0800
Message-ID: <20260206023830.318847-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add a flags parameter to the fiemap
 subcommand, 
 allowing the specification of whether to retrieve file mappings after writing
 to the file. Signed-off-by: Yongpeng Yang --- v2: - Update fiemap command's
 parameters in man/f2fs_io.8. --- man/f2fs_io.8 | 2 +- tools/f2fs_io/f2fs_io.c
 | 16 +++++++++++----- 2 files changed, 12 insertions(+), [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1voBkN-0003BO-P3
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add flags parameter to fiemap
 subcommand
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 3456DF963D
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add a flags parameter to the fiemap subcommand, allowing the
specification of whether to retrieve file mappings after writing to the
file.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Update fiemap command's parameters in man/f2fs_io.8.
---
 man/f2fs_io.8           |  2 +-
 tools/f2fs_io/f2fs_io.c | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 5c3d204..dc1a47f 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -138,7 +138,7 @@ mmap(MAP_POPULATE)
 mmap() + mlock()
 .RE
 .TP
-\fBfiemap\fR \fI[offset in 4kb] [count] [file_path]\fR
+\fBfiemap\fR \fI[offset in 4kb] [count] [flags] [file_path]\fR
 get block address in file
 .TP
 \fBgc_urgent\fR \fIdev [start|end|run] [time in sec]\fR
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 4429e0b..3b19724 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1341,8 +1341,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 }
 
 #define fiemap_desc "get block address in file"
-#define fiemap_help					\
-"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
+#define fiemap_help							\
+"f2fs_io fiemap [offset in 4kb] [count in 4kb] [flags] [file_path]\n\n"	\
+"flags can be the following values:\n"					\
+"0: No extra actions\n"							\
+"1: Sync file data before map\n"					\
 
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
@@ -1350,10 +1353,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	unsigned int i;
 	int fd, extents_mem_size;
 	u64 start, length;
-	u32 mapped_extents;
+	u32 mapped_extents, flags;
 	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
 
-	if (argc != 4) {
+	if (argc != 5) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
@@ -1362,10 +1365,12 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	memset(fm, 0, sizeof(struct fiemap));
 	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
 	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
+	flags = (u32)atoi(argv[3]);
 	fm->fm_start = start;
 	fm->fm_length = length;
+	fm->fm_flags = flags;
 
-	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
+	fd = xopen(argv[4], O_RDONLY | O_LARGEFILE, 0);
 
 	printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
 				start / F2FS_DEFAULT_BLKSIZE,
@@ -1381,6 +1386,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);
 	fm->fm_start = start;
 	fm->fm_length = length;
+	fm->fm_flags = flags;
 	fm->fm_extent_count = mapped_extents;
 
 	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
