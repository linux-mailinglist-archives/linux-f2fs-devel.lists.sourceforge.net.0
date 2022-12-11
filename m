Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 761216491DB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:23:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4C0B-0002w9-WD;
	Sun, 11 Dec 2022 02:23:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4C09-0002w3-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhXmggTwwJPtdWCy+cAzhA4tjcIKd/N8K5/wQ9HIW+s=; b=YQO5atu1rgpiMQWqqThGq++SES
 isv7TljKzptDEdpxVXH26RUl08Khgbws10V/UZr6PvRIXQEjI+5fPftUeXodd2/yN7CCx8JQu4pPg
 gl4j4TfL4iYiePYQ3RoZobJBkugr6JB0IZO5xvv/7jt0zRWBKyZclrMxEUnFIKktPw/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RhXmggTwwJPtdWCy+cAzhA4tjcIKd/N8K5/wQ9HIW+s=; b=aJLhkDxvL/qRg1rRR2TC02nSTI
 T9aNGskPH3uJazGWeWoQZmPlLtigS1k4v3/5PEKkGMVKmFphuf12cR3K1UwoQjeVFsh9Ch/h5q7TX
 kTW+gU/KKuyR7bpfZPsYXfCecSzZDof0bfBuy/BJ72rwGZvI0PZUw/p+ovJBH1GKObLM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4C05-00DRSn-0L for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:23:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 999026091F;
 Sun, 11 Dec 2022 02:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7571C433D2;
 Sun, 11 Dec 2022 02:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670725407;
 bh=k2fYp/k7d+wmxlOxjITMs8j1x3fl0GhBglBHCVYpTto=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fy1mPeKnj9Nf4VEcOIDW5boRfcXHhYS6bZhtBt7YrfHBWsSvlxb9UZVbCsQs3+9jR
 hT1OprozoTBAHdagvuGEUvgxus6WIClml96UHFTIJZ1Tlhn7UnZsYU8SE/SHRYgUYF
 st3c3FTfJYtxXDw1El6G/XGY4wEhl9EtT071nvIvrCh3Ec5ehfIcRljudqf2bGyvKY
 fXxznrQ2nLSNnMzDMmstqTJKcpITjMq3aIHvzBKR+4eMlOx9wZgW8b8yennnu72RmU
 0JUHBZt3tAydnmqjNNbOBVJcMIBeACagVga53ReHR7mLFPLIOLQTQL7T+9DUfi3A1l
 71rNvfZZfS5KA==
Message-ID: <38ab73c5-4865-188f-9554-6bcaec7cc78b@kernel.org>
Date: Sun, 11 Dec 2022 10:23:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221205145603.70779-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221205145603.70779-1-frank.li@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/5 22:56, Yangtao Li wrote: > Just like other data
 we count uses the number of bytes as the basic unit, > but discard uses the
 number of cmds as the statistical unit. In fact the > discard c [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4C05-00DRSn-0L
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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

On 2022/12/5 22:56, Yangtao Li wrote:
> Just like other data we count uses the number of bytes as the basic unit,
> but discard uses the number of cmds as the statistical unit. In fact the
> discard command contains the number of blocks, so let's change to the
> number of bytes as the base unit.
> 
> Fixes: b0af6d491a6b ("f2fs: add app/fs io stat")
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9486ca49ecb1..bc262e17b279 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1181,7 +1181,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   
>   		atomic_inc(&dcc->issued_discard);
>   
> -		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
> +		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);

In order to avoid breaking its usage of application, how about keeping
FS_DISCARD as it is, and add FS_DISCARD_IO to account discard bytes?

Thanks,

>   
>   		lstart += len;
>   		start += len;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
