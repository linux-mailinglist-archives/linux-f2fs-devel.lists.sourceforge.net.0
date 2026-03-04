Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AEvIlmCqGmAvQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 099FB206DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xchg9L2DuKmz9bJTeu3vOTSQpj1UTcCnKG+xb2iJvc=; b=ALpNdOem5SK7lAb33M+4YFG2FB
	ePhUMqs9EqZ30iTHmkgH5W8L+9XIC3hXT3sXnUAZoYD1kqOevcbXbYyECdVj71ggJlXdMxO9CY2i6
	8tcELmXfQI/+d8W6hDpjeP3lCCMGo3dDlAnP+sW6/U9A64qr/D5cysdKfCUoOnOVMGi0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxrWg-0005d3-Ji;
	Wed, 04 Mar 2026 19:04:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1vxrWe-0005cp-SZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4/gvWAc7jMA8PiPw4OjdtXDR+vFdse+XnqHD39G+E8=; b=VK9Ik40JddfBDGqUuPdtglV0+Z
 ttO2KpejYj3yM3jkTE8T9NS+b73uJmUQjjgLd1DtziNehQC7rh8r3xFJWCXBwGDGyoXAOL/9qANNh
 jmRRbUhVFWzgpIGR1/mT4lytbGnuyosWD8GOF0R3xbtAO6HGFiK0vNsPGnE+9mfXRA2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c4/gvWAc7jMA8PiPw4OjdtXDR+vFdse+XnqHD39G+E8=; b=NaJ+k8piATX8gpXWwS/w2LZL7c
 e5TBizJjsASYDHPgarIwtPk2L9L2etM+K/ANAgNSdDkMg/eWyqhZGuqr3f+VpZqPEKMiPopVJIwXT
 rZTt9Kkjs0lEjfFTkQNSvU7KHyNkzKXX4rCLwtInqhqJbZ6Blbj6cOALnFmMZ7iOqn0k=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxrWf-0001WQ-5l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772651082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4/gvWAc7jMA8PiPw4OjdtXDR+vFdse+XnqHD39G+E8=;
 b=BWC/RD1p5kPNHbZO+MbJoUWjQco8JqK9WYC8SHzdKrW01MbVuDZhG4VRKR2Dhe0BJ9soFQ
 oJSDuPzGyAaRaE1EPkDqIGnGUbO4XRHgTrSZ5aq7MJq/Inozqy/Kqvm6SiUYf9NFWJg4Uh
 4T6iVeDGzalS024hzrQKo1zRImgJi/A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-RnlrEz9nMkejANd1DJV44g-1; Wed,
 04 Mar 2026 14:04:39 -0500
X-MC-Unique: RnlrEz9nMkejANd1DJV44g-1
X-Mimecast-MFC-AGG-ID: RnlrEz9nMkejANd1DJV44g_1772651077
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6C4491956088; Wed,  4 Mar 2026 19:04:37 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D82EB1800576; Wed,  4 Mar 2026 19:04:34 +0000 (UTC)
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  4 Mar 2026 20:04:08 +0100
Message-ID: <20260304190424.291743-4-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
References: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: aoFhbEVxSua7bQmxFtfZNCwandICpm36UswhV9g-cKw_1772651077
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use the same argument names in bio_chain() as in
 bio_chain_and_submit()
 to be consistent. Slightly improve the function description. Signed-off-by:
 Andreas Gruenbacher <agruenba@redhat.com> Reviewed-by: Christoph Hellwig
 <hch@lst.de> --- block/bio.c | 22 +++++++++++ 1 file changed, 11 insertions(+),
 11 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxrWf-0001WQ-5l
Subject: [f2fs-dev] [PATCH 3/4] bio: rename bio_chain arguments
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
From: Andreas Gruenbacher via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: dm-devel@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 099FB206DA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:agruenba@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[agruenba@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Use the same argument names in bio_chain() as in bio_chain_and_submit()
to be consistent.  Slightly improve the function description.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index eadf4c1e9994..5e60bf3730af 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -369,22 +369,22 @@ static void bio_chain_endio(struct bio *bio)
 
 /**
  * bio_chain - chain bio completions
- * @bio: the target bio
- * @parent: the parent bio of @bio
+ * @prev: the bio to chain
+ * @new: the bio to chain to
  *
- * The caller won't have a bi_end_io called when @bio completes - instead,
- * @parent's bi_end_io won't be called until both @parent and @bio have
- * completed; the chained bio will also be freed when it completes.
+ * The caller won't have a bi_end_io called when @prev completes.  Instead,
+ * @new's bi_end_io will be called once both @new and @prev have completed.
+ * Like an unchained bio, @prev will be put when it completes.
  *
- * The caller must not set bi_private or bi_end_io in @bio.
+ * The caller must not set bi_private or bi_end_io in @prev.
  */
-void bio_chain(struct bio *bio, struct bio *parent)
+void bio_chain(struct bio *prev, struct bio *new)
 {
-	BUG_ON(bio->bi_private || bio->bi_end_io);
+	BUG_ON(prev->bi_private || prev->bi_end_io);
 
-	bio->bi_private = parent;
-	bio->bi_end_io	= bio_chain_endio;
-	bio_inc_remaining(parent);
+	prev->bi_private = new;
+	prev->bi_end_io	= bio_chain_endio;
+	bio_inc_remaining(new);
 }
 EXPORT_SYMBOL(bio_chain);
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
