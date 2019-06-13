Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C0B432F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 08:36:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbJLf-0000vl-QX; Thu, 13 Jun 2019 06:36:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbJLd-0000vN-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=toWxvNBGIZaylSW9S2dc4ZotjdvtCWaL+4KGqBzUWBE=; b=QloVbhfIKnKl+8teYkFs45sQ8p
 RsogCZ1MkS6/Xtv8zbWTlbk4dBTERXiaUVaR+rXDOgE8MIcFEyGVgiPAzQ/yPbX6gCipvGLpOa68v
 BazVHOgEl2xFx5bV4AzVoSQoiitN0UQZC655GEzLarkrXxuAmm4XX/oQfWrEjhIBnXGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=toWxvNBGIZaylSW9S2dc4ZotjdvtCWaL+4KGqBzUWBE=; b=VNKKBMBRbU08ZfvuAWrufc0mUD
 lAmftOKmtooPx6AvYjzYR3jHXlNy7jliTvSUF8/8qFcjlQCK1/MGBVugX1wZLWCsU2EWNBZ4aQZbs
 ar7Q003fhDipgL/RuP7N/0N+2pRNW2KkRr6i8uijxe6/YHaXvupEVlLS8c0n5aBPd3mY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbJLb-00BZpz-52
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:36:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 73DA9B6D9CABCE71E365;
 Thu, 13 Jun 2019 14:36:23 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 13 Jun
 2019 14:36:22 +0800
To: Wang Shilong <wangshilong1991@gmail.com>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
 <1559795545-17290-2-git-send-email-wshilong1991@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <73fb9e88-d3f5-9420-d6d8-82ff4354e4d6@huawei.com>
Date: Thu, 13 Jun 2019 14:36:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1559795545-17290-2-git-send-email-wshilong1991@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbJLb-00BZpz-52
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: only set project inherit bit for
 directory
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
Cc: Andreas Dilger <adilger@dilger.ca>, Wang Shilong <wshilong@ddn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/6 12:32, Wang Shilong wrote:
> From: Wang Shilong <wshilong@ddn.com>
> 
> It doesn't make any sense to have project inherit bits
> for regular files, even though this won't cause any
> problem, but it is better fix this.
> 
> Cc: Andreas Dilger <adilger@dilger.ca>
> Signed-off-by: Wang Shilong <wshilong@ddn.com>
> ---
>  fs/f2fs/f2fs.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 06b89a9862ab..f02ebecb68ea 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2370,7 +2370,8 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  			   F2FS_PROJINHERIT_FL)
>  
>  /* Flags that are appropriate for regular files (all but dir-specific ones). */
> -#define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL))
> +#define F2FS_REG_FLMASK 	(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL |\
> +				   F2FS_PROJINHERIT_FL))

Hi Shilong,

Could you please add below diff as ext4 did?

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index efdafa886510..295ca5ed42d9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1759,6 +1759,9 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned
long arg)

 	fsflags &= F2FS_GETTABLE_FS_FL;

+	if (S_ISREG(inode->i_mode))
+		fsflags &= ~FS_PROJINHERIT_FL;
+
 	return put_user(fsflags, (int __user *)arg);
 }

Thanks,

>  
>  /* Flags that are appropriate for non-directories/regular files. */
>  #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
