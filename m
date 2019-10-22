Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D5E0093
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 11:22:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMqMZ-000263-W6; Tue, 22 Oct 2019 09:21:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMqMY-00025w-JU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6TkHx/cFapXI5hFU+Kl0bgomjEtNiJ30G+evdapSdA=; b=E13/kNg0JU2TnIa+POKqUVy++l
 7P3vcZ+/jRpF3J+YX0G0N22qIT3ESy4Ps5wDP2wg7XBiH/MiUWomYnBaGuTqcbK2SJX4nttjPEEW5
 JDJZt1Vmisnvj6nYN42HWWCEzWKN8iwWKEOzVObiyFIafA8CPQQ8KwTXu0TcbiDPEeRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G6TkHx/cFapXI5hFU+Kl0bgomjEtNiJ30G+evdapSdA=; b=IWjT0WkbnO15qgK32lnxwJyg/V
 M5o609JKO7CtpuM8GfLwwUqyZAzk0LAqEK569pWCnJJEABu8V66UOO/uBz6b8Fgnen5yC4OvGIRHz
 fFNfjM8rlIDW+6iuwTT+djd8yb1Pj3rnM1tFcmjco29o5dHT/J9tOdKlHr2jFXpfzQ0c=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMqMW-00GbDQ-Pw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:21:58 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7D60C132DF8241015E0E;
 Tue, 22 Oct 2019 17:21:49 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 17:21:43 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-7-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f6b0b9f6-6cfb-fdcd-032a-dc2bcd7304ae@huawei.com>
Date: Tue, 22 Oct 2019 17:21:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191018063740.2746-7-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iMqMW-00GbDQ-Pw
Subject: Re: [f2fs-dev] [PATCH v5 6/8] fsck: Check fsync data always for
 zoned block devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
> Fsck checks fsync data when UMOUNT flag is not set. When the f2fs was not
> cleanly unmouted, UMOUNT flag is not recorded in meta data and fsync data
> can be left in the f2fs. The first fsck run checks fsync data to reflect
> it on quota status recovery. After that, fsck writes UMOUNT flag in the
> f2fs meta data so that second fsck run can skip fsync data check.

Oh, IMO, we need that flag to let fsck know there is still fsynced data in the
image, could we just leave it as it is?

To Jaegeuk, thoughts?

Thanks,

> 
> However, fsck for zoned block devices need to care fsync data for all
> fsck runs. The first fsck run checks fsync data, then fsck can check
> write pointer consistency with fsync data. However, since second fsck run
> does not check fsync data, fsck detects write pointer at fsync data end
> is not consistent with f2fs meta data. This results in meta data update
> by fsck and fsync data gets lost.
> 
> To have fsck check fsync data always for zoned block devices, introduce
> need_fsync_data_record() helper function which returns boolean to tell
> if fsck needs fsync data check or not. For zoned block devices, always
> return true. Otherwise, return true if UMOUNT flag is not set in CP.
> Replace UMOUNT flag check codes for fsync data with the function call.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.h    |  6 ++++++
>  fsck/mount.c   | 14 +++++++-------
>  fsck/segment.c |  2 +-
>  3 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 8da0ebb..75052d8 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -133,6 +133,12 @@ enum seg_type {
>  
>  struct selabel_handle;
>  
> +static inline bool need_fsync_data_record(struct f2fs_sb_info *sbi)
> +{
> +	return !is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG) ||
> +		c.zoned_model == F2FS_ZONED_HM;
> +}
> +
>  extern int fsck_chk_orphan_node(struct f2fs_sb_info *);
>  extern int fsck_chk_quota_node(struct f2fs_sb_info *);
>  extern int fsck_chk_quota_files(struct f2fs_sb_info *);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 915f487..2979865 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -1525,7 +1525,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
>  
>  	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
>  
> -	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
> +	if (need_fsync_data_record(sbi))
>  		bitmap_size += bitmap_size;
>  
>  	sit_i->bitmap = calloc(bitmap_size, 1);
> @@ -1540,7 +1540,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
>  		sit_i->sentries[start].cur_valid_map = bitmap;
>  		bitmap += SIT_VBLOCK_MAP_SIZE;
>  
> -		if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
> +		if (need_fsync_data_record(sbi)) {
>  			sit_i->sentries[start].ckpt_valid_map = bitmap;
>  			bitmap += SIT_VBLOCK_MAP_SIZE;
>  		}
> @@ -1887,7 +1887,7 @@ void seg_info_from_raw_sit(struct f2fs_sb_info *sbi, struct seg_entry *se,
>  {
>  	__seg_info_from_raw_sit(se, raw_sit);
>  
> -	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
> +	if (!need_fsync_data_record(sbi))
>  		return;
>  	se->ckpt_valid_blocks = se->valid_blocks;
>  	memcpy(se->ckpt_valid_map, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
> @@ -1903,7 +1903,7 @@ struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
>  
>  unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
>  {
> -	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
> +	if (!need_fsync_data_record(sbi))
>  		return se->valid_blocks;
>  	else
>  		return se->ckpt_valid_blocks;
> @@ -1911,7 +1911,7 @@ unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
>  
>  unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
>  {
> -	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
> +	if (!need_fsync_data_record(sbi))
>  		return se->cur_valid_map;
>  	else
>  		return se->ckpt_valid_map;
> @@ -1919,7 +1919,7 @@ unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
>  
>  unsigned char get_seg_type(struct f2fs_sb_info *sbi, struct seg_entry *se)
>  {
> -	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
> +	if (!need_fsync_data_record(sbi))
>  		return se->type;
>  	else
>  		return se->ckpt_type;
> @@ -3242,7 +3242,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>  	struct list_head inode_list = LIST_HEAD_INIT(inode_list);
>  	int ret;
>  
> -	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
> +	if (!need_fsync_data_record(sbi))
>  		return 0;
>  
>  	ret = find_fsync_inode(sbi, &inode_list);
> diff --git a/fsck/segment.c b/fsck/segment.c
> index ccde05f..17c42b7 100644
> --- a/fsck/segment.c
> +++ b/fsck/segment.c
> @@ -62,7 +62,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
>  	se->type = type;
>  	se->valid_blocks++;
>  	f2fs_set_bit(offset, (char *)se->cur_valid_map);
> -	if (!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
> +	if (need_fsync_data_record(sbi)) {
>  		se->ckpt_type = type;
>  		se->ckpt_valid_blocks++;
>  		f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
