Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Fn5FrqCVGoimwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:16:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1874777B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:16:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YYre18pI;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XbDLs6es;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=VbWxma82;
	dkim=fail ("body hash did not verify") header.d=qq.com header.s=s201512 header.b=trJR+V1W;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFeEZaGNv78/os9ZxrVnNQRS2H5ocNfwIWm29hTjw00=; b=YYre18pIsZ60LJBojyHCAxf82F
	h+4WeGO3682OcrXsGhmKoxtioGAaH9sAhIr/YSB3szTfOsIiMV1c6x5yqFUTIRJuQXV3kUCBJdyHZ
	6NH+zIGngjnIPL/2KHm0TPvV+x4OaJU17FMUat+y02irMIjxskm8alpB0AeTWK8myrL8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj9xh-0007vc-Jg;
	Mon, 13 Jul 2026 06:16:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3497809730@qq.com>) id 1wj9xg-0007vV-JM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9E9llBN5BbvgowJzmsoaHolN7PYccrnfQ67fnUQ2Yvk=; b=XbDLs6escDfjcq9CwXwOs3XwQy
 YcgBXSVq+P+Bpsu0u11wz5cpWRy7CACb+1XmlK0bpyaI12D61Bn7XLyD05Aya14WdiS4cQo3gmVS0
 IVhFgZhCWbUmckorNLhKk7T1fpvJQFKxJ1AasOkffnkdf7elUECegcSWwSIU36zoeig8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9E9llBN5BbvgowJzmsoaHolN7PYccrnfQ67fnUQ2Yvk=; b=VbWxma82olyRsA2bu+CfcTOi2z
 4f7bFQhe07jPoqxV2NN00d1mLjsfsd6XEOEL7tOBzPnyLIiYkYIA7fm6d9hy/aRuT0H1RPXH1Ceyv
 T/UmKKhpZFuB1R5AyQLn/OmF+iepxEudSiBykAi/FgRvuUhTqjqbLK7xkdjvEiEKbOmw=;
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj9xf-000262-SK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1783923366; bh=9E9llBN5BbvgowJzmsoaHolN7PYccrnfQ67fnUQ2Yvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=trJR+V1WDIuuND4QuZKEJWXNcxaPRTKdp6Tr04Z/XqRZqcgE/xuDSiXGl3FVlvQwU
 Yqz6hB8iuUOdvN6sKkHXlknnsaSsrutUMBruWm2YHCzUB1vnUgMD7a46H80hTp4GbA
 U6Z4d8hQ+sHg5Z+YR9/w/KzT+1K916Ltl9x1B2j8=
Received: from ikun ([221.176.157.250])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id 40327604; Mon, 13 Jul 2026 14:16:03 +0800
X-QQ-mid: xmsmtpt1783923363toj50uo25
Message-ID: <tencent_90E4200062E0A9E878FE14F33C2142E0DC09@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfvGucvIW0S0ovxLtGqMxThm81AO11hogivdm8ub6GHPzED5BWtV
 Fw1//pJyj8vkmMZFYJSLmQWQaMVcUjuq8yknQw/0S1iyX2m8L43Ahs6jrEqpl2p35eHkxKv4HBU0
 /KQrjWfdUbMxP97n5t/Is/aRAw1/YX6h+PMjmyM4C0nBkTtE0WN1AwCKz3e1uExJpOJ6Snih7//h
 V0O0PXKXVguaQfyAzvo6OhUe8iFGhWnVToOdnz7gPaDGUBA5gAq/K9s+5gaveo6hj1nvSjNxc1Uh
 ltQ5Dp99XgAzEQ8hJ8gxP0nMewRXJZbG0PPpfPFO1lgX35Me267qVzussi5apWYjbLY4vZw4u6K7
 rOG7DJNolAgAp3lI3zqYS4KnP0IcCH5c7GssQAYfO8m895ZgKcz4jwR1VsXjXPlpPzCGosg3KKrM
 DT3i+cjQRxTN+P+awznlY1w2K8tUHbwCpQ5OsiCywNYJ4V3Xd5MOqV1++xKZAi8TQAGZ875xMkTd
 m/0Q6Zaf6+dluR2xZqKK4I3C2lFuI9/5EAsQgty2LlfCvHGXbrWg81ot0RK0CnShZy3JJkjqA0bC
 dkYrXSg49DVw5O5XWWTvdgT9KjbpTIxNKFwe+46bCVTxOG+13+DySd/dd+A3W/eFtgFm3lzmbhou
 l5KamGEdIYG/8toTobWutInYTH2mUGRv5UOItAp7/lMet+AHYa3FEvO8DoWLIZe3j0L7MeWIbAVC
 q/N8ktYk+G8deAhhmaFQHqPVFdv3GIj+Tytgnwk5lHLU52I6XeFjjDLCp2+qe3BEx0/b+E16JrhS
 zKYRFe4yz6Nn/Rtu0MCMZCcd44fMbK/me72FwPy9FxXaFy4Xr80LlGo12UvFYG+a5AKV8Z37Azum
 VuBVkvD5Vrd7tfRfsa3yg2txMBLaHg5wa9HbeQ5hKoWsTwqItL9O5V/TG6rTCYhQepD4hcyK7rFV
 pm+TpTnuAHouPtMOV9l/tZ7Vmfl+sOoUn3YR4b5FECk+tyD6w81R/5A2FIq83r8aKEuLmfX8oB6d
 yVd+x2DvX2cXayP1egRW5jQ/XPeBf7966L7ZYeYikPt1eK5Mu18ZyL8cFcdReoHJEl2b3T45IukW
 pDPpv/Gv2qr3ACrY06thvYpfy3Mw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 13 Jul 2026 14:16:01 +0800
X-OQ-MSGID: <20260713061601.712-1-3497809730@qq.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260713055959.1865-1-3497809730@qq.com>
References: <20260713055959.1865-1-3497809730@qq.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_get_new_data_folio() documents that ifolio is only set
 by make_empty_dir(), and that ifolio should be released by this function
 on any error. The allocation failure path already follows this rule, but the
 f2fs_reserve_block() failure path only drops the newly grabbed folio and
 returns the error. When make_empty_dir() passes a non-NULL ifoli [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [3497809730(at)qq.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [3497809730(at)qq.com]
 -0.0 HELO_STATIC_HOST       Relay HELO'd using static hostname
X-Headers-End: 1wj9xf-000262-SK
Subject: [f2fs-dev] [PATCH v2] f2fs: fix ifolio leak in
 f2fs_get_new_data_folio
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:replyto,qq.com:mid,qq.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85F1874777B

f2fs_get_new_data_folio() documents that ifolio is only set by
make_empty_dir(), and that ifolio should be released by this function on
any error.

The allocation failure path already follows this rule, but the
f2fs_reserve_block() failure path only drops the newly grabbed folio and
returns the error.  When make_empty_dir() passes a non-NULL ifolio, an
early f2fs_reserve_block() failure can leave the extra inode folio
reference held by the caller.

Release ifolio on this error path if f2fs_reserve_block() has not already
cleared dn.inode_folio.

Signed-off-by: Guanghui Yang <3497809730@qq.com>
---

Changes since v1:
- Check dn.inode_folio before releasing ifolio to avoid a double put when
  f2fs_reserve_block() has already cleared the dnode.

 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a765fda71536..6c573d392dac 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1477,6 +1477,8 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
 		f2fs_folio_put(folio, true);
+		if (dn.inode_folio)
+			f2fs_folio_put(ifolio, true);
 		return ERR_PTR(err);
 	}
 	if (!ifolio)

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.52.0.windows.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
