Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F440C4BAE5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 07:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtQ2w/oPX6K7zvBFTRiOEPQADY/G6VDe0MGo4RR3ZDc=; b=b1+bE262R9BEju7P4C01PDMwVm
	2XEGwR7GFhBobd+SwJr9GvGMbuTt1QQrbi50roYj6nQtn00PPzkS3pDLXN3DB87qU2qD8cI8Cf2cm
	PEir1MhO8uX4V22IIaIbxK0oj4lTMDRVIsi75K67iGJuKi8xTAID3oGh8ZHSXH06L3Es=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIht3-0004wG-Mp;
	Tue, 11 Nov 2025 06:29:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vIht1-0004w0-WF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 06:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKqgvyJtGNbVzE7kGd6bpftMWsr85S+/cQsPs3EDLeQ=; b=fr0xC/XiVlBUcY+6vqRd3p+Y/3
 E6oZwpS6SR75tFo8u98+sdcWJdkC3ZYdSP5DlmVuV9xcQNv9Wfg1SVxCGE0TBuCIBP1iqRK3rlwTb
 bpozpncVjT5uHcBEKobdQuR3j5yuYLdO34BeP98EBffjd8XLGVgNHTzUo7M2N9mK79SI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKqgvyJtGNbVzE7kGd6bpftMWsr85S+/cQsPs3EDLeQ=; b=BBivkM1srX1j8Wg0yGID67sh+s
 c+mrQj6L8xgjDdOReKsE30Cl+H3i3iKmeH8vjxbPeFIUUJ6b2IQPZxSCadIrtEc/QREwqPPwvRNHy
 8LvPVRrLHTi1D3AhdwnwtVkiJsQNwtuV3KgwdEwxNvvbwxuZAEP59vb5SDXLPyP/QUfI=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIht2-0008QI-7x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 06:29:52 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-295ceaf8dacso39703205ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762842581; x=1763447381; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sKqgvyJtGNbVzE7kGd6bpftMWsr85S+/cQsPs3EDLeQ=;
 b=FZppfB1N0qXVsTbFQaSi1PYN7bT0h61XzRrcYkx7h/+lynwObb7sUjz9UMLcLv6EeG
 DxkRD+NkQsc9fA9laBWYRCFBZcS3uxLy79TX+FlDkvfT/tPHTzR46wwjlC8RwkpcEfUO
 A/98cyRQiqRtgV3unIbRjHqJU2KrkZat+tuQetKsGduG3BXp2IkyF7Kpxy9v2CtkfBOa
 +JKkB/KxNPiq8SkOVYbSn9jJnltl3gQytqJktfJVTu++cIHGtZq/qm7EBGvhiE1Mmnjd
 bH8bHA9yufcacjt1yQOzQxyqKiq452yG8K2+sryDZPArxWZUDbsK+AAZ2TaPDY+XjeGS
 KR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762842581; x=1763447381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKqgvyJtGNbVzE7kGd6bpftMWsr85S+/cQsPs3EDLeQ=;
 b=tkT2VovHpWfVG/31D+7cvF2LHVniu40Gvv7KSvXWJFVYuERBUm7qOEpSCVzxsQeNab
 tDqpNiWUI3g+xI536GUyh5ZQNoPFYAfWYFaPHjnDKS2U7V7MiV4U8DC9BsGsL4Cxy/Q4
 SvWbURtPALliBiJKuA042lYK51EELzOl1Ova4jS0sX2T2NW4OOiwMqf2DcjjP7WcGwWr
 Q3uuxECHlRX/OGgoYqkOeUPSZKIoKDp28+5lDF4E7rGnXg64MsPiV4WSNHc0RxDZhsMO
 m+u4vuNNQKNNvELMz44Is3AcHwXS9/h79FtqWVy4MqM2QqnSaCVxQoFfVTKOgYK2L4Lt
 Q79A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1xLi3rL1IVT3E1LSEv1WQB59v5YTGKJOkpvBstaxDc/MN/TaNkkwQkeNMXJtMb+3eZ5WKwQd1KOJQJUuRaN1u@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7FBeq0taLZzP9Zb5jptUjtCbJ18yf0TjcMaI6T0BznBeFAgH7
 nqXDVi979MZWOKSNwxIuxWDzXNDJAJ4ZokKLzpC8+5Y4cr7Kd7LHx5Jt
X-Gm-Gg: ASbGnctNVhTV5aQ7qa0AB44mA8OMTLM5p5vz95U7ws9NXBmzbHcG/u0y5m9SduVrLCB
 gkUVkcA5/FQvAfEb2nkccyCdUb7c1Hjvs4jv5rX7e5zAHX6TKWBdLMi3eAAI/jT+jB6MzPu5Na/
 MkftgRDcvBeFOTVH7ZHDKyFS8ZAgi7Sv5ISAL+ELSDyQfN2l7Xgm86TsZIACVTdTwYLdBGkAVmv
 vg7NKOR0AKJySVheYNzlLjGKrTsl6IfaNexFpra5i7Qfm7d5dUpl2vQ6/lW6L106DoXay9t3vSv
 Ku/UmoWw5eHHPST0zkQuyhDRDSYRK91NRjJZKlSHbsJIfYcWxoFNzR+kxb4HU0YpMiYw1z1Kn6d
 6UaZKAqNMJ/JPCsFiLrMzVDl8fNTMiQ4wqSjjUWcvaXnz6iescU6eG7W3juq/J6qfqPfdgmRUDh
 g+h03RHniHP9O5OJgKiEGiJWkX1CN3HRbYDYcmuNB7bI9O
X-Google-Smtp-Source: AGHT+IF40G3iSq8Wz5OHk5M+HgDuMFVNr7+LzM/sauYtkMXM6MYI+qYKqu0qHN2JK/1VfKDa/+xIQA==
X-Received: by 2002:a17:902:db05:b0:295:7806:1d64 with SMTP id
 d9443c01a7336-297e5666153mr136774245ad.25.1762842581251; 
 Mon, 10 Nov 2025 22:29:41 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-297d83c941esm114165585ad.44.2025.11.10.22.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 22:29:41 -0800 (PST)
Message-ID: <635c7224-5bfe-40fd-9338-d9c600b7def4@gmail.com>
Date: Tue, 11 Nov 2025 14:29:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251111060557.337514-1-hexiaole1994@126.com>
 <20251111061051.337547-1-hexiaole1994@126.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251111061051.337547-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/11/25 14:10, Xiaole He wrote: > When active_logs ==
 6, dentry blocks can be allocated to HOT, WARM, or > COLD segments based on
 various conditions in __get_segment_type_6(): > - age extent cache [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIht2-0008QI-7x
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix has_curseg_enough_space to
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

On 11/11/25 14:10, Xiaole He wrote:
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
>          locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
>          locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
> 
>          trace_f2fs_allocate_data_block(sbi, folio ? folio->mapping->host : NULL,
>                                          type, *new_blkaddr);
> 
>          if (IS_DATASEG(curseg->seg_type))
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
> Fix by merging the dentry block check into the main data/node block
> check loop and checking data_blocks + dent_blocks for data segments,
> since both regular data blocks and dentry blocks can be written to the
> same segment. When active_logs == 6, dentry blocks can be allocated to
> any of the three data segments (HOT, WARM, COLD), so all three segments
> need to account for dentry blocks. When active_logs != 6, dentry blocks
> are always allocated to HOT_DATA segment only, so only HOT_DATA segment
> needs to account for dentry blocks, while WARM and COLD segments only
> check data_blocks.
> 
> Fixes: ef095d19e82f ("f2fs: write small sized IO to hot log")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>
> ---
> Changes in v2 (per Yongpeng's feedback):
> - Merged dentry block check into the main loop to avoid duplication
> - Check data_blocks + dent_blocks for data segments (both can write to same segment)
> ---
>   fs/f2fs/segment.h | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 1ce2c8abaf48..acda720a54eb 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -626,21 +626,21 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   
>   		left_blocks = get_left_section_blocks(sbi, i, segno);
>   
> -		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
> +		if (i <= CURSEG_COLD_DATA) {
> +			blocks = data_blocks;
> +			/*
> +			 * With active_logs == 6, dentry blocks can be allocated to
> +			 * any data segment. With active_logs != 6, dentry blocks
> +			 * are always allocated to HOT_DATA segment.
> +			 */
> +			if ((F2FS_OPTION(sbi).active_logs == 6) || (i == CURSEG_HOT_DATA))
> +				blocks += dent_blocks;
> +		} else {
> +			blocks = node_blocks;
> +		}
>   		if (blocks > left_blocks)
>   			return false;
>   	}
> -
> -	/* check current data section for dentry blocks. */
> -	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> -
> -	if (unlikely(segno == NULL_SEGNO))
> -		return false;
> -
> -	left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
> -
> -	if (dent_blocks > left_blocks)
> -		return false;
>   	return true;
>   }
>   

Looks good to me,
Reviewed-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Thanks
Yongpeng,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
