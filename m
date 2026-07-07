Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hL/1MZvlTGrdrgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 13:40:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3791971B064
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 13:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=iHnIh0p+;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KVA7R3ok;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=kpNRNGPQ;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=QsmyTKha;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KLU6a7gcPiOyNYi3Za1tzCGQ2vYT560CSko9cw8f0U=; b=iHnIh0p+/mulb+N0mo3Qw5ZLxr
	LvwInmqSWgTAkX9e4e1aCWDI6hQXWNGQPr5Tlgpoe0Q6vyS7hXPYNPSC8s1HgsdTXr7pnnZLgkYjC
	ivwem6lpL/5Q69DtHRhPeUqC0U1eZcyHWAtCtIdLDwdmS93US3E1ybmfHnctlG++k6DU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wh49g-0008PW-PR;
	Tue, 07 Jul 2026 11:40:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wh49e-0008PN-LS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 11:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpG7zF2XtrUQxf5E81O8+yc7rNhR3bN8KjXT1FV1NCo=; b=KVA7R3ok2KIr6Z6/4hkjdWOnMf
 QNNUzxfntEyubhmixjRg683oi0ngqEfpXSpEXb6bNOnkIDeSfmPcBdXZ9GciKn2CmN/Pt89csyN5i
 ybqzDMQO4XN8GQqK6juAwRYv3cm1E+Lvp78Ey70zG6o8R1dN9+CArqJ4H77FSar/yLnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xpG7zF2XtrUQxf5E81O8+yc7rNhR3bN8KjXT1FV1NCo=; b=kpNRNGPQ5ITK0wGVCoTTb8WiTC
 1XUKAa3nYMJKyzs/MNKAWyAXkoSwtYsUVdxcg4G5cIBUoUO+ExB5eiRAoruqZCic6UVSUkQGnL+m8
 MLmzaI9mQ3Is25qovqXy7jJoBLMzZB4pgw1XVng4aJf+VlAusQUMnIjpbAlTWiaRF1S8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wh49c-00052B-Sr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 11:39:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CB554618B0;
 Tue,  7 Jul 2026 11:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADAD1F00A3A;
 Tue,  7 Jul 2026 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783424386;
 bh=xpG7zF2XtrUQxf5E81O8+yc7rNhR3bN8KjXT1FV1NCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QsmyTKhakPVGBz/7sYQ1hi2DjLP8CNqTRHJuZwUuM5puMBES8umhGzyg4/Y6YOqnw
 0pmJARfb0DT0Zuf42iRp5CokIqSjhE4cttQJsdtb3EXgF/rhAcyw+vK+1f/ouyio+A
 Qaowud/6PwnxzBpOhKwu2D3ey6wCUvFVQSOIBfLSfKoUCOXkgJt/S2fC1/0iUnAxdZ
 F//yMiIEn1gVfqh6ZNpnEHCztGCXaYECaPfZ2rY6KRC0KWdUyo3QGRZ69c+OBPc2wh
 sr9Ssf69dQh2l0Pr8/t2druUSbObRjMt62XZWlc+NgFaDj3Nr6thAVp1KdvKp5CMmd
 6nqihuTnl5Xtw==
To: jaegeuk@kernel.org
Date: Tue,  7 Jul 2026 19:39:34 +0800
Message-ID: <20260707113934.3003158-2-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
In-Reply-To: <20260707113934.3003158-1-chao@kernel.org>
References: <20260707113934.3003158-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch proposes to drop FGP_NOFS from
 f2fs_filemap_get_folio()
 in f2fs_write_begin(), I don't see there is potential deadlock issue when
 __filemap_get_folio() calling into filesystem reclaim inter [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wh49c-00052B-Sr
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: drop FGP_NOFS in f2fs_write_begin()
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3791971B064

This patch proposes to drop FGP_NOFS from f2fs_filemap_get_folio()
in f2fs_write_begin(), I don't see there is potential deadlock issue
when __filemap_get_folio() calling into filesystem reclaim interfaces,
e.g. .writepages, evict_inode, shrinker.

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- just drop FGP_NOFS rather than use memalloc_nofs_* helpers.
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ac1cf4de3d62..be4c1d4ed6b2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3994,7 +3994,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Will wait that below with our IO control.
 	 */
 	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
+				FGP_LOCK | FGP_WRITE | FGP_CREAT,
 				mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
