Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C93DC0E2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 00:19:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9aqR-0000Y8-9I; Fri, 30 Jul 2021 22:19:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m9aqQ-0000Xw-7S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fsLtJYUpnpAwumIR728Alpmc8s0xNot2T8qw1HOrtx0=; b=VQ48wBG/wJzsSpJm4AUOGJcFUR
 KNf4+VieqZr+HJAmIAHHBJvBFIBQ6ejo597OHO4kM6f/8qbryNxUr5QdHRdg5CWZfyChKWdxW8KGT
 D2PyFxFXtEEzhXtNs5ET4Hd8lVPaOVZvHAaIejlFFJJF/WlsGU2a2pMq9wHNIR9tDoOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fsLtJYUpnpAwumIR728Alpmc8s0xNot2T8qw1HOrtx0=; b=RRKN+qOm53AxXgzlxaxHiynkLU
 PNsPAesVFvL0LGXDwQum8JMy2aBX9JRpO6rSDxOL6c7/f90JFikuUVc+zOBAdrlU7KvRRtojOpEB6
 PQlRP9fVKI3XEowX/z82p15rWHGmRCbAgAGuOcRgWBEqkYGX9TbuCOzyNkT0+37sCGq0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9aqO-0003r8-FZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:19:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F302A610A6;
 Fri, 30 Jul 2021 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627683539;
 bh=gIRZmLSHg2oCuCzzrUdAVmZR964QJKWRL7lSRznz+70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+D/i0H9E9aW7yh91QtXvqeP2ApTvE2MS8e1tb15PTb0AlrYv3fi+CEz4OluJl4kb
 Ntd6VtQQ8k1Ez74u/XilPdo6nC7ZZ6MqfurtqzLiGml5N5UOvTjCe086I9B6BrmYaz
 WRtEWqwsYUvvVc2aQVbippDp/SWHSodBI+VYBUHURmnnTJBk9BPBSyM66sr3lrRHff
 ZuTVnsOuPXb4xApJTJQhOMtXjI2Ai4f5oE34B4/VpM2Wywwz/77vlyc67EUJ8AkGrT
 /kqy3L6M6B0gZcGe8W8AwAZWQfyiv1N4/+ruVFabY/IAUvVXUo3xtev3eManj0XwcO
 dR/VUQZ0pkKPQ==
Date: Fri, 30 Jul 2021 15:18:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQR60QUh0Pim8vSf@google.com>
References: <20210427082106.2755-1-frank.li@vivo.com>
 <12ae52df-bc5e-82c3-4f78-1eafe7723f93@huawei.com>
 <5f37995c-2390-e8ca-d002-3639ad39e0d3@kernel.org>
 <YPXDtEyBg5W2ToD/@google.com>
 <8d2e3a63-72f9-bcb2-24e5-dddd84136001@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d2e3a63-72f9-bcb2-24e5-dddd84136001@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9aqO-0003r8-FZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: reset free segment to prefree status
 when do_checkpoint() fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Chao Yu wrote:
> On 2021/7/20 2:25, Jaegeuk Kim wrote:
> > On 07/19, Chao Yu wrote:
> > > On 2021/4/27 20:37, Chao Yu wrote:
> > > > I think just reverting dirty/free bitmap is not enough if checkpoint fails,
> > > > due to we have updated sbi->cur_cp_pack and nat/sit bitmap, next CP tries
> > > > to overwrite last valid meta/node/data, then filesystem will be corrupted.
> > > > 
> > > > So I suggest to set cp_error if do_checkpoint() fails until we can handle
> > > > all cases, which is not so easy.
> > > > 
> > > > How do you think?
> > > 
> > > Let's add below patch first before you figure out the patch which covers all
> > > things.
> > > 
> > >  From 3af957c98e9e04259f8bb93ca0b74ba164f3f27e Mon Sep 17 00:00:00 2001
> > > From: Chao Yu <chao@kernel.org>
> > > Date: Mon, 19 Jul 2021 16:37:44 +0800
> > > Subject: [PATCH] f2fs: fix to stop filesystem update once CP failed
> > > 
> > > During f2fs_write_checkpoint(), once we failed in
> > > f2fs_flush_nat_entries() or do_checkpoint(), metadata of filesystem
> > > such as prefree bitmap, nat/sit version bitmap won't be recovered,
> > > it may cause f2fs image to be inconsistent, let's just set CP error
> > > flag to avoid further updates until we figure out a scheme to rollback
> > > all metadatas in such condition.
> > > 
> > > Reported-by: Yangtao Li <frank.li@vivo.com>
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   fs/f2fs/checkpoint.c | 10 +++++++---
> > >   1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > index 6c208108d69c..096c85022f62 100644
> > > --- a/fs/f2fs/checkpoint.c
> > > +++ b/fs/f2fs/checkpoint.c
> > > @@ -1639,8 +1639,10 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> > > 
> > >   	/* write cached NAT/SIT entries to NAT/SIT area */
> > >   	err = f2fs_flush_nat_entries(sbi, cpc);
> > > -	if (err)
> > > +	if (err) {
> > > +		f2fs_stop_checkpoint(sbi, false);
> > 
> > I think we should abuse this, since we can get any known ENOMEM as well.
> 
> Yup, but one critical issue here is it can break A/B update of NAT area,
> so, in order to fix this hole, how about using NOFAIL memory allocation
> in f2fs_flush_nat_entries() first until we figure out the finial scheme?

NOFAIL is risky, so how about adding a retry logic on ENOMEM with a message
and then giving up if we can't get the memory? BTW, what about EIO or other
family?

> 
> Thanks,
> 
> > 
> > >   		goto stop;
> > > +	}
> > > 
> > >   	f2fs_flush_sit_entries(sbi, cpc);
> > > 
> > > @@ -1648,10 +1650,12 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> > >   	f2fs_save_inmem_curseg(sbi);
> > > 
> > >   	err = do_checkpoint(sbi, cpc);
> > > -	if (err)
> > > +	if (err) {
> > > +		f2fs_stop_checkpoint(sbi, false);
> > >   		f2fs_release_discard_addrs(sbi);
> > > -	else
> > > +	} else {
> > >   		f2fs_clear_prefree_segments(sbi, cpc);
> > > +	}
> > > 
> > >   	f2fs_restore_inmem_curseg(sbi);
> > >   stop:
> > > -- 
> > > 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
