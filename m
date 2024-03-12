Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5CB878C6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 02:43:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjrBI-0004cV-SX;
	Tue, 12 Mar 2024 01:43:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rjrBH-0004cN-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8BZSjC+Ux8hZgfF4HjYEstYy41OsJfwqW+dcoveBIdw=; b=aujrE5YFVAl5JWtLgSmvQkkSiI
 bomwpiAROn0QUEtZk+go0dxUAoCqzE0i8QrXrGbvq6PjHlaskTA94H3bboay27qXpevkANaGxQ1S0
 f6vRappg/lWvujsiaQUMGGx+at5weLMcSJJUV6FRT+BgeM0DVj2HhhhhFfORndeXcK6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8BZSjC+Ux8hZgfF4HjYEstYy41OsJfwqW+dcoveBIdw=; b=Dh4PFoNew9DtwEqSifvF8TGKGe
 DNrY5m0NwQU/sCO+EGobTk5/lAJS7CXd9OHzWfX6dqc6tfqs1yjLJNJdoGJ0my+2P3+OsY3UKbGno
 yA1h2mcA7t7Q+PSw0ZZ9qghSUuNsi6heUN6DJ27Mi4wWGqDzUEtNedO4XFNSaboCZhWQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjrB6-0002Zy-2P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C325E60EF9;
 Tue, 12 Mar 2024 01:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24EEC433C7;
 Tue, 12 Mar 2024 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710207815;
 bh=LTza99Xtbwi+Bmy3Kob27BW6F74NLEb1FZWr7xFLdMY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dFCQx0JAtEPq2R8Cqk4acEGfo+Bf2OrJFrSQju1WQALYQHXwvxbTNDujza4lgY9JC
 zJkfKx6Gz7AJ4ZBegt9EjDTujoIjrI+tWj465a7f1lanwm6wDygiRqOAgB8jSEj1sJ
 4eA21fTlL6UO+95aNTZ7QDmMQ4o8j8A53zgqYfQcmi7FJSJcBPvaUCN4W0BZ/Au58B
 EIOuTNR5GxYvHosgEW8PE/BtAZP8VzGG3iPR2wKOCrX6taEUPAF3yOeCmgLIuUxOlF
 wIrcOeYAzBcXlWjNzJTIL1OkN/OicQGnCeekIOJTUMHoxeWxcBdsS49YtBeZeSircy
 9HRF3tTryuc7g==
Message-ID: <0a206e73-6d93-4e86-966e-994bff627997@kernel.org>
Date: Tue, 12 Mar 2024 09:43:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240311235921.1832684-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240311235921.1832684-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/12 7:59, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Since atomic write way was changed to
 out-place-update, 
 we should > prevent it on pinned files. > > Signed-off-by: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjrB6-0002Zy-2P
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: prevent atomic write on pinned file
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

On 2024/3/12 7:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Since atomic write way was changed to out-place-update, we should
> prevent it on pinned files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
