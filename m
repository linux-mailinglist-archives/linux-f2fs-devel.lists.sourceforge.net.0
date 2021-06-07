Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3439DE3F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 16:00:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqFoE-0006Im-8w; Mon, 07 Jun 2021 14:00:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqFoD-0006IV-7V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 14:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMcIcP+MOy+YAdOlAn0TCP7g+PlnGiY0ULuWixXAfaE=; b=S8gyGnoq5Mqst5Odgo1ETUidKe
 VWm8iRR1fc+hQUrTaQLNzTszlbNFVdyh57svhV830NG4RcGmUjj0/Sq1zs8Y9w4Te3Df1jj8DzopO
 /RXRoct+iUBdPHY2oAjuxdWhmRWwg6udlvwdcbK47jnMgNNwRqOoHZOJD5leSbxE74fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TMcIcP+MOy+YAdOlAn0TCP7g+PlnGiY0ULuWixXAfaE=; b=EpLxrvZBnWbMA+bSkkqRmOCGfQ
 fRVMVyvzWabQduiUfuqR9+mgaLWn+wwqfSEIKPDHFZVeivnUzYTq76kNrgmJeH1vzGeXN74gxiDZz
 PlNxgj9eQm3lMU3EXzOZO6X29PnvlEZV4kTgqJmFYfsQ5+LsF3ZFK0Nb8RdkiL9b87+w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqFo5-00EldZ-O8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 14:00:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A838061107;
 Mon,  7 Jun 2021 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623074440;
 bh=fb1SGOtDSePU0nH/toqqH2I5mjcpc4qNNrsdyTT80+0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=gvG2vaVFv5OmgyWZ2YGypIotKmv6VX/GBD8KoBAwJd+yODAZ5xi5+FCPHQ7NFLwLs
 GktYBgTvYgT16rfQaiHKZHryWNcZRFjQ/dNfQOigRsFLFE9XJIY+bNIJp8/VJLsLxe
 KTDZ0Yj11kr7w/V8H1fcpCUKaak7TKCMs/Z59aJHR5ZiL76HtLeA14c9u9QDXRfEGA
 oxV1BFjt8PhyLFLvt6p+Cs45bCy0zoVeyc53d2f/D4GDKIMCrGdaxlSdYqcDMHAE2+
 v8PgD9o6KphOJEGWWdnUWHMfaLxXG73ANTCv13FGILeywDjnPLtNkNHwjJYzXwMN7v
 IXkJQZndkeIMQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210605003210.856458-1-jaegeuk@kernel.org>
 <20210605003210.856458-3-jaegeuk@kernel.org> <YLxeynwR0v23c3sV@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f8edad10-dfad-d12e-9c60-e007d132fbda@kernel.org>
Date: Mon, 7 Jun 2021 22:00:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLxeynwR0v23c3sV@google.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqFo5-00EldZ-O8
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] f2fs: clean up
 /sys/fs/f2fs/<disk>/features
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/6 13:36, Jaegeuk Kim wrote:
> Let's create /sys/fs/f2fs/<disk>/feature_list/ to meet sysfs rule.
> 
> Note that there are three feature list entries:
> 1) /sys/fs/f2fs/features
>    : shows runtime features supported by in-kernel f2fs along with Kconfig.
>      - ref. F2FS_FEATURE_RO_ATTR()
> 
> 2) /sys/fs/f2fs/$s_id/features <deprecated>
>    : shows on-disk features enabled by mkfs.f2fs, used for old kernels. This
>      won't add new feature anymore, and thus, users should check entries in 3)
>      instead of this 2).
> 
> 3) /sys/fs/f2fs/$s_id/feature_list
>    : shows on-disk features enabled by mkfs.f2fs per instance, which follows
>      sysfs entry rule where each entry should expose single value.
>      This list covers old feature list provided by 2) and beyond. Therefore,
>      please add new on-disk feature in this list only.
>      - ref. F2FS_SB_FEATURE_RO_ATTR()
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

> +static struct kobj_type f2fs_feature_list_ktype = {
> +	.default_groups = f2fs_sb_feat_groups,
> +	.sysfs_ops	= &f2fs_feature_list_attr_ops,
> +	.release	= f2fs_feature_list_kobj_release,
> +};
> +
> +

Nitpick, one redundant blank line.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
