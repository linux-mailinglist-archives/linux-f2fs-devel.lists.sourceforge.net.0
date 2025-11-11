Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4661DC50019
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q3RnrDwc+tiIW4UgPoXz5MgBQJyubMiU6tmwy7WHFk=; b=Zmw3cT1GPRQKTbsri2NgOuLUnX
	86Uvg+JdTE8tGFleMlqGRpXado4JS3hZkwFN6keG40c0NIRhkh22cPcy5Y34nR9lBmzMRLccuowhO
	1tW7lo+jIM72ZLuaReSXrPazZURunX0NkZkJsLs5aIyrGqgg0BQaMzghLmbmwo7kUhb8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCX-0002W5-6j;
	Tue, 11 Nov 2025 22:51:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCU-0002Vi-Bx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ud5OGB/3Ngb4Uq/fzO4n+Z6Q4u+D4JGlPRy7y8VczaQ=; b=JwfTb8Vb2wkqfxL4lbC3fscC/N
 LmRyKWzmCR9QJ1mBn0g5VNyfgEZ+QwWBcpD7sXTakgmHxrjcHj4kzEodWSFQ/CexMtQFkNOq/btpY
 3bRn7htVENyyr2QtJgeOGvI4+MqLSGWWf3QcyxKyg5VJREOp4A/VDnKjRYqVNMhZ8NDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ud5OGB/3Ngb4Uq/fzO4n+Z6Q4u+D4JGlPRy7y8VczaQ=; b=M39LQfnD19qosVeqkb5oUwn5us
 V31pwgIT/yBZaYb7OjIrq5/3Ic71W44+yJzrldOH4zcb2B9aozpxcgRwErJP6A6fHmAH+n5QUZsYL
 GHy4+4Lx4pSln8tcyZ+vChjeouBn093xK+kDXv0CNqKRI99GOXo6RAfS9RG0KKVH6AII=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCT-00046V-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACDE7600AE;
 Tue, 11 Nov 2025 22:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4D4C4CEF5;
 Tue, 11 Nov 2025 22:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901457;
 bh=7VpfNaZ4adwApeqpXtv2bP78gdROBfMS0yAzq0Rrk4Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HBYnHmncznDlrXvgfoDQSW73xZ8qIeTq9ZugmaLO6E4YhVomvl+Yw2d4FvNZqomvY
 ppztbU7WfcEQfAdXPM7BidOw1XGS8SDw/asoGatqecgtCezGGEMpz40Mw2CIUW6VDX
 Z7k5mroKzMSjWVT4T+/FjdFfuBrk6T7vgB1YzoWtwV2rHksxC+MvyadETHHVEoOokJ
 alyDdFjqH33kLIgu3ytYj3htdEZQh2eoOLPjrHGJ9cSV2rFqPKJmJgMzDDIH5tmqcj
 OpFRnmQ8+fUjRkMKDiBmv2x+OTXqiFKzI55YePeLOutO1OZYKr42cNA/qQpl2g4iYV
 tPBDtNurPejfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC88380DBCD; Tue, 11 Nov 2025 22:50:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290142724.3596344.8108085156417902298.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:27 +0000
References: <20251027092341.5011-1-hexiaole1994@126.com>
In-Reply-To: <20251027092341.5011-1-hexiaole1994@126.com>
To: Xiaole He <hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 27 Oct 2025 17:23:41 +0800 you
 wrote: > The age extent cache uses last_blocks (derived from >
 allocated_data_blocks)
 to determine data age. However, there's a > conflict between the deletion
 > [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vIxCT-00046V-SQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix age extent cache insertion skip
 on counter overflow
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
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 27 Oct 2025 17:23:41 +0800 you wrote:
> The age extent cache uses last_blocks (derived from
> allocated_data_blocks) to determine data age. However, there's a
> conflict between the deletion
> marker (last_blocks=0) and legitimate last_blocks=0 cases when
> allocated_data_blocks overflows to 0 after reaching ULLONG_MAX.
> 
> In this case, valid extents are incorrectly skipped due to the
> "if (!tei->last_blocks)" check in __update_extent_tree_range().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix age extent cache insertion skip on counter overflow
    https://git.kernel.org/jaegeuk/f2fs/c/96d62153b64c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
