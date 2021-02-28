Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345532704E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Feb 2021 06:10:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGELU-0006i8-7J; Sun, 28 Feb 2021 05:10:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGELS-0006i1-AW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTFLeYJHNr2bMHR3J5vC2vJzmr1F1ySfV9HEWvaQIt0=; b=fYiawUrjqhmziVekAV0NfejVuQ
 AZewuo5jzapxbEMPtvToeBs/862MMpS2EFLl0W0CaMPM2a9ZfHG7sNMQxMyuwVT27SUT0lbhd1f1T
 qUETLdD3FLGnkCuY6CLLUzC2B6v3mkVYPcWKwkiEF/mvPjrgrebK1ok9dbHR/MtyFoXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTFLeYJHNr2bMHR3J5vC2vJzmr1F1ySfV9HEWvaQIt0=; b=c5vLWDdxbfGxNxgUX2KjO4ThyR
 BzVC+9OTikI0ijA/0QGsNiz8jTcO1UuU9QKluiusruLCCbr0jy3LR1vCuZW26j5FFMQ6ZaXr5Akfr
 I37+NhB45oboXCx6O788YGH3wo1nJLEZGx67FLgnfz9BOuo2mH9L1TPwJrO5AvCwa2ZU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGELL-00068W-RI
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:10:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 532E964DE5;
 Sun, 28 Feb 2021 05:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614489006;
 bh=pbH0DKm6LsNqRGRaN/F4XVCG+yk9JeMauppGOKDCpXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4dqyBJyyC6nBR4E4m6ZzRbDZJ8iStONpQgBFczSuFDF1i2uh5TMhGeFGI9hwNkVX
 sZyQ8iUedHkYG3thuesTKi+8oh2+2QLIo2/XEIowkqtGu0f+Qxk4JQpN97AyHueVjN
 Tb7LE8d8I9g8YonNI/gUanGOwAvCaMaJ/k7IaHH4J89OkRMnCr78avxHTGxs9lSr+d
 kBYINX8pvAhOe32+93qOfprY5GKXbZhr4K3Sogg7RS6IQFp46cQdDM2xBCQRjM4rm2
 ag+SpuTlOdE4E+2TA0b7SmP2BPtaD3Ul865W108kWCmbmyr60LrJWfDlNlO02SMU1q
 PHB4yxOcqU/Pg==
Date: Sat, 27 Feb 2021 21:10:05 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YDslrV/qw0DyVc8o@google.com>
References: <20210220094052.64905-1-yuchao0@huawei.com>
 <ad627dde-23f9-cbbc-ce58-7c799161f290@kernel.org>
 <2b96b5e5-abc0-615f-0220-5d46b8e2c329@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b96b5e5-abc0-615f-0220-5d46b8e2c329@huawei.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGELL-00068W-RI
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix to avoid selecting full
 segment w/ {AT, }SSR allocator
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/23, Chao Yu wrote:
> Jaegeuk,
> 
> Could you please help to review this patch? since I doubt that this
> issue can happen in real world... :(

Let me take a look as soon as I have some time. Sorry for the delay.

> 
> Thanks,
> 
> On 2021/2/22 21:43, Chao Yu wrote:
> > Ping,
> > 
> > On 2021/2/20 17:40, Chao Yu wrote:
> > > In cp disabling mode, there could be a condition
> > > - target segment has 128 ckpt valid blocks
> > > - GC migrates 128 valid blocks to other segment (segment is still in
> > > dirty list)
> > > - GC migrates 384 blocks to target segment (segment has 128 cp_vblocks
> > > and 384 vblocks)
> > > - If GC selects target segment via {AT,}SSR allocator, however there is
> > > no free space in targe segment.
> > > 
> > > Fixes: 4354994f097d ("f2fs: checkpoint disabling")
> > > Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >    fs/f2fs/f2fs.h    |  1 +
> > >    fs/f2fs/gc.c      | 17 +++++++++++++----
> > >    fs/f2fs/segment.c | 20 ++++++++++++++++++++
> > >    3 files changed, 34 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index ed7807103c8e..9c753eff0814 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -3376,6 +3376,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
> > >    int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
> > >    void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
> > >    int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> > > +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
> > >    void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
> > >    void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
> > >    void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > index 86ba8ed0b8a7..a1d8062cdace 100644
> > > --- a/fs/f2fs/gc.c
> > > +++ b/fs/f2fs/gc.c
> > > @@ -392,10 +392,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
> > >    		if (p->gc_mode == GC_AT &&
> > >    			get_valid_blocks(sbi, segno, true) == 0)
> > >    			return;
> > > -
> > > -		if (p->alloc_mode == AT_SSR &&
> > > -			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
> > > -			return;
> > >    	}
> > >    	for (i = 0; i < sbi->segs_per_sec; i++)
> > > @@ -736,6 +732,19 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
> > >    		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
> > >    			goto next;
> > > +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > > +			/*
> > > +			 * to avoid selecting candidate which has below valid
> > > +			 * block distribution:
> > > +			 * partial blocks are valid and all left ones are valid
> > > +			 * in previous checkpoint.
> > > +			 */
> > > +			if (p.alloc_mode == SSR || p.alloc_mode == AT_SSR) {
> > > +				if (!segment_has_free_slot(sbi, segno))
> > > +					goto next;
> > > +			}
> > > +		}
> > > +
> > >    		if (is_atgc) {
> > >    			add_victim_entry(sbi, &p, segno);
> > >    			goto next;
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index 2d5a82c4ca15..deaf57e13125 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -2650,6 +2650,26 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
> > >    		seg->next_blkoff++;
> > >    }
> > > +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
> > > +{
> > > +	struct sit_info *sit = SIT_I(sbi);
> > > +	struct seg_entry *se = get_seg_entry(sbi, segno);
> > > +	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> > > +	unsigned long *target_map = SIT_I(sbi)->tmp_map;
> > > +	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
> > > +	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> > > +	int i, pos;
> > > +
> > > +	down_write(&sit->sentry_lock);
> > > +	for (i = 0; i < entries; i++)
> > > +		target_map[i] = ckpt_map[i] | cur_map[i];
> > > +
> > > +	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
> > > +	up_write(&sit->sentry_lock);
> > > +
> > > +	return pos < sbi->blocks_per_seg;
> > > +}
> > > +
> > >    /*
> > >     * This function always allocates a used segment(from dirty seglist) by SSR
> > >     * manner, so it should recover the existing segment information of valid blocks
> > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
