Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B714A794F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Feb 2022 21:17:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFM4c-00089S-92; Wed, 02 Feb 2022 20:17:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1nFM4a-00089M-Pd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Feb 2022 20:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i0QIAImud6iPXLrn9HIO0GQ1enH9FI5z6TDtrOkZu5Y=; b=mJ3KG4cuRY75w6IoWwH7WvwMFZ
 oW+Vglqmq1AExa6hXzCR1YqqRTXMbAKyA2UO4aw1lajSKGOXK0IbT5XY0F1XSKowSuO5mSi735YCx
 fks4lJHp5guuaNE/iGPL3yex800bo9wwNb2MNk+5v7pp22yIuMN6cltr4oMcRdoxrmPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i0QIAImud6iPXLrn9HIO0GQ1enH9FI5z6TDtrOkZu5Y=; b=b
 PrtoeP0V50d2IZdi0X5j4INOVt4EL7EwzjmRf673+AGmWtGiziGCF1F8dxDd28RIbbi+mCSzdyW4c
 p/Mlil38ydNREF+7rdG2/iyB1N2MAT6PRfkFcCgZfZxH20ENCfI6Hj95QWP8EAIl4FtZDeqzw3yXj
 N9Id7hcLW3W2PI2Y=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nFM4Y-00DqYo-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Feb 2022 20:17:47 +0000
Received: by mail-pf1-f171.google.com with SMTP id i17so236430pfq.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Feb 2022 12:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i0QIAImud6iPXLrn9HIO0GQ1enH9FI5z6TDtrOkZu5Y=;
 b=PJzu9atye0Tb9JiMwedtVeny9KQFt/+qrpM+05tPLw3cTSNCGiKY1atVYYm4G6+gPQ
 /JLJslq4bguS6L0xzyBitiNa09KTJS9CEwoQNUwMRRJ4pPVj/AmcpiAcWMI1K3BSQRD/
 ktBoAohwo8aop0UZ9UgaIvPHjNxNQJ+HAX8RUgGfP2SeyhYbrABFnzdjaTy148cmTlzd
 HFHW/1QShZid+0zjeh/KWZrzLoBEr8Z3jM3oE30JMn4sZGai5R0TJMFTOsfZQCpJJZBE
 b+7BAiXC849fWZ7J07Gcrrofttr9IM0eP6y2S3VEeJaiyreoLAccjr+dDyJ8z9+mFl6g
 Ev7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i0QIAImud6iPXLrn9HIO0GQ1enH9FI5z6TDtrOkZu5Y=;
 b=7pDLBtZgRFz9M5BsxoGtnoAlAuBYFmKF52afmtumixLxvaoqmUNtpmTAWEsqlRtcum
 ZlxdMuETQ1hJYjDeNv+2wF5OLGa6IKnbNydyaaT6RxJ0Z8v0TDWNeQroJkcu9fhiya3n
 r2Nrnc5Oz4rKD85zTS58f4Bp0+/TkY00vUSqtqyncjaiJK1W5F/tE8+JHS9DRut3+O/u
 PIzVB73aY6tmWlf+1nZyM+wGHsq6meEOKHdFgYfNkpF2qEPtSD1CfjGMI3g78P2mjZwq
 F/d2PVVmYdmT/aJA4TYQwywNyB1vmuFgjdlo6XG+f1P+2spSN0My5NxeWM9UhDFQrDTM
 P9bg==
X-Gm-Message-State: AOAM5328G1zsbpAogmMZnIKcZ9dmWOnskfDNnm5vtfA6Eq6wZVLSeYYo
 3vuVkLlEQf8+O+jFCIcehFmVSpWCnHQ=
X-Google-Smtp-Source: ABdhPJxy5CQSAJViSX2Y5oFfiLj2LWqDG+d/HseasiKr0R+wRhkp1GzgB8U0lFTlBSNlgMmbdJ1i6A==
X-Received: by 2002:a63:c007:: with SMTP id h7mr26442067pgg.422.1643833060816; 
 Wed, 02 Feb 2022 12:17:40 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:346a:7cb2:d6df:c585])
 by smtp.gmail.com with ESMTPSA id f3sm27240729pfe.67.2022.02.02.12.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 12:17:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  2 Feb 2022 12:17:27 -0800
Message-Id: <20220202201727.3410310-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added two option to f2fs_io "write"
 command.
 - atomic_commit : atomic write & commit - atomic_abort : atomic write & abort
 Also, added an optional option {delay}, which is in ms unit and optional
 only [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nFM4Y-00DqYo-Ot
Subject: [f2fs-dev] [PATCH] f2fs-tools: add atomic write related options to
 f2fs_io write command
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added two option to f2fs_io "write" command.
 - atomic_commit : atomic write & commit
 - atomic_abort  : atomic write & abort
Also, added an optional option {delay}, which is in ms unit and optional
only for atomic_commit and atomic_abort.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 53 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c6847c8..af4a34b 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -496,16 +496,19 @@ static void do_erase(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define write_desc "write data into file"
 #define write_help					\
-"f2fs_io write [chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path]\n\n"	\
+"f2fs_io write [chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path] {delay}\n\n"	\
 "Write given patten data in file_path\n"		\
 "pattern can be\n"					\
-"  zero     : zeros\n"					\
-"  inc_num  : incrementing numbers\n"			\
-"  rand     : random numbers\n"				\
+"  zero          : zeros\n"				\
+"  inc_num       : incrementing numbers\n"		\
+"  rand          : random numbers\n"			\
 "IO can be\n"						\
-"  buffered : buffered IO\n"				\
-"  dio      : direct IO\n"				\
-"  osync    : O_SYNC\n"					\
+"  buffered      : buffered IO\n"			\
+"  dio           : direct IO\n"				\
+"  osync         : O_SYNC\n"				\
+"  atomic_commit : atomic write & commit\n"		\
+"  atomic_abort  : atomic write & abort\n"		\
+"{delay} is in ms unit and optional only for atomic_commit and atomic_abort\n"
 
 static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -516,10 +519,12 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 	int flags = 0;
 	int fd;
 	u64 total_time = 0, max_time = 0, max_time_t = 0;
+	bool atomic_commit = false, atomic_abort = false;
+	int useconds = 0;
 
 	srand(time(0));
 
-	if (argc != 7) {
+	if (argc < 7 || argc > 8) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
@@ -545,11 +550,26 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 		flags |= O_DIRECT;
 	else if (!strcmp(argv[5], "osync"))
 		flags |= O_SYNC;
+	else if (!strcmp(argv[5], "atomic_commit"))
+		atomic_commit = true;
+	else if (!strcmp(argv[5], "atomic_abort"))
+		atomic_abort = true;
 	else if (strcmp(argv[5], "buffered"))
 		die("Wrong IO type");
 
 	fd = xopen(argv[6], O_CREAT | O_WRONLY | flags, 0755);
 
+	if (atomic_commit || atomic_abort) {
+		if (argc == 8)
+			useconds = atoi(argv[7]) * 1000;
+
+		ret = ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
+		if (ret < 0) {
+			fputs("setting atomic file mode failed\n", stderr);
+			exit(1);
+		}
+	}
+
 	total_time = get_current_us();
 	for (i = 0; i < count; i++) {
 		if (!strcmp(argv[4], "inc_num"))
@@ -568,6 +588,23 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 		written += ret;
 	}
 
+	if (useconds)
+		usleep(useconds);
+
+	if (atomic_commit) {
+		ret = ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE);
+		if (ret < 0) {
+			fputs("committing atomic write failed\n", stderr);
+			exit(1);
+		}
+	} else if (atomic_abort) {
+		ret = ioctl(fd, F2FS_IOC_ABORT_VOLATILE_WRITE);
+		if (ret < 0) {
+			fputs("aborting atomic write failed\n", stderr);
+			exit(1);
+		}
+	}
+
 	printf("Written %"PRIu64" bytes with pattern=%s, total_time=%"PRIu64" us, max_latency=%"PRIu64" us\n",
 				written, argv[4],
 				get_current_us() - total_time,
-- 
2.35.0.rc2.247.g8bbb082509-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
