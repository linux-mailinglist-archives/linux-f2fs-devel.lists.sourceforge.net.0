Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C8B40E7B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0WL5uLQTGI9do7lJpmd8GLNsHq1ppOHts9gjepiGR4=; b=FV+JptLgJ7G1L0V5wHubmCIBfM
	OYHnwe9w7LnCtrxgHgQYwy6svo5A5P7EtM62m3cms6jDxL6fAABVCLlV2vM1WvqnRUvVaPMQXeyo6
	aHOut+8vsm6FDlp2uXCRQHyjHVImG71PFuqn3YSfFXYsfuRKp7bKOD3jp9h7ojady6e8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utXUE-0004LR-Kg;
	Tue, 02 Sep 2025 20:20:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1utXUD-0004LL-42
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvMTG0+yt6Mc8pe7FJ1VqOZTA1j6Xl3L0Zu3duCzB+I=; b=STVnHHzRGpNmhLN8p9jgwGvZiU
 ghL6/RqYb+9j29CK08DHqWfzWd4eE/+Bcpb/zhw0zY6gF3WpeHJF7GKOOrtx8PFo6O2j6MuJtdAXY
 DmUEkTCMhg6mJLQfd0k8AcLXP3I0fV/9aVFhFBYRfhyZJnXXBVrPp2M4nxIOg6MxmycI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uvMTG0+yt6Mc8pe7FJ1VqOZTA1j6Xl3L0Zu3duCzB+I=; b=Y
 +P4J9CW+AOBGzm9ky/FCbGnqeyg+N9BPZpJUy7P6CSK3NnZdvdrFgg1XA48+o1xOvhiIlZdgKo9gj
 qSRCdL3iHHYGqBqtaj5NG3PY+ZUMKlliRKnqJZW3LHd3lTYZgCcM0l1af0Ui8KbvM6lKS8McKwocR
 XE92S5Td6YRkAN9o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utXUC-0004Al-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 207D641716
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 20:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006EFC4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756844402;
 bh=Wo1BG7za93oIzpwx9b1YiEVZohLZBlxwS03ue+CuAec=;
 h=Subject:From:Date:To:From;
 b=f7iYD1PX7sDrfobw0RF9LNFTiy8JssUGb4pKd2gaRp9//ZUGro3FnXhefK7KxaeWI
 bBY/d46bDm2oKdmGweqs2er6puL8p8rJySEZPa8geAQ/RdwUdVcsvnWiHEeI9fE1Ok
 PhscrXhEBAK+TJdt4V/WDlw3JSu9GPsVdPWcSf0fFaeHCkqC6AfSfuPB+9cuaML9Xg
 vcVC4YAGEY2vozTegyVPC91vKZtSQ+yJ7CLMx+770JhlIGLbisWEmsACBi70cFPB3M
 Wt+DnPwMVi9yLoVPAhXpgTNBwx7/qie9/+XRCyg+7+uUdK8knlZzf6Ep96lpvUng9v
 bDUeKF/wOZgDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 77371383BF64 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 20:20:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175684440710.425353.2089583493073598988.git-patchwork-summary@kernel.org>
Date: Tue, 02 Sep 2025 20:20:07 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to do sanity check on node footer for non inode dnode Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utXUC-0004Al-Jv
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

Patch: [f2fs-dev] f2fs: fix to do sanity check on node footer for non inode dnode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=994765
  Lore link: https://lore.kernel.org/r/20250823054534.41037-1-chao@kernel.org

Series: f2fs: documentation formatting cleanup and improvements
  Submitter: Bagas Sanjaya <bagasdotme@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=993300
  Lore link: https://lore.kernel.org/r/20250820043432.22509-1-bagasdotme@gmail.com
    Patches: [f2fs-dev,1/6] Documentation: f2fs: Separate errors mode subtable
             [f2fs-dev,2/6] Documentation: f2fs: Format compression level subtable
             [f2fs-dev,3/6] Documentation: f2fs: Span write hint table section rows
             [f2fs-dev,4/6] Documentation: f2fs: Wrap snippets in literal code blocks
             [f2fs-dev,5/6] Documentation: f2fs: Indent compression_mode option list
             [f2fs-dev,6/6] Documentation: f2fs: Reword title

Patch: [f2fs-dev,v4] f2fs: Use allocate_section_policy to control write priority in multi-devices setups
  Submitter: Liao Yuanhong <liaoyuanhong@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=996359
  Lore link: https://lore.kernel.org/r/20250828081130.392736-1-liaoyuanhong@vivo.com

Series: [f2fs-dev,1/2] f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=992339
  Lore link: https://lore.kernel.org/r/20250818020939.3529802-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()
             [f2fs-dev,2/2] f2fs: fix to allow removing qf_name

Patch: [f2fs-dev] f2fs: allocate HOT_DATA for IPU writes
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=996232
  Lore link: https://lore.kernel.org/r/20250827215222.1615844-1-jaegeuk@kernel.org


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
