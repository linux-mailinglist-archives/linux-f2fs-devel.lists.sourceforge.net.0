Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMxwGlSCqGmYvAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB34206D91
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wJ4AiLK+hcK4CyZSyneOjKleN/42GuImdyh4kwIfx1g=; b=CF2OO+sdR9O0h/U/QglokNzhol
	xlO1hr1HR9dpK8WF+0T18/avs8KdsRcren4IRdi9SqmlEIyyCogAILCpIsOTmVUpl5A1TCrbH4iYL
	+ium7OUGzt6ZC2k3chwwtjJ34L1pGZdiLkZoKQq5vNe9wtEdLNcu6IHKl9pabWE6qhFk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxrWU-0005bM-19;
	Wed, 04 Mar 2026 19:04:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1vxrWS-0005b9-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u7S3JSUw0L6B/lSDSpa518AgIIh6Ud2RJzojY8j4acU=; b=AQ4eSCdQQdH1ZOU487cW2EbDb6
 wqIF5AlMMwfOawEztzp0ufEcjr2Ei//WZGgzqU6Y3nykWmhazVQYkfQB3qw9zgzzDJdmXApvVOlAe
 yShQt0s8Pm93870RYdMJaHx4AeqENK1/sAa3oa7MUUpfRMDcbOfj5F8JGOMwtojFtROw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u7S3JSUw0L6B/lSDSpa518AgIIh6Ud2RJzojY8j4acU=; b=J
 7I6xDXuLkzdeov8UhivTlIKk4z4yD4iV6eIhxMDgMvH8hP799UT2qcn4mCpKo+jAAFlPAAOXSPrCg
 QKyhmlkqB58tvR/nmeootRywUaZZvA0oNCcRytOi7b0U9mXMCcW1YFOrU8myLjrGVUZT5ERLOoOV2
 S3SoUgj/v63dvg9Q=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxrWT-0001Vf-5o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772651074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u7S3JSUw0L6B/lSDSpa518AgIIh6Ud2RJzojY8j4acU=;
 b=b4N729OlFZoc9R4WBm+T/Hy/g7KrQAAD1uBILdVW+d7ltGNUEMlLN29xdWLSdK0XIEGQUM
 g7R1iQ5uh04Pa7wfMoogXhmCqCmdEkGUPd9aj6max9pTDF0vN9iGYI6C2+J9yOj9tQSVIQ
 0xeQqeG3goQfoc/RM0Uv8fioP9qxS60=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-nJzCNDAMOC263_7eoJTryw-1; Wed,
 04 Mar 2026 14:04:30 -0500
X-MC-Unique: nJzCNDAMOC263_7eoJTryw-1
X-Mimecast-MFC-AGG-ID: nJzCNDAMOC263_7eoJTryw_1772651069
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ABAB61956096; Wed,  4 Mar 2026 19:04:28 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 298AB18002A6; Wed,  4 Mar 2026 19:04:25 +0000 (UTC)
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  4 Mar 2026 20:04:05 +0100
Message-ID: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: -Ek9ARVfytzBp0GY8GGTDl0uuvsjZ3vWzpbS8OJIV7Y_1772651069
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jens,
 here are some simple bio related cleanups. Any thoughts?
 Can those go in via your tree? Thanks, Andreas 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxrWT-0001Vf-5o
Subject: [f2fs-dev] [PATCH 0/4] simple bio cleanups
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
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 9AB34206D91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:agruenba@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Jens,

here are some simple bio related cleanups.  Any thoughts?  Can those go
in via your tree?

Thanks,
Andreas

Andreas Gruenbacher (4):
  block: consecutive blk_status_t error codes
  block: get rid of blk_status_to_{errno,str} inconsistency
  bio: rename bio_chain arguments
  bio: use bio_io_error more often

 block/bio.c                   | 22 +++++++++++-----------
 block/blk-core.c              |  5 +----
 block/fops.c                  |  3 +--
 drivers/block/drbd/drbd_int.h |  3 +--
 drivers/md/bcache/bcache.h    |  3 +--
 drivers/md/bcache/request.c   |  6 ++----
 drivers/md/dm-mpath.c         |  3 +--
 drivers/md/dm-writecache.c    |  3 +--
 fs/f2fs/segment.c             |  3 +--
 include/linux/blk_types.h     |  2 +-
 10 files changed, 21 insertions(+), 32 deletions(-)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
