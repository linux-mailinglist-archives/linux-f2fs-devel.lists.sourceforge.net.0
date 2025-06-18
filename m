Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF3ADF8DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 23:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7g0HI/DH3I37Wao25qn7lH5h0G86+5mINukM6R1RTH8=; b=DmTvkyC6WY+yg7lpbWzcvlDbT0
	ZSktYgc6Vd55LloNEsWR+DsCXKeUjb+mrT/vgzolh2OKjqA8eHNtfBz6EvAAuY+XNO3rRiwfLfbDl
	v+nYhTHUqm9aPN6XGk5fTT5p55N9QbXhnyP8U//Ac61QvmQkLFkUOJNjgPsmY8fox9kA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uS0VT-0006Af-Du;
	Wed, 18 Jun 2025 21:39:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uS0VR-0006AY-UM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uM+1mSPQykGT6LlTKTLG7mUjzuRRo9ITREObXE/Vy9U=; b=V20fUkSRAA0aabEaeCQUZjbdVZ
 clxtQ86D7ZD/3RCkLa3knQD9zfSjvmPogY7u4QEUExXqJXXrXkKZ7xu+do3UNiQ9NmuyxTbWwZBeO
 wFNNc1+yxRui/bw9j2ZMLRez40w3aX5Vnxzi7N1dKxMT94i9uVDvI+re5PekSgDFoQO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uM+1mSPQykGT6LlTKTLG7mUjzuRRo9ITREObXE/Vy9U=; b=a
 kPEkRw+3Uly0puoItarsCUGQAqwtLV9p4vbQA7MfXUGpccHSr/5jwJ2UvvrsFITcmeyEz5WJVxlS/
 yTJFzXYCG+Tl/EhEcsM//qRB0Ebjh07b/U9PyrcCsDkQMyEEGolY23yLYOuhzPwylYncBo2bpfZtg
 TqaDvmY662HswHpI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uS0VR-0006BK-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A474B61F1F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Jun 2025 21:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E6BC4CEE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Jun 2025 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750282775;
 bh=txw8RCx2bXuh9ZNCBj0K4e1o+x0OAY35GrevIzVfI4I=;
 h=Subject:From:Date:To:From;
 b=a4jKtXE7x10I1mDUpWqveaCkSmfisUVQG42qkrdNey4XdFGPWzmUzNrPatt/QHn0Z
 CEttZf5iiFFYvy34m0qAWB2lDUY3xvaoaMh8H8j79nDtzv9rtzjpkmrG9LShA4yRj+
 HxGPJ6P236sNsZ/MJf24g1nwc9sWdvYpbnU/1851yijhSHulAduiguZMy6Cq7FfugM
 KTD0U6K5E/fIFM3u0cD96K11g7w4GsYShX6LQX2sX/+zrf9tlbvvLBdOkuAOvIbgOe
 hyiwBS1hIQb/uiB2LkXW8/bp8Ao1a1sPxyhkBQF8Y+Dh03c3c04aec4rIPVli6sNib
 8tgIaxVptqiAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B25C83806649 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Jun 2025 21:40:04 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175028280335.266369.128519329266516977.git-patchwork-summary@kernel.org>
Date: Wed, 18 Jun 2025 21:40:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v3] f2fs: fix
 to zero post-eof page Submitter: Chao Yu <chao@kernel.org> Committer: Jaegeuk
 Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series= [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uS0VR-0006BK-B1
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

Patch: [f2fs-dev,v3] f2fs: fix to zero post-eof page
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=968776
  Lore link: https://lore.kernel.org/r/20250605032633.2744434-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: Fix __write_node_folio() conversion
  Submitter: Matthew Wilcox <willy@infradead.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=967821
  Lore link: https://lore.kernel.org/r/20250601002709.4094344-1-willy@infradead.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
