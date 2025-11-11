Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF69C5000E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYwBYJ4ftRnG5o9ymnOKLLNKPzU12R9Ei/p3qZVN1ws=; b=MZWbIVjLuiJgUN83LacpIdGOMc
	6eUfneg5w4wtYkmziRrqjRu7Qn7WnNvbE0QCn1MquLqv3TfpMMI2sWZiEsQVtSqWVrWgFGfCTXBgX
	LKj69ZbLVQB5BqS6twrHa9qEfR59osOqd9UTz18ZQKHA3zeqbZWIdaKo50EStBEs/l9g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCX-0004c2-IL;
	Tue, 11 Nov 2025 22:51:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCW-0004bj-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqQPl0oM3ccsPJ3OWoo6oHQtcvOoGs4L3YwPkcFGxKo=; b=DCKjenbvxdBGq2zK9jOf4+ZXHE
 Yofir5Em5Fv/V8A5D5i4uPLRp0TZzTjI8Fvwzaj1H9hlAZWXCZT/UavsdS6TSQnJn0uYsnkL8Gf8u
 1DOgs0RIcVsX/GwsLkrodYkv5Hde8XnjuxGw/8FRMw03foCcPILtyT57PAyne9ctkZ/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqQPl0oM3ccsPJ3OWoo6oHQtcvOoGs4L3YwPkcFGxKo=; b=QIsgMTsq35HIhBwTcdzlPBMGGj
 eq5TduSfflEveKh00LgQJYqzEEPXRpKBW+JMQphleknF+9DWZPVZzjn77tQlY4Rxo0ABLXkD7Mvlb
 ihnmILQXK7gz1S9r/3sMiTfwpIDbrveApq0K0WGwVfXkvIP1C+Gsb+bOh+jYxaEyOU30=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCV-000471-Tu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 506A560209;
 Tue, 11 Nov 2025 22:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF25AC19423;
 Tue, 11 Nov 2025 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901449;
 bh=MapFwYBdepkknCvD5b+KZQlwR4RcWHE5HPDQANoxlM0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y4Oo8UR4frGw7wi0FYMB2URgXmhKhMYNj84PU8hpt/gqeywOG6OQGBCSFeKcNXstw
 vB06erkPXVLw/ALd1llveQEneUAGk2xxd11axDtpHq9GqaH7tq2p8zkV8MJIWc4wBU
 jL3xi5Qw0nPj2dPKnfWm4+Iv2Q2JMMFflDwKNeuKV8k4rCvpvz/aoAmWSgklNPTSSq
 4cAkfEUGRyqiP0wQZ9uSTh8CYCPvMRyC2CbKcIOvwSBxM36vovsCy9/PvXhahC5xsh
 I8Iji9hJUf2AdeP53YryqJBwCVmLT6ClHNNM1F2p0h5mtqXCUSe0c8vYXvrEm9huWr
 n566hi/Bp1KrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BFB380DBCD; Tue, 11 Nov 2025 22:50:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141874.3596344.13380399502745715174.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:18 +0000
References: <20251029051807.3804-1-hexiaole1994@126.com>
In-Reply-To: <20251029051807.3804-1-hexiaole1994@126.com>
To: Xiaole He <hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 29 Oct 2025 13:18:07 +0800 you
 wrote: > The one_time_gc field in struct victim_sel_policy is conditionally
 > initialized but unconditionally read, leading to undefined behavior > that
 triggers [...] 
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
X-Headers-End: 1vIxCV-000471-Tu
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix uninitialized one_time_gc in
 victim_sel_policy
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
Cc: linux-kernel@vger.kernel.org, jaegeuk@kernel.org, daehojeong@google.com,
 stable@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 29 Oct 2025 13:18:07 +0800 you wrote:
> The one_time_gc field in struct victim_sel_policy is conditionally
> initialized but unconditionally read, leading to undefined behavior
> that triggers UBSAN warnings.
> 
> In f2fs_get_victim() at fs/f2fs/gc.c:774, the victim_sel_policy
> structure is declared without initialization:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: fix uninitialized one_time_gc in victim_sel_policy
    https://git.kernel.org/jaegeuk/f2fs/c/f10e76889502

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
