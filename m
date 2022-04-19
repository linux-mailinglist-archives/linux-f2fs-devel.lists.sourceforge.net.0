Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F4507D2F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 01:26:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngxFG-0006Fn-Jc; Tue, 19 Apr 2022 23:26:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@kernel.org>) id 1ngxFF-0006Fh-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQ7sIalcD7OrkqJLwb9HGASyj+TH+0ZFV9JEUPWHM1g=; b=YXj5KmQCDLXCE+JFgMwZu6jRjb
 5ldT/el4IVC+/QAo2FchpqnUcLnSyqC1NbOU2Q3kmclNB9b5ta1SYrvxEcWXzusWXGkuKNt3aP3wu
 mm5m8LVStXqzeOeZnAVzM3qqTPndWfDESGA0rpFbUwMyEjjPNj4x4R2I7KIZUeSDqCu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQ7sIalcD7OrkqJLwb9HGASyj+TH+0ZFV9JEUPWHM1g=; b=NTz1FSgLXZxKDbd5onPkTWr3jM
 asC5EI6QWN+LK2oZ5iymLDXy47e/ordazArewEgdQsBrwGpvl3Kzy/phKaP/a+uLz6Jtdao4SN3JJ
 13A74LPxGsoq1IqXe6Rh5FTVlg3Bc+yF9NAwP+EDlY0xp99TRBdmombJQwqfw1AldJ2s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngxFE-004Fle-Bq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:26:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 044566131A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 23:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FC5C385A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 23:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650410806;
 bh=jFubl1NHgTC5H19ZvfYfIEy9pNLHmsB7y23fM+b02SA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gk5mj9j7kD1zG6hdA7wLZxSojb11DQV5QOkNzDwkEMQSbZ3z7HKVHl5cnv5HX1Hzy
 Dz9N2WeMzTruJm8PkDGdI3OgVcCyrqlkvxGVXIbrhbjivP3pclpU9xL4RTCfRnBPNL
 4GiXUnhTPDwuXQ5oek2Ht9oAWVp17pyf89x3FLLOeHJj8aOnONNlFdiV/NZQm15aXQ
 VgkWtJMZWWsgkU5vsIBn42ElW9EVj1TuU4iiQczfXcaSm3arhOj/w88fVr7I2OPk/4
 ZveOdstbnI3HdK3Wj8UmdhWRVyelmg9feu2lrLFLj+zHHaPau1sirPGPXJCZjdhGNF
 5rfgg/pElu0jA==
Received: by mail-oi1-f179.google.com with SMTP id z8so282286oix.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 16:26:46 -0700 (PDT)
X-Gm-Message-State: AOAM533gEDe/NoGC9gANTYTOSiXJR9KtfhUibp9FizVoJcNtfPTJgfUb
 4QyfNdDu1w1dQWC8QhmAOgWvw3cVRk0s8ysvVJs=
X-Google-Smtp-Source: ABdhPJw4Cy8Yv8WQSvbRw2MgtbmHkNr/ycAFOHQd6/BrI1VMVUMJRVFfV946GpKCa2COc5WH1zljvIV5shQ4LP2Z7EU=
X-Received: by 2002:a05:6808:1189:b0:322:3293:4b30 with SMTP id
 j9-20020a056808118900b0032232934b30mr433533oil.277.1650410805593; Tue, 19 Apr
 2022 16:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
 <Yl86tKxvBN6lHoma@google.com>
 <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
 <Yl8/2cPCkSZ17hxN@google.com>
In-Reply-To: <Yl8/2cPCkSZ17hxN@google.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 19 Apr 2022 16:26:33 -0700
X-Gmail-Original-Message-ID: <CAB=NE6U+KbnFPd+EYEhXxF7o4DSB58k-uGevC6y1h2SSE2sbtA@mail.gmail.com>
Message-ID: <CAB=NE6U+KbnFPd+EYEhXxF7o4DSB58k-uGevC6y1h2SSE2sbtA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19,
 2022 at 4:03 PM Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > On 04/19, Luis Chamberlain wrote: > > On Tue, Apr 19, 2022 at
 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > > > On [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngxFE-004Fle-Bq
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

On Tue, Apr 19, 2022 at 4:03 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 04/19, Luis Chamberlain wrote:
> > On Tue, Apr 19, 2022 at 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > >
> > > On 04/19, Luis Chamberlain wrote:
> > > > I'm going to add automation support for f2fs within kdevops [0]. This
> > > > should enable folks to test for regressions for f2fs from scratch with
> > > > just a few commands. Before I go ahead and add that I was curious if
> > > > folks have a known baseline of known failures from fstests for f2fs so
> > > > I can expunge the known issues for now. Is there a tracker where these
> > > > are kept as well?
> > >
> > > Well, I'm not sure what fstests will run. Is that based on xfstests?
> >
> > Yes. I call it fstests only because I'm tired of attending LSFMMs
> > where folks don't realize that xfstests is used to test any
> > filesystem. So I figured we need to rebrand it.
>
> I see. This is what I modified a bit based on xfstests for f2fs.
>
> https://github.com/jaegeuk/xfstests-f2fs/commits/f2fs

Oh... so this is not upstream...  I see.. ok hrm..

 Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
