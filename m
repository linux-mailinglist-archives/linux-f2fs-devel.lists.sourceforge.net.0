Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMzbMIEJsGlIewIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207824C6A7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+5BTfPU5zq5rzGqwt13NO2SDNO7uwirmawblG6lekM=; b=KhNAaA7Gdc380JQaY9M9kR69tH
	nPoFdAABigN6FCxZUMBXqbXUfIhKn662N9h72KPZNeX1DWdvFUzVFFZH3juTfd2U3/SFKBUxKKVFi
	YWchAFFWJdlYfYMGbtdPJWmhKI3SAppB6uaZD/38W4OpfSux/+GRhusf02x4zN/cgULM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzvrq-0003WG-D0;
	Tue, 10 Mar 2026 12:07:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzvro-0003WA-Jg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 12:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+Gjk+qeipwXi1P2nL+D1QzCPAmCNaD8NFucf+YqUjk=; b=fUC8nmAv6b9+R4I1FKvupyxh8g
 sJb7iTnHCoMwxwayanmnh2mvBvj+SsXAUnIB8uLWF6XtfDli7oNFZISR1H1imW3w4LIuwXiQRbubO
 QpaKUlQKscjfBdhvuB4i8Lgz14nyuMnKT7g95rIcMkNad45GbwIPLj4qZ9ipGP8rh74k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e+Gjk+qeipwXi1P2nL+D1QzCPAmCNaD8NFucf+YqUjk=; b=R
 Baeoo0bvRD2Kk2hVC023qOGlYwNsYKaGArzCN26j6Je6QJUkdnD57wRl/vx2AE0seIyw44ad0wt79
 Z6jKexjGC75IUC4ObjBmBNRN6CT8l6sD7nnW4n5fbG57ik3vsP24abpWJKm60wtfnPyw6T9RBj79W
 tBxpobOfFUifzsCk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzvro-00033B-7f for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 12:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5C9A43C8F;
 Tue, 10 Mar 2026 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8866EC2BC86;
 Tue, 10 Mar 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773144425;
 bh=MgyeJ+AampgP908d04ymRaV+WbMCJaGwhWRDM/yKQbY=;
 h=From:To:Cc:Subject:Date:From;
 b=Rtqso3dXroGYgkUZzyki7I2+6CPjbhz7uvIyY28QtvMzC6MARZsGpFjpFSDdTiZ7n
 xiq8zGe8/UDnXctrLg2JcmLz3dU9HOItUOcrCrS0oB0CZUu4fxD9LRUnvteiBjgprA
 U0El7o0p/fCo7x5YZghmRgABIzZ5PE1EJa97RThToF0e+0EEQZZ2dxzejxzadGep/W
 ig0fZqFKwhydO2E/aaBZgm77BSnQnr9psX1JEWRjJ8tyvzi+mUcLUEkZhFJ0y/svU8
 RQd9+SXnY0g1QPwiJGbnSgBNF0/KLFKr++e4z2cYgfRy0UtLLN1Wglbu1hrWDeI1Ru
 ZnU5m7AydtohA==
To: jaegeuk@kernel.org
Date: Tue, 10 Mar 2026 20:06:55 +0800
Message-ID: <20260310120656.604210-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There is no definition of HDIO_GETGIO, it should be a typo, 
 let's use HDIO_GETGEO instead. Reported-by: Chenghao Fan
 <23b903068@stu.hit.edu.cn>
 Signed-off-by: Chao Yu <chao@kernel.org> --- lib/libf2fs.c | 4 ++--
 tools/fibmap.c
 | 4 ++-- 2 files changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzvro-00033B-7f
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: fix to use HDIO_GETGEO instead
 of HDIO_GETGIO
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
Cc: Chenghao Fan <23b903068@stu.hit.edu.cn>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5207824C6A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:23b903068@stu.hit.edu.cn,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

There is no definition of HDIO_GETGIO, it should be a typo, let's use
HDIO_GETGEO instead.

Reported-by: Chenghao Fan <23b903068@stu.hit.edu.cn>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs.c  | 4 ++--
 tools/fibmap.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 13e4d0d..843494e 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -953,7 +953,7 @@ int get_device_info(int i)
 	uint32_t total_sectors;
 #endif
 	struct stat *stat_buf;
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 	struct hd_geometry geom;
 #endif
 #if !defined(WITH_ANDROID) && defined(__linux__)
@@ -1062,7 +1062,7 @@ int get_device_info(int i)
 		dev->total_sectors /= dev->sector_size;
 
 		if (i == 0) {
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 			if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
 				c.start_sector = 0;
 			else
diff --git a/tools/fibmap.c b/tools/fibmap.c
index 3acc77b..0a92551 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -88,7 +88,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 #endif
 {
 	struct stat bdev_stat;
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 	struct hd_geometry geom;
 #endif
 	char devname[32] = { 0, };
@@ -105,7 +105,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 		goto out;
 
 	if (S_ISBLK(bdev_stat.st_mode)) {
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 		if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
 			*start_lba = 0;
 		else
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
