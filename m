Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 252601F00C4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 22:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5kgz4KC8TTYdDgvIpWIYjk1d7WUuMbjv4l4uMRvq9Q=; b=OXVqZ1jvFeeGoMzMrPMpO+gY13
	PIj6pLIDlzWD16/8kxYj5EFE2vTblo93EbcPPcR+yKSmM3kTfdBLgHzzwqSSsKD0OXn2rixOawjnr
	m11BGb0Tlk3cbc/cueidnkQ3eIkT3I5VKacrdRgTvJNLoaj3JjQbiL2betqLxsFVo/Vs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhIfn-0005sl-37; Fri, 05 Jun 2020 20:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ndesaulniers@google.com>) id 1jhIfl-0005sd-7G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shshfcQBD52T6SsMpXKmudFuukbhlBXLKFJ7VG5PWPA=; b=nDuU1oaOvi0PuqaIChdRWryPDs
 qtajvynr3lQ8FoO7/29t0bkWFW672XkS7g243piZUCVZJXWmMyKWsLcooTYQxJYvNLhFqJ0C5Ra/2
 byN9ODZkDIaBb8n8hk1G/TpyIRufbVaM+16Oq0Vc8nwrvFKarlBd4mJz+Y8RHvuqO1XQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shshfcQBD52T6SsMpXKmudFuukbhlBXLKFJ7VG5PWPA=; b=N9RG9t4sgWViKMSWHEE8CL5AHH
 s9x6VpkF2slILMNCeIhiaeVIx8XU9g5yx0KegSgR8HDI+I0X8nTXnbaeA8hSjVM+zCo4TtjndmAEu
 f5z8GR9SGzBu7v4KbcLLRrpiparsuj/6qJRK85457cQ9RRE1RuH/d4eiDZAwYATJ/PaA=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhIfh-00DLIx-P6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:10:37 +0000
Received: by mail-il1-f194.google.com with SMTP id l6so10905504ilo.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2020 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shshfcQBD52T6SsMpXKmudFuukbhlBXLKFJ7VG5PWPA=;
 b=KPHDxNjPZRe3RQ1kGJBLSk8XWAeb99c7th2kzDaO3/2XEdr2il3sULhVKY2oSeZciJ
 QshPAbC7//sMgL0iihRvU2vAmCnE6LY49xN2+uNtaFQNQO2Inm5XHq2Qs1aY7gGPlTGh
 vCiDrhiTR77VyZ5YqJX0a73T+urfeNHV39t8Gt4zKJPcjBlcoTykyifB0E3m8l6UO/KL
 gBTL0cuGec0/trq1GrbB08CeO3ybVj2BEJjQQ29QRAGM7C8l9x68DFGW6A6yve0naEfH
 jA+OwRT25FKXd8TNuPH/D+jhx+TgCgVG3CDkTBv5N/OeqyeEDGSPJPKUyKLFcv9/VqA5
 80Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shshfcQBD52T6SsMpXKmudFuukbhlBXLKFJ7VG5PWPA=;
 b=mhvtElYIG9Fw2ZC03zmTGEB2vvy+zYXSMVCIAJlmXvSRmPfEyNNbcccFgU0n7GH3Bb
 BylK+bgwEHYCwQxD2NcxubyTFX5ZiBXHCFVkSUxFLwZzmLG7p+XVRKFh1B3Gt8PFklnd
 xaVcpNKY+a8ysWog4eInle2pdfkLm32EIt/NaxfgIYS++OqEO/HxYBNEvG61a5xOusNz
 eN4GFBdJsUHpEEUKhA5qoW/C9PT9slFMyDZfp2vf8pdB4QCQo0yHsRRFFavbHH+gTn8R
 6gUf5s4CZG4bjoqZgr6+K5/PoMpzZSP3I++Pcz5OhZ+e5kJg108EEEzf5AQq4jO8UhVY
 BeMw==
X-Gm-Message-State: AOAM532FOpyjKZeUbCIVJCt/c7cr1cMRovM8I29dpDgyPHSW28IjwVPc
 B62VgKD8ZaOKH2kmxKgxhA3ULwVMB0nOLngNF+iFVTa0uQ0=
X-Google-Smtp-Source: ABdhPJwTuIoJNLg+Db4EulI3kAfRCk69bxy1M+UxJfwpRHuBQqU9Qmbbp9xH795N1dllTyRmoIU+BxHObjEKR4OScog=
X-Received: by 2002:a63:f00d:: with SMTP id k13mr11230799pgh.263.1591386189347; 
 Fri, 05 Jun 2020 12:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <202006051725.63EW72i7%lkp@intel.com>
 <20200605145546.GA227721@google.com>
 <20200605160830.GB1373@sol.localdomain>
 <CAKwvOdm1Ew1dBVcmxDHtKWp383Dsrxjhaweek=-LDomfKnj7Qg@mail.gmail.com>
 <20200605193359.GK1373@sol.localdomain>
In-Reply-To: <20200605193359.GK1373@sol.localdomain>
Date: Fri, 5 Jun 2020 12:42:59 -0700
Message-ID: <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhIfh-00DLIx-P6
Subject: Re: [f2fs-dev] [f2fs:dev-test 48/48] fs/f2fs/super.c:3303:12:
 warning: stack frame size of 2064 bytes in function 'f2fs_fill_super'
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
From: Nick Desaulniers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 5, 2020 at 12:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 05, 2020 at 09:45:43AM -0700, Nick Desaulniers wrote:
> > On Fri, Jun 5, 2020 at 9:08 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 07:55:46AM -0700, Jaegeuk Kim wrote:
> > > > Eric,
> > > >
> > > > Could you PTAL?
> > > >
> > > > On 06/05, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> > > > > head:   adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > > commit: adf3d3a53cf13d0998c699ba43d8582c875179e3 [48/48] f2fs: don't return vmalloc() memory from f2fs_kmalloc()
> > > > > config: powerpc64-randconfig-r011-20200605 (attached as .config)
> > > > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> > > > > reproduce (this is a W=1 build):
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # install powerpc64 cross compiling tool for clang build
> > > > >         # apt-get install binutils-powerpc64-linux-gnu
> > > > >         git checkout adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > >         # save the attached .config to linux build tree
> > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64
> > > > >
> > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > I don't know what's causing this.  It doesn't look at all related to my commit,
> > > and I don't see what's using so much stack in f2fs_fill_super().
> > >
> > > @kernel test robot: the directions given above don't actually work.
> > > First I got an error due to powerpc64-linux-gnu-elfedit not existing.
> > > So I had to build binutils for powerpc64 myself.
> > >
> > > Then I still got an error:
> > >
> > >         make: *** No rule to make target 'arch/powerpc64/Makefile'.  Stop.
> >
> > If you have the config, then
> > $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang -j71
> > If you recompile with CONFIG_DEBUG_INFO, you can get the stack frame
> > information. I wrote a tool to parse this for these cryptic warnings.
> > https://github.com/ClangBuiltLinux/frame-larger-than
>
> I can build the file and get the warning now, but the frame_larger_than.py
> script doesn't work:
>
> $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang fs/f2fs/super.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CC [M]  fs/f2fs/super.o
> fs/f2fs/super.c:3303:12: warning: stack frame size of 2064 bytes in function 'f2fs_fill_super' [-Wframe-larger-than=]
> static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>            ^
> 1 warning generated.
>
> $ python3 ~/src/frame-larger-than/frame_larger_than.py fs/f2fs/super.o f2fs_fill_super
> failed to parse elf: Unsupported relocation type: 1

Looks like the python library I'm using to parse the DWARF debug info
doesn't understand some ppc64 specific relocation kind, and is
throwing an ELFError.  Let me report it upstream.

The hard part for these is inlining; it can be hard to tell which
child has a large local allocation when looking at the warning about
the parent.

Then again, my script is just nicer output than `llvm-dwarfdump foo.o`
or `readelf --debug-dump=info foo.o` for this specific issue.

-- 
Thanks,
~Nick Desaulniers


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
