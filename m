Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E349963829C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Nov 2022 04:07:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyP3Q-0001yW-MA;
	Fri, 25 Nov 2022 03:07:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oyP3O-0001yQ-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cMcDTDVJ34FegziKhXvDr8VdazQb+PGnbo5+ccPQ6Wc=; b=d7kAjEgaTdHbpalq4I6l8jMcYw
 GmeEXYOIpBrN6dPWzNuNW0a1Ajpw1Ud5m/stpus1rWd4EA2KyZUrZ6QINz95Ng6kNF8BObhcBdtBk
 p+T9ohpoRV3G6sfXw8N4YC7eWn/+CkmbM3BLcfZl/7AIjP8qsJi8159DUHulSXHQPQtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cMcDTDVJ34FegziKhXvDr8VdazQb+PGnbo5+ccPQ6Wc=; b=UXivnSwvy7TV4b3EkYkkaw8fv5
 YmnTOhmIA5ISF81opiZ+CYJ/aFwHsk0QCSCDF4aEvnFpFFkDc0bkdWY491jLbEEbpIQAv2Pf7/Dcy
 +nZ6vuj5bJGmJ7O07A2E8ktEfDkAPvG3rXs/fzrdurKRKbGdI3r7QehUawPfMtIS+O8w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyP3N-0004lb-Qz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:07:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25E0EB828FF;
 Fri, 25 Nov 2022 03:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E788C433C1;
 Fri, 25 Nov 2022 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669345607;
 bh=llHY7MD0O4KbESr1IfNXkVxCsoqrf0x1miTbM2if/kA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uf+swNBqVug8dnkjGi6j5UuJv+OHqO452APhypTnl+OgAgmoG1eNJj6PQA/nx740l
 bDRO8mPlFQlAEgMrIqonf3SYk+ebcgd0HVpmilOxa/FlykLTL0CuA0cf529MnNZHUT
 F1QJC/Uf4LKJc+9GglTGXmqc3eiqAGc5adZ41SgUuAsFwFCy11GLEYIn82xSFNA2V2
 ODOPItWvuSlW0Z7vytudtYwqRgmAulY9ack9BPMsctSVjPoTgGEbzTM/YAtmDbvWa8
 w7nKZDg0sqSaH0MXwR35X0YjMZu8w4Er9mbgv0Ftws+wNn+rIk2koBy+iXUdCkbS87
 zYTcQc0QtymHg==
Message-ID: <4b0a548a-5b04-24a6-944d-348d15605dd2@kernel.org>
Date: Fri, 25 Nov 2022 11:06:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221028175807.55495-1-ebiggers@kernel.org>
 <Y2y0cspSZG5dt6c+@sol.localdomain> <Y36ccbZq9gsnbmWw@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y36ccbZq9gsnbmWw@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/24 6:19, Eric Biggers wrote: > On Thu, Nov 10,
 2022 at 12:21:06AM -0800, Eric Biggers wrote: >> On Fri, Oct 28,
 2022 at 10:58:07AM
 -0700, Eric Biggers wrote: >>> From: Eric Biggers <ebigger [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyP3N-0004lb-Qz
Subject: Re: [f2fs-dev] [PATCH v3] fsverity: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/24 6:19, Eric Biggers wrote:
> On Thu, Nov 10, 2022 at 12:21:06AM -0800, Eric Biggers wrote:
>> On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> As a step towards freeing the PG_error flag for other uses, change ext4
>>> and f2fs to stop using PG_error to track verity errors.  Instead, if a
>>> verity error occurs, just mark the whole bio as failed.  The coarser
>>> granularity isn't really a problem since it isn't any worse than what
>>> the block layer provides, and errors from a multi-page readahead aren't
>>> reported to applications unless a single-page read fails too.
>>>
>>> f2fs supports compression, which makes the f2fs changes a bit more
>>> complicated than desired, but the basic premise still works.
>>>
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>> ---
>>>
>>> In v3, I made a small simplification to the f2fs changes.  I'm also only
>>> sending the fsverity patch now, since the fscrypt one is now upstream.
>>>
>>>   fs/ext4/readpage.c |  8 ++----
>>>   fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
>>>   fs/f2fs/data.c     | 48 +++++++++++++++++++---------------

Hi Eric,

Result of "grep PageError fs/f2fs/* -n"

...
fs/f2fs/gc.c:1364:      ClearPageError(page);
fs/f2fs/inline.c:177:   ClearPageError(page);
fs/f2fs/node.c:1649:    ClearPageError(page);
fs/f2fs/node.c:2078:            if (TestClearPageError(page))
fs/f2fs/segment.c:3406: ClearPageError(page);

Any plan to remove above PG_error flag operations? Maybe in a separated patch?

Thanks,

>>>   fs/verity/verify.c | 12 ++++-----
>>>   4 files changed, 67 insertions(+), 65 deletions(-)
>>
>> I've applied this to the fsverity tree for 6.2.
>>
>> Reviews would be greatly appreciated, of course.
>>
> 
> Jaegeuk and Chao, can I get a review or ack from one of you?
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
