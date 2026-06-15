Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GIO0E4XAL2omFwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 11:06:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B82684E05
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 11:06:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=LnaW+7FT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=IZ6rj8fP;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="W 2B54BB";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=icBl4NEk;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d+8Yr66kQ0cq/3BTO28ThPP0Ui3KhUuhKAR3rwy09sE=; b=LnaW+7FTEfQ+AgWcnJ65LPc5sh
	yxxgp/nknJznnslFpiBj8cnku1GlHbdXrOiGxg6VwKKR3YKGwTPFzj8VCmBUj4iQAbQqgPuJsAkbc
	Qphh/MLBLnSJ+6ZDhU7Mbz21e7/T3/JikVsyKMh4zaRgBTKKD3Z4jG/B/JjnFbaZEOKI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ3Gk-00035z-HI;
	Mon, 15 Jun 2026 09:06:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ3Gi-00035n-VK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 09:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZy5wMSiDgSztcVXwwgsTdupiVNDTJpjLK9MK/K3gSY=; b=IZ6rj8fPXvrqWDCEZ6ZAhLks2v
 5yC9i2C6RAYeYPhUl93aC4EZJ99D6JI4WZ4N73jodJDQkUX1Ll1C2kHFKUWaZMVIM9ATM7OWjWXY1
 os/s1Wo4NGe+gZiLXs4Jruv8vhiposDUUdku+RI/mKuNk3z5GNuxiFNR1DpERXIGbXOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XZy5wMSiDgSztcVXwwgsTdupiVNDTJpjLK9MK/K3gSY=; b=W
 2B54BBbA2cie1mvWQ1uQqnG98RaTsVFvKWAISkuSoEPcpJ2++oq/alet/wr+hHuQW7oIk7Yjzxhwb
 ORe+N6WHLIEW+nU6dcUQvCy90F3ijMV9aTv09/8/U2MRYvFhr9o5xX/QEbAx2fQ38YqJ954NsIWMt
 lgqIjqhvD6PdIyJ0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ3Gh-0000gU-LL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 09:06:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BC815406EB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 09:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBD71F000E9;
 Mon, 15 Jun 2026 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781514362;
 bh=XZy5wMSiDgSztcVXwwgsTdupiVNDTJpjLK9MK/K3gSY=;
 h=From:To:Cc:Subject:Date;
 b=icBl4NEkjZYxoQaAesNy536AkUfliP4BEpdFucWqv7Ei/M/hkX5WYsI8fDvBnhgKp
 W4o1npOU0ACDrEETt8VF4tjB3qt3Ellmj8XnlNxYZmtdjULcf7NFgkiIkgw++uQi8s
 njEzZp5+9INUEkO0RtTB9y9gYNYGRjw4MH8ztUvKZPuEAJiQAdS1Iukgr878RCe5fX
 PgUtckRNxO+CUZcEXRWGQpoN/cQOW/5JUEmlJsCz5vG8mp/GQdUYA0ilySKngpBzWg
 IbaGfo+4JvJNP9EPXAbUVHII+WVyZLeKLYigRiOZzTc9qe22Ays6fvYCM06+95w6q5
 hQhqt8jHvzvNw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 15 Jun 2026 09:05:58 +0000
Message-ID: <20260615090558.1627456-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs has supported ioctl(_IOR ('X', 125, uint32_t)), so that
 "f2fs_io shutdown" can be completely replaced w/ _scratch_shutdown(), let's
 clean up in f2fs/009. Suggested-by: Zorro Lang <zlang@kernel.org>
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- tests/f2fs/009 | 3 ++- 1 file changed,
 2 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1wZ3Gh-0000gU-LL
Subject: [f2fs-dev] [PATCH] f2fs/009: use common _scratch_shutdown helper
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39B82684E05

f2fs has supported ioctl(_IOR ('X', 125, uint32_t)), so that
"f2fs_io shutdown" can be completely replaced w/ _scratch_shutdown(),
let's clean up in f2fs/009.

Suggested-by: Zorro Lang <zlang@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/009 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/f2fs/009 b/tests/f2fs/009
index fa4a39d16..39a4bad3d 100755
--- a/tests/f2fs/009
+++ b/tests/f2fs/009
@@ -12,6 +12,7 @@
 _begin_fstest auto quick
 
 _require_scratch
+_require_scratch_shutdown
 _require_inject_f2fs_command node i_links
 _require_command "$(type -P socket)" socket
 
@@ -106,7 +107,7 @@ ino=`stat -c '%i' $filename`
 $F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
 stat $filename >> $seqres.full
 rm $filename
-$F2FS_IO_PROG shutdown 1 $SCRATCH_MNT/ >> $seqres.full
+_scratch_shutdown -f
 sleep 6
 check_links 1 0 $ino
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
