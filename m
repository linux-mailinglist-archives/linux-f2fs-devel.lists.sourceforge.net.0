Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9531C65C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 04:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4K/KT6UFxWKvJI/cvBOAHvWtxjgN1BTeiM7HqN4pqgA=; b=ApIkMq0fCVUkkkLrh9lUbOvSM
	WInq5fA8U7KlCevwAPE6HpeKuqyr1uBshY8c7WpiIxtPROjCFmdievjWAjVZVcq+mhFuhlOrO4Dsl
	kb66R/Yiix00yM5WKXpkrd6oXLDcq1vSjrfeU2GWEENmTA/7HJBeFtA7u2oZZW0Q0aWwI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW9UY-0003qL-A7; Wed, 06 May 2020 02:08:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1jW9UX-0003q6-86
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 02:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVw8L0hHvwbYi4+P+g/ulJkZcv445iN2F6ec7gN2/Cw=; b=Fw+rd7uqfbPEgfE7EqnH83yN1T
 9eTHtlebN4CmejifcW9BoCFddddevqcruClak3zuNO5p1TqQnwDGTyc8WFCjYmVmdYqlrngNjGasO
 TMIuNgf0oSIpBnY4tDZKD5cNmD+uKssEqzm9F5NDfTjGo/JuWe6ry0uzwENI5/th9M/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVw8L0hHvwbYi4+P+g/ulJkZcv445iN2F6ec7gN2/Cw=; b=Ap13Nl7FfCxmKa0HzAgQ/fOQ8h
 JlhYhNg0HEMrQicB92RsBlQ/R6G/5fPsQ4R4pPAXsCKb3jYpGyV7O+faTwnyxVYL3C0ZwiU7CccMq
 DRNmhZW9aDR9nXZBsPmD30urfb2S266TVquxl4mzL9QplFdJ43nkkuJLKOBRRcq8DzcQ=;
Received: from sonic301-30.consmr.mail.ne1.yahoo.com ([66.163.184.199])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jW9UU-0092zo-Py
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 02:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1588730923; bh=CVw8L0hHvwbYi4+P+g/ulJkZcv445iN2F6ec7gN2/Cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=EYptk8vbukDYr++fbFbA6vX7a1aJ9EYWwKGsNKly5I75Gyg88LRUvZwY/lhiVKIaTGFdnK78rAtxbNqBDt+THF7ZhSCH8HNKNftseGUtGzORSPtkwuQsY39N9Cr9+78lAh8KBcsP1BPnNJSKUIlEjUtuLAEW0zp6K+hTGdgHhfG3P7piNJX4Z8LRivdi6RUwbCMhXCUeerloVqRWqvGWFk46jdlAHfb+s7teMLHJ8SJLnN9xltbDizygeW4PXis3ukyhE+fAq8cB3VmqonQUOruYLsd/JYA+ddzsRM7VfisW2RQc2bmWhuXqkn8rGUFo4DqHxOyKv+fwuQwauwozdg==
X-YMail-OSG: dPJe8ugVM1lJ7eTlX1XsifqxHQRvA0UbC5tcZjxQjH38EgesuRdHVOrDHnnm2Cg
 yQkj4aczzG0nEe7NVRu3_8QIWgBmC.UAOWaJdIwnlUmzOddnF52P76OkmR9Bph3D_ehjmo6HEKeq
 o0GUuxdZCvB_c_cZm6pfIduHe1yU8lU0yf1pQUs.kVhQV2Nexb_lNseGEXHgqMACkp5.5S4Ncgnj
 o_Rs3bSTYryLC.wibcA6bR..m53EQBiYsV6k0KxQsr76r1q_k6z72.acLuYAF80ZlvGaFMEjJLGb
 tASr.M9C2AS1cTlSzQqR7O1UUBKdLhPjkb0y7Gwttdx_Hx1MPH_tPulIo2vEubchCSxIwtWXRU4F
 W34ETn1jRdRgIlFIJOGAGxrYzYZsmoajFQPGSAMldAcMIPEgVwZ5uuwdw3FBlMud8CTPwFQ1cXCK
 936zwuZ07o6JAE.N4ylnEyYS7GT_sAAHJICVTrkAHk_JxnTEompSdRfiwP7KAq9bKSOj2PlEpSOX
 _J_vXKdpk00W2Bp4WDMmK5R3JCGsCzfDi8seJHTItXae1RT3SRClJ1KvqmY3dRfA9ecHzjKg_Vc5
 QDYDGzyWJSc9PB1OcrNTNXLcdQ3ap5szzYmAEwwvz9sKyMW4rppaBin.IVRTiIUzCcGQjNOMfa91
 SU_OdRDMTUEnuEVDiEEB1jS8QfC54usOWPwVHRxFPt8hoUR5v3rOdE6Bn5fpgzObL.bIUQD5pSnz
 U1E338otrXRQyc9k5pzzhJoCBrzBy6_ES843l2QBrWQD8uCeyH9lKHA.Qi7Yk.jxlafUko367oSl
 _05iYXpCQ.aNCN7_peCIlMjM.DU7CDfJGnfifoyVEmArdO_PSCaCo1tasDEixfQ8sqyYPjAf_5zD
 lSavLGrzv4rPh_zgQwbAZbEhbqZxkbPcFEW.MmpQRZWep0RGEnPxc1YvOFUUXqVBYlhlGFfaoXbu
 I4KmD9sWTgF.Aar3KFxoszxXH0kREhXgmAEx8amJLYy4Q0bBH7wdtwjBUuV3jFzBjCjvrL630zGk
 wnZ.prYznyEQHPQ0LFcjL4FLv3iJJZZuMMeYH43E1vABfMmt4_viDZwUUjDIn7eP4kWBKHQeJ.nv
 rgHUxz1xKmP8N1GBwjaIWsd91_HcftbiGKLsZtxwiLKoKKJ2IigVrxx3hLlMtt3a43YkdmrNZwu5
 MUGymKNdqsV.eB4qF30Dko1MOqz3V8IlRp.VVJ8hb7GQefrBppKIS7stqY5xrK8Rd2Jf189S0rsP
 EWIRvnc0tRZic26x9yPWCA8FARrWsaWzuT0KplIZSitLNgnMfKcsOiR3y24P3Xae0nd9yClAxTiB
 QCf5_JEr1kSMrU1CWM4bwwUA.snwVNHASg59f0HQ_ENqzeVIZr3JZexKRT6GStPv8V2w6PD_xqHt
 oWRU2DRV7IMnc_7ZbsKLriaPFx8s-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 6 May 2020 02:08:43 +0000
Received: by smtp405.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID e5177e5190e2c0ef014e81220c738f10; 
 Wed, 06 May 2020 01:58:34 +0000 (UTC)
Date: Wed, 6 May 2020 09:58:22 +0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506012428.GG128280@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [66.163.184.199 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [66.163.184.199 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jW9UU-0092zo-Py
Subject: Re: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 Gao Xiang <hsiangkao@gmx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
> On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> > >
> > > Actually, I think this is wrong because the fsync can be done via a file
> > > descriptor that was opened to a now-deleted link to the file.
> > 
> > I'm still confused about this...
> > 
> > I don't know what's wrong with this version from my limited knowledge?
> >  inode itself is locked when fsyncing, so
> > 
> >    if the fsync inode->i_nlink == 1, this inode has only one hard link
> >    (not deleted yet) and should belong to a single directory; and
> > 
> >    the only one parent directory would not go away (not deleted as well)
> >    since there are some dirents in it (not empty).
> > 
> > Could kindly explain more so I would learn more about this scenario?
> > Thanks a lot!
> 
> i_nlink == 1 just means that there is one non-deleted link.  There can be links
> that have since been deleted, and file descriptors can still be open to them.

Thanks for your inspiration. You are right, thanks.

Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.

And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
no race by using d_find_alias here. Thanks again.

Thanks,
Gao Xiang

> 
> > 
> > >
> > > We need to find the dentry whose parent directory is still exists, i.e. the
> > > parent directory that is counting towards 'inode->i_nlink == 1'.
> > 
> > directory counting towards 'inode->i_nlink == 1', what's happening?
> 
> The non-deleted link is the one counted in i_nlink.
> 
> > 
> > >
> > > I think d_find_alias() is what we're looking for.
> > 
> > It may be simply dentry->d_parent (stable/positive as you said before, and it's
> > not empty). why need to d_find_alias()?
> 
> Because we need to get the dentry that hasn't been deleted yet, which isn't
> necessarily the one associated with the file descriptor being fsync()'ed.
> 
> > And what is the original problem? I could not get some clue from the original
> > patch description (I only saw some extra igrab/iput because of some unknown
> > reasons), it there some backtrace related to the problem?
> 
> The problem is that i_pino gets set incorrectly.  I just noticed this while
> reviewing the code.  It's not hard to reproduce, e.g.:
> 
> #include <unistd.h>
> #include <fcntl.h>
> #include <sys/stat.h>
> 
> int main()
> {
>         int fd;
> 
>         mkdir("dir1", 0700);
>         mkdir("dir2", 0700);
>         mknod("dir1/file", S_IFREG|0600, 0);
>         link("dir1/file", "dir2/file");
>         fd = open("dir2/file", O_WRONLY);
>         unlink("dir2/file");
>         write(fd, "X", 1);
>         fsync(fd);
> }
> 
> Then:
> 
> sync
> echo N | dump.f2fs -i $(stat -c %i dir1/file) /dev/vdb | grep 'i_pino'
> echo "dir1 (correct): $(stat -c %i dir1)"
> echo "dir2 (wrong): $(stat -c %i dir2)"
> 
> i_pino will point to dir2 rather than dir1 as expected.
> 
> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
