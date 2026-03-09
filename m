Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHlMD6VGrmluBgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 05:03:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EE2339B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 05:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTYsDmpIg7MvzptR2Rd43IZYlt1rPtg3/OyzBuCeOCk=; b=er9Mf+gEZTy4CWJDsitn33VUNm
	/5U9/5E0Klif9OzSrS5TDafTOU+41EOn69Fdx0bCTMQUGnq9w5y0olPNwO7TfqXFJN+jr/BPxqZQn
	Gm/lAKGBJSoSIosk6pd+0DfvFO/1qXIxtQvWe1xfHnrAzOFa+di9eYO+1xqxYyf0DQoM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzRqE-0006Xa-I6;
	Mon, 09 Mar 2026 04:03:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vzRq4-0006XM-Fd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 04:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BCIYxFXrHFwjOV9KLw2n1mIZFVw90GltuOXzHvJ3LPw=; b=kYUMJjExLNGd99jL4rjg+jouai
 CVvL5iahiS9RpKu4rogrGOuZKelQcRAq2aYhfmye6JIghx6+aKHxqcNIfeFgg+gi4kV00TGefUqHC
 785zgg42d7lL7nzKrp8LZpOGDHUeipoX08uOnzIlu6TdGVUyrwajiRamJb4p8KSouiWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BCIYxFXrHFwjOV9KLw2n1mIZFVw90GltuOXzHvJ3LPw=; b=X
 2/9r6hbgZtXqD7/CSDhK67Mtn2JNvdFuWgD+FXJ+MoMZvpOa93uQ21cZHghRoMbQPaFeBUuAP2lU+
 AVp62E1FGYQ9Sl2Bm1YjHH5HXxyUtFQGP+H5PXMNNxColHJ6HVPd0HvSkYMLjhlc5O0maGJZ22MZ6
 kDxPxM+nkvLFL5NE=;
Received: from smtp153-171.sina.com.cn ([61.135.153.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzRq3-0006f5-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 04:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773029007; bh=BCIYxFXrHFwjOV9KLw2n1mIZFVw90GltuOXzHvJ3LPw=;
 h=From:Subject:Date:Message-ID;
 b=lLVhvsl7w/fVd1HCcNX2zJJEnU/qRS2IgcYPQq1+v0L7uBkZqQ//67xyOtO1ky6Wt
 h6eSacT0amr1xHZQ346y7LNYLWtWtWM+T5+BR3QaIYOs84S3Vg9SE04efn3ISzR1cY
 VpyctaIlE0QAA1I8Em/WiLixDowrluaUREXfpXGo=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69AE468500002C7E; Mon, 9 Mar 2026 12:03:19 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7917586292114
X-SMAIL-UIID: 6E87474C4B53420D9FCD4A720C390645-20260309-120319-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  9 Mar 2026 12:00:33 +0800
Message-ID: <20260309040031.2626047-3-monty_pavel@sina.com>
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
 subcommand
 so that it can pass FIEMAP_FLAG_SYNC, FIEMAP_FLAG_XATTR, and FIEMAP_FLAG_CACHE.
 Before retrieving the fiemap, perform the corresponding actions based on
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vzRq3-0006f5-G7
Subject: [f2fs-dev] [PATCH v4] f2fs_io: add flags parameter to fiemap
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
X-Rspamd-Queue-Id: E00EE2339B9
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
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,sina.com:mid]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add a flags parameter to the fiemap subcommand so that it can pass
FIEMAP_FLAG_SYNC, FIEMAP_FLAG_XATTR, and FIEMAP_FLAG_CACHE. Before
retrieving the fiemap, perform the corresponding actions based on
these flags, such as syncing data or preloading extents.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v4:
- Add more descriptions of the flags parameter in help text and commit
message.
v3:
- Make the flags parameter optional.
v2:
- Update fiemap command's parameters in man/f2fs_io.8.
---
 man/f2fs_io.8           |  2 +-
 tools/f2fs_io/f2fs_io.c | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index c977f4d..866a4f2 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1357,8 +1357,13 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 }
 
 #define fiemap_desc "get block address in file"
-#define fiemap_help					\
-"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
+#define fiemap_help							\
+"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path] {flags}\n\n"	\
+"flags: bitmask with optional combinations of:\n"			\
+"0: no extra actions, by default\n"					\
+"1: sync file data before map\n"					\
+"2: map extended attribute tree\n"					\
+"4: request caching of the extents\n"					\
 
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
@@ -1366,10 +1371,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
@@ -1378,8 +1383,11 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	memset(fm, 0, sizeof(struct fiemap));
 	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
 	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
+	if (argc == 5)
+		flags = (u32)atoi(argv[4]);
 	fm->fm_start = start;
 	fm->fm_length = length;
+	fm->fm_flags = flags;
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
@@ -1397,6 +1405,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
