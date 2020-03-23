Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D068018EDB7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 02:51:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGCEz-0003Fb-8z; Mon, 23 Mar 2020 01:50:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1jGCEt-0003FO-U2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8SLsMW47j3XkXoi43JnisWomCv/kF8xRgMCVOPZ4FUI=; b=gq3HRciatjKXDS5PNcoND8e1YL
 Q8DVPKd0nGpI+8uw2ET1p0gwRL7QabNkSAsHUJDiMuynhhG6xNa/0Ml3r9SXnRhgqvVAyJIYI+nzS
 O8jJJWT/quH9jP1w98HNIzqAi5eQokWynlAVSZlon7jsgZg2jOWYJ01dqqrL+TzQrEqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8SLsMW47j3XkXoi43JnisWomCv/kF8xRgMCVOPZ4FUI=; b=HCrS2htDq07whwFMgB44ZTCB7N
 Yc9Pm0FqKh4HRvtGmcbMe1nNV0mjCb//9v0mN+/BWqQoALHzZqZkj+7MuSbl8ffVbgQWvrzi62PG/
 Zl1abe6TB0TRWGB4uvo6+vgmj7Lvf0gF7QEBnYkDGzHN9AQRV/92UcOAvBwC87p74+io=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGCEp-0045vM-5i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1584928236; bh=1N30fcEiZZHKBwEnOj8WWoevPWmYxyTUVcPdUGEd8VE=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=RWwGJOKfp8Gr8AiVOHHK7dNKWIZF6ArzehJDlzDMofSgs5dGvdFPbF8uLA46sy7+d
 FC6NjOMYhiCFGsUgEimFwvK1Pohb6g+OehoXJ8QMdkjysSzdA41/i5Qhs/sCE/behe
 qJnW95oq0YmXDfKASbPTNv7dvLxQKugaEmHkMMSE=
Date: Mon, 23 Mar 2020 02:50:36 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200323015036.pniupuucfl3dug4m@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, chao@kernel.org
References: <20200323012519.41536-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323012519.41536-1-yuchao0@huawei.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: bootlin.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jGCEp-0045vM-5i
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix potential .flags overflow on
 32bit architecture
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Chao Yu,

On Mon, Mar 23, 2020 at 09:25:19AM +0800, Chao Yu wrote:
> [snip]
>  
> +static inline void __set_inode_flag(struct inode *inode, int flag)
> +{
> +	test_and_set_bit(flag % BITS_PER_LONG,
> +			&F2FS_I(inode)->flags[BIT_WORD(flag)]);

This can simply be:

    test_and_set_bit(flag, F2FS_I(inode)->flags);

all of these bitmap manipulation functions already will do the
right thing to access the correct location in the flags array:

  https://elixir.bootlin.com/linux/latest/source/include/asm-generic/bitops/atomic.h#L32

see BIT_MASK and BIT_WORD use in that function.

> +}
> +
>  static inline void set_inode_flag(struct inode *inode, int flag)
>  {
> -	if (!test_bit(flag, &F2FS_I(inode)->flags))
> -		set_bit(flag, &F2FS_I(inode)->flags);
> +	__set_inode_flag(inode, flag);
>  	__mark_inode_dirty_flag(inode, flag, true);
>  }
>  
>  static inline int is_inode_flag_set(struct inode *inode, int flag)
>  {
> -	return test_bit(flag, &F2FS_I(inode)->flags);
> +	return test_bit(flag % BITS_PER_LONG,
> +				&F2FS_I(inode)->flags[BIT_WORD(flag)]);

ditto

>  }
>  
>  static inline void clear_inode_flag(struct inode *inode, int flag)
>  {
> -	if (test_bit(flag, &F2FS_I(inode)->flags))
> -		clear_bit(flag, &F2FS_I(inode)->flags);
> +	test_and_clear_bit(flag % BITS_PER_LONG,
> +				&F2FS_I(inode)->flags[BIT_WORD(flag)]);

ditto

I'm going to test the patch. It looks like that this was really
the root cause of all those locking issues I was seeing on my
32-bit tablet. It seems to explain why my 64-bit systems were
not affected, and why reverting compession fixed it too.
Great job figuring this out.

I'll let you know soon.

thank you and regards,
	o.

>  	__mark_inode_dirty_flag(inode, flag, false);
>  }
>  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
