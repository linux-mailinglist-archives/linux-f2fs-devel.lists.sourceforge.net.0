Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A89C0FB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:31:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999g-0000FJ-73;
	Thu, 07 Nov 2024 20:31:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999e-0000F5-Ou
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DZtg1euw7JTcTAOyZk0yBmGVVU2EfMI9J6k9YkI+i+M=; b=YgZK/SVbhHjFSgz2B7tl/rLZG+
 LlzWEzRm+l6j5yvHsXckAjvL4SMaex7v2OjFV0mRwozna5VJY7/PpWhR6aeShO2wOWGUYilTZWCNE
 gXUjTabxE1P2VdqIMY6Yg+kd5WY653gp+Mlz7Uy2vpK58O4r+WPtSjHteNF+LWqIT/tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DZtg1euw7JTcTAOyZk0yBmGVVU2EfMI9J6k9YkI+i+M=; b=CyfiYeQjNVJomVoBbPgO7rH3Hh
 E6xocpqURdZp9N/gS2PuK+eaqHNYWcJKUhhzsGf46IdmIWx4VSqkjyecXXQpMnRraLEdMsQXpTkWe
 bwkU/53cCe2L8PPoKm109WOpJ9iVTSd4YQEC1HKqU04V3tmFo5l92u2CnC8AKi1G5OwU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999e-0003vL-59 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9DC0EA44B0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Nov 2024 20:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E48C4CECC;
 Thu,  7 Nov 2024 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011447;
 bh=jEy0Z06bKSJsUnioWxmojKNnv+lZHki4tfGbwN4Q4Wg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aO6ULwSKI2XXmoMb/K1upNn6XeamF6GSIplq6UpaWdTurUYJtcK+0krSy7ldXzhyk
 n67Xp/yI2K8RR9Xdbak7r3JKZTm2Bwl+nMpw9d73JJCueiyWc/woQn0jpf9xF5dHlh
 IzNUrDOC3AthX6eqt23x9czUsd/XPR5+ruxli/qg0RnSfXx/ySxkxsOreAqsp+g+jF
 iD4x5PQZYWbGSE7tp/dG+Ft0so/1XAl7M/jyAAbmZJiGsowiHQC55SrIa5qpVcuWtC
 V6XlCUL/ZJH86HcZPvHvj1avC5qNE0MbdUWuimYWcRmsjtw5lhNZ6G1jwsU/fsTvsL
 3/Enmq+0/B02g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADBE73809A80; Thu,  7 Nov 2024 20:30:57 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101145624.2084993.1951748528174851352.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:56 +0000
References: <20241022020149.2302191-1-chao@kernel.org>
In-Reply-To: <20241022020149.2302191-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 22 Oct 2024 10:01:49 +0800 you
 wrote: > In __get_segment_type(),
 __get_segment_type_6() may return > CURSEG_COLD_DATA_PINNED
 or CURSEG_ALL_DATA_ATGC log type, but > following f2fs_get_segment_ [...]
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999e-0003vL-59
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to parse temperature correctly
 in f2fs_get_segment_temp()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 22 Oct 2024 10:01:49 +0800 you wrote:
> In __get_segment_type(), __get_segment_type_6() may return
> CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC log type, but
> following f2fs_get_segment_temp() can only handle persistent
> log type, fix it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to parse temperature correctly in f2fs_get_segment_temp()
    https://git.kernel.org/jaegeuk/f2fs/c/9395fb09e897

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
