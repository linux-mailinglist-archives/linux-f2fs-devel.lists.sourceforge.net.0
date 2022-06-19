Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDA5507CA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2jDW-0008Rw-TQ; Sun, 19 Jun 2022 00:55:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2jDV-0008Rp-2Z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4PUdXuMJWy31xf0jQP7Vs/TpobsJ52VwYOrK2JMwYV4=; b=N6vizbhOVKZnQ2AwQBfrO6TPaL
 atR2iFqgTcYuKhsnGJa9GLU735PBj4qRXylrRqR8PXth2yTlAtzDjLBWzfmSbfDWXBH6yciSY0Ycc
 6I1KKnqBcVZLjyZEJFO3gRd/0kVyoVL/QTkR76UZrCKYBtsTRwGn05dyCfN+RH07siA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4PUdXuMJWy31xf0jQP7Vs/TpobsJ52VwYOrK2JMwYV4=; b=ScthRZ6DNAviUnOj85Rg1Fjdl2
 Uj+ZAz83RPTtMdfrYHmwKWf9eHWOatpTop7cPwO8xomalqfQby7oRrpbRLQoqOQIDbjREUzby4jm7
 CQR7RwuoN55AeS2P1f7q32oFtk1V7HvXFbGvPxA9vSmsDLnWpxqK/XffYJkOSNp/AzHo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2jDS-0005ZP-GE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 586FFB80B3F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 00:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874FDC3411A;
 Sun, 19 Jun 2022 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655600088;
 bh=x7abiCbuk7wG6GSu3AHKJhPYVCZGlCbAAv7OGXYdF0Q=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OvAsvxp4psgzvMUwuYyixp1E0jUGsrpfqQdfTEpsNMOb2VVMK3uqwwX0JYwd4Siar
 UE52grnjeBe4P3Dcb4oxQJvfqwQEzowGcVjmUBHL8mWglQfqddmIkDJq6PLdO6Czti
 oLcckR0w90VYQ4+VAJsFNbxG3LNS/H0CsEYMEgkXj9aQFhhlESgOz43CHai469QzFC
 2qNi05aEpVR/+m0imTv76+GAGzDBfcBPVyJGK/v/sljnfJU/FKYHrEJYH9uX1HZl5I
 To/8NFGYJ7Bq3CCNjtw5NWLOwHBifm7beUYk/aRjjkMqQEAtMRONWdCZmpskOiEAOm
 jNizIGX7J2Scw==
Message-ID: <d826a043-0e2e-889c-4bae-63738867a3b4@kernel.org>
Date: Sun, 19 Jun 2022 08:54:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <20220617223106.3517374-3-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220617223106.3517374-3-jaegeuk@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/18 6:31, Jaegeuk Kim wrote: > Let's try to flush
 dirty inode again to improve subtle i_blocks mismatch. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2jDS-0005ZP-GE
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: do not skip updating inode when
 retrying to flush node page
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/18 6:31, Jaegeuk Kim wrote:
> Let's try to flush dirty inode again to improve subtle i_blocks mismatch.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
