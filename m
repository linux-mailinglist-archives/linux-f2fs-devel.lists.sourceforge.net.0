Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCf2JVN8qWkg8gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 13:51:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69F212213
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 13:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zGZjjU/G4dWBdFE8+sIIkf4FxAlrtgBzxTOeD3iNr0A=; b=Ntm+41HHSrDFvlcmvkDRYbMCmz
	Nc6luhGoVkFbPHesAdYnk425gu+G+qamNM0QqVEOPh2XdBvXh2TPxF+6CbOTZ2lvIrKIOSQ3JvW+n
	9C8HEG34fSIdzF9+xLk2tmMz9atoD7Fm+gszJJ7FF7HMDSyCjGJ/Wnx3scJwouAB5/ZU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy8Aa-0000eL-3b;
	Thu, 05 Mar 2026 12:51:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vy8AX-0000e0-1d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 12:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eNbpbtwknHVMRi0JGFkNz06TgfYqnlI2ZpN8rC21OEE=; b=mZvFl8qIbzfETlrnLNpOnqgsAe
 MJTLP2qkm9OFHY1QsK3w7YJmnN+zFTpNgfsFptCFS8zCFhzW7tnmrZ2snZtJmusXG9iIfYCMG+5lx
 I/QppoqBgDp3R+99QlxTmHK5QS7yb1ylMWmW26TxWBWRprCbyfABQqsjAMSRTbdSaeTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eNbpbtwknHVMRi0JGFkNz06TgfYqnlI2ZpN8rC21OEE=; b=K
 7lNP4DhTVwxGE4oBL5HfsaKaF2a0xUrJ5xg2MS6fkWQjioTJv5FQy0IWqgbFTDGiwbD9EXMGCCAc2
 tks+rJi37/Z6OrXUh2bOpKt65MXdtH3LZF9I2s8jkgSzLhaHsxh7kfMhJoqb2JfQDsS79lK/ERcxw
 J+6zKXUlt0affgCU=;
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vy8AW-0007di-My for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 12:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772715068; bh=eNbpbtwknHVMRi0JGFkNz06TgfYqnlI2ZpN8rC21OEE=;
 h=From:Subject:Date:Message-ID;
 b=U/fyW8ja9pysjZXeRUnSRcphVdZYIc06DYRjGBH4NNe1QE7gIhgsM44etqh/uKPk1
 r46IKo75wQi4oFHPPh9TVN4fCnJMIkFBjK6EBVnRpCa9b1/bCJO5+J17ZK5N7Ss3Ce
 HS6UeU0pqMroNh5eurMEQP9JAGMYDxJFJTiKd0TA=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69A97C2D00001BAF; Thu, 5 Mar 2026 20:50:55 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 541914456607
X-SMAIL-UIID: 70B2C681888D4FEFA790612D5E5A64FD-20260305-205055-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  5 Mar 2026 20:50:16 +0800
Message-ID: <20260305125015.1717396-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add a flags parameter to the fiemap
 subcommand, 
 allowing the specification of whether to retrieve file mappings after writing
 to the file. Signed-off-by: Yongpeng Yang --- man/f2fs_io.8 | 2 +-
 tools/f2fs_io/f2fs_io.c
 | 15 +++++++++++---- 2 files changed, 12 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vy8AW-0007di-My
Subject: [f2fs-dev] [PATCH v3] f2fs_io: add flags parameter to fiemap
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
X-Rspamd-Queue-Id: 9F69F212213
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add a flags parameter to the fiemap subcommand, allowing the
specification of whether to retrieve file mappings after writing to the
file.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 man/f2fs_io.8           |  2 +-
 tools/f2fs_io/f2fs_io.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 5c3d204..51ccfaf 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -138,7 +138,7 @@ mmap(MAP_POPULATE)
 mmap() + mlock()
 .RE
 .TP
-\fBfiemap\fR \fI[offset in 4kb] [count] [file_path]\fR
+\fBfiemap\fR \fI[offset in 4kb] [count] [file_path] {flags}\fR
 get block address in file
 .TP
 \fBgc_urgent\fR \fIdev [start|end|run] [time in sec]\fR
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c977f4d..9bca498 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1357,8 +1357,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 }
 
 #define fiemap_desc "get block address in file"
-#define fiemap_help					\
-"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
+#define fiemap_help							\
+"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path] {flags}\n\n"	\
+"flags can be the following values:\n"					\
+"0: No extra actions, by default\n"					\
+"1: Sync file data before map\n"					\
 
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
@@ -1366,10 +1369,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	unsigned int i;
 	int fd, extents_mem_size;
 	u64 start, length;
-	u32 mapped_extents;
+	u32 mapped_extents, flags = 0;
 	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
 
-	if (argc != 4) {
+	if (argc < 4 || argc > 5) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
@@ -1378,8 +1381,11 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	memset(fm, 0, sizeof(struct fiemap));
 	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
 	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
+	if (argc == 5)
+		flags = (u32)atoi(argv[4]);
 	fm->fm_start = start;
 	fm->fm_length = length;
+	fm->fm_flags = flags;
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
@@ -1397,6 +1403,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
