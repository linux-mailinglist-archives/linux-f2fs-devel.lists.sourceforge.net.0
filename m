Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPdGHN4QlWmkKgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 02:07:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D52152767
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 02:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuiC2FKUBiHLSTjwHa8WBDxNAxoyOo4tohgICrf7zfc=; b=VhPkt3T4G67ZQ4ccenmhqZIbtl
	uUBiEyOjdYXkffl3/8eMuA427CqmM3EGnpkvosn5vrdM2Ao8Z6RzNVZgWLg1CJCcdl6Y49MldSLNp
	KmGZTlYuJPS6kei25G5BJHto2aMWFL3G51GlToEm9ouYj1pCoUq/KOEF4yDjH8upb7xU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsW2U-0000ql-Oi;
	Wed, 18 Feb 2026 01:07:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vsW2T-0000qe-8C
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 01:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ulZTndBaMOlQkLCLEeL+9GYxdlhoTC4o7T4/XMD6RPE=; b=idAwVrU3C33x+hJqrFrOaeB7Vv
 v906c1BAwaEnyE0dUY+lcQNp8C8K6CMZtBbqxxKA+LDR6XxghDHvqLR8e1MAM0aJmHDwAc6ddobW8
 q3k8hzFKDGRAxyFrnxgIgp6LbJVqirybeY3vkXgSQPn4UgSDzM7hCP6gqz1hG+OyzAqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ulZTndBaMOlQkLCLEeL+9GYxdlhoTC4o7T4/XMD6RPE=; b=kF9bDbeDieVydVEPSKoOcZfidU
 rm9sNGkyi06drafXZe9A3A/B/k+y8f17aiwd0iRW4RzNoJDculEMpDNOcSBPnpii4OS8jH/QijXsA
 ArCADRpVGIzSfk3SIRe2qyv9PnNnix+T5q/B2tP3n3cO9mhlqFaLCko0BnMISs1VrRAg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsW2S-0003lj-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 01:07:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A01D5444C6;
 Wed, 18 Feb 2026 01:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B83C19424;
 Wed, 18 Feb 2026 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771376846;
 bh=+CVW+jqAGcNQgZ9KfyjdE5n43SFWkJierbzGyPZLvRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MDBzI+ETOPtPNXj4q8nVG6tfq//g8NUv+bPnpFcwarAdu5fdVH4+tRCkC3FrOVEBX
 tNLKXhHKJZaUMRoyPyX5CuBmsl55h4dqLD19pKu+1Bpuwji/AoLtl4SsM9ZGDha4SO
 xtF3++c2KoYuZcszkDX+RINQxJ+udkvo8um77T4CO0iTQTXJ2QHqn65FQ1BhcDUO+q
 piHvt8XvyHIytzqAsU2OcfsJqIDlddtwz1bahMDuqbOBhjKisyjWbYV4TVUtYiiqsQ
 21O7cy4HrDLlVUJsngMtdJ5eyhL6gpH+1LUOtWYSb+umO9Ps5ifgvZsN/HCfSupb+H
 yyQPZ5CVZwb6Q==
To: fsverity@lists.linux.dev
Date: Tue, 17 Feb 2026 17:06:28 -0800
Message-ID: <20260218010630.7407-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218010630.7407-1-ebiggers@kernel.org>
References: <20260218010630.7407-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove the unnecessary clearing of PG_uptodate. It's
 guaranteed
 to already be clear. Suggested-by: Matthew Wilcox <willy@infradead.org>
 Signed-off-by:
 Eric Biggers <ebiggers@kernel.org> --- fs/f2fs/compress.c | 2 -- 1 file
 changed, 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vsW2S-0003lj-Tc
Subject: [f2fs-dev] [PATCH v4 1/3] f2fs: remove unnecessary
 ClearPageUptodate in f2fs_verify_cluster()
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email]
X-Rspamd-Queue-Id: F3D52152767
X-Rspamd-Action: no action

Remove the unnecessary clearing of PG_uptodate.  It's guaranteed to
already be clear.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/compress.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 006a80acd1de..355762d11e25 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1817,12 +1817,10 @@ static void f2fs_verify_cluster(struct work_struct *work)
 		if (!rpage)
 			continue;
 
 		if (fsverity_verify_page(dic->vi, rpage))
 			SetPageUptodate(rpage);
-		else
-			ClearPageUptodate(rpage);
 		unlock_page(rpage);
 	}
 
 	f2fs_put_dic(dic, true);
 }
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
