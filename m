Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLHdCiTckGm7dQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:33:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF413D21A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72C2rtOtqKIrzyOwNypJNWSGDbZq/uRFc2ubt7pgvV4=; b=AwWnmY70eQ2j7gyiijevRjuFRG
	5dCQL+BMX3wJAirF/JKOJd5VY0nfv4UwsHcG9LC9BIn9nbECSq0KclUdjZhZ7uyTg9Lrld8+caVSI
	8422mlKETy6MSdMgFfwaWo7hrCN7gfZMLt5HRrmhdjpTy5Ev3hdQ4mEXfDR6qV6Bv38g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrMKe-0004ro-QL;
	Sat, 14 Feb 2026 20:33:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrMKd-0004rg-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yqZEau5YwKCKMouYGMZh3aQRNT4Fre+DKK0GMC4Hq9M=; b=Y6lLmniUG8fnjFPFtsLe4Bb3v8
 86PUqMzTlQtdriaG6Z8EPSUkaMiv8JYpV2IGvZpxwAlGTPhaZSVFGjGE6//a5s06/l4Hdbe/fikQN
 cnU0zkSUC3MsdbzsPUPJvuiNQfkSWNTcnLNlrRzopdSGm9Ieh6waQKJSS+2gOSUAmVTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yqZEau5YwKCKMouYGMZh3aQRNT4Fre+DKK0GMC4Hq9M=; b=UqH8hM8c+5axejDIys21qnMm7H
 Cok8BBdf7K9cfQ9oB7Fe9Av6OkukhmKa/h4tnGK7f0C5nMEIE8LYIfxQ6Rwi7vcM8FaSrUBvOas90
 InXmtP3RRDfZcqAEF1KmTCvAOF5dP2nbuvip5JAqeTVHafsUqShSI74mXlFb1YGtXnc4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrMKc-0002z6-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A292B4437A;
 Sat, 14 Feb 2026 20:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD94BC4AF09;
 Sat, 14 Feb 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771101204;
 bh=0PXEdYAt/sVuxM6vBLkl5PSVhtNsF+qniTEX01KwCCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dlREuZd6iwFT/KKhXENR0eEBVhJ7tKBSqpwsfcNfOsYbXnCQXVUMNj59nm8uKwkyH
 O+6dzBuWc1jIfxrYvC6s05up+FDsiCA0+exggAOs2pNdrVYCg5N184zYdAtezgaTYi
 XKiGDzg4C4nRrfKIzi8YklvO8jIB9uw1xB3znKia0q74rmZwBA7WaO2vZ1UwzWlVJT
 KC26l3EWHa6Wp2h90QBM51E+uV7HabceuGfHUZ2MvCGPuTWOywcrOoUoxwOBaiqsP2
 iAfT5L24BEQiB+FaD3XdYMMrgBFq6erW7oKiNA3euc1NaQtMOj1JZz6jr4PIT0j19f
 NUjzxzsXI7HGA==
To: fsverity@lists.linux.dev
Date: Sat, 14 Feb 2026 12:33:10 -0800
Message-ID: <20260214203311.9759-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260214203311.9759-1-ebiggers@kernel.org>
References: <20260214203311.9759-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Replace the only remaining caller of fsverity_verify_page()
 with the equivalent direct call to fsverity_verify_blocks(). No functional
 change. This will allow fsverity_verify_page() to be removed. Signed-off-by:
 Eric Biggers <ebiggers@kernel.org> --- fs/f2fs/compress.c | 3 ++- 1 file
 changed, 2 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1vrMKc-0002z6-Uh
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use fsverity_verify_blocks() instead
 of fsverity_verify_page()
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BEBF413D21A
X-Rspamd-Action: no action

Replace the only remaining caller of fsverity_verify_page() with the
equivalent direct call to fsverity_verify_blocks().  No functional
change.  This will allow fsverity_verify_page() to be removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 006a80acd1de..6d688835387d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1815,11 +1815,12 @@ static void f2fs_verify_cluster(struct work_struct *work)
 		struct page *rpage = dic->rpages[i];
 
 		if (!rpage)
 			continue;
 
-		if (fsverity_verify_page(dic->vi, rpage))
+		if (fsverity_verify_blocks(dic->vi, page_folio(rpage),
+					   PAGE_SIZE, 0))
 			SetPageUptodate(rpage);
 		else
 			ClearPageUptodate(rpage);
 		unlock_page(rpage);
 	}
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
