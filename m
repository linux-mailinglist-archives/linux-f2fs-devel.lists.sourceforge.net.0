Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963AA49224
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 08:25:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnukm-0004ON-CU;
	Fri, 28 Feb 2025 07:25:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tnukl-0004OH-Cw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLC2L69mwGz1yvQmDFcklooTfAvYPwNt1gdyPd4vPM0=; b=LbqLuoZ+Cqa2ZNN7EiQ2V8ox3U
 5GGxudtPRMhhTE/l2S9MtnVe0TYb5Mnf3+iNAYgTUB9lGybZZorXwfTVCQD33YsfFmqokiiuxznIK
 iOmgAZ99xQvUoyvfTcM8qJS53cYdr2HcVYDdlRHMo11OCJYq95gFCXdmsm/fThAocj1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLC2L69mwGz1yvQmDFcklooTfAvYPwNt1gdyPd4vPM0=; b=S4WaW7EAnKx2rPnUREPWgFqaC8
 3de3D8VAWFQX65oBaXAqhIAi5jDNYHlmOv1n+1xkEr8i81UPtoTCeRhavYDOC9CukLXyvYvonUe8i
 hsXJ4MEV8D14+5AZC24J7DtbdwrK1mNNIyhRshaQOQLR8DHlFgKgyhgYNyJFjm40faPU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnukk-0008JA-1f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACE3A612BB;
 Fri, 28 Feb 2025 07:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC57BC4CED6;
 Fri, 28 Feb 2025 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740727534;
 bh=DaNz3vrr0AWCklzsrYQFRMH1Wufb+iyNrR9fYKDr2+A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DH+wtRL0CYx9RZkzaz6UBbWRN89a+0zzp27pGJjl6Z+Es4L5VCxrXOzbCsVJf+3Q+
 LrDYsaCmdczNtmhO4/UcSq5iP9rSB6adVaFnsRCVniXLxDP0nS6/lTgyjm4YkGKqVB
 QJwbrT8r6s647xvvabLZ1gH0ZQfSgepNsk5ZhBUIpuJ0Q1GDwfnYnDmY6t6qzzIneu
 wfGfG+P66dmezcnTA44H7b4/TDgBgf1XWBG3430+2HSaxCE5sPTJhaZnLsJJOOhZqj
 1Bg9bVRQZHLYcA0QyuZZtshbFIqE5IZwBDitUnhpw7TV8yH5j1d0D2IcfPUImxjVwd
 1em2Noyw1llYA==
Message-ID: <4dd3fbe6-9a39-4911-9ab1-72f20c83c02c@kernel.org>
Date: Fri, 28 Feb 2025 15:25:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-21-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250218055203.591403-21-willy@infradead.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote: > Remove
 one call to compound_head() and a reference to page->mapping > by calling
 page_folio() early on. > > Signed-off-by: Matthew Wilcox (Oracle) [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnukk-0008JA-1f
Subject: Re: [f2fs-dev] [PATCH 20/27] f2fs: Hoist the page_folio() call to
 the start of f2fs_merge_page_bio()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote:
> Remove one call to compound_head() and a reference to page->mapping
> by calling page_folio() early on.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   fs/f2fs/data.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d297e9ae6391..fe7fa08b20c7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -888,6 +888,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   	struct bio *bio = *fio->bio;
>   	struct page *page = fio->encrypted_page ?
>   			fio->encrypted_page : fio->page;
> +	struct folio *folio = page_folio(fio->page);
>   
>   	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>   			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))

Minor thing, missed to change below line:

	trace_f2fs_submit_folio_bio(page_folio(page), fio);

can be cleaned up to:

	trace_f2fs_submit_folio_bio(folio, fio);

Thanks,

> @@ -901,8 +902,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   alloc_new:
>   	if (!bio) {
>   		bio = __bio_alloc(fio, BIO_MAX_VECS);
> -		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
> -				page_folio(fio->page)->index, fio, GFP_NOIO);
> +		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
> +				folio->index, fio, GFP_NOIO);
>   
>   		add_bio_entry(fio->sbi, bio, page, fio->temp);
>   	} else {
> @@ -911,8 +912,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   	}
>   
>   	if (fio->io_wbc)
> -		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
> -					 PAGE_SIZE);
> +		wbc_account_cgroup_owner(fio->io_wbc, folio, folio_size(folio));
>   
>   	inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
