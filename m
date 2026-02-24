Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOtLB8k5nWl1NgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:40:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442D18224C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8L3rH0Z1cjVspC8SXa8RKs1bf8wkZuYUnT4Bo5ms1y0=; b=D8JAXAp+JIM7U3gKJZySJsJEHg
	vqW3z4wuyrnPBEJCFjpJ1n82xUDR5i6b2L4yLKhy4LO94Z/xz/HOSqLEf0j59o09pzFO4clZVa2dB
	tvZofMu2QkpdxGChVDsN6E6O02ndT6eVY4UHRzTwktvj84Qzi7vsu2Rwdm6kwXbbpswI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vul9f-0005tM-Cp;
	Tue, 24 Feb 2026 05:40:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vul9e-0005tG-7l
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1+S6+idKXLCfx1QtgNEEzZbsuKOxi9spXW5rl151+w=; b=XENw2isjwpNkaK1R2wzrwCTPIt
 GK7QzSCu/LVL4iU1AlWvl+DoFUkJcMRihE6YYQbKrJvdSSZlbbteBvo6yMplseKGsuYotp0fbgtu/
 Ohijnpvxo7wWrzY7ChByTGMQCmxH41X3AXfeqwWf+PoSDM1TxZDGiyNgPnuN7FDZhHe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z1+S6+idKXLCfx1QtgNEEzZbsuKOxi9spXW5rl151+w=; b=T
 25wSp7tC/74ImzLMlizkwZauVSQtltTQYWhY23/U5lLN/HekcZ2VaaVbsK/tMhqKLNjzJO1Eu4Iix
 zeuru/vckPtw3rt8uL0SkpH3F4tEfrmaQEi4w0eczNB4z5wpxMZY4yeTrwI6UODF22J/8/y28XA9z
 paIXGe0mziAhuPqY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vul9d-0004Zl-Os for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AAAC41B38;
 Tue, 24 Feb 2026 03:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABF3C116C6;
 Tue, 24 Feb 2026 03:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771902820;
 bh=PYFxM3Db2lXkACI8oVaazbAEAdAQ22tM+uoT0LzuPig=;
 h=From:To:Cc:Subject:Date:From;
 b=cf9EoI/2ZiH5slcNyOlPPdgaz5VbamHEb80+QyBJbeMRQ/u+LBF8GSaIDN82J0Qe8
 o1N2KXVED7YN9V9MMf0aGvG1o9pO7XMjTvkWLv8eytzh3bL9XXeFjdn9AWAJrONncK
 egfFszfUxp+wFWuj+dKwsp14Du+AJkFheFhpzH7BFupXkVJLoZjDndWbvIwQBCWRmP
 VicYmirNfAY/IVIeebbnJ4iK2+7DpURDqnwbWaRbuoJsy2eqPqS4Nr2hHDgXbky//7
 YgGxXya+ZSGfFcPhotA39YCG+CAKQB4KPuEiOxpVVTaQXcoK4lHuWeDLsY1g30kTlt
 3Ziw4q20UhP3Q==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 24 Feb 2026 03:13:36 +0000
Message-ID: <20260224031336.2534951-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Maxim Pleshivenkov <mpleshivenkov@google.com> touch
 crash.img ./out/host/linux-x86/bin/make_f2fs -g android -b 16384 crash.img
 F2FS-tools: mkfs.f2fs Ver: 1.16.0 (2023-04-11) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vul9d-0004Zl-Os
Subject: [f2fs-dev] [PATCH] f2fs-tools: handle total_sectors is zero
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Maxim Pleshivenkov <mpleshivenkov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 5442D18224C
X-Rspamd-Action: no action

From: Maxim Pleshivenkov <mpleshivenkov@google.com>

touch crash.img
./out/host/linux-x86/bin/make_f2fs -g android -b 16384 crash.img

    F2FS-tools: mkfs.f2fs Ver: 1.16.0 (2023-04-11)

Info: Debug level = 1
Info: Trim is enabled
Info: Set conf for android
Info: Enable Project quota
Info: not exist /proc/version!
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 0 (0 MB)
Info: block size = 16384
Info: zone aligned segment0 blkaddr: 512
AddressSanitizer:DEADLYSIGNAL
=================================================================
==300581==ERROR: AddressSanitizer: FPE on unknown address 0x5625f4833664 (pc 0x5625f4833664 bp 0x7ffd7745c070 sp 0x7ffd7745bdd0 T0)
    #0 0x5625f4833664 in get_reserved external/f2fs-tools/include/f2fs_fs.h:1873:42
    #1 0x5625f4833664 in get_best_overprovision external/f2fs-tools/include/f2fs_fs.h:1900:14
    #2 0x5625f4833664 in f2fs_prepare_super_block external/f2fs-tools/mkfs/f2fs_format.c:579:21
    #3 0x5625f4833664 in f2fs_format_device external/f2fs-tools/mkfs/f2fs_format.c:1884:7
    #4 0x5625f4821e94 in main external/f2fs-tools/mkfs/f2fs_format_main.c:562:6
    #5 0x7fb54fe94ca7 in __libc_start_call_main csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #6 0x7fb54fe94d64 in __libc_start_main csu/../csu/libc-start.c:360:3
    #7 0x5625f473b008 in _start (/usr/local/google/home/mpleshivenkov/src/b_479167542/main/out/host/linux-x86/bin/make_f2fs+0x9b008) (BuildId: 10870ae26d00ed4dfb428b9204c19b93)

==300581==Register values:
rax = 0x00000000ffffffff  rbx = 0x00000ac4be913cb8  rcx = 0x0000000000000000  rdx = 0x0000000000000000
rdi = 0x00005625f48a702c  rsi = 0x00000000ffffffff  rbp = 0x00007ffd7745c070  rsp = 0x00007ffd7745bdd0
 r8 = 0x00005625f4895da0   r9 = 0x00000000fffe96a3  r10 = 0x00000ac4be914e05  r11 = 0x00005625f489e5c0
r12 = 0x00005625f48a7014  r13 = 0x00000000fffe96a3  r14 = 0x00000ac4be914e02  r15 = 0x00000ac4be914e02
AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: FPE external/f2fs-tools/include/f2fs_fs.h:1873:42 in get_reserved
==300581==ABORTING

Signed-off-by: Maxim Pleshivenkov <mpleshivenkov@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index b3dccd0f010c..267297f344cb 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -341,6 +341,9 @@ static int f2fs_prepare_super_block(void)
 
 	for (i = 0; i < c.ndevs; i++) {
 		if (i == 0) {
+			if (c.devices[i].total_sectors * c.sector_size <
+						zone_align_start_offset)
+				goto too_small;
 			c.devices[i].total_segments =
 				((c.devices[i].total_sectors *
 				c.sector_size - zone_align_start_offset) /
-- 
2.53.0.371.g1d285c8824-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
