Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42682F4D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 20:02:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPohp-0002AJ-SJ;
	Tue, 16 Jan 2024 19:02:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rPohm-0002AA-CQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpAXod8D/xRXm9/3ApCAtk70KL4OPlTyLwW8+G588SE=; b=lZcH+qiCktA4y4HsAZ4JXdPOOv
 3XfWHNbQoK32rs1rCPf0ZCkDvWNplISyocl00YdTFQcsPLnDYFcnWhC/wKR5fjZdUiqkMQGmDXCLG
 UujB3qUkbAboClMXZg6IJoynNQnrduHyUL6c3X14e914QrS5IiNzpnmSr3pxVzUb2kL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpAXod8D/xRXm9/3ApCAtk70KL4OPlTyLwW8+G588SE=; b=imOLB6XX3kKVB1cHMglNZxcQMs
 5OYh2WdhlLZysm37ZUJIcyW8wh0crpK5XXgaAvZKLV7cmx5D2WosCxKinO9cn56UibfCiG78snRAN
 8xtStsG6RNdibVaceRlw2JpP9Hza47cQnujeBiPxR+3pH/vp/5Tt0RxPWFVXSj8xA8W8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPohj-0000as-0L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0857CE1ADA;
 Tue, 16 Jan 2024 19:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04F44C433A6;
 Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705431739;
 bh=B7KdqtNAr+YKsv310derD9kBElqfPUpwakSS4/1H6EE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fTyE/atvgWNfwbRtGAK9G4fT+t48V9auXl/dM9UBC1XrAORjlIi5Sk5uxCY3mFft3
 W12nOB+vt1pk5Y5eQJ7cHfFOmJkPJvsHoFOtfCATr1XDymAjtZjtVYC3E2dIzth+Qy
 a/qruXUyLG6BjMYwosh2gTkz6FHXILkeyFqWgyx3t/FxkHad7dz59tKTRafdDZjRJk
 AGM0FQc2faIf3FMg3SordWsvUL52JNTkbE8fbXumy3MdLuYzhyjFm7S2YwlFRNgejh
 I/IEI9/XBi42QIjbpG5427aZzPNdGx4KjJLsJdGw6CTUT/pyMBXvGbG6FHIzLMYGxz
 y9NrZ/egbUVBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D51F4D8C9A0; Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170543173886.30188.17408872425977441156.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 19:02:18 +0000
References: <20230816050803.15660-1-krisman@suse.de>
In-Reply-To: <20230816050803.15660-1-krisman@suse.de>
To: Gabriel Krisman Bertazi <krisman@suse.de>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Gabriel Krisman Bertazi <krisman@suse.de>: On Wed, 16 Aug 2023 01:07:54 -0400
 you wrote: > Hi, > > This is v6 of the negative dentry on case-insensitive
 directories. > Thanks Eric for the review of the last iteration. This version
 > drops the [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPohj-0000as-0L
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Gabriel Krisman Bertazi <krisman@suse.de>:

On Wed, 16 Aug 2023 01:07:54 -0400 you wrote:
> Hi,
> 
> This is v6 of the negative dentry on case-insensitive directories.
> Thanks Eric for the review of the last iteration.  This version
> drops the patch to expose the helper to check casefolding directories,
> since it is not necessary in ecryptfs and it might be going away.  It
> also addresses some documentation details, fix a build bot error and
> simplifies the commit messages.  See the changelog in each patch for
> more details.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v6,1/9] ecryptfs: Reject casefold directory inodes
    https://git.kernel.org/jaegeuk/f2fs/c/cd72c7ef5fed
  - [f2fs-dev,v6,2/9] 9p: Split ->weak_revalidate from ->revalidate
    (no matching commit)
  - [f2fs-dev,v6,3/9] fs: Expose name under lookup to d_revalidate hooks
    (no matching commit)
  - [f2fs-dev,v6,4/9] fs: Add DCACHE_CASEFOLDED_NAME flag
    (no matching commit)
  - [f2fs-dev,v6,5/9] libfs: Validate negative dentries in case-insensitive directories
    (no matching commit)
  - [f2fs-dev,v6,6/9] libfs: Chain encryption checks after case-insensitive revalidation
    (no matching commit)
  - [f2fs-dev,v6,7/9] libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
    (no matching commit)
  - [f2fs-dev,v6,8/9] ext4: Enable negative dentries on case-insensitive lookup
    (no matching commit)
  - [f2fs-dev,v6,9/9] f2fs: Enable negative dentries on case-insensitive lookup
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
