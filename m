Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gBobIgdOMmqfyQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 09:34:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D80697370
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 09:34:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=OacDASIH;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ktupjqDp;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="I dZTqGe";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=OA2cvJtj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dNYG3KK8qLqdoYBw+746FTPTEXFWiVG/XMAtBZ1sGJQ=; b=OacDASIHjTYeAmvl7MxoFStAAd
	SH52udbPtOk+Q77xsBLM+TBXmJST/QhGm9G411nVzriW98iGadjVT0ga65TLnq5YSg9AHgUgpWwCi
	ahk1K9ViUwdqjF2XZg1FU5GBUvKo6CRotN2HsjzwM3Z9/UynZpbG/zB4BSPtWU4PEEnw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZkmv-0003l6-3C;
	Wed, 17 Jun 2026 07:34:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZkmu-0003l0-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 07:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/rnUG+9phvqSWTbG1RUV6ldfu1gWqqD6rk/CGwNLgAI=; b=ktupjqDpyjTffLOi1GsLDqBzA/
 g4obXZE6ZZKwC+9G+ph98PM+y9qfVblBH48Pox19tZgxCtwQVQTqKUFtxVrrl+7JatSKJkIZrGzm6
 BmIPda541L+0YCjav8tsRrARC3YLezJC34KG2sdYsYl6n0K9hDa1gl+FkSWGv5f8tmWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/rnUG+9phvqSWTbG1RUV6ldfu1gWqqD6rk/CGwNLgAI=; b=I
 dZTqGeMUaXEDSA45aXwDB+mq/nTGgAOrn8ANAUt2uF8aDJ9sveY78QO+FZHOAkIzt4qEe+T/4oH+D
 +oCnZdrNSnKjqOQLLq5SwL5YJsCs1SPlhsvZoin2pveLXxmB5G0XOgZoloCG1941lMzZF2KI9UWG3
 7DE/6lin0s2t/Vwo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZkmr-0005We-13 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 07:34:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 21D6643AEF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 07:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D601F000E9;
 Wed, 17 Jun 2026 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781681648;
 bh=/rnUG+9phvqSWTbG1RUV6ldfu1gWqqD6rk/CGwNLgAI=;
 h=From:To:Cc:Subject:Date;
 b=OA2cvJtj5k2zTe0TnAHN23OInYvQAgAjeEoF//1vSmxuJvcoifL/SnDO3i3jxJruL
 xy2acEk9ir0FVaSDynvCYx11W32d9O67iXmNQ6h51shar/JJ/ra7fA3YgLoLq+XyOw
 LiKZwUXnwemMMyciARzxLw2aTuEjl87YVUDbncYSS/pZ0adDl92xTM50JxI4IhoMtI
 49LEWm4dK03jIWbMr3HqT8O13YI52+7Z52merpvnn2Da5UQZGBH5c61qT/w536PVhO
 2JBevV5N9lZNeNL8aLemswHW2ne7syVfLyVIXvZ+wMWL3y+SzAjaUboUKHqMgURG1s
 JzqyQoSe4Q0sQ==
To: jaegeuk@kernel.org
Date: Wed, 17 Jun 2026 07:33:57 +0000
Message-ID: <20260617073357.93682-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When allocating memory in aligned_xalloc(), if the requested
 alignment (e.g., F2FS_DEFAULT_BLKSIZE) is smaller than the system's page
 size, aligned_alloc() will allocate memory that is not page-aligne [...] 
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
X-Headers-End: 1wZkmr-0005We-13
Subject: [f2fs-dev] [PATCH v2] f2fs_io: adapt w/ page_size in
 aligned_xalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D80697370

When allocating memory in aligned_xalloc(), if the requested alignment
(e.g., F2FS_DEFAULT_BLKSIZE) is smaller than the system's page size,
aligned_alloc() will allocate memory that is not page-aligned on systems
with 16KB or 64KB page sizes.

As a result, subsequent calls to madvise(..., MADV_HUGEPAGE) will fail
because madvise() requires the memory address and length to be page-aligned.

Fix this by dynamically adjusting the alignment and rounding up the requested
allocation size (via roundup()) to the system's page size, ensuring that
memory is correctly page-aligned for madvise().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 17 +++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 94e61b8..9a866cc 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -97,6 +97,23 @@ static void *xmalloc(size_t size)
 
 static void *aligned_xalloc(size_t alignment, size_t size)
 {
+	long page_size = F2FS_DEFAULT_BLKSIZE;
+
+#ifdef _SC_PAGESIZE
+	page_size = sysconf(_SC_PAGESIZE);
+	if (page_size < 0)
+		page_size = F2FS_DEFAULT_BLKSIZE;
+#endif
+
+	/*
+	 * On systems with large page sizes (e.g., 16KB/64KB), alignment and
+	 * allocation size must be page-aligned to satisfy madvise().
+	 */
+	if (alignment < (size_t)page_size)
+		alignment = page_size;
+
+	size = roundup(size, alignment);
+
 	void *p = aligned_alloc(alignment, size);
 
 	if (!p)
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 539964f..cf1c334 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -49,6 +49,9 @@ typedef u32	__be32;
 #endif
 
 #define F2FS_DEFAULT_BLKSIZE	4096
+#ifndef roundup
+#define roundup(x, y)		((((x) + ((y) - 1)) / (y)) * (y))
+#endif
 #define NEW_ADDR	0xFFFFFFFF
 
 #ifndef FS_IOC_GETFLAGS
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
