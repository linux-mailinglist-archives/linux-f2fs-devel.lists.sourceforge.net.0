Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4036C62A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 14:37:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbMyA-000607-J2; Tue, 27 Apr 2021 12:37:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lbMy8-0005zf-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 12:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8vnEyoEoKVrtBNzfXJ2+Nuh0t+jR78fXSXOuYWlvXWc=; b=dSugPFg5OJ00c8YVn+ky1xDDFd
 WoNsnB9jrZIg3j35h3O5DBYqMz7MQlMkiN9QSMI5b76dThMZqt+5799Tk1JQq0h5oHxRcMCaBUrXk
 6Ko8HP4KVXllgUwMFApcVPxOVKitsmlrTsJSuVBB3hLD8EOJ3ZxXJyciwRqFIx9iO/fA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8vnEyoEoKVrtBNzfXJ2+Nuh0t+jR78fXSXOuYWlvXWc=; b=Et/an3fwaHignyRzqUIfLe8UvH
 ao+ewBdwzdd6vkWh7GFJDQO7jkS93Gb64znO602yd6lDQWn7lWHdiM00C2nC2WKESFwDn/chf8Gg3
 biXBXi158w1ZYBAiXBX6/qLkGLbAK5FCzrrGdn5Gm62FJ+gJLLcWGGwtbVIYAp/Oz0cU=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbMy1-0006ns-6W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 12:37:36 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FV1S64fNPzYbXh;
 Tue, 27 Apr 2021 20:35:02 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 20:37:18 +0800
To: Yangtao Li <frank.li@vivo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20210427082106.2755-1-frank.li@vivo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <12ae52df-bc5e-82c3-4f78-1eafe7723f93@huawei.com>
Date: Tue, 27 Apr 2021 20:37:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210427082106.2755-1-frank.li@vivo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lbMy1-0006ns-6W
Subject: Re: [f2fs-dev] [PATCH] f2fs: reset free segment to prefree status
 when do_checkpoint() fail
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

On 2021/4/27 16:21, Yangtao Li wrote:
> When do_checkpoint() fails, the prefree bitmap is not cleared,
> but these segments are already in the free state. If these segments
> are used, the segments in use will be reset to the free state when
> f2fs_clear_prefree_segments is called next time.
> 
> So reset free segments to prefree status when do_checkpoint() fail
> to avoid this situation.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/checkpoint.c |  6 ++++--
>   fs/f2fs/f2fs.h       |  1 +
>   fs/f2fs/segment.c    | 13 +++++++++++++
>   fs/f2fs/segment.h    |  7 ++++++-
>   4 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index be5415a0dbbc..0200af4d02ef 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1647,10 +1647,12 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>   	f2fs_save_inmem_curseg(sbi);
>   
>   	err = do_checkpoint(sbi, cpc);
> -	if (err)
> +	if (err) {
>   		f2fs_release_discard_addrs(sbi);
> -	else
> +		f2fs_set_free_as_prefree_segments(sbi);
> +	} else {
>   		f2fs_clear_prefree_segments(sbi, cpc);
> +	}
>   
>   	f2fs_restore_inmem_curseg(sbi);
>   stop:
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e2d302ae3a46..1618e9a74e89 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3369,6 +3369,7 @@ bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
>   void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
>   void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
>   bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
> +void f2fs_set_free_as_prefree_segments(struct f2fs_sb_info *sbi);
>   void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   					struct cp_control *cpc);
>   void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c2866561263e..334e499a0f43 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1959,6 +1959,19 @@ static void set_prefree_as_free_segments(struct f2fs_sb_info *sbi)
>   	mutex_unlock(&dirty_i->seglist_lock);
>   }
>   
> +void f2fs_set_free_as_prefree_segments(struct f2fs_sb_info *sbi)
> +{
> +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> +	unsigned int segno;
> +
> +	mutex_lock(&dirty_i->seglist_lock);
> +	for_each_set_bit(segno, dirty_i->dirty_segmap[PRE], MAIN_SEGS(sbi)) {
> +		if (__set_test_and_inuse(sbi, segno))
> +			test_and_clear_bit(segno, dirty_i->dirty_segmap[PRE]);
> +	}
> +	mutex_unlock(&dirty_i->seglist_lock);
> +}
> +
>   void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   						struct cp_control *cpc)
>   {
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e9a7a637d688..5da8d1100b87 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -487,19 +487,24 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>   	spin_unlock(&free_i->segmap_lock);
>   }
>   
> -static inline void __set_test_and_inuse(struct f2fs_sb_info *sbi,
> +static inline bool __set_test_and_inuse(struct f2fs_sb_info *sbi,
>   		unsigned int segno)
>   {
>   	struct free_segmap_info *free_i = FREE_I(sbi);
>   	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	bool is_inuse = false;
>   
>   	spin_lock(&free_i->segmap_lock);
>   	if (!test_and_set_bit(segno, free_i->free_segmap)) {
>   		free_i->free_segments--;
>   		if (!test_and_set_bit(secno, free_i->free_secmap))

if (!IS_CURSEC(sbi, secno) &&
	!test_and_set_bit(secno, free_i->free_secmap))

I think just reverting dirty/free bitmap is not enough if checkpoint fails,
due to we have updated sbi->cur_cp_pack and nat/sit bitmap, next CP tries
to overwrite last valid meta/node/data, then filesystem will be corrupted.

So I suggest to set cp_error if do_checkpoint() fails until we can handle
all cases, which is not so easy.

How do you think?

Thanks,

>   			free_i->free_sections--;
> +	} else {
> +		is_inuse = true;
>   	}
>   	spin_unlock(&free_i->segmap_lock);
> +
> +	return is_inuse;
>   }
>   
>   static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
