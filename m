Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAF6672E72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 02:49:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIK3g-0000vI-A9;
	Thu, 19 Jan 2023 01:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pIK3f-0000vC-3a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 01:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4F3Zs3w22GO5X/MIW7hv2fq/TwBgb+OFG6dSf4fyTc=; b=STBzf2AnVG+Tu2z+CJaGjNkMPd
 Vg5SeGU8Z3aBT0P2NssRiCeqZpdw/N2LfKoLd+jITGMK1KFKcRA7KPXpCucOmEp/DMalTTEQ5OA1V
 +phPawu+BTcWoeJtPWI5jqYks2vsZUZvlo3Z9Nc0hWWgom+/cPQyfEJxlMPYA2boGHzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g4F3Zs3w22GO5X/MIW7hv2fq/TwBgb+OFG6dSf4fyTc=; b=TjJ1WLDff0J1Amqv7ekWwZoy+p
 dRGHzs6PrBXp8sCz7UxdRwQGoIHy2U+wAaD+n2F/tBZyc+HAZSHRtuNb9JEzGYSyIgAhbpGowa0ig
 WMLjTmTY3rmnNnM7PqSqUjw8GzGzY5wzmP7uoviNQNyMKTkIdEdaXJny3kYiiKxBNfbY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIK3a-008Tqk-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 01:49:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36D24B81FBC;
 Thu, 19 Jan 2023 01:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B544DC433EF;
 Thu, 19 Jan 2023 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674092966;
 bh=fdFF2OaMWXDBkxzhr2snVJKR68kmvzno7bMlUn5Eirc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BjIj96GxNIV0MW/vuyH04/n8Eqb8E2EVCjs+0hLQ2jHOTMDjX1NMhwAMeijmBN46A
 xLLSLvnqVIx2Fl4s8WIRhTwGlrDvbvgnk8Kbd1/52ZEMun58Bm1tgiWQ6hD9UaxWCz
 2BjiPPynSKp1uMHWnwSKJXtTKwjcj6k3fPhTou1voD47B0ADwhnHkGVUlhoT7PRsbh
 eFLfPTz1zfa17SZ5pFCkRn5KePPM0iLfNUTUlo1RyPUAPV4On2Jw4cNhzjOdk2kV+f
 6TzUzfGdSAWKHAkwW1Qo+HjyiBeTDQ9h/7x/WT7ZbCBHJAqaMDNF4qYJoNEoC7BoG/
 YniDwLC78ya+Q==
Date: Wed, 18 Jan 2023 17:49:25 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y8ihpXw81e2FH2um@google.com>
References: <da57fbad-8242-eb1e-ab2b-322d61d0762d@kernel.org>
 <20230116134755.40119-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116134755.40119-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/16, Yangtao Li wrote: > Hi Chao,
 > > > Maybe it's betterr
 to merge these two check condition as below? > > > > if (iotype >=
 NR_PAGE_TYPE)
 { > > f2fs_bug_on(sbi, iotype != META_FLUSH); > > iotyp [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIK3a-008Tqk-Nr
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to avoid potential memory
 corruption in __update_iostat_latency()
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

On 01/16, Yangtao Li wrote:
> Hi Chao,
> 
> > Maybe it's betterr to merge these two check condition as below?
> >
> > if (iotype >= NR_PAGE_TYPE) {
> > 	f2fs_bug_on(sbi, iotype != META_FLUSH);
> > 	iotype = META;
> > }
> 
> For normal , only META_FLUSH will be greater than NR_PAGE_TYPE,
> there is no problem with this logic.
> 
> >
> > For CHECK_FS is off case, I guess it's fine to not return and just print
> > warning message for notice.
> 
> But if there is an exception, we don't know the type we originally wanted to count.
> If they are all changed to meta, it is possible to get a wrong statistic. I think
> there is no need to make statistics on this kind of error scene. Just like in the
> next patch, if iostat_lat_type is wrong, we should return directly instead of changing
> the value beyond the range to WRITE_ASYNC_IO.
> 
> So it's no need tp merge these two check condition?

I also prefer to do like Chao's comment. We don't need to expect such exception
at all.

And, it seems we just need to do like:

	enum page_type iotype;

	if (iotype == META_FLUSH) {
		iotype = META;
	} else if (iotype >= NR_PAGE_TYPE) {
		f2fs_warn();
		return;
	}

> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
