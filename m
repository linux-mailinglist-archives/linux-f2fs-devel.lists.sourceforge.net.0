Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51107A8A7C5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 21:23:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4ls2-0008T3-I0;
	Tue, 15 Apr 2025 19:22:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1u4lrk-0008Sh-Ei
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 19:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6/R8PWSj+JeYYevhBNROTD8BXddlMI+lZwpkt8w2Hw=; b=a0kjn13Rx7peJpEcE6yniiMH32
 BTY8AFQFytcIZ2UpnjzKU2qpgLMKnzahkceG09ur5UwWqJUbUL+SOA0LzwIK67oOxXRMmoctJ57QZ
 vSteeHyDgWMtjTa5R/3h8U1lzNjfGPpOdG7e9NvmiuQsBhr2PCIWwpAQNIX5C0+jp+Zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6/R8PWSj+JeYYevhBNROTD8BXddlMI+lZwpkt8w2Hw=; b=AGwbuFt216oRdCfeCPpeT7lgDI
 yeY7aPMnCnXjNTddjCULx2+Wlgpu66N6kR1wCGjmcJy1Vd7N6lE6C/E2m49drLzYxi20p9KQmc9xc
 7BSEZwsB44pyfFW5sog2Nj2ApmOhgXTxpVbyQMvsZb82Rvaz9hphAW3SkEDSjnAEdOMw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4lrU-0000UC-1Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 19:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 70FD144B37;
 Tue, 15 Apr 2025 19:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E2CC4CEE7;
 Tue, 15 Apr 2025 19:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744744938;
 bh=dXXLb/kaVtkytG1+E0135+QUbY+Nr5HEwoja25FzASQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoQgMMN8+F8O9nzKtIvR/cF+u9NmFGyb0wwWh7bJnpyQqcK6LXlgqGB1Z62gJHcx5
 8HkaSZQJG1TIniU9/A4eD9wXI8XwrpAeBrQWM3++PZ1zEVr68svxjuYAelwkFgeQJT
 4EnvlanTGgEr5Ih20dsqMypVPDghBg3cJmYT7ihG0q5MBpI2KKje0JJdCEr7OS9AXa
 TM8w528O1eNYJbVHI6sOilE8621kIv2maWQuH3x2rUSD/1k3K2dAeB6hUkDDrwtMMR
 RZt2YDkwnqao7RVkKak1Ds9hOJiHOeVEDgQOr9oXeQDBCydesSw2tV6nipyQqsw93B
 SDv3PokL98Iiw==
Date: Tue, 15 Apr 2025 19:22:16 +0000
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <Z_6x6A_CEVDnleEo@google.com>
References: <20250331201256.1057782-1-willy@infradead.org>
 <20250331201256.1057782-4-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331201256.1057782-4-willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Matthew, I had to apply this in this patch, since fio can
 be reassigned after checking fio->in_list check. --- a/fs/f2fs/data.c +++
 b/fs/f2fs/data.c @@ -946,7 +946,6 @@ static bool is_end_zone_blkaddr(struct
 f2fs_sb_info *sbi, block_t blkaddr) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4lrU-0000UC-1Y
Subject: Re: [f2fs-dev] [PATCH 003/153] f2fs: Introduce fio_inode()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Matthew,

I had to apply this in this patch, since fio can be reassigned after
checking fio->in_list check.

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -946,7 +946,6 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)

 void f2fs_submit_page_write(struct f2fs_io_info *fio)
 {
-       struct inode *inode = fio_inode(fio);
        struct f2fs_sb_info *sbi = fio->sbi;
        enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
        struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
@@ -996,13 +995,13 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
        if (io->bio &&
            (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
                              fio->new_blkaddr) ||
-            !f2fs_crypt_mergeable_bio(io->bio, inode,
+            !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
                                page_folio(bio_page)->index, fio)))
                __submit_merged_bio(io);
 alloc_new:
        if (io->bio == NULL) {
                io->bio = __bio_alloc(fio, BIO_MAX_VECS);
-               f2fs_set_bio_crypt_ctx(io->bio, inode,
+               f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
                                page_folio(bio_page)->index, fio, GFP_NOIO);
                io->fio = *fio;
        }

On 03/31, Matthew Wilcox (Oracle) wrote:
> This helper returns the inode associated with the f2fs_io_info.  That's a
> relatively common thing to want, mildly awkward to get and provides one
> place to change if we decide to record it directly, or change fio->page
> to fio->folio.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/data.c    | 9 +++++----
>  fs/f2fs/f2fs.h    | 5 +++++
>  fs/f2fs/segment.c | 6 +++---
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 54f89f0ee69b..597d1e82cb55 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -946,6 +946,7 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
>  
>  void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  {
> +	struct inode *inode = fio_inode(fio);
>  	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
>  	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
> @@ -995,13 +996,13 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	if (io->bio &&
>  	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>  			      fio->new_blkaddr) ||
> -	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
> +	     !f2fs_crypt_mergeable_bio(io->bio, inode,
>  				page_folio(bio_page)->index, fio)))
>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
>  		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
> -		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
> +		f2fs_set_bio_crypt_ctx(io->bio, inode,
>  				page_folio(bio_page)->index, fio, GFP_NOIO);
>  		io->fio = *fio;
>  	}
> @@ -2501,7 +2502,7 @@ static void f2fs_readahead(struct readahead_control *rac)
>  
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  {
> -	struct inode *inode = fio->page->mapping->host;
> +	struct inode *inode = fio_inode(fio);
>  	struct page *mpage, *page;
>  	gfp_t gfp_flags = GFP_NOFS;
>  
> @@ -2631,7 +2632,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  
>  static inline bool need_inplace_update(struct f2fs_io_info *fio)
>  {
> -	struct inode *inode = fio->page->mapping->host;
> +	struct inode *inode = fio_inode(fio);
>  
>  	if (f2fs_should_update_outplace(inode, fio))
>  		return false;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f1576dc6ec67..c37092e82354 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3858,6 +3858,11 @@ unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>  unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
>  			unsigned int segno);
>  
> +static inline struct inode *fio_inode(struct f2fs_io_info *fio)
> +{
> +	return page_folio(fio->page)->mapping->host;
> +}
> +
>  #define DEF_FRAGMENT_SIZE	4
>  #define MIN_FRAGMENT_SIZE	1
>  #define MAX_FRAGMENT_SIZE	512
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 396ef71f41e3..d2f2f68da098 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3584,7 +3584,7 @@ static int __get_segment_type_2(struct f2fs_io_info *fio)
>  static int __get_segment_type_4(struct f2fs_io_info *fio)
>  {
>  	if (fio->type == DATA) {
> -		struct inode *inode = fio->page->mapping->host;
> +		struct inode *inode = fio_inode(fio);
>  
>  		if (S_ISDIR(inode->i_mode))
>  			return CURSEG_HOT_DATA;
> @@ -3618,7 +3618,7 @@ static int __get_age_segment_type(struct inode *inode, pgoff_t pgofs)
>  static int __get_segment_type_6(struct f2fs_io_info *fio)
>  {
>  	if (fio->type == DATA) {
> -		struct inode *inode = fio->page->mapping->host;
> +		struct inode *inode = fio_inode(fio);
>  		int type;
>  
>  		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
> @@ -4023,7 +4023,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>  	if (!err) {
>  		f2fs_update_device_state(fio->sbi, fio->ino,
>  						fio->new_blkaddr, 1);
> -		f2fs_update_iostat(fio->sbi, fio->page->mapping->host,
> +		f2fs_update_iostat(fio->sbi, fio_inode(fio),
>  						fio->io_type, F2FS_BLKSIZE);
>  	}
>  
> -- 
> 2.47.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
