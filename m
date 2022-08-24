Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9E5A02C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 22:30:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQx1U-0005vx-E0;
	Wed, 24 Aug 2022 20:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oQx1T-0005vp-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+QbubjWqiGrKa00CswRrcuND9jUVQ5UHj01yrZFbqs=; b=efgjZMEpioJxmdzaN3EiJr5Vb4
 R8o9Euo/QBq33H1Xrk/BQdoQEHHC9xgzLdyEE/K7zCFQZCSirnszx0Q92w2CHyBjCBpZQe2JW7rjF
 6x1w763JfgJ1ob0fJQogaZXnreaXfbHLsgZxsH7hi9aT/EbO8mSYPdeO3EIph0g4+lZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e+QbubjWqiGrKa00CswRrcuND9jUVQ5UHj01yrZFbqs=; b=hxM1HMziN63qFA4xsOtLIEhG3d
 vRgBwBrQ+R1cKKsHnoZ7lWEz++RD0l2LHbK8kNgkksDnLoqO3cf8PjQKKQkNoGeTu/1KRYQwWzGru
 cqIBVHNUBw/YP1VdzIPdr86QMwKssMRulUvwKIiBSMOGaUxQs0SLkJH+778fk1V5ZqsI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQx1S-000846-Nl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DE4161877
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 20:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF59C433C1;
 Wed, 24 Aug 2022 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661373040;
 bh=KhuS2aA1cGvG8nGq+Lnvn6JqXWMq3xDEeS47IiRZhRs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=onWIBk5pqvcS71A0KUMxGFzrgQj6rmzCCcUE0SKuj3rM6aCQp1bDza3jfYDt4SnRT
 8rCyTnB3indPyaDcRxMCPYlupDi/C2qIjZAMNb0Nadee4PLu4gNFSrgaBRx6m6jd7/
 blJE05rAjxlw5bAqrKnhdBsDWN7uZBe/sEA0jsWIPDoQ9eo8HqPJMTC0Tg2AZz1ELk
 6xz3a6cl5jBPjqK5C0aM3vyQvmi6Ab/OmiTTl9GE7v7OuuDgXVvAv78rVSHupem0rV
 pkTkPeQUMB+QBh1OvKmTDWtRy6hhXzY/WNjSHdqimnqOydWvAzs4BhqsuPkyKkFLTF
 xLKX0YzUXtyHg==
Date: Wed, 24 Aug 2022 13:30:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YwaKbmB23U9czf51@google.com>
References: <20220819231514.3609958-1-jaegeuk@kernel.org>
 <20220819231514.3609958-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819231514.3609958-2-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 pending checkpoints can contribute a race condition
 to give a quota warning. - Thread - checkpoint thread add checkpoints to
 the list do_remount() down_write(&sb->s_umount);
 f2fs_remount() block_operations()
 down_read_trylock(&sb->s_umount) = 0 up_write(&sb->s_umount); f2fs_qu [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQx1S-000846-Nl
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: complete checkpoints during
 remount
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, pending checkpoints can contribute a race condition to give a
quota warning.

- Thread                      - checkpoint thread
                              add checkpoints to the list
do_remount()
 down_write(&sb->s_umount);
 f2fs_remount()
                              block_operations()
                               down_read_trylock(&sb->s_umount) = 0
 up_write(&sb->s_umount);
                               f2fs_quota_sync()
                                dquot_writeback_dquots()
                                 WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount));

Or,

do_remount()
 down_write(&sb->s_umount);
 f2fs_remount()
                              create a ckpt thread
                              f2fs_enable_checkpoint() adds checkpoints
			      wait for f2fs_sync_fs()
                              trigger another pending checkpoint
                               block_operations()
                                down_read_trylock(&sb->s_umount) = 0
 up_write(&sb->s_umount);
                                f2fs_quota_sync()
                                 dquot_writeback_dquots()
                                  WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount));

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - add one more case

 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4f2ff50b247c..0f29c759a898 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2185,6 +2185,9 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_up_write(&sbi->gc_lock);
 
 	f2fs_sync_fs(sbi->sb, 1);
+
+	/* Let's ensure there's no pending checkpoint anymore */
+	f2fs_flush_ckpt_thread(sbi);
 }
 
 static int f2fs_remount(struct super_block *sb, int *flags, char *data)
@@ -2350,6 +2353,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		f2fs_stop_ckpt_thread(sbi);
 		need_restart_ckpt = true;
 	} else {
+		/* Flush if the prevous checkpoint, if exists. */
+		f2fs_flush_ckpt_thread(sbi);
+
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
 			f2fs_err(sbi,
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
