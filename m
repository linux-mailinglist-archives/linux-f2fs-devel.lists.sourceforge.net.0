Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHZ9A//6gWk7NQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:41:19 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6CDA051
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YEkfs0b6Q+5pjryY/gfuWphEeMhksdJPHnehgaf1LNc=; b=T0gIw51lFEAEo9dSAo/f/Rgeb4
	xYdTlv10i+8btGHfUECWgZ5Pd6umalqVaR6mmTkVySL+xOAh6PG6MwzeXshNVp5+iiwYFSzHJTuRX
	IKFxhHgukJ0FPzvBTP47EhCTpQK0kkdoB0U+lqkYUt0GA1RQTh+xP2EHg9z7jLyjuVR8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnGeX-0007kc-E3;
	Tue, 03 Feb 2026 13:41:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vnGeW-0007kW-9L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RRIv3tx58dPeFQc+QKX09qARlVa7rNolqpnMszabD2c=; b=R93zQ0QDO6mVdHX6XQcAAFtjok
 jAK3llLV3fAEk9iOZJ1vziyu5BezHAmubygt2BjpeRY96nVHvfSo5zoH+ccUaSkZ4ozjJJPpNxsqk
 K8ZqT36SBeQMshbeCVN84qjy+wQYA4YaDFO8EQNyIC0u7EtShUeD0wN+V9SDMj4/rEHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RRIv3tx58dPeFQc+QKX09qARlVa7rNolqpnMszabD2c=; b=j
 89cIM2C9GHFl1E6fzTSJAS8W7QbOfZBoqPpsPQyFF9hdYhlgq5jzOc3rDLUJpycvN41FgJ5APk7pN
 SEldTsSaK0k7k3H5z70F5DCpPWO6qRagi/3KkdMrlM/RcViVZrG7i2bIsmkz7NUFUTimlB2kMGClX
 WQj6p2tGtXnMsle0=;
Received: from smtp153-171.sina.com.cn ([61.135.153.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnGeV-00052T-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1770126071; bh=RRIv3tx58dPeFQc+QKX09qARlVa7rNolqpnMszabD2c=;
 h=From:Subject:Date:Message-ID;
 b=X6XZJkQK+gx8pkEUOnRt0+5cTKPGiQKXADxkx0aepeigeVkm16i2QtnBgTZio9T74
 NEa2ZofLojE9WSMt1RnTw1IdK3GlDtDRP9ZjauaacN6POZl8N8vPLbHlh9hQk5szeZ
 U9zU9ru3xAPjBk9Cy+pgxhf5P5qRXALuQWGZMJzY=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 6981FAEB00005B5A; Tue, 3 Feb 2026 21:41:02 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2491546291842
X-SMAIL-UIID: 550E5E4D45BB4BE6BD9DDF5F1A58141D-20260203-214102-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue,  3 Feb 2026 21:40:29 +0800
Message-ID: <20260203134027.3942948-3-monty_pavel@sina.com>
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
 to the file. Signed-off-by: Yongpeng Yang --- tools/f2fs_io/f2fs_io.c | 16
 +++++++++++----- 1 file changed, 11 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vnGeV-00052T-2Q
Subject: [f2fs-dev] [PATCH] f2fs_io: add flags parameter to fiemap subcommand
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,sina.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: C2A6CDA051
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add a flags parameter to the fiemap subcommand, allowing the
specification of whether to retrieve file mappings after writing to the
file.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

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
