Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kETjJJ1LkWnThAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:29:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB713E00D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:29:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKv7JqMPFAwghcdN6FnofRv4wngXxqihkctMcc20tkY=; b=bOeseVO+9m7jc2fI9VbWBXLkeJ
	MI9Esjh42GwmhJnufUnZ0b09aRX5HakqEWdAqrUgD0EfltEpE25DbW5hC6me3PwiqoIAwF3gyxah6
	JCg1z/SF8OJy/GgJxouGjkbK6uh+fvVTbHLzZedxezxh3ijtqhsTcNEylc2+xRjC4zmo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrTky-0003Wl-7A;
	Sun, 15 Feb 2026 04:29:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrTkw-0003We-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MEBmEJj4Lx77blnAPrNHY8Opz7mlS3KWYXj25KRphmM=; b=Y4m9GlibmMzrX5xJNsdFRVS+DG
 +/ZULAXLlUDwg14nkM2d+k0mJFcilH7KB9/0+W/stDaQ5TqHoFy1ql43Yut2hpkNtmMDMrmRwyejB
 jfz/gBoS5kbSi0YGgWPaSPIDYgi6atqbmFX+VuMMECz+hO7Xt2d/ff2QnyJ1XSkRM1OU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MEBmEJj4Lx77blnAPrNHY8Opz7mlS3KWYXj25KRphmM=; b=QsrJ7jBZa//+4ySWnCCwZ7h8tm
 8DA3uWpU4zkJxUl0F+VkW8tCIFc2L7BmnwWgONElhMUJGFkAYTd0lOS9dG2EZ+Wy3C3AsD4PHWWec
 1Wn7/bzAeMxAwq2yGa1O+gLtbAWEdlvWrivjcDaVS3zig0FDCRH2sRWXQ8i5Tos3FTUM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrTkw-0008F7-8L for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8184D6011F;
 Sun, 15 Feb 2026 04:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC98C2BC9E;
 Sun, 15 Feb 2026 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771129743;
 bh=qAgmjiPqLWz4roYqGvLmCTQrLya8NjoSHRNC3UUpZH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rTDwXEVXUzBUOyZJHtDYURGQUM9fHkROmzcEODN5XiBiJEdclruAKOsUJ61trfUMM
 9Jq/FMh6nSFUGlvJoeOdOiknvaAkLkuh2tX0RmSNllVA7LBpKMdnoSJfTZuZDN9b8s
 dZZEp/1LfHV+MgiS9/eL5pN7stbKDvxWJIMlPhH5MO93/kMNnScThbxppyribjYz3Y
 bEJjrNlSIViG5qlUG/MzBw8WcrhTw5AP8U0b7jNQ2cRkid6bq+2ASxsPyaMRkVJy4c
 GnVDj5VlNU8CbYKrpWslGJfWvxC8z7sK6PJ8tLDK5hs60aT2d63I1gsOroUCeINJvI
 wl2I43Yrnj9rA==
To: fsverity@lists.linux.dev
Date: Sat, 14 Feb 2026 20:28:05 -0800
Message-ID: <20260215042806.13348-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215042806.13348-1-ebiggers@kernel.org>
References: <20260215042806.13348-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_verify_cluster() is the only remaining caller of the
 non-large-folio-aware function fsverity_verify_page(). To unblock the removal
 of that function, change f2fs_verify_cluster() to verify the ent [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrTkw-0008F7-8L
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: make f2fs_verify_cluster()
 partially large-folio-aware
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 8BCB713E00D
X-Rspamd-Action: no action

f2fs_verify_cluster() is the only remaining caller of the
non-large-folio-aware function fsverity_verify_page().   To unblock the
removal of that function, change f2fs_verify_cluster() to verify the
entire folio of each page and mark it up-to-date.

Note that this doesn't actually make f2fs_verify_cluster()
large-folio-aware, as it is still passed an array of pages.

In addition, remove the unnecessary clearing of the up-to-date flag.
It's guaranteed to already be clear.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/compress.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 006a80acd1de..8c76400ba631 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1811,19 +1811,18 @@ static void f2fs_verify_cluster(struct work_struct *work)
 	int i;
 
 	/* Verify, update, and unlock the decompressed pages. */
 	for (i = 0; i < dic->cluster_size; i++) {
 		struct page *rpage = dic->rpages[i];
+		struct folio *rfolio;
 
 		if (!rpage)
 			continue;
-
-		if (fsverity_verify_page(dic->vi, rpage))
-			SetPageUptodate(rpage);
-		else
-			ClearPageUptodate(rpage);
-		unlock_page(rpage);
+		rfolio = page_folio(rpage);
+		if (fsverity_verify_folio(dic->vi, rfolio))
+			folio_mark_uptodate(rfolio);
+		folio_unlock(rfolio);
 	}
 
 	f2fs_put_dic(dic, true);
 }
 
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
