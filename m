Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 830583D9A2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 02:41:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8u6l-0003oR-Do; Thu, 29 Jul 2021 00:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m8u6j-0003oL-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uNIc7pfoGu/FJThfBBj9+RPriWv7zO4JIA2SEJzetJU=; b=N5eBOjA9SCMfhW1eqmvAFFY1R3
 w93t+I3x7cXLIUGk9sgj23jQKAsen9nP7u1Im1hol2nizIH/8/3OKERaY17kFj922+tF4Tp6EZB94
 bY8Fw8OrRMYT7IvMvGFE2/nsKv5kPr/qFHBdeVrqqm+Ga7Yg3NXVNqjDEUMNcXqPh5TI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uNIc7pfoGu/FJThfBBj9+RPriWv7zO4JIA2SEJzetJU=; b=GMJa3LxePOWD/sJ9otEfx8LIMw
 DWXcPUvr2mfB2FOlecbEChoVgKX4AjeYBfgaiRJCa8xL+shiF98AKwaENNGythWBOXdXvFbYJq08+
 6LVe32kH6kPyxe0HIaC0A8eJM1Fn85xoEhPAeV4gO1SycUo7ulqCxfBQYIZgSWWUisG8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8u6d-0007TC-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:41:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A843C6103B;
 Thu, 29 Jul 2021 00:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627519254;
 bh=uNIc7pfoGu/FJThfBBj9+RPriWv7zO4JIA2SEJzetJU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OdyQCOsKhEDk9fPkieTeaxQN+hnutClJj5EUNp7HUhg8oXNR3w0AryUxZnQxWrUCv
 Eq66HIf/Y7hi8i2sG2U3ICf8Bpe08driDJnah557lnpQMWGVZuE+KHQ9YMFLo6iDEo
 2rCgB5+H90rEHaH2pdeeM5Sv1NOv1P22K58TWFyJDHgWWGU5Jmr5TH4G+aaXDUGvi/
 x1L2gA5CYtYWzK/CA5nXoOoizBq1AabMCzQKmo/AEtd3JNwSiE0PL9T6/lqYk42tZ7
 JnYCmWWUokYUJ2Mntn5gPWnPe7BmRQbmv7YQNM16u1Y3fzgbourJ9MXcBulFnWN++0
 ZT6jyeNs4HVSQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210726041819.2059593-1-daeho43@gmail.com>
 <f9555521-8878-2d46-36f1-3032bb8bbc0a@kernel.org>
 <YQA/orZ5wXjwWeyy@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <8c0d05d2-3988-a8a4-5403-1173f25b822b@kernel.org>
Date: Thu, 29 Jul 2021 08:40:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQA/orZ5wXjwWeyy@google.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m8u6d-0007TC-Hi
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/28 1:17, Jaegeuk Kim wrote:
> Do we really need to catch this in fiemap? What about giving the current

Yes, I think so.

> layout with warning message and setting NEED_FSCK?

Sure,

How about doing sanity check on cluster metadata whenever it is going to
be accessed, like we did for single blkaddr with f2fs_is_valid_blkaddr()?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
