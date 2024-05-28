Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C358D2069
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2024 17:32:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sBynv-0002Wc-Cc;
	Tue, 28 May 2024 15:31:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sBynu-0002WK-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 15:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zo0qS+tMMuBwc0hgWTl13hwnQAyHCQzfOIUMgjQa1eA=; b=lvWSzJMdjhXzNNCvOGdXM7Jm8v
 /mwk5YXQRSEcubUl51AayTxhU6AgVFhUCMrE02jsSTRvICWpphgatWuwtnLhvT/iC30ULFQyGnlxL
 iTGjPxSb5dne9XAoH2YfGKo6LvI/pw4HnMD+BoQuHCnBvERn9DIFG9Xpq+EXUnlc7cIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zo0qS+tMMuBwc0hgWTl13hwnQAyHCQzfOIUMgjQa1eA=; b=goF+9h8riRwSEHaTr5h0881fCr
 dyFW+ahcKlCwzR2wMXmXsFJDkscA7rmz0X/XmK4vfL/ERfxUzlXJzlTi5pWNvzUW4ScvJeDHRp9VM
 M3mYKEi1E0iqPZve3I+TOB1YDOI1cmga2K3jrdUEs5+t1NfWY1gVvqoh/w7ikhnfVRrs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sBynu-0000nl-Al for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 15:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C6A98CE0EE2;
 Tue, 28 May 2024 01:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2608C2BBFC;
 Tue, 28 May 2024 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716859444;
 bh=bh1toJKYzRYSq5Vs19qY+4H7xmdzT5pppXUEGALRUSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uOch9BbZrmeVYGsEszzs5M73zW/+hDlQeVbQjZKRvlfpxzKQ6ztq194HldtKHxGRg
 FbaGMuESfWhJaTbGRpeS3WEDXfu56EBmaN0NlLYPk3VccwgKeT6F16Afrryee4xJaj
 NsH6+2hdKVTHIWHwfwvYmPZ885tBH2GepMrQKECL/Q5Kx3ExLoSR54nbR4SMaWkZvc
 UTQ9xIoU6vZAVi6nzetAlYldc5JBGRarp26qN0/y774TIOcoYb5/glehGnvMha1RIA
 YlD3rGqtQsBfIXPC0EqsW6khZmhBNsM7gMj2xN21I2beJXoWvbSFQP20owlQTLL9Mx
 jJDyXtBJADzMQ==
Date: Tue, 28 May 2024 01:24:02 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Gustavo Brondani Schenkel <gustavo.schenkel@gmail.com>
Message-ID: <ZlUyMr0FwaT69vgO@google.com>
References: <2024052527-panama-playgroup-899a@gregkh>
 <bf02d65d-876f-4a90-84b5-595707659fb0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf02d65d-876f-4a90-84b5-595707659fb0@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, We're aware of this issue, and the potential fix [1] was
 merged in 6.9.3-rc1 in
 https://lore.kernel.org/stable/ZlT506xwTYWg72Jj@duo.ucw.cz/T/#t
 Could you please check that patch addresses your problem? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sBynu-0000nl-Al
Subject: Re: [f2fs-dev] Issue with f2fs on kernel 6.9.x
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

We're aware of this issue, and the potential fix [1] was merged in 6.9.3-rc1 in
https://lore.kernel.org/stable/ZlT506xwTYWg72Jj@duo.ucw.cz/T/#t

Could you please check that patch addresses your problem?

[1] https://lore.kernel.org/stable/ZlT506xwTYWg72Jj@duo.ucw.cz/T/#mfd878849ed6dd660ca22aec9ca1a8eb31bc11f0c

Thanks,

On 05/27, Gustavo Brondani Schenkel wrote:
> Hi,
> since upgrade to Kernel 6.9 I am getting Issues when booting using f2fs.
> If I am correct, I am receiving `fs error: invalid_blkaddr` in two distinct
> drives, one nvme, and other sata.
> Each reboot the fsck runs to correct this suppose error.
> If I downgrade to Kernel 6.6.29, on the first boot, fsck runs just once,
> than after reboot is normal.
> I used 6.9.0, but in 6.9.1 it took my attention because I don't reboot
> often. One 6.9.2 the Issue persist.
> Since I didn't find nothing about issues on kernel messages I am trying
> reach you.
> 
> I use Slackware Linux 15.0-current, and debug flags are disabled by default,
> but if you needed,
> I can rebuilt the kernel with the flags you say are needed, to find what are
> happening.
> 
> PS: I didn't find any better way to report this issue, said that, sorry if
> this is the wrong way to do so.
> 
> -- 
> Gustavo B. Schenkel
> System Analyst
> B.Sc(IT), MBA(Banking)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
