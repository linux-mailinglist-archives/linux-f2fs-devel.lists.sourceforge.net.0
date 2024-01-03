Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91595822B87
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jan 2024 11:44:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rKyj6-0006HW-4K;
	Wed, 03 Jan 2024 10:43:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1rKyj3-0006HJ-EX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Jan 2024 10:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IsTSlZeD9YZSd9Cqu+xPJ/9uVsDjx2SAV4n/KDRMCMU=; b=OXtEawk76CgQqwrBD5t0XXNKhH
 kKGGF3PQ4pXn7p7d6veVl/R8grPRtzpV8wxLlFxQUsNvEPXNWHK/hGZWIWApd2G1FBqsikU6ONL3k
 dCckT0mexh1Ez+YwB9CG1Ux8NvRbExzrQIpRac/a2f5E6OVMKrrQfwynzfYByJ6vOa4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IsTSlZeD9YZSd9Cqu+xPJ/9uVsDjx2SAV4n/KDRMCMU=; b=HtTIOMzfl07HHCT/Vq8u1CM9uD
 nAcr1UAG0TPT53jcSjfEGqEPPP4TcmWnk9bUZ5U7qzKXbEcA7GalmTJll8ehQ8GcNjm3hgYV+/+EW
 /BX879lBFotI25pgf8T/+XIiqlt/zDYh5OlWv5ycfQat6Yf2CMypyirzEaDzuRsccldw=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rKyj2-0007ZV-1j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Jan 2024 10:43:53 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240103104341epoutp04decfdf92cf5babf73363658c73b90f3c~m0GB2b4se1433214332epoutp04d
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Jan 2024 10:43:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240103104341epoutp04decfdf92cf5babf73363658c73b90f3c~m0GB2b4se1433214332epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1704278621;
 bh=IsTSlZeD9YZSd9Cqu+xPJ/9uVsDjx2SAV4n/KDRMCMU=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=dYLt/HDDncsFpdCMtviSYP1Z7ICWTWzaJhhxoi1mMr+zsZT+7VY/yoYh1xuXP0UM2
 i3LKW9L/xrQDBcE4G4DagbkcxZ7TGTyCmjNMWCgoIeArWlooJvl3Ig9FY4vL2EvnXH
 w0hYjSm6ShDijRUIDBe/WUldpiFD44BYW11DG4wk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20240103104341epcas2p27258e7aa7f1d87913864c9a8d724708c~m0GBejCIT2677326773epcas2p2m;
 Wed,  3 Jan 2024 10:43:41 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.92]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4T4mXr5YTzz4x9Pr; Wed,  3 Jan
 2024 10:43:40 +0000 (GMT)
X-AuditID: b6c32a43-721fd700000021c8-83-65953a5ca203
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 E2.F8.08648.C5A35956; Wed,  3 Jan 2024 19:43:40 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, "chao@kernel.org" <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Seokhwan Kim <sukka.kim@samsung.com>, Daejun
 Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZZSjXnK1v3fjtf65@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240103104340epcms2p8cb543fd520a516022ac06024f4e82a4e@epcms2p8>
Date: Wed, 03 Jan 2024 19:43:40 +0900
X-CMS-MailID: 20240103104340epcms2p8cb543fd520a516022ac06024f4e82a4e
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmhW6M1dRUgwf3VC1OTz3LZLHqQbjF
 k/WzmC0uLXK3uLxrDpvF+YmvgcIdcxkd2D02repk89i94DOTR9+WVYwenzfJBbBEZdtkpCam
 pBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1XUihLzCkFCgUk
 Fhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRndB69xVbw
 L7Hi4vfzbA2Ma926GDk5JARMJH6//cHaxcjFISSwg1Hi4+oT7F2MHBy8AoISf3cIg9QIC9hI
 LPqxgBnEFhJQkrh2oJcFIq4vsXnxMnYQm01AV+LvhuXsIHNEBDYySaybcZkVJMEsoCpxbsF1
 JohlvBIz2p+yQNjSEtuXb2UEsTkFtCSu3z0IVaMh8WNZLzOELSpxc/Vbdhj7/bH5jBC2iETr
 vbNQNYISD37uhopLSiw6dB5qTr7E3xXX2SDsGomtDW1QcX2Jax0bwW7gFfCVmPDhN1icBejO
 HV0ToOpdJN52zmCBuF9eYvvbOcygMGEW0JRYv0sfxJQQUJY4cguqgk+i4/BfdpgPd8x7ArVJ
 TWLzps2sELaMxIXHbVBXekjsmfiHfQKj4ixEQM9CsmsWwq4FjMyrGMVSC4pz01OTjQoM4XGb
 nJ+7iRGcErWcdzBemf9P7xAjEwfjIUYJDmYlEd716yanCvGmJFZWpRblxxeV5qQWH2I0Bfpy
 IrOUaHI+MCnnlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXA1PbX
 ZcvcL9Lb4l2mnWx/6JBYdOXnHddlXZHHjraV3+hN85gvWSq+5ZjcDQ6xcrGkOzs/Nlz89XCv
 KetphyVvuPQi3/YsP3nkehnb43K+zP/ZnzPzHr6U0HR+ZmbMZtCV88hq4/OEV/df7ZBovBeV
 0Rl5qnLrnxMxhjsb3h9YrBp35IjShyMG05bYOLxb7bPL4ZCAvf4TQdvvMtvvtrQIbGhcP7eL
 e6Z11fPFuSKr2axSEqxfPdywfGH08fBV2mptb4Iii/vVGwQKNLaofrjgHJE3j3th/HkHh/Vz
 FltcXl/McDFw9SNPIaWzB6a2fkrhW1B9evvTktpTHnMnuvl9EmXYm5Kjt9j2nQ67tpDUUSWW
 4oxEQy3mouJEANFcbkoSBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748
References: <ZZSjXnK1v3fjtf65@google.com>
 <20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748@epcms2p1>
 <CGME20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748@epcms2p8>
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 12/28,
 Yonggil Song wrote: > > >From d08b97183bc830779c82b83d94f8b75ad11cb29a
 Mon Sep 17 00:00:00 2001 > > From: Yonggil Song <yonggil.song@samsung.com>
 > > Date: Thu, 7 Dec 2023 16:34:38 +0900 > [...] 
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rKyj2-0007ZV-1j
Subject: Re: [f2fs-dev] (2) [PATCH v4] f2fs: New victim selection for GC
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
Reply-To: yonggil.song@samsung.com
Cc: Siwoo Jung <siu.jung@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 12/28, Yonggil Song wrote:
> > >From d08b97183bc830779c82b83d94f8b75ad11cb29a Mon Sep 17 00:00:00 2001
> > From: Yonggil Song <yonggil.song@samsung.com>
> > Date: Thu, 7 Dec 2023 16:34:38 +0900
> > Subject: [PATCH v4] f2fs: New victim selection for GC
> > 
> > Overview
> > ========
> > 
> > This patch introduces a new way to preference data sections when selecting
> > GC victims. Migration of data blocks causes invalidation of node blocks.
> > Therefore, in situations where GC is frequent, selecting data blocks as
> > victims can reduce unnecessary block migration by invalidating node blocks.
> > For exceptional situations where free sections are insufficient, node blocks
> > are selected as victims instead of data blocks to get extra free sections.
> > 
> > Problem
> > =======
> > 
> > If the total amount of nodes is larger than the size of one section, nodes
> > occupy multiple sections, and node victims are often selected because the
> > gc cost is lowered by data block migration in GC. Since moving the data
> > section causes frequent node victim selection, victim threshing occurs in
> > the node section. This results in an increase in WAF.
> > 
> > Experiment
> > ==========
> > 
> > Test environment is as follows.
> > 
> >         System info
> >           - 3.6GHz, 16 core CPU
> >           - 36GiB Memory
> >         Device info
> >           - a conventional null_blk with 228MiB
> >           - a sequential null_blk with 4068 zones of 8MiB
> >         Format
> >           - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
> >         Mount
> >           - mount <conv null_blk> <mount point>
> >         Fio script
> > 	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
> > 	WAF calculation
> > 	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs
> > 
> > Conclusion
> > ==========
> > 
> > This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
> > the data section was selected first when selecting GC victims. This was
> > achieved by reducing the migration of the node blocks by 69.4%
> > (253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
> > performance with the GC victim selection method in environments where the
> > section size is relatively small.
> > 
> > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > ---
> >  fs/f2fs/f2fs.h |  1 +
> >  fs/f2fs/gc.c   | 99 +++++++++++++++++++++++++++++++++++++++-----------
> >  fs/f2fs/gc.h   |  6 +++
> >  3 files changed, 85 insertions(+), 21 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9043cedfa12b..b2c0adfb2704 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1649,6 +1649,7 @@ struct f2fs_sb_info {
> >  	struct f2fs_mount_info mount_opt;	/* mount options */
> >  
> >  	/* for cleaning operations */
> > +	bool require_node_gc;			/* flag for node GC */
> >  	struct f2fs_rwsem gc_lock;		/*
> >  						 * semaphore for GC, avoid
> >  						 * race between GC and GC or CP
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index f550cdeaa663..d8a81a6ed325 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -341,6 +341,14 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
> >  	unsigned int i;
> >  	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
> >  
> > +	/*
> > +	 * When BG_GC selects victims based on age, it prevents node victims
> > +	 * from being selected. This is because node blocks can be invalidated
> > +	 * by moving data blocks.
> > +	 */
> > +	if (__skip_node_gc(sbi, segno))
> > +		return UINT_MAX;
> > +
> >  	for (i = 0; i < usable_segs_per_sec; i++)
> >  		mtime += get_seg_entry(sbi, start + i)->mtime;
> >  	vblocks = get_valid_blocks(sbi, segno, true);
> > @@ -369,10 +377,24 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
> >  		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> >  
> >  	/* alloc_mode == LFS */
> > -	if (p->gc_mode == GC_GREEDY)
> > -		return get_valid_blocks(sbi, segno, true);
> > -	else if (p->gc_mode == GC_CB)
> > +	if (p->gc_mode == GC_GREEDY) {
> > +		/*
> > +		 * If the data block that the node block pointed to is GCed,
> > +		 * the node block is invalidated. For this reason, we add a
> > +		 * weight to cost of node victims to give priority to data
> > +		 * victims during the gc process. However, in a situation
> > +		 * where we run out of free sections, we remove the weight
> > +		 * because we need to clean up node blocks.
> > +		 */
> > +		unsigned int cost = get_valid_blocks(sbi, segno, true);
> > +
> > +		if (__skip_node_gc(sbi, segno))
> > +			return cost +
> > +				(sbi->segs_per_sec << sbi->log_blocks_per_seg);
> > +		return cost;
> 
> Given the comment, can we use a weight instead of cost?
> 
> -               unsigned int cost = get_valid_blocks(sbi, segno, true);
> +               unsigned int weight = 0;
> 
> -               if (__skip_node_gc(sbi, segno))
> -                       return cost +
> -                               (sbi->segs_per_sec << sbi->log_blocks_per_seg);
> -               return cost;
> +               if (__skip_node_gc(sbi, segno)) {
> +                       weight = sbi->segs_per_sec << sbi->log_blocks_per_seg;
> +
> +               return get_valid_blocks(sbi, segno, true) + weight;
> 

I agree with you. It looks better that there is only one return.

> > +	} else if (p->gc_mode == GC_CB) {
> >  		return get_cb_cost(sbi, segno);
> > +	}
> >  
> >  	f2fs_bug_on(sbi, 1);
> >  	return 0;
> > @@ -557,6 +579,14 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
> >  	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
> >  		goto skip;
> >  
> > +	/*
> > +	 * When BG_GC selects victims based on age, it prevents node victims
> > +	 * from being selected. This is because node blocks can be invalidated
> > +	 * by moving data blocks.
> > +	 */
> > +	if (__skip_node_gc(sbi, ve->segno))
> > +		goto skip;
> > +
> >  	/* age = 10000 * x% * 60 */
> >  	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
> >  								age_weight;
> > @@ -913,7 +943,22 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> >  		goto retry;
> >  	}
> >  
> > +
> 
> Unnecessary line.

OK. I'll fix it.

> 
> >  	if (p.min_segno != NULL_SEGNO) {
> 
> I'm wondering whether we need to modify all the changes below. If we added
> more cost to the node segments, how about just managing require_node_gc in
> the specific cases?
> 

What about the following changes?

@@ -944,20 +944,6 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
        }

        if (p.min_segno != NULL_SEGNO) {
-               if (sbi->require_node_gc &&
-                   IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
-                       /*
-                        * We need to clean node sections. but, data victim
-                        * cost is the lowest. If free sections are enough,
-                        * stop cleaning node victim. If not, it goes on
-                        * by GCing data victims.
-                        */
-                       if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
-                               sbi->require_node_gc = false;
-                               p.min_segno = NULL_SEGNO;
-                               goto out;
-                       }
-               }
 got_it:
                *result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
 got_result:
@@ -1929,6 +1915,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
                goto stop;
        }

+       if (sbi->require_node_gc &&
+           IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
+               /*
+                * We need to clean node sections. but, data victim
+                * cost is the lowest. If free sections are enough,
+                * stop cleaning node victim. If not, it goes on
+                * by GCing data victims.
+                */
+               if (has_enough_free_secs(sbi, sec_freed, 0))
+                       goto stop;
+       }
+
        seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
                                gc_control->should_migrate_blocks);
        total_freed += seg_freed;

> > +		if (sbi->require_node_gc &&
> > +		    IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
> > +			 /*
> > +			  * We need to clean node sections. but, data victim
> > +			  * cost is the lowest. If free sections are enough,
> > +			  * stop cleaning node victim. If not, it goes on
> > +			  * by GCing data victims.
> > +			  */
> 
> 			^-- Wrong indentation.
> 

OK. I'll fix it.

> > +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> > +				sbi->require_node_gc = false;
> > +				p.min_segno = NULL_SEGNO;
> > +				goto out;
> > +			}
> > +		}
> >  got_it:
> >  		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
> >  got_result:
> > @@ -1830,8 +1875,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >  		goto stop;
> >  	}
> >  
> > +	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> > +
> > +	/*
> > +	 * Write checkpoint to reclaim prefree segments.
> > +	 * We need more three extra sections for writer's data/node/dentry.
> > +	 */
> > +	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
> > +		sbi->require_node_gc = true;
> > +
> > +		if (prefree_segments(sbi)) {
> > +			stat_inc_cp_call_count(sbi, TOTAL_CALL);
> > +			ret = f2fs_write_checkpoint(sbi, &cpc);
> > +			if (ret)
> > +				goto stop;
> > +			/* Reset due to checkpoint */
> > +			sec_freed = 0;
> > +		}
> > +	}
> > +
> >  	/* Let's run FG_GC, if we don't have enough space. */
> > -	if (has_not_enough_free_secs(sbi, 0, 0)) {
> > +	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
> >  		gc_type = FG_GC;
> >  
> >  		/*
> > @@ -1882,7 +1946,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >  			if (!gc_control->no_bg_gc &&
> >  			    total_sec_freed < gc_control->nr_free_secs)
> >  				goto go_gc_more;
> > -			goto stop;
> > +			/*
> > +			 * If require_node_gc flag is set even though there
> > +			 * are enough free sections, node cleaning will
> > +			 * continue.
> > +			 */
> > +			if (!sbi->require_node_gc)
> > +				goto stop;
> >  		}
> >  		if (sbi->skipped_gc_rwsem)
> >  			skipped_round++;
> > @@ -1897,21 +1967,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >  		goto stop;
> >  	}
> >  
> > -	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> > -
> > -	/*
> > -	 * Write checkpoint to reclaim prefree segments.
> > -	 * We need more three extra sections for writer's data/node/dentry.
> > -	 */
> > -	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
> > -				prefree_segments(sbi)) {
> > -		stat_inc_cp_call_count(sbi, TOTAL_CALL);
> > -		ret = f2fs_write_checkpoint(sbi, &cpc);
> > -		if (ret)
> > -			goto stop;
> > -		/* Reset due to checkpoint */
> > -		sec_freed = 0;
> > -	}
> >  go_gc_more:
> >  	segno = NULL_SEGNO;
> >  	goto gc_more;
> > @@ -1920,8 +1975,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
> >  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
> >  
> > -	if (gc_type == FG_GC)
> > +	if (gc_type == FG_GC) {
> >  		f2fs_unpin_all_sections(sbi, true);
> > +		sbi->require_node_gc = false;
> > +	}
> >  
> >  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
> >  				get_pages(sbi, F2FS_DIRTY_NODES),
> > diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> > index 28a00942802c..cd07bf125177 100644
> > --- a/fs/f2fs/gc.h
> > +++ b/fs/f2fs/gc.h
> > @@ -166,3 +166,9 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
> >  		free_user_blocks(sbi) <
> >  			limit_free_user_blocks(invalid_user_blocks));
> >  }
> > +
> > +static inline bool __skip_node_gc(struct f2fs_sb_info *sbi, unsigned int segno)
> > +{
> > +	return (IS_NODESEG(get_seg_entry(sbi, segno)->type) &&
> > +		!sbi->require_node_gc);
> > +}
> > -- 
> > 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
