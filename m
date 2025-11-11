Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD8C50012
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqqInkn7tjP4X5jNMzwRi7eUQCw01Ls8nQci7g7Rpos=; b=WFtCyPwyj/9CobunAq/x9ShTXr
	BX1ATqgMpRRnLuKdmnf9evWSXyb0iSCjOwGjdg8ws8KZIjF9vftZCP/ulGRmcyF7x3vZh6Q3e/M5g
	SnEkDiiGd9TEpqIr23gG7ezJao86TSPgAZ3l8UI+nMot7jcbrf5tSmFhRzqgCe6eCIfM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCX-0008Qj-N4;
	Tue, 11 Nov 2025 22:51:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCS-0008Q0-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AtxhAwZL2ynUOMB4anTt7u5Q5p8iJEDqnXY/Is8iM3E=; b=Iy0OC+9eacJF6wX0Bw/pE9O2QU
 3W2dM/AX0txm3Qn3DW9lCShpGq4X81r+T9pHHRjkPy//rPcH+fl0cbrM3a7BQWwoSPqs+/GBJ0d4h
 ZxabmBRKWLZ228usAS0Ij4/+0LO66z3rJ1nHQ3IEli65LThjVta8RmuifTHftJQzO4RU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AtxhAwZL2ynUOMB4anTt7u5Q5p8iJEDqnXY/Is8iM3E=; b=AfvRL/LDFt7J0HmCqC+kVJpJjR
 1m9hPz4gsuHLJg5T4zDuLpmA+1X4l4upPnRKBNeLNkxom1F+hMPiENIVO+dVmuKrDAuYSZxq1zh0p
 FLDVYGq6Xwzwvi4suhcofMlGrwI4Vp205tIZGvdyHKvHtLtd/4fHtyiiMal7n3a3ItUY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCT-00046f-1u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D232600B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27013C113D0;
 Tue, 11 Nov 2025 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901446;
 bh=PkQeE10i+YBFZ5WiZA1VI2jsBQK9p0pMKxURzlyc4Uw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VtypXIUlEPgpYS6yiwAUuJlv7yEVbVRjo2q9CaXWnwUX4Rkb91+eM6Z+BPVYAZGe+
 VxL4SqfoK4GvsL7jW5fYUTywlZO2pekimSugWZBk66xM4NvzYES0zPcgjOsTCzHe2q
 oVEnf1h8yru/fFkFAtxBoDnYH+KY56lm32WTHqJmpe6h0KRfnJF9XDApHLCn/ksuOK
 4ajJKdRSClOKArcbKc/edymzUvfuq3ZWDkwjMsrGOtLINHoaamO2OinG90JipdpqxM
 rsxez6vgn59nI/CwhP1eKQS6SpNqQ2GHuQijprF6ZjrH3LLOICAGE2vqQXPJJRbyhL
 IqrZ7x5p94YPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D8E380DBCD; Tue, 11 Nov 2025 22:50:17 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141623.3596344.10698680340121924794.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:16 +0000
References: <20251011123016.715964-1-chao@kernel.org>
In-Reply-To: <20251011123016.715964-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 11 Oct 2025 20:30:15 +0800 you
 wrote: > Add more sanity check on node folio during its writeback, if node
 footer > indicates it is an inode: > - i_mode should be consistent w/ inode
 > - ofs_of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCT-00046f-1u
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to do sanity check on node
 folio during its writeback
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 11 Oct 2025 20:30:15 +0800 you wrote:
> Add more sanity check on node folio during its writeback, if node footer
> indicates it is an inode:
> - i_mode should be consistent w/ inode
> - ofs_of_node should be consistent w/ non-xattr node
> 
> In addition, if sanity check fails, let's shutdown filesystem to avoid
> looping to redirty and writeback it.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to do sanity check on node folio during its writeback
    https://git.kernel.org/jaegeuk/f2fs/c/b63e02895b26
  - [f2fs-dev,2/2] f2fs: fix to do sanity check on node footer in {read, write}_end_io
    https://git.kernel.org/jaegeuk/f2fs/c/3bae3cbbf1a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
