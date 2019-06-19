Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA64C0AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 20:19:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdfBT-0007Da-8W; Wed, 19 Jun 2019 18:19:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1hdfBR-0007DS-L5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 18:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGcsQZPHZpFralX0O62WUveEvqbXiubtTRGdDF4zNjU=; b=RcTPORLEaFZoYj99nuV8OdewSx
 YJB/2oQZJYmfmBYo/BrK2NPdpRQGLUJgOHC47++6oy4LUr4+yUoOy6rQQXMQ82Zn798zzwK+u4JUu
 fV5CQETrMhPGyoH5xeoXDSQ1JxkHUTN3/0y0Y0euuxt4ZI8/2I0MYBDwAabBaK2G/+Q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rGcsQZPHZpFralX0O62WUveEvqbXiubtTRGdDF4zNjU=; b=huhlLWZN23HtMp+bgn20GA6YXs
 SzGqBn/NRf/DSWUtx7AWX3+lqQ9BXXMwB6J37tDqxoz2YS6qpoJHqj1HUUdEErt3S1LwtWPcs1Qox
 Ty3IY9hZFp0lpUGcYJbEAn6hw+Ve7vr8rubOcFkrhejZlsorejxusiL856PX9bpE3ma4=;
Received: from smtprelay0219.hostedemail.com ([216.40.44.219]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdfBQ-0055pn-K1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 18:19:46 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 7D2E9180A8859;
 Wed, 19 Jun 2019 18:19:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::,
 RULES_HIT:41:355:379:599:800:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3873:4321:5007:7576:7875:10004:10400:10848:11026:11232:11658:11914:12043:12295:12296:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:30054:30062:30070:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:36,
 LUA_SUMMARY:none
X-HE-Tag: walk76_36e891fd5be16
X-Filterd-Recvd-Size: 2275
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 19 Jun 2019 18:19:37 +0000 (UTC)
Message-ID: <bf8ad99f0f5d1cb5adde3eb6046a226c78930730.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Wed, 19 Jun 2019 11:19:35 -0700
In-Reply-To: <20190619180150.GC57884@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190618094842.19332-1-yuchao0@huawei.com>
 <20190619180150.GC57884@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: perches.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.219 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdfBQ-0055pn-K1
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce f2fs_<level> macros to wrap
 f2fs_printk()
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

On Wed, 2019-06-19 at 11:01 -0700, Jaegeuk Kim wrote:
> On 06/18, Chao Yu wrote:
> > From: Joe Perches <joe@perches.com>
> > 
> > - Add and use f2fs_<level> macros
> > - Convert f2fs_msg to f2fs_printk
> > - Remove level from f2fs_printk and embed the level in the format
> > - Coalesce formats and align multi-line arguments
> > - Remove unnecessary duplicate extern f2fs_msg f2fs.h
> 
> Can we just use sbi for f2fs_<level>?

Not really.  see below:

> And, could you please change missing
> f2fs_msg() in the latest dev?

Anyone is welcome to refresh the patch as necessary
or appropriate.

> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
[]
> > @@ -261,35 +264,29 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
> >  	int ret = -EINVAL;
> >  
> >  	if (sb_any_quota_loaded(sb) && !F2FS_OPTION(sbi).s_qf_names[qtype]) {
> > -		f2fs_msg(sb, KERN_ERR,
> > -			"Cannot change journaled "
> > -			"quota options when quota turned on");
> > +		f2fs_err(sb, "Cannot change journaled quota options when quota turned on");
> >  		return -EINVAL;
> >  	}
> >  	if (f2fs_sb_has_quota_ino(sbi)) {
> > -		f2fs_msg(sb, KERN_INFO,
> > -			"QUOTA feature is enabled, so ignore qf_name");
> > +		f2fs_info(sb, "QUOTA feature is enabled, so ignore qf_name");
> >  		return 0;
> >  	}

etc...




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
