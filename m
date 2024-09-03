Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45C96A0C5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 16:35:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slUd4-0003XA-6c;
	Tue, 03 Sep 2024 14:35:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1slUd2-0003Ww-Gv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Lh3fAo8mieXU/bFURs8Kb/gQNeLJ59plH7Pj7I1xRI=; b=Z3AOG0GC941/H49fOUEvPzszYU
 NnKI7T8tDH5cavUO1sNg+IfmtJLnVv+6OAPnwqG6xfyVBf37amZSYDrIdy+DhCV3R/ofFLnDFkqD6
 0jxUGQ5kcoVu4X+WRIasAHCehjSh5K6qg01VWiiAEb6NsPoHacP65FBFIUB1oGaNO0eM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Lh3fAo8mieXU/bFURs8Kb/gQNeLJ59plH7Pj7I1xRI=; b=Vcm6bdi3qLCqWnq4OQtAJIFmgF
 iTIrWPufUfKS+VRHZQ0HR1LdDDY5kk88H56XN/M/C1RpJ6i0g6c5nieoq88slKm7QkQIvUX9ckBaq
 obic05NQ2BwnjbHs8iXVk0zg7ZdlBdKXkHhj2JNO4bjzwr+b8ZrrlAAHIOznnZyqi0Bc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slUd1-0002Rf-UU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F4805C5977;
 Tue,  3 Sep 2024 14:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B35C4CEC7;
 Tue,  3 Sep 2024 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725374121;
 bh=SXW9Lb7ZYF60TtJNxa2tzxDrQEAQyWEpctMJfc6+Lnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eI2Ty3YGWuQvGA9egzniLii9YQG8AfW76NMVfcefuZrmPyHF4bE1yl47co3r94xpr
 lNhNFIBfd7Y0gztaRlvnjUyXb19Ngt5hz/WgwYyYjoo9lfHoSQKPf3wWH65zGJMKi2
 Arx90hFQceXXoDMQtcWokmLo9jzFEWRZ4rbh/iLoGd87XjmjfDpuSvH++Lr66wZg82
 +zkUu/rWYqR291y8VeN48DA80+O0xdnW9HQFM+n8h6Tg+pInvmX70OxcqbV8yJi/V7
 I8xz7TmjCusWsM7jIh9ivWozgayqxQXB9TjsCfQpdOeXT9BWK58O0HMtvrXSJ4s4ao
 yaUovB82siFIQ==
Date: Tue, 3 Sep 2024 16:35:14 +0200
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240903-erfassen-bandmitglieder-32dfaeee66b2@brauner>
References: <CGME20240826171409epcas5p306ba210a9815e202556778a4c105b440@epcas5p3.samsung.com>
 <20240826170606.255718-1-joshi.k@samsung.com>
 <20a9df07-f49e-ee58-3d0b-b0209e29c6af@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20a9df07-f49e-ee58-3d0b-b0209e29c6af@samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 03, 2024 at 07:58:46PM GMT, Kanchan Joshi wrote:
 > Hi Amir, > > > On 8/26/2024 10:36 PM, Kanchan Joshi wrote: > > Current
 write-hint infrastructure supports 6 temperature-based data life > [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slUd1-0002Rf-UU
Subject: Re: [f2fs-dev] [PATCH v4 0/5] Write-placement hints and FDP
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, linux-block@vger.kernel.org,
 vishak.g@samsung.com, jack@suse.cz, sagi@grimberg.me,
 martin.petersen@oracle.com, gost.dev@samsung.com, amir73il@gmail.com,
 jlayton@kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, James.Bottomley@hansenpartnership.com,
 linux-fsdevel@vger.kernel.org, chuck.lever@oracle.com, javier.gonz@samsung.com,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org, hch@lst.de,
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 03, 2024 at 07:58:46PM GMT, Kanchan Joshi wrote:
> Hi Amir,
> 
> 
> On 8/26/2024 10:36 PM, Kanchan Joshi wrote:
> > Current write-hint infrastructure supports 6 temperature-based data life
> > hints.
> > The series extends the infrastructure with a new temperature-agnostic
> > placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
> > send the hint type/value on file. See patch #3 commit description for
> > the details.
> > 
> > Overall this creates 128 placement hint values [*] that users can pass.
> > Patch #5 adds the ability to map these new hint values to nvme-specific
> > placement-identifiers.
> > Patch #4 restricts SCSI to use only life hint values.
> > Patch #1 and #2 are simple prep patches.
> > 
> > [*] While the user-interface can support more, this limit is due to the
> > in-kernel plumbing consideration of the inode size. Pahole showed 32-bit
> > hole in the inode, but the code had this comment too:
> > 
> > /* 32-bit hole reserved for expanding i_fsnotify_mask */
> > 
> > Not must, but it will be good to know if a byte (or two) can be used
> > here.
> 
> Since having one extra byte will simplify things, I can't help but ask - 
> do you still have the plans to use this space (in entirety) within inode?

I just freed up 8 bytes in struct inode with what's currently in -next.
There will be no using up those 8 bytes unless it's for a good reason 
and something that is very widely useful.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
