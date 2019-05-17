Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6121256
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2019 04:56:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hRT31-0005nf-HN; Fri, 17 May 2019 02:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1hRT30-0005nY-JC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 May 2019 02:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4HJiSDZ6NVpZlfpbAIE9JY9i5H7mtH87panNL0CH9Zw=; b=Nkels2DimQ7ZcavZYXPBQVCb+o
 gNHEUl5ZbqO+YgSfUBRYZVtmOg87T1CLxbGaLkPU9tLVXgtgQFYaxSlx8Lc2g8Fe2F6+axQ4R0azR
 YzUEuv6NJR2JS0EG3RSAU/GUEeZp0HKWdspvs1QSK8X3eRvu9hqe5JZ+nVancMwcUbEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4HJiSDZ6NVpZlfpbAIE9JY9i5H7mtH87panNL0CH9Zw=; b=bRwGHmtiJGbnmKYggiQTmLjybG
 e+9fT3L0GC+etZpXWWTgHKHzEaHM2HyD/6Aj8ynFeTRyBwUmPu21f0ZnmRm1C5SAysND/Ji/okfF1
 dy5o9eKmuzS796twISjjyES9/garYvNpK4Mi9jYoCG/isk+8XRR9bpKZMQTfwchj8z0s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hRT2y-0079St-J5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 May 2019 02:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4HJiSDZ6NVpZlfpbAIE9JY9i5H7mtH87panNL0CH9Zw=; b=joMy3UdnsiCdt1hoeX13+Vv6h
 LAb/YlelQoJg7XbXDsVeak+AK5oiHXrplz9aGnkr5ikxMvftHA1d864zkhZUa7INRGljf3cop5faP
 6eLUOQWenVHaZqNYk0FpGvaRzfthCKI//0n63yuNpBVSwQwrM04ognUMtqpwrowWlHP+EzWZwHDQt
 VYLFo+QzkJp2hyaqrNyEOSkbuF0RdzAkrqLZgtTOJ4MZDZ6aoUA2pHNk19c5b4bJGIndt+0aPROMw
 uUW5VNR1jtv2m7Vn1ceu8dz9MH/ntT9SeaaiPZaWC+wuizEVbbi/1JlJe5AbV4fOkY5Uv5mVOejYj
 O/LWOHXmw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hRT2q-000080-Sj; Fri, 17 May 2019 02:56:28 +0000
Date: Thu, 16 May 2019 19:56:28 -0700
From: Matthew Wilcox <willy@infradead.org>
To: sunqiuyang <sunqiuyang@huawei.com>
Message-ID: <20190517025628.GF31704@bombadil.infradead.org>
References: <20190517021647.43083-1-sunqiuyang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517021647.43083-1-sunqiuyang@huawei.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hRT2y-0079St-J5
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 fangwei1@huawei.com, linux-fsdevel@vger.kernel.org, miaoxie@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 17, 2019 at 10:16:47AM +0800, sunqiuyang wrote:
> +++ b/fs/f2fs/f2fs.h
> @@ -423,6 +423,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  #define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
>  #define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
>  #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
> +#define F2FS_IOC_SHRINK_RESIZE		_IOW(F2FS_IOCTL_MAGIC, 16,	\
> +						struct f2fs_resize_param)

Why not match ext4?

fs/ext4/ext4.h:#define EXT4_IOC_RESIZE_FS               _IOW('f', 16, __u64)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
