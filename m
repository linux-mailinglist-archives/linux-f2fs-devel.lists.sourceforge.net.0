Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FF65DE25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6F-0002K0-Mr;
	Wed, 04 Jan 2023 21:15:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6D-0002Je-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=; b=Qcs0n0O3+wEUcGu4E1xECCBg2m
 2HKlaFzDPEPylfYWueoh+sPWYrlVwTUoegYAV2iFeiKDaw/AUWPFkKzZYkmN3uxGrdHfYi+65s6cK
 05NkAKCriRWakNMZjJ1w3ViR2oWx00ByKfKJNX0IdmIf9Z/2D9vkTy0t7jZtCoZyiL7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=; b=m
 FQ4oav+IrAyXeVwF8YHRWPYSI6Qi7g7YGG+Fx70zyvEb26/QliVrnVO9kFDBOLeE4dq+PJlMNVfUY
 dpSucFsQf55kiSVTP3YGgHb8fN2nIbaBBCmVTXkQeDG2juAzbiVVaFpa9/EwGSL5y6UhDmt008UlQ
 8FHKwEMsUlves1Hw=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6D-0050w6-66 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:01 +0000
Received: by mail-pl1-f174.google.com with SMTP id y1so1703598plb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=;
 b=mwUaRHyXO3QpRK5P0JqCEjtDjkmGl7YgUMaT1I2YjsKhseOwqNkNS33mOlEf/eRTXu
 Dx4cepCH0DpI7UZias9hAXzrqhmP9FqJPQ5SpCcrNsEip5tDid5QCJ8rq3xSJ7zfXgzS
 VkkY41Iwf5a5gzpho+eHq9V7JD1kKJVPOfzCuRJq6ljFPE+NlmpfzNYoSMe4wocuCgzf
 S6i7hTWrnSsU5BeCV3tLAdKHoc+E6ZXdQXMGE1pFenz1nLeHJTOMKZAollRFOqAqS7OZ
 auFae1eJ8Ii2yGyYjhvy6b6WvXd1YJI0BgZbYV7R5btP09Ol+PqZuvdKcR/Dbg+8nqw5
 sxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=;
 b=HKfedsgGeZMjW5uETQRfxjl8utckLIs3WrAbDdAZUCZPoilT0PzgGTd1Qx5WBXSv8P
 NDgwqbDS4OuUbMRlajZwgyegtGEyJHnYGSfgQQwPJ1FhzYZKGH/bTGQoyMK1wF6qomFz
 GqSf/zWGOdxCAuZD4icdSq9n84dpg3Yb4i5orWbG42FXCpiRwwAe514i88Vw0P9zp1A/
 7/dXv9TwMontQd4ff+Zr6KdVHZeKVGBMxhqHr9SlcFfYuXSVrPx3299m/IvGQQjLkXPt
 Od0ileD9hcCzKyNSK5TMviytzo+Dd7EpfZKZe9mopHIZOyJ5cj24ZW1U1x3A4uLlUUCm
 Cd8A==
X-Gm-Message-State: AFqh2kqHS509rJuJnAVTx2IkZIC0PZBoqaE4d1Kpb5o6oAZ0mUBV7VG1
 eLNeruLYWbmzRb6w9Rl2Z2VEYtR9uJE=
X-Google-Smtp-Source: AMrXdXuHWcLr2ISD1AWLN6noveXBmNIMzDKhC6iHCDPkCElkMLkDu5P/j13SKsDU15gZnXatqrr41A==
X-Received: by 2002:a17:90a:cc0b:b0:219:5955:7570 with SMTP id
 b11-20020a17090acc0b00b0021959557570mr23943541pju.46.1672866895416; 
 Wed, 04 Jan 2023 13:14:55 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:54 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:25 -0800
Message-Id: <20230104211448.4804-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch series replaces find_get_pages_range_tag() with
 filemap_get_folios_tag(). This also allows the removal of multiple calls
 to compound_head() throughout. It also makes a good chunk of the str [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6D-0050w6-66
Subject: [f2fs-dev] [PATCH v5 00/23] Convert to filemap_get_folios_tag()
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
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series replaces find_get_pages_range_tag() with
filemap_get_folios_tag(). This also allows the removal of multiple
calls to compound_head() throughout.
It also makes a good chunk of the straightforward conversions to folios,
and takes the opportunity to introduce a function that grabs a folio
from the pagecache.

I've run xfstests on xfs, btrfs, ext4, f2fs, and nilfs2, but more testing may
be beneficial. The page-writeback and filemap changes implicitly work. Still
looking for review of cifs, gfs2, and ext4.

---
v5:
  Rebased onto upstream 6.2-rc2
  Filesystems modified to use folio_get() instead of folio_ref_inc()
  F2fs modified to maintain use of F2FS_ONSTACK_PAGES

v4:
  Fixed a bug with reference counting in cifs changes
  - Reported-by: kernel test robot <oliver.sang@intel.com> 
  Improved commit messages to be more meaningful
  Got some Acked-bys and Reviewed-bys

v3:
  Rebased onto upstream 6.1
  Simplified the ceph patch to only necessary changes
  Changed commit messages throughout to be clearer
  Got an Acked-by for another nilfs patch
  Got Tested-by for afs

v2:
  Got Acked-By tags for nilfs and btrfs changes
  Fixed an error arising in f2fs
  - Reported-by: kernel test robot <lkp@intel.com>

Vishal Moola (Oracle) (23):
  pagemap: Add filemap_grab_folio()
  filemap: Added filemap_get_folios_tag()
  filemap: Convert __filemap_fdatawait_range() to use
    filemap_get_folios_tag()
  page-writeback: Convert write_cache_pages() to use
    filemap_get_folios_tag()
  afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
  btrfs: Convert btree_write_cache_pages() to use
    filemap_get_folio_tag()
  btrfs: Convert extent_write_cache_pages() to use
    filemap_get_folios_tag()
  ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
  cifs: Convert wdata_alloc_and_fillpages() to use
    filemap_get_folios_tag()
  ext4: Convert mpage_prepare_extent_to_map() to use
    filemap_get_folios_tag()
  f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
  f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
  gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_copy_dirty_pages() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_clear_dirty_pages() to use
    filemap_get_folios_tag()
  filemap: Remove find_get_pages_range_tag()

 fs/afs/write.c          | 116 ++++++++++++++++++++--------------------
 fs/btrfs/extent_io.c    |  57 ++++++++++----------
 fs/ceph/addr.c          |  58 ++++++++++----------
 fs/cifs/file.c          |  32 +++++++++--
 fs/ext4/inode.c         |  65 +++++++++++-----------
 fs/f2fs/checkpoint.c    |  49 +++++++++--------
 fs/f2fs/data.c          |  84 ++++++++++++++++++++---------
 fs/f2fs/node.c          |  72 +++++++++++++------------
 fs/gfs2/aops.c          |  64 ++++++++++++----------
 fs/nilfs2/btree.c       |  14 ++---
 fs/nilfs2/page.c        |  59 ++++++++++----------
 fs/nilfs2/segment.c     |  44 +++++++--------
 include/linux/pagemap.h |  32 +++++++----
 include/linux/pagevec.h |   8 ---
 mm/filemap.c            |  84 ++++++++++++++---------------
 mm/page-writeback.c     |  44 +++++++--------
 mm/swap.c               |  10 ----
 17 files changed, 481 insertions(+), 411 deletions(-)

-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
