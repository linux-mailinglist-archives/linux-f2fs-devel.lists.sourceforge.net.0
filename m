Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FEAFF215
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 21:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toSr4JqJ75a0n/FhUldIGJSQIMIZy20j7eQE0q7RxRI=; b=QAxQ1UN9GjPxN1CGDxJoDZiuCh
	gBOREU05hM1xdjS3FlgFel3dkxXHsziUfc30+42cXGeeC+BNAwjIcNZxhq2IKcrQEFtHKIMbTIj64
	4yf2rKdxVDgHKxbPwTcBwBmZ8VS2s9OIrf+P6QA9t4CY9xsHOhsR5vPNu1ebuYfq3SUI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZatv-0007OE-87;
	Wed, 09 Jul 2025 19:56:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uZatt-0007O8-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 19:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tm2JERLFmtqQrc3klzwRk/6jSvQ1n0QchekW4e9kDOM=; b=fulIQSEQTGavfuUmIyOxi8tBrH
 tKr+K9HDDAXDk4OB+O3ftALeFHJVf9EP54aEprTDSDJ+miAVN7F4NDKn7cQ+n7udv30RxfGQgjmIG
 2BuHKtegwRcM33yt1brfVyrZhD1kXQIH7eYyiegtVf5N/1GmlotnyAPjDzcftp9iRVtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tm2JERLFmtqQrc3klzwRk/6jSvQ1n0QchekW4e9kDOM=; b=TVGZU+f7OnX4FepmpIKmFQoTtb
 D0f/P01dyEuIyC3Es1CvtvZVZmOXS9sC2v5oTb7BK6nRri1OJKweay30pFTngjCrAXQKDPm/IdglB
 CinenvUtpG1WTsgRMpZBUAvNkvNIxXgPReoA4FslDJnVILkm4wWC7N3QIDxntXIBePMg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZats-0006fJ-Us for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 19:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 942755C0F30;
 Wed,  9 Jul 2025 19:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222F3C4CEEF;
 Wed,  9 Jul 2025 19:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752090971;
 bh=/gn8qopDrWfVm8AsaR6eGM082Krjx26hGKVvTCRNP3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OirqCSXnB0gRgiE8934+PbTRy6SsxYSX5TbGyKW2vodAYfIlg923fdqnjOOlEIe7p
 ugKKWimnFUrSBS1O+PbbhgvR7VzKBXbSxxbiPPJ/wfvz5WeEMAd4/FLe68QOw4j+lI
 27vfhHJUXYHDFl33crnmBASXwe1kSj0OYw62v8fkddsZ0/CkeBh0KSKeuRE4JKUkcl
 1gJ/QOfHROEccZhDRj74cctrPdpYYpJYOHIJEZLGaACu6I4lbwvYSzUitLJq4r4lXX
 CSUfsArO3YCk5ip3Mr6/nGmH2wss+0+4OJvAHIhQBfp8udCEfdtXFvt8f3eb30d4Nl
 nx5LmQ7qCLyGg==
Date: Wed, 9 Jul 2025 19:56:09 +0000
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <aG7JWf8pzdRankdb@google.com>
References: <20250708170359.111653-1-willy@infradead.org>
 <20250708170359.111653-12-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708170359.111653-12-willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Queued with this for testing. --- a/fs/f2fs/recovery.c +++
 b/fs/f2fs/recovery.c @@ -767,7 +767,7 @@ static int do_recover_data(struct
 f2fs_sb_info *sbi, struct inode *inode, out: f2fs_notice(sbi, "recover_data:
 ino = %lx, nid = %x [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZats-0006fJ-Us
Subject: Re: [f2fs-dev] [PATCH 11/60] f2fs: Pass a folio to nid_of_node()
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

Queued with this for testing.

--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -767,7 +767,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 out:
        f2fs_notice(sbi, "recover_data: ino = %lx, nid = %x (i_size: %s), "
                    "range (%u, %u), recovered = %d, err = %d",
-                   inode->i_ino, nid_of_node(&folio->page),
+                   inode->i_ino, nid_of_node(folio),
                    file_keep_isize(inode) ? "keep" : "recover",
                    start, end, recovered, err);
        return err;


On 07/08, Matthew Wilcox (Oracle) wrote:
> All callers have a folio so pass it in.  Also make the argument const
> as the function does not modify it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/data.c  | 2 +-
>  fs/f2fs/inode.c | 4 ++--
>  fs/f2fs/node.c  | 6 +++---
>  fs/f2fs/node.h  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index b023d15b4555..5fc3d985c4e3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -355,7 +355,7 @@ static void f2fs_write_end_io(struct bio *bio)
>  		}
>  
>  		f2fs_bug_on(sbi, is_node_folio(folio) &&
> -				folio->index != nid_of_node(&folio->page));
> +				folio->index != nid_of_node(folio));
>  
>  		dec_page_count(sbi, type);
>  		if (f2fs_in_warm_node_list(sbi, folio))
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index eedc56a3561b..db4ccde3737a 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -280,10 +280,10 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>  		return false;
>  	}
>  
> -	if (ino_of_node(node_folio) != nid_of_node(&node_folio->page)) {
> +	if (ino_of_node(node_folio) != nid_of_node(node_folio)) {
>  		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
>  			  __func__, inode->i_ino,
> -			  ino_of_node(node_folio), nid_of_node(&node_folio->page));
> +			  ino_of_node(node_folio), nid_of_node(node_folio));
>  		return false;
>  	}
>  
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index fabcb3fa47cd..26d3bc7597d9 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1477,14 +1477,14 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
>  {
>  	struct page *page = &folio->page;
>  
> -	if (unlikely(nid != nid_of_node(page) ||
> +	if (unlikely(nid != nid_of_node(folio) ||
>  		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
>  		(ntype == NODE_TYPE_XATTR &&
>  		!f2fs_has_xattr_block(ofs_of_node(page))) ||
>  		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
>  		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
>  			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
> -			  ntype, nid, nid_of_node(page), ino_of_node(folio),
> +			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
>  			  ofs_of_node(page), cpver_of_node(page),
>  			  next_blkaddr_of_node(folio));
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> @@ -1706,7 +1706,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>  		goto redirty_out;
>  
>  	/* get old block addr of this node page */
> -	nid = nid_of_node(&folio->page);
> +	nid = nid_of_node(folio);
>  	f2fs_bug_on(sbi, folio->index != nid);
>  
>  	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index 6c4fc3449a68..c03cc1fdd136 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -249,9 +249,9 @@ static inline nid_t ino_of_node(const struct folio *node_folio)
>  	return le32_to_cpu(rn->footer.ino);
>  }
>  
> -static inline nid_t nid_of_node(struct page *node_page)
> +static inline nid_t nid_of_node(const struct folio *node_folio)
>  {
> -	struct f2fs_node *rn = F2FS_NODE(node_page);
> +	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
>  	return le32_to_cpu(rn->footer.nid);
>  }
>  
> -- 
> 2.47.2
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
