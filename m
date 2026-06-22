Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZKekLDOKOGrJdQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:04:51 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAEF6ABE46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:04:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dtlk7O0p;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=FmEHt+Bm;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="j Uz0S61";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=WNgyJb3A;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rslmv9axn08cA89KVN2O4BA2eWG31mhs6CKeD1YxmlU=; b=dtlk7O0pxUUDPzP7E7qcZNROFO
	wuCYU2UzPGRSDmsS38RgQxIfgqWEgva3I+WRozx2SwCPHyc4EvxA9Al2HWvAGVS/uHKOZFzcTQthA
	L/Y15eLEq5rcQ9TIotSR8yh5McBODMC/fmfuMj7ZYdDlzxkQKgmusIGO8Xxx6rb3FBus=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbT5l-00044Q-Oc;
	Mon, 22 Jun 2026 01:04:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbT5i-00044J-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5kATcJLcs2VC9dfjvj7MqoGsibDwh64v1N/eD1d7mPM=; b=FmEHt+BmWy/y8PF8UdiVm0o+s/
 siGH1lbz1f4ejDvOBJ8Izw3MXWYZKDHUNfocvJgrGHNnr4lgROsLQT9UzhCLs7WVhO+Oba1z31c9c
 7Nac9I7ufTkUt0pF40HVlt0aU0m5TjWzzfb3ZOv6PkBWmcTadyqNLXVxviBSjHf0JwO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5kATcJLcs2VC9dfjvj7MqoGsibDwh64v1N/eD1d7mPM=; b=j
 Uz0S618CMemtQRpK3HtzWbIUYQIF7HhZL3DP0ttXVFh+JuhQZVsxA8NJHVR9rwH/DRUK/qtorAyh8
 ilCMaMVcWlNTLbVN7cgvvLNadR+NFN4522m9FII+uks6koNDY6bXrxpYE1e5gX/q8FiCUir+6E5bQ
 WZL6hg70UcR6UsRs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbT5e-0001M3-TB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:04:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C8BA44024;
 Mon, 22 Jun 2026 01:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050C71F000E9;
 Mon, 22 Jun 2026 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782090277;
 bh=5kATcJLcs2VC9dfjvj7MqoGsibDwh64v1N/eD1d7mPM=;
 h=From:To:Cc:Subject:Date;
 b=WNgyJb3A02FYh3o0DhOCKwX3QHc6DfGL+O2skqa4hYfL14ZXTp5Tz1anuYEPFgKk+
 XG5C1BfPkRHdPBwk81GrbjvDDA4h+Uh7jv/O4XqK9QIv5LJQEIlOir81X5fE6/Pogk
 ZLdRbSRqqmnBGL/oDfsJidRQ9ZVpO7pyGo7hWDWA7+XtF99FEb9f/S8AJhw7q/Ba2f
 fiG0d5gjSIwzqAsCr8sAiddG9Q51X6Q779UnScESj7ZIqIc9dbo1qwYzCdw6exqCgN
 lFYAdVGDIqBC0dIPF7kZhLLEeOIqsKlsVYKVh2RI3F9XvVpsRF61XbuoV+QEyeAQq8
 TZX78teOczAjA==
To: jaegeuk@kernel.org
Date: Mon, 22 Jun 2026 01:04:27 +0000
Message-ID: <20260622010427.2273254-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 065a6f8cd23a9297b543dcec913feb3cb787a25e.
 f2fs_drop_inode() won't call f2fs_exist_written_data() as commit 3063c80776e3
 ("f2fs: another way to set large folio by remembering inode number") was
 dropped from the tree. 
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
X-Headers-End: 1wbT5e-0001M3-TB
Subject: [f2fs-dev] [PATCH] Revert "f2fs: initialize ino_entry_info before
 checkpoint load"
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:kartikey406@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DAEF6ABE46

This reverts commit 065a6f8cd23a9297b543dcec913feb3cb787a25e.

f2fs_drop_inode() won't call f2fs_exist_written_data() as commit 3063c80776e3
("f2fs: another way to set large folio by remembering inode number") was
dropped from the tree.

Cc: Deepanshu Kartikey <kartikey406@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 615a071f9605..c448d992ff2a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5170,13 +5170,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_page_array_cache;
 	}
 
-	/*
-	 * Initialize ino entry info early so f2fs_drop_inode ->
-	 * f2fs_exist_written_data can safely take im->ino_lock if mount
-	 * fails after this point and triggers iput on cleanup.
-	 */
-	f2fs_init_ino_entry_info(sbi);
-
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
@@ -5221,6 +5214,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	f2fs_init_extent_cache_info(sbi);
 
+	f2fs_init_ino_entry_info(sbi);
+
 	f2fs_init_fsync_node_info(sbi);
 
 	/* setup checkpoint request control and start checkpoint issue thread */
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
