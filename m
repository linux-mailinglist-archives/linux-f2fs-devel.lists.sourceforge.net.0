Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01813CDE351
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 02:53:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB87khCSHmtgoNHRUkpJ9mTeozrEhBCo8nAN9Oj9hmw=; b=eL4ZyBPbMiHvZPoT683wYVOydf
	qJtRPdvtWOCBAGRlwkdRA3sPOgB7v8wdVYc6/pTay3v8NYFgGaIZx7RAyiYpigDXfXexqMf619TcP
	vscSkxwDkClZgv+GCWfwHlswEDQwW1KcI9obllX40BZgUg6dB/Dt+jBgK7gxR9h8GE4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYx0i-00057n-U9;
	Fri, 26 Dec 2025 01:52:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYx0h-00057e-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YbxiJ/HbSCUIJjm8ScB1HzbI5VVnF0aurK4bBAxQJUA=; b=QnpGBBfhUBE0YAK8zRE1GAW7bF
 eeL7dR9pY98uWJmitVb1ZpYK6MWc4KJ3A7RKzeqhYm72fn31a462D5OSlaJahjMuw9Hj7NmWouWqp
 2pNK2yUnPmV96AJKxkewjn7JlmNn0kw3vXd94TsKjzzlTs2QK+xw+TSImBM6SYcLKUH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YbxiJ/HbSCUIJjm8ScB1HzbI5VVnF0aurK4bBAxQJUA=; b=WBThd3fWNdaGgsVvj2FpZObqPv
 qxbvOm6cShYkPzNx0fLAOAjU3GPoHLgT8Tz3xthxs22YWkrPnDFC4mfP+Py2aI5dqVRMlFN8ewokF
 r/Bf7esuoFQ7rAjwZkNJbBmL6GC5+uY8YTmlfEW9+9Jsn9GJKU4XzTOO0CH/Z91b7X/I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYx0h-0004VI-5H for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C661643620;
 Fri, 26 Dec 2025 01:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CD0C4CEF1;
 Fri, 26 Dec 2025 01:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766713964;
 bh=Gfv5wMTUGZnjCR/kN0StCoUaon/ERhcjBeHgS7xGEGc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aavyFNFYQ6QD5GSgmOrudaxW1d9nwGIAqzHmFjeqwPej1Mb33Ed9rWVmU61Hu/ioH
 ZTafcjZzp3j9jGLvYTPxnayJ7ryoUkV+cxADFlJzeK+ixIAhJIpTIYyS9JSBxRTlH2
 3i55egmeKrfhAieltbEw8L3nG2Bu1LVzvVkU7bdUSyVR9PcU4p8VYdW0Vva5ozZJC6
 JmCYZr7aQQ25SxYfLqfQ0QDwLNnDaQXiLYWoZvxzHTXhwPoIl7Qnq5PTQ4VAwMdsuL
 UBtbUakeqBOXvWwDaJn2kFG8KLyASWdNJcIl6NHLt3mY1mmCfAbV00+O2N+aD4sNkq
 2O45FUQ9zNoxA==
Message-ID: <622035a5-b579-4575-b76c-f7a7b764f0e0@kernel.org>
Date: Fri, 26 Dec 2025 09:52:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/25/2025 8:59 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > f2fs_folio_wait_writeback ensures the
 folio write is submitted to the Actually, __submit_merged_write_cond() was
 called from many other places, for those scenario, we can not ensure whether
 the DATA or NODE type pages were cached in one bio cache or not, so we decide
 to [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYx0h-0004VI-5H
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: return immediately after
 submitting the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/25/2025 8:59 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> f2fs_folio_wait_writeback ensures the folio write is submitted to the

Actually, __submit_merged_write_cond() was called from many other places,
for those scenario, we can not ensure whether the DATA or NODE type pages
were cached in one bio cache or not, so we decide to submit all cached bios
w/ DATA or NODE type.

> block layer via __submit_merged_write_cond, then waits for the folio to
> complete. Other I/O submissions are irrelevant to
> f2fs_folio_wait_writeback. Thus, if the folio write bio is already

For f2fs_folio_wait_writeback() case, I guess you can optimize it separately,
maybe passing a parameter to __submit_merged_write_cond() as a hint?

Thanks,

> submitted, the function can return immediately.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/data.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 12bf4b6e0075..c743352b686d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -678,8 +678,12 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>   			ret = __has_merged_page(io->bio, inode, folio, ino);
>   			f2fs_up_read(&io->io_rwsem);
>   		}
> -		if (ret)
> +		if (ret) {
>   			__f2fs_submit_merged_write(sbi, type, temp);
> +			/* don't need to submit other types of bio. */
> +			if (folio)
> +				break;
> +		}
>   
>   		/* TODO: use HOT temp only for meta pages now. */
>   		if (type >= META)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
