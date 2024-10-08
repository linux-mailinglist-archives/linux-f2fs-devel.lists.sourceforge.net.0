Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A39942BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 10:51:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sy5wA-0002rG-Ew;
	Tue, 08 Oct 2024 08:51:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sy5w8-0002r0-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 08:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qSWbvttM6gQFWHcSn/6T5ZOGPmT0sg7cslALKN5kT4U=; b=fCRSNtTeS9adflVQ9wrWeJgpAF
 sBc51W7j7e5d1rif6BBPjwtaaVWUjiZLXksVoQOIBqddRk/ssN6aacgQdWXz4Atxz25Ng9PfZT0T8
 sMAPlNjMmYtfYmWZbYA+uM2va9qe30VjnNQ98YaxCQr3T9Q9RVswNDhUmWfS75TC/w0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qSWbvttM6gQFWHcSn/6T5ZOGPmT0sg7cslALKN5kT4U=; b=RagA3EemHSo/m8r+xqkFHjTKeI
 mqVFgIa6evR3NAh9Vrl+TPY4TyKfb+vDRJoAqTfl8E/k0+Pid2jNisZ3LGRjkqJf+xhtvr7wHS6m9
 qCHFaAVf9o8Z8kzLGVx4rPhFMDJBfXlG9pK02TvPKqMfUGY6wQRSMWdQMkzt/P4KsBcg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sy5w8-0004cg-RK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 08:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9633BA43233;
 Tue,  8 Oct 2024 08:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7366C4CECC;
 Tue,  8 Oct 2024 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728377469;
 bh=he3le1eo9eH858qD8mSCjlDMejkMAFfzM9LFSwbMvQM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gJcsVGUraCGcbgnLbpApeIpTZN2SoMyoJFCKEgI8OqameUT+7swXIv3CAKiP14eq0
 /vzLuyHz0kHrCGONYGJkBzToLugYBQfmjBUeX3r29JR3n5SZwwjda1kKcZCeu8ZYMt
 zSrrk1Wasrp06ZLatCO2k3O49ARbsuAB7GdFvfxjr+GUC/1ScO5pAPkEl2KvBrHGzn
 GI/oMhp2CmiaT7+VBLYnPK43dCrDWr+zrGNVHXdnqv2IjxSTykk4Z1PydW4qQbxDPN
 39YYbA+3lUvBXt5NxA2HbZ7x5alT+hSfspGww2nBEYngF7dNKgzLqEJj5nwe1TgQlE
 JxUY0cXyTDgLg==
Message-ID: <2fee27e0-e681-4f4c-829a-d6e49472e457@kernel.org>
Date: Tue, 8 Oct 2024 16:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241007114638.1337-1-thorsten.blum@linux.dev>
Content-Language: en-US
In-Reply-To: <20241007114638.1337-1-thorsten.blum@linux.dev>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/7 19:46, Thorsten Blum wrote: > Use struct_size()
 to calculate the number of bytes to allocate for a > cloned acl. > >
 Signed-off-by:
 Thorsten Blum <thorsten.blum@linux.dev> Reviewed-by: Chao Yu <chao@kernel.org>
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sy5w8-0004cg-RK
Subject: Re: [f2fs-dev] [RESEND PATCH] f2fs: Use struct_size() to improve
 f2fs_acl_clone()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/7 19:46, Thorsten Blum wrote:
> Use struct_size() to calculate the number of bytes to allocate for a
> cloned acl.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
