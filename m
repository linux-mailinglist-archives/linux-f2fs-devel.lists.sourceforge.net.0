Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F120260F8F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 15:24:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo2rt-0006MN-F8;
	Thu, 27 Oct 2022 13:24:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oo2rs-0006MH-B3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 13:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1mdPqskYbsxR3iHPjQZMmU86pt94ACGf6lR2K6f+iRs=; b=eN3U84+70ZQWqF5IYoUWnkaqd8
 7XnNUsiC/+qPZSKaQcsYZOZB00kby7VGm1lyb/oiEMKzZi2/VW/Fyj7R9D6vowv6pX1CsLmIBPW/J
 797p92pgn78mYAEh0MouKOpKA0ggt5FOL0bLLi/78yVujwGXrXZ0YVp13LPJQZJqT3g4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1mdPqskYbsxR3iHPjQZMmU86pt94ACGf6lR2K6f+iRs=; b=NAnu1FYOlDiEXdRMxdq/I4sKfa
 oJNgiL18l/PIfoGtG/yjX1G+uN4KpCVCOhnTZCAol4Gb0TMyhjKjCHUA7lOjAEXJrAtpjjVDCYz1L
 BuynJqEURxSUsh4Fbrkuhfr/iCr4FW6B7Q6YN7Yeutv6E1J4spJrtZpqyRzClBHDVKlM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo2ro-0008I2-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 13:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5C58CE264E;
 Thu, 27 Oct 2022 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23476C433D6;
 Thu, 27 Oct 2022 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666877045;
 bh=rcl0QpMk9vrgc+zfC7BBi5aKHO8WAR1sc8YjGavKyNM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WeNfr1pPzbmcG2AxJ7St2fBchXUO9ILLCEDSP1H3ws3zvAXF24sSuJgRtrQd9M/hP
 Ox4qG/N9+eS6gqqm9AXg9azq1hHGvGMJqzU8LRbuUgtidYLT7H0Se+Llp4YMGp8AnJ
 E+6pe/0gdj+I/WOcJfKaJV/2WU9exs+5YfDO6hjQlXNMKeYLnLB3POCtTHFar8UQbx
 3GgRfIWNP5iMHQz2sNokvtWPT/35lVZaMP+cfap7WxwA8QDoGu/s7KPDPUcRLOU0uu
 Dvaq9qgOmccvHaexynaurN2V5r5C8Th8sDdLhbfm1FsKzhRhp/QH1tKSFW3UWrGVId
 s3+sSw8Ww3bkw==
Message-ID: <d0e09d40-89be-8f62-dfbb-1053405ad5d7@kernel.org>
Date: Thu, 27 Oct 2022 21:24:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221027120807.6337-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221027120807.6337-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/27 20:08, Yangtao Li wrote: > Since it is an f2fs
 module, it is best to prefix function names > with f2fs_. At the same time,
 there is already a flush thread > and related functions in the [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oo2ro-0008I2-NZ
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: rename flush_error_work() to
 f2fs_record_error_work()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/27 20:08, Yangtao Li wrote:
> Since it is an f2fs module, it is best to prefix function names
> with f2fs_. At the same time, there is already a flush thread
> and related functions in the system, rename flush_error_work()
> to f2fs_record_error_work().

It won't pollute global namespace since it's a static function just be
used in f2fs/super.c...

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/super.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a241e4073f1d..fc220b5c5599 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4019,7 +4019,7 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
>   	f2fs_stop_discard_thread(sbi);
>   }
>   
> -static void flush_error_work(struct work_struct *work)
> +static void f2fs_record_error_work(struct work_struct *work)
>   {
>   	struct f2fs_sb_info *sbi = container_of(work,
>   					struct f2fs_sb_info, s_error_work);
> @@ -4374,7 +4374,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   		goto free_devices;
>   	}
>   
> -	INIT_WORK(&sbi->s_error_work, flush_error_work);
> +	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
>   	spin_lock_init(&sbi->error_lock);
>   	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
>   	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
