Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BB4366C9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 17:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdaMa-0002Xp-TC; Thu, 21 Oct 2021 15:52:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1mdaMZ-0002Xi-GK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 15:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6BUvP8gOAW+gS53kPlxXdoNqtgg1DkSCa22z70BSxnQ=; b=nLPUpMtQ2eyyQ7tUqI/kQL5ZdT
 7VIyzWjJPLtKB9EducklxBc7agh4yj1bmzbU/hSs3JgYYE7Sa1ivLgvzhvbL/UJgvUxlEGf8T26VK
 7FTeLIKK6ojjFFm9XFq1KqcJW/xpMOHeOi4jNB/ru4u0m0Nhx1PSKHHBKZY2I+opDMY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6BUvP8gOAW+gS53kPlxXdoNqtgg1DkSCa22z70BSxnQ=; b=STroKdcwHCItLUzQKQnMKbfELA
 K7XYItWOGUFtyKjiZSH/tZ+TtarMsy7j+fqUzDRAON+NllrHSpk899Smaf+Qhw02q+nj0z7/dCaOI
 yk9TPHEJLPLSzhsKrSrL9wPV48EjoZBBJIku0GU/dzeGmA1s6Yqr3QMLRhbKWNejb8ic=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mdaMW-00ATIE-9e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 15:52:15 +0000
Received: by mail-lj1-f180.google.com with SMTP id n7so696955ljp.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Oct 2021 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6BUvP8gOAW+gS53kPlxXdoNqtgg1DkSCa22z70BSxnQ=;
 b=I+iTjOWqkYhJVtzXfdMre6FfEyLSuXDaBYozZfIYBSH3kMhaYGXWYtjtP1B7gapJQL
 vSzII4lgrHaC51FeaRLzfkB40M/OPld6+xCnfZxzoxcuyKaBxVsn03kuLknslzaSV2nI
 n+9I+zXONhFUpoSFeDxADY8QDCwla7TwhTZapL8AHuiV9HTCphiqdp2tBhcV6QICh/Jf
 kvd6doqB/uH0pjdmQveYZcGR2rUK1FVDU2lGBw+DF3qrtZDhK7x0dd4+G9Kgl8TUm1px
 RE66xJ04SNvoU2Ywy5mjN31sfOzlUIqMcNCeDaQW6jmW6Bu7Hs+LERiUmc4BYS05V6Wy
 8ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6BUvP8gOAW+gS53kPlxXdoNqtgg1DkSCa22z70BSxnQ=;
 b=3xaWdS7VfRxHVrf9flGgkbud0oDsNOIKXGRdxD2BxlDsQMHZ9cg4Xrvmsv1FlAcE/1
 Tf1k6dgiZo9TPpQ/QZvQpoQHwuRKO6g/Yom1spapUqWW08iAZ7wNbUhZW26LYUfXYRbv
 wAuFi6WyFUbGGQPV34IRxKllTxXXAavK3uTOKezdwZUb7pZ7UvFUmG6RTIA7F/GbiYam
 zUAugei+ZG5pJxlwxoIZxC05G4QZ/gPe87jct0NkqPiOhMlQQVC2qnV6N0qRhl78jhUM
 k4KAiJwG1rmCTa/gOhAUnkD4EV4Zl9WPI5NCkRoDdDCP8N0CdvfNHfVZFi17PVUNx9fp
 hIYw==
X-Gm-Message-State: AOAM531du9xGxfdHPa07DRya1lwMMVIDNVRhnzC9763Do95B8L/UPIYb
 b3KqOINynCmcsN0JP+lP4N4NBQQqpLEO1b6MmZkAprE3
X-Google-Smtp-Source: ABdhPJyLor5rGZ8iutyKqzvNE2yY0NApkvP4xs4TvwXArYQ74T7MBfpak0JbbNDZfbpVAqD3HdcrvftDC3I1Kd1uXOw=
X-Received: by 2002:a2e:9857:: with SMTP id e23mr6795532ljj.132.1634831525715; 
 Thu, 21 Oct 2021 08:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
 <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
 <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
 <CACOAw_xW7MZi8BVi-2Zo-=LruZr6k7fC7huYiYuWyaDDDti6WA@mail.gmail.com>
 <02abeeba-c359-cae3-4759-ee2087f21cc9@kernel.org>
In-Reply-To: <02abeeba-c359-cae3-4759-ee2087f21cc9@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 21 Oct 2021 08:51:54 -0700
Message-ID: <CACOAw_xh2HSQDjb_tGopvssipDJYnpi4O1X5_eJqSOLpLebqsw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Okay, shouldn't we Cc stable mailing list for this patch?
 otherwise > userspace tool may get different stat number with the same
 compressed
 > file in different kernel? > Oh, could you let me know what the address
 of the "stable" mailing list is? 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.180 listed in list.dnswl.org]
X-Headers-End: 1mdaMW-00ATIE-9e
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Okay, shouldn't we Cc stable mailing list for this patch? otherwise
> userspace tool may get different stat number with the same compressed
> file in different kernel?
>

Oh, could you let me know what the address of the "stable" mailing list is?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
