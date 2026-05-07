Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOBFDJB7/GllQgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:46:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 898954E7AE7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecGFrdS8uouDRkzKVRlWk1zCaoT3GxneuLTua966PqU=; b=Ng0THn5V89djfUg2CZtEHvGykF
	T0VdsG9ybWF5jBy3Lfxi4ghnhtCJv1N/Vh/p6GibkLihjlgpQq6sPmIV3D77WEQN/jKGp2WcYhGnH
	2W23rtFxxx+LLD8A9o/r+nB8YsArbQna/wZn5msd4p3De13i5h1/POKyvxd4NblhsZss=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKxBN-0000Za-BS;
	Thu, 07 May 2026 11:46:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wKxBM-0000Y5-8O
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gyDkHWNLP5F78jyNEqVsZ9kIG+0CbE52QkFBbkFQfI=; b=a3r/WjHzp0velKGZBRfaMob71M
 dUlgNSvikZn1928QUE4ttJ4siUggSlXTd4Z8HmUyZVS5uWLai8e5PpvK4UtEnByG8R+ONFGCm+/Gi
 t68GmPVSOuo5V5vhRjY6AzldnW8Kj2ijvyQHW3ETOz8cwfuAv9FVA+XmSLg3buaxD04U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gyDkHWNLP5F78jyNEqVsZ9kIG+0CbE52QkFBbkFQfI=; b=CNU0NaF04w8zQ0DVhiA1JbFlzL
 m4J7d/5g8Gi1PwFUN+NDDQJkP6AjHtQ5UsBJW2vmFbYenaqlgfm46v9fcY8rLGW2HisIA0oMDoll7
 9jvwWxtXyCAXWFhBQ1ZobYZAO7AYMaTXpvECX5IgjSwDZO4vZjfXPNkZHQelOY+zGSMA=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKxB9-0003Ah-7s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1778154367; bh=8gyDkHWNLP5F78jyNEqVsZ9kIG+0CbE52QkFBbkFQfI=;
 h=From:Subject:Date:Message-ID;
 b=I9H1CzwkzcoLSpeYR2lokX+ixgVxjCZZ7z2X1TeKWT0OoXeaj9+G8Q1TatAowNAjp
 3b0Smqy3/nCYijw+EhM7YiLmiDcYAmWtLA51DNxbTidrsBoESLhOWYUmbddkIYgHYR
 3VClytyMWekjEyLOp11E9iPAW7Yd154zdyMxanZc=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69FC7B7500004A25; Thu, 7 May 2026 19:45:59 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2742894456696
X-SMAIL-UIID: 32E3C2BFC864486B9255BEF9BEEEABC3-20260507-194559-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  7 May 2026 19:45:50 +0800
Message-ID: <20260507114434.1353908-8-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507114434.1353908-2-monty_pavel@sina.com>
References: <20260507114434.1353908-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add support to clear or set extent flags
 through ioctl for the inline extent feature. This allows users to enable
 or disable inline extent format on individual files via the f2fs_io tool. 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wKxB9-0003Ah-7s
Subject: [f2fs-dev] [RFC PATCH 3/3] f2fs_io: add support to clear/set extent
 flags
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
X-Rspamd-Queue-Id: 898954E7AE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,xiaomi.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add support to clear or set extent flags through ioctl for
the inline extent feature. This allows users to enable or disable
inline extent format on individual files via the f2fs_io tool.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++--
 tools/f2fs_io/f2fs_io.h |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c977f4da..18af49d9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -317,6 +317,12 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("immutable");
 		exist = 1;
 	}
+	if (flag & FS_EXTENT_FL) {
+		if (exist)
+			printf(",");
+		printf("extent");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
@@ -332,7 +338,8 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  extent\n"
 
 static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -362,6 +369,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag |= FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag |= FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "extent"))
+		flag |= FS_EXTENT_FL;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
@@ -378,7 +387,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  extent\n"
 
 static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -406,6 +416,8 @@ static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag &= ~FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag &= ~FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "extent"))
+		flag &= ~FS_EXTENT_FL;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("clear a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index b0d40996..92999e04 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -216,6 +216,9 @@ enum {
 #ifndef FS_NOCOW_FL
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #endif
+#ifndef FS_EXTENT_FL
+#define FS_EXTENT_FL			0x00080000 /* Extent file */
+#endif
 #ifndef FS_NOCOMP_FL
 #define FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #endif
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
