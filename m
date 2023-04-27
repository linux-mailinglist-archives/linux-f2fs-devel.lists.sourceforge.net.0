Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F906F07A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Apr 2023 16:40:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ps2nB-00009S-UM;
	Thu, 27 Apr 2023 14:40:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ps2nA-00009L-5q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Apr 2023 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VQ+N+a5qhgO0E6VtHQ4qMhdFYDz+99rjhzFwqSY7zZA=; b=PSga13hSOb7ZRQ8iMQkCKKRy/i
 NAanPqFA+mS95Ue5PQoa2Wt5gI1dcZIOo5v23XfbBzfQeNjgJ+Kcui3mOHKE0aCVYQ9hcZhIMHsH2
 Gw0RvdDtpo3/JbuNRYTFg6bGgda1KPG7j8AUrEwj+MHfVPIOr17Sf09wzANtoTqCMXb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VQ+N+a5qhgO0E6VtHQ4qMhdFYDz+99rjhzFwqSY7zZA=; b=fwH9QoTinYjmJ3LSQt0sKpYhdU
 477Lt9AVR1cZ+vxOUYJgKSufYuAj42RL6IUAf+3vAOoafiQGQXMkQFsZueuF/2UmBEHg37zt/v9VI
 Bz6Tvk97urACMmtpFqZEGRN3aQ/9qR0vu1K2PqbZbVEUwuEQRvOzJPAy+cK2d4QQ37oI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ps2n7-003N9Q-5r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Apr 2023 14:40:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5E7561418;
 Thu, 27 Apr 2023 14:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9074C433EF;
 Thu, 27 Apr 2023 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682606403;
 bh=rzQHxX7OzGS9Z+uzM8avOggYPTplN+uS0i8oOCvlxXI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RNlJ1XFKL4Vt2oLDIp7/aqnMgA2PFVkVInbk/T8O41OlrOKa+wFZ1jroX4T5LpSyn
 IdtU90iaeY0gP0J608gF4J4BlLLE/AUWraGpWHSLkQROzqGOTmKMZX4l51hh0ClpW1
 rNKYeEeFpwJXeMGmM8fyKiB4GizOpHFbVJSka8ICTktYwCv8rlmusanEsLnC88CnyI
 V0UMrxcN1ee21RYYmtizzaQKrBKvWIES5rInJ7+GZNZD/5Y9DsVfw0veg7oadGOI44
 qZS4iZRdcUzkMVi/SRyhV+1nEOq51Wtj7bAXS9pcJ98skEGKuskApY+Ee52EPl6HzQ
 KTYZ+s2JD0u4g==
Message-ID: <1d681dff-43b2-7930-e86a-cef1626771db@kernel.org>
Date: Thu, 27 Apr 2023 22:39:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230425161903.6261-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230425161903.6261-1-frank.li@vivo.com>
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/26 0:19, Yangtao Li wrote: > This patch provides
 a large number of variants of F2FS_RW_ATTR > and F2FS_RO_ATTR macros, reducing
 the number of parameters required > to initialize the f2fs_att [...] 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ps2n7-003N9Q-5r
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/26 0:19, Yangtao Li wrote:
> This patch provides a large number of variants of F2FS_RW_ATTR
> and F2FS_RO_ATTR macros, reducing the number of parameters required
> to initialize the f2fs_attr structure.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -relocate current_atomic_write
> -add comment for atomic write node and block age extent cache node
>   fs/f2fs/sysfs.c | 239 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 148 insertions(+), 91 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 467d743c801f..cab9e63306bf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -842,68 +842,159 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
>   #define F2FS_GENERAL_RO_ATTR(name) \
>   static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
>   
> -#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
> -static struct f2fs_attr f2fs_attr_##_name = {			\
> -	.attr = {.name = __stringify(_name), .mode = 0444 },	\
> -	.show = f2fs_sbi_show,					\
> -	.struct_type = _struct_type,				\
> -	.offset = offsetof(struct _struct_name, _elname),       \
> -}

#ifdef CONFIG_F2FS_STAT_FS

> +#define STAT_INFO_RO_ATTR(name, elname)				\
> +	F2FS_RO_ATTR(STAT_INFO, f2fs_stat_info, name, elname)	\

#endif

> +
> +#define GC_THREAD_RW_ATTR(name, elname)				\
> +	F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, name, elname)	\
> +
> +#define SM_INFO_RW_ATTR(name, elname)				\
> +	F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, name, elname)	\
> +
> +#define SM_INFO_GENERAL_RW_ATTR(elname)				\
> +	SM_INFO_RW_ATTR(elname, elname)				\
> +
> +#define DCC_INFO_RW_ATTR(name, elname)					\
> +	F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, name, elname)	\
> +
> +#define DCC_INFO_GENERAL_RW_ATTR(elname)			\
> +	DCC_INFO_RW_ATTR(elname, elname)			\
> +
> +#define NM_INFO_RW_ATTR(name, elname)				\
> +	F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, name, elname)	\
> +
> +#define NM_INFO_GENERAL_RW_ATTR(elname)				\
> +	NM_INFO_RW_ATTR(elname, elname)				\
> +
> +#define F2FS_SBI_RW_ATTR(name, elname)				\
> +	F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, name, elname)	\
> +
> +#define F2FS_SBI_GENERAL_RW_ATTR(elname)			\
> +	F2FS_SBI_RW_ATTR(elname, elname)			\
> +
> +#define F2FS_SBI_GENERAL_RO_ATTR(elname)			\
> +	F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, elname, elname)	\
> +
> +#define FAULT_INFO_RATE_GENERAL_RW_ATTR(elname)				\
> +	F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, elname, elname)	\
> +
> +#define FAULT_INFO_TYPE_GENERAL_RW_ATTR(elname)				\
> +	F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, elname, elname)	\
> +
> +#define RESERVED_BLOCKS_GENERAL_RW_ATTR(elname)				\
> +	F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, elname, elname)	\
> +
> +#define CPRC_INFO_GENERAL_RW_ATTR(elname)				\
> +	F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, elname, elname)	\
> +
> +#define ATGC_INFO_RW_ATTR(name, elname)				\
> +	F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)	\
>   
> -F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
> -							urgent_sleep_time);
> -F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
> -F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
> -F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
> -F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
> -F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_seq_blocks, min_seq_blocks);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_hot_blocks, min_hot_blocks);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
> -F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
> -F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
> -F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
> -F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, cp_interval, interval_time[CP_TIME]);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, idle_interval, interval_time[REQ_TIME]);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
> -					interval_time[DISCARD_TIME]);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
> -		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
> +/* GC_THREAD ATTR */
> +GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
> +GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
> +GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
> +GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
> +
> +/* SM_INFO ATTR */
> +SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> +SM_INFO_GENERAL_RW_ATTR(ipu_policy);
> +SM_INFO_GENERAL_RW_ATTR(min_ipu_util);
> +SM_INFO_GENERAL_RW_ATTR(min_fsync_blocks);
> +SM_INFO_GENERAL_RW_ATTR(min_seq_blocks);
> +SM_INFO_GENERAL_RW_ATTR(min_hot_blocks);
> +SM_INFO_GENERAL_RW_ATTR(min_ssr_sections);
> +
> +/* DCC_INFO ATTR */
> +DCC_INFO_RW_ATTR(max_small_discards, max_discards);
> +DCC_INFO_GENERAL_RW_ATTR(max_discard_request);
> +DCC_INFO_GENERAL_RW_ATTR(min_discard_issue_time);
> +DCC_INFO_GENERAL_RW_ATTR(mid_discard_issue_time);
> +DCC_INFO_GENERAL_RW_ATTR(max_discard_issue_time);
> +DCC_INFO_GENERAL_RW_ATTR(discard_io_aware_gran);
> +DCC_INFO_GENERAL_RW_ATTR(discard_urgent_util);
> +DCC_INFO_GENERAL_RW_ATTR(discard_granularity);
> +DCC_INFO_GENERAL_RW_ATTR(max_ordered_discard);
> +
> +/* NM_INFO ATTR */
> +NM_INFO_RW_ATTR(max_roll_forward_node_blocks, max_rf_node_blocks);
> +NM_INFO_GENERAL_RW_ATTR(ram_thresh);
> +NM_INFO_GENERAL_RW_ATTR(ra_nid_pages);
> +NM_INFO_GENERAL_RW_ATTR(dirty_nats_ratio);
> +
> +/* F2FS_SBI ATTR */
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
> +F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
> +F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
> +F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
> +F2FS_SBI_RW_ATTR(idle_interval, interval_time[REQ_TIME]);
> +F2FS_SBI_RW_ATTR(discard_idle_interval, interval_time[DISCARD_TIME]);
> +F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
> +F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
> +F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
> +F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
> +F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
> +F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
> +F2FS_SBI_GENERAL_RW_ATTR(dir_level);
>   #ifdef CONFIG_F2FS_IOSTAT
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
> +F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
> +F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
>   #endif
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
> +F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
> +F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
> +F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
> +F2FS_SBI_GENERAL_RW_ATTR(node_io_flag);
> +F2FS_SBI_GENERAL_RW_ATTR(gc_remaining_trials);
> +F2FS_SBI_GENERAL_RW_ATTR(seq_file_ra_mul);
> +F2FS_SBI_GENERAL_RW_ATTR(gc_segment_mode);
> +F2FS_SBI_GENERAL_RW_ATTR(max_fragment_chunk);
> +F2FS_SBI_GENERAL_RW_ATTR(max_fragment_hole);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +F2FS_SBI_GENERAL_RW_ATTR(compr_written_block);
> +F2FS_SBI_GENERAL_RW_ATTR(compr_saved_block);
> +F2FS_SBI_GENERAL_RW_ATTR(compr_new_inode);
> +F2FS_SBI_GENERAL_RW_ATTR(compress_percent);
> +F2FS_SBI_GENERAL_RW_ATTR(compress_watermark);
> +#endif
> +/* atomic write */
> +F2FS_SBI_GENERAL_RO_ATTR(current_atomic_write);
> +F2FS_SBI_GENERAL_RW_ATTR(peak_atomic_write);
> +F2FS_SBI_GENERAL_RW_ATTR(committed_atomic_block);
> +F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
> +/* block age extent cache */
> +F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
> +F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
> +F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
> +#ifdef CONFIG_BLK_DEV_ZONED
> +F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
> +#endif
> +
> +/* STAT_INFO ATTR */
> +#ifdef CONFIG_F2FS_STAT_FS
> +STAT_INFO_RO_ATTR(cp_foreground_calls, cp_count);
> +STAT_INFO_RO_ATTR(cp_background_calls, bg_cp_count);
> +STAT_INFO_RO_ATTR(gc_foreground_calls, call_count);
> +STAT_INFO_RO_ATTR(gc_background_calls, bg_gc);
> +#endif
> +
> +/* FAULT_INFO ATTR */
>   #ifdef CONFIG_F2FS_FAULT_INJECTION

What about?

#define FAULT_INFO_GENERAL_RW_ATTR(type, elname)		\
	F2FS_RW_ATTR(type, f2fs_fault_info, elname, elname)	\

FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_RATE, inject_rate);
FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_TYPE, inject_type);

Thanks,

> -F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
> -F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
> +FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
> +FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
>   #endif
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_remaining_trials, gc_remaining_trials);
> -F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
> +
> +/* RESERVED_BLOCKS ATTR */
> +RESERVED_BLOCKS_GENERAL_RW_ATTR(reserved_blocks);
> +
> +/* CPRC_INFO ATTR */
> +CPRC_INFO_GENERAL_RW_ATTR(ckpt_thread_ioprio);
> +
> +/* ATGC_INFO ATTR */
> +ATGC_INFO_RW_ATTR(atgc_candidate_ratio, candidate_ratio);
> +ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
> +ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
> +ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
> +
>   F2FS_GENERAL_RO_ATTR(dirty_segments);
>   F2FS_GENERAL_RO_ATTR(free_segments);
>   F2FS_GENERAL_RO_ATTR(ovp_segments);
> @@ -917,10 +1008,6 @@ F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
>   F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
> -F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
> -F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> -F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
> -F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
>   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
>   F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
>   F2FS_GENERAL_RO_ATTR(avg_vblocks);
> @@ -935,8 +1022,6 @@ F2FS_FEATURE_RO_ATTR(encrypted_casefold);
>   #endif /* CONFIG_FS_ENCRYPTION */
>   #ifdef CONFIG_BLK_DEV_ZONED
>   F2FS_FEATURE_RO_ATTR(block_zoned);
> -F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, unusable_blocks_per_sec,
> -					unusable_blocks_per_sec);
>   #endif
>   F2FS_FEATURE_RO_ATTR(atomic_write);
>   F2FS_FEATURE_RO_ATTR(extra_attr);
> @@ -956,37 +1041,9 @@ F2FS_FEATURE_RO_ATTR(casefold);
>   F2FS_FEATURE_RO_ATTR(readonly);
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   F2FS_FEATURE_RO_ATTR(compression);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
>   #endif
>   F2FS_FEATURE_RO_ATTR(pin_file);
>   
> -/* For ATGC */
> -F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
> -F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
> -F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
> -F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
> -
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
> -
> -/* For atomic write */
> -F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
> -
> -/* For block age extent cache */
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
> -
>   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>   static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_urgent_sleep_time),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
