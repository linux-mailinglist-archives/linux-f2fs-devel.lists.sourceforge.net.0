Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1191C6951
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 08:47:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWDqH-000666-KL; Wed, 06 May 2020 06:47:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@gmx.com>) id 1jWDqF-00065w-L6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ke6pWVf22SH/deVrdPBqBuWv0AfvnheuF0POp7g6hiQ=; b=huW8H8qEHdBGdURBZg+rxw+Pbo
 hyPbwPUTbA4KHomb0bWoiwgtQc4yY6Y2GZI84smEMjNwgUUex6dn1EOUBRTB87Cs17fIVdGFPPi8r
 clCWkWoM+cmwYRzmnhAW5ytN0NiRvIbV3OLRjf6+2rwNVSXn5eGlDffJhVLaH5Zq1uRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ke6pWVf22SH/deVrdPBqBuWv0AfvnheuF0POp7g6hiQ=; b=gkXCpycQZbOU1B3yK23IuclH/J
 VB2Cr2X9lwy/D3f6hsX24DrayTfM0qYzXUAIP5ZRoYAgW4Vih48LX8n3C1VuqVtbx0tCwmXicdRmP
 mZ1XDjE+19U/0UYgJr2Ms9+3AOXKximD3ZFZhtRJY9TrVfa1h4xPX5cRxr9twigdYQT8=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWDqD-00CP1I-Av
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588747647;
 bh=hO88QHkEwrRqwifsGMJLO23pyLom4frjxgEUyj9P83s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=NQWyk4a22wEfqor3GHw6TNgP35oPNmP+FviFHd39bWVDRjgmrTQW4psPkVfgyHL76
 kOztWkDVJFm5Y++L31zuV7RQ+CjNzIqbxgALvOw1vGLfE3FQgBzN0hd5w6RDofrhne
 fN6c6II4XEmkIv2M6mmfYxKYKbY2JaKsGSxsw3rU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from hsiangkao-HP-ZHAN-66-Pro-G1 ([120.242.76.42]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MZCfJ-1jaqNT0Nnt-00V5nD; Wed, 06 May 2020 08:47:27 +0200
Date: Wed, 6 May 2020 14:47:19 +0800
From: Gao Xiang <hsiangkao@gmx.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:z6dtdIcZRcSYYph0RGMRdGYvIpDIYF8mz+BYGilcVnLYpEXyg/g
 mFR8hgBLc0U/As4vQQXjMXzV40093msxEuzJUUh8FIhgivuJI9T50alip1rHMHI6VGfOi0w
 5auoIOjOQZbm123Z5TvIA+Lk63KkQ3ai6p+cyDk0MQwedoKnjMp5OTzdMOzO+k9d+YB2Ko0
 uU0i4dijVkg60MGHVFpoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:spzX94Rvc9Y=:Wwm8mk3c5+AdN+K91dNCm9
 /dp58Sb+t6/IYOi1wtRT9WN/nKeLuzqqboXLS/vv6yk90m0vaESkL0mweBW4JyzO7G7RA77tG
 X3Vn4kZ0AOfvheD/63jfo6RzGHHdw6BqYYbUCgcauVVmDckhx2+LeRCO6r2ozabkBpHay7XJp
 BKkrqEFrdXe+hMGBMmgtUZwXgolyrS53FdoLcebX18G//mG2tklxmIz+slXZoR5EJMUkQz3Wh
 d6OYawIFALwHx9omWBJwB/hogCcezV7CIqWLBamcxjHg1ap8bHpjgyrIkG8MkECMImmf76YmY
 S3mY2EwkFGCBaqRf5wEbt8M/06cYZHJRzDwoqpSOF0iJ1WiSwoxOGl85HcJIfe9m+uYxaTOUf
 5T7ps0It5C+fTS7xtqKSwtnagOnPgCfgP4zXLqyYaf8SoU2Dxx8M6Ck32cj/Bsu9mVfYsBLBa
 n/hTY3TLlBW810WpguEYXCmDfikbx7QEDaFaFKPNR1XXAuLV0ncoNDJJPc8zieleT1uEF+SA9
 WlIkeRfqX+2Ll9urFmSAibDl6z4tRhg+2PiHkJ7vtVczxfDpQGCSHyToMqN/7DuGEQZf/iThN
 odgg2Vf6kNxKaXUl2KBZbWullaQ6kEgjGoJlzB2ZIaon4JlcnXKNMUoPn7YYE5rY29baJSNY9
 4iZDI6vTbUDRcecpxrWJxFYB6rCUPGRDGHkHezsxfrIeLH4ep5uv6wdXbUmPWMtS4kaKaWpBq
 TdlbpEOlz7lTEQsuRijSAqrRbs4BuaACbmfp4Jr4nbMCsC3OS8tkBrgWC30J1AaZoMnL+8V3B
 Y2Ygy5w0DzKafUdXr2Xyq4FUpWk72s8hgMfND6QFPDRw20XBMafYCodZdAWXlsc417Fr7roc+
 G5KnwQh+tvP5G/hYYsNozpDqfqb0nUnMr/Q6f5kFfzmKYEvElBhkDpUTu5Rkc4WBTDgqUwym9
 8lOdShEfZGEZ3PDuCRfUk+Yqh2rSICFZ1IPVHM1aHqsikGhVcUoKoyOdhtaZ0HREF/FW2MMSt
 cERaqxV8uSRCTQw/sxkMwuePsA8faxZZK4GXIRwvfxn3APnqRMHAFxJqMvDKZHOmhhHSSLYko
 VTifxOe8wazQWUzkWuQw+1pKojOphgbCITYATckXAWTSgR9HvehSaj+wMeaRoviWLR3P8ue5t
 Yo+IXIZMHsp6QUWZHRg1b6NN3GKv2lfckqFEumXl7DRUnfDRDPXKXqHXdrqLSMj14+4kdo/aw
 nNKZNeOJeTpvtsayc
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]gmx.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.20 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWDqD-00CP1I-Av
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

On Wed, May 06, 2020 at 09:58:22AM +0800, Gao Xiang wrote:
> On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
> > On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> > > >
> > > > Actually, I think this is wrong because the fsync can be done via a file
> > > > descriptor that was opened to a now-deleted link to the file.
> > >
> > > I'm still confused about this...
> > >
> > > I don't know what's wrong with this version from my limited knowledge?
> > >  inode itself is locked when fsyncing, so
> > >
> > >    if the fsync inode->i_nlink == 1, this inode has only one hard link
> > >    (not deleted yet) and should belong to a single directory; and
> > >
> > >    the only one parent directory would not go away (not deleted as well)
> > >    since there are some dirents in it (not empty).
> > >
> > > Could kindly explain more so I would learn more about this scenario?
> > > Thanks a lot!
> >
> > i_nlink == 1 just means that there is one non-deleted link.  There can be links
> > that have since been deleted, and file descriptors can still be open to them.
>
> Thanks for your inspiration. You are right, thanks.
>
> Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
> take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.
>
> And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
> no race by using d_find_alias here. Thanks again.
>

(think more little bit just now...)

 Thread 1:                                           Thread 2 (fsync):
  vfs_unlink                                          try_to_fix_pino
    f2fs_unlink
       f2fs_delete_entry
         f2fs_drop_nlink  (i_sem, inode->i_nlink = 1)

  (...   but this dentry still hashed)                  i_sem, check inode->i_nlink = 1
                                                        i_sem d_find_alias

  d_delete

I'm not sure if fsync could still use some wrong alias by chance..
completely untested, maybe just noise...

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
