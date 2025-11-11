Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54316C4B3C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 03:45:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvcI9CSzyFWEtCMAIGZyvNsKu2tvDB/VU4B2GV3Z9LU=; b=Gz9wGERO+QogBTz+dz3uKJBQEv
	2b3JnXX/ZPGe2WxADd83ZDjd/0za049MYozDgp14Ds6AYwm5yYu9JLUN3gdLD7Ez4yrxI9rwglK38
	BZ8Wy8N6CSLsdlTk5bK27g9Xp0pdLjzL0AqDNFi7HQvu1MM6fuWh2jHKRjgk1GYEjziU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIeNb-00041Y-EX;
	Tue, 11 Nov 2025 02:45:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vIeNa-00041K-3s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 02:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADXi46rhPtl2zKrXkKYDt/vvJ4wJ2S3QdPh5Lh3JrjI=; b=CK4yMq1rfRbUilzMqCm61mdFQz
 AZqT+9mdZKmbrXN/nJtZP12aVgUnPuHnl8PH/+HG8WLxjpbpRCC5FzAqNw8MdGMeb/OhiAftSWayN
 VNsn+cZnafpLberPcZmC15qFc+8GPgBVFBpx6UrIGiFtOJDSLBEBlmnMSf+4XtmHRlHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADXi46rhPtl2zKrXkKYDt/vvJ4wJ2S3QdPh5Lh3JrjI=; b=RX4AhF/9KM4x/aQIa7PUFvqQi/
 CQKDqwnRY4S8tv3KbSsCEDqd+lUsIbu4bPTgRAtqyoG1JWMxs76+dd8QXobTJqEt3eGO2GgEJ3TNn
 jxaFvbiUVc5wIZ91KxtIJQqdQhRGM4QBEdJ/H9y4atYxfh8e4l2EgMP2O5zUn5das0NI=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIeNa-0007VX-BB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 02:45:10 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b6ceb3b68eeso2321610a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 18:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762829100; x=1763433900; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ADXi46rhPtl2zKrXkKYDt/vvJ4wJ2S3QdPh5Lh3JrjI=;
 b=YV+tNGclbrtZ9j/EhbnEC26Z9f+QSAkhsR3fbCQ7Y4lNMD23+pxcsGBR2NOeVtAcAd
 uUIsrNClGUEHb3vHfNBNJPpzkyFgD3cvRCTDaEwWMBAn/yED+AlFjaCHDGNq5MjuDFbq
 LYp23DbA6gICI8fTgh5MTRNTYQKRFMhj8L59/Tq88uzT1Q7tzecI2QmvjDNPK4PdFLov
 IgbgrQjkCo07/4600SpQtuNdxzJXFgYdcY8AGLH4SO4vk+YA21CXTcC+RmQ/7+RMGmDc
 P8zFgN6Ke57iP3dRNna/Ec1hlAZ04gUSzLZVPR71nJgmx+pfbnJfKi5iiLVdBeaMEBkR
 Q0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762829100; x=1763433900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADXi46rhPtl2zKrXkKYDt/vvJ4wJ2S3QdPh5Lh3JrjI=;
 b=LE0qDdgJaLiVu+mt7tvlTVnEL/utTnDlWlvGMQ14Ud2QSfM7t/HCCbEyb6LVTYvoen
 UFcm+TxIf+65xSQ3C0COiRTdy9NSN7hrDVLzCd5Muyvn6tYiuIzAKHF2oMe+VlJLcoqs
 6Fe4LhB6vIu/j3kNnGmFqpsEI3vmQYXuM4MG9GSef+voZ7OkEy8PD9sm3cyeik4RSXQi
 fNZFojtKbL6hYjCBuKFA3iP4J/RHNdCTLLvnO1c4eMf/q4wP9QrZnY8jkwMh1oEsFyvF
 GSRA5bWBO6UwruZLuxAGOJRE4v9Iis7kiyzH0+G3H981oUNSl8arD1fWjmMtJBfZ4WuW
 0AbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEgn8OwNkTMnvgWZ86hVOsMyrUT2rBw9C2/jZODldHbHhEGPmeuP5tfKwn+PZLd7sPDjdOxp7zkPaZMdf90svX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxnaXiw4RKWWYNZ7QzhdYgKGy2f244Y5ROWqn1HzYg7CY515Mvp
 RQVxCznU5Lsm8B2cw4P2kmUHOGXXDa1PCjjuVFxWInv+YJPt5q3FSuR0
X-Gm-Gg: ASbGncsR02q6csFHoS6HyVGZkoYdnlf+vmUsYPS0672J1+kmkK37GtgTrwsXc6Fwp/w
 w8BOv22QNctY+3cuRQEpl8/ByCYLp/SO+QErsMaue3BHJJufKXbUvqPQZFg2D0YR/hMtsPs9UIA
 7K2Grg1vkUzIjzjTh2+xtsb2AH1OEl+7oMFsh5vXSYOCNWUO5W/ySDA1xj7vFwahr2gl0SrOn0f
 zuewZmbhdaTiZQOP1yfPeLQEOJoPp4W17DLIksBVZo/eal6h7SNhfy4m+u7M50vCTIvMkmTHVoS
 AYSdGW1Lz2xqThLV1OLQUYXSelmVTESBF5TSyy7mhcuDTu9y3NyvrooNOjSnNdpFInYfcafyA1n
 bocki3VfA6wax+rO9wA6uNccI2Y7lz5DOqU5pQ+6cvD+GBNMdKJWoNr7QsF30AwrrCGAVUHR8cY
 7t3Kmv08jVAVAJWZFF1NMJDCo=
X-Google-Smtp-Source: AGHT+IGn7q43rttlZ3nAPDGApmA7SUPOnoa1PNLBTcXnAm83frafkwx+aYxNLBM9B43r52WGh0kVhw==
X-Received: by 2002:a17:902:744c:b0:296:3f23:b909 with SMTP id
 d9443c01a7336-297e56c9e07mr105964695ad.39.1762829099546; 
 Mon, 10 Nov 2025 18:44:59 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bb57baf9905sm4764105a12.17.2025.11.10.18.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 18:44:59 -0800 (PST)
Message-ID: <3a787685-1765-4068-a8da-d595dd257b71@gmail.com>
Date: Tue, 11 Nov 2025 10:44:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251110132654.6485-1-hexiaole1994@126.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251110132654.6485-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 21:26, Xiaole He wrote: > When active_logs ==
 6, dentry blocks can be allocated to HOT, WARM, or > COLD segments based on
 various conditions in __get_segment_type_6(): > - age extent cache [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
X-Headers-End: 1vIeNa-0007VX-BB
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix has_curseg_enough_space to
 check all data segments for dentry blocks
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
Cc: jaegeuk@kernel.org, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10/25 21:26, Xiaole He wrote:
> When active_logs == 6, dentry blocks can be allocated to HOT, WARM, or
> COLD segments based on various conditions in __get_segment_type_6():
> - age extent cache (if enabled)
> - FI_HOT_DATA flag (set when dirty_pages <= min_hot_blocks)
> - rw_hint (defaults to WARM via f2fs_rw_hint_to_seg_type)
> - file_is_hot(), FI_NEED_IPU, f2fs_is_cow_file(), etc.
> 
> However, has_curseg_enough_space() only checked CURSEG_HOT_DATA segment
> for dentry blocks, which could lead to incorrect space calculation when
> dentry blocks are actually allocated to WARM or COLD segments.
> 
> Reproducer:
> Note: This reproducer requires adding a tracepoint to observe segment
> type. Add the following tracepoint to include/trace/events/f2fs.h:
> 
> TRACE_EVENT(f2fs_allocate_data_block,
>          TP_PROTO(struct f2fs_sb_info *sbi, struct inode *inode,
>                  enum log_type type, block_t blkaddr),
> 
>          TP_ARGS(sbi, inode, type, blkaddr),
> 
>          TP_STRUCT__entry(
>                  __field(dev_t, dev)
>                  __field(ino_t, ino)
>                  __field(int, type)
>                  __field(block_t, blkaddr)
>                  __field(int, is_dir)
>          ),
> 
>          TP_fast_assign(
>                  __entry->dev = sbi->sb->s_dev;
>                  __entry->ino = inode ? inode->i_ino : 0;
>                  __entry->type = type;
>                  __entry->blkaddr = blkaddr;
>                  __entry->is_dir = inode ? S_ISDIR(inode->i_mode) : 0;
>          ),
> 
>          TP_printk("dev = (%d,%d), ino = %lu, %s, blkaddr = %u, is_dir = %d",
>                  show_dev(__entry->dev),
>                  (unsigned long)__entry->ino,
>                  show_data_type(__entry->type),
>                  __entry->blkaddr,
>                  __entry->is_dir)
> );
> 
> And add the tracepoint call in fs/f2fs/segment.c in
> f2fs_allocate_data_block() function. Find the location after
> locate_dirty_segment() calls and before IS_DATASEG() check:
> 
> 	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
> 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
> 
> 	trace_f2fs_allocate_data_block(sbi, folio ? folio->mapping->host : NULL,
> 					type, *new_blkaddr);
> 
> 	if (IS_DATASEG(curseg->seg_type))
> 
> 1. Mount F2FS with active_logs=6 and age extent cache disabled:
>     # mkfs.f2fs -f /dev/sdb1
>     # mount -t f2fs -o active_logs=6 /dev/sdb1 /mnt/f2fs-test
> 
> 2. Enable tracing and f2fs_allocate_data_block tracepoint:
>     # echo 1 > /sys/kernel/debug/tracing/events/f2fs/f2fs_allocate_data_block/enable
>     # echo 1 > /sys/kernel/debug/tracing/tracing_on
>     # echo > /sys/kernel/debug/tracing/trace
> 
> 3. Create a directory and write enough files to trigger dirty_pages >
>     min_hot_blocks (default 16), which will clear FI_HOT_DATA flag:
>     # mkdir /mnt/f2fs-test/testdir
>     # cd /mnt/f2fs-test/testdir
>     # seq 1 8192 | xargs touch
>     # sync
> 
> 4. Observe dentry block allocation:
>     # cat /sys/kernel/debug/tracing/trace
> 
>     The trace output shows dentry blocks (is_dir = 1) allocated to WARM
>     segment because FI_HOT_DATA is cleared when dirty_pages >
>     min_hot_blocks (default 16). However, has_curseg_enough_space() only
>     checked HOT_DATA segment space.
> 
> Fix by checking all three data segments (HOT, WARM, COLD) when
> active_logs == 6, similar to how __get_segment_type_6() can return
> any of these segment types for dentry blocks.
> 
> Fixes: ef095d19e82f ("f2fs: write small sized IO to hot log")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>
> ---
>   fs/f2fs/segment.h | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 1ce2c8abaf48..c13400a53013 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -632,15 +632,34 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   	}
>   
>   	/* check current data section for dentry blocks. */
> -	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> +	if (F2FS_OPTION(sbi).active_logs == 6) {
> +		/*
> +		 * With active_logs == 6, dentry blocks can be allocated to
> +		 * HOT, WARM, or COLD segments based on age extent cache,
> +		 * FI_HOT_DATA flag, rw_hint, etc. Check all three.
> +		 */
> +		for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
> +			segno = CURSEG_I(sbi, i)->segno;
> +
> +			if (unlikely(segno == NULL_SEGNO))
> +				return false;
> +
> +			left_blocks = get_left_section_blocks(sbi, i, segno);
> +
> +			if (dent_blocks > left_blocks)
> +				return false;
> +		}

How about merging this for-loop with the one above to avoid duplicated
code? Since both dent_blocks and data_blocks may write to data segments,
should we also check whether data_blocks + dent_blocks > left_blocks?

Yongpeng,


> +	} else {
> +		segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
>   
> -	if (unlikely(segno == NULL_SEGNO))
> -		return false;
> +		if (unlikely(segno == NULL_SEGNO))
> +			return false;
>   
> -	left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
> +		left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
>   
> -	if (dent_blocks > left_blocks)
> -		return false;
> +		if (dent_blocks > left_blocks)
> +			return false;
> +	}
>   	return true;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
