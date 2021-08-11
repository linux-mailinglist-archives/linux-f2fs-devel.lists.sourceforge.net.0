Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1C3E91EC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 14:50:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDngg-0005Kt-ES; Wed, 11 Aug 2021 12:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mDnge-0005Kh-BP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 12:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1OYAgwrBBd5jb5z9YThCtBzXbae4wmiPaCgy0Se6Vo=; b=Er9to/NtOE6eCcJgnMB0k2cfTi
 YlqT893OYJPeeTg7O/Nx9OB8txB0tFDSAO5bpQ0lY1qK25Nh1F2r+vAGUHYhjLVRAW0SkddEraz1W
 MhQr/byNNEJukmBVEMLYwGYEeiaV4brHqw1yqaGt7V+VE2I34ZtcSh1T0aotW0CdFfzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l1OYAgwrBBd5jb5z9YThCtBzXbae4wmiPaCgy0Se6Vo=; b=P4iK70D5a2jLPcAfsi0t4guQ8w
 df+O8hjd7JEc2aZZudqu2s+3Y3/WyBw2GLf73GmDrTO6taNvEwpsC/cfc/FuKP6x/ihvPqf0HmQqw
 01ELQCg2B1sy8QfDYvR61D5RdGXigG/0TIJUyq9S2Bx5OJ4i4frkPr7MAnhp0EQGoXeo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDngc-0033hq-J4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 12:50:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBFF860FD9;
 Wed, 11 Aug 2021 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628686209;
 bh=XrnVlW9yQyXAgrKI++FIwfqsSND7wqcHNFFTWnOl7Go=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tOKh+EgD/Ulo9JRzEd+3VI/YnzdcQowxG3I90r5ppWv956X2yT101p5as8YimFk5z
 fLzaWUiV8UgQGOBoGyVpE0QP4V796uAJ2Xp0sgGQiPutr6lHKhOw1CtiS4KhG+t2PA
 dsGKEt4Vz+JTkb+5GcfCgQWXDuhx1vndUpfq83eM09UcLihzL2qNINNWnAG3PDzi9S
 NgWrpJyjPCaHnG3p/0460f1zrMGxu4W8p7b2NbmVseYMFU6qFwrduqpPkw6BrUDyvD
 auu9pydSLTP6CHtPXNLWtDU9CdwjqEClX0RXfK+1qUihK1js5XRA1/LR8MslEj3IZr
 g3rueqSnwN/QQ==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210811101608.197664-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <94c463e8-264b-47e6-f2d6-c7c42a6e3d80@kernel.org>
Date: Wed, 11 Aug 2021 20:50:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811101608.197664-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDngc-0033hq-J4
Subject: Re: [f2fs-dev] [PATCH] f2fs: warn on when fsck flag is set
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

On 2021/8/11 18:16, Yangtao Li wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
> this flag is set in too many places. For some scenes that are not very
> reproducible, adding stack information will help locate the problem.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 67faa43cc141..7e185446d2df 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1999,6 +1999,7 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   
>   static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
> +	WARN_ON_ONCE(type ==  SBI_NEED_FSCK);

One more blank character.

>   	set_bit(type, &sbi->s_flag);
>   }
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
