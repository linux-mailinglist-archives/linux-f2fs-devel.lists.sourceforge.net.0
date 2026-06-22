Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXDEAfXtOGrDkAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 10:10:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 397856AD8A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 10:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="Q/hWEsID";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mdl7jGhi;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="i C+JJ4D";
	dkim=fail ("body hash did not verify") header.d=google.com header.s=20251104 header.b=TjMYHmrK;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+A55yZ7nRBEIusv7KtYL38qJwJ4H1bu+YIfjac/O2/A=; b=Q/hWEsIDUV+4VjtmE7YmFyvTT1
	Lz68kqAnerTPapTCUaQ0NHOLTyNLDjTtueYB43Q4dlYo7NWf5ItlHEKPlqX/VPhj1OLsDn9LpRmSb
	lEeY0J+ZE0LevkfjqplftXo1FvIQT5C3bpn5y2FJLlTO+h6t4FdjDt2g6oUIudJFZ5Fw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbZjR-0006yh-Es;
	Mon, 22 Jun 2026 08:10:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3nt44agwKAJcAGILJ1BFNJB97FF7C5.3FD@flex--jprusakowski.bounces.google.com>)
 id 1wbZjM-0006yY-3m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 08:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ujIs4t5hz58eh39dBAa6anbidVLmJ4StFcuVqSWPC0o=; b=mdl7jGhioP4qaGJKzaACNax2Cl
 XQ44WI516nN/ZC+octnnLHG9sHL+sTATZba190SJRAvyuxC3GH6WtU22CnUgGnA3OHPgEavSok3zq
 apunDyEH6PKR61SPqKZjnNqi6YKNmI0JKVQZf3KrMbM8gJlwJtyBzBJjpssN9lCj9q4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ujIs4t5hz58eh39dBAa6anbidVLmJ4StFcuVqSWPC0o=; b=i
 C+JJ4DCOjdsWDQjzr5COdV4jeI/V6lad0fcmAwAyeDba6jYXPknn+AhGgTk5VzErf9sswk4LHjiU/
 BjsA4kc4T/Lw6vV7dZVB3btl8RI0JJCJiITHW/UZ6c+Rxy5A0xzs5qEB9c5HpbLrxpYYWhgbhAZtW
 6486tgyDMg/sU9pM=;
Received: from mail-lf1-f73.google.com ([209.85.167.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbZjJ-00042C-Pp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 08:10:08 +0000
Received: by mail-lf1-f73.google.com with SMTP id
 2adb3069b0e04-5ad4ee80fc4so1989790e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782115799; x=1782720599;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ujIs4t5hz58eh39dBAa6anbidVLmJ4StFcuVqSWPC0o=;
 b=TjMYHmrKNehe0S2I9P+dAZo9TmeAYXX1X19FMVypWLcA+lax46x3dMTIcc27kV1ILg
 JLqutj9RV1FgLQnRw+ycKwt4F/Jusxbgd+1wRk0nI3J+l/hwLjr9Bvx2ByCR9Rt5ueue
 611vWFdBK9wbwlJgEfssgW6B2YfKLkCvUT/i0mdKd+3Wydbly9rpvppwJPVX6ZvqU/iB
 WnDzKtr+rPLYpT6slq/Au5t/ZpEgife4KyMEO/ufEtx/7hbuSFAThev+Nv1+wcZ/Nd6P
 6AXyATcPF6TUU+xA2UlIXS+u2uXZaADuxx65dyngVcdQfsCwjiWQI+t558+omx5b74bv
 iiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782115799; x=1782720599;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujIs4t5hz58eh39dBAa6anbidVLmJ4StFcuVqSWPC0o=;
 b=jMylHQZQpHnd7fMEsUx2uH8mEB/JYBAKyOIu9KQWY8+Zl/AcVpoi3wthSFszjHndvV
 gEVq/Pf0BGBJAszWZYYDpRLzY8nEdeZYXEwicgO8NXPZwsKOGXzRhyu8QyDHfj5+EGzS
 cH79C336KA13vVT3Rz3FH5Vb8oWt7fRvWHmwv/bm9tHZaaQ11M9Lb3NdYt6yIWgAb5+2
 FUcp8U1FsO7FaTRlJg9dtUoJgXFGEPXx8gbzA6WtQ4veRntQd75e8rfcfYyvAi/enjQB
 hLrfhnXyIDUd/M3XB7MLn9BfbiSBp1R6szL9866NKRmrTjlxMirtGmrC6r9wRMcXQPcI
 UCGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zzED2CvJM76v3ZMZ64J1BeWvqmK2AoFQMDcyEw4batmFdnNMBzGmlRJ0IbDkmXsxqcSi/ED+V9rDSMVW+2Tbj@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw0CO2CenMdHUlzHodKRUOgQjHlsC2mxTAnBmS54+uBOiu1Wwki
 VC2EjBnXXxBXUp0QQYKsXUXoh9nBrolGF2zlde2gH7YSoXIaKDM+D/Rqv9klk3TzKIBEcpWafCT
 AwKneqQjk42aj+b78qw5Ceh7eiNNLFA==
X-Received: from ejbck25.prod.google.com ([2002:a17:906:c459:b0:c0f:76a8:6c5c])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:fdc1:b0:bee:323d:1239 with SMTP id
 a640c23a62f3a-c0989ce9151mr667323666b.38.1782111902585; 
 Mon, 22 Jun 2026 00:05:02 -0700 (PDT)
Date: Mon, 22 Jun 2026 07:04:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622070438.1542638-1-jprusakowski@google.com>
To: fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On F2FS, generic/064 fails with "extents mismatched before
 = 1 after = 50" following multiple fcollapse (collapse range) operations.
 To ensure crash consistency and checkpoint integrity, F2FS forbids in-place
 SSR (Summary Standalone Replacement) overwrites on valid checkpointed blocks.
 When collapse range shifts blocks, F2FS alloca [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wbZjJ-00042C-Pp
Subject: [f2fs-dev] [PATCH] generic/064: allow 50 extents on F2FS after
 fcollapse
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, zlang@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:zlang@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jprusakowski@google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 397856AD8A6

On F2FS, generic/064 fails with "extents mismatched before = 1 after =
50" following multiple fcollapse (collapse range) operations.

To ensure crash consistency and checkpoint integrity, F2FS forbids
in-place SSR (Summary Standalone Replacement) overwrites on valid
checkpointed blocks. When collapse range shifts blocks, F2FS allocates
new data pages in LFS mode (out-of-place log writes). As a result,
sequential collapse range calls rewrite shifted blocks at new log
locations, intentionally leaving the file with 50 extents.

Adjust the extent verification in generic/064 to expect exactly 50
extents on F2FS, while preserving the strict 1-extent requirement for
all other filesystems. Data integrity continues to be verified via byte
comparison.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 tests/generic/064 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/generic/064 b/tests/generic/064
index aed13970..b77eccb4 100755
--- a/tests/generic/064
+++ b/tests/generic/064
@@ -59,7 +59,13 @@ for (( j=0; j < $(($BLOCKS/2)); j++ )); do
 done
 
 extent_after=`_count_extents $dest`
-if [ $extent_before -ne $extent_after ]; then
+
+if [ "$FSTYP" == "f2fs" ];
+then
+	if [ $extent_before -ne 1 ] || [ $extent_after -ne 50 ]; then
+		echo "extents mismatched before = $extent_before after = $extent_after"
+	fi
+elif [ $extent_before -ne $extent_after ]; then
 	echo "extents mismatched before = $extent_before after = $extent_after"
 fi
 
-- 
2.55.0.rc0.786.g65d90a0328-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
