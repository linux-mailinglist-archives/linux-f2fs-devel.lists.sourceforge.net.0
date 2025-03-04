Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F950A4E7D1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 18:10:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpVmv-0002i8-Fv;
	Tue, 04 Mar 2025 17:10:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tpVmt-0002hy-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QsmfRGtSawkVi3Q5xCs3dPi+bvhR77BXSCQzfahsmeo=; b=cutg9nImNXaI37Q1oCcAhpGv76
 vXfdJBqWknpfcqYRTWxNCb8pzpig4150d9HUcAgaPZjBAd3QTF3y8+mnG9HrMaugnPdlvWWW3I8p5
 RMpe6LxiVjnGYW+U4M2ygn6PRszZtty48XVjtNEyFRTyFRwlotw10pdiJ8NKUv5+Oa+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QsmfRGtSawkVi3Q5xCs3dPi+bvhR77BXSCQzfahsmeo=; b=G1Drag1S+Zq0TS2Wnpi10PMyZF
 UKjZkZzcQK/ORSlWuVoT2Fk4kHeIJfTf1ZBrifDh1k/nEBCBIegwgvBSQitmmabpq4+E2KfYsnELj
 o0rwk6+HUBUE0X0myedmMWoi1JbcCnnzLf2jmZGxeeOOMxAlDgB8cQPQlCcS5axOasf0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpVmg-0004oG-Je for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B140A459EA;
 Tue,  4 Mar 2025 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917C0C4CEE5;
 Tue,  4 Mar 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741108211;
 bh=CXHGF5JE2IKfcCUn9rR5K/yFn0hXIzYaGLStVBBPqrg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nBM2iqAQwQlUhfxsD72F0/ft3h7w9FID3z/SRIwyS3T1CROHKkUnpP1Yxiw2DGPsn
 Jb9Z3t2FaKI3wpnfFaxekphyvgbJCe2gF9ubIFjfGuKd7SzY9Snw2IkjSOOqts6BE9
 A3g7HpUWdOdAfetMoRWpz0TmNWVnjLmiUJFcfngYYLS1TJ82BcIDHHcOK8TLbFM1PS
 0lt9bLxNy09XVIPZeI/W7qZp+B2ipp8927EPekoFhvyBBAcurwnvC+f+Ac2RtEpScN
 9qtyd45zAybQ707jRJZ78TrJk1UuR2HWhyfcZYxjIWUE8DkJMnsP1FW4V/YlGgpFqn
 w90zhzwzuvImg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE027380AA7F; Tue,  4 Mar 2025 17:10:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174110824448.224349.9741584954553856935.git-patchwork-notify@kernel.org>
Date: Tue, 04 Mar 2025 17:10:44 +0000
References: <20250218055203.591403-1-willy@infradead.org>
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
To: Matthew Wilcox (Oracle) <willy@infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 18 Feb 2025 05:51:34 +0000 you
 wrote: > More f2fs folio conversions. This time I'm focusing on removing >
 accesses to page->mapping as well as getting rid of accesses to > old APIs.
 f2fs was t [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpVmg-0004oG-Je
Subject: Re: [f2fs-dev] [PATCH 00/27] f2fs folio conversions for v6.15
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 18 Feb 2025 05:51:34 +0000 you wrote:
> More f2fs folio conversions.  This time I'm focusing on removing
> accesses to page->mapping as well as getting rid of accesses to
> old APIs.  f2fs was the last user of wait_for_stable_page(),
> grab_cache_page_write_begin() and wait_on_page_locked(), so
> I've included those removals in this series too.
> 
> Matthew Wilcox (Oracle) (27):
>   f2fs: Add f2fs_folio_wait_writeback()
>   mm: Remove wait_for_stable_page()
>   f2fs: Add f2fs_folio_put()
>   f2fs: Convert f2fs_flush_inline_data() to use a folio
>   f2fs: Convert f2fs_sync_node_pages() to use a folio
>   f2fs: Pass a folio to flush_dirty_inode()
>   f2fs: Convert f2fs_fsync_node_pages() to use a folio
>   f2fs: Convert last_fsync_dnode() to use a folio
>   f2fs: Return a folio from last_fsync_dnode()
>   f2fs: Add f2fs_grab_cache_folio()
>   mm: Remove grab_cache_page_write_begin()
>   f2fs: Use a folio in __get_node_page()
>   f2fs: Use a folio in do_write_page()
>   f2fs: Convert f2fs_write_end_io() to use a folio_iter
>   f2fs: Mark some functions as taking a const page pointer
>   f2fs: Convert f2fs_in_warm_node_list() to take a folio
>   f2fs: Add f2fs_get_node_folio()
>   f2fs: Use a folio throughout f2fs_truncate_inode_blocks()
>   f2fs: Use a folio throughout __get_meta_page()
>   f2fs: Hoist the page_folio() call to the start of
>     f2fs_merge_page_bio()
>   f2fs: Add f2fs_get_read_data_folio()
>   f2fs: Add f2fs_get_lock_data_folio()
>   f2fs: Convert move_data_page() to use a folio
>   f2fs: Convert truncate_partial_data_page() to use a folio
>   f2fs: Convert gc_data_segment() to use a folio
>   f2fs: Add f2fs_find_data_folio()
>   mm: Remove wait_on_page_locked()
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/27] f2fs: Add f2fs_folio_wait_writeback()
    https://git.kernel.org/jaegeuk/f2fs/c/17683927d078
  - [f2fs-dev,02/27] mm: Remove wait_for_stable_page()
    https://git.kernel.org/jaegeuk/f2fs/c/36e1d6344aca
  - [f2fs-dev,03/27] f2fs: Add f2fs_folio_put()
    (no matching commit)
  - [f2fs-dev,04/27] f2fs: Convert f2fs_flush_inline_data() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/015d9c56bd5e
  - [f2fs-dev,05/27] f2fs: Convert f2fs_sync_node_pages() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/5d0a91284853
  - [f2fs-dev,06/27] f2fs: Pass a folio to flush_dirty_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/de90f7614424
  - [f2fs-dev,07/27] f2fs: Convert f2fs_fsync_node_pages() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/e23bebc3c0d2
  - [f2fs-dev,08/27] f2fs: Convert last_fsync_dnode() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/18f3814fa6a8
  - [f2fs-dev,09/27] f2fs: Return a folio from last_fsync_dnode()
    https://git.kernel.org/jaegeuk/f2fs/c/e11a31139517
  - [f2fs-dev,10/27] f2fs: Add f2fs_grab_cache_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/8d77f68daeb1
  - [f2fs-dev,11/27] mm: Remove grab_cache_page_write_begin()
    https://git.kernel.org/jaegeuk/f2fs/c/e33ce6bd4ea2
  - [f2fs-dev,12/27] f2fs: Use a folio in __get_node_page()
    https://git.kernel.org/jaegeuk/f2fs/c/48a34c598103
  - [f2fs-dev,13/27] f2fs: Use a folio in do_write_page()
    https://git.kernel.org/jaegeuk/f2fs/c/cd8f95718c89
  - [f2fs-dev,14/27] f2fs: Convert f2fs_write_end_io() to use a folio_iter
    https://git.kernel.org/jaegeuk/f2fs/c/fb9660481e3c
  - [f2fs-dev,15/27] f2fs: Mark some functions as taking a const page pointer
    https://git.kernel.org/jaegeuk/f2fs/c/521a46848690
  - [f2fs-dev,16/27] f2fs: Convert f2fs_in_warm_node_list() to take a folio
    https://git.kernel.org/jaegeuk/f2fs/c/1a58a41ccce6
  - [f2fs-dev,17/27] f2fs: Add f2fs_get_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/4d417ae2bfce
  - [f2fs-dev,18/27] f2fs: Use a folio throughout f2fs_truncate_inode_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/520b17e093f4
  - [f2fs-dev,19/27] f2fs: Use a folio throughout __get_meta_page()
    https://git.kernel.org/jaegeuk/f2fs/c/922e24acb49e
  - [f2fs-dev,20/27] f2fs: Hoist the page_folio() call to the start of f2fs_merge_page_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/b8fcb8423053
  - [f2fs-dev,21/27] f2fs: Add f2fs_get_read_data_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/4ae71b1996ef
  - [f2fs-dev,22/27] f2fs: Add f2fs_get_lock_data_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/20f974cd2124
  - [f2fs-dev,23/27] f2fs: Convert move_data_page() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/6d1ba45c8db0
  - [f2fs-dev,24/27] f2fs: Convert truncate_partial_data_page() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/ab907aa2a2f3
  - [f2fs-dev,25/27] f2fs: Convert gc_data_segment() to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/a86e109ee2c6
  - [f2fs-dev,26/27] f2fs: Add f2fs_find_data_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/0cd402baa03b
  - [f2fs-dev,27/27] mm: Remove wait_on_page_locked()
    https://git.kernel.org/jaegeuk/f2fs/c/d96e2802a802

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
