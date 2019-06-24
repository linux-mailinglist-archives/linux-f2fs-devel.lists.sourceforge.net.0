Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6014FE94
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2019 03:46:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfE4F-0008Vr-2W; Mon, 24 Jun 2019 01:46:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hfE47-0008VE-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jun 2019 01:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4cX92e1S8mSnk2mXxZjV+4uPrzuRsHvmP4pc6SM7hZw=; b=UueIACNRNDKqbuOl+6hMTzCgzK
 3gqHaWrs62aQpbKcoPXYpsXH/UpwDhuVvddoykj2AHEinG1upff9DzOhTElyp41IOvI+OD/Djl3nV
 ouFcjWakN2TQdV2zw3KoycVnHFCl2P5qYtUi6MpHZgfAnd5ZTuuwbTxJVBt+s9c8D/LM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4cX92e1S8mSnk2mXxZjV+4uPrzuRsHvmP4pc6SM7hZw=; b=h2ennsQwkJ0isi2puZP20lzYQU
 vXmKHC+TgJ02AA3uZCL/2Ioe65W9UZM0bhCmtiGJdmA10Tnr1r7EMqOxQeV/2E+G7GtodenW4JnOb
 ytOBOi0wo8BxWRPxee4F82eFJoEF4bmNkunDGtObj7JCDNUDvb6hrrrSrKI+wXcawOo4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfE45-0078do-5o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jun 2019 01:46:39 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E68BE3218E86D03620B8;
 Mon, 24 Jun 2019 09:46:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 24 Jun
 2019 09:46:26 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190621180124.82842-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <622f5e04-3781-d49a-d65d-a7c244389cb3@huawei.com>
Date: Mon, 24 Jun 2019 09:46:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190621180124.82842-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hfE45-0078do-5o
Subject: Re: [f2fs-dev] [PATCH] f2fs: add wsync_mode for sysfs entry
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/22 2:01, Jaegeuk Kim wrote:
> From: Jaegeuk Kim <jaegeuk@google.com>
> 
> This add one sysfs entry to control REQ_SYNC/REQ_BACKGROUND for write bios
> for data page writes.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
>  Documentation/filesystems/f2fs.txt      |  4 ++++
>  fs/f2fs/data.c                          |  3 +--
>  fs/f2fs/f2fs.h                          | 12 ++++++++++++
>  fs/f2fs/sysfs.c                         |  2 ++
>  5 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index dca326e0ee3e..d3eca3eb3214 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -251,3 +251,10 @@ Description:
>  		If checkpoint=disable, it displays the number of blocks that are unusable.
>                  If checkpoint=enable it displays the enumber of blocks that would be unusable
>                  if checkpoint=disable were to be set.
> +
> +What:		/sys/fs/f2fs/<disk>/wsync_mode
> +Date		June 2019
> +Contact:	"Jaegeuk Kim" <jaegeuk.kim@kernel.org>

jaegeuk@kernel.org ?

> +Description:
> +		0 gives no change. 1 assigns all the data writes with REQ_SYNC.
> +                2 does REQ_BACKGROUND instead.
> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> index bebd1be3ba49..81c529801a88 100644
> --- a/Documentation/filesystems/f2fs.txt
> +++ b/Documentation/filesystems/f2fs.txt
> @@ -413,6 +413,10 @@ Files in /sys/fs/f2fs/<devname>
>                                that would be unusable if checkpoint=disable were
>                                to be set.
>  
> + wsync_mode                   0 is by default. 1 gives REQ_SYNC for all the data
> +                              writes. 2 gives REQ_BACKGROUND for all. This can
> +                              used for the performance tuning purpose.

It looks so hacking. :P

Could you please explain more about this idea, I'm confused in which scenario it
can improve performance.

Thanks,

> +
>  ================================================================================
>  USAGE
>  ================================================================================
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f4e1672bd96e..18c73a1fdef3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -9,7 +9,6 @@
>  #include <linux/f2fs_fs.h>
>  #include <linux/buffer_head.h>
>  #include <linux/mpage.h>
> -#include <linux/writeback.h>
>  #include <linux/backing-dev.h>
>  #include <linux/pagevec.h>
>  #include <linux/blkdev.h>
> @@ -2021,7 +2020,7 @@ static int __write_data_page(struct page *page, bool *submitted,
>  		.ino = inode->i_ino,
>  		.type = DATA,
>  		.op = REQ_OP_WRITE,
> -		.op_flags = wbc_to_write_flags(wbc),
> +		.op_flags = f2fs_wbc_to_write_flags(sbi, wbc),
>  		.old_blkaddr = NULL_ADDR,
>  		.page = page,
>  		.encrypted_page = NULL,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2be2b16573c3..1cc46a6dc340 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/page-flags.h>
>  #include <linux/buffer_head.h>
> +#include <linux/writeback.h>
>  #include <linux/slab.h>
>  #include <linux/crc32.h>
>  #include <linux/magic.h>
> @@ -1264,6 +1265,7 @@ struct f2fs_sb_info {
>  
>  	/* writeback control */
>  	atomic_t wb_sync_req[META];	/* count # of WB_SYNC threads */
> +	int wsync_mode;			/* write mode */
>  
>  	/* valid inode count */
>  	struct percpu_counter total_valid_inode_count;
> @@ -3631,6 +3633,16 @@ static inline void set_opt_mode(struct f2fs_sb_info *sbi, unsigned int mt)
>  	}
>  }
>  
> +static inline int f2fs_wbc_to_write_flags(struct f2fs_sb_info *sbi,
> +				struct writeback_control *wbc)
> +{
> +	if (sbi->wsync_mode == 1)
> +		return REQ_SYNC;
> +	if (sbi->wsync_mode == 2)
> +		return REQ_BACKGROUND;
> +	return wbc_to_write_flags(wbc);
> +}
> +
>  static inline bool f2fs_may_encrypt(struct inode *inode)
>  {
>  #ifdef CONFIG_FS_ENCRYPTION
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 3aeacd0aacfd..e3c164d921a1 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -455,6 +455,7 @@ F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
>  F2FS_GENERAL_RO_ATTR(features);
>  F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
>  F2FS_GENERAL_RO_ATTR(unusable);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, wsync_mode, wsync_mode);
>  
>  #ifdef CONFIG_FS_ENCRYPTION
>  F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
> @@ -515,6 +516,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(features),
>  	ATTR_LIST(reserved_blocks),
>  	ATTR_LIST(current_reserved_blocks),
> +	ATTR_LIST(wsync_mode),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
