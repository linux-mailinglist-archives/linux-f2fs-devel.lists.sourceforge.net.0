Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AEE5B8C0A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 17:38:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYUTA-00060b-CB;
	Wed, 14 Sep 2022 15:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oYUT4-00060P-Pb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 15:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ECAyXJS4/ABFj9OFPWE21bk33Ajea8/k0sgcXUgkuXc=; b=VFcj+N3YX16xAa41EcGd2seoGT
 tKKmBhUthWSH7wY/Mk9ZlTumm5vXmMPNbLgKvyeAiwGjEfev8UA9ieOP8onEMflROVPMB9WgM4nGe
 D0jwVJ4FrSJ0Zrsb5SYdl7SojHHRCY7D2qFEBG28Y1GqlaRvqKLivNE/kJAnKo6RMXsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ECAyXJS4/ABFj9OFPWE21bk33Ajea8/k0sgcXUgkuXc=; b=eUUg+d95Si9OX8ePyi4NVnUVeB
 s8c2TsJayPK4Sol9d3B02wg81zx4lOVJWHNKLd99JQ756IbDiTuHVkGZuBxcRzlq+UmOL6FJGubER
 0fy0XqBjZMQlbL7Fa1kfJeU6qjqa/hhlUrdHGxFrfPXiwM9pWXjZJbbFfLiyEyu3H//I=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYUTF-0088Hy-Iu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 15:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 850B4CE16B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Sep 2022 15:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC449C433C1;
 Wed, 14 Sep 2022 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663169905;
 bh=bn/5Wmn8oxCcr49GH2kx5j0QpYqkZVblryqz6FfB9t8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nIgDrAFPilPYTnXEu+7f6+Sgcci8BeoMwXIy4Q1R1L0yT7dgtVX6wwG/gHVNrwkv2
 fsv4XYkzmNiyJ+Q01vfQQTVzL2PSBDLhngpIPJLnPNkklYBGSeUN1OPwHV5S9uPCmk
 ZlB4lMneahj78wg2td93bGSHwXLw4AUYw08le4LXK6WUXKCTaEeOJi5Evr0EG7XsMj
 jLvUYbeKK5qeKfTCg+HNTlunO5+AVkhMoyyi72eRu3ds0HKA4HNy7/eFUldk7ea2r/
 hTbOV3W5xUAGrKVTfjrYOu14L9VA7k2KEnYfbr+k+rnkTywY6AzURUo69TrPIqob5u
 WHiEWRC1/YtWg==
Message-ID: <d52bb2b4-28be-0feb-b17e-74b44e14ce79@kernel.org>
Date: Wed, 14 Sep 2022 23:38:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20220914115835.2998424-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220914115835.2998424-1-chao@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Any thoughts about this patch? On 2022/9/14 19:58, 
 Chao Yu wrote: > Once CP_ERROR_FLAG is set, checkpoint is disallowed to be
 triggered to > persist CP_FSCK_FLAG, fsck won't repair the image due to lack
 of > CP_FSCK_FLAG. > > This [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oYUTF-0088Hy-Iu
Subject: Re: [f2fs-dev] [RFC PATCH v3] f2fs: record need_fsck in super_block
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any thoughts about this patch?

On 2022/9/14 19:58, Chao Yu wrote:
> Once CP_ERROR_FLAG is set, checkpoint is disallowed to be triggered to
> persist CP_FSCK_FLAG, fsck won't repair the image due to lack of
> CP_FSCK_FLAG.
> 
> This patch proposes to persist newly introduced SB_NEED_FSCK flag into
> super block if CP_ERROR_FLAG and SBI_NEED_FSCK is set, later, once fsck
> detect this flag, it can check and repair corrupted image in time.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - fix to add missing cpu_to_le16()
>   fs/f2fs/checkpoint.c    |  6 +++++-
>   fs/f2fs/f2fs.h          |  1 +
>   fs/f2fs/super.c         | 26 ++++++++++++++++++++++++++
>   include/linux/f2fs_fs.h |  5 ++++-
>   4 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index c3119e4c890c..0836fce40394 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -30,8 +30,12 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
>   {
>   	f2fs_build_fault_attr(sbi, 0, 0);
>   	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> -	if (!end_io)
> +	if (!end_io) {
>   		f2fs_flush_merged_writes(sbi);
> +
> +		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
> +			f2fs_update_sb_flags(sbi, SB_NEED_FSCK);
> +	}
>   }
>   
>   /*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dee7b67a17a6..1960a98c7555 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3556,6 +3556,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
>   int f2fs_quota_sync(struct super_block *sb, int type);
>   loff_t max_file_blocks(struct inode *inode);
>   void f2fs_quota_off_umount(struct super_block *sb);
> +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag);
>   int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>   int f2fs_sync_fs(struct super_block *sb, int sync);
>   int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b8e5fe244596..fe9a6e02d81f 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3846,6 +3846,32 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
>   	return err;
>   }
>   
> +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag)
> +{
> +	unsigned short s_flags;
> +	int err;
> +
> +	if (le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags) & SB_NEED_FSCK)
> +		return;
> +
> +	f2fs_down_write(&sbi->sb_lock);
> +
> +	s_flags = le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags);
> +
> +	if (s_flags & SB_NEED_FSCK)
> +		goto out_unlock;
> +
> +	F2FS_RAW_SUPER(sbi)->s_flags = cpu_to_le16(s_flags | SB_NEED_FSCK);
> +
> +	err = f2fs_commit_super(sbi, false);
> +	if (err) {
> +		f2fs_warn(sbi, "f2fs_commit_super fails to persist flag: %u, err:%d", flag, err);
> +		F2FS_RAW_SUPER(sbi)->s_flags = cpu_to_le16(s_flags);
> +	}
> +out_unlock:
> +	f2fs_up_write(&sbi->sb_lock);
> +}
> +
>   static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index d445150c5350..124176e2a42c 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -73,6 +73,8 @@ struct f2fs_device {
>   	__le32 total_segments;
>   } __packed;
>   
> +#define SB_NEED_FSCK			0x00000001	/* need fsck */
> +
>   struct f2fs_super_block {
>   	__le32 magic;			/* Magic Number */
>   	__le16 major_ver;		/* Major Version */
> @@ -116,7 +118,8 @@ struct f2fs_super_block {
>   	__u8 hot_ext_count;		/* # of hot file extension */
>   	__le16  s_encoding;		/* Filename charset encoding */
>   	__le16  s_encoding_flags;	/* Filename charset encoding flags */
> -	__u8 reserved[306];		/* valid reserved region */
> +	__le16 s_flags;			/* super block flags */
> +	__u8 reserved[304];		/* valid reserved region */
>   	__le32 crc;			/* checksum of superblock */
>   } __packed;
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
