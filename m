Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2256ECC0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 14:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqvLq-00068b-SP;
	Mon, 24 Apr 2023 12:31:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1pqvLo-00068U-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 12:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l7hQoBJfzkfgPB29S154KGrGt0ixs3oVFi/jSX9Pzms=; b=Rae6BzLqLajAP+68hRWlxhY3Lp
 D2PuN8rHU7bYkYo2KVNtQnQe1/6thx/njj0Fm6womaMQwa4GMBjSGiqCxxGG+yt7RNdCI+uVg38Es
 c9ce4vEv439wit9mUCRQmE/2k/66QkcqYkdMTVHCyev4xQivqcoaprSqfZNwCrOF48vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l7hQoBJfzkfgPB29S154KGrGt0ixs3oVFi/jSX9Pzms=; b=fGCP1BKf4QgdpRqAv7xvbo/xnL
 iEj/gS/97lUl6AQo/hDdcd0KaIY0utjxqO6LyEvdR9W0Glv2nN+8E9ZqYpdicsb3jqJoq7yr8fzj4
 QgXrv2eXBuQsbffUVCRrTn16gPKzYxUnH89al/h5Vj7q0ukoo7DEsXTsLuHRnrPb9EwA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqvLl-0000QX-8f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 12:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l7hQoBJfzkfgPB29S154KGrGt0ixs3oVFi/jSX9Pzms=; b=sjx8klUbwyW5poG4vtt9GHne3M
 IuyC7Pa8loDQwweiLoc92ELtPUZyx8Y42tUlRWkmi+KS7dfAwluiV36VnGBR2M/SrIGpjbF22vMJA
 fCM1/e9rmvocI23ApG30mhO1wQBkljHUh+CKbIyl5bQDqXNwpBmyu8qZgNeWIQrzDN6H755jlAs0Y
 Toyra5f2h2BCeN8TevH1pz8ysOh3rTJ7JqmgtPqbuOBunT5NfKQYVe6DXf3nr/uzVcn3ul4X5UhcH
 HhvUG30dtGsHbTs4kvAre8IQDSsrz8oZGgbcBdRNHAlnoc53J7ERcVSRH1P61KtUHQOB4hTGaITiV
 nwQQzrzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pqvLM-000RHP-Lv; Mon, 24 Apr 2023 12:30:56 +0000
Date: Mon, 24 Apr 2023 13:30:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZEZ2gCYFlurJfeDE@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424054926.26927-4-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig
 wrote: > block_page_mkwrite_return is neither block nor mkwrite specific,
 and > should not be under CONFIG_BLOCK. Move it to mm.h and rename [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pqvLl-0000QX-8f
Subject: Re: [f2fs-dev] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
Cc: Jens Axboe <axboe@kernel.dk>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig wrote:
> block_page_mkwrite_return is neither block nor mkwrite specific, and
> should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
> errno_to_vmfault.

Could you move it about 300 lines down and put it near vmf_error()
so we think about how to unify the two at some point?

Perhaps it should better be called vmf_fs_error() for now since the
errnos it handles are the kind generated by filesystems.

> +++ b/include/linux/mm.h
> @@ -3061,6 +3061,19 @@ extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>  		pgoff_t start_pgoff, pgoff_t end_pgoff);
>  extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
>  
> +/* Convert errno to return value from ->page_mkwrite() call */
> +static inline vm_fault_t errno_to_vmfault(int err)
> +{
> +	if (err == 0)
> +		return VM_FAULT_LOCKED;
> +	if (err == -EFAULT || err == -EAGAIN)
> +		return VM_FAULT_NOPAGE;
> +	if (err == -ENOMEM)
> +		return VM_FAULT_OOM;
> +	/* -ENOSPC, -EDQUOT, -EIO ... */
> +	return VM_FAULT_SIGBUS;
> +}
> +
>  extern unsigned long stack_guard_gap;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
