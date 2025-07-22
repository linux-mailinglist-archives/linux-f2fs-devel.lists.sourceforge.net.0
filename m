Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7FB0D24B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 09:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCLZRVaK3cQw4EMi23N9//UiD5XwMS+Pr/LwoJWPNdU=; b=OdiQrzpZYx/LH/dt985KUE75yR
	DtkuzvPsO3VlaKxMB0cEXl/7wGtV26KB+KeWbA+9nAeJY8L45IU/LPx3CnuBD+5ZSIG8Zvpr5S6OG
	jx0dZzTiNs66xaev6fR0ZSa8fG2lWkdWAaTyYdabYrTd8CzuO6FmD21CUE9izkB0jsq8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue72q-0002Rn-Dm;
	Tue, 22 Jul 2025 07:04:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue72o-0002Rd-Uc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 07:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GvhWzHK56s0x7wxlKqGT27dfju8pGCPRMyakEeQm2A=; b=LSVCK10ZfQ+ZznQUPfM0+GgRuV
 FhnK9EGD4q8cjqjhRh3DtImHn70RdKvkxQKlKC1SmLZ0J/87wUqduoV5/tnalPtgzB4m3KrCrpDC/
 CqqwfIKLarLRSYbATh2TOH50qIVJanSZoWbipxVQ63P2j5FG04FwomNvQWlXyRP9L3wI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1GvhWzHK56s0x7wxlKqGT27dfju8pGCPRMyakEeQm2A=; b=LeP0Y6cAAt+V19a+fu/1tBmr/W
 +nZGbdn/dCvvAwx2n05lupUk1s1hnc6dligNxqBM4WubFXf2b125N1eZweuz3MLT6YO253UG2N4vt
 vLgnQR+/4Wh3rlKcIXKOc0b0Ycc7fpZI9Gm6TwlWzBIFVwlVMWjp9AMce/WWy60NFffs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue72o-0005xn-BV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 07:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BECCEA54E6F;
 Tue, 22 Jul 2025 07:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6961DC4CEEB;
 Tue, 22 Jul 2025 07:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753167839;
 bh=RwuUUccb7YpNHlSPaRHjzG4BikJ+g6lkoEfmnwIPQ54=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=neymryGd1ALrq/OuET2PLEfWD14D+6w28v55Gj6Fw8bL92E6D69KX/yYKPXSjIPxZ
 FegM5pJQkFUQDQWH2w4k/VQHWJusHA/yvGqPNNV8WY6nDaPx233tz0An+BZFaWLXmg
 ahPldk75Ox4cG4BcKTcuh7DjBoNfMhYROBDbSoCYISxKGEhYH0rlLrPo/0b5zLqf1u
 mnyE16O1zrKXXl4Cs63ArTyEGzgK15AKF2LPeraMiUL9UfjGS7NK367YUT88TthwHG
 Xw3kLCBxtd1MVIoexsMbhl2f/+b1Eb+A6DyzS21MuMXnjqfHAjrlRv8+/KBq3sU4jQ
 I0NsEDepSVIbQ==
Message-ID: <e06767f1-4d91-4b6b-b083-d05fedaf0bb3@kernel.org>
Date: Tue, 22 Jul 2025 15:03:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, On 7/9/25 01:02, Matthew Wilcox (Oracle) wrote:
 > Some more folio conversions for f2fs. Again, I have checked these patches
 > build, but otherwise they are untested. There are three inline functions
 > [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ue72o-0005xn-BV
Subject: Re: [f2fs-dev] [PATCH 00/60] f2fs folio conversions for 6.17
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 7/9/25 01:02, Matthew Wilcox (Oracle) wrote:
> Some more folio conversions for f2fs.  Again, I have checked these patches
> build, but otherwise they are untested.  There are three inline functions
> in fscrypt that I change to take a const struct folio pointer instead
> of a mutable pointer that I don't think should cause any conflicts.
> 
> Matthew Wilcox (Oracle) (60):
>   f2fs: Pass a folio to recover_dentry()
>   f2fs: Pass a folio to recover_inode()
>   f2fs: Pass a folio to recover_quota_data()
>   f2fs: Pass a folio to f2fs_recover_inode_page()
>   f2fs: Pass a folio to sanity_check_extent_cache()
>   f2fs: Pass a folio to sanity_check_inode()
>   f2fs: Pass a folio to f2fs_sanity_check_inline_data()
>   f2fs: Pass a folio to inode_has_blocks()
>   f2fs: Pass a folio to F2FS_INODE()
>   f2fs: Pass a folio to ino_of_node()
>   f2fs: Pass a folio to nid_of_node()
>   f2fs: Pass a folio to is_recoverable_dnode()
>   f2fs: Pass a folio to set_dentry_mark()
>   f2fs: Pass a folio to set_fsync_mark()
>   f2fs: Pass a folio to set_mark()
>   f2fs: Pass a folio to f2fs_allocate_data_block()
>   f2fs: Pass a folio to f2fs_inode_chksum_set()
>   f2fs: Pass a folio to f2fs_enable_inode_chksum()
>   f2fs: Pass a folio to f2fs_inode_chksum()
>   f2fs: Pass a folio to fill_node_footer_blkaddr()
>   f2fs: Pass a folio to get_nid()
>   f2fs: Pass a folio to set_cold_node()
>   f2fs: Pass folios to copy_node_footer()
>   f2fs: Pass a folio to fill_node_footer()
>   f2fs: Pass a folio to cpver_of_node()
>   f2fs: Pass a folio to f2fs_recover_xattr_data()
>   f2fs: Pass a folio to is_fsync_dnode()
>   f2fs: Pass a folio to is_dent_dnode()
>   f2fs: Add fio->folio
>   f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
>   f2fs: Pass a folio to is_cold_node()
>   f2fs: Pass a folio to is_node()
>   f2fs: Pass a folio to IS_DNODE()
>   f2fs: Pass a folio to ofs_of_node()
>   f2fs: Pass a folio to get_dnode_base()
>   f2fs: Pass a folio to ADDRS_PER_PAGE()
>   f2fs: Pass a folio to IS_INODE()

All above patches in dev-test branch look good to me, please feel free
to add my reviewed-by tag.

I've checked below patches as well, but still have one question to confirm.

Thanks,

>   f2fs: Add folio counterparts to page_private_flags functions
>   f2fs: Use a folio in f2fs_is_cp_guaranteed()
>   f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
>   f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
>   f2fs: Pass a folio to f2fs_compress_write_end_io()
>   f2fs: Use a folio in f2fs_merge_page_bio()
>   f2fs: Use a bio in f2fs_submit_page_write()
>   f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
>   f2fs: Use a folio iterator in f2fs_handle_step_decompress()
>   f2fs: Pass a folio to f2fs_end_read_compressed_page()
>   f2fs: Use a folio iterator in f2fs_verify_bio()
>   f2fs: Pass a folio to f2fs_is_compressed_page()
>   f2fs: Convert get_next_nat_page() to get_next_nat_folio()
>   f2fs: Pass the nat_blk to __update_nat_bits()
>   f2fs: Pass a folio to F2FS_NODE()
>   f2fs: Pass a folio to f2fs_cache_compressed_page()
>   f2fs: Use a folio in f2fs_encrypted_get_link()
>   f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
>   f2fs: Remove clear_page_private_all()
>   f2fs: Remove use of page from f2fs_write_single_data_page()
>   f2fs: Pass a folio to f2fs_submit_merged_write_cond()
>   f2fs: Pass a folio to __has_merged_page()
>   f2fs: Remove F2FS_P_SB()
> 
>  fs/f2fs/checkpoint.c    |   8 +-
>  fs/f2fs/compress.c      |  44 +++++------
>  fs/f2fs/data.c          | 138 +++++++++++++++++-----------------
>  fs/f2fs/dir.c           |   4 +-
>  fs/f2fs/extent_cache.c  |   8 +-
>  fs/f2fs/f2fs.h          | 135 +++++++++++++++++----------------
>  fs/f2fs/file.c          |  28 +++----
>  fs/f2fs/gc.c            |  18 ++---
>  fs/f2fs/inline.c        |  20 ++---
>  fs/f2fs/inode.c         |  61 +++++++--------
>  fs/f2fs/namei.c         |  12 +--
>  fs/f2fs/node.c          | 162 ++++++++++++++++++++--------------------
>  fs/f2fs/node.h          |  75 ++++++++++---------
>  fs/f2fs/recovery.c      |  78 +++++++++----------
>  fs/f2fs/segment.c       |  27 ++++---
>  include/linux/f2fs_fs.h |   2 +-
>  include/linux/fscrypt.h |   7 +-
>  17 files changed, 414 insertions(+), 413 deletions(-)
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
