Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C149093F720
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 15:59:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYQu7-0001YR-2H;
	Mon, 29 Jul 2024 13:59:10 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1sYQu5-0001YI-Km
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 13:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PM7Dhelwt8evrmwJBsFtoBMEI3ETn1PNdtUW08NA2t0=; b=ZPqODtNLrmtxKPT+Tv3kVKg30i
 xozTw3/KKoPcLYRxj/PHp3PQ8vi6Ukn99Lj5Eu4Qnut1dTrPBCabFN18U3V+hx+nFKANM8+itkycC
 fLWOAx1AjOvZyvoW7gOHPpwESLQLrNKsqtpWXLgMD8gYyPlQPHYTN056ZPXkLFMj+Ct8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PM7Dhelwt8evrmwJBsFtoBMEI3ETn1PNdtUW08NA2t0=; b=IkNuecOyt5bdVfTmLVA4HBBBRl
 jYv6RfmQQUJVz4I/WoAHDc5mJjV9/3rTcrfMWdBoKQXIHRXR7SCvSnDeqf+JH3Cpom5cPOOHwDNMI
 8+Z8fIRPtUJnkJRdfq4y6BobzJ7KdLx/IDMo+0B3FTvhgWqS0sh4aqlhF8UAHbYpSDiY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYQu3-00015O-LY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 13:59:08 +0000
Received: from cwcc.thunk.org (pool-173-48-113-198.bstnma.fios.verizon.net
 [173.48.113.198]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46TDwmVU016155
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 09:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1722261532; bh=PM7Dhelwt8evrmwJBsFtoBMEI3ETn1PNdtUW08NA2t0=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=mzrbQO8z5kGT7QrVsd7S36FKlagze53iuANsryUVbqE2vNlJqGm2c7jzPQFw+M/Lo
 Q6snREaMJuIDbwc9yA+W0bu2/Bek1F4/aRsRcCqpcStJgP6lLpQyUIxYMqMasNMmJe
 MKAbdgzt3IvNc3aAcH6IfoBl8lh48hVSB0VW7kz3pmapwQ/kXr7SI9eLF6vHd3d8RW
 uR3AQ/CMwQoewSX6076TUuXVYlqYlieHJ5OJS2ySdJEUrdWVFKoC1xuFrsYdL57xmn
 A27g05NMVy4148nADQRz8SrUDI84rPzMGWygSrUMeazfyeyfieFGc/yRi17Bl6bBkl
 w2Tkh1JbsZU1A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id EC47215C02D3; Mon, 29 Jul 2024 09:58:47 -0400 (EDT)
Date: Mon, 29 Jul 2024 09:58:47 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Message-ID: <20240729135847.GB557749@mit.edu>
References: <0000000000004ff2dc061e281637@google.com>
 <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
 <20240729132721.hxih6ehigadqf7wx@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729132721.hxih6ehigadqf7wx@quack3>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 29, 2024 at 03:27:21PM +0200, Jan Kara wrote:
 > > So in ext4 we have EXT4_FLAGS_SHUTDOWN flag which we now use > internally
 instead of SB_RDONLY flag for checking whether the > filesystem [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [18.9.28.11 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [18.9.28.11 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYQu3-00015O-LY
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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
Cc: Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 paulmck@kernel.org, frank.li@vivo.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Oleg Nesterov <oleg@redhat.com>,
 Hillf Danton <hdanton@sina.com>,
 syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>,
 rcu@vger.kernel.org, viro@zeniv.linux.org.uk, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 29, 2024 at 03:27:21PM +0200, Jan Kara wrote:
> 
> So in ext4 we have EXT4_FLAGS_SHUTDOWN flag which we now use
> internally instead of SB_RDONLY flag for checking whether the
> filesystem was shutdown (because otherwise races between remount and
> hitting fs error were really messy). However we still *also* set
> SB_RDONLY so that VFS bails early from some paths which generally
> results in less error noise in kernel logs and also out of caution
> of not breaking something in this path. That being said we also
> support EXT4_IOC_SHUTDOWN ioctl for several years and in that path
> we set EXT4_FLAGS_SHUTDOWN without setting SB_RDONLY and nothing
> seems to have blown up. So I'm inclined to belive we could remove
> setting of SB_RDONLY from ext4 error handling. Ted, what do you
> think?

Well, there are some failures of generic/388 (which involves calling
the shutdown ioctl while running fsstress).  I believe that most of
those failures are file system corruption errors, as opposed to other
sorts of failures, but we don't run KASAN kernels all that often,
especially since generic/388 is now on the exclude list.

The failure rate of generic/388 varies depending on the storage device
involved, but it varies from less than 10% to 50% of the time, if
memory serves correctly.  Since EXT4_IOC_SHUTDOWN is used most of the
time as a debugging/test (although there are some users use it in
production, but the failure rate when you're not doing something
really aggressive like fsstress is very small), this has been on the
"one of these days, when we have tons of free time, we should really
look into this.  The challenge is fixing this in a way that doesn't
involve adding new locking in various file system hotpaths.

So "nothing seems to have blown up" might be a bit strong.  But it's
something we can try doing, and see whether it results in more rather
than less syzbot complaints.

> Also as the "filesystem shutdown" is spreading across multiple
> filesystems, I'm playing with the idea that maybe we could lift a
> flag like this to VFS so that we can check it in VFS paths and abort
> some operations early.  But so far I'm not convinced the gain is
> worth the need to iron out various subtle semantical differences of
> "shutdown" among filesystems.

I think that might be a good idea.  Hopefully subtle semantic
differences are ones that won't matter in terms of the VFS aborting
operations early.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
