Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A1AC7600
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 05:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnLsDpU0BMLMH6a6YZEN29hCCe5xMQ3uQwxGHr/Lkz4=; b=QsCCs3+YNF9FKpAsousvGa+GX+
	+KBRAohDYpfwaeJSh+mtuU8zoD843h/Hnoyu7fMRCWnz8VXpk88BVigZIlPENfGG6Z53orqJSINXz
	Tn1PPHNieJLHQomXzijVWFha1h2FoXx3SqzYw1Lw6Wet7KcPFIvFVJLp2/5txIsf/lyc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKTVM-0007K5-J8;
	Thu, 29 May 2025 03:00:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uKTVL-0007Jz-Br
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 03:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkclZhV8u89qzHr7rFl+V1dlJzoQGFmufCYdruvQm4g=; b=nMr9++thTYj4YCBQkcSwDKwBoX
 vYLaLzKhgmwNCQhwbtEGBhTIvyCBiboQNDMjfZxko3myrFMPyJsLk+AMhXUoc9P/aZW8u+ItmKfrs
 muAQhtPphQgwPMdXazGS51SF67R2JDRre53QSzJP2lta8AWe8FXnnXWO7rf2tUm9E3ss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkclZhV8u89qzHr7rFl+V1dlJzoQGFmufCYdruvQm4g=; b=lwdzq/nm1P9ZLz7SHGgxJs5l6n
 f4Y73Ks5AJwGYfx755C9vrzGpRxHuYJSI5wQBFlpRhrtBZK+tAxMKctwwdJmlaJscw6G+sukqCM3A
 aYPeHRFmHg7OB3yZqoBzetMP3Nw34gddbzxweSK1gqzlUrEd0H2SLhXeNtkTKdCYYkxo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKTVK-0000XC-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 03:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18396A4FBAD;
 Thu, 29 May 2025 03:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF41C4CEE3;
 Thu, 29 May 2025 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748487615;
 bh=4jwz9dykOXSG4DrviZmGzD42jgROTg6GslAB5IwiyzI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=mbpUGI1kyHGlrTeWwFlSdZVPeY8VWHXoJxhRxmamOlPPOI5J1vL/gi29+6a1gDy2I
 B7Enxb3H6l7aBmyrsgI9Bu8kdis1Nrt6zPLqAxmuQLhyCXflhFcCmBwdUoVCkhvhSz
 /Rk8A0TKaGScJ5lZxKiULHacIpPVRk8rq/PnqhLwWIPsprEIIvRlNgv3e5OOYFbAtX
 wXeI6kSwBYH+ykyxbKz+0Uvaf28RDCCO2w0MyR+bb/SJ4/YfzvX4dBB+HIQcelhgPk
 jdM8/pRVwLjjhaw6nKzCOwgoTSrD/d31M90yseMdKbjPfEyC2JJc2ZjZBbFgPUCQqf
 5J+zOKDsY3snQ==
Message-ID: <da22627c-624c-47dd-b3f1-130fbbf7b232@kernel.org>
Date: Thu, 29 May 2025 11:00:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, zlang@kernel.org,
 fstests@vger.kernel.org
References: <20250526080323.1851300-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250526080323.1851300-1-guochunhai@vivo.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/26/25 16:03, Chunhai Guo wrote: > This is a regression
 test case to verify whether the CP_TRIMMED_FLAG is > properly set after
 performing
 the following steps: > 1. mount the f2fs filesystem > 2. [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKTVK-0000XC-NQ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs/014: test for missing 'trimmed' flag
 issue
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/26/25 16:03, Chunhai Guo wrote:
> This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> properly set after performing the following steps:
> 1. mount the f2fs filesystem
> 2. create a file, write data to it, then delete the file
> 3. unmount the filesystem
> 4. verify that the 'trimmed' flag is set in the checkpoint state
> 
> We should apply the commit ("f2fs: fix missing discard for active
> segments") to resolve the issue where the 'trimmed' flag is missing.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
