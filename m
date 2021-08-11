Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E383E92D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 15:40:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDoTE-0007Gi-1b; Wed, 11 Aug 2021 13:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mDoTC-0007Ga-Q0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cjuq4+g5da99dbN600R/w+GDB78X1JqBF/dXv55NrWY=; b=QWh5aMmS9cjWCfilqgDtY9zXSl
 WX5hRZGkkgRdaUKtw1GvGBsXQ3mw3Zu1SKb0vg9Vji5lbMhiuM20fPX1tAeEhR26gGEVc94Kk3pVA
 6js0oUb5uFzku0prylPgaBmsDDESDXgnpmGaxoFrdi+s9Gz3iwhiM1KnhIEPWZdBSKN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cjuq4+g5da99dbN600R/w+GDB78X1JqBF/dXv55NrWY=; b=MeavKbs/vBTdBCSYZT5j9JpvNK
 T2sXxTZ/Z7OxTYrauBjIBDj9nglaR6M59jFYfgYMPXHjaSdV241x7bdWUtCnHORGek/G5F/nBbazM
 8eN0DxDh647V5yR/H14oxIntwi7BREef5aHiY98M5mcMDkHdZ3EFwYnPaiS4Lk0O5zkk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDoT9-0038YV-KG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:40:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5841A60F56;
 Wed, 11 Aug 2021 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628689226;
 bh=emclmPkr2pkmYes0OwQt9cn7VPGaZs07M35hp5zRS04=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZuLexe4hdSRZWNRENXBh6gVThXxe9CfcLT4oWfpZ3mWJmfojr+8UNOleW0pe1VmR9
 l1rxMTip5wSbayqjSqIah6kphD7Amv4bfAGDzQ/8v+zKXpIBHMKTpo3XLQ7o/LoyH4
 1yVZzC78X1QnNqnI6zejHoCtSL75NTEZrb6GPDaN7mGOo9RqllFqygqye+cM58SECM
 XglqcB6xSskM2SVSVuyMBw3YGnd35oosLEtLrT0DIm+pXyVNiRrScVB/B8QVoVQREc
 Vz9pkt+SDyKLE+pXXsnvScbebsgk2tPgGZGNwBz1N7VOdntoMmLtKV70DptDsQGQZ9
 zEi7ouDLirxlg==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210811133013.225825-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <17ecb791-efa0-3e81-f9e5-eef321011b9e@kernel.org>
Date: Wed, 11 Aug 2021 21:40:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811133013.225825-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDoT9-0038YV-KG
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: warn on when fsck flag is set
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

On 2021/8/11 21:30, Yangtao Li wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
> this flag is set in too many places. For some scenes that are not very reproducible,
> adding stack information will help locate the problem.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -convert to WARN_ON
> -one more blank
>   fs/f2fs/f2fs.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 67faa43cc141..2e2294234c0d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -33,7 +33,7 @@
>   #else
>   #define f2fs_bug_on(sbi, condition)					\
>   	do {								\
> -		if (WARN_ON(condition))					\
> +		if ((condition))					\

Why removing WARN_ON()?

>   			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
>   	} while (0)
>   #endif
> @@ -1999,6 +1999,8 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   
>   static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
> +	WARN_ON(type ==  SBI_NEED_FSCK);

Again, please remove one unnecessary blank character before SBI_NEED_FSCK.

WARN_ON_ONCE(type == SBI_NEED_FSCK)

> +

No need to add blank line.

Thanks,

>   	set_bit(type, &sbi->s_flag);
>   }
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
