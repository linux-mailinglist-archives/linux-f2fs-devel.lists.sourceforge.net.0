Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDCAE58B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep6YO51s7sMyHUAzizF55Z9p6BvI/JNllw15w1uOPZA=; b=f9aPkAuo5aeek+GWVWGq+Gq4DL
	YpSEeuBzgONnmdU+QaVlpHimelHH1nJPSSVyvzSGcuZ4hnxmfdIDCbzvbCPMVcL/O9WR6iIT23Gdd
	/nLif48+02sSoGNMpquSdJLrpeLHg07Bqq6KRGb3uHEXgCrOHjEmdSYLF3wbBGtwwPm8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriX-0007l5-Ef;
	Tue, 24 Jun 2025 00:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriM-0007kj-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtdNRvrj36wAT0biOy9gg99Aae/9XYVK/GxJeXo6u3I=; b=BP9DkSqW6Cwu+51wM9i07q6MgR
 OQrMn+AWi/fzvlWUcZ1MjfoJERKDJsE5IAP/3vsWXyFv1AHSN+VPbv1hG1NzEYM/kQyAEedrjn4FI
 +SYWkas59BA6LVqw/2nHV8Nh0ctEBiFia7rJA0s11/NxxbdJvHsEj+W7uguJfC7NLHOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtdNRvrj36wAT0biOy9gg99Aae/9XYVK/GxJeXo6u3I=; b=kMGSOsFKkgxDmyWRk0HKpnQj6n
 dzSIcj1SfeEBU0ZKjfS33d6HgVQ77IYczVEBa0liY1+uHM5FsDdOTA+X6NsZubhPlvb+euKoF+fH+
 oUaAjtJIsIZ2qjMkPbJ6xSS5SKDPFDRkHyp3oIDH9ado8aflCunrEKZChz50lbVAbves=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriM-0006yf-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D98B4AC3A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B85C4CEEA;
 Tue, 24 Jun 2025 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725631;
 bh=dLtQNA42iMbpSsSLCp5csx0b9bOIqDZ/GCWrS/GAOlg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VkrrOnaWFROkxeh4gq5kv8R9uf3AfO4ro2IbrsHTYk7uy3F+/Kwys019DS6BTLNoE
 VNxc5GDROqkszJ3VtljGW8bcd2tUpn2XPzT7BDgMZNl41Y7g9Oad/YWO8ikINaOFIY
 FpuD5YKoqMQ6xQCLlC46LmH9N1PKwLs+tgWdXPhjpkIuqHfWvOxwgo9iFtkaH7RSa5
 xXpIDhMjCrnT40ktuufKiPe4kj5qWq9TzX2OFN1fbj8WvYTv1OEa6IZlCzlIc5O223
 Ax62nw7yUaz+l+gJURB8F/3FFI3J0MMyRSZaS7whLQY990ZcluCS8uv5qRsGOrsxM8
 RIqw610UndTcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C1939FEB7D; Tue, 24 Jun 2025 00:41:00 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565899.3346761.9675336685729970783.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:58 +0000
References: <20250613055109.2335-1-chao@kernel.org>
In-Reply-To: <20250613055109.2335-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 13 Jun 2025 13:51:09 +0800 you
 wrote: > This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for
 tuning > @needed parameter of has_not_enough_free_secs(), if we configure
 it w/ > zero [...] 
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
X-Headers-End: 1uTriM-0006yf-Aq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce reserved_pin_section
 sysfs entry
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

On Fri, 13 Jun 2025 13:51:09 +0800 you wrote:
> This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
> @needed parameter of has_not_enough_free_secs(), if we configure it w/
> zero, it can avoid f2fs_gc() as much as possible while fallocating on
> pinned file.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: introduce reserved_pin_section sysfs entry
    https://git.kernel.org/jaegeuk/f2fs/c/59c1c89e9ba8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
