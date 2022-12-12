Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5B64AA8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 23:46:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4rYm-0002SG-VA;
	Mon, 12 Dec 2022 22:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4rYl-0002SA-Mp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aI1P6PugtEIChqrZyZ4Uh249nq+CuwBxXQRE0SERTXk=; b=G4a7PM7USQojX/tPOm6i0oxbGR
 2mGxzjtXXBoRzGu7JeM/1cG6wrkYg6dC/hICTO+YjA/N5xSJkHQr8gMLlMDaPeEcNuLFG6o4ojTgv
 eDeW/2Gu5NbIH3G+4dhKcsHVZ7/oelG3cYknSG6+n36luKZGAbQTis1uTqdiEMgMgqUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aI1P6PugtEIChqrZyZ4Uh249nq+CuwBxXQRE0SERTXk=; b=eXV7IRwtDKMH9BrmmLk+GImbLb
 11ZCYI5XaN5T+pV37VlSYHuobLd+z4C8bu9hJ8ttFqluxs/WvFeWR0p1hAXKy9fysEo7q2oiLW/Gd
 PN1nU9pCYMZ8epsPNRzZAxx80sYN6rqYl/RSVy+NuBSNO/7Ko8CnOBBBLystQL1aXj9A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4rYg-0005Cb-HC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:46:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDFF961237;
 Mon, 12 Dec 2022 22:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8C6C433D2;
 Mon, 12 Dec 2022 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670885151;
 bh=5kq95Pw53HX7zhofjWxC1xDEv7YmHp1EXdZBaOLAUA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuIhAEq+r2QP+BHcS3AZ7Z3iV5o3qKTRYdrC7afzDKSeUQAFBmwA9jr7fAR6vY4kP
 w53Haxf0laLHSJsFSJwxSiaMXn8ZlrD0dRaF/Lk6sckD7orHs7V/SL+BvyA2WFbAcS
 TJ1ysYQwlHtXJJ47OHf5sJcircVOE3HdmHCY0bgZyuBAzl7OCf5sBPkcuRBIbqbaOs
 mMVHh3w50S6nvUCLcbqCGTWC5u2x045LIWgsEJPfk56vFP5tNWoJncEpIg5Ni4SQXo
 ZFeqTem0KpafQyuicbKB/uPr2b3UH0uO75c1LbKNjejrNXqzSpjAWfOoU94XGt2Dqy
 I2lF09RksM74Q==
Date: Mon, 12 Dec 2022 14:45:49 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5evHVvzGC/8lMfK@google.com>
References: <974f5013-b6af-a39e-0b0f-2ce86253eaeb@kernel.org>
 <20221212141429.6329-1-frank.li@vivo.com>
 <2f100a4a-592d-f098-b204-efeef58341ee@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f100a4a-592d-f098-b204-efeef58341ee@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12, Chao Yu wrote: > On 2022/12/12 22:14, Yangtao Li
 wrote: > > Hi Chao, > > > > > The difference here is,
 if we use f2fs_realtime_discard_enable()
 in > > > f2fs_put_super(), we will only write [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1p4rYg-0005Cb-HC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't call
 f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12, Chao Yu wrote:
> On 2022/12/12 22:14, Yangtao Li wrote:
> > Hi Chao,
> > 
> > > The difference here is, if we use f2fs_realtime_discard_enable() in
> > > f2fs_put_super(), we will only write checkpoint w/ CP_TRIMMED flag
> > > when discard option is enable and device supports discard.
> > 
> > > But actually, if discard option is disabled, we still needs to give
> > > put_super() a chance to write checkpoint w/ CP_TRIMMED flag.
> > 
> > Why do we still have to set the CP_TRIMMED flag when the discard opt is not set.
> > Did I miss something?
> 
> Hi Yangtao,
> 
> I guess it's up to scenario. e.g.
> 
> mount w/ nodiscard and use FITRIM to trigger in-batch discard,
> if we set CP_TRIMMED flag during umount, next time, after mount
> w/ discard, it doesn't to issue redundant discard.

If fitrim was called with a range, we can get a wrong FI_TRIMMED flag. Isn't it
better to get a full discard range after remount even though some are redundant?

> 
> Thanks,
> 
> > 
> > Thx,
> > Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
