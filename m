Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC0AFF081
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XWxW1DwxTKv6j1h4Yk/kxZeoxBOwMbKKMH2bwFFlhdw=; b=Iji4jQl/wcZa4YVqOUyi/rZ66P
	wxrm7xfEZOrCKMguo7nJSJvouUBuoTqMh+S9E+39qGvXxFrl2RifX9B4YZcleKvSr1sEehciwJ8Yy
	zOdvAeOzHvshFr3Z8roat5fw6TxFVQirEU7QqqxIVOkN+x3Y8jDhBjbInOfdHQALxM90=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZEv-0003CZ-7q;
	Wed, 09 Jul 2025 18:09:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZEu-0003CT-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=21tx1HhE+tOhQ7JSU1DNZVLdwiBWJS/2JMaq3kSbKek=; b=c9s8+/MSyFjQD136R8qz5BKQWC
 hN96B+gyFjGL+3ew9iMUEE0zCCFl8Qtp6OkX7TyJG2EcZbykUOi/t2TmNuwbp2wtB2C1l4KjzYU+V
 vV2gbUlSSbPhlF1JSnavt2i5TcFD0QDFqpbvpA2biswBss+nZh1Jj0RsjcRRUNNF7tD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=21tx1HhE+tOhQ7JSU1DNZVLdwiBWJS/2JMaq3kSbKek=; b=Z
 Tb3LMJq2/hlkZYiw8e+Idf4hRTBWlakH60kqyx0fyZd+u8zspImpD6uZFFXMmVv6C0QRxMcjskAQ4
 KTlHyhNgG+Z3QPRfqnjYcgNp3CRQ/axrzAQNUPQ1ctUQdYQ96tCSEuJEmUSPaiAnjaijNStCaiYdW
 Yq7Of2dYp4urpTC0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZEt-000135-Qq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2DC3861152
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56DBC4CEEF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084585;
 bh=zv0MLcJUUtQ89xH6gYQk6QD/dJLAf4ZnM812gO/xT0o=;
 h=Subject:From:Date:To:From;
 b=ZAL7pTleuDXhIR7TvFKNc9JcTxG9Jy65mn03zPLMN8gI+OKFtXXEejG2hx8MsNxFR
 VFBsC03pkppJQwL9HRm0vWEV+XQV4C+HcBBrD+0i7yGT7SOIlMOnDNERu1ql+eKSSu
 6ZpzERMNAcBJ4muSWIW4lcxh/+zQ+BhUyclRXneKm3p5h3mi06tSaD5T71f+tJoUkh
 MuTuiOnwS4Q7vyHRei4+CPEZhnIPYJDfe58+xsYtrmoXcKHDdEf3y8oelfigBn6n+6
 mm78eM1SW/feRWO3r1ypksn1u7HQSmSPCyxhJttXfPKlnoNiYR1LL48YnSm2PWGTPC
 JXnLEDhC7iK8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 760AB380DBEE for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:10:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208460812.806926.18079984227752717145.git-patchwork-summary@kernel.org>
Date: Wed, 09 Jul 2025 18:10:08 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev, v4] f2fs: avoid
 splitting bio when reading multiple pages Submitter: Huang Jianan
 <huangjianan@xiaomi.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork: https://patchwork.ker
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZEt-000135-Qq
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

Patch: [f2fs-dev,v4] f2fs: avoid splitting bio when reading multiple pages
  Submitter: Huang Jianan <huangjianan@xiaomi.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=977311
  Lore link: https://lore.kernel.org/r/20250630125753.650630-1-huangjianan@xiaomi.com

Patch: [f2fs-dev] f2fs: fix to check upper boundary for value of gc_boost_zoned_gc_percent
  Submitter: yohan.joung <yohan.joung@sk.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=975513
  Lore link: https://lore.kernel.org/r/20250625001408.1961-1-yohan.joung@sk.com

Series: [f2fs-dev,v5,1/2] f2fs: convert F2FS_I_SB to sbi in f2fs_setattr()
  Submitter: wangzijie <wangzijie1@honor.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=977251
  Lore link: https://lore.kernel.org/r/20250630095454.3912441-1-wangzijie1@honor.com
    Patches: [f2fs-dev,v5,1/2] f2fs: convert F2FS_I_SB to sbi in f2fs_setattr()

Patch: [f2fs-dev] f2fs: use kfree() instead of kvfree() to free some memory
  Submitter: Jiazi Li <jqqlijiazi@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=978475
  Lore link: https://lore.kernel.org/r/20250703061358.13425-1-jqqlijiazi@gmail.com

Patch: [f2fs-dev,v4] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
  Submitter: yohan.joung <yohan.joung@sk.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=975512
  Lore link: https://lore.kernel.org/r/20250625001336.1937-1-yohan.joung@sk.com

Patch: [f2fs-dev] f2fs: Fix the typos in comments
  Submitter: Swarna Prabhu <sw.prabhu6@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=973077
  Lore link: https://lore.kernel.org/r/20250617174047.1511951-1-s.prabhu@samsung.com

Patch: [f2fs-dev,v4] f2fs: fix KMSAN uninit-value in extent_info usage
  Submitter: Abinash Singh <abinashlalotra@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=975731
  Lore link: https://lore.kernel.org/r/20250625110537.22806-1-abinashsinghlalotra@gmail.com

Patch: [f2fs-dev] f2fs: fix to use f2fs_is_valid_blkaddr_raw() in do_write_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=977643
  Lore link: https://lore.kernel.org/r/20250701092610.511964-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: check the generic conditions first
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=977389
  Lore link: https://lore.kernel.org/r/20250630160839.1142073-1-jaegeuk@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=979979
  Lore link: https://lore.kernel.org/r/20250708095339.3079788-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: doc: fix wrong quota mount option description
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=978047
  Lore link: https://lore.kernel.org/r/20250702064925.1002176-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid panic in f2fs_evict_inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=979982
  Lore link: https://lore.kernel.org/r/20250708095657.3081188-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: fix to check upper boundary for gc_valid_thresh_ratio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=976428
  Lore link: https://lore.kernel.org/r/20250627023818.146534-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to check upper boundary for gc_valid_thresh_ratio
             [f2fs-dev,2/2] f2fs: fix to check upper boundary for gc_no_zoned_gc_percent

Patch: [f2fs-dev] f2fs: introduce is_cur{seg,sec}()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=979652
  Lore link: https://lore.kernel.org/r/20250707114614.2769306-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: account and print more stats during recovery
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=976434
  Lore link: https://lore.kernel.org/r/20250627025944.152334-1-chao@kernel.org


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
