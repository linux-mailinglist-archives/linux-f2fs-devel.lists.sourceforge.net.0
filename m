Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAmXDGXm02n/ngcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:59:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D50EF3A5819
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=810SjkYvRHhzbbOfqlrl+tFQ346IWiEJ4R4wiFaMedw=; b=VLCVfMHP3JJnRYfRmBPN2tZwuK
	9aYdnJesQNHtDyks8IjRn4d7i9w9of2cWQ6HWuvzzcIg8rnzK7RxQDI2Lr8eHI1uwtguaLpL9Kwfh
	xItQ7j47eX5nCoXyS26nhHeMXCfIum1AYcvhA+77Z6XiHRg0ZNskiYYbmIVziYY+Y30Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9nI8-00013E-4l;
	Mon, 06 Apr 2026 16:59:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w9nI6-000136-Qw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qpy3XgzYpOSeKcuY8yo2kQHnEz6KIXqUuOuiuE8EIbc=; b=IH5yM8DHm+74xwBgdaN9iN8zuu
 4YzN+4rYq2K50juGvcwmiji8Cpj+EoxKnrwYGtjh48O2zi2TQa4F8iTNLWRrHeKHrz3ADRGL7kp0/
 rzha+zWWRNCOa2e/zp+GMg3pDkq7Q5wAyDJ6srJAeFx4Q+1Nh8sg33vRC/oErTobT+cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qpy3XgzYpOSeKcuY8yo2kQHnEz6KIXqUuOuiuE8EIbc=; b=m7mSmzbOoMlhLQr8CU0R7+NpZM
 3VplsLGW03Gk/q3exx/HbBLTIHSWb4J0rcI6SK2dtGBHXgbmUghp0AZO3Mui8Oz30X9yy2dS5auIM
 e2VDOySMHoFpqDPZ0koghLrnxqtsJGj0ry1/JR+EIUfxNbymKIYFHkQ2drB1q8SuPuTY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w9nI7-0004jB-8g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEA114361C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Apr 2026 16:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DD7C4CEF7;
 Mon,  6 Apr 2026 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775494745;
 bh=JnUSoLwMNEX1f5Idq80dTBMfWUNYyhplSRdQYcucWAk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Wpnjr7+EuQFtm7kBNLzFWnDPygYwW/ewq1uo0ODr53AR5n51WnbDEg0QASlJVeNJ8
 k4hWXgRyddcaKUj8xHNXK7MG7LYdj3ywp3BauNTfs75pUeuIvBOwDConEZwTWUaEUH
 h7l25fatnXkADOW1ug1M/8xWEkbjqBXmQAJTdqaJInRpCCcvqEID/PLW0++IR3r01N
 IPvMKTg4ThSyGUm9wbkKZQig7QVXZzqaoKFC61OqBALvROUVbkJn3gb6UwZjQrj3fx
 CLsD/Ww6l6hoHH9G2sRYo24Zf4hxwZlRPmw12TffbkColPHWNB8z2n8YpXyHHrquKD
 JSUgh8umT6/oA==
Date: Mon, 6 Apr 2026 16:59:04 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <adPmWCgtruKjGDYO@google.com>
References: <20260331174326.231867-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331174326.231867-1-jaegeuk@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's check mmap writes onto the large folio. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c | 3 ++- 1 file changed,
 2 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 2c4880f24b54..652b4534349b 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -82,7 +82,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault
 [...] Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w9nI7-0004jB-8g
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow empty mount string for
 Opt_usr|grp|projjquota
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: D50EF3A5819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let's check mmap writes onto the large folio.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2c4880f24b54..652b4534349b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -82,7 +82,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	int err = 0;
 	vm_fault_t ret;
 
-	if (unlikely(IS_IMMUTABLE(inode)))
+	if (unlikely(IS_IMMUTABLE(inode)) ||
+	    mapping_large_folio_support(inode->i_mapping))
 		return VM_FAULT_SIGBUS;
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
-- 
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
