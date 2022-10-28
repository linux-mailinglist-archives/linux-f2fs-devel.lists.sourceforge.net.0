Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C0610908
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 05:49:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooGNG-0006Y5-6W;
	Fri, 28 Oct 2022 03:49:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooGNE-0006Xy-1J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yXna1/OVGBOkde2PwTmHv12BzEHr+kt0KjAOEkz4bCM=; b=ULi1vpU+NekG7xBx4o+PV69oAB
 TDnwPsQ4Vm/oCIPj4327kIVQa90Oe1c6dJffVhKuihdwtBaHtHXG4g3ldddtmrM6UQ7I+ZPehgzPi
 06bHf9SJbDjy7zCYHelrVxYLzZaCLTZrgDy+SEzkb4l/pspQ+GFNKlZGTMiwCWGcOrq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yXna1/OVGBOkde2PwTmHv12BzEHr+kt0KjAOEkz4bCM=; b=YJKxQv4DK4bdr3l9czk9UpkJ6c
 ety5k6oomAAyqj75Usw9Finpv1qYA8H5WXXnWzZ15+8SAVgzfGO7y/+1qvtTmPbqu1hrNJYzuLoQg
 m3RIc7GxeNwBySEqAmsqm2aQDHF9RGTWMKssvNNArOjDybh/tetYOq2maZ5kJqkPi7fo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooGND-0004o2-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:49:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 105FFB82684;
 Fri, 28 Oct 2022 03:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8CFC433D6;
 Fri, 28 Oct 2022 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666928963;
 bh=H6SFLL4bcUVOWRhRZqguJi5kda2eJ/bOjwo8hs3owUw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=iZikFInJYhaAMCCwGaPVvurvFIWoLP7/CQBKZYHQL+QwByqoBp8DKh70uNY5+QofU
 ZQhBBSTabiy6kCrZav4F5dhTvhtpCucnjvcty5gb+VZBjztYgNHHYCfL1Thj20cEPl
 qLEzvNsr52rml8N1nCyAl1Ua+z5fpZiLoq09JUIGeBswhljZwwQP9mIeVFlVQrapcp
 5QMYeqM6vv4lS44RFWpj32Mh2C6Z1tEPeUlY1n2Yaxni9Xx+hUX3Hx9aUtgFnpzHKA
 onWzQ9+bU38r9V0RG6OsJD9yuVlOWGGNd2wUolx2D10zXw2SlPQujGlHcgCsey6tYa
 L2SQIfezBjjuA==
Message-ID: <eab56fc7-1a5d-1c56-9804-4bd690d2ea48@kernel.org>
Date: Fri, 28 Oct 2022 11:49:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: syzbot <syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com>,
 changfengnan@vivo.com, frank.li@vivo.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, wuhoipok@gmail.com
References: <000000000000f79f5905ec0fee38@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <000000000000f79f5905ec0fee38@google.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, Thanks for the report, the bug has been fixed w/ below
 patch:
 https://lore.kernel.org/linux-f2fs-devel/20221021023422.3101585-1-chao@kernel.org/T/#u
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooGND-0004o2-Bc
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in f2fs_stop_discard_thread
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

Thanks for the report, the bug has been fixed w/ below patch:

https://lore.kernel.org/linux-f2fs-devel/20221021023422.3101585-1-chao@kernel.org/T/#u

On 2022/10/28 11:34, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 4d67490498acb4ffcef5ba7bc44990d46e66a44c
> Author: Fengnan Chang <changfengnan@vivo.com>
> Date:   Thu Aug 19 08:02:37 2021 +0000
> 
>      f2fs: Don't create discard thread when device doesn't support realtime discard
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17da7522880000
> start commit:   247f34f7b803 Linux 6.1-rc2
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=143a7522880000
> console output: https://syzkaller.appspot.com/x/log.txt?x=103a7522880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
> dashboard link: https://syzkaller.appspot.com/bug?extid=035a381ea1afb63f098d
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d92d6a880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e5dbba880000
> 
> Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
> Fixes: 4d67490498ac ("f2fs: Don't create discard thread when device doesn't support realtime discard")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
