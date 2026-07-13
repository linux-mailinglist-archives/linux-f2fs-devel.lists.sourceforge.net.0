Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x96sBKZ/VGq1mgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:03:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA17476B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 08:03:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=O03BDILZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="Ka0/T3h0";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="W AuZGkQ";
	dkim=fail ("body hash did not verify") header.d=qq.com header.s=s201512 header.b=uVkf2Jdp;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:Message-ID:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBrP+oN/7FUQpiGuSP5wx2AUbAywF0wbynbAHfvUE1A=; b=O03BDILZcnbu7MY6/zssE8ZZCs
	QFnFLSQGgwIqyCNDZ7VQUwU4iMAByaPUGTqpLAILXfppWfwQYFJGo065HbPg+uh+AfFwFlSNydtVf
	2W9CVWjd+SyeSDhLSxhW/rGwfcmDWVNW34/qq3USiMH43TAqi3CoxF2tozoXsh7aZr+A=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj9l1-0001vw-RV;
	Mon, 13 Jul 2026 06:03:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3497809730@qq.com>) id 1wj9ky-0001vo-5h
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject
 :Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPnUTBnX9rEUlFodo3utzbAQ5Y2INf72HuDM7nHGsLM=; b=Ka0/T3h0apPoRWJ/GulJtU0T2z
 L/n+vSLZyKYcKxlXlIIUhEEo2pPTF7Y8LEiWJsysqTkFPAIumJF7oLUW1qEv+VFtcsZtLkEKrC1Qm
 3/LAHrajIw4H0U9KyGnT2lslloUhaHiWrYpcsXh7hUVQvktDJwpUOdgjy16qpYPRmGhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Message-ID
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fPnUTBnX9rEUlFodo3utzbAQ5Y2INf72HuDM7nHGsLM=; b=W
 AuZGkQCafDvhAHwe8E7xauzHB46aVbRky4n5h+o6i1j+exXiyNmogwjwqbV13KUelNTdJz1AiNuMh
 91Dpz74M+J/tnL/w/0waWkuwfF5rZNG4CljH2mOsqePFajihoQp+yz+g0UDIBc064mAt6ws5/gz+5
 IysXejMYXe/pb+gk=;
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj9kx-0001NQ-Vw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 06:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1783922580; bh=fPnUTBnX9rEUlFodo3utzbAQ5Y2INf72HuDM7nHGsLM=;
 h=From:To:Cc:Subject:Date;
 b=uVkf2Jdp5yL72Ed+0WsgqQxoOmKiMJpRpvTJ3RhZVJpEkiMlu6D1GXItgcZM+64IX
 dEGg1gQdwnVC7oJOCbMG4BmEKYUdjjBSQ8eD/nPnjcKvyafPP9o7FoqvKkwwaIi72f
 GSiiPBYrqZRvDG63zFjjWTB9d8KnvUX5NphbISHk=
Received: from ikun ([221.176.157.250])
 by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
 id A7374EB; Mon, 13 Jul 2026 14:02:39 +0800
X-QQ-mid: xmsmtpt1783922559tbrq6dkau
Message-ID: <tencent_AF84C3AD07E239869DCA86274251CDB33905@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SXgPSVEYKvnhA1jm6i3a0BfEJEoRmvuWlYtYNoiTmODQhO4/YlG
 DcqAd18pnmdNL7MOyzIgWyapmCOqjmNx0jsxy9S9sJW2nC7ClMG0dDQvUaqI9fzA+rW+WsYoTzm1
 hFDaaVVD3kByE2DnM8LdO2J/ZPPhpVWJhMHyvsE4v6riQur/Ll2HgkpI9yH0Or6cH6wuibpb9lR5
 61/zKYU6PF4c7PFczix9WTNDQmxbutB26yH1Eflkh9Di6K4FoF8fbMxkSpB8RNYlF4+mosUPJTFg
 XJ2pavgdNvUO2bICkdkQUOOxtFz6KQZtuRAIST1jpWJtf+Uq+JDX2EOdUbtFro7ceRSnEB4DZBAb
 L6183O3loblS0+ZnClcblBkn8LMOMgR8D8P2mZc6xS0mFy30lQu1Z/+JGgz15deiNinMw28IoVjW
 7x8+EjQZ4goLLAZGlZQ4ig9GirZkNDIn3aCHHbEZmQUnj+97vAUgCjfYojwh4GqsMh0pU2RM7JM6
 ff/swKvor0QeP4AiZnAKxHve4KwowwkN7z2TCdiuRXiKFH8V1/umwVDg+9+LR0mEIsLnZxBJpLon
 s9sEZZ2qBeEQDN8N0KLtmOWQvusgXQbSeSSqvugRFkVmywb68yuzB5dQMujtM1zVze+fLZk63mKh
 xFNfM45ZM5uMry7RXFjWMHXh+xGjKYzgqDYVZU8Zo6UnqwvAeEq9a/Qi4uQsgIwFMQ4d3A28GMkc
 Nb2DkabSc+4sYyN21q78jOhQWG0FwPI0prWWD2EPGMe/8AKhygNGpm4sJVHf30KkGd9uEVLM1vfB
 6qZLZo0aWv5G/TGwEVe2I/3wj9GhXEsV6zJXncQGmdrtqX1UEFYYvzA2DCaH9QOwVnwug+4nTBxY
 nOoWnjnw1+brezWpC5lH2Lp3prumMsAsI42xzZhhwKpi4Z7VUVFse7aTqwdqnbLTUt0ESo6oxuqc
 Jt+Jiqb15LJqf25mQkyYgS54VOZVmUVOWw5ZDmY+PbpIF5odN486Qr+APFl5NPMWfwpcy8H+POts
 nY0Ifx2EjfAX6PG2bFJZ/54Kho+Bg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 13 Jul 2026 14:02:37 +0800
X-OQ-MSGID: <20260713060237.548-1-3497809730@qq.com>
X-Mailer: git-send-email 2.52.0.windows.1
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
X-Headers-End: 1wj9kx-0001NQ-Vw
Subject: [f2fs-dev] [PATCH] f2fs: fix ifolio leak in f2fs_get_new_data_folio
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:3497809730@qq.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[qq.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[qq.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qq.com:s=s201512];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[3497809730@qq.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qq.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,qq.com:replyto,qq.com:mid,qq.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CBA17476B2

f2fs_get_new_data_folio() documents that ifolio is only set by
make_empty_dir(), and that ifolio should be released by this function on
any error.

The allocation failure path already follows this rule, but the
f2fs_reserve_block() failure path only drops the newly grabbed folio and
returns the error.  When make_empty_dir() passes a non-NULL ifolio, this
leaves the extra inode folio reference held by the caller.

Release ifolio before returning from the f2fs_reserve_block() failure
path.

Signed-off-by: Guanghui Yang <3497809730@qq.com>
---
 fs/f2fs/data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a765fda71536..e66aefc573d9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1477,6 +1477,7 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
 		f2fs_folio_put(folio, true);
+		f2fs_folio_put(ifolio, true);
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
