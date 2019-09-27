Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 030CFBFC6F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 02:32:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDeBN-0006mm-2s; Fri, 27 Sep 2019 00:32:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iDeBL-0006mb-T0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 00:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lOsH85W2hmRE+1YJgDUY6cZTV37cuIkgOdU4RyKSnrY=; b=K5pXGQcMAUg0Hx6g/OX2BfFOkU
 qQiojWRvdxjLWN0/4kmRn5vIJQAY/glUlw7lma0XnY3U7EaRgWT6NNP0H105M+LW3zRJKmP0ZiZxi
 4Ub4kE4XaZLNy2x/45NppWepmlDNyOMBSWC5XBqbcxiJuVEf/ifgWUnEMW9QoWruf3yE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lOsH85W2hmRE+1YJgDUY6cZTV37cuIkgOdU4RyKSnrY=; b=iTHQyUc55lI40FnUiHTxxegvBY
 15OaQyzIlmCnv6Zy9dUPR5IHR2ltdhVgj9gWEzE7lqEF6KQ166zwuJZkIiDEMc5c5Ow1zfUXe76le
 iP9laFx6ylFnNaPgYVOP5tVREAes/P4gOVnmGfGN/3DGPDpKXQoaH5CVzO8mT+AYYUt4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDeBF-00AXRs-Si
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 00:32:23 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38C2D2086A;
 Fri, 27 Sep 2019 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569544332;
 bh=QsUnjBuZAwrux95SfvML5iv3eEepq0UgtdPVb2bTlH0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=GQyhnFVk6d9XHgaR0X3hVLxVGCnaC3zpdwphghs/tN4/9/SwERAX3RPMRIu5vBsJD
 2/lbU5vI22OUqrCZNdAOJYpXGnmtCfcUxmwmQkxW1A6d/NNIdgT4WHLMofWIYhXKjR
 7yGQp3eOHriItW/HzdMRbdCb1SjfWbKcJIHGQcQ4=
Date: Thu, 26 Sep 2019 17:32:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190927003211.GA36793@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190816030334.81035-1-yuchao0@huawei.com>
 <20190926203755.GA142676@gmail.com>
 <20190926214653.GA29685@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926214653.GA29685@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDeBF-00AXRs-Si
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/26, Jaegeuk Kim wrote:
> On 09/26, Eric Biggers wrote:
> > On Fri, Aug 16, 2019 at 11:03:34AM +0800, Chao Yu wrote:
> > > There is one case can cause data corruption.
> > > 
> > > - write 4k to fileA
> > > - fsync fileA, 4k data is writebacked to lbaA
> > > - write 4k to fileA
> > > - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
> > > - write 4k to fileB
> > > - kworker flush 4k to lbaA due to SSR
> > > - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
> > > data
> > > 
> > > One solution is tracking all fsynced file's block history, and disallow
> > > SSR overwrite on newly invalidated block on that file.
> > > 
> > > However, during recovery, no matter the dnode is flushed or fsynced, all
> > > previous dnodes until last fsynced one in node chain can be recovered,
> > > that means we need to record all block change in flushed dnode, which
> > > will cause heavy cost, so let's just use simple fix by forbidding SSR
> > > overwrite directly.
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >  fs/f2fs/segment.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index 9d9d9a050d59..69b3b553ee6b 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
> > >  		if (!f2fs_test_and_set_bit(offset, se->discard_map))
> > >  			sbi->discard_blks--;
> > >  
> > > -		/* don't overwrite by SSR to keep node chain */
> > > -		if (IS_NODESEG(se->type) &&
> > > -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> > > +		/*
> > > +		 * SSR should never reuse block which is checkpointed
> > > +		 * or newly invalidated.
> > > +		 */
> > > +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> > >  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> > >  				se->ckpt_valid_blocks++;
> > >  		}
> > > -- 
> > 
> > FYI, this commit caused xfstests generic/064 to start failing:
> 
> Yup, I was looking at this.

It seems fcollapse couldn't allocate blocks sequential when rewriting blocks.

We need to adjust like this:
---
 tests/generic/064 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/generic/064 b/tests/generic/064
index 1ace14b6..058258d5 100755
--- a/tests/generic/064
+++ b/tests/generic/064
@@ -72,7 +72,9 @@ done
 
 extent_after=`_count_extents $dest`
 if [ $extent_before -ne $extent_after ]; then
-	echo "extents mismatched before = $extent_before after = $extent_after"
+	if [ "$FSTYP" != "f2fs" ] || [ $extent_before -ne 1 ] || [ $extent_after -ne 50 ]; then
+		echo "extents mismatched before = $extent_before after = $extent_after"
+	fi
 fi
 
 # compare original file and test file.
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
