Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856560196E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfX-0008Np-2P;
	Mon, 17 Oct 2022 20:25:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfW-0008Ni-8E
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDF0HteevzYNLv2uN0Cib6K7paWLvmyKD/8WXFsjE5M=; b=OZij8LuqaffvXhfC3E+24aG2cL
 R8VgIMIRhpfZjtdO4yM4nYOlXxw4gduhdoVKN3d3m58Md17iRIvWrRym8Mkh44O9M0Xt+TYROq4wc
 HytoButFyjNV+oy0+22x2nhmxcRMFdL3BjLSJ2/fu0M3FEUhfHcAQ8Fy3SjfCUS0X1jg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GDF0HteevzYNLv2uN0Cib6K7paWLvmyKD/8WXFsjE5M=; b=L
 X2w8tSmDjrB2S2N5ukdybPRDPLcQaPOXvsM4MablMSbA2o6JtO2RCT9YE5wohyLTjm+naNoH0RqCE
 VNKVEWK446edWGy6Wzh5KiQyhUWBc6KB5aNRr8K8XQ6CFboYDWgksKgnRCdWNDv6p4ZkRfDDJ2H11
 zesOAe0ifGc2pdkk=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfU-007Li0-AX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:02 +0000
Received: by mail-pg1-f174.google.com with SMTP id s196so10158940pgs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GDF0HteevzYNLv2uN0Cib6K7paWLvmyKD/8WXFsjE5M=;
 b=aY4b63NZqQCKvU20ZoDK++qZhACS2e4aeBRsuuopLKG1Ytlt2bf9tD+JujcCPXLwaZ
 Sc/sT6V3+o3kVy28NBqwCDqZZrw6g9Fs5MQlfvUWn3V1lSG2rAI2su5+aaHC5Bk54jld
 mValP1FoKNSZ7hECNNOhR50m1PC55zjwk4nMgeoqCE9b0x+D0KWvwxgyobqS9JUMepUM
 zoylWXqCOD4Erjg4B4JH20iK300YiMzqbUBmkV8B6s3BWy8zw1Q4HVQBjXeu7RvRa4oK
 JxMpnpHEjCRLimm43OE5MLtZsYG5G/gI4dWGzotWFSr9mYgloWVKNp5Nq+BYtExGElaC
 bqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GDF0HteevzYNLv2uN0Cib6K7paWLvmyKD/8WXFsjE5M=;
 b=5g3voDXmCUrr+I3nMjqB/Hx7HE/V6K51unaDzOIh7H99PnREKWV8tIznI6bTiJ5Dcm
 p8qwuCm8oxp07rf+mp7CEb5nf8C3w+2kdIq5/5AGkgnIg6+Df+0JBFPdXNGb9mlUZtsa
 5eCGF+xkhh6WoJxvo8az5HFh16Cj+YanwwlsmQ6n8ZYZnOUs/YF/Tz6kyIpfjFIC1aI0
 RZlwcb7n05Yx+9lgFN4ydSIlWsKzBKBknDbVmpvbMS1Rtmumywn4QTAheKAnuCFzg6H4
 wx81fkXJbACHocCDyKHhva+ZFQzOsq9CQvINJULqachC9umlwmXU7kJR0lmg5Edb0OWI
 ZwLg==
X-Gm-Message-State: ACrzQf0Vi4H+xlq8dl1/fNpHO1DJI7WfVc56DhGODirxIV1jFadsOh6Q
 Us1CPa30QJQPLSjd8s7+ORg=
X-Google-Smtp-Source: AMsMyM5ZBQ4ulLEerblhN4dY+KgGrViyV8tdaDAbkTMfDdZ5KC19A4m0FrTCeDWfYdUkGvRrnROusw==
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr14608634pfh.60.1666038294629; 
 Mon, 17 Oct 2022 13:24:54 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:24:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:28 -0700
Message-Id: <20221017202451.4951-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfU-007Li0-AX
Subject: [f2fs-dev] [PATCH v3 00/23] Convert to filemap_get_folios_tag()
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

---
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

 fs/afs/write.c          | 114 +++++++++++++++++++++-------------------
 fs/btrfs/extent_io.c    |  57 ++++++++++----------
 fs/ceph/addr.c          |  58 ++++++++++----------
 fs/cifs/file.c          |  33 ++++++++++--
 fs/ext4/inode.c         |  55 ++++++++++---------
 fs/f2fs/checkpoint.c    |  49 +++++++++--------
 fs/f2fs/compress.c      |  13 ++---
 fs/f2fs/data.c          |  69 +++++++++++++-----------
 fs/f2fs/f2fs.h          |   5 +-
 fs/f2fs/node.c          |  72 +++++++++++++------------
 fs/gfs2/aops.c          |  64 ++++++++++++----------
 fs/nilfs2/btree.c       |  14 ++---
 fs/nilfs2/page.c        |  59 +++++++++++----------
 fs/nilfs2/segment.c     |  44 ++++++++--------
 include/linux/pagemap.h |  32 +++++++----
 include/linux/pagevec.h |   8 ---
 mm/filemap.c            |  87 +++++++++++++++---------------
 mm/page-writeback.c     |  44 ++++++++--------
 mm/swap.c               |  10 ----
 19 files changed, 467 insertions(+), 420 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
