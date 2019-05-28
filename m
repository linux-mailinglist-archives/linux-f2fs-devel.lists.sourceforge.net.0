Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B32BD7A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2019 05:05:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVSQY-0001n1-I1; Tue, 28 May 2019 03:05:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hVSQX-0001mq-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 03:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E365BipWmeKoMyKVoJdLBj9FXQQwzbIvazvba/6HTzw=; b=TOMakZAnP1K/4TLxfT+GPv7f08
 +NlCPct3HIO+K5lqsJDAId9lzNNHLVMpwhk7a7BXJuU4Er77HIXgfJx/jxB/dJHVxMYkC1HVI51uo
 xRh3MNu3LrvUYIEvyBOzDLU3HY2WYHE29LGiluInCPI9y+T/HhE1TqjTg7miSVNL7quo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E365BipWmeKoMyKVoJdLBj9FXQQwzbIvazvba/6HTzw=; b=A+RDD+Cn3F6MhKKPOner5/hDj3
 z8wMYlmBhFVIIO+5o/CrD2M0vNr0mEcTlRaJf2ibJtOs31Q6eurh88EN7+NCjulX57aTO5VwOc6Lt
 cJVKzs0Y+evx0Ow0fXEQqltqr108G/Irar4niWaxSdMPBEvW9pgdrtGvXbFz0RGGib+8=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVSQW-00HPAs-2d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 03:05:25 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3AAAE609F3; Tue, 28 May 2019 03:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559012715;
 bh=pCWoAy0zRZdueQVmj/01RMPmGNpZBLScCaYw6mirwDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M4H52I7zD5ZWUcrkJtfNTu0lN1O+3b5vuUmMbWxq6MLspjbI0RG+1I+PTaBucYBGp
 fz5jzzP78+2xFfjEKoyIbm3Tsr9xyBrwCasISrGesaPwZRbo5A2TrcWqAqX/A4JnzG
 R0KeeCsx0nJ6X9nnFAOQCGzvHO1hR0mZmATOrhR4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 078F660303;
 Tue, 28 May 2019 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559012714;
 bh=pCWoAy0zRZdueQVmj/01RMPmGNpZBLScCaYw6mirwDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OwgSTmba7aMPQ3+ETwAqSFHkhClCKaV0TeVd5Vpw3y3rYkgAIccDDC3MdjUqdtkTN
 0IaLuyCEC6xZ8EzT9OTtf5rgkGj3/O/u/rKK6muMpjgcmDjyf5CtnLuLjAG/6MMoc+
 uOcqYwg/RvSzWL5wyS2NdimHSJeHAn3I0bm+yvKQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 078F660303
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Tue, 28 May 2019 08:35:09 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190528030509.GE10043@codeaurora.org>
References: <1558962655-25994-1-git-send-email-stummala@codeaurora.org>
 <94025a6d-f485-3811-5521-ed5c9b4d1d77@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94025a6d-f485-3811-5521-ed5c9b4d1d77@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hVSQW-00HPAs-2d
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: ratelimit recovery messages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Tue, May 28, 2019 at 09:23:15AM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019/5/27 21:10, Sahitya Tummala wrote:
> > Ratelimit the recovery logs, which are expected in case
> > of sudden power down and which could result into too
> > many prints.
> 
> FYI
> 
> https://lore.kernel.org/patchwork/patch/973837/
> 
> IMO, we need those logs to provide evidence during trouble-shooting of file data
> corruption or file missing problem...
> 
In one of the logs, I have noticed there were ~400 recovery prints in the
kernel bootup. I noticed your patch above and with that now we can always get
the error returned by f2fs_recover_fsync_data(), which should be good enough
for knowing the status of recovered files I thought. Do you think we need
individually each file status as well?

Thanks,

> So I suggest we can keep log as it is in recover_dentry/recover_inode, and for
> the log in do_recover_data, we can record recovery info [isize_kept,
> recovered_count, err ...] into struct fsync_inode_entry, and print them in
> batch, how do you think?
> 
> Thanks,
> 
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > v2:
> >  - fix minor formatting and add new line for printk
> > 
> >  fs/f2fs/recovery.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index e04f82b..60d7652 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -188,8 +188,8 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
> >  		name = "<encrypted>";
> >  	else
> >  		name = raw_inode->i_name;
> > -	f2fs_msg(inode->i_sb, KERN_NOTICE,
> > -			"%s: ino = %x, name = %s, dir = %lx, err = %d",
> > +	printk_ratelimited(KERN_NOTICE
> > +			"%s: ino = %x, name = %s, dir = %lx, err = %d\n",
> >  			__func__, ino_of_node(ipage), name,
> >  			IS_ERR(dir) ? 0 : dir->i_ino, err);
> >  	return err;
> > @@ -292,8 +292,8 @@ static int recover_inode(struct inode *inode, struct page *page)
> >  	else
> >  		name = F2FS_INODE(page)->i_name;
> >  
> > -	f2fs_msg(inode->i_sb, KERN_NOTICE,
> > -		"recover_inode: ino = %x, name = %s, inline = %x",
> > +	printk_ratelimited(KERN_NOTICE
> > +			"recover_inode: ino = %x, name = %s, inline = %x\n",
> >  			ino_of_node(page), name, raw->i_inline);
> >  	return 0;
> >  }
> > @@ -642,11 +642,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
> >  err:
> >  	f2fs_put_dnode(&dn);
> >  out:
> > -	f2fs_msg(sbi->sb, KERN_NOTICE,
> > -		"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
> > -		inode->i_ino,
> > -		file_keep_isize(inode) ? "keep" : "recover",
> > -		recovered, err);
> > +	printk_ratelimited(KERN_NOTICE
> > +			"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d\n",
> > +			inode->i_ino,
> > +			file_keep_isize(inode) ? "keep" : "recover",
> > +			recovered, err);
> >  	return err;
> >  }
> >  
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
