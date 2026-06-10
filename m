Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KKYDNHe8KWojcgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778966C85E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fWC+0BLe;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DlwpQHb1;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=WBsR36en;
	dkim=fail ("body hash did not verify") header.d=acm.org header.s=mr01 header.b=o+GUne8J;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyHeQ8IzuqYXm/SWOnOOUz2Or4Xm5HjfVKq14be9o5g=; b=fWC+0BLeHV8IJ5/xwvGQAGkIHw
	4ZetaVsmn1LNzVIu8azIVmdtyOpeNM+wT6FKMjf1ZrDJHG9bjLwsEwidSQctJulce1xnu4XPpS1+y
	BKIYyA9OfblIHtcVDEiPvHHZyxn2dEDKzQ25hz4FPv9+XHue7vpdULqxYlIeHiRxFRs4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXOhg-0001pP-8K;
	Wed, 10 Jun 2026 19:35:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wXOhe-0001pE-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WnZa1xMVsraCioX1bWQhAMr3s/2Vza1UN9c9Mg5Uw3k=; b=DlwpQHb1X9mXcZHo/1JjZd/PWP
 MGCZbyUU/8iB1liSF1NEYR5ziAd/CvYE66vy9k/SqZj6JhFDRy/gDCREWO8yoXeFNfQzIaew/I7Mk
 0TTFCsBIgUbIlIJuw5i2Gp4xFFzji+53G4qhOZvC5tI6ChsulRfaUM9rMlDmfqEZeKSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WnZa1xMVsraCioX1bWQhAMr3s/2Vza1UN9c9Mg5Uw3k=; b=WBsR36enTPL1HYhuAkeceIZDdz
 pfWcOxq6ODH2wFAJ1wEIFhYA9zLSSJ7WURa7WxMKjP4AB/C9ytI7KHkcQW/VNmwRbsmthBSOImTKK
 /p7MyJxuKxEORcLvOZMdU7LE6dAWQnqshp4nrQZF0MJ9+gZ7bUC/eWZ6Lhr2D98hTelc=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXOhd-0001XY-BH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:35:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gbGFM37DdzlgqwC;
 Wed, 10 Jun 2026 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=mr01; t=1781120085; x=1783712086; bh=WnZa1
 xMVsraCioX1bWQhAMr3s/2Vza1UN9c9Mg5Uw3k=; b=o+GUne8J6Ky4CFv67CESt
 zbUuYtfMNN7SOXCRDRTeEWBT7+++KDp3vMdAQCCYpXhVLQLAlh9VnTopvMjZKkCY
 e4d5Lcm6Ccakabm9bZV4QeBU+e+quNkDB4Dh1fknL5d2Hg5LEo1zvFMLR9KZOWcu
 MRhNlyh1ElX8Fd4CKOF5++udlWot/v7dhLZMWtwqb2z/k1wOYIfqFB0q502KiYDa
 1JUXSaE4ueWoLVPZv/aqlPGs0qB4Honn6WHcqgG29UEXmh82Ls4kB5rhRuu5Nuj7
 lfJQpY4sj7CH6XM/lMTMgsNhZ97XnDFZf061f6/8OnzKLe0dFlqy2W7DfM21nJOb
 A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 51QnAAir0Ekv; Wed, 10 Jun 2026 19:34:45 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gbGFJ0bqyzlfdfW;
 Wed, 10 Jun 2026 19:34:43 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 10 Jun 2026 12:34:19 -0700
Message-ID: <d54744deb09adbdd290b19c2236cfd235df77c55.1781119949.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <cover.1781119949.git.bvanassche@acm.org>
References: <cover.1781119949.git.bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Prepare for running most of the write completion work
 asynchronously.
 Reviewed-by: Chao Yu <chao@kernel.org> Signed-off-by: Bart Van Assche
 <bvanassche@acm.org>
 --- fs/f2fs/data.c | 14 +++++++++----- 1 file changed, 9 insertions(+), 5
 deletions(-) 
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
X-Headers-End: 1wXOhd-0001XY-BH
Subject: [f2fs-dev] [PATCH v2 3/4] f2fs: Split f2fs_write_end_io()
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:bvanassche@acm.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,acm.org:s=mr01];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,acm.org:-];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,acm.org:replyto,acm.org:email,acm.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4778966C85E

Prepare for running most of the write completion work asynchronously.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/f2fs/data.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 080d69fa8cd1..48c004976c4e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -349,14 +349,11 @@ static void f2fs_read_end_io(struct bio *bio)
 	f2fs_verify_and_finish_bio(bio, intask);
 }
 
-static void f2fs_write_end_io(struct bio *bio)
+static void f2fs_write_end_bio(struct bio *bio)
 {
-	struct f2fs_sb_info *sbi;
+	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct folio_iter fi;
 
-	iostat_update_and_unbind_ctx(bio);
-	sbi = bio->bi_private;
-
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
@@ -412,6 +409,13 @@ static void f2fs_write_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
+static void f2fs_write_end_io(struct bio *bio)
+{
+	iostat_update_and_unbind_ctx(bio);
+
+	f2fs_write_end_bio(bio);
+}
+
 #ifdef CONFIG_BLK_DEV_ZONED
 static void f2fs_zone_write_end_io(struct bio *bio)
 {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
