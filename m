Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C784B814C82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 17:08:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEAk1-0006xU-05;
	Fri, 15 Dec 2023 16:08:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1rEAjz-0006xO-VU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 16:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4V/xtuU5RtW7auv55nECI5YJaBifIHvReIdoO950Ik=; b=KoxUjC3g8CyHQmep7gTEG8s7SQ
 v4lt1SWJf5jfM9xkCi5lzyp97KtORcWW9MFDdmT5zCWev1N1asKkIp0E+hDX5oe3+6jKlh3Y9p0Lb
 RJwhLiV9oWEiArB3XOCV7De1pH0VHIfuE6fmE3AI8BHkeMOisc9Fi15uTr+AsqjJceiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+4V/xtuU5RtW7auv55nECI5YJaBifIHvReIdoO950Ik=; b=mVOlE6aEpAOymBgZw9P9txRR/E
 X78qjS9vp46Hhv48E2uQtRBT13YgxXsxJylIRywU04iUks9E+YU2EQPePdFzKIMfx1hC1TT7pRMeJ
 9zRfVcB+2yIiSPwGXksX7B+rIKAMTJ9XxDaV7LFmClzIReE3LERuwU69EtlWkzoGhVG4=;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEAjt-0007XJ-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 16:08:44 +0000
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3b9efed2e6fso666037b6e.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Dec 2023 08:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1702656507; x=1703261307;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+4V/xtuU5RtW7auv55nECI5YJaBifIHvReIdoO950Ik=;
 b=r8raI5CqfuqWf46FyubzUc6AgbmIntd2zjX/bVUM4aHU585oHXOdz42CHJjkTKmLH+
 4IoZ6B9GPMJVSxWCVd5+WJNoLl0VrWBN+pW7X64Up13MwwIP7UaeVxuNCSaHzR9L7DnX
 Hzksk6Eyk0RF5UOQYdRe0Phj9ttt7fBcIznnIl4gTAOFX2VApYhibLM02cRq1/aaKfNk
 Unu0vqFfEWNJN0n9oPro/Bi1NoVVwnFpIZQkSqEW1dv8uRZ155f1pB0O57Vr9c31L+td
 25PvBhiL87OWNPT9PJr+6Tci6KHJ727yCheLTEoPGALlGrBPAnQD+CJhu9lZnMplXjRV
 V4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702656507; x=1703261307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+4V/xtuU5RtW7auv55nECI5YJaBifIHvReIdoO950Ik=;
 b=DYBqeoU5wBSDMjXyHoIRnXt4+7MoD3q+nHXmLalxgi6D+OtM98SnZDApSsXuzDeLJC
 cxxddlNgPGYFKwyGjI1jzK6xd9urtw52/dF6tau4InufGCNl5A71C1JFmxWu5PjQAA86
 Q66/l09C0PqMo0JAWQgUvqoo3BsCi/snlecTmoGDNmjHq2eCDULqxdHZ2qBmz6Kea14I
 dtX42r30y06jtkKkwRdNZ2DR0UQRvixxHAHN30egtrwsXY+vBF8iHzUs2hk44AmJqt0X
 QLrTzNPO3FvYFODmEoC5tKc6Gw8teWNX8SyKObgxQpueOqTy2nUWyfQdfvKRYr/0is7w
 fH1w==
X-Gm-Message-State: AOJu0YwKww8GPR+8dBN7FLP7IH/Ab3ustAeWClWtXkDx/PDxS2qUWj5a
 KPpOEFFBWXg3Ei3i+xXfuSmCUI10QS5FUTRjLt4=
X-Google-Smtp-Source: AGHT+IGpj2fZ4DlpWbI9o2AbVXyl3n081P7woEHQN+l8wabNi4vE8R5e3ZFfwi7WbmH7RL0B6LtbAw==
X-Received: by 2002:a0d:d812:0:b0:5e3:347b:e864 with SMTP id
 a18-20020a0dd812000000b005e3347be864mr3181497ywe.26.1702650392430; 
 Fri, 15 Dec 2023 06:26:32 -0800 (PST)
Received: from localhost (076-182-020-124.res.spectrum.com. [76.182.20.124])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a814a08000000b005d3b4fce438sm6269510ywa.65.2023.12.15.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:26:31 -0800 (PST)
Date: Fri, 15 Dec 2023 09:26:30 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20231215142630.GB683314@perftesting>
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-2-ebiggers@kernel.org>
 <20231213084123.GA6184@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213084123.GA6184@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 13, 2023 at 09:41:23AM +0100, Christoph Hellwig
 wrote: > On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote: >
 > From: Christoph Hellwig <hch@lst.de> > > > > blkdev_put must not [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.179 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEAjt-0007XJ-Gj
Subject: Re: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 13, 2023 at 09:41:23AM +0100, Christoph Hellwig wrote:
> On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote:
> > From: Christoph Hellwig <hch@lst.de>
> > 
> > blkdev_put must not be called under sb->s_umount to avoid a lock order
> > reversal with disk->open_mutex once call backs from block devices to
> > the file system using the holder ops are supported.  Move the call
> > to btrfs_close_devices into btrfs_free_fs_info so that it is closed
> > from ->kill_sb (which is also called from the mount failure handling
> > path unlike ->put_super) as well as when an fs_info is freed because
> > an existing superblock already exists.
> 
> Thanks, this looks roughly the same to what I have locally.
> 
> I did in fact forward port everything missing from the get_super
> series yesterday, but on my test setup btrfs/142 hangs even in the
> baseline setup.  I went back to Linux before giving up for now.
> 
> Josef, any chane you could throw this branch:
> 
>     git://git.infradead.org/users/hch/misc.git btrfs-holder
> 
> into your CI setup and see if it sticks?  Except for the trivial last
> three patches this is basically what you reviewed already, although
> there was some heavy rebasing due to the mount API converison.
> 

Yup, sorry Christoph I missed this email when you sent it, I'll throw it in
there now.  Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
