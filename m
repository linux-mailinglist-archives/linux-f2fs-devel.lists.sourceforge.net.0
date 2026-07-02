Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uugMAJoLRmoNIQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5C6F3F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Gv54fUZ0;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=hDTtCRe7;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="OeSI98y/";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=lkwM5GtE;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfgeg4MOT0OEiHn3WNb0RQ8C8YvMFU0beOg2ivkrjog=; b=Gv54fUZ0zHHVnqEDqyxke/bDH2
	5QlaEjSvOB7EwIlRNHkSrN5LuGY3d7tUNOmoj1cTbY4GfWD1LeR5KftxWZVJGSodm9ijaj3h7TK/q
	Ig4Qzxj2/mwiiU1GPwgDPfEgepHudqXEk7F8RDcWyyPRgJ+IlPJRuf/i0qFhXtladAeY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBLM-0007bn-Qu;
	Thu, 02 Jul 2026 06:56:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wfBLJ-0007be-Vl
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1sKwPDyZ0U5zvcvyk5EMJ6dm01+RsjR3z6zM65NNHOA=; b=hDTtCRe7d+kjja0l3rF3GsN5UB
 hkTZm3AqmvtD8tt/PO32qcSVqul1LU+dr6Y/Z5d22mZp2noCx7KQDOYLa4iq4+JcxcpUFq6ziifZm
 FIXLifIMAT0sQIpCmpm05cgHWZwjgOnFaErcqgaT+rNqw12m2f7a3bgOqyNlOOk140Eg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1sKwPDyZ0U5zvcvyk5EMJ6dm01+RsjR3z6zM65NNHOA=; b=OeSI98y/Ztws+86d5jPhI2eKAj
 kwuegv9lZAjUP9qSGpCZCoTAZT6ZjdjZRjF3AcgAm1FsiSZ4Q6SPcTtnwbqcxjtIgT2zPVQSKLw8B
 g+vv8QtFnZw5rRw+zvR7BLIApPla1H2X8wnmVBrHL6SPqbgwAARwG4I/CZNHD9TKcYFM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBLH-0002XW-PD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 02A0040BF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jul 2026 06:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38D71F000E9;
 Thu,  2 Jul 2026 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782975366;
 bh=1sKwPDyZ0U5zvcvyk5EMJ6dm01+RsjR3z6zM65NNHOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lkwM5GtE20bNCiNlfRtOwCHrnIW1ntjqfCzHkgES294J2Lc93+2k+C7nSDxUg5cPT
 lYw26rZmN11KKl6AKojE9qwtURqU0xhvmvm7Aq29ccmcb8yLCnOIw6iIbIRQaOipLm
 9PTBeGagfvQcnpig9n1mMFjPtQ+fCW546YLzx6hUX/ogWMcpakyZLd/wDr6RDJXjMV
 ZDStKRBypqmMP8FuoyFamOrtOa605xiZrGehbnOoFVA6ynaK+v1e7U8RjfavK+jsk6
 hglk9TMxbpyDc2Q1sXj2Gij9oD0hSEbGIHvcOofCCodJ4hk22XUXhUSvozja6FvsXM
 bi6a27jQ1gylw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Jul 2026 06:56:02 +0000
Message-ID: <20260702065602.4120914-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260702065602.4120914-1-jaegeuk@kernel.org>
References: <20260702065602.4120914-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: external/f2fs-tools/lib/libf2fs.c:1019:12: error: use of
 undeclared identifier 'BLKFLSBUF' 1019 | ioctl(fd, BLKFLSBUF);
 | ^~~~~~~~~ Fixes: c188a3e303d9
 ("f2fs-tools: invalidate block device page cache before reading metadata")
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- lib/libf2fs.c | 3 ++-
 1 file changed, 2 insertions(+) [...] 
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
X-Headers-End: 1wfBLH-0002XW-PD
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools: fix build failure on mac
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77B5C6F3F3B

external/f2fs-tools/lib/libf2fs.c:1019:12: error: use of undeclared identifier 'BLKFLSBUF'
 1019 |         ioctl(fd, BLKFLSBUF);
      |                   ^~~~~~~~~

Fixes: c188a3e303d9 ("f2fs-tools: invalidate block device page cache before reading metadata")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 7f8b643d117d..93f36ca6a30c 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1016,8 +1016,9 @@ int get_device_info(int i)
 	}
 
 	dev->fd = fd;
+#ifdef BLKFLSBUF
 	ioctl(fd, BLKFLSBUF);
-
+#endif
 	if (c.sparse_mode && i == 0) {
 		if (f2fs_init_sparse_file()) {
 			free(stat_buf);
-- 
2.55.0.rc0.799.gd6f94ed593-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
