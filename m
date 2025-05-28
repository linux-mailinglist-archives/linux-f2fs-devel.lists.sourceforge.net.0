Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB36AC6DD7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 18:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jjrz4XsjPZg0ighD7SIB9ZRlpcmt7mJwMArxbiW6A0M=; b=kME/laqmF5FBb2KvSWmDlhvhRj
	FteEZfzagljg7iEbeRSBMkO0iBnV5GiwlwRXALgqkS/Tq9xs3ToHwWSe7kMAw9xdJWLCtRCWGbr7n
	w0HJqWtlEqPT2dhhSyqE6wBN1bZc69OtXPMD7ow4wJMuqHSU7CbKZ4N+QHDJJjoU6x+o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKJVX-0000Un-NI;
	Wed, 28 May 2025 16:19:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uKJVW-0000Uf-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pB9EO5GdUmaNvnqGJO3cbkZg6qhkxVqadwxFYtb2eno=; b=bcIhqydN0/m7V1FiVMKcn9RB9W
 iCXQs/azy4CPqGfUjuFzUCMlqShwjM0sUpZDnwJjtV6wppOJytDcOH7FKgYmlt97yIWDboELzRB8d
 BNDTJFpKPHtMH6Jpq7CkEpK7OQgbkdR/7hlYyxgNGlggLAcou0jIc39r2iO2GS+rhsew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pB9EO5GdUmaNvnqGJO3cbkZg6qhkxVqadwxFYtb2eno=; b=P
 SnEmpAw9z2yGM5xhacGjp3Apy0AY/f9R1NCP7wJy+G8YiTpnJ9epf4W6vNf9+5tl0kga3EOamZ6Ur
 mNpTUrgGJT/BiUIjwOmEt3DyDDLB7bcmE5m/4G45eqJikbjTGCzUWA4q/a+GJYO5MGE3s/aZnTwZd
 t2LI45SR25X9qNlY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKJVW-0003VL-AP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CD9661F1B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 May 2025 16:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53062C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 May 2025 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748449192;
 bh=pQ1fi2Hwgs974fKR6nHyG0Or/u3lDwRQtRODObye6n0=;
 h=Subject:From:Date:To:From;
 b=NLuzAhFaL42CZ+pcxVu5xdsS56JQP4iGv356nBsWAk7Zjo5H5g/dB46sINOD+X2SU
 8YNnxBy5nOBLBAO1XpcAgF22wLtxJYyEJNhG3HHam8OTPMEQJZt9OAj6WjxD1Tr4G6
 pRgSMpx4Y3lPQVyJU280flD1iRiy+seLKdjth/SobyV4OwA3vDYmjoSKM0GRlwuLq5
 KpdVcq/+S8PXUBsVFOBdbzn0FvAdR7AzkRDW54+hBjvUouCSpOJPoI2DtXs6Ts/mUo
 cTEk1HRnKa+5RfFZ2W3RBs1KGw/9HpXNTi7zrqzDaMb5xg3U3Bv1Rj9WGxczmcEH16
 R/VbJyQRM0KFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 745EB3822D1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 May 2025 16:20:27 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174844922595.2455931.9663835917351052688.git-patchwork-summary@kernel.org>
Date: Wed, 28 May 2025 16:20:25 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Headers-End: 1uKJVW-0003VL-AP
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

Series: [f2fs-dev,1/2] f2fs: introduce is_{meta,node}_folio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=965697
  Lore link: https://lore.kernel.org/r/20250523073304.1454247-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: introduce is_{meta,node}_folio
             [f2fs-dev,2/2] f2fs: clean up to check bi_status w/ BLK_STS_OK

Series: [f2fs-dev,1/2] f2fs: use d_inode(dentry) cleanup dentry->d_inode
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=962749
  Lore link: https://lore.kernel.org/r/1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com
    Patches: [f2fs-dev,1/2] f2fs: use d_inode(dentry) cleanup dentry->d_inode
             [f2fs-dev,2/2] f2fs: fix to correct check conditions in f2fs_cross_rename

Patch: [f2fs-dev,v3] f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=965631
  Lore link: https://lore.kernel.org/r/20250523032545.1392641-1-chao@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
