Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2859A0F4D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 18:07:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t16Ym-0004jo-2f;
	Wed, 16 Oct 2024 16:07:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t16Yj-0004jf-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 16:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDJhDncuHcLXUNU0lNcTmfEgpUwgJsRKa9BPliSjxzU=; b=abCxJdXwR2kSk1M2++IRKCCwPw
 3FIY2yfLe8qMMixuWRyqnTt1HK+kijZG4a27vO6mcci5sHoQxZ/UaueDAppHmaaI2qVTAaaS8Sy8V
 rPc/pOM38BN7RsRihe4hoOudE07su6YYWCPbG2JV4Rve5Eb4UgF26j2w6C7ZZ5s4Zd+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uDJhDncuHcLXUNU0lNcTmfEgpUwgJsRKa9BPliSjxzU=; b=TcGK9iocMFNyKEYnw45V5EJnwR
 cinHkB64HKK7GWH3j5Ssg3bp5OExHVcSyJjabJb5lBiLlo2hmtNC1zbPwd6f8Uv8TQ6G6TIoAlfUc
 9Xr/bFzSJOoH40uVQnRCacVMfo1kXSfg2gCGk9PctMRt3BZXtEgTSOFnpY2OLAYW1d1M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t16Yi-0007fG-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 16:07:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC1D75C5A1E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Oct 2024 16:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C9C4CEC5;
 Wed, 16 Oct 2024 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729094845;
 bh=+Dua7Z0GJyzlQBV+rd2Hbe6TGrUQcvL/edukW/JnAzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kRjC+ivnzJyeNxqZzYEK3W1UZPmK6LvTscyPiuMkafdtHM6wH7Y+9txDLo+rHMpe4
 +KI3cjvKKuRXhTVa4Pc2avzpSXXUmj9fwD5twM0rMeXOlPHJ1/FLD0meLEpUsYr+MQ
 B7hY4gw486vmAuMbiQrRR3PtgMmUDEQ0UF/CKKyAQbK+rbSRK0/YEPhv+GU9Wg7iST
 BPENyegB/4wsfZa0RW8Rt6jNnuUdbiNAtVksdQcqscyPfxHrqdC0YJG6K59lniw/HT
 uiR6cik+DpAnSB0PLagz3pHXTiBGg2gT2MtkZIgKWOg7LonJV0XkekVaJ2UdqIpzIV
 9FdeeGRTA7Y2g==
Date: Wed, 16 Oct 2024 16:07:24 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Zw_kvFpU53626D90@google.com>
References: <20241016082038.607358-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016082038.607358-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/16, Chao Yu wrote: > In __get_segment_type(),
 __get_segment_type_6()
 may return > CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC log type, but
 > following f2fs_get_segment_temp() can only handl [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t16Yi-0007fG-H7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to parse temperature correctly in
 f2fs_get_segment_temp()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/16, Chao Yu wrote:
> In __get_segment_type(), __get_segment_type_6() may return
> CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC log type, but
> following f2fs_get_segment_temp() can only handle persistent
> log type, fix it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h    |  5 +++--
>  fs/f2fs/file.c    |  4 ++--
>  fs/f2fs/segment.c | 33 +++++++++++++++++++++++++--------
>  fs/f2fs/segment.h |  4 ----
>  4 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ce00cb546f4a..bda61d7ca8dd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1019,7 +1019,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
>  #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
>  #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
>  
> -enum {
> +enum log_type {
>  	CURSEG_HOT_DATA	= 0,	/* directory entry blocks */
>  	CURSEG_WARM_DATA,	/* data blocks */
>  	CURSEG_COLD_DATA,	/* multimedia or GCed data blocks */
> @@ -3758,7 +3758,8 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>  			block_t old_addr, block_t new_addr,
>  			unsigned char version, bool recover_curseg,
>  			bool recover_newaddr);
> -int f2fs_get_segment_temp(int seg_type);
> +enum temp_type f2fs_get_segment_temp(struct f2fs_sb_info *sbi,
> +						enum log_type seg_type);
>  int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  			block_t old_blkaddr, block_t *new_blkaddr,
>  			struct f2fs_summary *sum, int type,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 0e07231dc093..92d7c62eba29 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4858,8 +4858,8 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>  {
>  	struct inode *inode = iter->inode;
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int seg_type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
> -	enum temp_type temp = f2fs_get_segment_temp(seg_type);
> +	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
> +	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>  
>  	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>  	submit_bio(bio);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 859d70bbc5e7..3ed689157891 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3582,18 +3582,35 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  	}
>  }
>  
> -int f2fs_get_segment_temp(int seg_type)
> +enum temp_type f2fs_get_segment_temp(struct f2fs_sb_info *sbi,
> +						enum log_type type)
>  {
> -	if (IS_HOT(seg_type))
> -		return HOT;
> -	else if (IS_WARM(seg_type))
> -		return WARM;
> -	return COLD;
> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> +	enum temp_type temp;

To avoid static compilier complaint:

error: variable 'temp' is used uninitialized whenever switch default is taken

let's assign one.

	enum temp_type temp = COLD;

> +
> +	switch (curseg->seg_type) {
> +	case CURSEG_HOT_NODE:
> +	case CURSEG_HOT_DATA:
> +		temp = HOT;
> +		break;
> +	case CURSEG_WARM_NODE:
> +	case CURSEG_WARM_DATA:
> +		temp = WARM;
> +		break;
> +	case CURSEG_COLD_NODE:
> +	case CURSEG_COLD_DATA:
> +		temp = COLD;
> +		break;
> +	default:
> +		f2fs_bug_on(sbi, 1);
> +	}
> +
> +	return temp;
>  }
>  
>  static int __get_segment_type(struct f2fs_io_info *fio)
>  {
> -	int type = 0;
> +	enum log_type type;
>  
>  	switch (F2FS_OPTION(fio->sbi).active_logs) {
>  	case 2:
> @@ -3609,7 +3626,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>  		f2fs_bug_on(fio->sbi, true);
>  	}
>  
> -	fio->temp = f2fs_get_segment_temp(type);
> +	fio->temp = f2fs_get_segment_temp(fio->sbi, type);
>  
>  	return type;
>  }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 55a01da6c4be..6a23bb1d16a2 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -34,10 +34,6 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  	f2fs_bug_on(sbi, seg_type >= NR_PERSISTENT_LOG);
>  }
>  
> -#define IS_HOT(t)	((t) == CURSEG_HOT_NODE || (t) == CURSEG_HOT_DATA)
> -#define IS_WARM(t)	((t) == CURSEG_WARM_NODE || (t) == CURSEG_WARM_DATA)
> -#define IS_COLD(t)	((t) == CURSEG_COLD_NODE || (t) == CURSEG_COLD_DATA)
> -
>  #define IS_CURSEG(sbi, seg)						\
>  	(((seg) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno) ||	\
>  	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_DATA)->segno) ||	\
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
