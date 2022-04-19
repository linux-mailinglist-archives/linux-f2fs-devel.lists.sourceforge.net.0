Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE2507D0C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 01:04:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngwtH-0003rP-1g; Tue, 19 Apr 2022 23:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ngwtF-0003rJ-DU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sRVeJnUzio24zDuETO9u7mFPrKzzXprblG59Ma9xVIM=; b=DPChPlN/ZPs1Y5PLR35KXTXeTa
 8jkBW4OgrNcA0XlIC9EC2UBPsviz5H0pT+LiHEWdxq7QnLepSGN/oq469iQswVvpfKwhM9fhpbZfG
 mWZ6g0S9w4pWinWyaW637oLeFXDaVKLi0r4Ji+R8eye8BdKa3qk0Jy2ZKC9W3yAbs+sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sRVeJnUzio24zDuETO9u7mFPrKzzXprblG59Ma9xVIM=; b=c7Q1P3Mg0KIiPkZrXakZc3wzhr
 4tV1umq8fmsNudhoGq/XvsshUxOuV4ctkZTXP2ovw3r0PF5vfEcSypn3VMcqrYPut2QvYyG1jbOmp
 BZ1CFCY96xGb8T/L8G7QFnn6defCy5TmMgAISaplyWIIXo4Xd0xUSz+JgLKFHLohxkuY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngwtD-004F9N-7i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:04:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 708C160DCB;
 Tue, 19 Apr 2022 23:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B4BC385A7;
 Tue, 19 Apr 2022 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650409434;
 bh=wS2PKmGNATN5f3GbinbmpXDADMVPc10a3dO9Z2MdNEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHgkpayk9ZrKC9cKGkGzKR2gPOjO1fbHYrGPhnfamYSAGEZCdKLNOEoxQdaJByinq
 YiG6H2CcxC4sZ5M056fP60hWJJlwX1eh4yJvdQffJhXlu40Z0q5fBNP9510Cyezd8V
 ejjbWD4vuCp1U14GXhQp8/bfQFb+oBwCu1Okf4hkMXH+5dgf0sT7qeAf5Ag3Adm3TL
 PRY3rU4H66IGB9wXC4q55DvRfT+xwGoHRy4i9Fjp8vuIpLPDidEyy4SKRMwBY4LZlP
 /0y3FRtlOaxvZGQpTqS7lC2oKINkE8xa+Umim8vcah36sELSiM4hsVenz+ncJRc5GN
 kiXE07L6v7HzQ==
Date: Tue, 19 Apr 2022 16:03:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <Yl8/2cPCkSZ17hxN@google.com>
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
 <Yl86tKxvBN6lHoma@google.com>
 <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19, Luis Chamberlain wrote: > On Tue, Apr 19, 2022 at
 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > On 04/19,
 Luis Chamberlain
 wrote: > > > I'm going to add automation support for f2fs [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngwtD-004F9N-7i
Subject: Re: [f2fs-dev] Baseline for f2fs
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
Cc: Pankaj Raghav <pankydev8@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/19, Luis Chamberlain wrote:
> On Tue, Apr 19, 2022 at 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > On 04/19, Luis Chamberlain wrote:
> > > I'm going to add automation support for f2fs within kdevops [0]. This
> > > should enable folks to test for regressions for f2fs from scratch with
> > > just a few commands. Before I go ahead and add that I was curious if
> > > folks have a known baseline of known failures from fstests for f2fs so
> > > I can expunge the known issues for now. Is there a tracker where these
> > > are kept as well?
> >
> > Well, I'm not sure what fstests will run. Is that based on xfstests?
> 
> Yes. I call it fstests only because I'm tired of attending LSFMMs
> where folks don't realize that xfstests is used to test any
> filesystem. So I figured we need to rebrand it.

I see. This is what I modified a bit based on xfstests for f2fs.

https://github.com/jaegeuk/xfstests-f2fs/commits/f2fs

Thanks,

> 
>  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
