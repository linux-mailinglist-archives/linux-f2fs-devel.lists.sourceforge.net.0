Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 900EC1C64EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 02:14:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW7hp-0005yk-1i; Wed, 06 May 2020 00:14:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@gmx.com>) id 1jW7hn-0005yY-LN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 00:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xw0eUsDrA5vWBvK0Y3BR7p00UQdAeIHj+FGYBktA2ik=; b=Dq45iQvllshmuV1u1i+OJlpUEY
 tV0WeAFlXcBpKgO8pUdfpJxT4kJTt41mhh8byn3ODImFpQnoESYEIlOXfirdXbRNvI9IYqoak+5PU
 Ucu4iFUVhfni9mR5avHkheaH6ydywRs1BIVT9dyEQdtUxjnsppmHNuD0ACTwTaM/6Rp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xw0eUsDrA5vWBvK0Y3BR7p00UQdAeIHj+FGYBktA2ik=; b=JpEXCT2uUWkfbaShJVKZSfjh0/
 VY8Hwrzks4OxbrEBAYlldtF04KnNjPfjpo/R3rinvnL5POqGykDORQQxN5e61lzq8MQX4zR+0OpnT
 BqzAcjKbgFU+IbUpPm6UJzgDyTmD8cKQHP02ICgGhWu3k1tktSRzvfJdlG9DSRHFNaTk=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jW7hl-00F9i1-4K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 00:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588724055;
 bh=VstGBM+9+BOrff1fXnmRzhytiHYZbjWPVGkVLancL10=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=lSbwrVKnFUHv6uPM8VAiWp2OJ8BAEw6EADIbyWpNmYoD5ADYCxycToszJuwEAYRgj
 2eXSF7lMLJaOmWptEMpnqNVb37j4aoWs0t6+0Do8n3mlMxWBs5CYMMTtPYdYIuYR5+
 q7wDeiYNIekM1uCAPAungqPVF2IFHkZxlGx9Df+c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from hsiangkao-HP-ZHAN-66-Pro-G1 ([120.242.76.42]) by mail.gmx.com
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MulmF-1jESOL0V9P-00rmbp; Wed, 06 May 2020 02:14:15 +0200
Date: Wed, 6 May 2020 08:14:07 +0800
From: Gao Xiang <hsiangkao@gmx.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505181941.GC98848@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:+cT0PQODTEdyEfpz5fSWeJDDU8z3WioTeZk54M4Xhf1yjRJkS44
 CMFp1mJW90JMOme4N7Mj0WXSqrczBdkbosVHWt3r5tNF80UszC0G7pD0sFloC26EmqVy12a
 N4jnNR6klWlwdITPteT+bdQLQ20827C9nw5JiPiWKHRYtkQ2B0Csmw+fzxXbVXp49Jlsuwe
 VQucEDOgzxJUWFd0dzgDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zqz0WlMk7ng=:em/tm00iXuGtgmOnGNV8+C
 iWr7hedhiGqpfCxvCyqHti9eM5Sb0YSvic39fJIjuEkBeIJattV+az9w61ki2fkvjoDTYHkOF
 uNo6pXIDoby+Ky1IQjjhZWw9MN0ePUQ36xIrcZ5Z+7SfUo+m7uihhnumc21tL2WOSJDa49d35
 1DG5FZRRSYSyMVCocckL3jsh5E8bDU1r1izSKoJeY6EpXowsbOQx0ws642vnNcmXaOgwJwYZt
 ntSQXL756qX2MUI65H46mgSuV0PtTbEChusD1k5JJwWSRi7wqK3fPcaoY25HMPj+bzpS6l8Ke
 CpRWrzMuyNrJ+2mJTX5XjAWkgjlGAJxTAu5anrA9X4kb91zPPcGwIsedFR+erkGW3rbfOhZtO
 EBl87dJEh7KEVBYp7nbIieXf4ZxH8omWUxbcG5oP0xhwvF4Sve/LWr0n/MVLpKZ76rGBvfCk7
 +5q++3U/EAKGQZuTtt9qmwNpGEBnvhItbYGn6uMtrPmwZMGtOWlCIE47e9saJH+QvByKb67ZK
 m4znWWxVSCq+AXlSxEMfSDeHAlLuu4V37ZM8D08/QkZTkc2jWX2m8KvzfwzFxcCLH152BdiTr
 KUwS+f0zIfpqO0OQznD86TAXezpKL+fFzkNkmSYPP/iSurLLsj4NTLb/+RsbK4cH3y5G9k7Oe
 50Nz1KRcdUclNh3Ag+sR+tNhRLuNgxIxM6SNn7MDcGHTwH8JQrU1earv1kVo7nijGRoWjmP3w
 ytOMEOTLUZa5Jm1SswvRiMVg2nhJopVGuZbCii5RvF0+6dXwZN3jSLVYGCymMcyo8bW7sRBNb
 RgQ6C4v7ENLneUiY23Ey+o4CrIqcSwxg2E84yf1AF5KPkwFlYLRTxNK0TKPTHV1XbhZXBA8pI
 cdcBKBS4TTkyWK8jgwE02oRlYVsWFT7lyRHqo+LPm25gT/FdpnzcxylFz2j+eAmOJImszIvaG
 gjF7cMA3Kf4/d5V3qT61AVYdWHhCku9gu8zdP3wUgsq2O1fTCmya1mb9vjQqtsNAJQUC0sDny
 l9qeRKL+6OyXNl5nCJmPzNxSvN+nxJHaUBg3q3OFFo1qt2oYR4mZaHF4dykZB521ljIsRmFhp
 3nZtzRpIbShj+9uGX9Mfc82CARFS7MVP42QZ9DogVXQ1VGoMdI8pTOuNLv/+ug4joBPyPHVE9
 Zx6SXU5hedTbA1gA0cDi2lc7f/VBADD66x45Bg3Mzjx7zy3XSpGCLoTT4znzHFDeJ+ZZBPCup
 N31N7+xcxwtjzile2
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
X-Headers-End: 1jW7hl-00F9i1-4K
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

Hi Eric,

On Tue, May 05, 2020 at 11:19:41AM -0700, Eric Biggers wrote:
> On Tue, May 05, 2020 at 11:13:23AM -0700, Jaegeuk Kim wrote:

...

> >
> > -static int get_parent_ino(struct inode *inode, nid_t *pino)
> > -{
> > -	struct dentry *dentry;
> > -
> > -	inode = igrab(inode);
> > -	dentry = d_find_any_alias(inode);
> > -	iput(inode);
> > -	if (!dentry)
> > -		return 0;
> > -
> > -	*pino = parent_ino(dentry);
> > -	dput(dentry);
> > -	return 1;
> > -}
> > -
> >  static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
> >  {
> >  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > @@ -223,14 +208,15 @@ static bool need_inode_page_update(struct f2fs_sb_info *sbi, nid_t ino)
> >  	return ret;
> >  }
> >
> > -static void try_to_fix_pino(struct inode *inode)
> > +static void try_to_fix_pino(struct dentry *dentry)
> >  {
> > +	struct inode *inode = d_inode(dentry);
> >  	struct f2fs_inode_info *fi = F2FS_I(inode);
> > -	nid_t pino;
> >
> >  	down_write(&fi->i_sem);
> > -	if (file_wrong_pino(inode) && inode->i_nlink == 1 &&
> > -			get_parent_ino(inode, &pino)) {
> > +	if (file_wrong_pino(inode) && inode->i_nlink == 1) {
> > +		nid_t pino = parent_ino(dentry);
> > +
> >  		f2fs_i_pino_write(inode, pino);
> >  		file_got_pino(inode);
> >  	}
> > @@ -310,7 +296,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> >  		 * We've secured consistency through sync_fs. Following pino
> >  		 * will be used only for fsynced inodes after checkpoint.
> >  		 */
> > -		try_to_fix_pino(inode);
> > +		try_to_fix_pino(file_dentry(file));
> >  		clear_inode_flag(inode, FI_APPEND_WRITE);
> >  		clear_inode_flag(inode, FI_UPDATE_WRITE);
> >  		goto out;
>
> Actually, I think this is wrong because the fsync can be done via a file
> descriptor that was opened to a now-deleted link to the file.

I'm still confused about this...

I don't know what's wrong with this version from my limited knowledge?
 inode itself is locked when fsyncing, so

   if the fsync inode->i_nlink == 1, this inode has only one hard link
   (not deleted yet) and should belong to a single directory; and

   the only one parent directory would not go away (not deleted as well)
   since there are some dirents in it (not empty).

Could kindly explain more so I would learn more about this scenario?
Thanks a lot!

>
> We need to find the dentry whose parent directory is still exists, i.e. the
> parent directory that is counting towards 'inode->i_nlink == 1'.

directory counting towards 'inode->i_nlink == 1', what's happening?

>
> I think d_find_alias() is what we're looking for.

It may be simply dentry->d_parent (stable/positive as you said before, and it's
not empty). why need to d_find_alias()?


And what is the original problem? I could not get some clue from the original
patch description (I only saw some extra igrab/iput because of some unknown
reasons), it there some backtrace related to the problem?

Thanks,
Gao Xiang

>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6ab8f621a3c5..855f27468baa 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -165,13 +165,13 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
>  {
>         struct dentry *dentry;
>
> -       inode = igrab(inode);
> -       dentry = d_find_any_alias(inode);
> -       iput(inode);
> +       dentry = d_find_alias(inode);
>         if (!dentry)
>                 return 0;
>
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
