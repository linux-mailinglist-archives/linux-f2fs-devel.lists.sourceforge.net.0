Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D650F71A377
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 17:58:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4kh8-0008V6-BK;
	Thu, 01 Jun 2023 15:58:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q4kh4-0008Um-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdoFMrPDRggnZnIVVdlIDDKw9tdMcwq7Qraz0tvSYdc=; b=MfPIkkT4EnukIK/XGkw57Y4WLP
 5vLepV99S5Jv0z7qoXvay8OwxFnZpPAUULKzsDHUeOE4t1JWXOU1Bot1vdZA36zHhCXMiuBV8jTpM
 +S2sNtOvlfRjLnA7EwzVZDF3t64RQPXyIOnjeXc0ZVT7C2Va4emrMvD3Rzx4HyUZ143E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdoFMrPDRggnZnIVVdlIDDKw9tdMcwq7Qraz0tvSYdc=; b=UdZOGMFgMvYzImtui4JLRdzA9m
 Sp2sB1sm8SwemkqoilN4RLQ9Fk1PHWYxK6QWNyYo1qdXHkEpZiT3rHkAPkDRSatGaADtkV4qZpiMF
 BmijKiUfcFOEmFCxNCpcFHTCT22Modpmwkw51ACOLrMUWPnPMxejVtLtegWD+lQ9Dgig=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4kh4-0001VF-6s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:58:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C81BE64556;
 Thu,  1 Jun 2023 15:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D793BC433EF;
 Thu,  1 Jun 2023 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685635104;
 bh=rZsvgn1Qz1sIejmC3hSShN/kjvw/1Nvi8CJxyMdm+rU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OKFjPM3GRqsFoMtAphV5b3w+6Ukw1CPPdPjxWeAQrNM0Xq0CFz80Gk0mTIojcvU5T
 bRazzIM7imebgUXIhGIrlDyzOHUShEW5oCorlhef21BB1TtVF+BaWr0Yd2hXtIVGRD
 9e/k7dBLuSenTg9JueHbx5yD6eF7eYuos18oOcTkWydmA56+1yrhfbIMS86N7pEnCc
 v13XFx70ScOnsBiRZW6jzxB407Qxz0M4D5b6ouBX5cNfpc4iR1b7/+P66GBwKMZylQ
 h1ZaKLV5ecKChVtkTwtJ7snZygngGuSjuygt0v1L8wTuaHCDBUvhw/dNfPP2xhxSgY
 wSVfI4xxC3a2g==
Date: Thu, 1 Jun 2023 17:58:19 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230601-vierhundert-fuhrpark-1d29c6cc1ed7@brauner>
References: <20230601104525.27897-1-jack@suse.cz>
 <20230601105830.13168-1-jack@suse.cz>
 <20230601145222.GB1069561@mit.edu>
 <20230601152746.kqykcztndxvxbbf7@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601152746.kqykcztndxvxbbf7@quack3>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 05:27:46PM +0200, Jan Kara wrote:
 > On Thu 01-06-23 10:52:22, Theodore Ts'o wrote: > > On Thu, Jun 01, 2023
 at 12:58:21PM +0200, Jan Kara wrote: > > > Remove locking of moved d [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4kh4-0001VF-6s
Subject: Re: [f2fs-dev] [PATCH v2 1/6] ext4: Remove ext4 locking of moved
 directory
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
Cc: Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 05:27:46PM +0200, Jan Kara wrote:
> On Thu 01-06-23 10:52:22, Theodore Ts'o wrote:
> > On Thu, Jun 01, 2023 at 12:58:21PM +0200, Jan Kara wrote:
> > > Remove locking of moved directory in ext4_rename2(). We will take care
> > > of it in VFS instead. This effectively reverts commit 0813299c586b
> > > ("ext4: Fix possible corruption when moving a directory") and followup
> > > fixes.
> > 
> > Remind me --- commit 0813299c586b is not actually causing any
> > problems; it's just not fully effective at solving the problem.  Is
> > that correct?
> 
> Yes, correct.
> 
> > In other words, is there a rush in trying to get this revert to Linus
> > during this cycle as a regression fix?
> > 
> > I think the answer is no, and we can just let this full patch series
> > go in via the vfs branch during the next merge window, but I just
> > wanted to make sure.
> 
> Exactly, that's my plan as well.

Yeah, we'll have time and ideally this should soak in -next for a good
while also gives others time to take a look.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
