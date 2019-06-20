Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5154C662
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 06:58:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdp9a-000322-CF; Thu, 20 Jun 2019 04:58:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1hdp9Y-00031l-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 04:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f/yjM4uSub3DdzevY7uwhzefhRpJW/Kgms41rrg8nac=; b=CPflgpZh6U3urgoO9bH30S0br7
 KSGkn1MdcZ6sNJLDrmii7Sa8MNqDFNyfO1OZ3aOxiJG1X8JNFze7G0XX/5A/fUcN8f+fz+DA+o9Sj
 BXezQ67RB2WKUabqVNcC38ErIYbz+6Nnku9XE1BMoxnV6OvPtGmn5ZmVNye2ZhgjaAnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f/yjM4uSub3DdzevY7uwhzefhRpJW/Kgms41rrg8nac=; b=ZFElhETGrFhGtVX29gqh8wFOS1
 1IxZtEdQfvgwNXUVYJWMWRjLGJsIFm7ma9unirlDhlywkQgPUMrTPVrQIvWCDAPpj5bgrgihlZUHN
 e0jkKF1NoyjuByBpdMUwmknQA6W4BCzH2/frjUDXD1p9fcb4JnZPf8m3pNZVkRiQYQes=;
Received: from smtprelay0223.hostedemail.com ([216.40.44.223]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdp9X-000tqT-6I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 04:58:29 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 1F1E583777F0;
 Thu, 20 Jun 2019 04:58:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::,
 RULES_HIT:41:355:379:599:800:960:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2110:2393:2525:2559:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3870:3871:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7576:7875:9025:10004:10400:10848:11232:11657:11658:11914:12043:12295:12438:12555:12698:12737:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21347:21365:21433:21627:30054:30070:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:66,
 LUA_SUMMARY:none
X-HE-Tag: meal99_65e1ef7a9d936
X-Filterd-Recvd-Size: 2249
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Thu, 20 Jun 2019 04:58:20 +0000 (UTC)
Message-ID: <e1f85a06454a88ee72f03f60cc55a30b60676df4.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 19 Jun 2019 21:58:18 -0700
In-Reply-To: <96d46153-8bf8-b152-2ae3-3ddeac0ba914@huawei.com>
References: <20190618094842.19332-1-yuchao0@huawei.com>
 <20190619180150.GC57884@jaegeuk-macbookpro.roam.corp.google.com>
 <bf8ad99f0f5d1cb5adde3eb6046a226c78930730.camel@perches.com>
 <20190619205232.GD57884@jaegeuk-macbookpro.roam.corp.google.com>
 <96d46153-8bf8-b152-2ae3-3ddeac0ba914@huawei.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: perches.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.223 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdp9X-000tqT-6I
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

On Thu, 2019-06-20 at 10:08 +0800, Chao Yu wrote:
> On 2019/6/20 4:52, Jaegeuk Kim wrote:
> > On 06/19, Joe Perches wrote:
> > > On Wed, 2019-06-19 at 11:01 -0700, Jaegeuk Kim wrote:
> > > > On 06/18, Chao Yu wrote:
> > > > > From: Joe Perches <joe@perches.com>
> > > > > 
> > > > > - Add and use f2fs_<level> macros
> > > > > - Convert f2fs_msg to f2fs_printk
> > > > > - Remove level from f2fs_printk and embed the level in the format
> > > > > - Coalesce formats and align multi-line arguments
> > > > > - Remove unnecessary duplicate extern f2fs_msg f2fs.h
> > > > 
> > > > Can we just use sbi for f2fs_<level>?
> > > 
> > > Not really.  see below:
> > 
> > Since sbi = F2FS_SB(sb), I don't see any problem.
> > 
> > > > And, could you please change missing
> > > > f2fs_msg() in the latest dev?
> > > 
> > > Anyone is welcome to refresh the patch as necessary
> > > or appropriate.
> > 
> > Could you please take a look at this?
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=697743b1c1025483c97c740cd8834711be4294eb
> 
> Looks good to me.

Me too.  cheers, Joe




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
