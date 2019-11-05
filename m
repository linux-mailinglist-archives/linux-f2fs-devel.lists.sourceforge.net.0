Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B52CBF0102
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 16:16:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iS0Ys-0003Yg-M8; Tue, 05 Nov 2019 15:16:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>) id 1iS0Yp-0003YO-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 15:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJMnOjoSvEX9nw1wXqVxFVEOqwyIGjaqSmI6Hi3ZEbY=; b=VpO8fqNvEV994sp+bh3jUpOt7t
 PwYeFTII5duS/eVD5p1nG/mfZlSggjcy4FRuEmvRlBpOgsxuZWOljb3KtE5VGfwzD18nCF7SGUY8I
 90bHlOSYdl1BAUq/9g903IlDz3HB3n9j9y2jptUdFMiaYivQg9uHaqanw3aaB9Xu/drg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jJMnOjoSvEX9nw1wXqVxFVEOqwyIGjaqSmI6Hi3ZEbY=; b=YXx4bHSiPTUXJw2OeKDTkkGxfd
 1L3097g/u4KQzLB0dO5yID+cg5XZgFUrCf6pdveLZbmZJAtbrrbk3cTW5qAhqrAMpfAr0jhT1+5xV
 p+mycvI/JR/g7xB11xAQTp2lBIEZR1rJ2uuX6Iyiol1nPMuS4WmUoxz/ZCGyiMoJbLtk=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iS0Yl-0010JA-0h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 15:15:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B601AFB1;
 Tue,  5 Nov 2019 15:15:47 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 04675DA796; Tue,  5 Nov 2019 16:15:50 +0100 (CET)
Date: Tue, 5 Nov 2019 16:15:50 +0100
From: David Sterba <dsterba@suse.cz>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20191105151550.GK3001@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Dave Chinner <david@fromorbit.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-xfs@vger.kernel.org, Jan Kara <jack@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 driverdevel <devel@driverdev.osuosl.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-erofs@lists.ozlabs.org,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
 <CAMuHMdXzyVBa4TZEc5eRaBzu50thgJ2TrHJLZqwhbQ=JASgWOA@mail.gmail.com>
 <20191101213823.GW4614@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101213823.GW4614@dread.disaster.area>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vt.edu]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iS0Yl-0010JA-0h
Subject: Re: [f2fs-dev] [RFC] errno.h: Provide EFSCORRUPTED for everybody
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
Reply-To: dsterba@suse.cz
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Gao Xiang <xiang@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 02, 2019 at 08:38:23AM +1100, Dave Chinner wrote:
> On Fri, Nov 01, 2019 at 09:57:31PM +0100, Geert Uytterhoeven wrote:
> > Hi Valdis,
> > 
> > On Thu, Oct 31, 2019 at 2:11 AM Valdis Kletnieks
> > <valdis.kletnieks@vt.edu> wrote:
> > > Three questions: (a) ACK/NAK on this patch, (b) should it be all in one
> > > patch, or one to add to errno.h and 6 patches for 6 filesystems?), and
> > > (c) if one patch, who gets to shepherd it through?
> > >
> > > There's currently 6 filesystems that have the same #define. Move it
> > > into errno.h so it's defined in just one place.
> > >
> > > Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
> > 
> > Thanks for your patch!
> > 
> > > --- a/include/uapi/asm-generic/errno.h
> > > +++ b/include/uapi/asm-generic/errno.h
> > > @@ -98,6 +98,7 @@
> > >  #define        EINPROGRESS     115     /* Operation now in progress */
> > >  #define        ESTALE          116     /* Stale file handle */
> > >  #define        EUCLEAN         117     /* Structure needs cleaning */
> > > +#define        EFSCORRUPTED    EUCLEAN
> > 
> > I have two questions:
> > a) Why not use EUCLEAN everywhere instead?
> >     Having two different names for the same errno complicates grepping.
> 
> Because:
> 	a) EUCLEAN is horrible for code documentation. EFSCORRUPTED
> 	describes exactly the error being returned and/or checked for.
> 
> 	b) we've used EFSCORRUPTED in XFS since 1993. i.e. it was an
> 	official, published error value on Irix, and we've kept it
> 	in the linux code for the past ~20 years because of a)
> 
> 	c) Userspace programs that include filesystem specific
> 	headers have already been exposed to and use EFSCORRUPTED,
> 	so we can't remove/change it without breaking userspace.
> 
> 	d) EUCLEAN has a convenient userspace string description
> 	that is appropriate for filesystem corruption: "Structure
> 	needs cleaning" is precisely what needs to happen. Repair of
> 	the filesystem (i.e. recovery to a clean state) is what is
> 	required to fix the error....

The description is very confusing to users that are also not filesystem
developers. "Structure needs cleaning" says what needs to be done but
not what happened. Unlike other error codes like "not enough memory",
"IO error" etc. We don't have EBUYMEM / "Buy more memory" instead of
ENOMEM.

Fuzzing tests and crafted images produce most of the EUCLEAN errors and
in this context "structure needs cleaning" makes even less sense.

> > b) Perhaps both errors should use different values?
> 
> That horse bolted to userspace years ago - this is just formalising
> the practice that has spread across multiple linux filesystems from
> XFS over the past ~10 years..

EFSCORRUPTED is a appropriate name but to share the number with EUCLEAN
was a terrible decision and now every filesystem has to suffer and
explain to users what the code really means and point to the the sad
story when asked "So why don't you have a separate code?".

I wonder what userspace package really depends on the value, that would
eg. change code flow. Uncommon error values usually lead to a message
and exit.

Debian code search shows only jython, e2fsprogs, xfsprogs, python2.7,
pypy, linux, partclone using EFSCORRUPTED. So 2 of them are filesystem
packages that can handle that, python/jython only defines the value for
IRIX platform. The rest is linux kernel, not relevant.

So please give me one example where userspace will break.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
