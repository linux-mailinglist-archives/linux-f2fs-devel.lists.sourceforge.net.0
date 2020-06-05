Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A61651F00AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 22:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiWOSTKrujhpuAx5KirV7IvQneTNuPGUZPRExRGZKHU=; b=igZp88nt6RVKIhivuk/YwTl9eA
	+Ap90V7fJKEjtvF9+glM36emtaKSb+F7k39GXg7chKnNkEzpTdcsF/25jw0ozkGhveC6OB0+hrTct
	0/2fOdX4QWk06Yflqu9aTcOVD9u8gh1iH+Zb+uNOJlyL6TI/bYM8RRX30YaVvs7JHWZQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhIYm-0005Qk-A7; Fri, 05 Jun 2020 20:03:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ndesaulniers@google.com>) id 1jhIYk-0005QU-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IV4TCdaU+wjO6SzPJslJYOldVPEpezf297LQeNrgDG8=; b=Y3ges/2vI/LVfzDHWV09vSaDFU
 Dg2uonBOWp9tgs7o6iEQI00NrchSLG3scdhBZBlBiVeltwLRRbBcdYvEB0tAr1+ygEo/dqcvSTBlT
 CeiSpIkftUFcy02L6mWzJ80Ry9q1s6/QBO0iICxolUQjKqaUoqFR37y09DFjVXdCgepk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IV4TCdaU+wjO6SzPJslJYOldVPEpezf297LQeNrgDG8=; b=StI410o1sNwFoQpGvXM4d4Jkbn
 CP1txUzxjNd+o93k1jtLd70cTYdgK2NSv/AFgRVsySY15lzFBa7FrjW5+4l99VvZ6wyjtBnvjpP9i
 oZJ8eDgiKCVRfPPMVcUMl6JG10plxcus3S3QYtTV8XVlpN+A0CaUq1W6hDyqVzZtQN5c=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhIYf-00DKpU-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:03:22 +0000
Received: by mail-pf1-f194.google.com with SMTP id 64so5453411pfg.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2020 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV4TCdaU+wjO6SzPJslJYOldVPEpezf297LQeNrgDG8=;
 b=OIDGDTtA7t5PShoqaxYQSu8tbEBg0QThH2bwbRCLMNPnUIi1CIWbXRanUxJ9cxKnVK
 VrzMbY+ItvY91FVIbPHyqrJoSlUNbDYToK9VsALH/tJAxnmOEe2zL+Q3xp+0y/HXS66U
 Ep9lXroQ2av6JQgcljkOkqijwR6YhOHI7+dCfGBNvDXUPi3XsNShFV3oeHGrcIWKiUzB
 coZPrLlTYiHAZ5ekgCt8CkB2yvsTUlZN1Pcan3u5krYlOlAgL8lstwEAdzQcywtTBrI3
 ZGwVN4z1ocC7m6ss2QBZbLEuqsvKwzuVIamlRDAywG36uJb3cPr16rSiow1ySABy2IBP
 Othg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV4TCdaU+wjO6SzPJslJYOldVPEpezf297LQeNrgDG8=;
 b=lvgv2cDMNbDxDHDIx+LHPfj7aFuDzQliiWyQ+jn5YcP4OegWEmoATOarp42Ly9hsob
 N5zh6FbauG+I2a3o/L+1sVEqm3iyJCAETrhOk/SN/fKVteQW/Ph1S22v/njR0hiZEx4S
 1CqwVXI3+BBvhVrsIafN9Yw77n8divrP8HXufbCCIelB0ENo1x6gp+iMmhSMTrLRu2ud
 K6jAOX0GXKHwai6yTzLv9M7taBJSjTeUKvuVUq5tXeRjzu7XEHfESqMq+K5EthMo9no9
 0vY9EAwY1FfyvIGZ3nwqaNq1YB69ejJ0x9y0hDxXwk0N2CBou9SEXzqA7TXpC7xLWv+u
 L74g==
X-Gm-Message-State: AOAM532EUruHO7F3SCYi4NoiEKG/ylCUUzjOifBHYapPKTO1WnqC0rsA
 9LzqUekO/J4rXBlU6WElxVrlCOQNQeiOdgf0w5aQog==
X-Google-Smtp-Source: ABdhPJzw2y3/nvSBjaRRoa1N1fPXWTN4UhXXsQlgNXx5KF5f6N9q8v+PyANMu2G4bS01Tvz4zHcoRW9SdUR3Y3Jfrik=
X-Received: by 2002:aa7:8dc7:: with SMTP id j7mr11439096pfr.169.1591387384798; 
 Fri, 05 Jun 2020 13:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <202006051725.63EW72i7%lkp@intel.com>
 <20200605145546.GA227721@google.com>
 <20200605160830.GB1373@sol.localdomain>
 <CAKwvOdm1Ew1dBVcmxDHtKWp383Dsrxjhaweek=-LDomfKnj7Qg@mail.gmail.com>
 <20200605193359.GK1373@sol.localdomain>
 <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
 <20200605195713.GL1373@sol.localdomain>
In-Reply-To: <20200605195713.GL1373@sol.localdomain>
Date: Fri, 5 Jun 2020 13:02:54 -0700
Message-ID: <CAKwvOdm_EfEuhb8QVNzbFhVnTN+q5tkDkWPxOpC+rfzOVxpWVg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhIYf-00DKpU-Ur
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

On Fri, Jun 5, 2020 at 12:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 05, 2020 at 12:42:59PM -0700, Nick Desaulniers wrote:
> > On Fri, Jun 5, 2020 at 12:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 09:45:43AM -0700, Nick Desaulniers wrote:
> > > > On Fri, Jun 5, 2020 at 9:08 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > >
> > > > > On Fri, Jun 05, 2020 at 07:55:46AM -0700, Jaegeuk Kim wrote:
> > > > > > Eric,
> > > > > >
> > > > > > Could you PTAL?
> > > > > >
> > > > > > On 06/05, kernel test robot wrote:
> > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> > > > > > > head:   adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > > > > commit: adf3d3a53cf13d0998c699ba43d8582c875179e3 [48/48] f2fs: don't return vmalloc() memory from f2fs_kmalloc()
> > > > > > > config: powerpc64-randconfig-r011-20200605 (attached as .config)
> > > > > > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> > > > > > > reproduce (this is a W=1 build):
> > > > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > > > >         chmod +x ~/bin/make.cross
> > > > > > >         # install powerpc64 cross compiling tool for clang build
> > > > > > >         # apt-get install binutils-powerpc64-linux-gnu
> > > > > > >         git checkout adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > > > >         # save the attached .config to linux build tree
> > > > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64
> > > > > > >
> > > > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > >
> > > > > I don't know what's causing this.  It doesn't look at all related to my commit,
> > > > > and I don't see what's using so much stack in f2fs_fill_super().
> > > > >
> > > > > @kernel test robot: the directions given above don't actually work.
> > > > > First I got an error due to powerpc64-linux-gnu-elfedit not existing.
> > > > > So I had to build binutils for powerpc64 myself.
> > > > >
> > > > > Then I still got an error:
> > > > >
> > > > >         make: *** No rule to make target 'arch/powerpc64/Makefile'.  Stop.
> > > >
> > > > If you have the config, then
> > > > $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang -j71
> > > > If you recompile with CONFIG_DEBUG_INFO, you can get the stack frame
> > > > information. I wrote a tool to parse this for these cryptic warnings.
> > > > https://github.com/ClangBuiltLinux/frame-larger-than
> > >
> > > I can build the file and get the warning now, but the frame_larger_than.py
> > > script doesn't work:
> > >
> > > $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang fs/f2fs/super.o
> > >   CALL    scripts/checksyscalls.sh
> > >   CALL    scripts/atomic/check-atomics.sh
> > >   CC [M]  fs/f2fs/super.o
> > > fs/f2fs/super.c:3303:12: warning: stack frame size of 2064 bytes in function 'f2fs_fill_super' [-Wframe-larger-than=]
> > > static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> > >            ^
> > > 1 warning generated.
> > >
> > > $ python3 ~/src/frame-larger-than/frame_larger_than.py fs/f2fs/super.o f2fs_fill_super
> > > failed to parse elf: Unsupported relocation type: 1
> >
> > Looks like the python library I'm using to parse the DWARF debug info
> > doesn't understand some ppc64 specific relocation kind, and is
> > throwing an ELFError.  Let me report it upstream.
> >
> > The hard part for these is inlining; it can be hard to tell which
> > child has a large local allocation when looking at the warning about
> > the parent.
> >
> > Then again, my script is just nicer output than `llvm-dwarfdump foo.o`
> > or `readelf --debug-dump=info foo.o` for this specific issue.
> >
>
> I did confirm that my commit "f2fs: don't return vmalloc() memory from
> f2fs_kmalloc()" actually caused this, in particular the following part:
>
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a71da699cb2d55..f3c15116954218 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3033,7 +3033,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>         if (nr_sectors & (bdev_zone_sectors(bdev) - 1))
>                 FDEV(devi).nr_blkz++;
>
> -       FDEV(devi).blkz_seq = f2fs_kzalloc(sbi,
> +       FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
>                                         BITS_TO_LONGS(FDEV(devi).nr_blkz)
>                                         * sizeof(unsigned long),
>                                         GFP_KERNEL);
>
> This is inlined as:
>
>     f2fs_fill_super()
>      => f2fs_scan_devices()
>         => init_blkz_info()
>            => f2fs_kvzalloc()
>
> Somehow this change increased the frame size of f2fs_fill_super() from 1984 to
> 2064 bytes.  That exceeds the 2048-byte limit, triggering the warning.
>
> So, f2fs_fill_super() was very close to the limit already.  I'm not sure why; I
> don't see any huge stack allocations in it or in static functions it calls.
> Maybe there is a kconfig option that is increasing the stack usage?
>
> If I add noinline_for_stack to f2fs_scan_devices(), the frame drops to 1744
> bytes.  Or if I add noinline_for_stack to read_raw_super_block(), the frame
> drops to 1776 bytes.  We could do either (or both) of those to avoid the
> warning.  But we'd still wouldn't be that far from this 2048-byte "limit".

Right, so my script would have printed out the list of all local
variables in f2fs_fill_super() and their sizes.  With that information
handy, we could assess if there were any smoking guns of clearly
incorrect large stack allocations vs death by a thousand cuts.  Your
change may not have added a new large local allocation, simply tipped
the scale or changed inlining decisions.  They may be other local
variables in this call chain that we should reassess allocation
strategy; ie. dynamic or static rather than local, to avoid the
potential for exhausting kernel stack.
-- 
Thanks,
~Nick Desaulniers


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
