Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C861D53FDA0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 13:37:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyXWc-0000hf-IV; Tue, 07 Jun 2022 11:37:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1nyXWb-0000hO-HM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 11:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MShwiZglejBMTt37kzCHsuHsQj3zgKLlrjk4RGlH5NU=; b=bg97+WVZ0cZ/O4JJHz0AFdaMMx
 IbLP2l3e5h/Q8uToZAb8eRvqLmMKzCra3UcBJaEyTR76wbOdz5jZ6ObCwmuEdWaFlHJn9w7F/LNy4
 x8yExlx9ZwWEhJrwmObHGZeo/7brleCF9Wr6G7TS1QzYwIsP7DKj4Lh6KLn++DlYVwGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MShwiZglejBMTt37kzCHsuHsQj3zgKLlrjk4RGlH5NU=; b=lNS2ubzyPmJNH+uq7D2eMjbtyV
 3KSMeDFRcMnt5kuIEl3tpC/UdeWhRMjtRz10Y1zKWxDQKQic+FX0jNDseorP1CVwcdKehl0bxtL/x
 MauM5o2I/22aH9GrINJI9foSYh+4eNMjHjVmbvm3gGoXarGaVYa+kmGnzyqM+GTu/C5Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyXWZ-00065i-ES
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 11:37:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4713616B0;
 Tue,  7 Jun 2022 11:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4A4C385A5;
 Tue,  7 Jun 2022 11:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654601841;
 bh=8ssLmPCQc0kBEOnMpM83QxMMmjw3G4wZmE/Q52LHRZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ulrnZ3VWWAYqxXyKMLlRANtahVN2YqNjS+95EKiyA31F59Kxv56ZxZvJeFNL2v8u2
 HARW/OKmP9vrlxSdZNnaH3ij+7H8UlnfzOCQ1oxjz9vjsiisWeP8YGHgOUWaKE3RXJ
 0Qgq8LuNiEDX/vIkZ2FV2oYFDoYmwavNlOFsB8uPO+joCcntqxsuAWdrO2LcLkXq03
 5jcBhpDEojRYyn7qDO7vem729Q325Cpl+yLlRoju9/CWrk0f33UnA9Hak8u2vJNDYY
 93upScTvvcZE6v6bgLLYedRNMRE70uLsyv1JUV94v403BBEPVF5OmKnH6DlbYWYvUg
 /f4lOE8iShQ3Q==
Date: Tue, 7 Jun 2022 13:37:16 +0200
From: Christian Brauner <brauner@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20220607113716.aec2o7onzu3re2o4@wittgenstein>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jun 05, 2022 at 08:38:44PM +0100,
 Matthew Wilcox wrote:
 > This patch series removes find_get_pages_range(), pagevec_lookup() > and
 pagevec_lookup_range(), converting all callers to use the new [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nyXWZ-00065i-ES
Subject: Re: [f2fs-dev] [PATCH 00/10] Convert to filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 05, 2022 at 08:38:44PM +0100, Matthew Wilcox wrote:
> This patch series removes find_get_pages_range(), pagevec_lookup()
> and pagevec_lookup_range(), converting all callers to use the new
> filemap_get_folios().  I've only run xfstests over ext4 ... some other
> testing might be appropriate.
> 
> Matthew Wilcox (Oracle) (10):
>   filemap: Add filemap_get_folios()
>   buffer: Convert clean_bdev_aliases() to use filemap_get_folios()
>   ext4: Convert mpage_release_unused_pages() to use filemap_get_folios()
>   ext4: Convert mpage_map_and_submit_buffers() to use
>     filemap_get_folios()
>   f2fs: Convert f2fs_invalidate_compress_pages() to use
>     filemap_get_folios()
>   hugetlbfs: Convert remove_inode_hugepages() to use
>     filemap_get_folios()
>   nilfs2: Convert nilfs_copy_back_pages() to use filemap_get_folios()
>   vmscan: Add check_move_unevictable_folios()
>   shmem: Convert shmem_unlock_mapping() to use filemap_get_folios()
>   filemap: Remove find_get_pages_range() and associated functions
> 
>  fs/buffer.c             | 26 +++++++--------
>  fs/ext4/inode.c         | 40 ++++++++++++-----------
>  fs/f2fs/compress.c      | 35 +++++++++-----------
>  fs/hugetlbfs/inode.c    | 44 ++++++++-----------------
>  fs/nilfs2/page.c        | 60 +++++++++++++++++-----------------
>  include/linux/pagemap.h |  5 ++-
>  include/linux/pagevec.h | 10 ------
>  include/linux/swap.h    |  3 +-
>  mm/filemap.c            | 72 +++++++++++++++++------------------------
>  mm/shmem.c              | 13 ++++----
>  mm/swap.c               | 29 -----------------
>  mm/vmscan.c             | 55 ++++++++++++++++++-------------
>  12 files changed, 166 insertions(+), 226 deletions(-)

The conversion seems fairly straightforward, so looks good to me.
Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
