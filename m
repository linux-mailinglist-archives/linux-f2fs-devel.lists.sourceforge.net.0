Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B81A1826A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2025 18:00:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taHbx-0004jL-DD;
	Tue, 21 Jan 2025 17:00:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1taHbw-0004jF-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qRjTtyB77UCeo1FvPFrCEpVJgnOJfJJYFrj/Zm2/wU=; b=AtlalXOFIIJckPXvMt/Fpt4oUF
 FutDRaOGQIPVv9VbL9/yqoWCMwfPKdHcFry2Agj9DTa1DN09dyI23lBEWuajcTeoDzXnJnVDRPAwo
 ZJEDW3Ny2jWYmYcn9cANh/uzzvdHJaTM5BGY4llF4800tXxzqOOMuwwYOVOv5z69Em5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6qRjTtyB77UCeo1FvPFrCEpVJgnOJfJJYFrj/Zm2/wU=; b=O
 zb6lLijR4T+Yg0KcuGU/rreURPQIqEDUIcNiRJGZREvumR2WW2WVclwa9IulWKCwoRjwPI4l8H5DS
 OJhJyJ0PZHb7FaFdsrSIfDfH37mPwVc/ESfOkZBzqofxvCw744cJy2mMe5C5vQ16YDJO+pZFjh9yu
 INKA0fnkf2ltS0jk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taHbw-0005jp-RG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E7CEA41DB4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2025 16:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6CFC4CEDF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2025 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737478809;
 bh=aX3T8l0/BISfjJAMwUdf57ZVfV/HFiJJDUiLcw3bKF0=;
 h=Subject:From:Date:To:From;
 b=LfIKSWghXlNnd5pkjwWa40XzY8iHlWsIAWQW7BTfUzDxvgSTtPhtBtNTo1d8nHo7d
 Q6V5kaAqg5chHnknR3zVYg+ZlawsuXVZrBqAhqZt26Y4RnelAr5xg2nAY12x4JUv0x
 eypSrJbrHYEA3d/zVKfY8Ff+wSY6D9GVNXmPakL1bDetdnBV+KhKoTKAKbBmU77gx7
 KA5lvhkqFZvqf8Afgtl8dpTQzH9TPCAVMN2SXXufhCR8sOyow/Ew3azlcfESfnjlrw
 DPeUyr0pqSv/CWAG8JAeFO7SBcv811E+WN5sJrCEUU48sWznbyHS1kNnk96tf9ax96
 0vXBa7tPwoIBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2A2B380AA75 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2025 17:00:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173747883350.55169.8878169111752893561.git-patchwork-summary@kernel.org>
Date: Tue, 21 Jan 2025 17:00:33 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: Fix
 format specifier in sanity_check_inode() Submitter: Nathan Chancellor
 <nathan@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.or [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taHbw-0005jp-RG
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

Patch: [f2fs-dev] f2fs: Fix format specifier in sanity_check_inode()
  Submitter: Nathan Chancellor <nathan@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=926930
  Lore link: https://lore.kernel.org/r/20250120-f2fs-fix-wformat-min_inline_xattr_size-v1-1-508cac1474fe@kernel.org

Patch: [f2fs-dev] f2fs: avoid trying to get invalid block address
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=926599
  Lore link: https://lore.kernel.org/r/20250117220955.2482817-1-jaegeuk@kernel.org

Series: [f2fs-dev,1/2] f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=926907
  Lore link: https://lore.kernel.org/r/20250120111941.191621-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
             [f2fs-dev,2/2] f2fs: procfs: show mtime in segment_bits


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
