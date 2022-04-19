Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C42507CB2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 00:43:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngwZ8-0001nk-HA; Tue, 19 Apr 2022 22:43:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@kernel.org>) id 1ngwZ7-0001ne-ET
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jF7auzV57qDr6XP10HA6Se98O0A956Exb2m+tUWiCEM=; b=DSl0CPCl7nPr/pX0kzxFCGsv39
 4/oEscEDgtBNBdHOtmp8db35H0LqGsqLtY6HHpecfPLQgZLPnwP1Vw6oqokJz0rA0BMC5g95DmyfQ
 acKXE3dc8+FuUJdCe+ejQfkxOkwDQ3NRRu9EA8JRxWz3mWlZxoq0QnhpfxjuQowbmxAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jF7auzV57qDr6XP10HA6Se98O0A956Exb2m+tUWiCEM=; b=BQaZTvRHjJQWuZEs/5L3JDLWAl
 bGjpLRL7q41KAgDCjSpHmCtAUzak2tb7wCLGXS9hrnSxJ7MNtV+SUiuIjvG81ICFK1RAy5FWo0FiB
 P6na9WR1IN2wqO6SC28JAK9QPW0Ce91YWEa/zyKkI9x5X/bBFuGBofAFfzZPU95+PJ2c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngwZ4-0007FG-Iu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:43:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B06FB81CA3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 22:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A46AC385A8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650408190;
 bh=jF7auzV57qDr6XP10HA6Se98O0A956Exb2m+tUWiCEM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dssESwdZGbNmKCnycd/8JlFs15QrmzVwQB2tpAc9OE8FMpSbTlThaaGKUUmx79HSo
 /9OQvLzP/g+1UlyS5Sn4/UMQiBxPtwrz8pboIey3FNFWdwujXCNq73D3rjh6AVzwJU
 ixn8FtoFVySRBeR3VBnizEvKGIHH5M+/TXHDr6QOYEHBqBlFKDTUiZl5bxU8YQAsGP
 pELZ8d9IXyt3QvcQgzGozGpDjmSNWQUl1hTNP6TTaBsiBKusDjToAS3vf0pmiD81qT
 UkSaSKE0pVhY++E22csniVZpOpA4+/ORb8HyQB0DFd+gUzRW3UoDF2dugfm8WI3wEK
 RBgbpwz6w2A/Q==
Received: by mail-oi1-f176.google.com with SMTP id 12so142734oix.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 15:43:10 -0700 (PDT)
X-Gm-Message-State: AOAM531QGg0jqW4oB295apiF/hDyAd+IfngYBrQ/E55nr3vgZyOk6NNJ
 k8AdcmR8naWQcLtPxrZ+AL8fGNGcKd9haHWJ7UM=
X-Google-Smtp-Source: ABdhPJwL/roT311ijeLmDUhupO0eKljOvJhynyt01Tr/rSW9lxc9c1mt3mHS5ok22F3Cm8RteE+BNGqWmziey2DDaDU=
X-Received: by 2002:a05:6808:1189:b0:322:3293:4b30 with SMTP id
 j9-20020a056808118900b0032232934b30mr361620oil.277.1650408189257; Tue, 19 Apr
 2022 15:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
 <Yl86tKxvBN6lHoma@google.com>
In-Reply-To: <Yl86tKxvBN6lHoma@google.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 19 Apr 2022 15:42:57 -0700
X-Gmail-Original-Message-ID: <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
Message-ID: <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19,
 2022 at 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > On 04/19, Luis Chamberlain wrote: > > I'm going to add automation
 support for f2fs within kdevops [0]. This > > should enabl [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngwZ4-0007FG-Iu
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

On Tue, Apr 19, 2022 at 3:42 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 04/19, Luis Chamberlain wrote:
> > I'm going to add automation support for f2fs within kdevops [0]. This
> > should enable folks to test for regressions for f2fs from scratch with
> > just a few commands. Before I go ahead and add that I was curious if
> > folks have a known baseline of known failures from fstests for f2fs so
> > I can expunge the known issues for now. Is there a tracker where these
> > are kept as well?
>
> Well, I'm not sure what fstests will run. Is that based on xfstests?

Yes. I call it fstests only because I'm tired of attending LSFMMs
where folks don't realize that xfstests is used to test any
filesystem. So I figured we need to rebrand it.

 Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
