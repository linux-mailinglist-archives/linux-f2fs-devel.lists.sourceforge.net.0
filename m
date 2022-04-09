Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C964FA0AB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 02:27:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncyx0-0000AP-CU; Sat, 09 Apr 2022 00:27:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ncywy-0000AG-IY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 00:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EnYcr0yawkRCSInoviZOBdl+hDrMg7CJK+3AlMdgV7s=; b=FwmWnkoyNbYrteTLDiPaGdgo8p
 NYe7RzYthVAYxGxQ51H56Zjd8xbcVjBZYCC/oMn05seojFr6boPakEc/hkuF1TPj3rQOebCYYIA5E
 3qhMp4Cip6459bRiJYwWJ0i+ZREZgiCk/vtkzAbbKDzIZ91HT1vgV1GQYct638r7D9Xk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EnYcr0yawkRCSInoviZOBdl+hDrMg7CJK+3AlMdgV7s=; b=AYCkyx7DSHpsLe5PEAFHHwvGH0
 XNFbZwllG1BnypmrB5UQf2wXrguB906bql33bBoIaDH7ZbwJar8XEzcZMyX8vAxaTAU71iPEDVxHo
 xFxyPqxzZVq37AIPGbzh4a7JuGhAjyfdh8czjh16csJaVh3SDt+K1VhcZQvWpnuJmWik=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncywt-00AF9u-2w
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 00:27:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B7E8B82DE8;
 Sat,  9 Apr 2022 00:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2435CC385A1;
 Sat,  9 Apr 2022 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649464038;
 bh=V21qrnxEGRvRtjsW99rzEkaJ71bW7eH7K1kylLcmTf0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U8bMgHPG6hX+393ZLGBfvguEU8DygSp3aM4StKrSfwZVxbNMUnXZAJXCO5DegcZiL
 9MuybHlEcyCpaw4EKK6p7b/VP7qz5xsa705aIzKEjpruhIMDSw5jVAcrY6Ce43+wVM
 PohWP2PPtXE5YDvYWibMDYnXZnJose0TPcQguA/nQo2qUubTejJDVDIK1xPeOOe6HQ
 dXYCZ74VIKeo2DL4ZyMZLHja2yBtXOEpbtat57L6H0OEYgY/8fOoUC6k74dlg1NXBS
 0v3+3Xyepx6+kXaBJ11AYYerVnuDu2Vu/fOGcANrKu0j4TWcAlnLaDjxbqwapPljO6
 ibyJuQ4BYajAQ==
Message-ID: <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
Date: Sat, 9 Apr 2022 08:27:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220408052207.209856-1-dzm91@hust.edu.cn>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/8 13:22, Dongliang Mu wrote: > From: Dongliang Mu
 <mudongliangabcd@gmail.com> > > In f2fs_is_valid_blkaddr,
 if type is DATA_GENERIC_ENHANCE
 or > DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ncywt-00AF9u-2w
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: remove WARN_ON in
 f2fs_is_valid_blkaddr
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/8 13:22, Dongliang Mu wrote:
> From: Dongliang Mu <mudongliangabcd@gmail.com>
> 
> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
> blkaddr is in the range or not.

If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
It means f2fs image may be broken, or there is a bug in f2fs.

So, do you suffer any related issue in your environment?

Thanks,

> 
> Fix this by removing WARN_ON.
> 
> Note that, syzbot patch testing does not incur any further issues
> 
> Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>   fs/f2fs/checkpoint.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index f5366feea82d..521498b2dd8c 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>   		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
>   			 blkaddr, exist);
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		WARN_ON(1);
>   	}
>   	return exist;
>   }
> @@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   			f2fs_warn(sbi, "access invalid blkaddr:%u",
>   				  blkaddr);
>   			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			WARN_ON(1);
>   			return false;
>   		} else {
>   			return __is_bitmap_valid(sbi, blkaddr, type);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
