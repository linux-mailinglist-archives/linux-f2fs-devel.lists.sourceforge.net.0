Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0717859A915
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:15:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBD8-0002od-TD;
	Fri, 19 Aug 2022 23:15:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBD2-0002oW-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WsFg5oNHrmidMjG+EQrZyB99LO8ZLfl7r4On0SYA+b4=; b=jzFnb3ACICcoyVqTnifH37A98W
 1Ck5nKPbSvCa21psxr6aD0g39wyPqj6+vUSz/VN9eGZfdSlocbqxOVz6jXaI8PPg61X7YDOHu8cFC
 HYfyPHl2sjKYY5vBVX/44kX+CrwvZ+Zo3rPZNyEg1NuK2NEJEhBUka/UQU0bR/1cfCKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WsFg5oNHrmidMjG+EQrZyB99LO8ZLfl7r4On0SYA+b4=; b=RuPThwWb78ub4AVVzTsj1uFvsD
 eaWY/Dg6B4OXeyalAr9UIAetiVoADmBK6YmEkLbYkMFm9cjiVLJKrr8VdzOzPi5JJud7ny+PQH4t9
 S6mcd5gXcIZb6IDH3+NFBn4/rRYpz6KyTn+FXqbDNZFU5ajy6dhs5mxzaR1uxIDS0fro=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBD2-009rNB-6a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:15:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEC5F61865
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 23:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F6C433B5;
 Fri, 19 Aug 2022 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660950918;
 bh=hsH/o/XnOoVziPjmhg1KsTFQFW0lzFCZrIpev5lAsvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q8IGFuqf4kKfjLuk+gnmnFzMccXzWYDvzPwg6rpVCNI9Br8FzWbbwKucztcrJS98W
 2ycsDmO+/bmF9bdR7uGyYcgfOWBzpI4C127aUUaD1Dl2nGdFosQGqCy/AUNa8BtmrF
 UHJT06DJiSOk2ZQ54Z8G6xJsv9+JCombZoftfhAMmZqDbsAe8avKCCQIYBGTU3h+My
 l+53bQFMcxxUMK6bVhUb55sH6tdScxOvB+D7W0yeTZGVx20KmPzHaGYPYXqRoEN8Z8
 ZXMFN18qOc0wfiDFBO+RXZcakTSQ7+jhCbDqUC9GzsOu5kxtJfSqVh2XixcWDvND13
 zUSj0Xtl7tIWA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 19 Aug 2022 16:15:14 -0700
Message-Id: <20220819231514.3609958-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220819231514.3609958-1-jaegeuk@kernel.org>
References: <20220819231514.3609958-1-jaegeuk@kernel.org>
MIME-Version: 1.0
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
X-Headers-End: 1oPBD2-009rNB-6a
Subject: [f2fs-dev] [PATCH 2/2] f2fs: complete checkpoints during remount
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 48ac3de4a533..88879c483805 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2349,6 +2349,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		f2fs_stop_ckpt_thread(sbi);
 		need_restart_ckpt = true;
 	} else {
+		/* flush if the prevous checkpoint, if exists. */
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
