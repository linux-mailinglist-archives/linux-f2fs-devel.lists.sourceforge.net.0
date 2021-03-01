Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CED763275F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 03:01:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGXsL-0000Go-QN; Mon, 01 Mar 2021 02:01:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lGXsK-0000Gb-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 02:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lwkRF6LjufLDtInGagjRztGTIyEyT/j/RurydVEpo88=; b=KTNcRURBcLvPO1TDPWIN/xCHUr
 on68HpMhmhgoB4p69qZkm6vyV7kFTq6/qGAtvxtXN1wo5bR/Ja26vNPB2JSITKKZzR8nT0nTg5qKW
 DhCLreqxAac06ocR75z3Xms/7R3GlJ1oQgCt5o3FcgnaPAuh33sMyFzNvBFwSLovu5Js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lwkRF6LjufLDtInGagjRztGTIyEyT/j/RurydVEpo88=; b=e4ZlfHHGfuQs2Cw/t+CwphdV59
 2aXXu7MZBIbOOWb7IBLdNhkDUV/xZHemL2xhTwlQx7KZNFOsAXIqowlpUXOwgGcJ/HYYRN/3KqIh8
 jGx5OHOrlCd9DVpXOPXt+YLf2ZKTuPKYFjw2qmJafr85Ow/0ZUCwqPnwxk5S00Wkp04M=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGXsB-009IKW-KB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 02:01:32 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dpk3C65zWz16Dpp;
 Mon,  1 Mar 2021 09:59:35 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 1 Mar 2021
 10:01:13 +0800
To: Huang Jianan <huangjianan@oppo.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210227120231.136559-1-huangjianan@oppo.com>
 <20210227120231.136559-2-huangjianan@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <aa06822f-89eb-19ca-674b-929273bd3717@huawei.com>
Date: Mon, 1 Mar 2021 10:01:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210227120231.136559-2-huangjianan@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lGXsB-009IKW-KB
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: fix last_lblock check in
 check_swap_activate_fast
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
Cc: zhangshiming@oppo.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/27 20:02, Huang Jianan via Linux-f2fs-devel wrote:
> Because page_no < sis->max guarantees that the while loop break out
> normally, the wrong check contidion here doesn't cause a problem.
> 
> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> ---
>   fs/f2fs/data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a1498a1a345c..4dbc1cafc55d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3804,7 +3804,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   	last_lblock = bytes_to_blks(inode, i_size_read(inode));
>   	len = i_size_read(inode);
>   
> -	while (cur_lblock <= last_lblock && cur_lblock < sis->max) {
> +	while (cur_lblock + 1 <= last_lblock && cur_lblock < sis->max) {

while (cur_lblock < last_lblock && cur_lblock < sis->max) {

It's nitpick, if necessary, I guess Jaegeuk could help to change this
while merging.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>   		struct f2fs_map_blocks map;
>   		pgoff_t next_pgofs;
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
