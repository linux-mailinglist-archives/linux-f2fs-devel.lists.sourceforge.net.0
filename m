Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968D43A92C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 02:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfACA-0005Od-RJ; Tue, 26 Oct 2021 00:20:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfAC9-0005OJ-FA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtrkyVfrbDZRWJgPyQF5yL56qWIBM7V+6D39vy+9vCk=; b=mbQJAvVTdG0vN24aeDQbhceo4E
 n4DSVNNC+LubrAsr3s1/r4Z6+zAr98+NIt9H1q5OUO2Fbo2bT+NmrBdXl9XrN3ajG3gcr9nrIArw5
 5s+bCrk8c2UMyBmnIF20B2S+VxuoiqmFCSiggkz8QuvdzmNtyeJEWgPTW35z738Bjl8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VtrkyVfrbDZRWJgPyQF5yL56qWIBM7V+6D39vy+9vCk=; b=nBnQKcgfKCAMpmuTbcwAH5BM35
 LOlO1ZFA/Y1O9vWWtHKaozuOSZOwm3Si9iPCgEK0jsvd7Dmmpulz8CQZT7Ejq0zkAV4K+LEY1XFJw
 bZ/TTgM2pgfL1iLnXdgnshEvyYnxUR1ZWtifgp1jklDUYuGPrAEdf61Ij4I32viVIn3I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfAC8-00GDVk-3H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:20:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD1EC60F92;
 Tue, 26 Oct 2021 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635207589;
 bh=ewFMn7F/EMh7/+QcFBbhLnkKLeG/ezHK307YEtzASZE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Re+MAPo4aFCVE6mbCWNhJ61XgeUy4IVohht++U7W451VFSN1dWVT3u+dUIh3lQuWf
 8IMfJpxbNWBNOiQIl1aScgQzm/NUOxTCVFrd89Jnid8EwR3CeWQgrfRvHzBXs+BXuL
 hzHnCrMwq1LhU7Un3XDuiDd1Ts4Epv6KHOtYOX80tQnhCG0KYQZCcmyL+x1iDATd1Y
 W/0ZlUQH7D/rDqtqnbHVc9LmCk4BNrRFnYIkfgzdkQo3PeXjAXA+bJbBbha+dyLUwg
 xd22nc4gWYkgItt/PnPTXz+y4IRFu/NPxQPPl10izxq/6mQjd2Rfuo3D+Bc12XuNEq
 6F7gDyb/a7wDA==
Message-ID: <0f1b32fa-1b2a-5586-9dc1-d50135a166f8@kernel.org>
Date: Tue, 26 Oct 2021 08:19:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org, corbet@lwn.net
References: <20211023025833.216030-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211023025833.216030-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/23 10:58,
 Fengnan Chang wrote: > fix f2fs.rst build
 warning. > > Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions
 support) > Signed-off-by: Fengnan Chang <changfengnan@vivo.co [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfAC8-00GDVk-3H
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix f2fs.rst build warning
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
Cc: linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/23 10:58, Fengnan Chang wrote:
> fix f2fs.rst build warning.
> 
> Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
