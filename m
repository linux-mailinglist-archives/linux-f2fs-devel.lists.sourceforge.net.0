Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ndiO2b5L2pAKwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4E6868C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YzDgi8ts;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="e9EN4Sk/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hICiQU8o;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=OLMQrsLj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziQQKkC7JB6pq841jtBOa5IxnPkRjosL1kkfmEQ3k/o=; b=YzDgi8tshePqk+uZd6IFAhQFeU
	fAFOA2OvIJbuHnvg1qWj85x68BoEym3A7ehEknDhpJHussu2su94NA7IQMpFdIaOmt8Xcy7RVQSbR
	e3rsaz7rXFeS3SOCMQYT5MD7hoSgWgdT5n7NYUSo+3fViHO1g8p0RdiUvxW8efMBCEcc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ73d-00020P-6j;
	Mon, 15 Jun 2026 13:08:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ73b-00020D-Vi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sd2sRE3z3LhcOaIIZd0sNUtU3cvVBqFxkoSjXGoSdBk=; b=e9EN4Sk/ncRjawO0oPwk7Y84zw
 uu52iIPcS68hYRHG/rKJ0FukNfDm23ktya2+jWfNNTvXsJiSBMw3vrZgAj62Bzlbw3oJrIU2IsICi
 ag6ks7Lf0Gyvm1OvNraV7W0b9Ee+WqM/6L5PCg1dgX4N8B3ild/2FBHJ15Gx6h9YgEqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sd2sRE3z3LhcOaIIZd0sNUtU3cvVBqFxkoSjXGoSdBk=; b=hICiQU8oIlZSV0YfcvMPIcM6mo
 TPireVagT7w+PF2TF58T9g24Lef4cAEMyQWdNGKaPK5gRMHOfTmNNplEkGbdXbfczy1Cr9hsE/L72
 Jmi0TfJ3ENm4GB/hlFiNB/NGiz1QkqYKQJfZGsKkf9FR0AKURyAHyVU31s3+gY7dSpBU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ73W-0005xJ-JG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 842F3600AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 13:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC621F00A3E;
 Mon, 15 Jun 2026 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781528916;
 bh=Sd2sRE3z3LhcOaIIZd0sNUtU3cvVBqFxkoSjXGoSdBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OLMQrsLjPEKLZrOnPyG1RXqCZnFPb8Q0BKuKiV7fG35BkEiTbJ7aAARte0l4joLYG
 h0ivHCa5UvzUOWjHWUfBxi3FF4r3SVGCZbZ2xbS8QFPy1c+O51FsqwUJrg7fbEOmg3
 oxG7+sEHT0VoHHX/dpqwt6gx+I4J5WpqdqOM5Pkv5i0ZqhvMfRBBVzlgTyH9z/ZRAZ
 wXNsMaYD7IQv1xKxj5+CKEU/5taeRYcDrRs17fybyWuAtAvThT+6FyRJ/rgniqejIf
 NQgFF/zWoMwYPtHFaS8dcGj0GI8qm/ZlY7w/kmbIRPpkdplcO/DfhRPvnrlcM4GBbL
 7qAT8TmUlrNww==
To: jaegeuk@kernel.org
Date: Mon, 15 Jun 2026 21:08:20 +0800
Message-ID: <20260615130822.2576088-4-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260615130822.2576088-1-chao@kernel.org>
References: <20260615130822.2576088-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fscrypt_finalize_bounce_page() should be called only if we
 use fs layer crypto, let's avoid unnecessary fscrypt_finalize_bounce_page()
 in error path of f2fs_write_compressed_pages(). BTW,
 fscrypt_finalize_bounce_page()
 will check mapping of bounced page before retrieving original page, so,
 previously
 it won't cause any issue w/ fscrypt_finalize_bounce_page(), but still we'd
 better [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ73W-0005xJ-JG
Subject: [f2fs-dev] [PATCH 4/6] f2fs: avoid unnecessary
 fscrypt_finalize_bounce_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4ED4E6868C7

fscrypt_finalize_bounce_page() should be called only if we use fs layer
crypto, let's avoid unnecessary fscrypt_finalize_bounce_page() in error
path of f2fs_write_compressed_pages().

BTW, fscrypt_finalize_bounce_page() will check mapping of bounced page
before retrieving original page, so, previously it won't cause any issue
w/ fscrypt_finalize_bounce_page(), but still we'd better avoid coupling
w/ any logic inside fscrypt_finalize_bounce_page().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index caf522d667d6..aaa0813eabcd 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1455,10 +1455,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 out_destroy_crypt:
 	page_array_free(sbi, cic->rpages, cc->cluster_size);
 
-	for (--i; i >= 0; i--) {
-		if (!cc->cpages[i])
-			continue;
-		fscrypt_finalize_bounce_page(&cc->cpages[i]);
+	if (fio.encrypted) {
+		for (--i; i >= 0; i--) {
+			if (!cc->cpages[i])
+				continue;
+			fscrypt_finalize_bounce_page(&cc->cpages[i]);
+		}
 	}
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
