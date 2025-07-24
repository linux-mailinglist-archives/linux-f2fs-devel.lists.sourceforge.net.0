Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3AB10EC9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 17:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGyef95CTxAJEIHaF2M9ChwNfAukhecORwaSFWFGry8=; b=bNWQ0JEYtBgIch+ujQ6USR3YSH
	7I1cNRC1ch4HQCb6pvGCIO/LdNTDEwLwV3zCIMwsODC0mFw2uCulauj7wP9EclWRPtST70kCwo0cq
	uvnohrytVy9uLDFWhncpq02U4tCm781OaacFyLU0GKmhSQe+v+Wysr4ATW44Om/1a+gM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uexuu-0004Fd-BL;
	Thu, 24 Jul 2025 15:31:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3zVGCaAwKAMQtz142kuy62usqyyqvo.myw@flex--jprusakowski.bounces.google.com>)
 id 1uexut-0004FV-DC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkEsdQ4L/pIchUqNG93CRYH8IJsJl5uVsGM6GRXeRvQ=; b=IMVtX5WMPYEYyI6TQF6lW43EYF
 wVmsKJNFuHB/VAlXfYgXTo6ctzhOz90poUKD5YkG7RxUBTZoIHTrspGzWVghH7YUJB+oF296rUUf7
 KYtN/WtyX8ueftoFN2hVpy4DbO//UtGDyHOG25GnXLWruZGOge5D9fPDBR5VRCiuqDww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SkEsdQ4L/pIchUqNG93CRYH8IJsJl5uVsGM6GRXeRvQ=; b=M
 2rW2DYecglPFQAUXsYo/DRxNnofFduEiyUlp3hL242pYcllPsREn2hMe0+0+no5ylb+KyqvfsAroE
 nBRLbJQp6xsRWxtwyaaXVN5bp8jzcrKmvcgvYVcdnZhQO7OdfsVOfi8CgK9l6N62XYO/8hQ9BXrMv
 smnpnd4TlfgWCJ2k=;
Received: from mail-ed1-f74.google.com ([209.85.208.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uexut-0002eJ-PW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:31:32 +0000
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-607c91a207dso1373620a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753371085; x=1753975885;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SkEsdQ4L/pIchUqNG93CRYH8IJsJl5uVsGM6GRXeRvQ=;
 b=sIhOVL13QS+7riCP6VBUJWhqFrIlDeVj57nlPtQ/kiEz1VQWLrlnQS/oMVSkPq1vPQ
 uZX6+J1lUpTsKVBjAoUeTW8x+feZsp1CRpfiCAhzdsuhSvlV89aMZHBgTJ/tzFMnR7nb
 dyqJmIjuxRGUQYHCTr8Rj3tqu2VIzTVcM28vRAu0uotQVLbdHKpeK0zc7KjqGc1B74eh
 RZa8kJBi6RyGvvbyiWiENJQTLplscLqiHQFYbWezHiUWF/8HQNxacDdIJ14IdaNGHaXv
 4cXTInGuz7CJoNlMaIaY8d73J/Z6baagvv4FFhn68jWNQOF/9NCPTBwfCkdPjR1wSSP5
 Jw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753371085; x=1753975885;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SkEsdQ4L/pIchUqNG93CRYH8IJsJl5uVsGM6GRXeRvQ=;
 b=qCb58soq7wsip7H0l4tK++hMYehzLtnIbK+aU0Di8qOUXiNY14uUos+r5rHR18sC66
 q2eG7NcxAh2fQmZ2e8Scj9lO9oJ3A/8LSuhr6SBUjA4Lrv0NJb8hEp70tSMPEwibZmcV
 dHeIxzd1Qz2glL8y2Ex5T+RNC/f60ma1RKgSVRt6iXaBcti1L0are2wA5pMHLDCfvGUS
 1vNKhCd3H9aCGuZ3J8EP4BcLDMONcy8CbCgxAVI9XA/9lA640tKaDZmHrIngeqDiOaLb
 ryfH0BM8K17Np/Wa1OHyuRH1oDhNz7k06pgHo2c3IWJWu2phvxB+NljcTNCesldmmHqB
 8emQ==
X-Gm-Message-State: AOJu0Yyc/UWISnQnXzKX7jCAC7wOkTE6A2hVd5PCrj6c79e8uloRZRW8
 B3gzKytKukOuQixYWeY6CXNt7P1O5q8tLBc5j819bs8o09wRNTDh5xthYAjl1RdigkAWCvXUs9t
 6kzJ0/CCnWnaGrjDvt/FzrsK1JYjoCA==
X-Google-Smtp-Source: AGHT+IGephgNH4LuU4bJdMk2LAYalDyAVdQFiFmvCHw7m4ai9Esg7UkatB3g3mrEK/1PSLN2IGMF2mT8tO5ci6gvMtA=
X-Received: from edis29.prod.google.com ([2002:a50:d49d:0:b0:60e:414b:751d])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a50:a687:0:b0:602:1b8b:2925 with SMTP id
 4fb4d7f45d1cf-6149b5a2ef6mr4796857a12.29.1753371085371; 
 Thu, 24 Jul 2025 08:31:25 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:31:15 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250724153115.125311-1-jprusakowski@google.com>
To: jaegeuk@kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When testing F2FS with xfstests using UFS backed virtual
 disks
 the kernel complains sometimes that f2fs_release_decomp_mem() calls
 vm_unmap_ram()
 from an invalid context. Example trace from f2fs/007 t [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.74 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uexut-0002eJ-PW
Subject: [f2fs-dev] [PATCH v2] f2fs: vm_unmap_ram() may be called from an
 invalid context
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When testing F2FS with xfstests using UFS backed virtual disks the
kernel complains sometimes that f2fs_release_decomp_mem() calls
vm_unmap_ram() from an invalid context. Example trace from
f2fs/007 test:

f2fs/007 5s ...  [12:59:38][    8.902525] run fstests f2fs/007
[   11.468026] BUG: sleeping function called from invalid context at mm/vmalloc.c:2978
[   11.471849] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 68, name: irq/22-ufshcd
[   11.475357] preempt_count: 1, expected: 0
[   11.476970] RCU nest depth: 0, expected: 0
[   11.478531] CPU: 0 UID: 0 PID: 68 Comm: irq/22-ufshcd Tainted: G        W           6.16.0-rc5-xfstests-ufs-g40f92e79b0aa #9 PREEMPT(none)
[   11.478535] Tainted: [W]=WARN
[   11.478536] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   11.478537] Call Trace:
[   11.478543]  <TASK>
[   11.478545]  dump_stack_lvl+0x4e/0x70
[   11.478554]  __might_resched.cold+0xaf/0xbe
[   11.478557]  vm_unmap_ram+0x21/0xb0
[   11.478560]  f2fs_release_decomp_mem+0x59/0x80
[   11.478563]  f2fs_free_dic+0x18/0x1a0
[   11.478565]  f2fs_finish_read_bio+0xd7/0x290
[   11.478570]  blk_update_request+0xec/0x3b0
[   11.478574]  ? sbitmap_queue_clear+0x3b/0x60
[   11.478576]  scsi_end_request+0x27/0x1a0
[   11.478582]  scsi_io_completion+0x40/0x300
[   11.478583]  ufshcd_mcq_poll_cqe_lock+0xa3/0xe0
[   11.478588]  ufshcd_sl_intr+0x194/0x1f0
[   11.478592]  ufshcd_threaded_intr+0x68/0xb0
[   11.478594]  ? __pfx_irq_thread_fn+0x10/0x10
[   11.478599]  irq_thread_fn+0x20/0x60
[   11.478602]  ? __pfx_irq_thread_fn+0x10/0x10
[   11.478603]  irq_thread+0xb9/0x180
[   11.478605]  ? __pfx_irq_thread_dtor+0x10/0x10
[   11.478607]  ? __pfx_irq_thread+0x10/0x10
[   11.478609]  kthread+0x10a/0x230
[   11.478614]  ? __pfx_kthread+0x10/0x10
[   11.478615]  ret_from_fork+0x7e/0xd0
[   11.478619]  ? __pfx_kthread+0x10/0x10
[   11.478621]  ret_from_fork_asm+0x1a/0x30
[   11.478623]  </TASK>

This patch modifies in_task() check inside f2fs_read_end_io() to also
check if interrupts are disabled. This ensures that pages are unmapped
asynchronously in an interrupt handler.

Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d1a2616d41be..0acc25f996b3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -280,7 +280,7 @@ static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
 	struct bio_post_read_ctx *ctx;
-	bool intask = in_task();
+	bool intask = in_task() && !irqs_disabled();
 
 	iostat_update_and_unbind_ctx(bio);
 	ctx = bio->bi_private;
-- 
2.50.1.487.gc89ff58d15-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
