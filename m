Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED777C89
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 02:36:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrXAy-0007XG-TE; Sun, 28 Jul 2019 00:36:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hrXAw-0007X7-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8H9supk5RMG+QuzerAxIrHVfV6N4IH3Lxwte8kAc3Vw=; b=YD1963W4pvB43x0qCNZ2LwROe+
 3HM/n9w15Xg9gtpw98Of3YN51xj254ZM1NoB9eW2mFQ1tZdC0L8dj96/nSkz4zukMaLSZ+Xg8tTD4
 y5Kjhmxp+xWxBRMwOa2F8xVVyKUsicumZ0l8Q77wcv2emaI5cme6NXqLMj0NcCfvxYyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8H9supk5RMG+QuzerAxIrHVfV6N4IH3Lxwte8kAc3Vw=; b=MxhMczskiYRB4Uy20KFWn/tnHI
 N3JegrRBHO7x8yjFjSSc7NvkFG31kwSzF8Dfx3/ttu+oKtDefNlFQWjlsP/lU1mSFnfeMCz6+893+
 u2puaYjkj+r85yxIPww4iKWI+swJKqTvOLLhA6iFPszfhcmihdXB3avttg9ovXJy08CM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrXAt-001QDL-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:36:34 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32516205C9;
 Sun, 28 Jul 2019 00:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564274185;
 bh=3QcKMWyvud9E/WuCoeT08n9lTblApc1uZ21h4kx9PhU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rGgP1an4Xkc81fP263JRufM8BgqKjlDC3mlNL3lmt272CzPVdK4B9dyJWB3gSxqBq
 TPkB8mhv9GqJLzn4sNEveW25kMW4/kt2NSjMLJ2CYmkWgYjnvwdRLMLcs29BKyzIXT
 085dg8hYsKwLZUBAzE/J6C1Xc1SmUEMJVJUGd+64=
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-2-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <056a12d4-d787-9a3d-9ad4-4d1136b2a197@kernel.org>
Date: Sun, 28 Jul 2019 08:36:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190723230529.251659-2-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hrXAt-001QDL-3Y
Subject: Re: [f2fs-dev] [PATCH v4 1/3] fs: Reserve flag for casefolding
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
> In preparation for including the casefold feature within f2fs, elevate
> the EXT4_CASEFOLD_FL flag to FS_CASEFOLD_FL.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
