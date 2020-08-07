Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA1B23E5BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Aug 2020 04:11:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k3rrG-0001Wi-8F; Fri, 07 Aug 2020 02:11:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k3rrE-0001WX-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 02:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CbJf+XZuvAId6uHZgKXJ68UcAvvGfq3Vh65G5VXpPZM=; b=eKk4yLRxJzGINKVqnaH0ssbcGJ
 fo42RrOxRr3u6M4kr8GJQwqc7zJuFF6bEsN/4xhwz+rtHrHU0lhou/JYGVG1OIAxTAuBtCEWumKWo
 98Vz0ikC1eX7rkfiM1qRlkzR2uYGHGGIAmxwWjfvggWOxgKICz0l8MXt3xxkdT1kIQxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CbJf+XZuvAId6uHZgKXJ68UcAvvGfq3Vh65G5VXpPZM=; b=g/oQrKqdWOXib66zpkjlEfcXMq
 aia7cY3XvhksBaK1S96tbUsoIx4f1uU8oET+rKHloRvKwjMc0RwgyTyjMv2aCDrb2XqY1xJ/xlSxv
 oGOv3NJlugLAmkJR8A0IXmuA4BNCmzzqE0t3udREkDqSAXoQ/wwnvZkOWyfQuoZI453U=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k3rrC-00F8tk-7y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 02:11:44 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 66EEC3AA4F0D1AE01613;
 Fri,  7 Aug 2020 10:11:24 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 7 Aug 2020
 10:11:23 +0800
To: Liu Song <fishland@aliyun.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20200806150317.34618-1-fishland@aliyun.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ea87263e-57d9-7521-6094-9aa7e1796f07@huawei.com>
Date: Fri, 7 Aug 2020 10:11:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200806150317.34618-1-fishland@aliyun.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k3rrC-00F8tk-7y
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary judgment in
 f2fs_drop_inode
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
Cc: linux-f2fs-devel@lists.sourceforge.net, liu.song11@zte.com.cn,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/6 23:03, Liu Song via Linux-f2fs-devel wrote:
> From: Liu Song <liu.song11@zte.com.cn>
> 
> Inode hash has been removed in "make_bad_inode". If inode_unhashed
> is false, it must not be a bad inode.
> 
> Signed-off-by: Liu Song <liu.song11@zte.com.cn>
> ---
>   fs/f2fs/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 20e56b0fa46a..ee01d15effe3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1043,7 +1043,7 @@ static int f2fs_drop_inode(struct inode *inode)
>   	 *       - inode_wait_for_writeback(inode)
>   	 */
>   	if ((!inode_unhashed(inode) && inode->i_state & I_SYNC)) {

Since logic of "bad inode should be removed from hash" is not controlled by
f2fs, so let's add below condition to make sure the rule of vfs is as it is.

f2fs_bug_on(sbi, is_bad_inode(inode));

> -		if (!inode->i_nlink && !is_bad_inode(inode)) {
> +		if (!inode->i_nlink) {
>   			/* to avoid evict_inode call simultaneously */
>   			atomic_inc(&inode->i_count);
>   			spin_unlock(&inode->i_lock);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
