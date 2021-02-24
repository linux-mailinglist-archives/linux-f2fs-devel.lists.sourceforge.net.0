Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32932324761
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Feb 2021 00:11:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lF3Jb-0004mj-2W; Wed, 24 Feb 2021 23:11:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lF3JZ-0004ma-Ca
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 23:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SnKnsX+laOfKrHJv90fbvEcyDTKOIwPSKXcu9CwqCZE=; b=a2ONqFXUJNvz3MqocQKCREHYat
 O4rf0HKGKuukIhiMsKWLHyS2cd1yvqNuioY8ObktV8ZDNC8r7EAvoSeUPxW1XDIzcfLN45wQlHKjj
 NNhRuUk12LSbRerYiQoNy3yZ+tiSsvyuzd45L18NZ1Viq63YcZV4M1PJOadsZXiXbt1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SnKnsX+laOfKrHJv90fbvEcyDTKOIwPSKXcu9CwqCZE=; b=X8I26OSeYtIJZJQx1x+cAFIFYT
 mlz3if4r8LyLUfK5hFi31ozhtle5ajxug/LFnJ2FDYq3cQ/XLiEU1L64Zfll/zZYEXYCwXjeF5cGK
 C78kw/J23gnTIiQ83l78++4OTYMdGkLyhwMDfVWkqfcKOB9E9ieM+e+n9/3hoEJOdTlI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lF3JV-00015m-4n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 23:11:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCAE664F03;
 Wed, 24 Feb 2021 23:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614208274;
 bh=rZVUqkTMZlcMmWm+aXRNCV+Y6RkVX+1tzIDNnF3d2Cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=spTz5pST1kAP6ui7FZglg52WzjJqcI7HzVSjQApb/cbQ8DVWAsfy+6iVP8kCul1Qi
 1TY4P89LM2TEBNbYh0DDqS/JzZE8/r8+JG0+sdX6m5/Ab8vHgyVnwRbJJqlXgLYktz
 5vqRci3RHL3PUTCLe1GaZxOHXKia1qsdlfEfqJVNzkmBZjsz80HlPMtnEiXYI04hEw
 7tlwVU/6erD+W7G8zW8ZQfLuHf3gFrX4xc+M4rm9EePbo2BILB5G2yn8xT+aTfn9XU
 3U6i1fc79etfk6yIQt12VAA3LE4OYUj1X50L0tAq/gAR4snalhMpF2B3wd1XMUIBpu
 PVEA5Sqlxryxg==
Date: Wed, 24 Feb 2021 15:11:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: heyunlei <heyunlei@hihonor.com>
Message-ID: <YDbdEEcEV5bzgtL6@sol.localdomain>
References: <20210223112425.19180-1-heyunlei@hihonor.com>
 <c1ce1421-2576-5b48-322c-fa682c7510d7@kernel.org>
 <YDbbGSsd6ibKOpzT@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDbbGSsd6ibKOpzT@sol.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lF3JV-00015m-4n
Subject: Re: [f2fs-dev] [PATCH] f2fs: fsverity: Truncate cache pages if set
 verity failed
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
Cc: jaegeuk@kernel.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 24, 2021 at 03:02:52PM -0800, Eric Biggers wrote:
> Hi Yunlei,
> 
> On Wed, Feb 24, 2021 at 09:16:24PM +0800, Chao Yu wrote:
> > Hi Yunlei,
> > 
> > On 2021/2/23 19:24, heyunlei wrote:
> > > If file enable verity failed, should truncate anything wrote
> > > past i_size, including cache pages.
> > 
> > +Cc Eric,
> > 
> > After failure of enabling verity, we will see verity metadata if we truncate
> > file to larger size later?
> > 
> > Thanks,
> > 
> > > 
> > > Signed-off-by: heyunlei <heyunlei@hihonor.com>
> > > ---
> > >   fs/f2fs/verity.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> > > index 054ec852b5ea..f1f9b9361a71 100644
> > > --- a/fs/f2fs/verity.c
> > > +++ b/fs/f2fs/verity.c
> > > @@ -170,8 +170,10 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
> > >   	}
> > >   	/* If we failed, truncate anything we wrote past i_size. */
> > > -	if (desc == NULL || err)
> > > +	if (desc == NULL || err) {
> > > +		truncate_inode_pages(inode->i_mapping, inode->i_size);
> > >   		f2fs_truncate(inode);
> > > +	}
> > >   	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
> > > 
> 
> This looks good; thanks for finding this.  You can add:
> 
> 	Reviewed-by: Eric Biggers <ebiggers@google.com>
> 
> I thought that f2fs_truncate() would truncate pagecache pages too, but in fact
> that's not the case.
> 
> ext4_end_enable_verity() has the same bug too.  Can you please send a patch for
> that too (to linux-ext4)?
> 

Also please include the following tags in the f2fs patch:

	Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
	Cc: <stable@vger.kernel.org> # v5.4+

and in the ext4 patch:

	Fixes: c93d8f885809 ("ext4: add basic fs-verity support")
	Cc: <stable@vger.kernel.org> # v5.4+

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
