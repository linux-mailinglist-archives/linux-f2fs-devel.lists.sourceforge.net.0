Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FF787CC3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 03:08:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZLJa-0003Jc-Cv;
	Fri, 25 Aug 2023 01:08:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qZLJZ-0003JV-Hz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPf3MwzmnBDpQSOsMAabFpVBoEAcDrUlsvuscguLYX0=; b=MlBfIFu0Fy5xwea7X31rBgsvvj
 YMUg+HLDFi9CqMGLO7NGllPIJNoC7vOf8DpOWDFaFKjBhxurFA3sfQDMwOby7uzg0ygoDI2NTPFLr
 Wq6kZ99SoJExtfO3oGU1zv9+kYNEKgTPQ8rxZNAKy1rP1Dev5y6cCKiEHAl+iXiKA5Gg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cPf3MwzmnBDpQSOsMAabFpVBoEAcDrUlsvuscguLYX0=; b=Q7fUhbyuGC6geWfvxwXZ69T+TP
 WBFtslZhut78bMNf2FD8wk7EiVJGnEzB4kBov1ovBXsXF/wNigHZ/mlThd+iYGfTVLz+R/M7SNsVE
 YjHnGI188lzNe9WDdcvTFkNbqM9EcxqZIj54f23rjuS7PEV73YYVOqqMSftkVIumiisw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZLJW-00ElmG-Qs for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:08:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2998F62E62;
 Fri, 25 Aug 2023 01:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07376C433C7;
 Fri, 25 Aug 2023 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692925712;
 bh=cD8kNYTozm4FuGJASkCTOiGIy89mI5dFCwxsGj6eWRg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=X/w2OvpRG0d2hEVa5GJsOYdO9HO0dZM+351CR1YQawNy+H1cVLe6qfmN4xe7bxD0r
 iE+dMczgtnuj/gLd8ovO17reyq7Sxs8Ni+UrzOpLuWAzFYpOeOFp8C4Dzwxb+dFHv9
 Ekxktp3qRZozdqEKajN57fkPifCV/rmhth4Q8J8YIOBUK7M+k08T2n2+MbHaaAjSws
 hxV/V8czrwT3HURuKsp5rqUXufDOptm5ByF6PW2kn8SfxoTrqUkoZVl9AcxdlGwZ5g
 UaL3TiWJPNLn03Nh/wAIQ7BxPzmhI62HvH8IbPL2B3uut/k4nk5qDI0/0SeC7vQCTW
 /CcPCAWsAC4nA==
Message-ID: <8680b259-528b-32a9-73ee-ce6a6406f13d@kernel.org>
Date: Fri, 25 Aug 2023 09:08:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>,
 hdanton@sina.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000001b658e0603ad424d@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <0000000000001b658e0603ad424d@google.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/24 23:55, syzbot wrote: > syzbot has bisected this
 issue to: > > commit 5eda1ad1aaffdfebdecf7a164e586060a210f74f > Author:
 Jaegeuk
 Kim <jaegeuk@kernel.org> > Date: Wed Jun 28 08:00:56 2023 + [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZLJW-00ElmG-Qs
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_add_inline_entry
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

On 2023/8/24 23:55, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 5eda1ad1aaffdfebdecf7a164e586060a210f74f
> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> Date:   Wed Jun 28 08:00:56 2023 +0000
> 
>      f2fs: fix deadlock in i_xattr_sem and inode page lock
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=167691b7a80000
> start commit:   cacc6e22932f tpm: Add a helper for checking hwrng enabled
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=157691b7a80000
> console output: https://syzkaller.appspot.com/x/log.txt?x=117691b7a80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=171b698bc2e613cf
> dashboard link: https://syzkaller.appspot.com/bug?extid=a4976ce949df66b1ddf1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103c6bb3a80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17bb51c7a80000
> 
> Reported-by: syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com
> Fixes: 5eda1ad1aaff ("f2fs: fix deadlock in i_xattr_sem and inode page lock")

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev

> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
