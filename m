Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5CC18477
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 06:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OBJCRrxEkOqHNegewWl5M5wnQzztKTDE8iu7cVn7FqM=; b=BY7ecbbNci7MtUqkivS1vjll4I
	HjgLZJIAMpI3O+j3Fbc49VY1jlx5Z/Qfgp5Hro+gMdnv+cV27hwT8k8c1RmcTeac51DMC5gfupaJ5
	r+/E9OmjANMyOQcdlLRgjizULBg3ghhqTg+fkMmQwU3JHQn0rmf60mmwdxWw4n163fEE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDya6-000096-9R;
	Wed, 29 Oct 2025 05:18:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vDya4-000090-EM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 05:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahBDHQILa49HMxw2JVQIr3vlbvr0IPNaE4CDQOjDzdM=; b=f/Q7Gx6d3YyD/Nn30qkZwHVT6S
 Ilb/SHPOoLU+ewHWG7HN33O1/7V2Yf05mHuIey9s8DdpxgFyc7tNiwVghD86DQfoPJRKaIS64cdmW
 TQzgFhcmPDMuyLp9hXaNrCVo90/bAjC51NEbfK1d9akOTteskeW6xLx+Fvqu7boXys0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ahBDHQILa49HMxw2JVQIr3vlbvr0IPNaE4CDQOjDzdM=; b=M
 L+0yiMYpGVqY5wfe7QhbyDDnS2WsGByZnN0LmFuUAG7UFUjoXaXuZrUwR1gHInb65reR9y4dAAnOH
 EjtvUKTSNbWegCaMyVxdhpM1XMXgNGtjM3UQD1+MseM3U4zn8AoLKQTA/Prk/L/0waRBAGdvMGnKT
 jAIHnDWs6PRf8wnQ=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDya3-0002pW-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 05:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ah
 BDHQILa49HMxw2JVQIr3vlbvr0IPNaE4CDQOjDzdM=; b=PqYOGQ/9a97Dbun4gb
 /xbyIQLX9q97D4B0gn3vjllOKgJMkOK06BQ1xvLP8/n4jm6VHh2j1s0uL66BKEXo
 fdw4ESGdwv4s81Lt8Nokrr3E/m7bqrD33o1gG6a1jrKnS4P3SB0ZH1Fsnma1Hzi5
 Zr2zlBJ7AfdIHBbjFqgoQFxlw=
Received: from gt-ubuntu22-04-cmd-v3-0-32gb-25m.. (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCkvCgC3n4CRowFppQEJAg--.44871S2;
 Wed, 29 Oct 2025 13:18:10 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 29 Oct 2025 13:18:07 +0800
Message-Id: <20251029051807.3804-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PCkvCgC3n4CRowFppQEJAg--.44871S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF17uFW8XrWUtr4xJr1kXwb_yoW5ZF1fpF
 W5K3ZxAr9rZryj9rW8t3WkGr1Fka9rCrn7JrZ3Cw429w4kGwnYqF1vka4xZF1xCFWkCw15
 JFyjgr4Yqws0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_OzVkUUUUU=
X-Originating-IP: [36.103.203.208]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbiexT1BmkBn51aMwAAsf
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The one_time_gc field in struct victim_sel_policy is
 conditionally
 initialized but unconditionally read, leading to undefined behavior that
 triggers UBSAN warnings. In f2fs_get_victim() at fs/f2fs/gc.c:774,
 the victim_sel_policy
 structure is declared without initialization: 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vDya3-0002pW-Ds
Subject: [f2fs-dev] [PATCH v1] f2fs: fix uninitialized one_time_gc in
 victim_sel_policy
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
Cc: Xiaole He <hexiaole1994@126.com>, daehojeong@google.com,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The one_time_gc field in struct victim_sel_policy is conditionally
initialized but unconditionally read, leading to undefined behavior
that triggers UBSAN warnings.

In f2fs_get_victim() at fs/f2fs/gc.c:774, the victim_sel_policy
structure is declared without initialization:

    struct victim_sel_policy p;

The field p.one_time_gc is only assigned when the 'one_time' parameter
is true (line 789):

    if (one_time) {
        p.one_time_gc = one_time;
        ...
    }

However, this field is unconditionally read in subsequent get_gc_cost()
at line 395:

    if (p->one_time_gc && (valid_thresh_ratio < 100) && ...)

When one_time is false, p.one_time_gc contains uninitialized stack
memory. Hence p.one_time_gc is an invalid bool value.

UBSAN detects this invalid bool value:

    UBSAN: invalid-load in fs/f2fs/gc.c:395:7
    load of value 77 is not a valid value for type '_Bool'
    CPU: 3 UID: 0 PID: 1297 Comm: f2fs_gc-252:16 Not tainted 6.18.0-rc3
    #5 PREEMPT(voluntary)
    Hardware name: OpenStack Foundation OpenStack Nova,
    BIOS 1.13.0-1ubuntu1.1 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x70/0x90
     dump_stack+0x14/0x20
     __ubsan_handle_load_invalid_value+0xb3/0xf0
     ? dl_server_update+0x2e/0x40
     ? update_curr+0x147/0x170
     f2fs_get_victim.cold+0x66/0x134 [f2fs]
     ? sched_balance_newidle+0x2ca/0x470
     ? finish_task_switch.isra.0+0x8d/0x2a0
     f2fs_gc+0x2ba/0x8e0 [f2fs]
     ? _raw_spin_unlock_irqrestore+0x12/0x40
     ? __timer_delete_sync+0x80/0xe0
     ? timer_delete_sync+0x14/0x20
     ? schedule_timeout+0x82/0x100
     gc_thread_func+0x38b/0x860 [f2fs]
     ? gc_thread_func+0x38b/0x860 [f2fs]
     ? __pfx_autoremove_wake_function+0x10/0x10
     kthread+0x10b/0x220
     ? __pfx_gc_thread_func+0x10/0x10 [f2fs]
     ? _raw_spin_unlock_irq+0x12/0x40
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x11a/0x160
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

This issue is reliably reproducible with the following steps on a
100GB SSD /dev/vdb:

    mkfs.f2fs -f /dev/vdb
    mount /dev/vdb /mnt/f2fs_test
    fio --name=gc --directory=/mnt/f2fs_test --rw=randwrite \
        --bs=4k --size=8G --numjobs=12 --fsync=4 --runtime=10 \
        --time_based
    echo 1 > /sys/fs/f2fs/vdb/gc_urgent

The uninitialized value causes incorrect GC victim selection, leading
to unpredictable garbage collection behavior.

Fix by zero-initializing the entire victim_sel_policy structure to
ensure all fields have defined values.

Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
Cc: stable@kernel.org
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a7708cf80c04..56e372c23a78 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -771,7 +771,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct sit_info *sm = SIT_I(sbi);
-	struct victim_sel_policy p;
+	struct victim_sel_policy p = {0};
 	unsigned int secno, last_victim;
 	unsigned int last_segment;
 	unsigned int nsearched;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
