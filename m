Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793D1E6A3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 21:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeO3E-0000ng-L9; Thu, 28 May 2020 19:18:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jeO3D-0000nS-0z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 19:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VaQMA3C+QwZyHAXzx44q8a7tWE21yP0rqghvCT7ELL8=; b=V5p4+tZYHUsA09n9XsyLd2uKHO
 PCTcDNBeog08ETTDJ+zFrWWbcJsXXWi7qmTL8GqpBFQJCLPAVVGapZxDoXpoZ4gaTj2fJkc3G2JeK
 uS+JBTHa9VCJ0nixgb4gbdlaDq+VsOUqrwioGMX1Ss8pIy1s/QLJpPFSDjyvJ1agT3gI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VaQMA3C+QwZyHAXzx44q8a7tWE21yP0rqghvCT7ELL8=; b=aGH/gIbTH1s6uT/Hp61crXpxFE
 xt1m5z2PtQBo5Y+dKGfM9uqflD1HnxHDzF8Qf27DJRsaaNM5cX9z0/s1vwzaqBcS7BSIVWZFzkJdD
 8EJj0vys/hHE94Y9FEUUrh6i8E+ON6MQJh7kHHbM6qsTsOZ4ZBeorNmgkoeghth+pT4g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeO3B-001qGb-1e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 19:18:46 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90E0D2075A;
 Thu, 28 May 2020 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590693519;
 bh=ENwJXkJLKZRRsPK+WQo6kcGcxKkeYsu9FJkyfV7BrsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AxJ5emo9TW7QwGwPSsV9Dp1eJDxxvH4nmRepMbV4kjwQoATkDAQwKTqE05mMxWE2b
 U36vLeleBvo0SwmbPZfbuGe4GbUsq9AS8XxCMEXyo6gJx/WucGGSc5x/+Nhhvjozbk
 OXcjyo8rgkphmvKFpjCzbLVST1jQ5R9N5dsyWg68=
Date: Thu, 28 May 2020 12:18:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200528191839.GA180586@google.com>
References: <1590546056-17871-1-git-send-email-stummala@codeaurora.org>
 <1d54379e-35c7-76e0-0c8a-d89bfcecb935@huawei.com>
 <78d2f29b-3ec0-39bc-46cf-88e82f1970c9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78d2f29b-3ec0-39bc-46cf-88e82f1970c9@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jeO3B-001qGb-1e
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix retry logic in
 f2fs_write_cache_pages()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/28, Chao Yu wrote:
> On 2020/5/28 10:45, Chao Yu wrote:
> > On 2020/5/27 10:20, Sahitya Tummala wrote:
> >> In case a compressed file is getting overwritten, the current retry
> >> logic doesn't include the current page to be retried now as it sets
> >> the new start index as 0 and new end index as writeback_index - 1.
> >> This causes the corresponding cluster to be uncompressed and written
> >> as normal pages without compression. Fix this by allowing writeback to
> >> be retried for the current page as well (in case of compressed page
> >> getting retried due to index mismatch with cluster index). So that
> >> this cluster can be written compressed in case of overwrite.
> >>
> >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >> ---
> >>  fs/f2fs/data.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >> index 4af5fcd..bfd1df4 100644
> >> --- a/fs/f2fs/data.c
> >> +++ b/fs/f2fs/data.c
> >> @@ -3024,7 +3024,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
> >>  	if ((!cycled && !done) || retry) {
> > 
> > IMO, we add retry logic in wrong place, you can see that cycled value is
> > zero only if wbc->range_cyclic is true, in that case writeback_index is valid.
> > 
> > However if retry is true and wbc->range_cyclic is false, then writeback_index
> > would be uninitialized variable.
> > 
> > Thoughts?
> > 
> > Thanks,
> > 
> >>  		cycled = 1;
> >>  		index = 0;
> >> -		end = writeback_index - 1;
> 
> BTW, I notice that range_cyclic writeback flow was refactored in below commit,
> and skeleton of f2fs.writepages was copied from mm/page-writeback.c::write_cache_pages(),
> I guess we need follow that change.
> 
> 64081362e8ff ("mm/page-writeback.c: fix range_cyclic writeback vs writepages deadlock")

Is that something like this?

---
 fs/f2fs/data.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 48a622b95b76e..28fcdf0d4dcb9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2861,7 +2861,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
-	int cycled;
 	int range_whole = 0;
 	xa_mark_t tag;
 	int nwritten = 0;
@@ -2879,17 +2878,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (wbc->range_cyclic) {
 		writeback_index = mapping->writeback_index; /* prev offset */
 		index = writeback_index;
-		if (index == 0)
-			cycled = 1;
-		else
-			cycled = 0;
 		end = -1;
 	} else {
 		index = wbc->range_start >> PAGE_SHIFT;
 		end = wbc->range_end >> PAGE_SHIFT;
 		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
 			range_whole = 1;
-		cycled = 1; /* ignore range_cyclic tests */
 	}
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
 		tag = PAGECACHE_TAG_TOWRITE;
@@ -3054,10 +3048,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		}
 	}
 #endif
-	if ((!cycled && !done) || retry) {
-		cycled = 1;
+	if (retry) {
 		index = 0;
-		end = writeback_index - 1;
+		end = -1;
 		goto retry;
 	}
 	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
