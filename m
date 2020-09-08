Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45470261313
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 16:59:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFf5h-0002IN-Hh; Tue, 08 Sep 2020 14:59:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kFf5g-0002IG-9g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 14:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qu/VD/1ayytWRjDRyQndb7jEuf1+9w8WPZlWAXNLxKE=; b=BQhQej47rmWNoWwYWQKvHuNPSU
 qGKBKYnQ04UadsvKrSJU3Ss81W5jSK9X3xz2bWyJQzWKBYZfkDdA+XoFMyttRaDVpdYp462gJz7gj
 YVcrprIhypFpmS4mbstVktpUSjPPz7nobZgWfrzPGF7gc+DfVY/1hNl7uBxBcEf/nl6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qu/VD/1ayytWRjDRyQndb7jEuf1+9w8WPZlWAXNLxKE=; b=Ao2XVPzcK9Y1hwwE8pnKFFDdkN
 7Kr2qY0/DR+W/TLLKeMnEwd1fHb9fpAl3G/9uOZiR476cZg2yGEX84ZiOtfYUQO9v6d+2QEQsstSy
 uCDiXpgV6JB+vqE8CRMrbqEriJFvvtkFqElRjKogO/N6PiDA91r2dyOghA4OK/0cq36A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFf5b-00Gv92-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 14:59:24 +0000
Received: from [192.168.0.108] (unknown [117.89.211.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8D92229C9;
 Tue,  8 Sep 2020 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599577154;
 bh=qu/VD/1ayytWRjDRyQndb7jEuf1+9w8WPZlWAXNLxKE=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=faOgOH+DcFRZTm9HX6sKgDwiXJ3s8Y7cBZ5xeg8L6BgMvwDSYWJZIOdxTW51IMTM9
 6nYU5Hcq+kQvO3dhQZF6lPbmWvjvXcgoZ3OYk18oRrKIIGe1nTqvXvCw3fxIMFQ7Wj
 DOy+QPrp4AuiAsuVNXd7MPNHUxOPHb5QDrCkkf08=
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200908024411.2692388-1-daeho43@gmail.com>
 <20200908024411.2692388-2-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <590f0fe7-a4f2-9939-fbb2-35f52179135b@kernel.org>
Date: Tue, 8 Sep 2020 22:59:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200908024411.2692388-2-daeho43@gmail.com>
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kFf5b-00Gv92-Oq
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: change return value of
 f2fs_disable_compressed_file to bool
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-9-8 10:44, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
>
> The returned integer is not required anywhere. So we need to change
> the return value to bool type.
>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
