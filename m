Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SGf1JLhOS2ozPAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 08:44:08 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96270D1A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 08:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=cVVvOBtW;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=V1GtZ9sS;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="K nY24Kp";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=K5YwCuI5;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPUCWqvtJXKd96pN6opBE1+AxZuIS1At2ZXdaIXKNFY=; b=cVVvOBtWQPHSZRfDgYewYYkcE1
	nAk1W0yv6osGIgukj3YksKZraGTXmm3Ijcxc2Mn1FkpJjaHx/fsytTN+BUCT98Bv8c0DFvq5tT0jD
	JsHSjzBOknk4GvT4AmBAxvHIY2PtYy7Dn0EH3u2AHsIbDgag0i+69cfppf6C1SC0Bw+E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgd3g-000525-Bl;
	Mon, 06 Jul 2026 06:43:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wgd3f-00051x-7l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 06:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pn/v4mi91yPi1z8my42KU//6VlnVSyj7cZh1HgSNcRQ=; b=V1GtZ9sSyTlsgfjJ4wVAv2ou/U
 Nby4ZjAaj1jgSHZEbp+wyHm0kb995x2p/MAd5q3VsS2DivXwcUD/XOxOAnmO/VI4z1bxP+OpKqplc
 BThuzGd+2aYXUHhmqUn1fjkwTDtkD8MPbRMSqPcxgRecxInaYI57SVFBIxxhYFlG2HmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pn/v4mi91yPi1z8my42KU//6VlnVSyj7cZh1HgSNcRQ=; b=K
 nY24Kp1VrPmu61UoL20U6YdgHMYYGialED2I0iz/8dahEq+o/4oC/xRRkMdmrhOt70Da11m91w7QL
 D+cZL5WKVBrx98iBV2C99sbbuas65ODIb3PeO3IdD7Wh8WQRU2M7uPB9EVDYySjjGLqdA5IUgUF/y
 wSLn2YyTOa2a//6k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgd3Y-0002lC-GF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 06:43:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A4F9341A39
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Jul 2026 06:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609F71F000E9;
 Mon,  6 Jul 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783320222;
 bh=pn/v4mi91yPi1z8my42KU//6VlnVSyj7cZh1HgSNcRQ=;
 h=From:To:Cc:Subject:Date;
 b=K5YwCuI5rEz4Kx4rJTvU1KZ9KXelowowpw/QMeiDp3ZtAf8hJeJIXoQqQGrFM2Y5o
 Ud+wp1tsh/uT5ihDkkMMIr/ENChpxH/2j76Tix7c04MmzasDwNE90Ni+SrY6fALGER
 5PQNlX6cbByQPlNFWIYoorYQfHrDqF1naLWpq47vwTqJeBJcWgyMN5dFotYGaGoTsF
 7+plrwqOccuXRKQqB3AjzE5krhTTINGmrx00PCk1wNF6o1H4tDcsaNOrT3bzEqQzle
 UGYlF5OcyPHTdz3YRFoFujJlgIesJAC109AdOJReXvhJsrqku0Lxum/B7ZVHjGtEBh
 9AIos5rAH0qDg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  6 Jul 2026 06:43:26 +0000
Message-ID: <20260706064326.3657995-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs has supported to report fserror, this patch adds support
 for f2fs in _require_fanotify_ioerrors(), so that we can run generic/791
 on f2fs. Cc: Darrick J. Wong <djwong@kernel.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- common/rc | 3 +++ 1 file changed, 3 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wgd3Y-0002lC-GF
Subject: [f2fs-dev] [PATCH v2] common/rc: support f2fs in
 _require_fanotify_ioerrors()
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
Cc: jaegeuk@kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B96270D1A1

f2fs has supported to report fserror, this patch adds support for f2fs
in _require_fanotify_ioerrors(), so that we can run generic/791 on f2fs.

Cc: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/rc b/common/rc
index 494725547..f51ad59f3 100644
--- a/common/rc
+++ b/common/rc
@@ -6257,6 +6257,9 @@ _require_fanotify_ioerrors()
 		x="$(_get_fs_sysfs_attr $TEST_DEV err_report_sec)"
 		test -n "$x" && return 0
 		;;
+	f2fs)
+		x="$(cat /sys/fs/f2fs/features/fserror)"
+		test -n "$x" && return 0
 	esac
 
 	_notrun "$FSTYP does not support fanotify ioerrors"
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
