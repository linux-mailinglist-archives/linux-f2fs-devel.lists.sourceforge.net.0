Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73D7B62C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 01:19:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsbOY-0007Wj-ON; Tue, 30 Jul 2019 23:19:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hsbOX-0007WY-LX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 23:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=riaOQPcwy1mtmObwaJHumw7lWuk0RIQsJvIz38FDRt8=; b=ZnDyzEWrwyfy6EXINPwzfnLh5d
 WDeOW1wTwLFwWLASx18NkJzIxjJsDttK0r1BXH82Sm2apIbn4uiHM4nLNsvWdfw7PwLr9Kh78jnfd
 YHKMp+Kd3ObxOi6USkZhXeH/q+xllntaWTtXiEyNUxABN/LzfquHUIZcBhpHjbQXv96c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=riaOQPcwy1mtmObwaJHumw7lWuk0RIQsJvIz38FDRt8=; b=YooxmWh7kRPMdZTlcAUlq05oSr
 /eYVS6aELTRkT2qm5OVGDV//lLt+r0VIIUuPJXcktduwb4R4qrFT0+PpbRLExKq8v8umpf8QbWzQf
 F2brhLSNxiJV3U3NGW4kyv8y6jSjrLCqALvR+xWOfzYPVwPdSCA/HDRhUSZq2Tq0ejrY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsbOS-005Am9-Td
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 23:19:01 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37328206A2;
 Tue, 30 Jul 2019 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564528731;
 bh=6xmGYc6TH8AweXfIvI1TfQpeRJZVleWQJq3+Osoyc+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=awpi5r6cyEwrlHtECjfeR/LWADesJ0wZFr0r3vwlfULUQAC9B6AZyKXxl9NTmJbXA
 2Faz2LxzoKOmEUVyilxVvmLFHv5kdvAZVeJANlt5tzrBVjcpTDX4Q0xh+sHYsMF5MN
 z6uB82Zhf4fvV361NBWaKCvFUl8Xbjzmj63WwTbw=
Date: Tue, 30 Jul 2019 16:18:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190730231850.GA7097@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190729150351.12223-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729150351.12223-1-chao@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsbOS-005Am9-Td
Subject: Re: [f2fs-dev] [PATCH v3 RESEND] f2fs: introduce
 sb.required_features to store incompatible features
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/29, Chao Yu wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> Later after this patch was merged, all new incompatible feature's
> bit should be added into sb.required_features field, and define new
> feature function with F2FS_INCOMPAT_FEATURE_FUNCS() macro.
> 
> Then during mount, we will do sanity check with enabled features in
> image, if there are features in sb.required_features that kernel can
> not recognize, just fail the mount.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v3:
> - change commit title.
> - fix wrong macro name.
>  fs/f2fs/f2fs.h          | 15 +++++++++++++++
>  fs/f2fs/super.c         | 10 ++++++++++
>  include/linux/f2fs_fs.h |  3 ++-
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a6eb828af57f..b8e17d4ddb8d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -163,6 +163,15 @@ struct f2fs_mount_info {
>  #define F2FS_CLEAR_FEATURE(sbi, mask)					\
>  	(sbi->raw_super->feature &= ~cpu_to_le32(mask))
>  
> +#define F2FS_INCOMPAT_FEATURES		0
> +
> +#define F2FS_HAS_INCOMPAT_FEATURE(sbi, mask)				\
> +	((sbi->raw_super->required_features & cpu_to_le32(mask)) != 0)
> +#define F2FS_SET_INCOMPAT_FEATURE(sbi, mask)				\
> +	(sbi->raw_super->required_features |= cpu_to_le32(mask))
> +#define F2FS_CLEAR_INCOMPAT_FEATURE(sbi, mask)				\
> +	(sbi->raw_super->required_features &= ~cpu_to_le32(mask))
> +
>  /*
>   * Default values for user and/or group using reserved blocks
>   */
> @@ -3585,6 +3594,12 @@ F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
>  F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
>  F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
>  
> +#define F2FS_INCOMPAT_FEATURE_FUNCS(name, flagname) \
> +static inline int f2fs_sb_has_##name(struct f2fs_sb_info *sbi) \
> +{ \
> +	return F2FS_HAS_INCOMPAT_FEATURE(sbi, F2FS_FEATURE_##flagname); \
> +}
> +
>  #ifdef CONFIG_BLK_DEV_ZONED
>  static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>  				    block_t blkaddr)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5540fee0fe3f..3701dcce90e6 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2513,6 +2513,16 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  		return -EINVAL;
>  	}
>  
> +	/* check whether current kernel supports all features on image */
> +	if (le32_to_cpu(raw_super->required_features) &

...
#define F2FS_FEATURE_VERITY	0x0400	/* reserved */
...
#define F2FS_FEATURE_CASEFOLD	0x1000
#define F2FS_FEATURE_SUPPORT	0x1BFF

	if (le32_to_cpu(raw_super->required_features) & ~F2FS_FEATURE_SUPPORT) {
		...
		return -EINVAL;
	}


> +			~F2FS_INCOMPAT_FEATURES) {
> +		f2fs_info(sbi, "Unsupported feature: %x: supported: %x",
> +			  le32_to_cpu(raw_super->required_features) ^
> +			  F2FS_INCOMPAT_FEATURES,
> +			  F2FS_INCOMPAT_FEATURES);
> +		return -EINVAL;
> +	}
> +
>  	/* Check checksum_offset and crc in superblock */
>  	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
>  		crc_offset = le32_to_cpu(raw_super->checksum_offset);
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index a2b36b2e286f..4141be3f219c 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -117,7 +117,8 @@ struct f2fs_super_block {
>  	__u8 hot_ext_count;		/* # of hot file extension */
>  	__le16	s_encoding;		/* Filename charset encoding */
>  	__le16	s_encoding_flags;	/* Filename charset encoding flags */
> -	__u8 reserved[306];		/* valid reserved region */
> +	__le32 required_features;       /* incompatible features to old kernel */
> +	__u8 reserved[302];		/* valid reserved region */
>  	__le32 crc;			/* checksum of superblock */
>  } __packed;
>  
> -- 
> 2.22.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
