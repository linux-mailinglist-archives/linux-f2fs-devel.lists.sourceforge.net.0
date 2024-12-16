Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2F9F3643
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 17:40:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNE9C-00048V-Fd;
	Mon, 16 Dec 2024 16:40:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tNE91-00048H-BA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3iilGf0G7C2NvgED0U9IJ92Cbcdf0yMfhcGWFbZVPI=; b=Q8fPdY5STcwyo2uWlxkWPvQiVd
 tsrFiaTLwPvdbro15b9VSTuuh4fBiB0kD5HcS2Rau0CNE7BpF4+TztPiL60Vljnv2AslR9bts/sdq
 ELeqR5kGdf8oD4G3AWYKjoX1lc01JEZ/9Oi7vUtE3PuSIDCTU6wrjBE5yCayqqIf8rdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3iilGf0G7C2NvgED0U9IJ92Cbcdf0yMfhcGWFbZVPI=; b=mp8KjMavv/sj4CSIDZrX+4imXL
 loa5uBfttfdtJVONg6FGGrFktfOhUfSzIYNo5Y3Kdk6Y+fNuN7KD7lpUjB0bqdp1uHkdPUO4wmnSW
 7+GmX59OceHm6mSEzuUHVhkQE+NytFPBZXbzXWx5JzFy/eydGA0rsoH6mCOGMtZoh+Ss=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNE91-0000sV-Cg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E98D6A418A2;
 Mon, 16 Dec 2024 16:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660C4C4CED0;
 Mon, 16 Dec 2024 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734367220;
 bh=YNH07nHPKnlXGpv8fHd7rkLd3VTVER0I1hRDHu8vXcw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OmgDDY6QBIhppKyYQz51Y1E7goaaUsWC0Tqn7S4N7Mcl13kSp0Ye/yo62FMUcyzFY
 oACS58PrTUofAUXIKHTMy3PRWUR9FZ7MhdHlCyg228XUL3Sw5h0ZyrnusewSMgNc9X
 QX2Uq5ydxJQaeEKUKyN8FA0NCm9IxcmGmBIn0qXzqR6Fa8mNrlOKXenwt7eKEosF2D
 VO+jGQ/hdsBelO2MLkPVhdPFEvMJTbtI0TkiOFeTdnHD+a6VMOmWS6KR1KxbeuwpAm
 S42Oty7hpWgbfxnNlzXKtjoy6cZGdEVYa178Tg5oPK7g0hV6hUslXebzDmZwInzs4k
 UUMD/Eyn/3q0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE96D3806656; Mon, 16 Dec 2024 16:40:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173436723750.272389.10899464874516532269.git-patchwork-notify@kernel.org>
Date: Mon, 16 Dec 2024 16:40:37 +0000
References: <20241128045828.527559-1-willy@infradead.org>
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
To: Matthew Wilcox (Oracle) <willy@infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 28 Nov 2024 04:58:15 +0000 you
 wrote: > This round of f2fs patches accomplishes two things: > > - Removal
 of all references to page->index in f2fs. I'm looking to > finish this
 conversion in t [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNE91-0000sV-Cg
Subject: Re: [f2fs-dev] [PATCH 00/11] f2fs folio patches
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 28 Nov 2024 04:58:15 +0000 you wrote:
> This round of f2fs patches accomplishes two things:
> 
>  - Removal of all references to page->index in f2fs.  I'm looking to
>    finish this conversion in the January merge window.
>  - Removal of all calls to page_file_mapping() and folio_file_mapping()
> 
> I have only compile-tested these patches.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/11] f2fs: Use a folio in f2fs_all_cluster_page_ready()
    https://git.kernel.org/jaegeuk/f2fs/c/a909c1795353
  - [f2fs-dev,02/11] f2fs: Use a folio in f2fs_compress_write_end()
    https://git.kernel.org/jaegeuk/f2fs/c/ff6c82a934f7
  - [f2fs-dev,03/11] f2fs: Use a folio in f2fs_truncate_partial_cluster()
    https://git.kernel.org/jaegeuk/f2fs/c/1cda5bc0b2fe
  - [f2fs-dev,04/11] f2fs: Use a folio in f2fs_write_compressed_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/ac866908d7a9
  - [f2fs-dev,05/11] f2fs: Convert submit tracepoints to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/87e2a15bc008
  - [f2fs-dev,06/11] f2fs: Add F2FS_F_SB()
    https://git.kernel.org/jaegeuk/f2fs/c/1cf746007005
  - [f2fs-dev,07/11] f2fs: Convert f2fs_finish_read_bio() to use folios
    https://git.kernel.org/jaegeuk/f2fs/c/e0821645dd2d
  - [f2fs-dev,08/11] f2fs: Use a folio more in f2fs_submit_page_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/0765b3f989a7
  - [f2fs-dev,09/11] f2fs: Use a data folio in f2fs_submit_page_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/f58d8645824b
  - [f2fs-dev,10/11] f2fs: Convert __read_io_type() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/19bbd306ddfd
  - [f2fs-dev,11/11] f2fs: Remove calls to folio_file_mapping()
    https://git.kernel.org/jaegeuk/f2fs/c/c910a64bc4e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
