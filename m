Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 721CC6A5065
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNf-0004tm-TE;
	Tue, 28 Feb 2023 01:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNe-0004ta-AO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vrLI1OKBNmboNRUOX2OhbzztFX8n7e+C5REp5D6UcSw=; b=TBUVPpY7OJMSTMY4BmxOxCZgDK
 QXvFxSXlboiHNEfV3JM+WS3Rx+RizZ7IPwiQQUCZXEHuneUc4n7ZLKnbzxxdG4lSk/Q3kEl9hsIEa
 rZndv6ruWo6PwxOg9dLqJlt3Fp7tL7lO6UUNwrF8g1froRt+TbpqFf6esxZRA9CWOcc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vrLI1OKBNmboNRUOX2OhbzztFX8n7e+C5REp5D6UcSw=; b=camHzfYncsJ05oD31OHzcNUHNn
 +igx/K6NH5mgf4JxFyAkwHzDe88N9RFu0tZjpmETPZ9Lhumc+7XRUkLqnM/Jbi9cTQRr6TSB9f+X5
 3fo78vBlwvdsfeynLMUaitYwIVd5ZUlU3672ggLdw5FHtJ10tpabmqycgUmyOp8wvsAM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNc-0056AK-Ly for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5743B80DD6;
 Tue, 28 Feb 2023 01:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A490C4339B;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=0MyrhP8zxv6k33rgc7qfdjiKkOYxKugd6Y5yIm+G+iw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TrpxKXLHDJRZmtxPellg2R2e0LwhTmG2M11tD4m4F8F5sKa+ry/nGM6/NDBChHoSD
 j+YaN0hFzU38PKpe17cqCZbGiwewOAiZERVYOj+LVc+zb+jt+6wDtD4bw9ZY6ZPna5
 065r5y/ntPdrttGXnI3ygAbmSEG2s9nsuyYdZPPvc3oEf0eJPU9GIxZ27JxeQH239M
 eIP+6uHS95fWDDm7rwjzBKHQryPRBHRS4JkIq4xsHici3XYcI9wSHemkzlMeag11Ao
 CyNrHEzQkd0ZOa/GCfBP9ibpQQKBD4VlH0bx1VPvcM/70InEGg8VvhrbOZQC5RFlmL
 wAFn4/77eBcag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ED819C41676; Tue, 28 Feb 2023 01:01:54 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611496.27916.17463541946406622753.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:54 +0000
References: <20230104211448.4804-1-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
To: Vishal Moola (Oracle) <vishal.moola@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Wed, 4 Jan 2023 13:14:25 -0800
 you wrote: > This patch series replaces find_get_pages_range_tag() with >
 filemap_get_folios_tag(). This also allows the removal of multiple > calls
 to compound_head( [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNc-0056AK-Ly
Subject: Re: [f2fs-dev] [PATCH v5 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed,  4 Jan 2023 13:14:25 -0800 you wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5,01/23] pagemap: Add filemap_grab_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/ee7a5906ff08
  - [f2fs-dev,v5,02/23] filemap: Added filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/247f9e1feef4
  - [f2fs-dev,v5,03/23] filemap: Convert __filemap_fdatawait_range() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/6817ef514e1a
  - [f2fs-dev,v5,04/23] page-writeback: Convert write_cache_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/0fff435f060c
  - [f2fs-dev,v5,05/23] afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/acc8d8588cb7
  - [f2fs-dev,v5,06/23] btrfs: Convert btree_write_cache_pages() to use filemap_get_folio_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/51c5cd3bafe5
  - [f2fs-dev,v5,07/23] btrfs: Convert extent_write_cache_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/9f50fd2e92e3
  - [f2fs-dev,v5,08/23] ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/590a2b5f0a9b
  - [f2fs-dev,v5,09/23] cifs: Convert wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/4cda80f3a7a5
  - [f2fs-dev,v5,10/23] ext4: Convert mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/50ead2537441
  - [f2fs-dev,v5,11/23] f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/e6e46e1eb7ce
  - [f2fs-dev,v5,12/23] f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/a40a4ad1186a
  - [f2fs-dev,v5,13/23] f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/7525486affa5
  - [f2fs-dev,v5,14/23] f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/1cd98ee747cf
  - [f2fs-dev,v5,15/23] f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/4f4a4f0febe6
  - [f2fs-dev,v5,16/23] f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/580e7a492608
  - [f2fs-dev,v5,17/23] gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/87ed37e66dfd
  - [f2fs-dev,v5,18/23] nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/5ee4b25cb730
  - [f2fs-dev,v5,19/23] nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/a24586583169
  - [f2fs-dev,v5,20/23] nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/41f3f3b5373e
  - [f2fs-dev,v5,21/23] nilfs2: Convert nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/d4a16d31334e
  - [f2fs-dev,v5,22/23] nilfs2: Convert nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/243c5ea4f783
  - [f2fs-dev,v5,23/23] filemap: Remove find_get_pages_range_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/c5792d938411

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
