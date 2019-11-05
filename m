Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA0AEF396
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 03:39:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRok6-00018h-48; Tue, 05 Nov 2019 02:38:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iRok4-00018T-V9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IeloNK7GdkjVhqko4X31kdk2ctProezbgaImEviBcuA=; b=YfrQNX2fxJ841397JH+mgk1d9f
 DFKEr1HQXAMeEbH3ukdhD9k2rTVglWFWLhDxVOvr28KZecfrFN9s62OvcjvPHyAvDlyXrubwOAwIh
 ENjtxPNwv2/E+CcUdvwI7es3YuIc+MVY65Ty7FwROp2RAY3b8guTb6jugj2uM3V7EAZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IeloNK7GdkjVhqko4X31kdk2ctProezbgaImEviBcuA=; b=VuzM1jqkzGTmz39AnLymuHz96W
 +GpceXqc0E1n3R+KMLZI4KMXdtmO0OFJ1p6BwZYX4usQs0RHzhGJ3x143l+qzYb83oo91uuq/pL1j
 Q4fAuDZ7VwQIdcQtfpyMd9KD4wNWOTiy9ejrknqivR28weIUryoNJieWWCA8M0qcJH1o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRojz-000WIc-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:38:48 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3C33214D8;
 Tue,  5 Nov 2019 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572921516;
 bh=AO5GUw4uAQW7SjlfIGhGgEAuiI6q1O8trlvLX3b/MnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DhOIaSgg4PyeAcIv/11SHw83YohNkY+3PEl9C++E070AEg22bhyJOvAFZbG46GpDK
 Uz5ET1GLWnqSqOuiYrmnlCqUp6q+Bw40PITQWHqOjqYNWAMJ9sWU/4r07RWwIv8W0m
 0LIkohafg+2shuXJOSTN+UAjbuzhYtQFj6tBOxg8=
Date: Mon, 4 Nov 2019 18:38:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191105023835.GD692@sol.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191101095324.9902-1-yuchao0@huawei.com>
 <20191101095324.9902-3-yuchao0@huawei.com>
 <20191105000249.GA46956@jaegeuk-macbookpro.roam.corp.google.com>
 <40d0df3f-cc55-d31a-474b-76f57d96bd89@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40d0df3f-cc55-d31a-474b-76f57d96bd89@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRojz-000WIc-1Y
Subject: Re: [f2fs-dev] [PATCH 3/3] Revert "f2fs: use kvmalloc,
 if kmalloc is failed"
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

On Tue, Nov 05, 2019 at 10:17:41AM +0800, Chao Yu wrote:
> On 2019/11/5 8:02, Jaegeuk Kim wrote:
> > On 11/01, Chao Yu wrote:
> >> This reverts commit 5222595d093ebe80329d38d255d14316257afb3e.
> >>
> >> As discussed with Eric, as kvmalloc() will try kmalloc() first, so
> >> when we need allocate large size memory, it'd better to use
> >> f2fs_kvmalloc() directly rather than adding additional fallback
> >> logic to call kvmalloc() after we failed in f2fs_kmalloc().
> >>
> >> In order to avoid allocation failure described in original commit,
> >> I change to use f2fs_kvmalloc() for .free_nid_bitmap bitmap memory.
> > 
> > Is there any problem in the previous flow?
> 
> No existing problem, however, it's redundant to introduce fallback flow in
> f2fs_kmalloc() like vmalloc() did, since we can call f2fs_vmalloc() directly in
> places where we need large memory.
> 
> Thanks,
> 

f2fs_kmalloc() also violated the naming convention used everywhere else in the
kernel since it could return both kmalloc and vmalloc memory, not just kmalloc
memory.  That's really error-prone since people would naturally assume it's safe
to free the *_kmalloc()-ed memory with kfree().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
