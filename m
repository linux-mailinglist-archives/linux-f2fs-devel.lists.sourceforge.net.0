Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9876B0C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jul 2019 23:09:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnUhD-0004eo-A3; Tue, 16 Jul 2019 21:09:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hnUh7-0004e4-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 21:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=faqyzfYwiPdijwO2YfEvosOqCDTMljFU3hnZFx2wQRA=; b=FxU/JyG5dYg2lbxN4ghTvAhwi2
 xF2Gv/PCb1OHv0HcRTViO2CpNZJh0ZiHnghSXUq8Xp/iDNvlU8No1cCLHlnhbsFo0FGXCKFGrux5K
 yWTPP3M3TAlxzr9TP4rwcOF7CbZx3WpfhCtE19wKHLnTGptcY/SKSLyJwTKUXQ3twp1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=faqyzfYwiPdijwO2YfEvosOqCDTMljFU3hnZFx2wQRA=; b=YRdMEzip7BhvEmPspYcBZKWN2d
 CKipoEyNAAy/E0tA2bXzlcIXDTO2tF7IBGZOLyn5Y68a4OWlCTOL7dfzd+249oSFb+AmdXKImZVwk
 YBZQL+p7R1hZ6G+1KPskFfqy/hi33k9HlogySVrinQwB/avKOPwiS3ACHpbBXJNmZfs8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnUh6-004F7q-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 21:09:05 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8E4220659;
 Tue, 16 Jul 2019 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563311338;
 bh=7KNSonGOd9H7F3nw4Zc8EUTvjNPIsZ0hB+GL18EMIsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEjOXv/90EMYS/CPlFFxAxNR8cCe+sFoXehhoU2/uHfSNGqpD/Xwd2a+ZoHAXGJHe
 CF53Z58lXOJZEK/a7Nw2qm6vgtnpqQodRnVPPzywm2DvM6QYO2VovOFjql/t6xEr7B
 gIN56W0iLCG9kU+kjA+KhTnWAICyVV3TIW0s0BgE=
Date: Tue, 16 Jul 2019 14:08:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190716210857.GA5347@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190626094813.40517-1-yuchao0@huawei.com>
 <7a2e35af-50ce-689d-218a-44b106408d5b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a2e35af-50ce-689d-218a-44b106408d5b@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hnUh6-004F7q-Dq
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: write checkpoint with OPU mode
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

On 07/16, Chao Yu wrote:
> Ping,

It seems this is still breaking the tests. At some point on fault/power tests,
I hit fsck is stopped since it's missing one NAT node.

> 
> On 2019-6-26 17:48, Chao Yu wrote:
> > This original patch was from Weichao Guo.
> > 
> > We may encounter both checkpoints invalid in such a case:
> > 1. kernel writes CP A;
> > 2. power-cut when kernel writes CP B, then CP B is corrupted;
> > 3. fsck: load CP A, fix meta/data;
> > 4. power-cut when fsck writes CP A in-place, then CP A is corrupted too;
> > 
> > To avoid both checkpoints being invalid, this patch changes to duplicate
> > valid checkpoint to mirror position first, and then, write fixed checkpoint
> > to CP #0 position.
> > 
> > This can make sure that, while fsck repairing, even there is sudden
> > power-cut, last valid checkpoint can be kept in CP #1 position.
> > 
> > Signed-off-by: Weichao Guo <guoweichao@huawei.com>
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> > v2:
> > - duplicate valid CP to mirror position, update CP on #0 position.
> >  fsck/f2fs.h  |  2 ++
> >  fsck/fsck.c  | 14 ++++++++++++--
> >  fsck/fsck.h  |  2 ++
> >  fsck/mount.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  4 files changed, 66 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> > index 4dc6698..52e68ec 100644
> > --- a/fsck/f2fs.h
> > +++ b/fsck/f2fs.h
> > @@ -195,6 +195,8 @@ struct f2fs_sb_info {
> >  
> >  	unsigned int cur_victim_sec;            /* current victim section num */
> >  	u32 free_segments;
> > +
> > +	int cp_backuped;			/* backup valid checkpoint */
> >  };
> >  
> >  static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 8953ca1..aee45d9 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -2127,6 +2127,16 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
> >  	ASSERT(ret >= 0);
> >  }
> >  
> > +static void fix_checkpoints(struct f2fs_sb_info *sbi)
> > +{
> > +	/* copy valid checkpoint to its mirror position */
> > +	duplicate_checkpoint(sbi);
> > +
> > +	/* repair checkpoint at CP #0 position */
> > +	sbi->cur_cp = 1;
> > +	fix_checkpoint(sbi);
> > +}
> > +
> >  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
> >  {
> >  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > @@ -2777,10 +2787,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> >  			rewrite_sit_area_bitmap(sbi);
> >  			fix_curseg_info(sbi);
> >  			fix_checksum(sbi);
> > -			fix_checkpoint(sbi);
> > +			fix_checkpoints(sbi);
> >  		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
> >  			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
> > -			write_checkpoint(sbi);
> > +			write_checkpoints(sbi);
> >  		}
> >  	}
> >  	return ret;
> > diff --git a/fsck/fsck.h b/fsck/fsck.h
> > index d38e8de..3699b35 100644
> > --- a/fsck/fsck.h
> > +++ b/fsck/fsck.h
> > @@ -191,7 +191,9 @@ extern void flush_sit_entries(struct f2fs_sb_info *);
> >  extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
> >  extern void write_curseg_info(struct f2fs_sb_info *);
> >  extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
> > +extern void duplicate_checkpoint(struct f2fs_sb_info *);
> >  extern void write_checkpoint(struct f2fs_sb_info *);
> > +extern void write_checkpoints(struct f2fs_sb_info *);
> >  extern void update_superblock(struct f2fs_super_block *, int);
> >  extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
> >  extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
> > diff --git a/fsck/mount.c b/fsck/mount.c
> > index 60e0e4a..89f538b 100644
> > --- a/fsck/mount.c
> > +++ b/fsck/mount.c
> > @@ -2229,7 +2229,7 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
> >  	int n_sits = flush_sit_journal_entries(sbi);
> >  
> >  	if (n_nats || n_sits)
> > -		write_checkpoint(sbi);
> > +		write_checkpoints(sbi);
> >  }
> >  
> >  void flush_sit_entries(struct f2fs_sb_info *sbi)
> > @@ -2478,6 +2478,45 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
> >  	free(nat_block);
> >  }
> >  
> > +void duplicate_checkpoint(struct f2fs_sb_info *sbi)
> > +{
> > +	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> > +	unsigned long long dst, src;
> > +	void *buf;
> > +	unsigned int seg_size = 1 << get_sb(log_blocks_per_seg);
> > +	int ret;
> > +
> > +	if (sbi->cp_backuped)
> > +		return;
> > +
> > +	buf = malloc(F2FS_BLKSIZE * seg_size);
> > +	ASSERT(buf);
> > +
> > +	if (sbi->cur_cp == 1) {
> > +		src = get_sb(cp_blkaddr);
> > +		dst = src + seg_size;
> > +	} else {
> > +		dst = get_sb(cp_blkaddr);
> > +		src = dst + seg_size;
> > +	}
> > +
> > +	ret = dev_read(buf, src << F2FS_BLKSIZE_BITS, seg_size);
> > +	ASSERT(ret >= 0);
> > +
> > +	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS, seg_size);
> > +	ASSERT(ret >= 0);
> > +
> > +	free(buf);
> > +
> > +	ret = f2fs_fsync_device();
> > +	ASSERT(ret >= 0);
> > +
> > +	sbi->cp_backuped = 1;
> > +
> > +	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
> > +		"%llu -> %llu\n", src, dst);
> > +}
> > +
> >  void write_checkpoint(struct f2fs_sb_info *sbi)
> >  {
> >  	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> > @@ -2557,6 +2596,16 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
> >  	ASSERT(ret >= 0);
> >  }
> >  
> > +void write_checkpoints(struct f2fs_sb_info *sbi)
> > +{
> > +	/* copy valid checkpoint to its mirror position */
> > +	duplicate_checkpoint(sbi);
> > +
> > +	/* repair checkpoint at CP #0 position */
> > +	sbi->cur_cp = 1;
> > +	write_checkpoint(sbi);
> > +}
> > +
> >  void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
> >  {
> >  	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
