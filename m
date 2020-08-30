Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE766256B3F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Aug 2020 05:18:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCDrh-0004hx-16; Sun, 30 Aug 2020 03:18:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kCDrf-0004hi-PW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W6gvSV7CV73LG+TEALyfCdBQYH0N27F4Auc5GectvNk=; b=K92cxyrkAz6CF6n58xGx/uucsB
 zXouSN458AIAim3AnsHIGLGysU9Vsf9fFHMPKwg+7xqQHz5MZHO8gid1dOt+8nAGORZed1NKKmGCz
 Wewzq2qVwpe2okUbhtVhxaP4Bp7fGzlS/ETOYgf6khcqIi6o5NqP74k4g2cOsTiGpZR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W6gvSV7CV73LG+TEALyfCdBQYH0N27F4Auc5GectvNk=; b=GmlYEKbrv0OOuLP3oQVxJCnIJ9
 +V7drGMqL34HSalXaMWxn72sljh9OEzNnLt+RELojvi6MGPzcwc88geiYbVzo/yYadrH15M4GI/6m
 aRE1PVDBaqNF+CMvkEAy2MQjCyA1A5AaOAxil3xKUPUSe35EkednumgqR2YI7StuWBcM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCDra-009fB4-MO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:18:43 +0000
Received: from [192.168.0.108] (unknown [49.65.245.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2176B204FD;
 Sun, 30 Aug 2020 03:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598757500;
 bh=W6gvSV7CV73LG+TEALyfCdBQYH0N27F4Auc5GectvNk=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=jYcS40rDc+LO9fgIx5/k/mWN7//WBVceF8mCLUZTALS7pizOkh0l9NCq7MQPC8A39
 GT5dA2YJc/kgrk+T9j9kORwTcygmWFPh+CHH2FXHAxwUpIX7NFUfWTKMBMMxbAjGrA
 TIpGUt9Cy9SbVRlzXD5lR4WAnrJQ6YTY1Cmlc9e4=
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200824214841.17132-1-willy@infradead.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <e2b8c2e2-3a99-88c0-d47e-547d2b3517d3@kernel.org>
Date: Sun, 30 Aug 2020 11:18:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200824214841.17132-1-willy@infradead.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kCDra-009fB4-MO
Subject: Re: [f2fs-dev] [PATCH] f2fs: Simplify SEEK_DATA implementation
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-8-25 5:48, Matthew Wilcox (Oracle) wrote:
> Instead of finding the first dirty page and then seeing if it matches
> the index of a block that is NEW_ADDR, delay the lookup of the dirty
> bit until we've actually found a block that's NEW_ADDR.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
