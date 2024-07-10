Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383C92DC8D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 01:20:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRgc7-0006zV-46;
	Wed, 10 Jul 2024 23:20:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sRgc6-0006zO-5b
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmHx4aRzfWasJ1wAQmoeXygqsomUMFdfXnC8C8H1tu4=; b=IWph18zerCzMA3U5YuET71frIz
 ysmGFsUESehLf2dLbkIYod6s/nq/H4Xf7C91iUn0lyw9TWPRQhqDYWUBE1sIR+EUHWcoMI9bzOPm/
 nGb5LWnpfDPPtJx6udzwFbNNG4uy0/Ss7T3C3gE/ahw2f1BLsUzNSBAcrPxZmZYkRdls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NmHx4aRzfWasJ1wAQmoeXygqsomUMFdfXnC8C8H1tu4=; b=GfOG8l+6jhYgrqzeNRufo0XqsF
 duMKIPULnfCa96cgxuFq+QfqFXodJrNjrC3Ct40YYeYQX3CF7CgC2rG01TJiCoMmmCqrpn+fNrgfo
 f2cuqBbR6CtEYZePPqdyJfmn3K8beO8rGIz6ruwWx42w58ie8zR+mpfcch+C9r1GA8mI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRgc7-0004rW-2e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0C94CE0BBD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2024 23:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12E8C32781;
 Wed, 10 Jul 2024 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720653634;
 bh=mTIEDdU6SbNAcW1BkWd2VaA6n34Y1oK9yy9f00SXVnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iY5wCLlbOENi6J6y4MEK/XrrY2d7L9WF7bpMK0tMFisNVrlwK0OppQ9DwrEcX/Q13
 OpVSFLGZbBnC140EJhvgU1rl2H2YAQQEG/PMXcWjbV3cnr5wwnfICL2w4eumMqH9Dz
 HMybcdfj/xMFk+WAioy+Wv6NxWcsZYHF99WSfQfm7/N215wTFr7FQtJZeI10FoMm8U
 qj9fft6Wcla49zDXjt2V/eZRce5wL5nZhEI+TjhIGZ+6f4xD9FgbTSRHG47q5CIdil
 nVfA4cwLSzYqY2FWxZ3QCtMs4xsJnCS9qJangnGBMDXQWntr+5BaKyocZ1YEs40U/V
 vM77v/4SwtanA==
Date: Wed, 10 Jul 2024 23:20:32 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Zo8XQAACHaGrwYVN@google.com>
References: <20240625031604.3587691-1-chao@kernel.org>
 <20240625031604.3587691-3-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625031604.3587691-3-chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/25,
 Chao Yu wrote: > Introudce a new help get_dnode_base()
 to wrap common code from > get_dnode_addr() and data_blkaddr() for cleanup.
 > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > fs/f2f [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRgc7-0004rW-2e
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: clean up data_blkaddr() and
 get_dnode_addr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/25, Chao Yu wrote:
> Introudce a new help get_dnode_base() to wrap common code from
> get_dnode_addr() and data_blkaddr() for cleanup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 46 +++++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1f78a39fe7f4..eacf0b0e6b2e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2905,26 +2905,31 @@ static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
>  }
>  
>  static inline int f2fs_has_extra_attr(struct inode *inode);
> -static inline block_t data_blkaddr(struct inode *inode,
> -			struct page *node_page, unsigned int offset)
> +static inline int get_extra_isize(struct inode *inode);

It seems get_extra_isize was already declared above?

> +static inline unsigned int get_dnode_base(struct inode *inode,
> +					struct page *node_page)
>  {
> -	struct f2fs_node *raw_node;
> -	__le32 *addr_array;
> -	int base = 0;
> -	bool is_inode = IS_INODE(node_page);
> -
> -	raw_node = F2FS_NODE(node_page);
> -
> -	if (is_inode) {
> +	if (IS_INODE(node_page)) {
>  		if (!inode)
>  			/* from GC path only */
> -			base = offset_in_addr(&raw_node->i);
> +			return offset_in_addr(&F2FS_NODE(node_page)->i);
>  		else if (f2fs_has_extra_attr(inode))
> -			base = get_extra_isize(inode);
> +			return get_extra_isize(inode);

	if (!IS_INODE(node_page))
		return 0;

	return inode ? get_extra_isize(inode) :
		offset_in_addr();

>  	}
> +	return 0;
> +}
>  
> -	addr_array = blkaddr_in_node(raw_node);
> -	return le32_to_cpu(addr_array[base + offset]);
> +static inline __le32 *get_dnode_addr(struct inode *inode,
> +					struct page *node_page)
> +{
> +	return blkaddr_in_node(F2FS_NODE(node_page)) +
> +			get_dnode_base(inode, node_page);
> +}
> +
> +static inline block_t data_blkaddr(struct inode *inode,
> +			struct page *node_page, unsigned int offset)
> +{
> +	return le32_to_cpu(*(get_dnode_addr(inode, node_page) + offset));
>  }
>  
>  static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
> @@ -3297,8 +3302,6 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
>  	return is_inode_flag_set(inode, FI_COW_FILE);
>  }
>  
> -static inline __le32 *get_dnode_addr(struct inode *inode,
> -					struct page *node_page);
>  static inline void *inline_data_addr(struct inode *inode, struct page *page)
>  {
>  	__le32 *addr = get_dnode_addr(inode, page);
> @@ -3437,17 +3440,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>  	return F2FS_I(inode)->i_inline_xattr_size;
>  }
>  
> -static inline __le32 *get_dnode_addr(struct inode *inode,
> -					struct page *node_page)
> -{
> -	int base = 0;
> -
> -	if (IS_INODE(node_page) && f2fs_has_extra_attr(inode))
> -		base = get_extra_isize(inode);
> -
> -	return blkaddr_in_node(F2FS_NODE(node_page)) + base;
> -}
> -
>  #define f2fs_get_inode_mode(i) \
>  	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
>  	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
