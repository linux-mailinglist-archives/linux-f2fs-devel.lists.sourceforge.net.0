Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uFFEDm+8KWofcgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844B66C852
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=FpY2vfbc;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ZUDyqA3r;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="b BTU3rf";
	dkim=fail ("body hash did not verify") header.d=acm.org header.s=mr01 header.b=fRY6nu5k;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5VH/GysGzkzzllK+q5eV28kPbo6RN2FSd+LCCspUNA=; b=FpY2vfbcczdUvW8h9wMje5k1AN
	0SrabujkqW9EALsKdip+Uc3S1IVlRKZ+4i+irtcrT8S7K98qKWSTset22VuBsXVgiC6FnKEe83i8m
	Gj3RKMU4Z30HyckJn7/QReS/3p0cwpG6lCd4XPsELd4PT2Y3dGJ17mofOXfiBHRbr6BA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXOhX-0001oD-Ly;
	Wed, 10 Jun 2026 19:35:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wXOhR-0001o1-8z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ss6dt0W6pGQHZ3KjUAVeBVJg6y/d03ZEtqTdzEXaZrU=; b=ZUDyqA3r8aJGtzQ6bxVZfE+Hv1
 Z67x4hFyVNzVz1qpX7nrvTJ/raXUKfw6P7wta7Wc3BSS3Zl+timAmhRvksqZwW4MRd531kQbvgYao
 Lkeivjw0kAl8EU69nzF6Oi9BSQjOOPtEyOuvyDMBjK+sNTlznpT4Q6mcM3NIOUSjQuO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ss6dt0W6pGQHZ3KjUAVeBVJg6y/d03ZEtqTdzEXaZrU=; b=b
 BTU3rfur9by7y3/SWKiGoIU2OIA82SifNMsBhMM1tMsC0jNXkMYLXpWT3VC1BPm1nNjwwECCSqTks
 VXURqQf50xb2l0VFnQQ7ZaUo6NXcTSkIqLD7gskkO154pIWT7tBMpL8Q5nqO+Ha5hEk8P3RqfT5YY
 mh2vlITxdhYuItPs=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXOhQ-0001X1-0R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:34:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gbGFG2v1LzlgyGG;
 Wed, 10 Jun 2026 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received; s=mr01; t=
 1781120080; x=1783712081; bh=ss6dt0W6pGQHZ3KjUAVeBVJg6y/d03ZEtqT
 dzEXaZrU=; b=fRY6nu5kLdngmjradTI6V2xN6Ptgq7PGx+sVS0bmcyfJDtlQSEn
 83hkJ4whcUnBydUMLZo0bspkImKwonqk8p9xaON/JtdeXe+TOF6CwjpCqVujNK+K
 zU/k54GnrI/mvBrh8yr2aYcjFGRnm7EeyCma3YlvItsX7f0V6Xs/k/+6p6Z9+W34
 6q9g7dGdmrceSALKdayZBjsOwhv8uxcwmp7KklTkysaad99laI3doeTVgdtkryCR
 y+n4XpO5qIsuzYOg11FLCrJ/lJ1voBR0B05bb72uTBhXAyhMTD3ZlAvcy9yUSVxW
 4C/AiEsy7RvUvdJNgghV/RTsnqgw+rhEbuA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RvifQSE9gp5e; Wed, 10 Jun 2026 19:34:40 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gbGFC1sP5zlffvd;
 Wed, 10 Jun 2026 19:34:38 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 10 Jun 2026 12:34:16 -0700
Message-ID: <cover.1781119949.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk,
 This patch series reduces the amount of time spent
 in interrupt context for completing write bios. Please consider this patch
 series for the next merge window. Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wXOhQ-0001X1-0R
Subject: [f2fs-dev] [PATCH v2 0/4] Reduce the time spent in interrupt context
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:bvanassche@acm.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,acm.org:s=mr01];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,acm.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[bvanassche@acm.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:replyto,acm.org:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3844B66C852

Hi Jaegeuk,

This patch series reduces the amount of time spent in interrupt context for
completing write bios. Please consider this patch series for the next merge
window.

Thanks,

Bart.

Changes compared to v1:
 - Added an entry for the new sysfs attribute in
   Documentation/ABI/testing/sysfs-fs-f2fs.

Bart Van Assche (4):
  f2fs: Prepare for supporting delayed bio completion
  f2fs: Rename f2fs_post_read_wq into f2fs_wq
  f2fs: Split f2fs_write_end_io()
  f2fs: Run f2fs_write_end_io() asynchronously

 Documentation/ABI/testing/sysfs-fs-f2fs |  9 ++++
 fs/f2fs/compress.c                      |  2 +-
 fs/f2fs/data.c                          | 62 +++++++++++++++++--------
 fs/f2fs/f2fs.h                          |  8 ++--
 fs/f2fs/super.c                         | 13 ++++--
 fs/f2fs/sysfs.c                         |  2 +
 6 files changed, 68 insertions(+), 28 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
