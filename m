Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3628B6B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 15:38:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRy1O-000242-Ph; Mon, 12 Oct 2020 13:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jamie@nuviainc.com>) id 1kRy1M-00023r-KW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 13:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ngW3Oohu60xNWUbFF+mRxLzCCwlmt0cEh8ByIsuKJ/M=; b=fammAyQFEQkkPHhn8kGzv08uwI
 RrjGZ0PtubOEjWKDgS9kP7a4eRigNvMYnrou761dGuw9wm6UgCWfPii7WW9M9StSHfOIUkeWEF5HN
 yqUhb2onNX46G7DjjLyUY/tHKSVkEBs/equcEGKpYfbNG1MNhcWyEQ5mTHPmmF1gMiog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ngW3Oohu60xNWUbFF+mRxLzCCwlmt0cEh8ByIsuKJ/M=; b=M
 O8lZmCABN8YywFb1pHds/aK9ucwSkMNj3v+lAC8edDTqcJkEi+F7FYPEDqXr6Hz8Mn2lUF1OhLN/n
 IURiMiuTpf7CYdM/VPjpLBU7/EnQFwPUFCry0PwIWGiLlXDc+xb8NnTjEwIdBVzJtXMoW/l0DTXli
 H5nREYlIZOMbTZrA=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kRy1C-007TAW-O7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 13:37:48 +0000
Received: by mail-lf1-f65.google.com with SMTP id h6so18425507lfj.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Oct 2020 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngW3Oohu60xNWUbFF+mRxLzCCwlmt0cEh8ByIsuKJ/M=;
 b=THlmw7TggPhVWLQMFi6ZkC2HYbM//kgQ9BSofuPz05HidHV8xjUsDbQ5X3cLf0pJmc
 1gUFnGj082Wm30aHQ4538CyL54+Q7tffUKf7HBl3dqFZnskx2BKM/gxho0jlxa/W51ES
 vr67ytPcfxGIwyBKlAwMrQcGnOUaAJRgkHdNQ16qRHWUB2VVExZA4WhmvWhdPdYNxYsb
 hIaO3VvtFIj8cmiVyD1NTgKLMPpD+ZpD449b+gE4ryNakxnVp/YuaQAFMWDVrC/d9ROM
 uM9R8JWyQN4oQPCNrXB4G/ezHswNGJu5X8JL9a9bZPNce8Br5gZB2fViaUiTf9LJf38j
 CrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngW3Oohu60xNWUbFF+mRxLzCCwlmt0cEh8ByIsuKJ/M=;
 b=ll6hzSPRbLGGjqv1It+nb9s0ncqFJntv1AfaqNrXS7BE+t5wO5j4i17RYMLltt4RTG
 HQZmjl3jalNz/MzyV0maj9sIx14H6IdBxEGCiOGi+WLOtahlcGJWqDbehc4UjJGq/FRf
 hCMHEBjeue3cTXgZPJi+WmtmETIj4hOwteHK+QLGtVv0HQOg5YxqU5wQzzSHNX9qKun6
 YXGYY+Ul9JhBwDXe5XbqiChqd/mdTU78ypJwcmrzb6Uc4MmSE6qM4D+aGp6C/W3xS5vE
 s9qh2dymsTqpBk1FCHVso2ksZ4VuEj6L0vkTMj6SgdJIUb7bS48MuR2rg9mMFylMkZgx
 46/A==
X-Gm-Message-State: AOAM533zxYbtRAj6IYuOXx3LnkhdUvFhZ6VVOvotg1e0TlH9rMWnsGLH
 1K23SLYyo8IaIG2MXGYrweFhlOljb1NcUj3wb2+tAY+QJRZ/vTRqd3eVryY3BfijV+HINfgKLAI
 TNnMjnLNp4fLEZjUxeIotWlrKzEAQYn29Ism4zn4rI2KW90ca+a9Yerd7R+LWGwPnng6KBR09bA
 jdUhZAuFGlz/uAywc=
X-Google-Smtp-Source: ABdhPJxMZOFL8vYH/m0ozmN12NcSHX6YzjqLpU8NTDK8l3okKzbNe2a5Ff3gSu1PcEkM5GLG/bmDtA==
X-Received: by 2002:adf:a28a:: with SMTP id s10mr30154162wra.300.1602508190591; 
 Mon, 12 Oct 2020 06:09:50 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id 30sm15571878wrs.84.2020.10.12.06.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:09:49 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 12 Oct 2020 14:09:48 +0100
Message-Id: <20201012130948.58321-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kRy1C-007TAW-O7
Subject: [f2fs-dev] [PATCH 2/5] f2fs: wait for sysfs kobject removal before
 freeing f2fs_sb_info
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzkaller found that with CONFIG_DEBUG_KOBJECT_RELEASE=y, unmounting an
f2fs filesystem could result in the following splat:

  kobject: 'loop5' ((____ptrval____)): kobject_release, parent 0000000000000000 (delayed 250)
  kobject: 'f2fs_xattr_entry-7:5' ((____ptrval____)): kobject_release, parent 0000000000000000 (delayed 750)
  ------------[ cut here ]------------
  ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x98
  WARNING: CPU: 0 PID: 699 at lib/debugobjects.c:485 debug_print_object+0x180/0x240
  Kernel panic - not syncing: panic_on_warn set ...
  CPU: 0 PID: 699 Comm: syz-executor.5 Tainted: G S                5.9.0-rc8+ #101
  Hardware name: linux,dummy-virt (DT)
  Call trace:
   dump_backtrace+0x0/0x4d8
   show_stack+0x34/0x48
   dump_stack+0x174/0x1f8
   panic+0x360/0x7a0
   __warn+0x244/0x2ec
   report_bug+0x240/0x398
   bug_handler+0x50/0xc0
   call_break_hook+0x160/0x1d8
   brk_handler+0x30/0xc0
   do_debug_exception+0x184/0x340
   el1_dbg+0x48/0xb0
   el1_sync_handler+0x170/0x1c8
   el1_sync+0x80/0x100
   debug_print_object+0x180/0x240
   debug_check_no_obj_freed+0x200/0x430
   slab_free_freelist_hook+0x190/0x210
   kfree+0x13c/0x460
   f2fs_put_super+0x624/0xa58
   generic_shutdown_super+0x120/0x300
   kill_block_super+0x94/0xf8
   kill_f2fs_super+0x244/0x308
   deactivate_locked_super+0x104/0x150
   deactivate_super+0x118/0x148
   cleanup_mnt+0x27c/0x3c0
   __cleanup_mnt+0x28/0x38
   task_work_run+0x10c/0x248
   do_notify_resume+0x9d4/0x1188
   work_pending+0x8/0x34c

Like the error handling for f2fs_register_sysfs(), we need to wait for
the kobject to be destroyed before returning to prevent a potential
use-after-free.

Fixes: bf9e697ecd4 ("f2fs: expose features to sysfs entry")
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 fs/f2fs/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3162f46b3c9b..f6c02d2483ad 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -890,4 +890,5 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 	}
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
+	wait_for_completion(&sbi->s_kobj_unregister);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
