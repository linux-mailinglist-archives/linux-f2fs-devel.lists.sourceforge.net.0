Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A8665BE4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 13:57:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFafg-0007cq-IF;
	Wed, 11 Jan 2023 12:57:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFafe-0007cj-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 12:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAhqz+OZgCAhIgMyY/rk+2fPoQoshOImGq5fdriPZ7E=; b=k/Q8lJcqV93ZxHh0GE3ljjKBA+
 AxVUaN8WNR7ohg6kg58nZSPA08GSaOtGNrFUk2oTErBLwo0RUD5JpLDeTj6TlU/rmZz86ambanwS3
 DgRxiZsyKCysi3AqHN0xaBYf91CkVsWxaqRCNhHJsqxxTbn1gSfJFf0cz3kif3Wub09k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eAhqz+OZgCAhIgMyY/rk+2fPoQoshOImGq5fdriPZ7E=; b=CCcUjk3zOo8RRybz+8faCuBxyj
 V2o+Lh6saIw/Um2A3ChowpEIhtyCik3WXZfxn+AHws1dFuHqIC310gbSYkdbsJCgb4G4fI+pi436r
 USfTc0CV5QeUUkXojz3GYbDrhUFEpmD/67aD/egEdIcgQsgUH77FOvKOziZkOOjWRnG4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFafd-00Dseh-2V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 12:57:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C85F9B81BF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jan 2023 12:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C0CC433EF;
 Wed, 11 Jan 2023 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673441845;
 bh=2Ok56WfZJaCSfZDKDQWYGdgKxRCuAs08e+mmKxHXkzQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P99z6P9TEqBjn98Wr/1dWqSNvVmQ/MiFdfbD983uPUSRYD7y4/adFnXkKvBUzUQ8+
 Eegqf1WofVKzJ8xD4FKg8yVvV9l1wi86QUvK73kxD8cYVUj1BN/YlSiWd4HcFf34dM
 OjeqP6kw2bUJq4W3/8OKvUW3ugMnzJKeJ7JoE6Y8DRcqVHmbgyNaD0aCLUJH6nmpgC
 1AvxO3/s5st572JmHmHv9d6II0N5Rwdi1d0zrC5OWlj5ZLFTeaZBO1pENzDaMItUcH
 GvQjQoezGK6ogUFIGiIu/rDjoS1lsCkRKjVlWdAhmvJ5+dY8oulsrEgKiUVdN1Dnc1
 yv4veRc//aJFw==
Message-ID: <77b18266-69c4-c7f0-0eab-d2069a7b21d5@kernel.org>
Date: Wed, 11 Jan 2023 20:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230105233908.1030651-1-jaegeuk@kernel.org>
 <Y74O+5SklijYqMU1@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y74O+5SklijYqMU1@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/11 9:20,
 Jaegeuk Kim wrote: > In f2fs_update_inode_page, 
 f2fs_get_node_page handles EIO along with > f2fs_handle_page_eio that stops
 checkpoint, if the disk couldn't be recovered. > As a res [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFafd-00Dseh-2V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: retry to update the inode page
 given EIO
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/11 9:20, Jaegeuk Kim wrote:
> In f2fs_update_inode_page, f2fs_get_node_page handles EIO along with
> f2fs_handle_page_eio that stops checkpoint, if the disk couldn't be recovered.
> As a result, we don't need to stop checkpoint right away given single EIO.

f2fs_handle_page_eio() only covers the case that EIO occurs on the same
page, should we cover the case EIO occurs on different pages?

Thanks,

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Randall Huang <huangrandall@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Change log from v1:
>    - fix a bug
> 
>   fs/f2fs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ff6cf66ed46b..2ed7a621fdf1 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -719,7 +719,7 @@ void f2fs_update_inode_page(struct inode *inode)
>   	if (IS_ERR(node_page)) {
>   		int err = PTR_ERR(node_page);
>   
> -		if (err == -ENOMEM) {
> +		if (err == -ENOMEM || (err == -EIO && !f2fs_cp_error(sbi))) {
>   			cond_resched();
>   			goto retry;
>   		} else if (err != -ENOENT) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
