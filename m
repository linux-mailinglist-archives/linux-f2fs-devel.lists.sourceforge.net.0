Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKsDjnW02nUnAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 17:50:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B13A4E02
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 17:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQodJrrClytT76pgQRoKDrDxGqmKLJiHzNX7SvcX9/I=; b=BIkE5DSEtG/sTRz/jeLenF0OWU
	ehJf0Jvp4Ke1O3Zwih1Kk9B8FMLqwjPUeK5z0lCjoBJm1BytG65PPM9JR1Ghb5+3tTASfxOigoRbt
	w/uIvYfQ+oF+nNz56xQsSEMqgNzHtYLGCBYy5NGHYvEJguEpFtON1Zz4kH0uql/8I5UE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9mD6-0001DR-PJ;
	Mon, 06 Apr 2026 15:49:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w9mD4-0001DL-7r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 15:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QV89BbslFpUmgIv69CuvUMZlo/wPieXo3pLIO1o0cDE=; b=HbT9bPm41B/v7Q73iuyXe5RNfn
 Ke2n+EnF4zDR4FK3UNi3L9IYGBlB2EjyM0STRDXgPpDtbwrljcX+2xoosaXtWuJ2sM/Yq/BlH0Ty9
 lg4BwP/IUZHqF05e2gGZZI9lbsaYmO/AHk41m2h+qlScrN57bHga1X/o2EzIfSVUNgck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QV89BbslFpUmgIv69CuvUMZlo/wPieXo3pLIO1o0cDE=; b=C
 S48fIx0Qn8QO8uROgqkIoGr4a2MSccIpxlEqRmnF9uu2ENpafs6GBcqeGGTU3FQpJ7bKwwqkQfmMJ
 x8Xbh9XWiURrxJkykTPbeYfG1zroRfHLgjALUrPFmqzYfTZ8QPp1bBL5nUWpOEJclyk9WUEkjXFma
 j4KYUeaFT1vv3JSA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w9mD3-0003AO-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 15:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C8F660123
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Apr 2026 15:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8004C4CEF7;
 Mon,  6 Apr 2026 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775490582;
 bh=qGt/vVcrgk84aALtqO6DAf08kjxmhcsnqAaTnBsUDhI=;
 h=From:To:Cc:Subject:Date:From;
 b=Im45Uknv6jlzmzwjVupqtJ34PESXxdpa8Vkk/Y6IjOIddZZY7c4/l47VSm7Oy3JOb
 GZwTs25e848lHxGGrf29m1vNgO9ZaHcLcZaWPxmjLl119fNHQRm5hTR0uOtbzZSDIF
 hAxM20GhUPAV/LZ3LGIoNrtLNhOe6IU+AcN4E+1wNIr2Dcgjyv+OQqY1dBLLHusQud
 3nJ0r91n8gTttpSbEKIwhZOVvrRtL6dP0t5FX01ipLYzf/07t6qbG3gOs9vsxBIB48
 OHHOuxR9MTYcUotzZFH4mmN22f3TdVeTkwf95ZCDbR/+a+AzBeWmI11RTDEABQmKCA
 PKRwxKqm0Tykg==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  6 Apr 2026 15:49:40 +0000
Message-ID: <20260406154940.2407853-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's check mmmap writes onto the large folio. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 2c4880f24b54..edfc3a374c40 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -82,7 +82,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault
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
X-Headers-End: 1w9mD3-0003AO-Rw
Subject: [f2fs-dev] [PATCH] f2fs: do not support mmap write for large folio
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: C61B13A4E02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let's check mmmap writes onto the large folio.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2c4880f24b54..edfc3a374c40 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -82,7 +82,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	int err = 0;
 	vm_fault_t ret;
 
-	if (unlikely(IS_IMMUTABLE(inode)))
+	if (mapping_large_folio_support(inode->i_mapping))
 		return VM_FAULT_SIGBUS;
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
-- 
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
