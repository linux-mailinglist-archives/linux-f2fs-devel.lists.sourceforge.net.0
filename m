Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5vW3DGVYOmqI6gcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 11:56:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863B6B5FB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 11:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RJrkk6nH;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KlLgdHpj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="A VGSzy4";
	dkim=fail ("body hash did not verify") header.d=astralinux.ru header.s=mail header.b=R3bclCMi;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VhPWh84dSEAmuRDxy/QA+Pg+TPsvLQpo916hKJK/lmw=; b=RJrkk6nH8Ctg7Tum15xfR4Mn0l
	P3A3wbHrOXReSa+Vl1CxBauuwg10kMY5zut60yjbM9OGHRFX5nPglFEZD5xxXkJHivVjihsIHSPWh
	KwRiiL+oY9cvwDkM/xgKa0kfs/Q8m7r9PO+EijoLj+jfdTOngOguynNw6obIZnq60t7M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbxs0-0004ZQ-M2;
	Tue, 23 Jun 2026 09:56:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adiupina@astralinux.ru>) id 1wbxrX-0004Yj-PK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 09:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O1xwAWkEKwWbJd6jrQ/wZSEgkRCRHBolaoO1XDqo9Bk=; b=KlLgdHpj5qKUviC8zNOdkPN5ST
 HHgf68525asoaWeZ7XXhH5BOBERlZfbOVFcYwRLXUvsg0BSPym+kjpyiZEdhuyDMRqfMKolCpUjgt
 fvHs/nyVKL4sfEe1EpZf8nIVTkxVgkNsh+2k7mj7hLOVQpl2fClEbXHekN8G57MaW6PM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O1xwAWkEKwWbJd6jrQ/wZSEgkRCRHBolaoO1XDqo9Bk=; b=A
 VGSzy4jS3JjvTKHcvrCksFPVqWlkYy/AXLNIOyBVdJFCSXNvRJ5tioTSwrPjUYTGhrRufYwDpWXiR
 xUm14/cAipSEb8XzxH1LAZ25FJskkkDGR7YexRtF0snutXKF2EoA8GoC/3Wu19nfUlBGgwsbcop8Z
 njEWhEi89lB2bOiQ=;
Received: from mail-gw02.astralinux.ru ([93.188.205.243])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbxrS-0002TK-2e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 09:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
 s=mail; t=1782207447;
 bh=gnPNQSYLiix7tXGVjov4UJH1hC5zANPz0y23QKnaIxU=;
 h=From:To:Cc:Subject:Date:From;
 b=R3bclCMie3wL9XXwdxRLJhA+SFhPIiMszZ3Ke2zxKi8JQzK3+hYRpSnrm9hzl5iq9
 RwhgypwujTfdU7B3UWi3RPypWoXBMPm0KJtGxP+6YzWN6haji4yCuPuh5dT82qXL2P
 cV5FR0PwxCjpiCvj2Dzf+njOxhbPbC/U45Bp8Ftptf71UYAeISLwLFZllEhDPtpBw7
 aMwCUUsl524pNKenk4Ge9fTw9WlBc5fq9THEOtc6dA/wSM2vYzdq1It9aa0Il0aoBU
 rQEHHiIZBAU3S/KQ+BrTtIHvUGtP4F2B2iXSU84JRoO0wws1Tw1wpnlRhxFlSxUDgf
 HK7XfZ/xPcSPg==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id D1A8F1F706;
 Tue, 23 Jun 2026 12:37:27 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Tue, 23 Jun 2026 12:37:25 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru
 (rbta-msk-lt-302690.astralinux.ru [10.198.19.150])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4gl0N45RbCzJpkX;
 Tue, 23 Jun 2026 12:37:24 +0300 (MSK)
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 23 Jun 2026 12:36:54 +0300
Message-Id: <20260623093654.13440-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: adiupina@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 108 0.3.108
 b3af89ff4c48cefaff455d02ab4cd72c6de3312f, {Tracking_internal2},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 new-mail.astralinux.ru:7.1.1; astralinux.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 204005 [Jun 23 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2026/06/23 08:10:00 #28271465
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dongliang Mu <mudongliangabcd@gmail.com> commit
 5429c9dbc9025f9a166f64e22e3a69c94fd5b29b
 upstream. if2fs_fill_super -> f2fs_build_segment_manager ->
 create_discard_cmd_control -> f2fs_start_discard_thread 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wbxrS-0002TK-2e
Subject: [f2fs-dev] [PATCH 5.10] f2fs: fix UAF in f2fs_available_free_memory
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
From: Alexandra Diupina via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Sahitya Tummala <quic_stummala@quicinc.com>,
 Alexandra Diupina <adiupina@astralinux.ru>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 lvc-project@linuxtesting.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_stummala@quicinc.com,m:adiupina@astralinux.ru,m:mudongliangabcd@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,astralinux.ru:s=mail];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[quicinc.com,astralinux.ru,gmail.com,vger.kernel.org,lists.sourceforge.net,kernel.org,linuxtesting.org];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,astralinux.ru:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[adiupina@astralinux.ru];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[astralinux.ru:replyto,astralinux.ru:email,astralinux.ru:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6863B6B5FB5

From: Dongliang Mu <mudongliangabcd@gmail.com>

commit 5429c9dbc9025f9a166f64e22e3a69c94fd5b29b upstream.

if2fs_fill_super
-> f2fs_build_segment_manager
   -> create_discard_cmd_control
      -> f2fs_start_discard_thread

It invokes kthread_run to create a thread and run issue_discard_thread.

However, if f2fs_build_node_manager fails, the control flow goes to
free_nm and calls f2fs_destroy_node_manager. This function will free
sbi->nm_info. However, if issue_discard_thread accesses sbi->nm_info
after the deallocation, but before the f2fs_stop_discard_thread, it will
cause UAF(Use-after-free).

-> f2fs_destroy_segment_manager
   -> destroy_discard_cmd_control
      -> f2fs_stop_discard_thread

Fix this by stopping discard thread before f2fs_destroy_node_manager.

Note that, the commit d6d2b491a82e1 introduces the call of
f2fs_available_free_memory into issue_discard_thread.

Cc: stable@vger.kernel.org
Fixes: d6d2b491a82e ("f2fs: allow to change discard policy based on cached discard cmds")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
Backport fix for CVE-2022-20148
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8ab7d3f9a764b..28ec398ed0462 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4009,6 +4009,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_stats:
 	f2fs_destroy_stats(sbi);
 free_nm:
+	/* stop discard thread before destroying node manager */
+	f2fs_stop_discard_thread(sbi);
 	f2fs_destroy_node_manager(sbi);
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
-- 
2.47.3


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
