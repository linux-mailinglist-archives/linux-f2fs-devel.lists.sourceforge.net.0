Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A206B7FCC3B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Nov 2023 02:15:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r89Ao-0008Sv-Tj;
	Wed, 29 Nov 2023 01:15:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1r89Am-0008So-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 01:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdD7qkyvJPKZw+6Xc+Riw898bSJmWrUa8Gj5jaIkhlg=; b=We3IL46EjQP2DkKDC1P7/Sz8a2
 TW1uRCS3sJRYyXaWv5+48nM/Uxz1xRDWLtmDScBlVYbuDJeBC2kfs24QpDWDMmAqdtlbzYct8ZKcX
 2oujG53U7TJE4/biRxnlRMV6QnSrVkR0YNeRfC9958/hkbJ/FUGH/N+uis2bCUkuFRR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MdD7qkyvJPKZw+6Xc+Riw898bSJmWrUa8Gj5jaIkhlg=; b=bbiFZjsnWxxcuXHXFzolhkW42n
 V8iCE8LCpMG4dSPo9pr4dG290yd9/Pu1Zx+yZtjMi1QAWbyYsYWsWUpLc8iiP9v/tUdaW0LF7nCrq
 8b9mbUcgLXsLcWZDxm2Q7D167GKCKiOmmkx1yKaRf8iCDe1jxuW4HR8AxPG5FryG0QTI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r89Ac-0008Fh-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 01:15:24 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20231129005638epoutp046d8c963d1911cab072729d3952c199d5~b8geWbwKo0267202672epoutp04V
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Nov 2023 00:56:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20231129005638epoutp046d8c963d1911cab072729d3952c199d5~b8geWbwKo0267202672epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701219398;
 bh=MdD7qkyvJPKZw+6Xc+Riw898bSJmWrUa8Gj5jaIkhlg=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=aea1l64bn/FHRmQC+Z+j0i9GGthMP/ArPzuLidAFKGBfu7PWiRaJW3Vu6kFl4VvP5
 0aqxVlSiLh/qF4RcIVuDRHy4pALlKTXatpNlVUt685fJAMFobMzWx/1l8U0Ibrp8hq
 4IOFqeCVhaLFECywpbP2HD/KDVyQyPNOqhz941NE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20231129005638epcas2p3a5144712871bb604886a846c38063621~b8gd_5fXq0832408324epcas2p32;
 Wed, 29 Nov 2023 00:56:38 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.98]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Sg19d4vQhz4x9Pp; Wed, 29 Nov
 2023 00:56:37 +0000 (GMT)
X-AuditID: b6c32a43-721fd700000021c8-87-65668c453cb9
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.71.08648.54C86656; Wed, 29 Nov 2023 09:56:37 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, "gg@google.com" <gg@google.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZWY5Bntn42SnsclR@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231129005637epcms2p3cb266ba963e17fa1f45777c70a07a474@epcms2p3>
Date: Wed, 29 Nov 2023 09:56:37 +0900
X-CMS-MailID: 20231129005637epcms2p3cb266ba963e17fa1f45777c70a07a474
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmha5rT1qqwYNOVYvTU88yWTw50M5o
 sepBuMX765PYLZ6sn8VssbBtCYvFpUXuFpd3zWGzOD/xNZPFqo65jA5cHgs2lXpsWtXJ5rF7
 wWcmj8V9k1k9+rasYvT4vEkugC0q2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJc
 SSEvMTfVVsnFJ0DXLTMH6C4lhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5x
 Ym5xaV66Xl5qiZWhgYGRKVBhQnbG5HfXmApeplb8bd7K2sC4zqeLkZNDQsBE4vP9m2wgtpDA
 DkaJ2wf4uxg5OHgFBCX+7hAGCQsLeEt8XHmCBaJESeLagV4WiLi+xObFy9hBbDYBXYm/G5aD
 2SICrhJr5twHGsnFwSwwgVniQtdrNohdvBIz2p+yQNjSEtuXb2UEsTkFtCQmfb3ICBHXkPix
 rJcZwhaVuLn6LTuM/f7YfKgaEYnWe2ehagQlHvzcDRWXlFh06DwThJ0v8XfFdai9NRJbG9qg
 4voS1zo2gt3AK+ArsfBhE9h8FgFViffPZ0PNdJE4s+ERWC+zgLzE9rdzmEFhwiygKbF+lz6I
 KSGgLHHkFgtEBZ9Ex+G/7DAf7pj3BGqTmsTmTZtZIWwZiQuP26Cu9JCYvnM70wRGxVmIgJ6F
 ZNcshF0LGJlXMYqlFhTnpqcmGxUYwqM2OT93EyM4gWo572C8Mv+f3iFGJg7GQ4wSHMxKIrx6
 H5NThXhTEiurUovy44tKc1KLDzGaAn05kVlKNDkfmMLzSuINTSwNTMzMDM2NTA3MlcR577XO
 TRESSE8sSc1OTS1ILYLpY+LglGpgKrufdvzD8Spne+aOkmmRSxI2x+rvmX6hfmmGw+2Nh1lP
 mXo41UUr6odynOCftdRtZsWGUqloXRGpxFduK/L5zWdwW6yar7S4pFTc5Pa5kxvOnT2+/c8Z
 wat2Mi911I7NFrt6+/eH0+xPXRQ/X9n+as15+zL/c6syxeTaNcWsak0ZeCP3Xjggqz71jhqD
 5dbShYe6dF5sCP8bbKlUuf6olZvhLEV7jxuJ1+Ij1+68/Vtaz8nzuGKlpMHh4/8+Tc0q4yph
 u/DWpvJ1f3fTPaN2/Zch9ReTLdfk/jAyuJhU+cpFR8y7TWqXH7dHxpMI1XvFCcv5+WfMEL/y
 +cpkzZ78+TM46271rD7X/mrxvc8/lFiKMxINtZiLihMBRngdVikEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff
References: <ZWY5Bntn42SnsclR@google.com> <ZVekM0GmX-Jz4T0C@google.com>
 <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
 <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>
 <20231120112702epcms2p4e4408fed82d4385624eb32b17880e613@epcms2p4>
 <CGME20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/20, Yonggil Song wrote: > > >Hi Yonggil, > > > > > >On
 10/26, Yonggil Song wrote: > > >> Overview > > >> ======== > > >> > > >>
 Introduce a new way to select the data section first when selectin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r89Ac-0008Fh-Gr
Subject: Re: [f2fs-dev] (2) (2) [PATCH v1] f2fs: New victim selection for GC
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
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20, Yonggil Song wrote:
> > >Hi Yonggil,
> > >
> > >On 10/26, Yonggil Song wrote:
> > >> Overview
> > >> ========
> > >> 
> > >> Introduce a new way to select the data section first when selecting a
> > >> victim in foreground GC. This victim selection method works when the
> > >> prefer_data_victim mount option is enabled. If foreground GC migrates only
> > >> data sections and runs out of free sections, it cleans dirty node sections
> > >> to get more free sections.
> > >> 
> > >> Problem
> > >> =======
> > >> 
> > >> If the total amount of nodes is larger than the size of one section, nodes
> > >> occupy multiple sections, and node victims are often selected because the
> > >> gc cost is lowered by data block migration in foreground gc. Since moving
> > >> the data section causes frequent node victim selection, victim threshing
> > >> occurs in the node section. This results in an increase in WAF.
> > >
> > >How does that work w/ ATGC?
> > >
> > 
> > Hi jaegeuk.
> > 
> > I didn't consider ATGC because this feature is only supported by zoned devices(LFS).
> > I didn't add ATGC exception handling because I'm only enabling this feature when
> > it's a zoned device, but should I?
> 
> I'm open to apply this to the existing flow in general. Can you take a look at
> that way?
> 

I see. I'll consider applying this feature to the general GC routine, including ATGC.

thanks.

> > 
> > >> 
> > >> Experiment
> > >> ==========
> > >> 
> > >> Test environment is as follows.
> > >> 
> > >> 	System info
> > >> 	  - 3.6GHz, 16 core CPU
> > >> 	  - 36GiB Memory
> > >> 	Device info
> > >> 	  - a conventional null_blk with 228MiB
> > >> 	  - a sequential null_blk with 4068 zones of 8MiB
> > >> 	Format
> > >> 	  - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
> > >> 	Mount
> > >> 	  - mount -o prefer_data_victim <conv null_blk> <mount point>
> > >> 	Fio script
> > >> 	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
> > >> 	WAF calculation
> > >> 	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs
> > >> 
> > >> Conclusion
> > >> ==========
> > >> 
> > >> This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
> > >> the data section was selected first when selecting GC victims. This was
> > >> achieved by reducing the migration of the node blocks by 69.4%
> > >> (253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
> > >> performance with the GC victim selection method in environments where the
> > >> section size is relatively small.
> > >> 
> > >> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > >> ---
> > >>  Documentation/filesystems/f2fs.rst |   3 +
> > >>  fs/f2fs/f2fs.h                     |   2 +
> > >>  fs/f2fs/gc.c                       | 100 +++++++++++++++++++++++------
> > >>  fs/f2fs/segment.h                  |   2 +
> > >>  fs/f2fs/super.c                    |   9 +++
> > >>  5 files changed, 95 insertions(+), 21 deletions(-)
> > >> 
> > >> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > >> index d32c6209685d..58e6d001d7ab 100644
> > >> --- a/Documentation/filesystems/f2fs.rst
> > >> +++ b/Documentation/filesystems/f2fs.rst
> > >> @@ -367,6 +367,9 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
> > >>  			 pending node write	drop		keep		N/A
> > >>  			 pending meta write	keep		keep		N/A
> > >>  			 ====================== =============== =============== ========
> > >> +prefer_data_victim	 When selecting victims in foreground GC, victims of data type
> > >> +			 are prioritized. This option minimizes GC victim threshing
> > >> +			 in the node section to reduce WAF.
> > >>  ======================== ============================================================
> > >>  
> > >>  Debugfs Entries
> > >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >> index 6d688e42d89c..8b31fa2ea09a 100644
> > >> --- a/fs/f2fs/f2fs.h
> > >> +++ b/fs/f2fs/f2fs.h
> > >> @@ -108,6 +108,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
> > >>  #define	F2FS_MOUNT_GC_MERGE		0x02000000
> > >>  #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
> > >>  #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
> > >> +#define F2FS_MOUNT_PREFER_DATA_VICTIM	0x10000000
> > >>  
> > >>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
> > >>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> > >> @@ -1648,6 +1649,7 @@ struct f2fs_sb_info {
> > >>  	struct f2fs_mount_info mount_opt;	/* mount options */
> > >>  
> > >>  	/* for cleaning operations */
> > >> +	bool need_node_clean;			/* only used for prefer_data_victim */
> > >>  	struct f2fs_rwsem gc_lock;		/*
> > >>  						 * semaphore for GC, avoid
> > >>  						 * race between GC and GC or CP
> > >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > >> index f550cdeaa663..8a2da808a5fb 100644
> > >> --- a/fs/f2fs/gc.c
> > >> +++ b/fs/f2fs/gc.c
> > >> @@ -752,6 +752,8 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> > >>  	unsigned int last_segment;
> > >>  	unsigned int nsearched;
> > >>  	bool is_atgc;
> > >> +	bool is_prefer_data_victim =
> > >> +		test_opt(sbi, PREFER_DATA_VICTIM) && gc_type == FG_GC;
> > >>  	int ret = 0;
> > >>  
> > >>  	mutex_lock(&dirty_i->seglist_lock);
> > >> @@ -767,6 +769,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> > >>  	p.oldest_age = 0;
> > >>  	p.min_cost = get_max_cost(sbi, &p);
> > >>  
> > >> +	if (is_prefer_data_victim) {
> > >> +		p.node_min_cost = p.min_cost;
> > >> +		p.node_min_segno = p.min_segno;
> > >> +	}
> > >> +
> > >>  	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
> > >>  	nsearched = 0;
> > >>  
> > >> @@ -884,9 +891,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> > >>  
> > >>  		cost = get_gc_cost(sbi, segno, &p);
> > >>  
> > >> -		if (p.min_cost > cost) {
> > >> -			p.min_segno = segno;
> > >> -			p.min_cost = cost;
> > >> +		if (is_prefer_data_victim) {
> > >> +			if (IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
> > >> +				/* update data segments victim */
> > >> +				if (p.min_cost > cost) {
> > >> +					p.min_segno = segno;
> > >> +					p.min_cost = cost;
> > >> +				}
> > >> +			} else {
> > >> +				/* update node segments victim */
> > >> +				if (p.node_min_cost > cost) {
> > >> +					p.node_min_segno = segno;
> > >> +					p.node_min_cost = cost;
> > >> +				}
> > >> +			}
> > >> +		} else {
> > >> +			if (p.min_cost > cost) {
> > >> +				p.min_segno = segno;
> > >> +				p.min_cost = cost;
> > >> +			}
> > >>  		}
> > >>  next:
> > >>  		if (nsearched >= p.max_search) {
> > >> @@ -901,6 +924,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
> > >>  		}
> > >>  	}
> > >>  
> > >> +	if (is_prefer_data_victim && sbi->need_node_clean) {
> > >> +		/* we need to clean node sections */
> > >> +		if (p.min_cost > p.node_min_cost) {
> > >> +			p.min_segno = p.node_min_segno;
> > >> +			p.min_cost = p.node_min_cost;
> > >> +		} else {
> > >> +			/*
> > >> +			 * data victim cost is the lowest.
> > >> +			 * if free sections are enough, stop cleaning node victim.
> > >> +			 * if not, it goes on by GCing data victims.
> > >> +			 */
> > >> +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> > >> +				sbi->need_node_clean = false;
> > >> +				p.min_segno = NULL_SEGNO;
> > >> +				goto out;
> > >> +			}
> > >> +		}
> > >> +	}
> > >> +
> > >>  	/* get victim for GC_AT/AT_SSR */
> > >>  	if (is_atgc) {
> > >>  		lookup_victim_by_age(sbi, &p);
> > >> @@ -1830,8 +1872,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > >>  		goto stop;
> > >>  	}
> > >>  
> > >> +	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> > >> +
> > >> +	/*
> > >> +	 * Write checkpoint to reclaim prefree segments.
> > >> +	 * We need more three extra sections for writer's data/node/dentry.
> > >> +	 */
> > >> +	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
> > >> +		if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> > >> +			sbi->need_node_clean = true;
> > >> +		}
> > >> +		if (prefree_segments(sbi)) {
> > >> +			ret = f2fs_write_checkpoint(sbi, &cpc);
> > >> +			if (ret)
> > >> +				goto stop;
> > >> +			/* Reset due to checkpoint */
> > >> +			sec_freed = 0;
> > >> +		}
> > >> +	}
> > >> +
> > >>  	/* Let's run FG_GC, if we don't have enough space. */
> > >> -	if (has_not_enough_free_secs(sbi, 0, 0)) {
> > >> +	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
> > >>  		gc_type = FG_GC;
> > >>  
> > >>  		/*
> > >> @@ -1882,7 +1943,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > >>  			if (!gc_control->no_bg_gc &&
> > >>  			    total_sec_freed < gc_control->nr_free_secs)
> > >>  				goto go_gc_more;
> > >> -			goto stop;
> > >> +			if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> > >> +				/*
> > >> +				 * If the need_node_clean flag is set
> > >> +				 * even though there are enough free
> > >> +				 * sections, node cleaning will continue.
> > >> +				 */
> > >> +				if (!sbi->need_node_clean)
> > >> +					goto stop;
> > >> +			} else {
> > >> +				goto stop;
> > >> +			}
> > >>  		}
> > >>  		if (sbi->skipped_gc_rwsem)
> > >>  			skipped_round++;
> > >> @@ -1897,21 +1968,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > >>  		goto stop;
> > >>  	}
> > >>  
> > >> -	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> > >> -
> > >> -	/*
> > >> -	 * Write checkpoint to reclaim prefree segments.
> > >> -	 * We need more three extra sections for writer's data/node/dentry.
> > >> -	 */
> > >> -	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
> > >> -				prefree_segments(sbi)) {
> > >> -		stat_inc_cp_call_count(sbi, TOTAL_CALL);
> > >> -		ret = f2fs_write_checkpoint(sbi, &cpc);
> > >> -		if (ret)
> > >> -			goto stop;
> > >> -		/* Reset due to checkpoint */
> > >> -		sec_freed = 0;
> > >> -	}
> > >>  go_gc_more:
> > >>  	segno = NULL_SEGNO;
> > >>  	goto gc_more;
> > >> @@ -1920,8 +1976,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > >>  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
> > >>  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
> > >>  
> > >> -	if (gc_type == FG_GC)
> > >> +	if (gc_type == FG_GC) {
> > >>  		f2fs_unpin_all_sections(sbi, true);
> > >> +		sbi->need_node_clean = false;
> > >> +	}
> > >>  
> > >>  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
> > >>  				get_pages(sbi, F2FS_DIRTY_NODES),
> > >> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > >> index 2ca8fb5d0dc4..d55fa1fee2e0 100644
> > >> --- a/fs/f2fs/segment.h
> > >> +++ b/fs/f2fs/segment.h
> > >> @@ -197,8 +197,10 @@ struct victim_sel_policy {
> > >>  	unsigned int offset;		/* last scanned bitmap offset */
> > >>  	unsigned int ofs_unit;		/* bitmap search unit */
> > >>  	unsigned int min_cost;		/* minimum cost */
> > >> +	unsigned int node_min_cost;	/* minimum cost of node type section */
> > >>  	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
> > >>  	unsigned int min_segno;		/* segment # having min. cost */
> > >> +	unsigned int node_min_segno;	/* node segment # having min. cost */
> > >>  	unsigned long long age;		/* mtime of GCed section*/
> > >>  	unsigned long long age_threshold;/* age threshold */
> > >>  };
> > >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > >> index a8c8232852bb..133137dd6fd0 100644
> > >> --- a/fs/f2fs/super.c
> > >> +++ b/fs/f2fs/super.c
> > >> @@ -165,6 +165,7 @@ enum {
> > >>  	Opt_memory_mode,
> > >>  	Opt_age_extent_cache,
> > >>  	Opt_errors,
> > >> +	Opt_prefer_data_victim,
> > >>  	Opt_err,
> > >>  };
> > >>  
> > >> @@ -245,6 +246,7 @@ static match_table_t f2fs_tokens = {
> > >>  	{Opt_memory_mode, "memory=%s"},
> > >>  	{Opt_age_extent_cache, "age_extent_cache"},
> > >>  	{Opt_errors, "errors=%s"},
> > >> +	{Opt_prefer_data_victim, "prefer_data_victim"},
> > >>  	{Opt_err, NULL},
> > >>  };
> > >>  
> > >> @@ -1286,6 +1288,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > >>  			}
> > >>  			kfree(name);
> > >>  			break;
> > >> +		case Opt_prefer_data_victim:
> > >> +			if (!f2fs_sb_has_blkzoned(sbi)) {
> > >> +				f2fs_err(sbi, "prefer_data_victim is only allowed with zoned block device feature");
> > >> +				return -EINVAL;
> > >> +			}
> > >> +			set_opt(sbi, PREFER_DATA_VICTIM);
> > >> +			break;
> > >>  		default:
> > >>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
> > >>  				 p);
> > >> -- 
> > >> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
