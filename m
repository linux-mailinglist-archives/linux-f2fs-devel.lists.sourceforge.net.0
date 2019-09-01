Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A50A481C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Sep 2019 09:27:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4KGg-0002K5-Nw; Sun, 01 Sep 2019 07:27:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4KGf-0002Jx-9h
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 07:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVfxokHjkYNs9pcYwdIfNWtRfn1ySsBgBqANHNbed6E=; b=gv0fn4UjdDdC3LnM1qdo6d/H+m
 Ys+Q5Oi6jA0JM8gBYCX0tz3iWCdh4Augd+NujiMLTrsyarVzjzAhGgcoApOSYd7WgIge+VtgBNe+7
 UeJy4MAqL31rw7D6mIwDy4qIYP2a8kMJQvak7O8CMZ/Zxva0li4EAA8eBX/1hdbAWEZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVfxokHjkYNs9pcYwdIfNWtRfn1ySsBgBqANHNbed6E=; b=YGADJhhQe7tabntbi26/eLSgjv
 C7aAJGyQkdMmlZAaKjTJ67+wi30BCtUYqRoh8UocH5qWugFsSL6jBTmQ90V+NLDw44FzB2+8FLVwI
 0z7iAndX4segQ7mTu0m3dpd7SOm61sQwDA6oEXuy2evsDVu1jbsUkWjgteHVDJbb6I2A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4KGd-00BLvi-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 07:27:21 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 498D921744;
 Sun,  1 Sep 2019 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567322834;
 bh=jkpWuxn6vqatfiC6nHN+f/JRi1CBN4aWAiyulIYck2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHEb0BJN3zGZrgJrDSvplCgMq1SnWz/9g2g1N/MmWfkCkWxFQbS74uTM/HABXdfmT
 P0elPoAsopdpUniEYk7dWCChGmN00Fj2IfMVqjl2F+tCkzrfJVO5vV5C9CCDWbk2cW
 /xQ6FrTYhLYku75eCRbW/S9xye/TyyKB2R6iveN0=
Date: Sun, 1 Sep 2019 00:27:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <20190901072713.GC49907@jaegeuk-macbookpro.roam.corp.google.com>
References: <1567216011-43066-1-git-send-email-zhengbin13@huawei.com>
 <01183b8e-3cbd-d7a9-38b8-320fca43f583@huawei.com>
 <bf99e560-ec3d-2360-3286-661172ee2eff@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf99e560-ec3d-2360-3286-661172ee2eff@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i4KGd-00BLvi-Ue
Subject: Re: [f2fs-dev] [PATCH] f2fs: Make f2fs_fname_setup_ci_filename
 static
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/31, zhengbin (A) wrote:
> On 2019/8/31 10:30, Chao Yu wrote:
> 
> > Hi Zheng,
> >
> > Thanks for the patch, the original patch is still in dev branch, I suggest we
> > can merge it into original patch, do you mind that?
> Agree with it

Thanks, I've applied.

> >
> > Thanks,
> >
> > On 2019/8/31 9:46, zhengbin wrote:
> >> Fix sparse warning:
> >>
> >> fs/f2fs/dir.c:142:6: warning: symbol 'f2fs_fname_setup_ci_filename' was not declared. Should it be static?
> >>
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> >> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> >> ---
> >>  fs/f2fs/dir.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> >> index 9de688a..147fa5a 100644
> >> --- a/fs/f2fs/dir.c
> >> +++ b/fs/f2fs/dir.c
> >> @@ -139,9 +139,9 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
> >>  	return ret;
> >>  }
> >>
> >> -void f2fs_fname_setup_ci_filename(struct inode *dir,
> >> -					const struct qstr *iname,
> >> -					struct fscrypt_str *cf_name)
> >> +static void f2fs_fname_setup_ci_filename(struct inode *dir,
> >> +					       const struct qstr *iname,
> >> +					       struct fscrypt_str *cf_name)
> >>  {
> >>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> >>
> >> --
> >> 2.7.4
> >>
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >> .
> >>
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
