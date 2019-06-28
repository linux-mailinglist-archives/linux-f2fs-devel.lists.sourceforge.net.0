Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418F58FB9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 03:29:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgfho-0004PZ-Nd; Fri, 28 Jun 2019 01:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hgfhn-0004PS-GN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 01:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vk7UKRl3ZCL3+nOed+ni1O2+vDfyWKxRQHLKA6O3Lgo=; b=PwxHyKr/LSYKkqiGm+7bsghK6k
 L1Kl9N4I57Jc9LIk/xJsCqbHmco1QAMrzKtr7UTFY68UsRX5shf15b2TvOuAZdr8Xuc8xxGAdW+xt
 CyXI+/FLBXdpplp8QiMXcCYKK91EenAdNARvcMuPOG7WswHWO5iaTGKPqLqIbMneSr70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vk7UKRl3ZCL3+nOed+ni1O2+vDfyWKxRQHLKA6O3Lgo=; b=KDUEy8GYtZyTFvAHDMZ8xiUmOt
 l3/gPqrm4V3DI5rbRDUqSDh3fzP+BTWYxU+8QT3c1OJUaHxbxoBoQf4Hq4PjZ/urZRp3IItWDtd/2
 jH4ynZoOMBsgqL39RvsK8cyhK/daSCVDa+YzrBb9pAa0uF9AleBWWl0qlt77ei13hZ50=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgfhv-00HPX2-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 01:29:45 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B5073DD15909C132DC9D;
 Fri, 28 Jun 2019 09:29:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 28 Jun
 2019 09:29:26 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190627170504.71700-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f64cdddd-807e-2918-744b-56ced47a94dd@huawei.com>
Date: Fri, 28 Jun 2019 09:29:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190627170504.71700-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hgfhv-00HPX2-Kv
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate blocks for pinned file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2019/6/28 1:05, Jaegeuk Kim wrote:
> This patch allows fallocate to allocate physical blocks for pinned file.

Quoted from manual of fallocate(2):
"
Any subregion within the range specified by offset and len that did not contain
data before the  call  will  be  initialized  to zero.

If  the  FALLOC_FL_KEEP_SIZE  flag  is specified in mode .... Preallocating
zeroed blocks beyond the end of the file in this manner is useful for optimizing
append workloads.
"

As quoted description, our change may break the rule of fallocate(, mode = 0),
because with after this change, we can't guarantee that preallocated physical
block contains zeroed data

Should we introduce an additional ioctl for this case? Or maybe add one more
flag in fallocate() for unzeroed block preallocation, not sure.

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e7c368db8185..cdfd4338682d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1528,7 +1528,12 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  	if (off_end)
>  		map.m_len++;
>  
> -	err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
> +	if (f2fs_is_pinned_file(inode))
> +		map.m_seg_type = CURSEG_COLD_DATA;
> +
> +	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
> +						F2FS_GET_BLOCK_PRE_DIO :
> +						F2FS_GET_BLOCK_PRE_AIO));
>  	if (err) {
>  		pgoff_t last_off;
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
