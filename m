Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16B20C56F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 04:36:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpNAn-0005gq-1e; Sun, 28 Jun 2020 02:36:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpNAk-0005gb-TC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABWCs4IV8ComMsnAcjUX5giVH2vd/VhM2/vXpjkQhCQ=; b=hIsoMHAsb/ocGnGc/IXHIXBVUk
 c2zFt1DPrFPC5lEqDanPofKBMSoVPxnJIN/rSUDW5/pqJBhVnRGD2MSO51N2QsEBH5qPzJ/2JIirI
 FMbPsSOe+ugV0uTtoP55W9zHNMaaUlVTa2pWf6PkaLdZ7pFMjzU4Sthwi6HrGx4jNXjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABWCs4IV8ComMsnAcjUX5giVH2vd/VhM2/vXpjkQhCQ=; b=k37t7hyoHDgQYF9609jFTzlm8H
 vFuOSIbcuyDxmtx73txbGherKDKYiOo7/VSrtC6kcxTFq68CP02sX7vjtPLCflKXI3W5/pErZaYt3
 ZfpDb4F9XRj1q/haQZuGKXeAVs4OBTWlv7ckpNM/arTJrAuk0ieVo4Z0EldOij8y6fqA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpNAi-0037qG-Q5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:35:58 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9B1649CC2879B92F08CD;
 Sun, 28 Jun 2020 10:35:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 10:35:27 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <368cf853-0411-c237-f0ad-481f78a1eef3@huawei.com>
Date: Sun, 28 Jun 2020 10:35:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200624012148.180050-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpNAi-0037qG-Q5
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid readahead race condition
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

On 2020/6/24 9:21, Jaegeuk Kim wrote:
> If two readahead threads having same offset enter in readpages, every read
> IOs are split and issued to the disk which giving lower bandwidth.
> 
> This patch tries to avoid redundant readahead calls.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c  | 15 +++++++++++++++
>  fs/f2fs/f2fs.h  |  1 +
>  fs/f2fs/super.c |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index dfd3225153570..1886d83bc5f15 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2292,6 +2292,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
> +	bool drop_ra = false;
>  
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
> @@ -2302,6 +2303,17 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> +	/*
> +	 * Two readahead threads for same address range can cause race condition
> +	 * which fragments sequential read IOs. So let's avoid each other.
> +	 */
> +	if (rac && readahead_count(rac)) {
> +		if (F2FS_I(inode)->ra_offset == readahead_index(rac))
> +			drop_ra = true;

I guess you missed to return at somewhere when drop_ra is true?

thanks,

> +		else
> +			F2FS_I(inode)->ra_offset = readahead_index(rac);
> +	}
> +
>  	for (; nr_pages; nr_pages--) {
>  		if (rac) {
>  			page = readahead_page(rac);
> @@ -2368,6 +2380,9 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	}
>  	if (bio)
>  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
> +
> +	if (rac && readahead_count(rac) && !drop_ra)
> +		F2FS_I(inode)->ra_offset = -1;
>  	return ret;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7fb2a1a334388..753782426feac 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -809,6 +809,7 @@ struct f2fs_inode_info {
>  	struct list_head inmem_pages;	/* inmemory pages managed by f2fs */
>  	struct task_struct *inmem_task;	/* store inmemory task */
>  	struct mutex inmem_lock;	/* lock for inmemory pages */
> +	pgoff_t ra_offset;		/* ongoing readahead offset */
>  	struct extent_tree *extent_tree;	/* cached extent_tree entry */
>  
>  	/* avoid racing between foreground op and gc */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 7326522057378..80cb7cd358f84 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1015,6 +1015,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>  	/* Will be used by directory only */
>  	fi->i_dir_level = F2FS_SB(sb)->dir_level;
>  
> +	fi->ra_offset = -1;
> +
>  	return &fi->vfs_inode;
>  }
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
