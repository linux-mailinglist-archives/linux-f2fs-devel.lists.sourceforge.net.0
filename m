Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F16694E5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 18:48:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRcw9-0006rV-EN;
	Mon, 13 Feb 2023 17:48:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pRcw8-0006rO-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HlrjjGA2cMxW6mCCU5OcAOJpFnuuYf51QfOggTFO+rA=; b=PC4ERBBWE84VAAerUcIHfKf6Po
 FXYdLQ6TV9Wq6Y2qqlzY6RAXNYFE6TIbqVlw0lWLEH1hgIMHhFkGCuXoOhTYPXH9WT5m6HhQw/CVz
 hIGoL2rscUtAVYS9XRksAfVwwIZ+DTnNzidSylyOuPgiCljFWV6jcu/DXSaTdYNvQo0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HlrjjGA2cMxW6mCCU5OcAOJpFnuuYf51QfOggTFO+rA=; b=BiRP0BmspnNIBfCqysWL76n7gX
 H/bA45D6A1pcmE0i40xalHBKIJDjLbVn+Tg1M45+XoLMolUPNNK0YOGQFKbJP+Bf8yZv7fSG3dgNC
 NPfArawC/47UjOYdtYECqs+0GOk7mcKBu2MEWzZwJo4urVp+3+KPiKKq/VRfZXQy1CZk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRcw4-0008HF-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:48:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 336026121A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Feb 2023 17:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBC3C433D2;
 Mon, 13 Feb 2023 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676310489;
 bh=s+Zu2f5zVc4BKI5uEdJvxc75sJaut41fE2PEiEwMQPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BY2V18kbSV/8VrBUAv8ODCkRkxV4Fbnn0cyNFbdy7AOFu6lXaDCQ70kvOP7R0bW/U
 O2klCsErKlEbR+M7DeYt0R8R5izo3mb1IuHfXmxDNuCRPqaZdy+C/hGHWawQQ5Hgxx
 UTC2Rk8w37iuaxG+Rrzy89lffIx/sT1+YmcNPaYMTNzFj1q4V+dGs9uwyRXI7eh5nb
 uC55xhTsVBPKjYyk8E9ULVyc437Opzh9z+sTnVc4QJm/6Oz+bJtIiKrRKs9MZyCXjr
 sw4JzAS8uVU2RHL+EuwfUb765CPb1kR7wCSTU0nWXM7rDVSlDZPE5bn9xgViwNG70Y
 W9g7jrl4XiGdg==
Date: Mon, 13 Feb 2023 09:48:07 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+p311Vi/odYKuC2@google.com>
References: <20230210213250.3471246-1-jaegeuk@kernel.org>
 <1a66e32b-efc0-626b-b585-7f2bfac506a7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a66e32b-efc0-626b-b585-7f2bfac506a7@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/13, Chao Yu wrote: > On 2023/2/11 5:32, Jaegeuk Kim
 wrote: > > MAIN_SEGS is for data area, while TOTAL_SEGS includes data and
 metadata. > > Good catch! > > Could you please add fixes line? It seems this
 is not a bug case, and exisits from the first F2FS patch. :) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRcw4-0008HF-Bu
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong segment count
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

On 02/13, Chao Yu wrote:
> On 2023/2/11 5:32, Jaegeuk Kim wrote:
> > MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.
> 
> Good catch!
> 
> Could you please add fixes line?

It seems this is not a bug case, and exisits from the first F2FS patch. :)

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/segment.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 8ee5e5db9287..6003fbaf4b7d 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -720,7 +720,7 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
> >   static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
> >   {
> > -	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
> > +	f2fs_bug_on(sbi, segno > MAIN_SEGS(sbi) - 1);
> >   }
> >   static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
> > @@ -775,7 +775,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
> >   	/* check segment usage, and check boundary of a given segment number */
> >   	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
> > -					|| segno > TOTAL_SEGS(sbi) - 1)) {
> > +					|| segno > MAIN_SEGS(sbi) - 1)) {
> >   		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
> >   			 GET_SIT_VBLOCKS(raw_sit), segno);
> >   		set_sbi_flag(sbi, SBI_NEED_FSCK);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
