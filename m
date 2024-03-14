Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776C87C125
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 17:20:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rknp4-0004y5-U3;
	Thu, 14 Mar 2024 16:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rknp2-0004xy-HL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TqUkVgOb+KB+lTx2JZtwiXSStk8HK8l4x1bhbwPHMXE=; b=P7VM1kTQMEC4D/VyXJqugggdt9
 4wN+ORW05ABOngz2moLdfp6XXyUnZf19usy3eKyvbwApFEQ/pPpmASgllvKJ0XAq96dTUxUvyqpvF
 qoQYxalHpPFkS1CJOV6OCdtx9SFXSbJDAluS+IGdtfN/e7lcbuIpYW9k/4ky4cDiRAfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TqUkVgOb+KB+lTx2JZtwiXSStk8HK8l4x1bhbwPHMXE=; b=A
 z3+hz3D+QughRtqmWIt+tYztCCewiCL74JyGsYn/eYjOl17VnvImY1MapB6vKnlCgF4tu1k1m1uAo
 DpGnPJOTWIPM6fo9yZa6DQZlNnAo09eDZ1qzFbFVdloP8AtfvvvQnhZ8k/amCofhZVSkTrdklYB4i
 cF8BA+OZVW6CntDM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rknor-0001sY-Q3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2101ECE1D29
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Mar 2024 16:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B67FC433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Mar 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710433231;
 bh=DCck3KNrPVQeeLVhkRpZlPKVctJQ64qwOVWRxcxpAX4=;
 h=Subject:From:Date:To:From;
 b=nPWDkBKjaTHFJ49XAQf2c0veM8gByLlbsbAyA4our32oJt8a2IPDvB+4fMIJfYHDE
 egaJb0L0m9uXU6Sl3uEusdkgt/D8SchX2oC8QJ4GBm6+7ceFrjUeKY8nqIaXLN5eJs
 kaA3VXcVqnHbp+H9FHYsatJKoAPLJPhUaqB6vSTOaR7mDRz+wgYcrva+L226BHrlbp
 oVWEGqf1GwJlHORfU7MCAjoNMvsdmHoTNU2auyMdxrHtCWK4p/iou2kUziXuVhp+h7
 dFtzbAk8u/SQQdeOIOlbYEWXLNXm/9ZH7TmcooqjwmXtuuGrjYK9rGjYH0SEmqXjSp
 f9ze6AIIjc6XA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4AB6BD95055 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Mar 2024 16:20:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171043323122.13516.2870708069395908763.git-patchwork-summary@kernel.org>
Date: Thu, 14 Mar 2024 16:20:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 mark inode dirty for FI_ATOMIC_COMMITTED flag Submitter: Sunmin Jeong
 <s_min.jeong@samsung.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork: https://patchwork.ke
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rknor-0001sY-Q3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/2] f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag
  Submitter: Sunmin Jeong <s_min.jeong@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=834936
  Lore link: https://lore.kernel.org/r/20240313112620.1061463-1-s_min.jeong@samsung.com
    Patches: [f2fs-dev,1/2] f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag
             [f2fs-dev,2/2] f2fs: truncate page cache before clearing flags when aborting atomic write

Patch: [f2fs-dev] f2fs: fix to avoid use-after-free issue in f2fs_filemap_fault
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=835161
  Lore link: https://lore.kernel.org/r/20240314020528.3051533-1-chao@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
