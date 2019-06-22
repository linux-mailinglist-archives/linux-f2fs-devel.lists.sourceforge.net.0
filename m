Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3A4F856
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Jun 2019 23:47:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1henqk-0005DX-Sv; Sat, 22 Jun 2019 21:47:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1henqh-0005DO-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 21:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RSHs16TJIPqFBP82c5yhmChLsaKrdPuVR6Qb4hTLqL4=; b=JH5voQ970rYvaniOq2FcDkyS0/
 0ZckIMdebLnsVPWJjC58jySbi9JK5PyjLT59gGij3EurmcxPMOrC+zRrBYKQhlyUX/wsv5Jv5L7zp
 wyHADL3Ur3fJciIU6Vva78pASmzr3PqxXWsmCQPDQDDBnLktri5lOJdZKOn9vXLaKNwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RSHs16TJIPqFBP82c5yhmChLsaKrdPuVR6Qb4hTLqL4=; b=C1d/+ePleQ6KzY7+ew+vAgSce/
 wYaLnjhZffW8SRF+WVhLNns/nFtAyp3mZ2nagjFK5v2MSAfKs9v3S374nHAVScSTxSiQHxecYtS8+
 qN+kOKgDox2DORTKH5fQvSl5kXsZD67LG4DX7DLif7l3NdGHFwwoDyw74L5f7ODEJyWU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1henqj-009yMt-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 21:47:07 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 780FA20673;
 Sat, 22 Jun 2019 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561240017;
 bh=MQM14eBidikqbh0Hf58Dm1ovO8UlO1cnbhvIW04+4Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBXUny2xvK2CjdESR6c+K2AuSd10Zq681D632sWRJHYK1aXMqsn6FpSed1TiYwC/x
 Htu45Pq/RDbhe4u8W8JCtktaKlRleH+HYRh9tBQht1hvOpYBfQKk0IJtZ7qUvjGuOU
 xdEeaY7ciTFXU438K5oQPw+2kJX6XZwYseKvt/Bk=
Date: Sat, 22 Jun 2019 14:46:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190622214656.GA18429@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190524075627.107151-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524075627.107151-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1henqj-009yMt-JJ
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: write checkpoint with OPU mode
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Weichao,

This patch breaks the image found by my local power-cut tests.

On 05/24, Chao Yu wrote:
> This original patch was from Weichao Guo.
> 
> We may encounter both checkpoints invalid in such a case:
> 1. kernel writes CP A;
> 2. power-cut when kernel writes CP B, then CP B is corrupted;
> 3. fsck: load CP A, fix meta/data;

Would it be better to copy CP A to CP B position first?

Thanks,

> 4. power-cut when fsck writes CP A in-place, then CP A is corrupted too;
> 
> To avoid both checkpoints being invalid, this patch changes to enables
> fsck to write checkpoint with out-place-update method first, and then
> write checkpoint in original place.
> 
> This can make sure during fsck repairing, even there is sudden power-cut,
> filesystem will still have at least one valid checkpoint.
> 
> Signed-off-by: Weichao Guo <guoweichao@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - clean up codes
> - cover flush_journal_entries() case
> - update commet message
>  fsck/fsck.c  | 17 +++++++++++++++--
>  fsck/fsck.h  |  1 +
>  fsck/mount.c | 15 ++++++++++++++-
>  3 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 6f0f262..6aed51d 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2121,6 +2121,19 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  		write_nat_bits(sbi, sb, cp, sbi->cur_cp);
>  }
>  
> +static void fix_checkpoints(struct f2fs_sb_info *sbi)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < 2; i++) {
> +		/* write checkpoint out of place first */
> +		sbi->cur_cp = sbi->cur_cp % 2 + 1;
> +		fix_checkpoint(sbi);
> +		ret = f2fs_fsync_device();
> +		ASSERT(ret >= 0);
> +	}
> +}
> +
>  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -2771,10 +2784,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  			rewrite_sit_area_bitmap(sbi);
>  			fix_curseg_info(sbi);
>  			fix_checksum(sbi);
> -			fix_checkpoint(sbi);
> +			fix_checkpoints(sbi);
>  		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
>  			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
> -			write_checkpoint(sbi);
> +			write_checkpoints(sbi);
>  		}
>  	}
>  	return ret;
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index d38e8de..8fe5db1 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -192,6 +192,7 @@ extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
>  extern void write_curseg_info(struct f2fs_sb_info *);
>  extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
>  extern void write_checkpoint(struct f2fs_sb_info *);
> +extern void write_checkpoints(struct f2fs_sb_info *);
>  extern void update_superblock(struct f2fs_super_block *, int);
>  extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
>  extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 1c5cd93..bbb1af7 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2127,7 +2127,7 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
>  	int n_sits = flush_sit_journal_entries(sbi);
>  
>  	if (n_nats || n_sits)
> -		write_checkpoint(sbi);
> +		write_checkpoints(sbi);
>  }
>  
>  void flush_sit_entries(struct f2fs_sb_info *sbi)
> @@ -2452,6 +2452,19 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  }
>  
> +void write_checkpoints(struct f2fs_sb_info *sbi)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < 2; i++) {
> +		/* write checkpoint out of place first */
> +		sbi->cur_cp = sbi->cur_cp % 2 + 1;
> +		write_checkpoint(sbi);
> +		ret = f2fs_fsync_device();
> +		ASSERT(ret >= 0);
> +	}
> +}
> +
>  void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
