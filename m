Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F01C835F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 09:24:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWatR-0006cS-SL; Thu, 07 May 2020 07:24:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@gmx.com>) id 1jWatO-0006by-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 07:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDHJMaoJHu0tife+9Ua4UP7+o6eb6uuudeWVAMMI1T8=; b=mM6DVoz1L8uIILrTyV/j2J8RZB
 TGdXeU92FW6kx9HWxEZzLlq89NZDenJSpeS7UFhXpPQZuH8ip7nATfoV7gLruV+oj3fgsicQ8WEwP
 z/+Hsf/mODZhu4ms7UGT0t/3hfYxJQw2EvH3wzZrhkJu7oFEBUT9qP4uD1y6kAup7iI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yDHJMaoJHu0tife+9Ua4UP7+o6eb6uuudeWVAMMI1T8=; b=Dd3Eqzog0dby04gjwiacz2Cy1Z
 oqKFxjHtLC9YG9QIMa51VF87orVXgFr8juft6QVd6GN6FMKClaO8aNdQn4OYZRH6XOUEuOHr7gq8/
 iyzxWWvAz54EWY+PB/CfCdcp1k7OYl98fTa2SyrfUPBYzeZvw5PWakmi6OEiVDSUiOyw=;
Received: from mout.gmx.net ([212.227.15.18])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWatK-00HO69-2b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 07:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588836246;
 bh=1f7xSnPEdtNZF/l6xObJrCpIG1v1Tm1LqvY2Hch0m2k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=C17ZLiwpRGGOtauHfCiZIUCyzwfCQHfsfzkE0VZ67PksP8dIHROafvnHZvB6xcLD7
 zTvOP4OIXdG80zj0n1qC90S2BsA0bFYpAGdNMISEN6h19ulnOjjGPw9bjoU2JWfm2l
 x1d0UpkSmmm91BlbghMISG9p+vZ3OQ903qO5mrbc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from hsiangkao-HP-ZHAN-66-Pro-G1 ([120.242.76.42]) by mail.gmx.com
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MyKHm-1jDoTp2qCq-00yffE; Thu, 07 May 2020 09:24:06 +0200
Date: Thu, 7 May 2020 15:23:58 +0800
From: Gao Xiang <hsiangkao@gmx.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200507072349.GA5471@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506191613.GB842@sol.localdomain>
 <20200506223623.GA27760@hsiangkao-HP-ZHAN-66-Pro-G1>
 <3a837113-8081-6f01-4d8d-1d4b6600ec8c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a837113-8081-6f01-4d8d-1d4b6600ec8c@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:epqsfvnjrfMegoglZ2H2SlmDtQ2iTA+h+5MT5XYtZ6wVemawXz7
 KjfgSxr+hQ0R5ywX5ysTbjFNYPp/HKEBeb4AL72vBRB27jsQhq+tVJYpEKAN7aBQ631OZ7W
 uuh/Urv9Dqj3BnfreYV9OCswoeNSpxZZQsilL85sOFO5tTSuv1vKagOEeurrh2/u8NyMRFL
 xfDzmyLqZlNg/d4dlslrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2UkBEJpXNRw=:ewsEkrCIWEEMMasLQ0EM/D
 LBIu0mYva+3YLFh1ERNaa1KhTqjIjDO7s+mu+/wDhBvpyPpCuwd98ILhz2Q1BjhzigcSTQCjc
 5Xt8K9Ey6ziiRnefRKnzjFLdrQEx4aFuuFmsqsBQNjRKov6ghckh2p+l29EGz9EfHu33zU4Tt
 gUXGVAWEUv1x7EiFxH01nmusDrTdv0DQAagXqzkOpThUDGA19fc2honhFsGzVrJaF/0AQuFJN
 DG3JWMiW7WFNZU6F4h9jJ9T9AQgQOGWCo+0aBbX5uhgYAbz08ytpaOABqRSyxwaxh96ekhiRe
 1ER4bNwLk/1qrH6S3QCKz6QECXpQMkekCeBhiymR6uVr2dQ593HVlwo+1+ZZ6GAUbLE8B65CB
 aYPwjDrNZFLpKTz3+wnQNrdW09LMUnzDK1V+w8z5f29U4x3uejyMsdzcUDyP2jotRFrVc8VDB
 oFgV6MMQzbg3KBeGSzZCytONxgZCSTrGd8TzCF4/If6MGq4osy3Pnu2KX1j0Gpt6PfnbtwXTR
 eIXw0D82kWoDqfAuIyK8Ulutis6XpuFWJOaicB4/35F9D9d1E+Pe6Q1SHWw5D5wVb9zaBvWmG
 nU9eLIOegucwRua4m1ABSYkdb0FyNfrK/pbq3PC3utm/GsHgPGJGhC5zOs4OSe1RiAaKyFlao
 R0GgJx7BJgYrT0bYfjbwUF7Yiw2sJ+EDEpyUsRbgpI5n7UFxNpa0zc8kl/JtFr8EXfE8jDKf2
 AXqhTopesJhV6UGxIFrN5++VZCzl6XPPfp6wWjkmNOidcIrSfZoz3u2HDKm8YlPJKCi758R3g
 dpFY5plPewZQiDu9mxyIyLHBPpoKBDH9xLdNAZHvNuVymN1zIuEM1J+oPkYiZrrEA8tzchyFe
 XpzVcdnnwibuxs6DVb+5DJJeZjJsXfaS+6va52AQz6p7jHc1BHPlk7KyJwXtDFlnwknkDOL5v
 kCqkLQbFkc3QdA1d064Z7LklalNg+VHKaS+KvYknAudlBZ0fypPQnXZHuWGjAJ6sGa73kwu0k
 TnpKgoLvhMhCsqopM74RhEDCrTlcmCjpsvTuc4ByUDKTLZg4MjdJRarWiTX1J+f4sLipEqLF4
 iw+LUtfsKoqvoYHZOSgxoB7U4hC0iG/yXwAg1vZ0+VTmNDFUO+j38gU0qrkZnf7TjZywBqFW1
 vHHBCe5Pt12BO25DN836ohCvlPAfDsj/yn7KYQXidBQuhmCVf9xm9OzYxoq21DmZ5sIij6aXX
 fzR9bn9GD0EH/3xhj
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]gmx.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.18 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWatK-00HO69-2b
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
Cc: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Thu, May 07, 2020 at 02:38:39PM +0800, Chao Yu wrote:
> On 2020/5/7 6:36, Gao Xiang wrote:
> > On Wed, May 06, 2020 at 12:16:13PM -0700, Eric Biggers wrote:
> >> On Wed, May 06, 2020 at 02:47:19PM +0800, Gao Xiang wrote:
> >>> On Wed, May 06, 2020 at 09:58:22AM +0800, Gao Xiang wrote:
> >>>> On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
> >>>>> On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> >>>>>>>
> >>>>>>> Actually, I think this is wrong because the fsync can be done via a file
> >>>>>>> descriptor that was opened to a now-deleted link to the file.
> >>>>>>
> >>>>>> I'm still confused about this...
> >>>>>>
> >>>>>> I don't know what's wrong with this version from my limited knowledge?
> >>>>>>  inode itself is locked when fsyncing, so
> >>>>>>
> >>>>>>    if the fsync inode->i_nlink == 1, this inode has only one hard link
> >>>>>>    (not deleted yet) and should belong to a single directory; and
> >>>>>>
> >>>>>>    the only one parent directory would not go away (not deleted as well)
> >>>>>>    since there are some dirents in it (not empty).
> >>>>>>
> >>>>>> Could kindly explain more so I would learn more about this scenario?
> >>>>>> Thanks a lot!
> >>>>>
> >>>>> i_nlink == 1 just means that there is one non-deleted link.  There can be links
> >>>>> that have since been deleted, and file descriptors can still be open to them.
> >>>>
> >>>> Thanks for your inspiration. You are right, thanks.
> >>>>
> >>>> Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
> >>>> take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.
> >>>>
> >>>> And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
> >>>> no race by using d_find_alias here. Thanks again.
> >>>>
> >>>
> >>> (think more little bit just now...)
> >>>
> >>>  Thread 1:                                           Thread 2 (fsync):
> >>>   vfs_unlink                                          try_to_fix_pino
> >>>     f2fs_unlink
> >>>        f2fs_delete_entry
> >>>          f2fs_drop_nlink  (i_sem, inode->i_nlink = 1)
> >>>
> >>>   (...   but this dentry still hashed)                  i_sem, check inode->i_nlink = 1
> >>>                                                         i_sem d_find_alias
> >>>
> >>>   d_delete
> >>>
> >>> I'm not sure if fsync could still use some wrong alias by chance..
> >>> completely untested, maybe just noise...
>
> Another race condition could be:
>
> Thread 1 (fsync)		Thread 2 (rename)
> - f2fs_sync_fs
> - try_to_fix_pino
> 				- f2fs_rename
> 				 - down_write
> 				 - file_lost_pino
> 				 - up_write
>  - down_write
>  - file_got_pino
>  - up_write

Yes, IMHO, I think it could be not proper to
take dir lock in fsync path anyway...

I would suggest as before (if it needs to be fixed).
And it seems no significant performance difference.

Thanks,
Gao Xiang

>
> Thanks,
>
> >>>
> >>
> >> Right, good observation.  My patch makes it better, but it's still broken.
> >>
> >> I don't know how to fix it.  If we see i_nlink == 1 and multiple hashed
> >> dentries, there doesn't appear to be a way to distingush which one corresponds
> >> to the remaining link on-disk (if any; it may not even be in the dcache), and
> >> which correspond to links that vfs_unlink() has deleted from disk but hasn't yet
> >> done d_delete() on.
> >>
> >> One idea would be choose one, then take inode_lock_shared(dir) and do
> >> __f2fs_find_entry() to check if the dentry is really still on-disk.  That's
> >> heavyweight and error-prone though, and the locking could cause problems.
> >>
> >> I'm wondering though, does f2fs really need try_to_fix_pino() at all, and did it
> >> ever really work?  It never actually updates the f2fs_inode::i_name to match the
> >> new directory.  So independently of this bug with deleted links, I don't see how
> >> it can possibly work as intended.
> >
> > Part of my humble opinion would be "update pino in rename/unlink/link... such ops
> > instead of in fsync" (maybe it makes better sense of locking)... But actually I'm
> > not a f2fs folk now, just curious about what the original patch resolved with
> > these new extra igrab/iput (as I said before, I could not find some clue previously).
> >
> > Thanks,
> > Gao Xiang
> >
> >>
> >> - Eric
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
