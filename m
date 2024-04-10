Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4189E7E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 03:38:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruMun-00060K-3m;
	Wed, 10 Apr 2024 01:38:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruMum-00060E-8P
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4W1mKCez8MjtsSVAN7rwLhQDD3t6rE++x289THnOtE4=; b=XKSoz5aVPFJdx2rSf+1um1DVkX
 ZlnGVX6lAdDmZGn651oyxfFeNm1TIX0JbIHjfXl9hQufCwukEf/RLCYF8JDTsIGbrj+0ck6XRwDzb
 8k6g08DDcGcQizB/WXM0lwAZSop8/aTsouPIKkI7lalEkD056pgZhvJXQl128db9RE2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4W1mKCez8MjtsSVAN7rwLhQDD3t6rE++x289THnOtE4=; b=ApE1cqgOseTW/Kyho+s2XENFaY
 dt6tnVMREILMRXXhir48qAi04JL9347SzCsZFHKL1z+kOykRbQGtFKopyiqK8bGSwQ4sEdb+Alc/t
 bNESvZ1SqnnDa8Z9VCmqvQ1m3Q1P2lCMlq59lCd8HW/Leaqu6KegMG0mM++YHFRqmuWg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruMuX-0000Hy-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:38:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A296760D2D;
 Wed, 10 Apr 2024 01:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95C7C433C7;
 Wed, 10 Apr 2024 01:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712713074;
 bh=j0XT/UNN8yGtPAmEwlK2RwyMQXk8mWRburu1amJVRx0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZMTN78500hQJFeDYbSgpBReY0tHTAgjJzJd9Zj41fcg9xX6h7Flun1g9HhgcoCAe7
 Y2kI1petVXLj/cvEOryWuSiTImaK01Eti5XYHS5nLvHwvf2MG1rwvx8q3zrAa+AZwy
 fI/3/AzlrooXQEDyFUXi6ZHRb3U92KQuQe1YCKrqO4foe4npYUJRaxBqveSqCzj9QA
 y4RxWxwgRtLf0hlH6+Einz+i9YcaDeMnklUaIE9sIoRnSp5XvKBPOCAD8zjZOO0izB
 qmtKBwlzwCpFb65l2o88AHuJGOCK8OHSEWWx6eOH73uOCWY6XkIqQ+ZGhKUZvqPG6z
 2w2YzOV5H7LTw==
Message-ID: <4885b9ef-6e2f-42d0-b1fa-bddb42d74a2e@kernel.org>
Date: Wed, 10 Apr 2024 09:37:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240409233411.1197830-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240409233411.1197830-1-daeho43@gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 7:34, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > While do not allocating a new section in advance
 for file pinning area, I > missed that we should write the sum bl [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruMuX-0000Hy-Dx
Subject: Re: [f2fs-dev] [PATCH] f2fs: write missing last sum blk of file
 pinning section
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

On 2024/4/10 7:34, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> While do not allocating a new section in advance for file pinning area, I
> missed that we should write the sum block for the last segment of a file
> pinning section.
> 
> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
