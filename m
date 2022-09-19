Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8FE5BD3CF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 19:35:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaKfS-0004P4-5D;
	Mon, 19 Sep 2022 17:35:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oaKfR-0004Oy-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 17:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=; b=EwwMiG5PjSTeKOH5d9naUs5g66
 l3bveJ7p3lgQ0enP6oG29vgEHOv99K/9chzocLDVmJxnXrvSxu72CkyfXJTy4jPNOxoeww69PEgb8
 5wUA1SuGC6nd7lZrHvfmZ0Hop9G39azrdxglK+Lqlomijv8Mm1x0/b9/whZeUkOyCBIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=; b=fFJxRDarQLoVBNwpD8gux6q6ce
 lIUkLUvo1ocnCkLh3P2gM1E9tDx9orwNOlAkQfhq5kO5kZKzIaGRHVr+izr8OJIdWqjLMs2HyZ1NC
 QH/V5KTepUJyNs3FuikF92UVdmDssvVlGuhjkoXxv8OiQHbykqiBXsyINjpXLQQCVQg4=;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oaKfZ-00DarD-Oy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 17:35:02 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 cm7-20020a056830650700b006587fe87d1aso18234otb.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=;
 b=RSsN1QZHs/TmzsGp1gwypXdKb/ST8jjoxnGgjyJpGV7sq5aaYponooE63RtJDRuoFk
 4VXjc4NPaG7MQomjEcSt+y7p4ZVGuVPclZGjlL/vQiCR0Me8vanyEOYot/zi8Qsubu9j
 Ix69jBgynF7tCkr+xxKol7c7kNhnVS8KJgxgKk0lyolCfmfJb+3zoq8Vz25NtkyW/5RJ
 p2+8AeVSPil9bJICaFxtsaSaqUw5Kt5tKUWnYm/Zm3aB+7O1VaahZGVySmK2tZf55QM0
 YghzgAsvx0sqLEfTTQQuMHFJo6+U/klj2pt5kixy16lXa6EmRGn5eHCZGXkCezFh7SPi
 kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=;
 b=Q21jgihoXZNqRPy+Hi9cxSthLTEHXX69G/1GTkt38vxz7FdJr13wGGWoi5bhrln7sm
 r5M0oFaDVBt54cURQHN+TpjjzyqXfo24Vxbt+wn2gl991EhQ9/1zPBYuG8Qgm7QeGYHr
 2SBlZEkJiWATGkAhaNNKnK9gDvS95hMtPVofv+7mw2r8HdlvkHHcMGxcE4kblBcEvDdo
 yhZBYPr5WO5AuOczmZ8NmmmA96TauTEmGcM01y1mBHs/KeRzTEh7qCmcUq7kJ5vmI0To
 rTeDIV3iXnMTT/WRWNkVFLySBPni18J/qVjDqDTGw1KsCS4Htv5vQ9q12gDNqakXlsLj
 uXmA==
X-Gm-Message-State: ACrzQf2iTMv6zs68LN4G5DIAM71Ah9dA0tlv4jBjcGYok4IDEVr0O9Om
 6bmbwu1CktLkTQAiAlR6V+dvTwcmQIZTm+6zWaUmIZcOPA5wJw==
X-Google-Smtp-Source: AMsMyM5sQYgUol/jmTSw3stKiJsYQ02a9vmJcS7x25EvIWll4MwqWjrE0KfujNT4rW/qZrnmuFrh2hzLLcoYzG7yGfA=
X-Received: by 2002:a05:6830:d8c:b0:639:6034:b3d7 with SMTP id
 bv12-20020a0568300d8c00b006396034b3d7mr8692869otb.125.1663608892048; Mon, 19
 Sep 2022 10:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 19 Sep 2022 10:34:40 -0700
Message-ID: <CAOzc2pznw0qp3xVm98-TdU=JBVxintYN1Q4Ci9qTQkBYRxi9QQ@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 12, 2022 at 11:25 AM Vishal Moola (Oracle) wrote:
 > > This patch series replaces find_get_pages_range_tag() with >
 filemap_get_folios_tag().
 This also allows the removal of multiple > ca [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.46 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oaKfZ-00DarD-Oy
Subject: Re: [f2fs-dev] [PATCH v2 00/23] Convert to filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 12, 2022 at 11:25 AM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
>
> F2fs and Ceph have quite alot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
>
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial. The page-writeback and filemap changes implicitly work. Testing
> and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
> ---
> v2:
>   Got Acked-By tags for nilfs and btrfs changes
>   Fixed an error arising in f2fs
>   - Reported-by: kernel test robot <lkp@intel.com>
>
> Vishal Moola (Oracle) (23):
>   pagemap: Add filemap_grab_folio()
>   filemap: Added filemap_get_folios_tag()
>   filemap: Convert __filemap_fdatawait_range() to use
>     filemap_get_folios_tag()
>   page-writeback: Convert write_cache_pages() to use
>     filemap_get_folios_tag()
>   afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
>   btrfs: Convert btree_write_cache_pages() to use
>     filemap_get_folio_tag()
>   btrfs: Convert extent_write_cache_pages() to use
>     filemap_get_folios_tag()
>   ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
>   cifs: Convert wdata_alloc_and_fillpages() to use
>     filemap_get_folios_tag()
>   ext4: Convert mpage_prepare_extent_to_map() to use
>     filemap_get_folios_tag()
>   f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
>   f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
>   gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
>   nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_copy_dirty_pages() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_clear_dirty_pages() to use
>     filemap_get_folios_tag()
>   filemap: Remove find_get_pages_range_tag()
>
>  fs/afs/write.c          | 114 +++++++++++++++++----------------
>  fs/btrfs/extent_io.c    |  57 +++++++++--------
>  fs/ceph/addr.c          | 138 ++++++++++++++++++++--------------------
>  fs/cifs/file.c          |  33 +++++++++-
>  fs/ext4/inode.c         |  55 ++++++++--------
>  fs/f2fs/checkpoint.c    |  49 +++++++-------
>  fs/f2fs/compress.c      |  13 ++--
>  fs/f2fs/data.c          |  69 ++++++++++----------
>  fs/f2fs/f2fs.h          |   5 +-
>  fs/f2fs/node.c          |  72 +++++++++++----------
>  fs/gfs2/aops.c          |  64 ++++++++++---------
>  fs/nilfs2/btree.c       |  14 ++--
>  fs/nilfs2/page.c        |  59 ++++++++---------
>  fs/nilfs2/segment.c     |  44 +++++++------
>  include/linux/pagemap.h |  32 +++++++---
>  include/linux/pagevec.h |   8 ---
>  mm/filemap.c            |  87 ++++++++++++-------------
>  mm/page-writeback.c     |  44 +++++++------
>  mm/swap.c               |  10 ---
>  19 files changed, 507 insertions(+), 460 deletions(-)
>
> --
> 2.36.1
>

Just following up on these patches. Many of the changes still need review.
If anyone has time this week to look over any of the affected areas (pagecache,
afs, ceph, ciph, ext4, f2fs, or gfs) feedback would be much appreciated.

Also, Thanks to David for looking at btrfs and Ryusuke for looking at
nilfs already.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
