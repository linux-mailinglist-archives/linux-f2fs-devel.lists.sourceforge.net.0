Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FjMEtit12kMRQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:47:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F93CB848
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=All95XjDn0ZVTcrQTzQTXtVlPF1FG3IB9j9uH2UI5TM=; b=lM+e9rNuEx6wKrxw9D+avSHVxw
	3nB2ulXrvQcPu8yCfJrGlYH50XblznaBtcQUmXKjRqB/VI5HQZHRYGJ2M1AeN0/bp+9a8AnFCsoSv
	k8H/GWt2MT6jXWCH0o3IN4kXuqCByM8KmoMGgGJFNKTL3ba8LCXODaRY9r4WqC/xMV2Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wApil-0007pr-SG;
	Thu, 09 Apr 2026 13:46:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wApil-0007pl-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qspiTaTNVCoVLqTJkeH+WvY3URWeJr5uCJ2WqXqMyAw=; b=WYRuwOG+xM9LpVprQ7zaCQ6FJN
 buYUkJQ9kwEw5lisZ+gupBdWl+3Og7Lc07c86RVb7/joeb1FUuF4BquvjAyMlzMuXybvIgkOVdQN0
 YkLpN0DqpCVBe05q1lJ3Cpw6VhoOxgQFqu0kJF2p2nHtLxvFJka2o5jnpjgg0zDMuCLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qspiTaTNVCoVLqTJkeH+WvY3URWeJr5uCJ2WqXqMyAw=; b=T
 31aaoap+xwaTOZ6OoenjDqsH2k+NxN0LcTeapcoMUhXGLtFgUee5vaU0NQFn6kHHxWKCnt6CNnAES
 l+W6qxSkqDjqDyY0xJdtN6V/2bMp903L2V8tqArRtuveQQhPRmh3XY2/Cu8mfE2wj+b3QzUjl4VzP
 BHRKv/m9oQJaKZlo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wApik-0004y1-MY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A63141834
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Apr 2026 13:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1A1C4CEF7;
 Thu,  9 Apr 2026 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775742413;
 bh=PpmMwSW+/A3af15jJQ6bPRLPPjBYeKMEVB/gZI0R/Js=;
 h=From:To:Cc:Subject:Date:From;
 b=Q0XGVpmYGJT1JuC+OlnCcmZDzlb4zpq9AD4p2l8QnzceAhAhEUiob+oGu8EUafKUX
 GogIEVj593A76yN1jvmBZS5IyC/8mNcs+z0rnIyZ49lLKeCc1mTwcxd3VXUhkLrl3r
 2ekYHInpimibMTPOOfsGemHsEPCqbq40IklR9rWtBRPjjqkSNAJPza6pvW0RhuFVT9
 oWfBkRxRMrIRtFOEp/i35lFXhho1xUzsCjZBke4L8Et5OcZ9DewD3XgVcFTwqOT4Sw
 Hu4UQaw1ceB0Vi2wZvZ95L0KxCyANWRPNvTfEwogRMt49DZLo8a04H4AkQlGtfsxql
 o+lthW25l4XSw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  9 Apr 2026 13:46:49 +0000
Message-ID: <20260409134649.3693469-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 8 +++++--- 1 file changed, 5 insertions(+),
 3 deletions(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index c5f1da3e6313..680c06218394 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -2081,7 +2081,7 @@ static void do_ [...]
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wApik-0004y1-MY
Subject: [f2fs-dev] [PATCH] f2fs_io: fix length for setxattr
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
X-Rspamd-Queue-Id: 3D8F93CB848
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c5f1da3e6313..680c06218394 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2081,7 +2081,7 @@ static void do_listxattr(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_setxattr(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	int ret;
+	int ret, len;
 	char *value;
 	unsigned char tmp;
 
@@ -2094,15 +2094,17 @@ static void do_setxattr(int argc, char **argv, const struct cmd_desc *cmd)
 	if (!strcmp(argv[1], F2FS_SYSTEM_ADVISE_NAME)) {
 		tmp = strtoul(argv[2], NULL, 0);
 		value = (char *)&tmp;
+		len = 1;
 	} else {
 		value = argv[2];
+		len = strlen(value);
 	}
 
-	ret = setxattr(argv[3], argv[1], value, strlen(argv[2]), XATTR_CREATE);
+	ret = setxattr(argv[3], argv[1], value, len, XATTR_CREATE);
 	printf("setxattr %s CREATE: name: %s, value: %s: ret=%d\n",
 			argv[3], argv[1], argv[2], ret);
 	if (ret < 0 && errno == EEXIST) {
-		ret = setxattr(argv[3], argv[1], value, strlen(argv[2]), XATTR_REPLACE);
+		ret = setxattr(argv[3], argv[1], value, len, XATTR_REPLACE);
 		printf("setxattr %s REPLACE: name: %s, value: %s: ret=%d\n",
 				argv[3], argv[1], argv[2], ret);
 	}
-- 
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
