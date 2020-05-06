Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A91C7D78
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 00:36:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWSeq-0001sh-Tw; Wed, 06 May 2020 22:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@gmx.com>) id 1jWSeo-0001sU-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 22:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gEwOfUlsMM5h3OpqY7i/EiLvl5WA4yhiNg12Ebub+E=; b=eP5r+mgQXlx2K7RXPGcGdBK5MX
 JVmhQpeLXGvfuxRKpPB2HoLH9PltfNQX1tXp+qvzkfvpOmEjWiRw4vubhZfSdodS3Y6edmC6YoQAn
 jSSRS+KBmW66Laab9SuCNDRVavq8m5EUHBrWwyMrRcPXwePvBVz3UKiGdqcvMa6njXww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gEwOfUlsMM5h3OpqY7i/EiLvl5WA4yhiNg12Ebub+E=; b=kGolT0pHmjQxyGdY2gqiAQpw2V
 YZT3XC3T0S86zXFC0PPXYeuvFddhm+7UF5GTo/mUfqpIj+D3Obvwxae8OH9hlcSUrst6Svxsqjgwb
 wE29n9FNqWrxcJxrPDBNmFDsm0sVk9ZPagY+/faen/jeY7gpw3x9FWt/zIAr7F7F0ktE=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWSem-00GqV7-2j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 22:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588804597;
 bh=jMqTPLplV3feDysjlHGaAHOsRH2Ey6JsMC0NKjgtrfM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=DYUT6FUxuw9qQ1wAYbAe6qjKFNWYfbXkGhDXd5/F0XVIVHXHHApscpdoOe78IE2iF
 9rytMwth/vTVtfzxZN7onK1bpx4TGDVRkrKTQAl50/h0O5HYQ24Ezh3F+XwcSpANv9
 fp+gp7YVL1FfrYqHhmE+XZ9gMDeGskEUPvZLJ1b8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from hsiangkao-HP-ZHAN-66-Pro-G1 ([120.242.76.42]) by mail.gmx.com
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N7iCg-1j1GTO2bYo-014kRU; Thu, 07 May 2020 00:36:37 +0200
Date: Thu, 7 May 2020 06:36:26 +0800
From: Gao Xiang <hsiangkao@gmx.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200506223623.GA27760@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506191613.GB842@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506191613.GB842@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:ri2UJfRqCi9CrS2zGaKMZ6aJn281d6XAnbJ9XZIUIviP96/s9Eu
 IYngQM4ftXQDiHgqRWZCkQeQyAh1AqJM8f3K8+21t5Y0FFFfNO9OX+ZmMTu0KAtYJtFKzPk
 xrnQ98ASz/SJsokxdl++9IL6cNU4Uuj+GWqrkeYGfsk82Uw9C9/g2KRr9MxfiEAPiYrQQPy
 O1CLYUyrWGH8CikI5M6mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B+lt3r38RYQ=:D2ZUtIJvYc/qkhW/+EPb34
 0mUY5T0xNv7hjQfW990tRbucCEcrq2+FSe0p6gHEVyY2DZOHiGDkrE6wrceIypmVJJmBu76Pc
 6/YrApjWNH3DCambBH9hcvvYJnu2U4ti8BjQ2uZREt01FTuTqSMSmXO1Szdrch0k1ExFeh8H7
 jnks4ZfOpQ/Pk7aWu4SI/TyL0Z/JdQcLquFqtDOAO8W6ajGAUEz69oRXca7OLmVwJKnqxpTVW
 OjwpDTNe2b0AUimzzT6C5rCJUDD/aVj9i7BZuYdIuWhgkpPdZ8sA1huiZ+xfZ69F7zFLr1m1V
 Iho7aOoEt7Lqb7PzjGxoYTs7nvWJn4HA5M9OWWYZQ2T4N2xSUo5kr0aPks2FTO/1g2a4JC/M/
 /ygoqzTOJSATnPrv/rkXFObRCdO+T/OkCsLj6ud1+RFaE/P3zWKaFGQTkEZkKSemP3QR3ZEIL
 DdYDBN9n+mu1Fnyt3n59azTt4+SjcKOUpOJcUG/qPlx56xeefk1qDi1AoU2h1vOcJyQFun1wL
 yHM6nmYnLnJsZA7UB8TrRz73Iv62gNGgGQLJQpbTWfhyAxk6tpabr7DllcY1IJ78oJtggo0k8
 Fq0KbAfrTojKmIj9m84HdvOkxV35jm1TuAMvRw5vsVf8ruvbS1tWTEruub2I/UHFi4BpaMLU7
 j3LlRwF5POt0y8JrvbNrh4CSIa1SbGNJVVvdjbOzivANycXOJDGBU2JqXBf4d03sQO/1PA9Y/
 Kg76huCQx+S0YvrROR04LDwTEP3EXYNifLqm5R7xYFKK0N4byibFzWN5M/H8MRy7G1zu9uS6o
 5GQeu6TT9LOPFQwhtKGLt6Ksf33tRmA/U+51DjUpdt3T+K7wpJENVwq3H6vUJ79QgffLuFTIn
 omaDP4mZct7qMBUZi8ToC6jDjO9fpOyri8+goGVqO+7p/po9cBLlXRTdO+G/p7I8vVDKOF0Hu
 VE8+m6hFHDyk0MLagOi9kEyvZSjo9l1JYVv98THoyToNozfc5bXZxAtIgaC03SWRw1GnCiOP1
 ov7mTCxlXgCjjo63OISXzstJPBr4dYvUMSKdL3y83pFeLSL/AIwZajb6KuuhUoQNKLPaP0MZf
 bhKEGoUh8cz5hDG1cU6H2YOawbC0shB/+m/XFP1fPSjBSZDvSHngN1ACQDawZ9pzeaNQaQK6K
 NEtIZEjSN/yVLHjkKeLZOoJN9tdcS6MwQEazlCn/5JLzgfpe64Y5wsXd6lTBVNf9pPG0tUHSF
 +EJ/ZlGWO9wRl7rT6
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]gmx.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.17.21 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWSem-00GqV7-2j
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 06, 2020 at 12:16:13PM -0700, Eric Biggers wrote:
> On Wed, May 06, 2020 at 02:47:19PM +0800, Gao Xiang wrote:
> > On Wed, May 06, 2020 at 09:58:22AM +0800, Gao Xiang wrote:
> > > On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
> > > > On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> > > > > >
> > > > > > Actually, I think this is wrong because the fsync can be done via a file
> > > > > > descriptor that was opened to a now-deleted link to the file.
> > > > >
> > > > > I'm still confused about this...
> > > > >
> > > > > I don't know what's wrong with this version from my limited knowledge?
> > > > >  inode itself is locked when fsyncing, so
> > > > >
> > > > >    if the fsync inode->i_nlink == 1, this inode has only one hard link
> > > > >    (not deleted yet) and should belong to a single directory; and
> > > > >
> > > > >    the only one parent directory would not go away (not deleted as well)
> > > > >    since there are some dirents in it (not empty).
> > > > >
> > > > > Could kindly explain more so I would learn more about this scenario?
> > > > > Thanks a lot!
> > > >
> > > > i_nlink == 1 just means that there is one non-deleted link.  There can be links
> > > > that have since been deleted, and file descriptors can still be open to them.
> > >
> > > Thanks for your inspiration. You are right, thanks.
> > >
> > > Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
> > > take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.
> > >
> > > And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
> > > no race by using d_find_alias here. Thanks again.
> > >
> >
> > (think more little bit just now...)
> >
> >  Thread 1:                                           Thread 2 (fsync):
> >   vfs_unlink                                          try_to_fix_pino
> >     f2fs_unlink
> >        f2fs_delete_entry
> >          f2fs_drop_nlink  (i_sem, inode->i_nlink = 1)
> >
> >   (...   but this dentry still hashed)                  i_sem, check inode->i_nlink = 1
> >                                                         i_sem d_find_alias
> >
> >   d_delete
> >
> > I'm not sure if fsync could still use some wrong alias by chance..
> > completely untested, maybe just noise...
> >
>
> Right, good observation.  My patch makes it better, but it's still broken.
>
> I don't know how to fix it.  If we see i_nlink == 1 and multiple hashed
> dentries, there doesn't appear to be a way to distingush which one corresponds
> to the remaining link on-disk (if any; it may not even be in the dcache), and
> which correspond to links that vfs_unlink() has deleted from disk but hasn't yet
> done d_delete() on.
>
> One idea would be choose one, then take inode_lock_shared(dir) and do
> __f2fs_find_entry() to check if the dentry is really still on-disk.  That's
> heavyweight and error-prone though, and the locking could cause problems.
>
> I'm wondering though, does f2fs really need try_to_fix_pino() at all, and did it
> ever really work?  It never actually updates the f2fs_inode::i_name to match the
> new directory.  So independently of this bug with deleted links, I don't see how
> it can possibly work as intended.

Part of my humble opinion would be "update pino in rename/unlink/link... such ops
instead of in fsync" (maybe it makes better sense of locking)... But actually I'm
not a f2fs folk now, just curious about what the original patch resolved with
these new extra igrab/iput (as I said before, I could not find some clue previously).

Thanks,
Gao Xiang

>
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
