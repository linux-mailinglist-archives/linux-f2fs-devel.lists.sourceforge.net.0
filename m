Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B97985195
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2024 05:41:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stIuJ-0001jv-Uu;
	Wed, 25 Sep 2024 03:41:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1stIuI-0001jo-9W
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gz5R+Exdl8ILuQhBeNnyunuenXp9vNn6uv8uyQo5iwo=; b=HGXjfxbAoS6WQUzoeKw2lOxUE/
 rs/5E4s9y4kBpKYaBU3hrJ6iA12DGZER/I5mrygBOqJDX9rX69+JVLj65M66UyPv5bdOm8qfAPQ9q
 KBb9EeEHYgsdSIkTuQOsVhKeZVxWr13WZ08Cfi8eOhuiB5FJC6+5jXXT5bQ5YrCQKW3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gz5R+Exdl8ILuQhBeNnyunuenXp9vNn6uv8uyQo5iwo=; b=iUCV2IaJIn02NGX0wMbRIOG2ls
 GLRjDfTHjsx7maECfEi3/4uJqudGyFLw3PvuslNV0rmDynoCKwTHM4CaD2HVrhhkqZUDKbz5gEZv5
 R5z70MUpy32+y3zyN7b+mDeJzfKXpyVaaBE2Qpa9rdM5KIcfzW5L4k/hiX75kL1OZmJc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stIuH-0003B4-H9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A75FA4314D;
 Wed, 25 Sep 2024 03:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B085C4CEC3;
 Wed, 25 Sep 2024 03:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727235686;
 bh=0KPP4EoTFplAZ3mMmt9nybfEbdhCUPmpFvNKHeyyYU0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mjXT42eLMHN402XP5cp2i5bSbITtu0+0LhQKa+nTNyYMshcTwfH39/EuFEDTuW/RG
 hwM4eHwwc9lCG4vqa4m8dcXKAXJbBYB93hWDzjKZ6fmZIE93AhKImr2iHxeIBaxWuO
 fSotR23uoDBBjTxv8UEGqHUTYbmXDKoPYHFG9gWsjpSgPvdA+sA1njAkD/KhhLVwML
 jwOVYggGwlW9FPWW5hk4i6RnHwcV9dJ7hJXGxuLqX7ED6RE6zMo5WrksMJUFP77efm
 FjH8MZVRdV+4dR4xeCfNHuz69C4c7a62OLXpZU/xLn7COFLVX+KnhJybivIWRSqBK6
 Hy2j5cZ9JGyYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B14F8380DBF5; Wed, 25 Sep 2024 03:41:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172723568853.97387.7741681136209020061.git-patchwork-notify@kernel.org>
Date: Wed, 25 Sep 2024 03:41:28 +0000
References: <20240822013714.3278193-1-lizetao1@huawei.com>
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
To: Li Zetao <lizetao1@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 David Sterba <dsterba@suse.com>: On Thu, 22 Aug 2024 09:37:00 +0800 you wrote:
 > Hi all, > > In btrfs, because there are some interfaces that do not use
 folio, > there is page-folio-page mutual conversion. This patch set should
 > cle [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1stIuH-0003B4-H9
Subject: Re: [f2fs-dev] [PATCH -next 00/14] btrfs: Cleaned up folio->page
 conversion
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
Cc: josef@toxicpanda.com, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, clm@fb.com, terrelln@fb.com,
 dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by David Sterba <dsterba@suse.com>:

On Thu, 22 Aug 2024 09:37:00 +0800 you wrote:
> Hi all,
> 
> In btrfs, because there are some interfaces that do not use folio,
> there is page-folio-page mutual conversion. This patch set should
> clean up folio-page conversion as much as possible and use folio
> directly to reduce invalid conversions.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/14] btrfs: convert clear_page_extent_mapped() to take a folio
    (no matching commit)
  - [f2fs-dev,02/14] btrfs: convert get_next_extent_buffer() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/d4aeb5f7a7e6
  - [f2fs-dev,03/14] btrfs: convert try_release_subpage_extent_buffer() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/0145aa38cb39
  - [f2fs-dev,04/14] btrfs: convert try_release_extent_buffer() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/b8ae2bfa685f
  - [f2fs-dev,05/14] btrfs: convert read_key_bytes() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/884937793db5
  - [f2fs-dev,06/14] btrfs: convert submit_eb_subpage() to take a folio
    (no matching commit)
  - [f2fs-dev,07/14] btrfs: convert submit_eb_page() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/08dd8507b116
  - [f2fs-dev,08/14] btrfs: convert try_release_extent_state() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/dd0a8df45566
  - [f2fs-dev,09/14] btrfs: convert try_release_extent_mapping() to take a folio
    (no matching commit)
  - [f2fs-dev,10/14] btrfs: convert zlib_decompress() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/54c78d497b38
  - [f2fs-dev,11/14] btrfs: convert lzo_decompress() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/9f9a4e43a870
  - [f2fs-dev,12/14] btrfs: convert zstd_decompress() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/b70f3a45464b
  - [f2fs-dev,13/14] btrfs: convert btrfs_decompress() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/aeb6d8814841
  - [f2fs-dev,14/14] btrfs: convert copy_inline_to_page() to use folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
