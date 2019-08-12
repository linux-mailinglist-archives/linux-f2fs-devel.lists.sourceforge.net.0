Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A108489E0E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 14:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hx9OV-00062A-01; Mon, 12 Aug 2019 12:25:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hx9OT-00061x-TK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 12:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v9h8zDmXRL44PP4nNb5ec9pUhUy19aNCbVN0jo3tJOA=; b=PySkAC7nMrifsEy6DrK0H4KkME
 DF6qIjJTNiFzgepV+Z9I7yDNIKVFg2BQyFcqj07K9MHRRBXJ1hG4PpJybrN09+QgpoiVA7z4ohmff
 EF9YThUVmsHCOI208voKye81HEZmw0y/zz9Xs0HchOPZONGgxlzxVzCmhYSXn6Y27tJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v9h8zDmXRL44PP4nNb5ec9pUhUy19aNCbVN0jo3tJOA=; b=RwT9K97abOGDCZWfn9deUMOXdO
 iRHsT2kokdUTRs7fRltQihUPEe1BjzxlkGtPcuCZ+o2rsbzUo1vIN8DN8cFu+FUpL70s5VCp3Vil/
 mkWQKYnz1j00mb09NULafe0SRDJg1RDfPFfCRzpnhRDLvW7umlgFrZ0WDyc4KKkJcj7o=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hx9OR-000eH1-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 12:25:45 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 270DCE2238499EAB75AB;
 Mon, 12 Aug 2019 20:25:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 12 Aug
 2019 20:25:32 +0800
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
 <20190811213557.1970-4-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e5d57ee4-f022-12ca-7f09-e4b8ef86c6b6@huawei.com>
Date: Mon, 12 Aug 2019 20:25:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190811213557.1970-4-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hx9OR-000eH1-Tn
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: skip truncate when verity in
 progress in ->write_begin()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On 2019/8/12 5:35, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When an error (e.g. ENOSPC) occurs during f2fs_write_begin() when called
> from f2fs_write_merkle_tree_block(), skip truncating the file.  i_size
> is not meaningful in this case, and the truncation is handled by
> f2fs_end_enable_verity() instead.
> 
> Fixes: 60d7bf0f790f ("f2fs: add fs-verity support")
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3f525f8a3a5fa..00b03fb87bd9b 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2476,7 +2476,7 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
>  	struct inode *inode = mapping->host;
>  	loff_t i_size = i_size_read(inode);
>  
> -	if (to > i_size) {

Maybe adding one single line comment to mention that it's redundant/unnecessary
truncation here is better, if I didn't misunderstand this.

Thanks,

> +	if (to > i_size && !f2fs_verity_in_progress(inode)) {
>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		down_write(&F2FS_I(inode)->i_mmap_sem);
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
