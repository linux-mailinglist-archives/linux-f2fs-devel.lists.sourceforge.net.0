Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEJ5JtCt12kMRQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:46:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C723CB829
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PKvfAKkCTSpkdm087AvpUtix75s3g1QkUzSd8/pdJEc=; b=KBwB/ytucTy3dfgUwzlmk1IAug
	W6cx4S+8V3vaemKLfO/SGcZmoqJRebZ2mcHfp5V7yncKtiGBQpWr6nFcbqdrXraF787GLzG2dsGxo
	gsLjaI6NuQusPHraZB3pMMfDwObvz0jghH8i1K0XkHEWaZgyVlHg0IsqwJB8vcQWYnmc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wApif-0004FO-Na;
	Thu, 09 Apr 2026 13:46:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wApic-0004FA-Jo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0BoW/26DjBVbbAy4qqMxf16Xqr59+yEK17ayhxkE20=; b=bUv2KUVkZ5lZQNhQhUSI/mAW+L
 c5ioEVO77tbzAMSBcf0SwOmWkinEcNGGT6yUEWSN04MBdlIUtu6+GiYXPoTQD1wDFmxl2NqHmlgfL
 ymn2Mu7HHHL9EUgtlOtzklg0czvhtRQhoIEF5M3DXJkUXdtCO3WusI9Epljh44P3JqZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C0BoW/26DjBVbbAy4qqMxf16Xqr59+yEK17ayhxkE20=; b=b
 jwYt0FlfBHtbiBR29LnWeRNAoAs2hln6Zzd+Xj6uFK5gUtsuWgO0w4+I705mxhiEJYDzZ5uhmuMBb
 OruJC1UIyFWNIgp6yKKLD5WKqxEZPHeGGBYGWDO8Y9G1nIQCBDJqAAGHzfZLq6PFzmne0dxvxpgsP
 FXl5/BLHU/N/oZnY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wApiW-0004wN-HM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D200760120
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Apr 2026 13:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFF4C4CEF7;
 Thu,  9 Apr 2026 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775742393;
 bh=RvxA4laON9W1FR3Xd1xF3nVWeCQ5r3aXfwOl914BDiw=;
 h=From:To:Cc:Subject:Date:From;
 b=uMEzNo044FLz26hw8Ky11K+AE9yj1n851Pd9BA1tSHfNXbUKQEz+udS2GdNzL5+uE
 gDc77Vx8VcJ3KBdX8CVGHRZm4T5VyI0sD74TZUZgaOOhtINwBnsBoAW8c8JAEkCeIS
 6W7uQmlbGfdz6D4damYA/4q04KxDw1IMxUIhEEauzi4D/0L+e/p+Qxlcxc5AGl4vTf
 1O1LoXgwedp56aHq/Cc3dUFbRp4XGPwk1AbSAL6jUDuOn9woDpqjcH1E6JGxaNqzMU
 Jjg11Vsl3fWmc4Tb8NW3FVBzDZ5cSUBqkplyQmHNcF6UsdI+ApMumwOyrVlTimmSF/
 FmQmIBERrC2+A==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  9 Apr 2026 13:46:29 +0000
Message-ID: <20260409134630.3693274-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [Script] dd if=/dev/zero of=/mnt/test/test bs=1M count=1024
 f2fs_io setxattr user.fadvise 1 /mnt/test/test chmod 0400 /mnt/test/test
 sync -f /mnt/test/test echo 3 > /proc/sys/vm/drop_caches f2fs_io re [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wApiW-0004wN-HM
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: support xattr(large_folio)
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: E9C723CB829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 32 ++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  6 ++++++
 2 files changed, 38 insertions(+)

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
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
