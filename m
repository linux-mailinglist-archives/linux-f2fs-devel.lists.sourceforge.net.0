Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vFHdAZoLRmoPIQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4EE6F3F3C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 08:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=hWC2JQnd;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Cp9YJSLE;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Jo1Q0lrR;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=D1s+vpTt;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hSa9TLAU1xaPv4yPoKaELWRt2L+BI7Wc6W5bUkjihQ=; b=hWC2JQndLlmsv0fWU2vLSWqcKl
	lP2GqMt1cHMtYLZpYld+NK3EOaGSMFSl3QIk1nGcQMW5hgjGEj29CRa7o/DC38XHIOeJJT6cVYAl+
	s8eheg1XtcSTewmRZSbIZcDHMzr7PlOnv+gKc+kID7r2UvyB8RO9SEVzqe9sNBCzbwvs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBLS-0004Mq-Ai;
	Thu, 02 Jul 2026 06:56:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wfBLR-0004Mk-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bWjYLobU7DmPTU+ID3ps9WdzFfRD5rzyDp7xm8e48hU=; b=Cp9YJSLE2SMsYlwch1gdCDmTwI
 SbrdWfkaltqIw60LvZAn8umxjUz/5kt9EgQrCadTfFNZ9/aceffHx24O8QGECOFIaqvvken7X2C0N
 p9WJcsYp/eGSRN/Bt4d4GDRiQuzoHKl8WXPUyingDzNPFAwoAoqYXQHrDyZ1PKR1g9k0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bWjYLobU7DmPTU+ID3ps9WdzFfRD5rzyDp7xm8e48hU=; b=Jo1Q0lrRfkp0fNPnC8x/Lff3XX
 l4k6+HkADpoJ56g2Df/Ylpz4g6V3RV/uASwfoN7vld6sPOy/z7I+2hiqmh8KHfhjZYGTVVDvwALAU
 FRd22NbxGlTpc2fAKNbpnjj7GYqcaYqEdKHAvRCFzUMlP5upB0/5UNGPQTN/3eKk0GPg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBLM-0002Xc-Hk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 06:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6957960103;
 Thu,  2 Jul 2026 06:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AC11F000E9;
 Thu,  2 Jul 2026 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782975366;
 bh=bWjYLobU7DmPTU+ID3ps9WdzFfRD5rzyDp7xm8e48hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D1s+vpTtCUky1VvDNmU7YQT8Wnb8ZLr3UtGrXjqoxSEFKITwYZz/jlFR8MUomyifB
 9hvk4vqNHVMVKshhPv5oINYTGJEL+8zKW27kV8kEEm2McKkCFc3tlc9fsnWLayRqmx
 RTKPcRRYLMs5e2jd0dYOt7x4rkABAidGRtyfZBMdr8kMvF8nac+aI6kvgn5Rj9QEYq
 mMzIfgNiGeNAKgHlg6q4KArGOclMi2UeQ23TbciDeCkDb1CiYq1bK6k9zVg7RILtIR
 oJOYNEJVsn8GL47pO2EjAK0KZT+rrmuiHpHZY6gzrDeYdTdMtDeJLCMAVbHFns6J8O
 Luiz2iGe685VQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Jul 2026 06:56:01 +0000
Message-ID: <20260702065602.4120914-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260702065602.4120914-1-jaegeuk@kernel.org>
References: <20260702065602.4120914-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@google.com> Signed-off-by: Jaegeuk
 Kim <jaegeuk@google.com> --- tools/f2fs_io/Android.bp | 3 +++ 1 file changed, 
 3 insertions(+) diff --git a/tools/f2fs_io/Android.bp
 b/tools/f2fs_io/Android.bp
 index 52cdb73f41d6..d507c63c4fd6 100644 --- a/tools/f2fs_io/Android.bp +++
 b/tools/f2fs_io/Android.bp @@ -4,6 +4,9 @@ cc_defaults { "-D [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wfBLM-0002Xc-Hk
Subject: [f2fs-dev] [PATCH 2/3] f2fs_io: add include dir
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB4EE6F3F3C

From: Jaegeuk Kim <jaegeuk@google.com>

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 tools/f2fs_io/Android.bp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/f2fs_io/Android.bp b/tools/f2fs_io/Android.bp
index 52cdb73f41d6..d507c63c4fd6 100644
--- a/tools/f2fs_io/Android.bp
+++ b/tools/f2fs_io/Android.bp
@@ -4,6 +4,9 @@ cc_defaults {
         "-D_FILE_OFFSET_BITS=64",
         "-Wno-unused-function",
     ],
+    include_dirs: [
+       "external/f2fs-tools/include/",
+    ],
 }
 
 cc_binary {
-- 
2.55.0.rc0.799.gd6f94ed593-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
