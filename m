Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F00AADDB3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 13:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqhsCq/ryNvy2BgvRWjg6rx46/hdAgyPJ8E0cxkMXZM=; b=XM0fpxsNFX0ODdMyAdWaBZuHj+
	p+fxS/8/gUIAHiOCizVBim0j7k8rQnnOQhHkB9BzoRqHtrKH2R3/Qr5N+zksXqc7WzXr59EDmPx2Y
	oWicwesjirEeclVD7o4cLvvkV8LsMId9Nf10pPJ9g6FCydNFG9Pph/L0AVc/faJF3ZU8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCdGo-0007TH-2B;
	Wed, 07 May 2025 11:49:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCdGl-0007T5-Fz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bGY1G0mF36/aN5yGaBicGROGs4hpKGnrHzMT1RCWzPM=; b=B4LifEs/LQ3E1EGbqJ2bRnuZvK
 cl2J6lBrbcQTWmb9+2NmPDXmUqmbfH0Y0aJSQDD0m3SZ+niLZqcZprjQcXAvxLVRazDKRYKSfVrDP
 W8sYQLMo+OgkdryASFVyRU0EK+pdeUPh+aUAzN6DPnV3HQlS1skvz3Dcal+QFfmOxCUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bGY1G0mF36/aN5yGaBicGROGs4hpKGnrHzMT1RCWzPM=; b=B9uV29PaGsXdvds/htEgL5UZ4c
 ktVIpeCnSoC60LxsDbWhbdlOH8zC3mTxfH3UU2nI88280cVwPPpDVySUe8Jn2HK4xgGzKkuN1Q273
 5JlXus3AOHwUSS/UNFREWE1+gGxf2TjUXamonZQpOUPHqRSG7iI/HUMI06NTTLZ2zOdA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCdGV-0003NY-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 510FA4A9AF;
 Wed,  7 May 2025 11:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E2EC4CEF3;
 Wed,  7 May 2025 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746618518;
 bh=zYFu0+72hNN3B6r+l1PUmeNBY8D41SXSnIN0jc8RGgE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tIt7W084TEdnQAHSmWLWx1MHHFDYghvveS//qCPUoP+LweUW7GcIeRSZKHUKzjIQh
 NLZy8MkhQv7A6ACe3g6adhjN+10VCvpCzBpb9rT0GK757sB4GPrWE4ojy8Jm5X+BBh
 +b4H0X7PvReiKhSdlZFWItp2MrVphSGjx2yzDyqYcEQnBCIBGMmIO8LHmSKPV695E4
 sMJNm5wJc7JSPAKhP4vULJ4v+9jr0ys2DnXjF2HelAaQk+RvimY6r1Q7xVHfVKMZbX
 XER7UXG6oGol7pQvDaRsP+yDPf2QwO8gjKEmXLApiYWBPRdHEQ8IjLyN5/++bpsmed
 9FACNlmVMxpQA==
Message-ID: <97649d11-1b07-4380-a521-05b252192421@kernel.org>
Date: Wed, 7 May 2025 19:48:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <aBR_H0zPfg5Sbj4z@stanley.mountain>
 <75dc33f0-7415-4d73-8f0e-6887281bc35f@kernel.org>
 <aBsMVmWzpHwCjn8F@stanley.mountain>
Content-Language: en-US
In-Reply-To: <aBsMVmWzpHwCjn8F@stanley.mountain>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 15:31, Dan Carpenter wrote: > On Wed, May 07, 2025
 at 10:59:11AM +0800, Chao Yu wrote: >> On 5/2/25 16:15, Dan Carpenter wrote:
 >>> Hello Matthew Wilcox (Oracle), >>> >>> 1768 /* reference a [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCdGV-0003NY-R7
Subject: Re: [f2fs-dev] [bug report] f2fs: Use folios in do_garbage_collect()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 15:31, Dan Carpenter wrote:
> On Wed, May 07, 2025 at 10:59:11AM +0800, Chao Yu wrote:
>> On 5/2/25 16:15, Dan Carpenter wrote:
>>> Hello Matthew Wilcox (Oracle),
>>>
>>>     1768         /* reference all summary page */
>>>     1769         while (segno < end_segno) {
>>>     1770                 struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
>>
>>>
>>> One time email warning etc.  I could also mark filemap_get_folio() as
>>> a no fail function to prevent false positives.
>>
>> So, it doesn't mean filemap_get_folio() never fail, can Smatch detect above
>> condition to avoid triggering warning?
>>
> 
> Thanks for looking at this!
> 
> I tend to not worry about false positives a lot.  Only warnings in new
> code should be considered as real, everything old is something that we
> have reviewed and ignored.  If people have questions they can look it up
> on lore.

Ah, above implementation (not checking return valud of f2fs_get_sum_page) exists
for a long time, for such old code, Smatch didn't complain.

It matches what you explained. ;-)

Thanks,

> 
> regards,
> dan carpenter
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
