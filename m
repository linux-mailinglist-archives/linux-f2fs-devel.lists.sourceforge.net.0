Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB1NIeLmkGnudgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:19:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354313D47E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbfU09QFWh3gACBhZS5PWmSHSrSBrXj4K0t5IvKVtq8=; b=aohNR3tZ8xADW/oNz7cfJZ/AfK
	169bGEjDAo0V9pLP9DXIlYaqEr72nr09sKD/YOKgQrHtf50ScTiI/dXqVJnwoFKev8LVZQmh+7gjJ
	YPwRgs8DYsWee9yu1jsfijZpPlRuoXht7X1BxXQm+ze5EJuGYt4TCC4VLin+875S4jmY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrN2y-0002ag-Pc;
	Sat, 14 Feb 2026 21:19:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrN2x-0002aa-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tkUA8ktbkYiWa/x6JFodpj4cUsQEuxbGLvrVpCV4lm0=; b=ljpeedBVM4fknwwjkl8eGm1Coq
 pB2DcJc/zzCqjUSdoN44WDGv8i3tPN1iXb6qZ2p67UkUzytYpe8aXiaAL5WKi3ND//rB/rbBvMT/d
 +8o7kTgceT88jUEIekXt+sDXLH3G42DLHVMEPQmsVx38lBOGEP52G098K2lKjNsAC3ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tkUA8ktbkYiWa/x6JFodpj4cUsQEuxbGLvrVpCV4lm0=; b=SXxfz2vjhCkF5zCscMfR/mdtXr
 6jX0dkCfCkQla1WRXlCXiLTnpWGKCL+QngiOF2NhAHNfNGmOOAm3uUduOnxl33gx/EPsF0HcQlphx
 imckYoft3oJRdlgWDUocfucQwBA5V6/Ki7m/p8rjT+HvcNxjwJGVoHfwBCUTde5TK9Pg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrN2x-0004Nr-GP for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CB46444FA;
 Sat, 14 Feb 2026 21:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73762C2BC86;
 Sat, 14 Feb 2026 21:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771103958;
 bh=SqjZE7OWr1LYIbtS0mF/zGZQM1kfgP5bCqVDUaHH/3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7dk/4hJDfz2a2DFP/ky+FC/zr1VGCMAcnzqPBKGoHK1uGXUuyHtT3QiP5nwNBSmT
 Cv0ctbmQfrbgi1In9FNHi+2S9HZWd3sDRnFYzMqrpzKqwOMQO3S+uU9rwc+7Q/O+n1
 ctMhmb0tD5Rsl0tJFukHYF62dyNfD2JjesmgbHITif6yioJUhDBxW4hfc78iXLcJvH
 TQpLow5iWffga9QwfqATTH8GwvltHHI7PR3HgWKHyAqVTOyUUC6qw2fOkOVG9CbZdf
 yl2MWWU7jeRpwB9fF+jBgG0O/unf0nyDEe8fntuceIjxGLXuAc1JdFDNiFk+FFANSs
 UFqpUipYswa0g==
To: fsverity@lists.linux.dev
Date: Sat, 14 Feb 2026 13:18:30 -0800
Message-ID: <20260214211830.15437-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260214211830.15437-1-ebiggers@kernel.org>
References: <20260214211830.15437-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that fsverity_verify_page() has no callers, remove it.
 Suggested-by: Linus Torvalds <torvalds@linux-foundation.org> Signed-off-by:
 Eric Biggers <ebiggers@kernel.org> --- fs/verity/verify.c | 4 ++--
 include/linux/fsverity.h | 6 ------ 2 files changed, 2 in [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrN2x-0004Nr-GP
Subject: [f2fs-dev] [PATCH v2 2/2] fsverity: remove fsverity_verify_page()
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 2354313D47E
X-Rspamd-Action: no action

Now that fsverity_verify_page() has no callers, remove it.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/verity/verify.c       | 4 ++--
 include/linux/fsverity.h | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 31797f9b24d0..3e38749fbc82 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -431,12 +431,12 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
  * verification, then bio->bi_status is set to an error status.
  *
  * This is a helper function for use by the ->readahead() method of filesystems
  * that issue bios to read data directly into the page cache.  Filesystems that
  * populate the page cache without issuing bios (e.g. non block-based
- * filesystems) must instead call fsverity_verify_page() directly on each page.
- * All filesystems must also call fsverity_verify_page() on holes.
+ * filesystems) must instead call fsverity_verify_blocks() directly.  All
+ * filesystems must also call fsverity_verify_blocks() on holes.
  */
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio)
 {
 	struct fsverity_verification_context ctx;
 	struct folio_iter fi;
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index fed91023bea9..6de3ddf0b148 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -280,16 +280,10 @@ static inline bool fsverity_verify_folio(struct fsverity_info *vi,
 					 struct folio *folio)
 {
 	return fsverity_verify_blocks(vi, folio, folio_size(folio), 0);
 }
 
-static inline bool fsverity_verify_page(struct fsverity_info *vi,
-					struct page *page)
-{
-	return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);
-}
-
 /**
  * fsverity_file_open() - prepare to open a verity file
  * @inode: the inode being opened
  * @filp: the struct file being set up
  *
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
