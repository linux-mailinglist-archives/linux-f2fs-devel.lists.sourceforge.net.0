Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF0302A80
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Jan 2021 19:42:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l46oO-0001ug-Qk; Mon, 25 Jan 2021 18:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l46oN-0001uO-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jan 2021 18:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxW2bjulDhAwND7ITEE1etTsRwNTBy1NzZEUhQVKhbo=; b=awW+HPhJc7N+SdZDdHHPKjWLyU
 5+YV+APOeJoU4c6DFyQeSkNXVrapKBAVggJWiDg50KxDegUR1MMH4gorooMyoVLTQdwT+t8JussS2
 /WoFh69W6y8ir5rnVPedio+UJTQ7l5ooQty2IR1Y7WKZ2Z3Jr9QvAwQnjK0CuyX1xdiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YxW2bjulDhAwND7ITEE1etTsRwNTBy1NzZEUhQVKhbo=; b=WAN/kXs9LcqPN68T0Valtt8yRr
 DpqWYPskHNe7mpr9TGpMg8tPN26nrJmNnfr13BkfIxyAmxYSlMHPItiFDhu5N8y9OZ7kPf5xuUEYj
 qZ/OSdFrwu2m1/7xb5Hr1JWDMUiIXZeD23RS+0IHVg+UqU9VTuukmGrOhYAQ+Eza5N0g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l46oI-007EGX-NQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jan 2021 18:42:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07A5A230FF;
 Mon, 25 Jan 2021 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611600113;
 bh=BcQjpfINfveQmERew10h4a0n6dN8EsCa5I5lsAkb6Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qisl3plDrCd6OrPM4RX01TZ3EzRVZhIIPqBvHsMU53MkaYfxvUrLMMHNJjTnFHqBT
 tjxUPpYruIOFMXnbKbEymBeQIUOepUclZLvugJfkFZvVa/A3ngMw7W5V4eBOAF/RDV
 siJKR4b4zuOFcB+BSX7G4VbVlna5M+qfEwOoSkYEb3V7I7AjHuVC8Yz5iVshQ6H850
 XQXewvlYPcHUIYFplER/X1iD3GkzAK89IibAPUjuUDLP4H9IbLKlbA13f/OGkTJNkq
 qBqFGHMZozKrQY/hicThNo7ZOqu7H651159DR5T626+ks2I4/+SyZFE8CXknWOHxGo
 S0AP3otBlibjw==
Date: Mon, 25 Jan 2021 10:41:45 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Victor Hsieh <victorhsieh@google.com>
Message-ID: <YA8Q6XLrLaaeMQeJ@sol.localdomain>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <CAFCauYN12bWRn2N+uP455KuRmz7CQkCBXnz0B2sr5kCQtpJo4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCauYN12bWRn2N+uP455KuRmz7CQkCBXnz0B2sr5kCQtpJo4A@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l46oI-007EGX-NQ
Subject: Re: [f2fs-dev] [PATCH 0/6] fs-verity: add an ioctl to read verity
 metadata
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 22, 2021 at 03:26:48PM -0800, Victor Hsieh wrote:
> LGTM. Thanks!
> 
> Reviewed-by: Victor Hsieh <victorhsieh@google.com>
> 
> On Fri, Jan 15, 2021 at 10:19 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > [This patchset applies to v5.11-rc3]
> >
> > Add an ioctl FS_IOC_READ_VERITY_METADATA which allows reading verity
> > metadata from a file that has fs-verity enabled, including:

Thanks Victor.  Does anyone else have comments on this patchset?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
