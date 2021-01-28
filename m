Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91351307A60
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 17:13:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l59v2-0005t3-5E; Thu, 28 Jan 2021 16:13:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l59v0-0005sh-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 16:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pbBp8evLoqbu0f5FaeXWXAEfZCkZnHDbmkxknSaa7U8=; b=BGfDUH5iHh6ZD8FA6xorYzGXFU
 NskkVnIm5Nyg3lfgREFV2o6L/ugifvmYc17AAYjxXbHochWOFyOJRVDbBP4829rjOJmExc00nIkA1
 QrqwI3uckLiA75IEvWVYgrx/KLFgi6LPdilxBkZ0aEw0lvCI866Zoj4bWpgGc0sEkX3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pbBp8evLoqbu0f5FaeXWXAEfZCkZnHDbmkxknSaa7U8=; b=ENM9I++yS9dtVfTaj2sebS3WfQ
 KX+kiU/LTYmDpMMl1MBewvAl73EQsrIcTM3ryxgHdavZ01C41k9rhjXKPztfxAKUV1VrLBFGC35cM
 Y7H9PIdo0jOBxJrkFkv4TrCY48AvozU3F2B6s20+Bpjy6Y5rrZjxEEVCQqQt6+D7curk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l59ui-00FpDx-GR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 16:13:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9BF664DED;
 Thu, 28 Jan 2021 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611850366;
 bh=Fr4FmilKLR3go1KurekhCtnXdnRdts4djKUeKMq8EgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFgKayhn5J/n+Vz/FNdjK5zD7/6H+v1bg4SVq1QMisEEPoYrGbu3OJSDOWmkMXQVO
 gm3cFei93aeupg+Ne4kz2QBo91/mMqcdtVWe/d3UWz1X9qaydT3jeB/1spFkncd7yo
 4KTj+WvdBxq8jltpxWDqFZbQH0iN/ZYVIiueI5ydQExpqEw6Yys1aNUkToZOzIHxb5
 cf1RDh3um05fcTuCdf5sktcbPSzyazzSS19zKr6+z+WNW4aWSSNHlMQ4gYjAR4DQ2u
 ArgfbjWn/Ztmxg/F99u1ktNhmc1uDLtJE5jWcZcWDsX9CYNc5admjsxW/DoNqjFDxD
 Sn9Ojk2Qpq6RQ==
Date: Thu, 28 Jan 2021 08:12:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YBLifNK5EXedfhbs@google.com>
References: <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
 <X/8UtJU9Dy30kC7I@google.com>
 <37ba41db-2589-e155-c416-d0c8832026cb@huawei.com>
 <X//DPI10+ZXvHkYH@google.com>
 <8e88b1e2-0176-9487-b925-9c7a31a7e5cd@huawei.com>
 <YAGt0i244dWXym4H@google.com>
 <20a1dbd3-808e-e62a-53f3-7f1e2a316b3c@kernel.org>
 <YAdSTzYF8Hvxdcqy@google.com>
 <068da0d3-18c9-53f7-0f24-63b07e1af272@huawei.com>
 <9b982458-57e1-a04d-c5d4-f5ca775af1e7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b982458-57e1-a04d-c5d4-f5ca775af1e7@huawei.com>
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
X-Headers-End: 1l59ui-00FpDx-GR
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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

On 01/28, Chao Yu wrote:
> On 2021/1/22 10:17, Chao Yu wrote:
> > > No, it seems this is not the case.
> > Oops, could you please help to remove all below codes and do the test again
> > to check whether they are the buggy codes? as I doubt there is use-after-free
> > bug.
> 
> Any test result? :)

It seems I don't see the errors anymore. Will you post another version?

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
