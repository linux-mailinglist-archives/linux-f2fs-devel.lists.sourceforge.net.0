Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241ECFBD86
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHxFkxaadzXeq+Jt2v2d65bejfnXc9tmUWXuei09Z4c=; b=I3Rz0PNYAkRqbEc/G01rxrKSyR
	pl8C+lRR7w99oAoEdU9RyAW7FXMHcYc/lJKbyKMzSU+bGY/TCYVre1bT3tbUbR9hJ2zqOH/Nfuuyh
	QyePDFVsMnEUaywO8SM6vGDiYCYixnGMTpkpT3zxrimeNtpJAIjP6wCsYqGCTknBJrSY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKIl-0006n0-3g;
	Wed, 07 Jan 2026 03:33:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKIk-0006mo-2P
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1e9XQIaJTio+TCF/1yJnPVmoSSzDo+LckQ9XRaIdyPs=; b=Ovwj/RhWthmS7E/kbkkkmbWoiA
 QvLYUZqMYIkpbj3zQM7rKWNq/w0JR5WPvgzyHTVbK6yZmC+ZdUOA0GV1VXdQgT2Q2zpvWQLzJK2/+
 af6c9aE9KBsCb/cQS21OIHYfZXeAGG2IHTD8Y4Yo1sG4tJPClJX3/23DA2GVc+GUdCfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1e9XQIaJTio+TCF/1yJnPVmoSSzDo+LckQ9XRaIdyPs=; b=Z
 Q6/TfSRoM7jOdbtX/4fbaEnyCFjIzv/ouwRqXjyAUb9XWNPCIqqBsNWJzZCYFhECJYRSibSYthTqa
 yPrniU5y/jbE8Xfob07EKkUXF5CgBosGyo4UZUN16MW760HyJXdHX8TnZFNZJjuwSQZVtkzgWY7fi
 5b8L3Eo7vu9Z1k9M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKIk-0004Xl-8H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D679B43BC8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 03:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8509C4CEF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 03:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756812;
 bh=yLYXasjn3qMKpy41q1RBkeDEg0oidckYlbt7aZvvriQ=;
 h=Subject:From:Date:To:From;
 b=J2ay9WXz0z3KUVp7UWWqrYIQ0qGwub9Daqh38JnZQczV0RPt5Q1r3PeiCO8WEwThc
 A3oBZuDTkK/LgXrddpX8N5WlMEnnKtN1vuwtNbvAk5jAqcJHc5Vsw254/da4zGH/5c
 fgG5tsL44/fqhL9EPTGLi7fHXxAyV2J/BETAaru3rkMVC1++HpWYB6DpP1S3mA1RRL
 wXWrfuZ6qvY1afJhTIt6BitoE7iE9ayvlDDitgXY9CihAyuEXnj0jGldcjekdKs51T
 D5iuf03dJvzXSuzAg/9x5CnKeU6rkvOweSWidpthpM17iDnncd7DXQWZnNmKBLhNQx
 evjpfk64793sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4094E380CEF5 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 03:30:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775660969.2218650.12799667738609484822.git-patchwork-summary@kernel.org>
Date: Wed, 07 Jan 2026 03:30:09 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v3,1/1] f2fs:
 remove non-uptodate folio from the page cache in move_data_block Submitter:
 Yongpeng Yang <yangyongpeng.storage@gmail.com> Committer: Jaegeuk Kim
 <jaegeuk@kernel.org> Pa [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKIk-0004Xl-8H
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v3,1/1] f2fs: remove non-uptodate folio from the page cache in move_data_block
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1036804
  Lore link: https://lore.kernel.org/r/20251227073430.193054-2-yangyongpeng.storage@gmail.com

Series: [f2fs-dev,01/14] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1038139
  Lore link: https://lore.kernel.org/r/20260104020729.1064529-1-chao@kernel.org
    Patches: [f2fs-dev,01/14] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
             [f2fs-dev,02/14] f2fs: sysfs: introduce max_lock_elapsed_time
             [f2fs-dev,03/14] f2fs: trace elapsed time for cp_rwsem lock
             [f2fs-dev,04/14] f2fs: trace elapsed time for node_change lock
             [f2fs-dev,05/14] f2fs: trace elapsed time for node_write lock
             [f2fs-dev,07/14] f2fs: trace elapsed time for cp_global_sem lock
             [f2fs-dev,08/14] f2fs: trace elapsed time for io_rwsem lock
             [f2fs-dev,09/14] f2fs: clean up w/ __f2fs_schedule_timeout()
             [f2fs-dev,10/14] f2fs: fix to use jiffies based precision for DEFAULT_SCHEDULE_TIMEOUT
             [f2fs-dev,11/14] f2fs: fix timeout precision of f2fs_io_schedule_timeout_killable()
             [f2fs-dev,12/14] f2fs: rename FAULT_TIMEOUT to FAULT_ATOMIC_TIMEOUT
             [f2fs-dev,13/14] f2fs: introduce FAULT_LOCK_TIMEOUT
             [f2fs-dev,14/14] f2fs: sysfs: introduce inject_lock_timeout

Patch: [f2fs-dev] f2fs: flush plug periodically during GC to maximize readahead effect
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1037434
  Lore link: https://lore.kernel.org/r/20251230173845.2310677-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: fix to do sanity check on nat entry of quota inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1034833
  Lore link: https://lore.kernel.org/r/20251219025104.12256-1-chao@kernel.org

Patch: [f2fs-dev,v4,1/1] f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1037277
  Lore link: https://lore.kernel.org/r/20251230081429.8243-2-yangyongpeng.storage@gmail.com

Patch: [f2fs-dev,v5,1/1] f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1038946
  Lore link: https://lore.kernel.org/r/20260106121210.2374783-2-monty_pavel@sina.com

Series: [f2fs-dev,v2,1/2] f2fs: clean up the force parameter in __submit_merged_write_cond()
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1036813
  Lore link: https://lore.kernel.org/r/20251227091906.216322-2-yangyongpeng.storage@gmail.com
    Patches: [f2fs-dev,v2,1/2] f2fs: clean up the force parameter in __submit_merged_write_cond()
             [f2fs-dev,v2,2/2] f2fs: return immediately after submitting the specified folio in __submit_merged_write_cond

Series: [f2fs-dev,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1037641
  Lore link: https://lore.kernel.org/r/20251231130514.1061051-2-yangyongpeng.storage@gmail.com
    Patches: [f2fs-dev,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write

Series: [f2fs-dev,RESEND,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
  Submitter: Yongpeng Yang <monty.pavel.devel@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1037648
  Lore link: https://lore.kernel.org/r/20251231135433.1069590-2-monty.pavel.devel@gmail.com
    Patches: [f2fs-dev,RESEND,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
             [f2fs-dev,RESEND,2/2] f2fs: change seq_file_ra_mul and max_io_bytes to unsigned int

Series: [f2fs-dev,v3,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1039190
  Lore link: https://lore.kernel.org/r/20260107023346.2507670-2-monty_pavel@sina.com
    Patches: [f2fs-dev,v3,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
             [f2fs-dev,v3,2/2] f2fs: change seq_file_ra_mul and max_io_bytes to unsigned int

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1038226
  Lore link: https://lore.kernel.org/r/20260104103412.46331-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: fix to add gc count stat in f2fs_gc_range
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1036620
  Lore link: https://lore.kernel.org/r/1766717764-19956-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: remove some redundant codes in f2fs_quota_enable
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1034046
  Lore link: https://lore.kernel.org/r/1765957529-4285-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1038855
  Lore link: https://lore.kernel.org/r/20260106063117.29975-1-chao@kernel.org


Total patches: 29

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
