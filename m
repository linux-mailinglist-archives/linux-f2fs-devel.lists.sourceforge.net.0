Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH+CKD04/mkroAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 08 May 2026 21:23:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE884FB12A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 08 May 2026 21:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyvDe30z1KDVyT4n+SeaYEn98ZlM6+Q0x1iHcd7W6qE=; b=Ohnl1J6KyA1hqiDoViOmyEMSuw
	wQiioCTtPZCc5DtaQ/bjWObwoYLyiBLzSykrpd28Us9sLaCK34xinKqHvGr7p6PaT2Wn75VmytMqy
	Xexzo4eIfdd8Ym5ptJMVxH7Wyc44ELvz3+CVF/mjzuCk7qsxExoLv7uyRea0yrYHYS0c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLQnO-0003W1-N2;
	Fri, 08 May 2026 19:23:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wLQnN-0003Vu-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 May 2026 19:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLC5ufyV9Qvb7lsxYJtk390WTe6uKLTOW/Rt3yPqf8s=; b=nPiTyKXldEAooAc6jdpmC08XYI
 xwqSdglmOOx8oDdMTjfxlAHMhUVJVeuX013mXybEX3P4X7v9eXfafzCI1PZTQiTo7MVp4pxj1uCrG
 rYOyqAA66kgGihkOQ6AoBdYiGPQH4kqolIrRfRdg1pU1r8qMfeK41VeHhBqzDQILO06E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sLC5ufyV9Qvb7lsxYJtk390WTe6uKLTOW/Rt3yPqf8s=; b=LBt9CM6ir83tdKmhO8t4nsG9yK
 HCy+HNu0c26cd9GTVfoQwLTvl9V2EJX7ImJ++sC0Bckxb3dDINgoNG4mD+Wdxijjh5hsLrEI1Dd/X
 JENArbTYJ+xbij+NlSf1qQdgzyvqCDcpEd+KUCJAG7hyEETWwTDetvjzfnYFJG+QIk0Q=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLQnL-0006ov-KJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 May 2026 19:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D9E140BF9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 May 2026 19:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A66C2BCB0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 May 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778268201;
 bh=nkGbHHenZeq0EppgLukScN2T7ebArj7fU20ZsZXMUUs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=qv1f9kn/HSryvMEQ6Dea6WaxxNrz5eouDhTYHEpZqXlS7MRIr+Xha/0lQcc+Mpngq
 5juoxIxTbibnrME+dtd5j7S8cm5lezMeeue4KXw6HrtmYWGaazjD/AVEac5QyZHVQw
 kcTJVwUbY0StNqj8vW/6XMQONmSeEb14JDCMgmJ9v/eBnuwxG2bhLuRo8DHTvOpG1g
 0I+g/4WvRffCWAgEvWfz3pf4bf+2laQyGNo+M3xKk9h8JMy9DcoO3ZjCZSU1Yduqfw
 oXrgq+SwAMMMWvbtHBB0SxFllx0A2YD4XdxUfEbjVhUJ+EJvgFInm+NYDq61RXgXua
 R81yhSCRBQwxA==
Date: Fri, 8 May 2026 19:23:19 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <af44Jz7JO2ZC502T@google.com>
References: <20260409134630.3693274-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409134630.3693274-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [Script] dd if=/dev/zero of=/mnt/test/test bs=1M count=1024
 f2fs_io setxattr user.fadvise 1 /mnt/test/test chmod 0400 /mnt/test/test
 sync -f /mnt/test/test echo 3 > /proc/sys/vm/drop_caches f2fs_io re [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1wLQnL-0006ov-KJ
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs_io: support xattr(large_folio)
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DFE884FB12A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_EQ_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Action: no action

[Script]
dd if=/dev/zero of=/mnt/test/test bs=1M count=1024
f2fs_io setxattr user.fadvise 1 /mnt/test/test
chmod 0400 /mnt/test/test
sync -f /mnt/test/test
echo 3 > /proc/sys/vm/drop_caches
f2fs_io read 1 0 100000 mmap 0 1 /mnt/test/test
f2fs_io get_fadvise /mnt/test/test

[Output]
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.520712 s, 2.1 GB/s
setxattr /mnt/test/test CREATE: name: user.fadvise, value: 1: ret=0
Read 409600000 bytes total_time = 106757 us, BW = 4286 MB/s, IO time = 95577 us, mlock time = 11173 us, print 1 bytes:
00000000 : 00
fadvise=0x1, advise_type: largefolio

Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 man/f2fs_io.8           |  8 ++++++++
 tools/f2fs_io/f2fs_io.c | 32 ++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  6 ++++++
 3 files changed, 46 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 51ccfaf238cb..81608aa0f655 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -53,10 +53,18 @@ going down with fsck mark
 \fBpinfile\fR \fI[get|set|unset] [file]\fR
 Get or set the pinning status on a file.
 .TP
+\fBsetxattr\fR \fI[name] [value] [file]\fR
+Call setxattr to the file. The supported
+.I name
+are system.advise and user.fadvise.
+.TP
 \fBfadvise\fR \fI[advice] [offset] [length] [file]\fR
 Pass an advice to the specified file. The advice can be willneed, dontneed,
 noreuse, sequential, random.
 .TP
+\fBget_fadvise\fR \fI[file]\fR
+Show the activated fadvise flags.
+.TP
 \fBfallocate\fR \fI[-c] [-i] [-p] [-z] [keep_size] [offset] [length] [file]\fR
 Request that space be allocated on a file.  The
 .I keep_size
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 680c06218394..8b9f9ef22eef 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2084,6 +2084,7 @@ static void do_setxattr(int argc, char **argv, const struct cmd_desc *cmd)
 	int ret, len;
 	char *value;
 	unsigned char tmp;
+	unsigned int tmp_u;
 
 	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
@@ -2095,6 +2096,10 @@ static void do_setxattr(int argc, char **argv, const struct cmd_desc *cmd)
 		tmp = strtoul(argv[2], NULL, 0);
 		value = (char *)&tmp;
 		len = 1;
+	} else if (!strcmp(argv[1], F2FS_USER_FADVISE_NAME)) {
+		tmp_u = strtoul(argv[2], NULL, 0);
+		value = (char *)&tmp_u;
+		len = sizeof(unsigned int);
 	} else {
 		value = argv[2];
 		len = strlen(value);
@@ -2217,6 +2222,32 @@ static void do_get_advise(int argc, char **argv, const struct cmd_desc *cmd)
 	printf("\n");
 }
 
+#define get_fadvise_desc "get_fadvise"
+#define get_fadvise_help "f2fs_io get_fadvise [file_path]\n\n"
+
+static void do_get_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret;
+	unsigned int value;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	ret = getxattr(argv[1], F2FS_USER_FADVISE_NAME, &value, sizeof(value));
+	if (ret != sizeof(value)) {
+		perror("getxattr");
+		exit(1);
+	}
+
+	printf("fadvise=0x%x, advise_type: ", value);
+	if (value & (1 << F2FS_XATTR_FADV_LARGEFOLIO))
+		printf("largefolio");
+	printf("\n");
+}
+
 #define ftruncate_desc "ftruncate a file"
 #define ftruncate_help					\
 "f2fs_io ftruncate [length] [file_path]\n\n"	\
@@ -2626,6 +2657,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(removexattr),
 	CMD(lseek),
 	CMD(get_advise),
+	CMD(get_fadvise),
 	CMD(ioprio),
 	CMD(ftruncate),
 	CMD(test_create_perf),
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index b0d40996f302..539964fc27d3 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -186,6 +186,7 @@ struct fsverity_enable_arg {
 #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
 
 #define F2FS_SYSTEM_ADVISE_NAME	"system.advise"
+#define F2FS_USER_FADVISE_NAME "user.fadvise"
 #define FADVISE_COLD_BIT	0x01
 #define FADVISE_LOST_PINO_BIT	0x02
 #define FADVISE_ENCRYPT_BIT	0x04
@@ -195,6 +196,11 @@ struct fsverity_enable_arg {
 #define FADVISE_VERITY_BIT	0x40
 #define FADVISE_TRUNC_BIT	0x80
 
+/* used for F2FS_USER_FADVISE_NAME */
+enum {
+	F2FS_XATTR_FADV_LARGEFOLIO,
+};
+
 /* used for F2FS_IOC_IO_PRIO */
 enum {
 	F2FS_IOPRIO_WRITE = 1,  /* high write priority */
-- 
2.54.0.563.g4f69b47b94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
