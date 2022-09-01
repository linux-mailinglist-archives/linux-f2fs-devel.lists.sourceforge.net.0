Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DB5AA1F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsH1-000770-GZ;
	Thu, 01 Sep 2022 22:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsGn-00076S-Mk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9AhdqT0NnU3T2Py6z8gOWa0P0fDVhbOVg/CkZAFmw8w=; b=RIuYkTybbTFTLaQMtP+DlgBFAp
 FN4ayCnpx2u6VnUZ0v8xP3xWi5PNXp7aURegYL2FtpBBMCTv1bDCPlhJlWLpjFsYk419h57cmdsVu
 r5L28REJiagSO1epXOArmBk8o3hsUA45v1N1hL8TAiLZXde511j3KpeHNG8yUpXn4v3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9AhdqT0NnU3T2Py6z8gOWa0P0fDVhbOVg/CkZAFmw8w=; b=P
 Ix9BrN3oMe5V1bM75X1RfHgyFulIJvkLjiBZIgTEjAGwHPs1cIHZVIr4zDoKpaznbHmWbVFToyKMA
 gtUz3CpEvNl3mIIosTF5sqrjYlQBp+j6OsSqJIWN447nqWRt4b/qt83t3fMaWApMO3l6PDr8bG7bx
 mMGOH4O0wyZPkx+g=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsGl-00Aaei-PV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:41 +0000
Received: by mail-pg1-f172.google.com with SMTP id b196so327877pga.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=9AhdqT0NnU3T2Py6z8gOWa0P0fDVhbOVg/CkZAFmw8w=;
 b=qqKY9adEs9TgtJmoU7MkA9KxJfs/ZTmfIPOpeAs+A4H8hVlDwQBSv2Jq3kNi9lgE6S
 8sJ+rYnWCFvuUeYVIPMMc2exsm8WDRdpvjl5fwAEJA+hLvjFfZAtjhOJ0rUOJchnBc56
 yhvalmUSmzK+izTbVuCqRNjA9nDlcTXylDL3VZlcV3KVFQb7Jua/oZo7BYKQbAaqTLSA
 0nn5TAj8h81O2WRfodLf6sJyeFFan770SoHigA/s/3I6JiZR3jJOqLuh3a2ws+xWJr7A
 6uzZs0H1SnSL3lrVxw1n/ypvvcF4KXV5Qs7Kr5OM5r1RoP7UiydsApsG1GNd8TC+k7RW
 PKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=9AhdqT0NnU3T2Py6z8gOWa0P0fDVhbOVg/CkZAFmw8w=;
 b=ZAf9oj2VO4tnAXiwUOAmEqq2xzALGfM96LQXsERoUWeDCRQTBFeTlzhRHeEw/bV+h8
 Q7Gr2z2NaRooOtgPzUVnz30eJDN8eRqc1FRHMQdFSYR5a9R0AQNs9t+d+fcqHhTS+2+S
 LmH3E4MvERXPZSgwrJ7PWmmuXpu2s2Ol0b8fwZe6SsuEExzpmWQKyiob1cgcKqUHaV1D
 LcVwm6+lBGXwuhJwaFXNRgnQX8horOvXR3OHtesXfyFNkzgr0Kxl1gJm+7pKkZqKpzt9
 pjMZzXU6ijvjjDJIjvrCcIjgnxKHJBnTk5x1oM0rnsYIskIAAK5+AGbaPGBGxbymVniX
 VVMw==
X-Gm-Message-State: ACgBeo0vK4q46oJRr8rxVym6ygc3CQscKqkAggxlaiq8pX3mS853iSRr
 FXwAeCBJ0ixOebWN25ei69M=
X-Google-Smtp-Source: AA6agR4DbAW2WPj9nw69+I1LEgmTLkTdrd7+Xqwg+w+CQfOQH0TJG5g4HJoQPF72jeEeLW1NipGm9A==
X-Received: by 2002:a65:6d89:0:b0:421:94bc:cb89 with SMTP id
 bc9-20020a656d89000000b0042194bccb89mr27551314pgb.129.1662069754081; 
 Thu, 01 Sep 2022 15:02:34 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:33 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:15 -0700
Message-Id: <20220901220138.182896-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oTsGl-00Aaei-PV
Subject: [f2fs-dev] [PATCH 00/23] Convert to filemap_get_folios_tag()
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

F2fs and Ceph have quite alot of work to be done regarding folios, so
for now those patches only have the changes necessary for the removal of
find_get_pages_range_tag(), and only support folios of size 1 (which is
all they use right now anyways).

I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
beneficial. The page-writeback and filemap changes implicitly work. Testing
and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.

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

 fs/afs/write.c          | 114 +++++++++++++++++----------------
 fs/btrfs/extent_io.c    |  57 +++++++++--------
 fs/ceph/addr.c          | 138 ++++++++++++++++++++--------------------
 fs/cifs/file.c          |  33 +++++++++-
 fs/ext4/inode.c         |  55 ++++++++--------
 fs/f2fs/checkpoint.c    |  49 +++++++-------
 fs/f2fs/compress.c      |  13 ++--
 fs/f2fs/data.c          |  67 ++++++++++---------
 fs/f2fs/f2fs.h          |   5 +-
 fs/f2fs/node.c          |  72 +++++++++++----------
 fs/gfs2/aops.c          |  64 ++++++++++---------
 fs/nilfs2/btree.c       |  14 ++--
 fs/nilfs2/page.c        |  59 ++++++++---------
 fs/nilfs2/segment.c     |  44 +++++++------
 include/linux/pagemap.h |  32 +++++++---
 include/linux/pagevec.h |   8 ---
 mm/filemap.c            |  87 ++++++++++++-------------
 mm/page-writeback.c     |  44 +++++++------
 mm/swap.c               |  10 ---
 19 files changed, 506 insertions(+), 459 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
