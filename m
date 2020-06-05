Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930E1F00A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 21:57:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhITA-0005NP-Dk; Fri, 05 Jun 2020 19:57:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jhIT7-0005N2-LY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 19:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5xjWmaG8WHN7CEXjjhoPn/kI6PwwDf65SGhY/+MrHo0=; b=F3Vtx+u0/XkxbyebNr0Cz61/Vy
 +C0T6AffQHFwin55fOhivfMjKwkdTofk93NqPQhLfciXwjZnEoVVZ5GQkqOp25A+3CoGiToueVlsp
 4YPxuhbBwtHgFEKID0EB890C2Ruk+og0VpwP/V+zPYHqHE7R7VbLtB6VxGOQRbtwdCXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5xjWmaG8WHN7CEXjjhoPn/kI6PwwDf65SGhY/+MrHo0=; b=JskvUQQL9UeDPR1HuKaLpGhbJA
 gIGmm7I2KTiOEDJmpyYQDsfBT/g8kz+bozQcaHYnwA422YjIb0vOXIzideW1cwyEOvBeWzTpa/z7c
 eELw+JodEah9xvt7S0EMk2dbkwI49BKCfi3d0H8evVqLqluUQnUm+qzvcBwk7BGd+os4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jhIT1-007T4G-FJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 19:57:33 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D16E12074B;
 Fri,  5 Jun 2020 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591387035;
 bh=xp3wlTPD1qqCeOdClvuvXGjeJZWwKMaUYR5XvIvTsXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yNWeYFa2978EWTxIaq+rI6tMAx+iwv7QU3qBZdF/WGzdaAaL3bCZ2QohM94SFJ7A1
 ojq2UTDpe/+rHKJ+LV5Qa9udzhbnf+oTuFSHj1WTYFafiPMRBWFYk4VtHp+MyZzhl3
 MF3upIG3/VFBXRIRYFaL2ojgVbiY2pZM7SWP8aD8=
Date: Fri, 5 Jun 2020 12:57:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20200605195713.GL1373@sol.localdomain>
References: <202006051725.63EW72i7%lkp@intel.com>
 <20200605145546.GA227721@google.com>
 <20200605160830.GB1373@sol.localdomain>
 <CAKwvOdm1Ew1dBVcmxDHtKWp383Dsrxjhaweek=-LDomfKnj7Qg@mail.gmail.com>
 <20200605193359.GK1373@sol.localdomain>
 <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhIT1-007T4G-FJ
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 05, 2020 at 12:42:59PM -0700, Nick Desaulniers wrote:
> On Fri, Jun 5, 2020 at 12:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Jun 05, 2020 at 09:45:43AM -0700, Nick Desaulniers wrote:
> > > On Fri, Jun 5, 2020 at 9:08 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > On Fri, Jun 05, 2020 at 07:55:46AM -0700, Jaegeuk Kim wrote:
> > > > > Eric,
> > > > >
> > > > > Could you PTAL?
> > > > >
> > > > > On 06/05, kernel test robot wrote:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> > > > > > head:   adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > > > commit: adf3d3a53cf13d0998c699ba43d8582c875179e3 [48/48] f2fs: don't return vmalloc() memory from f2fs_kmalloc()
> > > > > > config: powerpc64-randconfig-r011-20200605 (attached as .config)
> > > > > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> > > > > > reproduce (this is a W=1 build):
> > > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > > >         chmod +x ~/bin/make.cross
> > > > > >         # install powerpc64 cross compiling tool for clang build
> > > > > >         # apt-get install binutils-powerpc64-linux-gnu
> > > > > >         git checkout adf3d3a53cf13d0998c699ba43d8582c875179e3
> > > > > >         # save the attached .config to linux build tree
> > > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64
> > > > > >
> > > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > I don't know what's causing this.  It doesn't look at all related to my commit,
> > > > and I don't see what's using so much stack in f2fs_fill_super().
> > > >
> > > > @kernel test robot: the directions given above don't actually work.
> > > > First I got an error due to powerpc64-linux-gnu-elfedit not existing.
> > > > So I had to build binutils for powerpc64 myself.
> > > >
> > > > Then I still got an error:
> > > >
> > > >         make: *** No rule to make target 'arch/powerpc64/Makefile'.  Stop.
> > >
> > > If you have the config, then
> > > $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang -j71
> > > If you recompile with CONFIG_DEBUG_INFO, you can get the stack frame
> > > information. I wrote a tool to parse this for these cryptic warnings.
> > > https://github.com/ClangBuiltLinux/frame-larger-than
> >
> > I can build the file and get the warning now, but the frame_larger_than.py
> > script doesn't work:
> >
> > $ ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- make CC=clang fs/f2fs/super.o
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   CC [M]  fs/f2fs/super.o
> > fs/f2fs/super.c:3303:12: warning: stack frame size of 2064 bytes in function 'f2fs_fill_super' [-Wframe-larger-than=]
> > static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >            ^
> > 1 warning generated.
> >
> > $ python3 ~/src/frame-larger-than/frame_larger_than.py fs/f2fs/super.o f2fs_fill_super
> > failed to parse elf: Unsupported relocation type: 1
> 
> Looks like the python library I'm using to parse the DWARF debug info
> doesn't understand some ppc64 specific relocation kind, and is
> throwing an ELFError.  Let me report it upstream.
> 
> The hard part for these is inlining; it can be hard to tell which
> child has a large local allocation when looking at the warning about
> the parent.
> 
> Then again, my script is just nicer output than `llvm-dwarfdump foo.o`
> or `readelf --debug-dump=info foo.o` for this specific issue.
> 

I did confirm that my commit "f2fs: don't return vmalloc() memory from
f2fs_kmalloc()" actually caused this, in particular the following part:

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a71da699cb2d55..f3c15116954218 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3033,7 +3033,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
        if (nr_sectors & (bdev_zone_sectors(bdev) - 1))
                FDEV(devi).nr_blkz++;
 
-       FDEV(devi).blkz_seq = f2fs_kzalloc(sbi,
+       FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
                                        BITS_TO_LONGS(FDEV(devi).nr_blkz)
                                        * sizeof(unsigned long),
                                        GFP_KERNEL);

This is inlined as:

    f2fs_fill_super()
     => f2fs_scan_devices()
        => init_blkz_info()
           => f2fs_kvzalloc()

Somehow this change increased the frame size of f2fs_fill_super() from 1984 to
2064 bytes.  That exceeds the 2048-byte limit, triggering the warning.

So, f2fs_fill_super() was very close to the limit already.  I'm not sure why; I
don't see any huge stack allocations in it or in static functions it calls.
Maybe there is a kconfig option that is increasing the stack usage?

If I add noinline_for_stack to f2fs_scan_devices(), the frame drops to 1744
bytes.  Or if I add noinline_for_stack to read_raw_super_block(), the frame
drops to 1776 bytes.  We could do either (or both) of those to avoid the
warning.  But we'd still wouldn't be that far from this 2048-byte "limit".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
