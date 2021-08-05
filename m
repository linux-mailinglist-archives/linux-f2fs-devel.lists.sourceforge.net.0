Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A783E0C88
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 04:54:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBTW6-0006cq-3h; Thu, 05 Aug 2021 02:53:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mBTW5-0006ch-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 02:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TNGvX8wQ8xlvkBYB7jF+/sPXDu3sV8Nt/1hONLud/XI=; b=NXsVZofTUWI2CzC3wS8fdm0w8x
 fSwlsV9QG9o6P6X8AiqHzA3YOehh9c/tJ3G+EpqBjKC5FU3jFKK7ICAVpndhgOEPBKsh8pPoZb0rN
 D2cxTKQke3K+9w5yYTPdeJxoQKeN4ok7dJyWFbv4HUBmKuNVoob1BU03Xw2i4WQK0kmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TNGvX8wQ8xlvkBYB7jF+/sPXDu3sV8Nt/1hONLud/XI=; b=AFJiezA0aCB1l+MBTUV32kkKUJ
 VHq34YK8ADvQ5CFXmez8NI9GG4zaaNrAFdI0lFYhzloEi/09OKo3bZFWaI/xRLIYG2YXPGM9HmBOh
 NlRrXQat9eVqzbUf9+Lw4WLVMxH+/+JwkzF9U4ZUrSpbtIvhNfzSgxCDL8xIghefGRhI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBTVw-0007s0-RP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 02:53:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B13C61037;
 Thu,  5 Aug 2021 02:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628132014;
 bh=572pJp3ee6li9WZRwxOQIDTFDcCjD3QXQ/WZjb6zgeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DmTDblh1tN1+QpEn+UvacJuYWlWX2dRSB1HpSLCWKRADbTV2s8nU+MlZKus2a9l4O
 MZMTI2ZpJYFLionCOsOPEtRzI0zg5VXm5HhD1gtUuIpoLOn+8qyQNQftQNSHB5drpf
 gKX+0LkMljb+neOdNispQ6zOL2XfMHnDk94R/+83Zr1s+hWJ9ilNApaeNNuOx6iYqY
 aiTBgnr9dQ4PJWn6KFf67gNMcQErsXI+2+5mwtfcgYrBnTH13GZXGctPhmHABxSZEp
 iMabJW1UZyRE2wVX64u+eqynXW/WuchP4U0CnMXVMMHe4a5o7M11C68z5gScVyMDrJ
 Zz9qqHylVsgJw==
Date: Wed, 4 Aug 2021 19:53:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQtSrIx0/sAipDs4@google.com>
References: <20210804022348.1414543-1-chao@kernel.org>
 <YQsIj0wKk6YbN/FJ@google.com> <YQsmfm3ibU6bhvZr@google.com>
 <0dad9863-4aa2-3ea3-fd97-457aa635ed66@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dad9863-4aa2-3ea3-fd97-457aa635ed66@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBTVw-0007s0-RP
Subject: Re: [f2fs-dev] [RFC v3] f2fs: extent cache: support unaligned extent
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/05, Chao Yu wrote:
> Jaegeuk,
> 
> On 2021/8/5 7:45, Jaegeuk Kim wrote:
> > Chao,
> > 
> > How about this?
> > https://github.com/jaegeuk/f2fs/commit/d6bbe121bc24dfabfedc07ba7cb6e921fb70ece0
> 
> Looks more clean, thanks,
> 
> > 
> > I'm digging one bug in __insert_extent_tree w/ the patch tho.
> 
> Shouldn't we initialize @ei in f2fs_update_extent_tree_range(), otherwise,
> __try_merge_extent_node(&ei) -> __is_extent_mergeable() will do the check
> w/ uninitialized c_len of @ei.

Fixed some bugs, but still getting another data corruption.

https://github.com/jaegeuk/f2fs/commit/c5d97919c55b467392407b60c1a7b1e3e81721ff

> 
> > > On 08/04, Chao Yu wrote:
> > > > +	if (from_dnode)
> > > > +		goto skip_reading_dnode;
> 
> Wrong condition here, thanks for fixing.
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
