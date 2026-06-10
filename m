Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PfwtKG+8KWogcgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026D66C856
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=aSGp6d91;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ONMi9U6x;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YRkF9+yM;
	dkim=fail ("body hash did not verify") header.d=acm.org header.s=mr01 header.b=wrLw1nTm;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ofL911hzT5QIlOuDPjN2ImAXT6axR64uhpiVIGK6hw=; b=aSGp6d91W5RmhUS4gOOTjssHh+
	Xo5TeWiDA0vNcy0mQ8aP5h/d1jhQLIgx1ntAZTad47vrWWzNhMa1gGPLwyOtM+JyFewTn1VIVxz8w
	Skll+fFFoOq4j9soLlnkO8/uhfL+EyMLMvpitD7cqrpFAwcgnbl0WWLeEmsO0yklysUA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXOhY-0006U9-6p;
	Wed, 10 Jun 2026 19:35:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wXOhS-0006Tx-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5zqlSQYoJLNe2EIlJEpXo+bYqvZDoC5oNl0kxVC2Tg=; b=ONMi9U6xhGY0vJ8E/kMDHsA3N+
 q3xpGHPoDg6aip9+CtEE3Aav8HwI/SgOQJeofgrZAKzk8+pAaGsgx+Y3bB+1s0tq1pAZiHhJn6cn3
 FHKa1NyWIq4Gk+1NPmMRS/r54WhegfoyqTuglfoTI3ToR6TATdaZquvcCT2wX5gd1glo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T5zqlSQYoJLNe2EIlJEpXo+bYqvZDoC5oNl0kxVC2Tg=; b=YRkF9+yMaM3hG8bfkHZUSWuP/t
 SQI2wRQZWOrySoZB2k8pJFnsLsxb4cTRp21mFJly9TGrMtj8pTnpUL2PBNAttaLJ6pm7Dj2tKvNNc
 kKpsuJhR6NdMOWr4YzU3e78buMfoUIrUFBYQhDnZxHAbixBBE+6YKuA1cmufssDe7qmg=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXOhR-0001X4-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:34:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gbGFJ083Rzlh1KZ;
 Wed, 10 Jun 2026 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=mr01; t=1781120081; x=1783712082; bh=T5zql
 SQYoJLNe2EIlJEpXo+bYqvZDoC5oNl0kxVC2Tg=; b=wrLw1nTmY4g0DelaRoidL
 fTXqUq1YDnCj28cVpit6ebizNIryXnCmBCHHJcpiJqna5u9YHnU6FMX99obKUDkT
 Ctw7ylSSySR22nVv9/rpN2+L4Am9MqLF0NKd6RhJuhu2IlQpjiF+fJD9S4r9YrNX
 fWAk58glyjPfFPV7jSRMciM20uSilEQ0dIKNj3G9h/Ra/2rhc/K6XNIzQ6IIq0Lq
 lcamWIWIU6Sf6ZnhEZuaUyy5md9r1sAy060C8u5xdJLwLJSvnZV2ILp/3G/1ig2T
 4P+tZWYr+0Zcl9l7oj3CTUzPtBB/Aw0RC85ogswnvm+5BBbOTdnjBh1JIqh3rCPa
 Q==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id af2-jhUum_HL; Wed, 10 Jun 2026 19:34:41 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gbGFD4zMfzlfdfW;
 Wed, 10 Jun 2026 19:34:40 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 10 Jun 2026 12:34:17 -0700
Message-ID: <c0b613f5ce1ba9ab43f798b294ddedd2c9b55565.1781119949.git.bvanassche@acm.org>
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
 Content preview:  Use bio frontpadding to allocate memory for a work_struct
 when allocating a bio. Reviewed-by: Chao Yu <chao@kernel.org> Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- fs/f2fs/data.c | 7 ++++++- 1 file
 changed, 6 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1wXOhR-0001X4-Jb
Subject: [f2fs-dev] [PATCH v2 1/4] f2fs: Prepare for supporting delayed bio
 completion
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,acm.org:replyto,acm.org:email,acm.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9026D66C856

Use bio frontpadding to allocate memory for a work_struct when
allocating a bio.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/f2fs/data.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d4f1e75dee3..1659a57a6d5b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -40,12 +40,17 @@ struct f2fs_folio_state {
 	unsigned int		read_pages_pending;
 };
 
+struct f2fs_bio {
+	struct work_struct work;
+	struct bio bio;
+};
+
 #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
 
 int __init f2fs_init_bioset(void)
 {
 	return bioset_init(&f2fs_bioset, F2FS_BIO_POOL_SIZE,
-					0, BIOSET_NEED_BVECS);
+			   offsetof(struct f2fs_bio, bio), BIOSET_NEED_BVECS);
 }
 
 void f2fs_destroy_bioset(void)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
