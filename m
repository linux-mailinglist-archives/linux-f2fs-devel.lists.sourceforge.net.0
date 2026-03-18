Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AByAxQnumnYSAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:16:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD72B5BE3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:16:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2iJODYD81ABJ444QLIp4ncjOw60JsUcB60pNjTv/HU=; b=ehAhlDRC1vFyjGP/h/0Bo0MjrW
	y4ImUkQfdkR08DLdYC0ZYEwwiHcAM3x0Xg3KZjHD+z1RjySjk5w+ImYPNoh7aWlGsMJrEO3kbuUJ9
	c83CXqjqFXZvaYCApi2dSTCSBsCVGtevDtpOXOdxp+VTAMktLdz40+kRTO5BiQCH3C6M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2iKK-0006Ss-OO;
	Wed, 18 Mar 2026 04:16:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2iKI-0006Sk-Rk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOlYjbXtRrs1UHxBQNbL5M5gRuVHTpP1UeSQWcjJF/Q=; b=CczsMtgyGk4agCHgDfsMukys11
 yc5OwHcNR47rQTEqBgWpSYIZwyuEYeD3tSvnUNXDyiZLTWY11TJMi2Hiel9qnkvg5O3nLmiPnwgVq
 TrL5PZQ1dsSVJXZZhgqs1Tfm5ppHPexIr83zAZW6aap9WRWb27ZaQ6c41BUSC8IiWFto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOlYjbXtRrs1UHxBQNbL5M5gRuVHTpP1UeSQWcjJF/Q=; b=Ix7Bw9Vb+aA+vkFZOelCygqmkx
 1JQA+0SJFzCY/TPCZggKxqhUNlYYDxhkSSWLCjzAhTeU75m8kZgorUxK0NIjKZD9Fl+rQL7hRxmno
 BDC/dsdgKj4cRY8k7lYN273qHRBM41JnAcO9zrFqVmyahzqKmfbmfUa/o4aI3qLw2JRQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2iKI-0006WX-8M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4AEA4067A;
 Wed, 18 Mar 2026 04:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AADC19421;
 Wed, 18 Mar 2026 04:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773807359;
 bh=0zM5I4wGTxV/hVllLEgYFaLIXZhlxJuLeZKxtw2WPnk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cEXd+u9OgbrF4jEoOIG/I+56b3aidc/AOLMLoJTGsEMrOesmsbhCKH5qB/sEH+ukj
 8CmCFMCtEkUzmvkPn9ulv6Fc/uFYn5pXw2Zht7q5kglC09sQpxrm4KsbwTofgSSTNA
 PdoU9uC5LI+Au529c/OczNYupWDjJ2HyGqq9i9FfjjBzAbftvDpH+MZR8n+Zo/PlDO
 Nnt0LSXoTQS4SYcE8HgjJIdlgWKkxXrE94T4CNUhES07mw+eYpKRQC+5o5gnYqJ8fR
 AjHuYgT8fqhEJPHw9U3YYBWZ0131vOm2rafodB8qRzYlezfuFRD/iqbHP8Hr0pj3aZ
 ivJy7nEH8+aWQ==
Message-ID: <b8bef1a9-b930-4a73-ae71-73323137c50e@kernel.org>
Date: Wed, 18 Mar 2026 12:15:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260317115459.208306-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260317115459.208306-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 19:54, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > This patch refactor the
 f2fs_move_node_folio()
 function. No logical > changes. > > Signed-off-by: Yongpeng [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2iKI-0006WX-8M
Subject: Re: [f2fs-dev] [PATCH v4 1/4] f2fs: refactor f2fs_move_node_folio
 function
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 3CDD72B5BE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 19:54, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> This patch refactor the f2fs_move_node_folio() function. No logical
> changes.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/f2fs.h |  2 ++
>   fs/f2fs/node.c | 54 ++++++++++++++++++++++++++++++--------------------
>   2 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 660bf88a376f..afb4d10142dd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3950,6 +3950,8 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
>   					enum node_type ntype, bool in_irq);
>   struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
>   struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
> +int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
> +			bool mark_dirty, enum iostat_type io_type);
>   int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
>   void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
>   int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 17eab01ae8f9..2e74d2882b6f 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1845,41 +1845,51 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>   	return false;
>   }
>   
> -int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
> +int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
> +			bool mark_dirty, enum iostat_type io_type)
>   {
>   	int err = 0;
> +	struct writeback_control wbc = {
> +		.sync_mode = WB_SYNC_ALL,
> +		.nr_to_write = 1,
> +	};
>   
> -	if (gc_type == FG_GC) {
> -		struct writeback_control wbc = {
> -			.sync_mode = WB_SYNC_ALL,
> -			.nr_to_write = 1,
> -		};
> +	if (!sync_mode) {
> +		/* set page dirty and write it */
> +		if (mark_dirty && !folio_test_writeback(node_folio))

If mark_dirty in this check condition is always true, we can removed it?

Thanks,

> +			folio_mark_dirty(node_folio);
> +		goto out_folio;
> +	}
>   
> -		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
> +	f2fs_folio_wait_writeback(node_folio, NODE, true, true);
>   
> +	if (mark_dirty)
>   		folio_mark_dirty(node_folio);
> +	else if (!folio_test_dirty(node_folio))
> +		goto out_folio;
>   
> -		if (!folio_clear_dirty_for_io(node_folio)) {
> -			err = -EAGAIN;
> -			goto out_page;
> -		}
> -
> -		if (!__write_node_folio(node_folio, false, NULL,
> -					&wbc, false, FS_GC_NODE_IO, NULL))
> -			err = -EAGAIN;
> -		goto release_page;
> -	} else {
> -		/* set page dirty and write it */
> -		if (!folio_test_writeback(node_folio))
> -			folio_mark_dirty(node_folio);
> +	if (!folio_clear_dirty_for_io(node_folio)) {
> +		err = -EAGAIN;
> +		goto out_folio;
>   	}
> -out_page:
> +
> +	if (!__write_node_folio(node_folio, false, NULL,
> +				&wbc, false, FS_GC_NODE_IO, NULL))
> +		err = -EAGAIN;
> +	goto release_folio;
> +out_folio:
>   	folio_unlock(node_folio);
> -release_page:
> +release_folio:
>   	f2fs_folio_put(node_folio, false);
>   	return err;
>   }
>   
> +int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
> +{
> +	return f2fs_write_single_node_folio(node_folio, gc_type == FG_GC,
> +			true, FS_GC_NODE_IO);
> +}
> +
>   int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			struct writeback_control *wbc, bool atomic,
>   			unsigned int *seq_id)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
