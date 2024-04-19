Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E38AB56B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Apr 2024 21:10:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rxtd9-0001Kn-C9;
	Fri, 19 Apr 2024 19:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rxtd8-0001Kg-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 19:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFOM7zkrDqzslQFGGY9fBmzyx/H3TkQq06LV96cQ9TM=; b=Y+EUNg0iG22NeCdCanT2Z5pI00
 IVENEK0Uq6L0J1XRO8Ns3k7T03CFKPLEO2owbMymC/uvY5h4iCJuL/HzQPAzNRyFQpdGa6j5J1JW5
 LCnyjXUFPZJTd6uJOjZ29vjDBjeYjxZFtR9umTMZJj0U6FKYbRNDGYemSYWw0gfZQR1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fFOM7zkrDqzslQFGGY9fBmzyx/H3TkQq06LV96cQ9TM=; b=IMHxqVirPE6lNq5GmI972UrwOV
 VwmBQJHiv8FtMnPMu3Sn64eh6u3EEWo7tbrerDaH/zQXYC+V71m6kPO072zpFCRCpdyxS1wWdg85L
 9BriWX9o0uJzkKaq8Qdrwn5pSjwGAFJP3Fz9sJVjZtQydGr++OLC6/pz/pSYAjz4oqzs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxtd6-00066J-TM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 19:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10E59CE1B59
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Apr 2024 17:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25506C072AA;
 Fri, 19 Apr 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713549213;
 bh=iOvCT/WvjvN0ne6jZc9fwVFe6Ol/RX862VOzAL9BN1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VBtjoHLwKWN8PyJUUavjS656eJDpK3ndwx8vLbu9zKavIHlwlUckNNnvGQR2QCa88
 Wlf+Pr8enEhSNpdWhHMnXCvW4akR++qh94/hqFgGS3DeU6sAzOdnnBmJfKAT8aF2dV
 Cy9MD1+Pe9ZbvaQC3Y90yLFTeowxkZW3CssDcXQtUFBeUDN75JDFh/8weT8xDGx9sp
 ayBEnxvEqFSEAu7uH5PKKHxfwnW70aSpacGNEm1/ajw8soyfEjk69PDRH8f4E/C7kZ
 XYRdkcG0U+elu3/3z96LAHB+AkeUdHzhjFaZcYDTthwJTNOJ1nVkp0fD5OqnMOoLXs
 Lw9PVugidVzDw==
Date: Fri, 19 Apr 2024 17:53:31 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZiKvm57zbjq_ZpZj@google.com>
References: <20240417211201.3919770-1-jaegeuk@kernel.org>
 <afe91331-92a5-4ccf-b5b3-095a2d65f0d0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afe91331-92a5-4ccf-b5b3-095a2d65f0d0@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/18, Chao Yu wrote: > On 2024/4/18 5:12, Jaegeuk Kim
 wrote: > > This reverts commit 930e2607638d ("f2fs: remove obsolete
 whint_mode"), 
 as we > > decide to pass write hints to the disk. > > > > Si [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rxtd6-00066J-TM
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign the write hint per stream by
 default
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

On 04/18, Chao Yu wrote:
> On 2024/4/18 5:12, Jaegeuk Kim wrote:
> > This reverts commit 930e2607638d ("f2fs: remove obsolete whint_mode"), as we
> > decide to pass write hints to the disk.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   Documentation/filesystems/f2fs.rst | 29 +++++++++++++++
> >   fs/f2fs/data.c                     |  2 +
> >   fs/f2fs/f2fs.h                     |  2 +
> >   fs/f2fs/segment.c                  | 59 ++++++++++++++++++++++++++++++
> >   4 files changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > index efc3493fd6f8..68a0885fb5e6 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -774,6 +774,35 @@ In order to identify whether the data in the victim segment are valid or not,
> >   F2FS manages a bitmap. Each bit represents the validity of a block, and the
> >   bitmap is composed of a bit stream covering whole blocks in main area.
> > +Write-hint Policy
> > +-----------------
> > +
> > +F2FS sets the whint all the time with the below policy.
> 
> No user-based mode?

Not anymore, as there's no user.

> 
> Thanks,
> 
> > +
> > +===================== ======================== ===================
> > +User                  F2FS                     Block
> > +===================== ======================== ===================
> > +N/A                   META                     WRITE_LIFE_NONE|REQ_META
> > +N/A                   HOT_NODE                 WRITE_LIFE_NONE
> > +N/A                   WARM_NODE                WRITE_LIFE_MEDIUM
> > +N/A                   COLD_NODE                WRITE_LIFE_LONG
> > +ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> > +extension list        "                        "
> > +
> > +-- buffered io
> > +N/A                   COLD_DATA                WRITE_LIFE_EXTREME
> > +N/A                   HOT_DATA                 WRITE_LIFE_SHORT
> > +N/A                   WARM_DATA                WRITE_LIFE_NOT_SET
> > +
> > +-- direct io
> > +WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
> > +WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
> > +WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
> > +WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
> > +WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
> > +WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
> > +===================== ======================== ===================
> > +
> >   Fallocate(2) Policy
> >   -------------------
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 5d641fac02ba..ed7d08785fcf 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -465,6 +465,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
> >   	} else {
> >   		bio->bi_end_io = f2fs_write_end_io;
> >   		bio->bi_private = sbi;
> > +		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
> > +						fio->type, fio->temp);
> >   	}
> >   	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index dd530dc70005..b3b878acc86b 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3745,6 +3745,8 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >   int __init f2fs_create_segment_manager_caches(void);
> >   void f2fs_destroy_segment_manager_caches(void);
> >   int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
> > +enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> > +			enum page_type type, enum temp_type temp);
> >   unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> >   			unsigned int segno);
> >   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index f0da516ba8dc..daa94669f7ee 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3364,6 +3364,65 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
> >   	}
> >   }
> > +/*
> > + * This returns write hints for each segment type. This hints will be
> > + * passed down to block layer as below by default.
> > + *
> > + * User                  F2FS                     Block
> > + * ----                  ----                     -----
> > + *                       META                     WRITE_LIFE_NONE|REQ_META
> > + *                       HOT_NODE                 WRITE_LIFE_NONE
> > + *                       WARM_NODE                WRITE_LIFE_MEDIUM
> > + *                       COLD_NODE                WRITE_LIFE_LONG
> > + * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> > + * extension list        "                        "
> > + *
> > + * -- buffered io
> > + *                       COLD_DATA                WRITE_LIFE_EXTREME
> > + *                       HOT_DATA                 WRITE_LIFE_SHORT
> > + *                       WARM_DATA                WRITE_LIFE_NOT_SET
> > + *
> > + * -- direct io
> > + * WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
> > + * WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
> > + * WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
> > + * WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
> > + * WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
> > + * WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
> > + */
> > +enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
> > +				enum page_type type, enum temp_type temp)
> > +{
> > +	switch (type) {
> > +	case DATA:
> > +		switch (temp) {
> > +		case WARM:
> > +			return WRITE_LIFE_NOT_SET;
> > +		case HOT:
> > +			return WRITE_LIFE_SHORT;
> > +		case COLD:
> > +			return WRITE_LIFE_EXTREME;
> > +		default:
> > +			return WRITE_LIFE_NONE;
> > +		}
> > +	case NODE:
> > +		switch (temp) {
> > +		case WARM:
> > +			return WRITE_LIFE_MEDIUM;
> > +		case HOT:
> > +			return WRITE_LIFE_NONE;
> > +		case COLD:
> > +			return WRITE_LIFE_LONG;
> > +		default:
> > +			return WRITE_LIFE_NONE;
> > +		}
> > +	case META:
> > +		return WRITE_LIFE_NONE;
> > +	default:
> > +		return WRITE_LIFE_NONE;
> > +	}
> > +}
> > +
> >   static int __get_segment_type_2(struct f2fs_io_info *fio)
> >   {
> >   	if (fio->type == DATA)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
