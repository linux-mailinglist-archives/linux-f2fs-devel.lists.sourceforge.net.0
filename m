Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C96892C4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 09:54:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNrq5-0008Fs-2c;
	Fri, 03 Feb 2023 08:54:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNrq3-0008F0-E7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 08:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rFYa/AzLPUSfCKcl5Sj4oIo5Lh5P0AkRD4nK31YQKYI=; b=RYEa1+2svEKyZy9Ekz2rlKE3uN
 HvPkzuroJw5Mh/abOPZmaVzKvrYxv2jnnIAylhwIixAV2TC5FhBxnveBNPsiNTw1fwj+1J2nKz6+H
 OAKhXgBV7xGhuC89WcXGf4RgJgWdYo9uIk0f5YbjyL/ZiGm0ct7XIrerYLsdyTQW+XC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rFYa/AzLPUSfCKcl5Sj4oIo5Lh5P0AkRD4nK31YQKYI=; b=g+Ckm7cYx1Ac/Yi1G9m8tx86eJ
 1+oWA0HS9k8q1NyNEKHHej3e26gdTCu/44kVJtyDkn83bc/3zafY9vjQKcBHyPOi2dD6wc8dgu77w
 YUf8K2n9zEKe0CbNjmRwfrpFi2cPsbVwH9K2hMbJ0OQ8Ps9n03ZLZIuu6tfvtju6Y8TY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNrq1-009xh4-Va for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 08:54:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB44461E1E;
 Fri,  3 Feb 2023 08:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C004FC433D2;
 Fri,  3 Feb 2023 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675414462;
 bh=0yDJWQOQrDVoHAkzXh1bFCfdWy5BLzDh6Q/DxQqYtJI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JUYZsVb4DY9iyCM6VC7cnMotPN8f8s1wNOKVVJJxHA/iqZdJpqHdHQjv+f3cVKYlS
 S6iRtZG7TQwtks+XOsyMtGzMHwqEcG89+CROhWJeFtmMlecv5Uv1RhvX3exkN5Z6Ph
 dl71+8NJHB/wz5t66sxk7jAzhFElvCbPgLQuSLo4/ZkkZAFn8Acb3JHIEGuYCi4QvK
 YCnhQc54C2kxOm/kcORTEzXeMZP9SzrdvLaSJZHE2QlVSf2RbsJVXGnFq8vPgnX4tn
 xfmoHgczP5bBar0Fk3O9V27b3mHCT3fLXf85JuNyxaCh4C4S3QDp2I6zArWAdHXrRD
 fjew5sHqAShKw==
Message-ID: <4a818d7e-bddd-f44c-d115-a7e81301983a@kernel.org>
Date: Fri, 3 Feb 2023 16:54:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20230203010239.216421-1-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230203010239.216421-1-ebiggers@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/3 9:02, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > When writing a page from an encrypted file that
 is using > filesystem-layer encryption (not inline encryption), f2f [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNrq1-009xh4-Va
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix cgroup writeback accounting with
 fs-layer encryption
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
Cc: Tejun Heo <tj@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/3 9:02, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When writing a page from an encrypted file that is using
> filesystem-layer encryption (not inline encryption), f2fs encrypts the
> pagecache page into a bounce page, then writes the bounce page.
> 
> It also passes the bounce page to wbc_account_cgroup_owner().  That's
> incorrect, because the bounce page is a newly allocated temporary page
> that doesn't have the memory cgroup of the original pagecache page.
> This makes wbc_account_cgroup_owner() not account the I/O to the owner
> of the pagecache page as it should.
> 
> Fix this by always passing the pagecache page to
> wbc_account_cgroup_owner().
> 
> Fixes: 578c647879f7 ("f2fs: implement cgroup writeback support")
> Cc: stable@vger.kernel.org
> Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
