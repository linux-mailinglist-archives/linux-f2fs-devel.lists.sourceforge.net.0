Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aTLYIN2MOGpgdgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:16:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A816ABED5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:16:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="A3RZEp/g";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=lYD9rRkv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Z yGuRWa";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=KjXXnwxx;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NpodgJBbA8DIzLqJyMiYeEcSf6vrzgXZHuRVYvv4US8=; b=A3RZEp/gX2fpdxtBOXN8Md6z6J
	A6Bm8zUQAmE1XlWkJ7Q0KsbMZS0bPmCcCXRmzN0l2x9B2InG6ywat9cEZSH+OaTk9hUcnrk7cbRfE
	athG4bBjwxa3YFLuxlce7lhidY+2Ba1g7PfnAoV8jwfP4gHfwkAKVacyUeMN3CwWknmk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbTGd-0007UB-KX;
	Mon, 22 Jun 2026 01:16:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbTGc-0007Tw-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIPzaruOWHqFKq/etE/EWa8X4ZRmucxNkS3ctpKMPG0=; b=lYD9rRkvfRhJAVqiwdveJXjeof
 HCm7z9GhLQYxWW/NkV6GB2BbOuvqNu4iSPc6CPa912A6SL5kcbBUq5vwsddsMS9XtaZacc8b74b++
 20/+4yRpe4b3ZvWGivPe8pPIITt2gDmK1aWdUpAQMV3/OtAbVyqlnfrMv4VRM7LecjUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oIPzaruOWHqFKq/etE/EWa8X4ZRmucxNkS3ctpKMPG0=; b=Z
 yGuRWaDxUcsbIQUaZgZbdHpX9IQZ3NgixRtLFl75Z8DZwZmcLO5kuiA/d+QIWZSMUMPSOxqofAPW4
 WJoOnZhDaHbl/VaXEpQsls8XyDh8om666PU9oTKUcqMSt45bzP2PBYeQS7daciAZaL2rXXTCNAFqc
 2ieJ87A8QDZ1996U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbTGb-0001i7-JL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:16:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 70A716001A;
 Mon, 22 Jun 2026 01:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF5B1F000E9;
 Mon, 22 Jun 2026 01:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782090951;
 bh=oIPzaruOWHqFKq/etE/EWa8X4ZRmucxNkS3ctpKMPG0=;
 h=From:To:Cc:Subject:Date;
 b=KjXXnwxxyMfMHdpYlLFE1ZJvsBE1w4e/aOTSuWkKgSWVay5ztrODw/XMZHvH13QSZ
 GLE1WoskpNJJV0aXLhRiIvzJLX7+fb/z8swqaKjCftlI9xl7qqczLEZDvNGNR3Wr2E
 IE15kL6lpa2OcjiuRcAa/LaMrEBV3RuCJxBsIDoRttXtLsa3+lEKsIbaiRHuhN+WRw
 7toRam3lV61+sPb/uZzDxCMDbj9xXyJ9v4a6Jsc4Oa7OKvb99xN0id70mmQ3BFnn2c
 C7wTmo/VJP+AjZsh9AtYmUfsjRex/q+TXFG0IFczc86slfXSfDbA78qe3iH6uBzcDu
 LraZFGM19x+Rg==
To: linux-fscrypt@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 22 Jun 2026 01:15:39 +0000
Message-ID: <20260622011539.2292553-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As part of the linux kernel's migration to folio-based APIs, 
 introduce fscrypt_finalize_bounce_folio() as the folio equivalent of
 fscrypt_finalize_bounce_page(), 
 and clean up f2fs codes with this new [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wbTGb-0001i7-JL
Subject: [f2fs-dev] [PATCH] fscrypt,
 f2fs: introduce fscrypt_finalize_bounce_folio() for cleanup
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
Cc: Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0A816ABED5

As part of the linux kernel's migration to folio-based APIs, introduce
fscrypt_finalize_bounce_folio() as the folio equivalent of
fscrypt_finalize_bounce_page(), and clean up f2fs codes with this new
helper.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---

Is it worth to introduce fscrypt_finalize_bounce_folio(), then try to
do clean in f2fs_write_end_bio() first, and then replace
fscrypt_finalize_bounce_page() later?

 fs/f2fs/data.c          |  7 +------
 include/linux/fscrypt.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ac1cf4de3d62..e0fca6c60e34 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -362,12 +362,7 @@ static void f2fs_write_end_bio(struct bio *bio)
 		struct folio *folio = fi.folio;
 		enum count_type type;
 
-		if (fscrypt_is_bounce_folio(folio)) {
-			struct folio *io_folio = folio;
-
-			folio = fscrypt_pagecache_folio(io_folio);
-			fscrypt_free_bounce_page(&io_folio->page);
-		}
+		fscrypt_finalize_bounce_folio(&folio);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_is_compressed_page(folio)) {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 54712ec61ffb..20b59b021c94 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -1132,4 +1132,15 @@ static inline void fscrypt_finalize_bounce_page(struct page **pagep)
 	}
 }
 
+/* If *foliop is a bounce folio, free it and set *foliop to the pagecache folio */
+static inline void fscrypt_finalize_bounce_folio(struct folio **foliop)
+{
+	struct folio *folio = *foliop;
+
+	if (fscrypt_is_bounce_folio(folio)) {
+		*foliop = fscrypt_pagecache_folio(folio);
+		fscrypt_free_bounce_page(&folio->page);
+	}
+}
+
 #endif	/* _LINUX_FSCRYPT_H */
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
