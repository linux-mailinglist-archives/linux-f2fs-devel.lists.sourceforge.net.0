Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Keb/Amf5L2pBKwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA36868CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=MHmlYR77;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ROzqckSZ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="V G/GkSV";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=fBUOLKXL;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jHgkvUW5Ksf1RqDmqYyzSANuRFhUfXDwf0Gs7jbEVU=; b=MHmlYR772JVgzuhrw1gEERFt68
	HsugCeolHeITeucaUZEMLIee2HtLPDXcFXCNdONLsByxrGGj5ifSASv0YH8RdJY/9a9sezF+GVo1D
	wse5bFaF2/9sCxuVdH0Q1vxJk2do7sxprDLxzTeTJfYdsfBEx/XrbetZzgsTstJXRlGU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ73V-0004NB-Lo;
	Mon, 15 Jun 2026 13:08:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ73T-0004Mv-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Raq7VNbdBNt9d4hB9e6oc4gfaUfydpebI3wex4IWKUI=; b=ROzqckSZhvQBgvgi619JS6uWrd
 Cuy9ZKPWuvKaZWIPqRIOrn6fCah/TYmoTYvpDbx3v1wkvmBOMpVoAJg2tuzkXZpPFN2azWAkMu6FY
 XstSU9c2u+uHNPwAGHTYNVBpMqQ8Fk9vGki+s+xsMQDmCSfWrVsvuH7+PpPj9rVtqOMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Raq7VNbdBNt9d4hB9e6oc4gfaUfydpebI3wex4IWKUI=; b=V
 G/GkSV4zg7aW9Z23UUZeuAlylZ31+vc1YLqCGkQ5J81EvSX2tsYJpndqx7KWtto3P184rWhfNC2UD
 zo/rxHChIvtDKC7cQKKeg34nZgyVCy3F0dHnNOV1NKKRuyp/ltvspVkVpLJlFmvahiGmQreq4CDfy
 Bz0sANI7VKYwARso=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ73S-0005wc-FF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 351BE6008A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 13:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F941F000E9;
 Mon, 15 Jun 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781528911;
 bh=Raq7VNbdBNt9d4hB9e6oc4gfaUfydpebI3wex4IWKUI=;
 h=From:To:Cc:Subject:Date;
 b=fBUOLKXLl3qHlydK12wL105ju8FAnoFrKX1QA59SVgctTxQKHV80VxMfo+pnnxsjM
 mKrI+23yVF1JyJ46py+lAQmyj1XKj7OZl04AYptyrBdAywqQg4NmgTUGUhz7LkxwHD
 8ppfmrMl2rb0uXYNfr+pLQFELtvvG/HM8i3yQhDvhCJQUA22Ixm/dB08p9L2m4uXrf
 a+aC+PxK/lCGz/gO/WwgM4eWlc6V3wZH+jI0KRxKy/NlacHElCaJuXX7bIq/h4byA2
 uqV94yQvW+oRba5GZDmfqXYI3Avlh5FQ7tWv6Jc3CCNRfcXgN9N+rIMW+hsm5cX5z/
 5DiGgCI/PzUNg==
To: jaegeuk@kernel.org
Date: Mon, 15 Jun 2026 21:08:17 +0800
Message-ID: <20260615130822.2576088-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes wrong description in printed log: "SSA and
 SIT" -> "SIT and SSA" Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/gc.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ73S-0005wc-FF
Subject: [f2fs-dev] [PATCH 1/6] f2fs: fix wrong description in printed log
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
X-Rspamd-Queue-Id: 85EA36868CB

This patch fixes wrong description in printed log:

"SSA and SIT" -> "SIT and SSA"

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 69e0a867219d..0e537508df20 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1897,7 +1897,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			sum = SUM_BLK_PAGE_ADDR(sbi, sum_folio, cur_segno);
 			if (type != GET_SUM_TYPE(sum_footer(sbi, sum))) {
 				f2fs_err(sbi, "Inconsistent segment (%u) type "
-						"[%d, %d] in SSA and SIT",
+						"[%d, %d] in SIT and SSA",
 						cur_segno, type,
 						GET_SUM_TYPE(
 						sum_footer(sbi, sum)));
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
