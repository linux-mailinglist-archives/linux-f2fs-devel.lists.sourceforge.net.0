Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A1lFOy5lWm7UQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 14:09:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AD156864
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 14:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AfYJGhvIpf0bvYiR/qqf3KklLjZs8AXSNyEkk/c9sI=; b=B3oEQ2MTcytIkusBwHe7l73hS5
	ZxdgZsqloRg+PvzwkoWpMmwbfv4L73Tebb0WC/1GMbME+amO6pIxovq40V7vgNZ3LImVyAeyzJiXK
	uLt5Hi99wGUlLK4fIR39q8jvKxNVhjgJiXiFfazvSEwZLdqf3Yy49U64GrA5V+j9va80=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vshIR-0000vb-Vf;
	Wed, 18 Feb 2026 13:08:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=502ed4ed6=shinichiro.kawasaki@wdc.com>)
 id 1vshIP-0000vT-A8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 13:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXW9nq9v44O5MPSsQDBlwGaRp7ZiVlfa/hOP/0vkiJY=; b=a+Hhnn8oQ8b4CS2Fw+GAXe5/eq
 R8/qYzUWXDCj6aoU9v6D6Uk+WTWlDOsJx1zAOenOQFsf2NlHbV36V5PuJa7gzTCSnxcXTdCDbEwzn
 8rp7a7fzJyPbXywNexOt1TgtEX5IDwS5dtiz0BcrhkDjYyOwMK3bxuMFRDTvJPX+WQ5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JXW9nq9v44O5MPSsQDBlwGaRp7ZiVlfa/hOP/0vkiJY=; b=VTcvg3JbT7lwhXCI+9eGfpqpSX
 2bTki+4SyqmxJrJ2FZQjaAe8x5Kh9c0SnV8chTHRdbFdVrJFY1K2nMdo0/yTZCqKq48RCW694TCkj
 61TaW+5cAP+7FcoeCh+++QOnOyPIAbiiC/k+bwWZcjTU9vc/QnquZymWpzgA7m/5ZOLs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vshIO-0001c1-M6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 13:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1771420128; x=1802956128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nD2cft06qvrOoIcvYeTj6huruJ70ktxCXRedmsa/tkc=;
 b=KX1zVZx+lUZxXeJAl268DDW8MWLr1DC/emSx/KWM1gK8o330fPQI5/Hz
 fi3gS03miEOrvlqohdcQggpNWWMWfDWVZJtMAI5sOg93UfIlxLwCbFerD
 qE/sH6D72KUvUGVhjUaTpnk9E+ZAnXXPSoNcpeEP2v8h4JnTEYosceaAz
 WnIL73Yj8isWtn2FHwcTWkXH9hkSOHlvvnKqjDSDYOA5bRTTANptD+TqR
 4GYQ6413o1lZ2UFoWSWk3H5BeobK7W1FTR3DOmeZXiiU5KowzrWidiLE6
 8eQEMsYFcZLGDjeIirzVjAb/VVRpxrF63FaAyiECmNJ/ZHeV8ve2myDhh A==;
X-CSE-ConnectionGUID: N/t8pD4NRcq1+d2BzJROpA==
X-CSE-MsgGUID: ZQQEytJ3QJuFgaJqn12yZw==
X-IronPort-AV: E=Sophos;i="6.21,298,1763395200"; d="scan'208";a="140592977"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2026 20:52:59 +0800
IronPort-SDR: 6995b62b_+3R4PAE7Xr5KGCosaXpEO/pEdJYrCLuOvKPeSqJuAgIVnSG
 lTpYB0Ubv3E1rDsJArgGVEPhJh7bc9g+nwVaE3A==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Feb 2026 04:52:59 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.67.30])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Feb 2026 04:52:59 -0800
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Wed, 18 Feb 2026 21:52:37 +0900
Message-ID: <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Shin'ichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
 A lockdep WARN is observed recently under the following steps: 1) Create
 a zoned TCMU device 2) Create a f2fs filesystem on the zoned TCMU device and
 mount it 3) Fill the filesystem with files and trigger GC 4) Unmout the
 filesystem 5) Remove the zoned TCMU devic [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vshIO-0001c1-M6
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
From: Shin'ichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,wdc.com:mid,wdc.com:email,wdc.com:replyto];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com]
X-Rspamd-Queue-Id: 835AD156864
X-Rspamd-Action: no action

From: Shin'ichiro Kawasaki via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>

A lockdep WARN is observed recently under the following steps:

1) Create a zoned TCMU device
2) Create a f2fs filesystem on the zoned TCMU device and mount it
3) Fill the filesystem with files and trigger GC
4) Unmout the filesystem
5) Remove the zoned TCMU device

The lockdep WARN indicates that a circular lock depedency formed by four
contexts, as described below.

a) TCMU device removal context:
 - call del_gendisk() to get q->q_usage_counter
 - call start_flush_work() to get work_completion of wb->dwork
b) f2fs writeback context:
 - in wb_workfn(), which holds work_completion of wb->dwork
 - call f2fs_balance_fs() to get sbi->gc_lock
c) f2fs vfs_write context:
 - call f2fs_gc() to get sbi->gc_lock
 - call f2fs_write_checkpoint() to get sbi->cp_global_sem
d) f2fs mount context:
 - call recover_fsync_data() to get sbi->cp_global_sem
 - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
   that goes down to blk_mq_alloc_request and get q->q_usage_counter

To suppress the WARN, cut the dependency d) between sbi->cp_global_sem
and q->q_usage_counter. For that purpose, move the
f2fs_check_and_fix_write_pointer() call outside of the critical section
of sbi->cp_global_sem in f2fs_recovery_fsync_data(). This change is fine
because the write pointer fix operation only affects the main segments
and does not interact with the check point metadata. Furthermore,
conflicts between the write pointer fix operation and data/node flush
operations remain protected by SBI_POR_DOING.

Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/recovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index a26071f2b0bc..87fd6cd436fe 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -922,6 +922,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 		truncate_inode_pages_final(META_MAPPING(sbi));
 	}
 
+	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
+
 	/*
 	 * If fsync data succeeds or there is no fsync data to recover,
 	 * and the f2fs is not read only, check and fix zoned block devices'
@@ -933,8 +935,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (!err)
 		clear_sbi_flag(sbi, SBI_POR_DOING);
 
-	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
-
 	/* let's drop all the directory inodes for clean checkpoint */
 	destroy_fsync_dnodes(&dir_list, err);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
