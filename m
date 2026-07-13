Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XbULHNqHVGrjmwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:38:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B9747959
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:38:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=FDq+HR9r;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=h2UB0jsJ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="W hIp99I";
	dkim=fail ("body hash did not verify") header.d=qq.com header.s=s201512 header.b=alfGJxvD;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:Message-ID:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlHO5/fQEForHBlw1hPiSuU6y3Q5m3jf3ZBj7yBxUe8=; b=FDq+HR9rlD0mV60L4msADNAx09
	hiCQKxZuP4VGsveW4eQa2gr3aXU0op5B7jk/dtSZ9lRbVe+tMzNIIw4WAxbDhTLzMgWdL9uJWqjN5
	troxfFoM5GY8CuaJAQ0C9s320mnJLjJvPcAfW4ONTzhqE9sn922OhWrdmwHlkBvFj1Yc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjAIt-0004je-E2;
	Mon, 13 Jul 2026 06:38:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3497809730@qq.com>) id 1wjAIr-0004jX-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject
 :Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhjgdXDXmVyJ2wLNBzBuxeJXJ2lhdZEYDtlsodvCRCA=; b=h2UB0jsJZi9h+5zHUXKe+UD2za
 0isbFiJScjIeT2YwGysIwTKXT/5f5FXwIDLowf5o04uv4ULngv/LUK2Z2awxxvwZrjk9DmvqeG52W
 hiQPNW26gGMI1HgpdpN3uNzkPwU0JfkzQO/SiD9YhMr9kA4tfrzHFY7RlsLWP4DHTBW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Message-ID
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FhjgdXDXmVyJ2wLNBzBuxeJXJ2lhdZEYDtlsodvCRCA=; b=W
 hIp99IGqUEUlzX8j+Q+5Ew306JKdOhQC4jOEuZ60S5vCsVty3YMO4g+I/Sc4wxqzXqIIuYxmdbjJf
 93orH/fiymywbGpjH8WF98d7IE3LtuzXyU/CIV5wrtQNTh9QSZkGHHcjvYGc3mnC0QIkoZm87qAYf
 n6PtpM6NQTVXVd8E=;
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjAIn-0003S4-M4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1783924673; bh=FhjgdXDXmVyJ2wLNBzBuxeJXJ2lhdZEYDtlsodvCRCA=;
 h=From:To:Cc:Subject:Date;
 b=alfGJxvDW4YzhLgAXVQxB9kx+vmNMQAahZGoKNxKqxIED7pKZj3vl0AE+00J1qAoT
 i+XnqgNEJJc3ZYp09gQ/fgSsHEsCSG8hNyz4/be+Ckxd7uEeHcRvTujoVK6mCw2hXH
 KgiJNyp/G0Rws6yutIK7QUJrpUQJaHtlNp0UA7g4=
Received: from ikun ([221.176.157.250])
 by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
 id 923052E0; Mon, 13 Jul 2026 14:36:35 +0800
X-QQ-mid: xmsmtpt1783924595tzzjr6jsm
Message-ID: <tencent_E3A22766836A9AE740D1CEF328C4DB8D0805@qq.com>
X-QQ-XMAILINFO: NAvK98dRmgdfiiCaRQOVQDshGjlGplufJSt526rpBFw65LInAVG8EMb5Ka3D2t
 GoiG2aTTv1jL/EkkpwDjujnW0TRDlFXq4Aha/P2SmP/UkbaukIWD0qyJjqnsr7Wo5UxXUud8oIMu
 3kQKKjJ/byOPJlTiv8ifoomJ2k/rMhpA3zJAR+oVCdVXEb9H2deRoTkHHDETcFiO/pD/4akxiYMD
 INCRQdm87qM0+JfGxgZyG46cdU6zU8DoiKkRG8qnL1dKh1pJBbCTF4jL/8n4S3QtcYvMjLEVi67o
 ki7l2cUYWClek50bjk/YuKt7ynlRfJgoWLmoXXGjijP8UkYX37YZH2hJbhFXOqdn7sID3IUlBX96
 NoPY5RS+FpNR2bFDg+6ZRaN3j5mOSt8LLXkySOMGYEtT3cNjR0OlGuL+IVP/nZNYRNk/LT0rTnuz
 q6qgBvDwN8Tghc2Sb+N0QkUCZ1II4eHz9wLmSr+Wlx/n00UE9wP1ZgN7uyPVoxY81G6MdvG+kNfo
 +DaOd/X2Otn/WLLqKsEL8aZFSPL7N/PVczmXSrSu9vUmZRYpK7CzGxasDmHeUNfptqDD7/L3HNZL
 bOqTXbqoS9mRWjTSWy5/MdI4sxOs5/NDZBWaVGwn3OcytjC/+oHhrkGSGnMBw76tKFmBOWEhCn2w
 MDFX6x/IN5Hp4MqM4L4zPIl0HPKQ9d553QZTuCuKGpy+qQsPKuXj98BkG825gTD8yxyyKhSF5y9j
 uCk/RwLQq06VOmjWRib7eKbJBjMQvMDiJknCSYFs2Mm8wRHnyetTpproZuxcwp/6d7MaWy75NjID
 iJloqu1MVKFJBlyOM5wmYySMIMiRaoa6R/KPzthsERnnie7kdYLK097zd6yeZmJm8ZfBWb9qVXTK
 fCJ2v0Y+Rp4P9odGdNnVerCchV2gc/UKXZ+pay0+AOwXMBaQqpu+mIW+o/0P73YLlSNwOLd37bNR
 U0PcUnW0ODHH/Yv9rbQtU1yt3Hakk708tS9YCpunoS/8OOX8ANvOw2giOv1XTSDSI99xsnt9xRp+
 C7vbMjXgdSOWIWsPwnN1WkqDfpIc8T6iG4V3ir3BuxcxKWdVouZAiIkEONnbU=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 13 Jul 2026 14:36:33 +0800
X-OQ-MSGID: <20260713063633.555-1-3497809730@qq.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_in_level() gets a dentry folio with
 f2fs_find_data_folio()
 before calling find_in_block(). If find_in_block() returns an error, the
 function stores the error in res_folio and breaks out of the lo [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [3497809730(at)qq.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [3497809730(at)qq.com]
X-Headers-End: 1wjAIn-0003S4-M4
Subject: [f2fs-dev] [PATCH] f2fs: fix dentry folio leak in find_in_level
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
From: Guanghui Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Guanghui Yang <3497809730@qq.com>
Cc: Guanghui Yang <3497809730@qq.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:3497809730@qq.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[qq.com,vger.kernel.org,lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qq.com:s=s201512];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[3497809730@qq.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qq.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:replyto,qq.com:mid,qq.com:email,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F0B9747959

find_in_level() gets a dentry folio with f2fs_find_data_folio() before
calling find_in_block().  If find_in_block() returns an error, the
function stores the error in res_folio and breaks out of the loop without
dropping the dentry folio.

This leaks the folio reference on the find_in_block() error path.  Drop
the dentry folio before returning the error to the caller.

Signed-off-by: Guanghui Yang <3497809730@qq.com>
---
 fs/f2fs/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a9563f7fcd88..0562ad211351 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -320,6 +320,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 
 		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
 		if (IS_ERR(de)) {
+			f2fs_folio_put(dentry_folio, false);
 			*res_folio = ERR_CAST(de);
 			de = NULL;
 			break;

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.52.0.windows.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
