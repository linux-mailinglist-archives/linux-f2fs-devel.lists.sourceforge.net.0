Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQomGJ0LRmoRIQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE76F3F42
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ZgZ6qLu0;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DvqHRrjv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="A USv42x";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=T99iUY6Q;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9oNFmX+3gE57l+FeXcqVboyeZ+rTYQrI+shwZLSkY6w=; b=ZgZ6qLu0a/luCfX2aMJ3ha/uQm
	Kw49DdDkBGWSuWADYa5hpDGZgelF5S6Pgx4NGkYPXvLN9/2D15dOWHW4sWOfJbOG+6LztRYboGT6f
	c0OPqfH1ACt7uawnOXnQ2hJctIX5UT1zlYUgtKOPV980PbIg0WP4NovmY4ZeiueHBzQQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBLI-0003Wo-4U;
	Thu, 02 Jul 2026 06:56:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wfBLG-0003Wi-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hCWnuQMBFeJb4uvaKBUZjFpGfHanTgiE99CjQP4hc18=; b=DvqHRrjvLDOal6p+np4aUH7A0l
 qYgbylfh3h16PA/IywcXLlkUVWRz5bwGXV7HzDEFTHb81HlMIr8y7RWwkW0UCRXoEmqr+zJO1+00+
 IxfqYmpifta7t3m3V+qSGhb2zI1oD6SP8dQtp0bc6uZROwb3XoNEhEKhPH6t0JgGXB9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hCWnuQMBFeJb4uvaKBUZjFpGfHanTgiE99CjQP4hc18=; b=A
 USv42xlJPXt5CMHvAchVwNNHrxTGUzBw3SIc0HJn+FHCgVL/s41llFLQkWhHiSRX1E+sDNuijJade
 wdMNosdS0/7CL5VyIMSaomabQGk7GjIeW2NsSZ26etLQpDeam9zlRs9dzz5INGzZpQQht7zQSbskB
 z11iefGXjYu9RQKk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBLG-0002XR-BG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6EF6240448;
 Thu,  2 Jul 2026 06:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8021F00A3D;
 Thu,  2 Jul 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782975365;
 bh=hCWnuQMBFeJb4uvaKBUZjFpGfHanTgiE99CjQP4hc18=;
 h=From:To:Cc:Subject:Date;
 b=T99iUY6Qxeyr4LuGUzQpPLTztLzOpqw32rm4lmNjRnK8L59EjkJR1v5qi8owQzNRb
 CdK2slik/3xQeD2Jesw6tTVvFBN1phiGFOgD5sDIu/B+x+Ha/3Apc5EohLz5hOHjqQ
 ygZAyDF8yLpvrZaJJdllBSCt6dEOmekOWmYNJ0hzB6H0hGD9IJ6Tvt8gOwgy6hnzA0
 AKwCrWIDAUpSVrkHtbRAZG09FYDIZgLILIXb94bpUXUeyPnMlZT8evUW5oMWN+B731
 Qd0zsrn4wblmbpWos2ZVjBXJ9z7+oJxhUOPteE82BpFadfm1YQ7G9EBnf+k0rLT0t8
 zL4RoOF5xnMlQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Jul 2026 06:56:00 +0000
Message-ID: <20260702065602.4120914-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "xiuhong.wang" <xiuhong.wang@unisoc.com> After commit
 b15b6cc56ac7("f2fs-tools: convert to lseek() and kill lseek64"), 32-bit Android
 should also be built with _FILE_OFFSET_BITS=64. When calling the lseek
 function
 on arm32, if the offset exceeds 32 bits, lseek fails. Therefore, the flag
 _FILE_OFFSET_BITS=64 is added to support operations with offsets greater
 than 32 bits on arm32 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wfBLG-0002XR-BG
Subject: [f2fs-dev] [PATCH 1/3] f2fs-tools: Build f2fs-tools with
 _FILE_OFFSET_BITS=64
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
Cc: "xiuhong.wang" <xiuhong.wang@unisoc.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,unisoc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04AE76F3F42

From: "xiuhong.wang" <xiuhong.wang@unisoc.com>

After commit b15b6cc56ac7("f2fs-tools: convert to lseek() and kill
lseek64"), 32-bit Android should also be built with
_FILE_OFFSET_BITS=64.

When calling the lseek function on arm32, if the offset exceeds 32
bits, lseek fails. Therefore, the flag _FILE_OFFSET_BITS=64 is
added to support operations with offsets greater than 32 bits on
arm32.

Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/Android.bp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/Android.bp b/tools/f2fs_io/Android.bp
index 2cc81eb859d4..52cdb73f41d6 100644
--- a/tools/f2fs_io/Android.bp
+++ b/tools/f2fs_io/Android.bp
@@ -1,7 +1,8 @@
 cc_defaults {
     name: "f2fs-io-defaults",
     cflags: [
-        "-Wno-unused-function"
+        "-D_FILE_OFFSET_BITS=64",
+        "-Wno-unused-function",
     ],
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
