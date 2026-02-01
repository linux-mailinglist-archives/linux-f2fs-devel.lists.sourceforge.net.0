Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLHuM2lJf2mBnAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 01 Feb 2026 13:39:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C4C5E53
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 01 Feb 2026 13:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CphXXlSi05gCrHudgCgaUS15DZfK4Mjxx2uyTgPFqY=; b=LK4i1S45yxkFJH1Cez16bDoiUY
	DqQkiY1qbNbRbBjDyXmyqnZW6VfotXdDlf4rkNDGeSX2EGUXDDg+vF/lirSgj+ejKWDDful9qi93d
	BhrCwInQeWMO+raDECvOIheaBhWPIf35Band3EJaIlBCtI4XFyA2v2MncPtt8/MG3tVU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmWj3-0002Ep-Ls;
	Sun, 01 Feb 2026 12:38:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=485db9022=shinichiro.kawasaki@wdc.com>)
 id 1vmWj2-0002Ef-Kk for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Feb 2026 12:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5rPgzZztu7H25P/MVDSpqhKayQz9MWz8Y7r8v3+lbQ=; b=f93Yt0W8oPc/ky1uDBxP5O0aNL
 75V8DTNrhaCpuSQeApDC/IQlQz8T/5dysu0C7tyu8noJQht43jfOMB/kCZY7m359sr37W6k3bE04T
 Y/NdOPi5nJ7oiaqVBKUs6L1lXSW4EiOxM5nrljFG577meL3d6P0wA0/7+GcAauJH4Boc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e5rPgzZztu7H25P/MVDSpqhKayQz9MWz8Y7r8v3+lbQ=; b=fA3hQ7fsK1IQe5n0vkJCUSH2zN
 VBHHPe9sl4cXIy5+ai+OEtXZyKIORWgEWkNSduqB8uutpBQo3xgAtvnarcH916f8OOitBawDiqYjY
 m+/a8tGShfJioUleZXlDP2eU3tTGAXzG/GP4ENorvhcIsnEjBi4bs1sOCoVnJlHuIiYo=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmWj2-0001TB-Tg for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Feb 2026 12:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1769949528; x=1801485528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lchliFy6triDyJDSpmi5eKx16jLVoG6FJihdTTUIAj8=;
 b=owTwBj/H9k8mIg6yvqkhIqAjMIKdOtLM6rIdZypkx1JuyQylVRqW5LJx
 cjcQsl7DY9ObshNTCxtC1g4osxRhiIL324aGTbvp33VDBemxlBScuEcBy
 DxKpegheRC3FiqKrcN3EDUHml5POewMXLBeMMfCSN/tD2C1oEgFcPYHG4
 A7zbWduCsjmv7lIklZaBk97ZMJgEF4YfGEZHOQiW54xqsFtAqWLoko+TN
 CXUOl8kIJOOxEGtNoZVt+6ZQ7eD4S3o6nqvHmZOiEdGsIIDrJOAS6ZUwz
 K9c0UVEE2JgAXulMMI4G6mNsLx4TnTuw6cyRZlS1Eno8U1mLG9fuoTVij g==;
X-CSE-ConnectionGUID: S2pmR1BoRs+7GEXlAt8BqA==
X-CSE-MsgGUID: FuSsxEHPTFOgm+a+xo7E4A==
X-IronPort-AV: E=Sophos;i="6.21,266,1763395200"; d="scan'208";a="136422777"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep03.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2026 20:23:01 +0800
IronPort-SDR: 697f45a5_SpuJn+y1YAYTQC8/8VxByt1NRuDYmJ8Hr+7Z+S/3kkDhOfx
 Ea2M3sDeGFdfSFLx/I2NQpjwszoS6X4FgiBd1bA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep03.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2026 04:23:01 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.67.30])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Feb 2026 04:23:00 -0800
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Sun,  1 Feb 2026 21:22:58 +0900
Message-ID: <20260201122258.3168119-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260201122258.3168119-1-shinichiro.kawasaki@wdc.com>
References: <20260201122258.3168119-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A lockdep WARN is observed recently under the following
 steps:
 1) Create a zoned TCMU device 2) Create a f2fs filesystem on the zoned TCMU
 device and mount it 3) Fill the filesystem with files and trigger GC 4) Unmout
 the filesystem 5) Remove the zoned TCMU devic [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vmWj2-0001TB-Tg
Subject: [f2fs-dev] [PATCH for-next 1/1] f2fs: fix lockdep WARN of
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
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:replyto,wdc.com:email,wdc.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com]
X-Rspamd-Queue-Id: D38C4C5E53
X-Rspamd-Action: no action

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
