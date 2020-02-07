Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A3155282
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Feb 2020 07:42:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izxLc-0006f7-Lg; Fri, 07 Feb 2020 06:42:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1izxLb-0006eh-3V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Feb 2020 06:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mnZl4Flxp12HlNTJDtFOrHxyLdPSwOlEthWkb2XefBE=; b=Zxwwi2i5U0lD8/sf2R4220JLzn
 CWwZNs94psJaaSAAsPlRDLsPl1ttpoOoYacFJCE5d6/LpND8RAaX3Eqpq77Dt3F1hoiHJXpq2bo62
 7n072+OtuUjwIhNMcaqtj7pvdJOBaT6hssbvxOzyRFs9Bd82HvW8crcdfFMUp5pKSvM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mnZl4Flxp12HlNTJDtFOrHxyLdPSwOlEthWkb2XefBE=; b=Fd3jEOJDRpHnk4HLegWsMo3Z26
 Wz2IFHWfdNR7w1rO9XPK1ReV/MSAODuW6x69u45BeOI5TvZeQec2N+wE5GD9L6c59pQmTs2gN+F9T
 z8gZxzf1UVHhrNwIZ7KgeiaZI5ux6K5xVlRCadSedEF1rQO3gl8qCI66TRMQIM/dbB2A=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1izxLX-00CfpF-Ho
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Feb 2020 06:42:39 +0000
Received: by mail-vs1-f66.google.com with SMTP id p6so539409vsj.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Feb 2020 22:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mnZl4Flxp12HlNTJDtFOrHxyLdPSwOlEthWkb2XefBE=;
 b=dgXnBq7u8i/qlJWOjO4V/z48t3afrAtEEfd45aJ41yjpQ8BjjfV7pjme8YfokkxXGH
 HVvw6tVBEIGj02Dprhr5BIfjj/kVmrQlli0YemSZ4xeeHZJvv+ygShc6ChJehYcqL/lr
 Y7AzMhAdVIkAzy/QrqlUS1UyX375KTRDMs1xSFwmjZl/+lVA3mY/V9xX0LxJvz2/xkfR
 TUPDx4mY4uj2JCZNjujoW75Z3yejnWYXdo1T7V1PXY+3rBNBeOSyAK/WBBOxVsti0JBq
 mYqql1aMl/tfsTrf2scjNvJ2ZGWl6l7I8wBjksL5RISRqbeFqyL+uxNiNR4lfkdysIDi
 w6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnZl4Flxp12HlNTJDtFOrHxyLdPSwOlEthWkb2XefBE=;
 b=V9uCVEJmhHLn4SNkFWpltvOngB3nFYN1wHYd06ycbNsDNm79jMMeh7DCEzEJpitAAh
 7/njYR2VB+UvH/pb95I05RtY5vqYnLOPI6tDzgpzrQi50yQ27RKWKEtY840zTDXTQaZf
 GiLAAyPmEDWWlU4Qa+vxqWciKIC+pqe1KydYJy1xcYZPvdGmqY1wNVBEkycL8XmQy4+K
 5Fvx6yRBytsFb60MREmaWErGlTZthrHHvql9Q/tvrDb9OJASF10obm7tX6DT2cFjzC6d
 aa/4e+OEfXQhLts5ISR9WIOu5gR8LB2ptdOaEvEB4Pp8f04zDGMuyHkuoS+CPVsF3dDg
 ieug==
X-Gm-Message-State: APjAAAVINoIaR5kuUWbyO0UYwU4f/bAxfjUSjnpeeRztMNSJX8rjlMWq
 F2IgDP4QO0pN1nwvfMNwGNQ3pB/fhIdF1n2DX78=
X-Google-Smtp-Source: APXvYqx2ilqaaRtvjaxR7jjdPcds343sPqT/P2DSq37zZoZ/hy5E9GXuj4DUQLOmym+y2EFrALx8Vk4KTo0G2AUVqdk=
X-Received: by 2002:a05:6102:7a4:: with SMTP id
 x4mr3922197vsg.85.1581057749268; 
 Thu, 06 Feb 2020 22:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20191227104456.24528-1-yuchao0@huawei.com>
In-Reply-To: <20191227104456.24528-1-yuchao0@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Fri, 7 Feb 2020 15:42:18 +0900
Message-ID: <CAD14+f2jh5pfeW1Z2KTJLoWFivDbjH2SB3j9OVQ932WwBZZHjg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1izxLX-00CfpF-Ho
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to add swap extent correctly
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I think this should be sent to linux-stable.
Thoughts?

Thanks.

On Fri, Dec 27, 2019 at 7:45 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> As Youling reported in mailing list:
>
> https://www.linuxquestions.org/questions/linux-newbie-8/the-file-system-f2fs-is-broken-4175666043/
>
> https://www.linux.org/threads/the-file-system-f2fs-is-broken.26490/
>
> There is a test case can corrupt f2fs image:
> - dd if=/dev/zero of=/swapfile bs=1M count=4096
> - chmod 600 /swapfile
> - mkswap /swapfile
> - swapon --discard /swapfile
>
> The root cause is f2fs_swap_activate() intends to return zero value
> to setup_swap_extents() to enable SWP_FS mode (swap file goes through
> fs), in this flow, setup_swap_extents() setups swap extent with wrong
> block address range, result in discard_swap() erasing incorrect address.
>
> Because f2fs_swap_activate() has pinned swapfile, its data block
> address will not change, it's safe to let swap to handle IO through
> raw device, so we can get rid of SWAP_FS mode and initial swap extents
> inside f2fs_swap_activate(), by this way, later discard_swap() can trim
> in right address range.
>
> Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/data.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 19cd03450066..ee4d3d284379 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3608,7 +3608,8 @@ int f2fs_migrate_page(struct address_space *mapping,
>
>  #ifdef CONFIG_SWAP
>  /* Copied from generic_swapfile_activate() to check any holes */
> -static int check_swap_activate(struct file *swap_file, unsigned int max)
> +static int check_swap_activate(struct swap_info_struct *sis,
> +                               struct file *swap_file, sector_t *span)
>  {
>         struct address_space *mapping = swap_file->f_mapping;
>         struct inode *inode = mapping->host;
> @@ -3619,6 +3620,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>         sector_t last_block;
>         sector_t lowest_block = -1;
>         sector_t highest_block = 0;
> +       int nr_extents = 0;
> +       int ret;
>
>         blkbits = inode->i_blkbits;
>         blocks_per_page = PAGE_SIZE >> blkbits;
> @@ -3630,7 +3633,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>         probe_block = 0;
>         page_no = 0;
>         last_block = i_size_read(inode) >> blkbits;
> -       while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
> +       while ((probe_block + blocks_per_page) <= last_block &&
> +                       page_no < sis->max) {
>                 unsigned block_in_page;
>                 sector_t first_block;
>
> @@ -3670,13 +3674,27 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>                                 highest_block = first_block;
>                 }
>
> +               /*
> +                * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
> +                */
> +               ret = add_swap_extent(sis, page_no, 1, first_block);
> +               if (ret < 0)
> +                       goto out;
> +               nr_extents += ret;
>                 page_no++;
>                 probe_block += blocks_per_page;
>  reprobe:
>                 continue;
>         }
> -       return 0;
> -
> +       ret = nr_extents;
> +       *span = 1 + highest_block - lowest_block;
> +       if (page_no == 0)
> +               page_no = 1;    /* force Empty message */
> +       sis->max = page_no;
> +       sis->pages = page_no - 1;
> +       sis->highest_bit = page_no - 1;
> +out:
> +       return ret;
>  bad_bmap:
>         pr_err("swapon: swapfile has holes\n");
>         return -EINVAL;
> @@ -3701,14 +3719,14 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>         if (f2fs_disable_compressed_file(inode))
>                 return -EINVAL;
>
> -       ret = check_swap_activate(file, sis->max);
> -       if (ret)
> +       ret = check_swap_activate(sis, file, span);
> +       if (ret < 0)
>                 return ret;
>
>         set_inode_flag(inode, FI_PIN_FILE);
>         f2fs_precache_extents(inode);
>         f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> -       return 0;
> +       return ret;
>  }
>
>  static void f2fs_swap_deactivate(struct file *file)
> --
> 2.18.0.rc1
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
