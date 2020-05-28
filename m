Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DD1E69EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 21:00:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeNlS-0008Mc-M5; Thu, 28 May 2020 19:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jeNlR-0008MR-No
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 19:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qymuTSEUOnZcSt+U5dCkvv2EzW9UDM8S472+6Otzo4=; b=IDzJc63+ZzzynuEwTPo4ShAL8s
 31+y4Hua76BG/M2MggOmSPRRzx1YTQa2fPbSCr+Ki2AFIzWtLGD32yrfxBElUd5dmtt++dDfAU7q9
 cLuuKG1e4Z5aAJbIsI61G8Hw3Rzntp+ewFkuiFh0hWhtQYSWR2vhHJMvxntSN4soHNZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5qymuTSEUOnZcSt+U5dCkvv2EzW9UDM8S472+6Otzo4=; b=m3oDFN35bQQ6OrjEnhygkPV+Jq
 M7T8OePUhm7ce7vO3Qd4tJ5E6kM8HPrctVcWIV1d91tthNSi5Lx8AfwassmG3opTyknfkxUxlfxUZ
 JrmlvRl0FHBPOMhhD9IiYhkAr08iyRoUlcb4VoRl8TXuhRyXVwOuNGArXen9b7CJ3eQQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeNlN-001pWQ-HA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 19:00:25 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D8DD208A7;
 Thu, 28 May 2020 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590692411;
 bh=IBEXcJa5SZhZ23qO9uJI7HCaq75DLLMpP4eqn+jfAFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YUCZZwbwvxE/dv74jVYYRkbAOdMaZ60UPrX80T8LV4B2i1Y88+ZdTIbc9gjcNbERe
 IDtz1LMY9A2VZT/seUPpll60XHOAGxnS8FDdWgpp2D1lemfr0XbzXzIY1eHT5v2rcz
 RyEXMS8zfSot99O/44ZbsAIWh53vW2KTlvSV/xIY=
Date: Thu, 28 May 2020 12:00:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200528190010.GA162605@google.com>
References: <20200527102753.15743-1-yuchao0@huawei.com>
 <20200527102753.15743-3-yuchao0@huawei.com>
 <20200527210233.GC206249@google.com>
 <23245f6e-528d-43ab-57b6-4ca16db43fe5@huawei.com>
 <20200528012615.GA232094@google.com>
 <8e30b18d-bf8e-dd2f-35fa-08bbfd1b507e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e30b18d-bf8e-dd2f-35fa-08bbfd1b507e@huawei.com>
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
X-Headers-End: 1jeNlN-001pWQ-HA
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to cover meta flush with
 cp_lock
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

On 05/28, Chao Yu wrote:
> On 2020/5/28 9:26, Jaegeuk Kim wrote:
> > On 05/28, Chao Yu wrote:
> >> On 2020/5/28 5:02, Jaegeuk Kim wrote:
> >>> On 05/27, Chao Yu wrote:
> >>>> meta inode page should be flushed under cp_lock, fix it.
> >>>
> >>> It doesn't matter for this case, yes?
> >>
> >> It's not related to discard issue.
> > 
> > I meant we really need this or not. :P
> 
> Yes, let's keep that rule: flush meta pages under cp_lock, otherwise
> checkpoint flush order may be broken due to race, right? as checkpoint
> should write 2rd cp park page after flushing all meta pages.

Well, this is for shutdown test, and thus we don't need to sync up here.

> 
> > 
> >>
> >> Now, I got some progress, I can reproduce that bug occasionally.
> >>
> >> Thanks,
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>>> ---
> >>>>  fs/f2fs/file.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>> index f7de2a1da528..0fcae4d90074 100644
> >>>> --- a/fs/f2fs/file.c
> >>>> +++ b/fs/f2fs/file.c
> >>>> @@ -2260,7 +2260,9 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> >>>>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> >>>>  		break;
> >>>>  	case F2FS_GOING_DOWN_METAFLUSH:
> >>>> +		mutex_lock(&sbi->cp_mutex);
> >>>>  		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
> >>>> +		mutex_unlock(&sbi->cp_mutex);
> >>>>  		f2fs_stop_checkpoint(sbi, false);
> >>>>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> >>>>  		break;
> >>>> -- 
> >>>> 2.18.0.rc1
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
