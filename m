Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB916A505F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNY-0004sr-4o;
	Tue, 28 Feb 2023 01:02:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNW-0004sh-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i2S8m7mb3CFg3PJGJcWaz4tfhCmbbNUZj5vRU1El3nk=; b=ezKarw4wcjpGrGddyyKW5dTGxK
 zTzn/hkI2BYSXSC2grEf7xaNdHp89DV8/3Rxarle9DQ+vWalebVdVInFtArnJB4UcaR5PYt4kTBJ9
 EDIpBbq4t8Y6Ha1ItZaNg0Cmhovr6rQporWAMu+up/+xVjXKGdZ85r52oKWbN0xFlnAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i2S8m7mb3CFg3PJGJcWaz4tfhCmbbNUZj5vRU1El3nk=; b=K
 MULGwjskgKzy8dzjd89pbVh7BGo756xtyLlE0gBTL6Oad4+UyNZkG2UCx39xAuthq1rcSQR3Q+HrT
 tPYk0oCYKL4hfVpQK+q9XK0/I0nydmBNk/w4xutgKca0MIenKRdWrDBSlZUy8VU6+AjMpJiafTegR
 u2tawX/B6EJYf5Ck=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNU-0056AE-V0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EA6B60F3E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F37E6C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Feb 2023 01:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=crqusPmBMT28mgdX8Y9YTDhlWIuY6jLN5QNScmZQ7pg=;
 h=Subject:From:Date:To:From;
 b=IQTD54qAKqXNv7HJnBS2MPBC0ecSRuSFAuvXL9qSRpKQk1y1SKE1THPqfAghKg15L
 h+5siyIEsbRBtCWTTiETZhJXhcKxORkImyNEL3ggkTaVF4CBkynUs0Tx9drVj8zyiZ
 AJSfpcJyd0j8RXTrJ4Nbxh7fthC3NnjDXZeMfyOd1ey27ereVKWL8Td/XTyq/c6rMc
 rW9Cs9PNlaotovYU03G2qPkNGJCddUzZRHrCusELnLi1nQu3pvO26O33SN3vaBfAx3
 WjOt9Zn88FEw661E5Iup0LspybpvYDuCAa6dqyTJo5/Knd4lZlqI/BBcWMYYyNSXzu
 10az76t0z0x4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DA29CE68D2D for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Feb 2023 01:01:54 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611479.27916.3941238065281013621.git-patchwork-summary@kernel.org>
Date: Tue, 28 Feb 2023 01:01:54 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: fsverity: support for
 non-4K pages Submitter: Eric Biggers <ebiggers@kernel.org> Committer: Eric
 Biggers <ebiggers@google.com> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNU-0056AE-V0
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: fsverity: support for non-4K pages
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=706831
  Lore link: https://lore.kernel.org/r/20221223203638.41293-1-ebiggers@kernel.org
    Patches: [f2fs-dev,v2,01/11] fsverity: use unsigned long for level_start
             [f2fs-dev,v2,02/11] fsverity: simplify Merkle tree readahead size calculation
             [f2fs-dev,v2,03/11] fsverity: store log2(digest_size) precomputed
             [f2fs-dev,v2,04/11] fsverity: use EFBIG for file too large to enable verity
             [f2fs-dev,v2,05/11] fsverity: replace fsverity_hash_page() with fsverity_hash_block()
             [f2fs-dev,v2,06/11] fsverity: support verification with tree block size < PAGE_SIZE
             [f2fs-dev,v2,07/11] fsverity: support enabling with tree block size < PAGE_SIZE
             [f2fs-dev,v2,08/11] ext4: simplify ext4_readpage_limit()
             [f2fs-dev,v2,09/11] f2fs: simplify f2fs_readpage_limit()
             [f2fs-dev,v2,10/11] fs/buffer.c: support fsverity in block_read_full_folio()
             [f2fs-dev,v2,11/11] ext4: allow verity with fs block size < PAGE_SIZE

Series: Convert to filemap_get_folios_tag()
  Submitter: Vishal Moola (Oracle) <vishal.moola@gmail.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=708912
  Lore link: https://lore.kernel.org/r/20230104211448.4804-1-vishal.moola@gmail.com
    Patches: [f2fs-dev,v5,01/23] pagemap: Add filemap_grab_folio()
             [f2fs-dev,v5,02/23] filemap: Added filemap_get_folios_tag()
             [f2fs-dev,v5,03/23] filemap: Convert __filemap_fdatawait_range() to use filemap_get_folios_tag()
             [f2fs-dev,v5,04/23] page-writeback: Convert write_cache_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,05/23] afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
             [f2fs-dev,v5,06/23] btrfs: Convert btree_write_cache_pages() to use filemap_get_folio_tag()
             [f2fs-dev,v5,07/23] btrfs: Convert extent_write_cache_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,08/23] ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
             [f2fs-dev,v5,09/23] cifs: Convert wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,10/23] ext4: Convert mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
             [f2fs-dev,v5,11/23] f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,12/23] f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
             [f2fs-dev,v5,13/23] f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,14/23] f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,15/23] f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
             [f2fs-dev,v5,16/23] f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,17/23] gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
             [f2fs-dev,v5,18/23] nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
             [f2fs-dev,v5,19/23] nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use filemap_get_folios_tag()
             [f2fs-dev,v5,20/23] nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
             [f2fs-dev,v5,21/23] nilfs2: Convert nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,22/23] nilfs2: Convert nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
             [f2fs-dev,v5,23/23] filemap: Remove find_get_pages_range_tag()

Series: Add the test_dummy_encryption key on-demand
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=719785
  Lore link: https://lore.kernel.org/r/20230208062107.199831-1-ebiggers@kernel.org
    Patches: [f2fs-dev,1/5] fscrypt: add the test dummy encryption key on-demand
             [f2fs-dev,2/5] ext4: stop calling fscrypt_add_test_dummy_key()
             [f2fs-dev,3/5] f2fs: stop calling fscrypt_add_test_dummy_key()
             [f2fs-dev,4/5] fs/super.c: stop calling fscrypt_destroy_keyring() from __put_super()
             [f2fs-dev,5/5] fscrypt: clean up fscrypt_add_test_dummy_key()

Patch: [f2fs-dev] MAINTAINERS: update fscrypt git repo
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=712563
  Lore link: https://lore.kernel.org/r/20230116233424.65657-1-ebiggers@kernel.org

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.3-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=725347
  Lore link: https://lore.kernel.org/r/Y/004is4VtYI7G2u@google.com

Patch: [f2fs-dev] MAINTAINERS: update fsverity git repo, list, and patchwork
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=712556
  Lore link: https://lore.kernel.org/r/20230116232257.64377-1-ebiggers@kernel.org


Total patches: 42

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
