Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC70AB4C50
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 08:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmAle72L0mEpHIkIEnlUEUKSdCO5r8cPpDt5cSRrNqw=; b=ifvvTRPb/b/IwdyQIi5CbNvyNR
	vT/jTSv5QsJDcE4nxt9LV/FsiIqnynZG1JJ+46dNfSwEcZR5+qXaejMMwp7i/PiGea08zq5Ygqijc
	yuzFkKyTjVXaYGXBayuJOSlI5Amg/Q5ecGd96umCCf5MsLujg8pIQ1luM8bxyHGV7rJQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEjTU-00075o-Az;
	Tue, 13 May 2025 06:50:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEjTT-00075i-3y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzI9wuZsX0c+aEwHOsYHKDiwXmJh18eHvFMXNicot7s=; b=awE9TYZXEw26PG9uo23bvIMOvm
 VEIC+gWXlOL2k+DRD7UzmTddUxIg7zF51BWPCinTscL4DQIaWQIThBRzZSVCJMdkcxHS7iUg0+P6R
 wRmR04sGvxOen8ertmsidiA/iYG3po+LZR+T+KTj4oxytVXtjUf7L8r902pwnxG2yjwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dzI9wuZsX0c+aEwHOsYHKDiwXmJh18eHvFMXNicot7s=; b=cNDXDUwDXbILTGViGsuvGKVGrF
 ro88WGHsBPf2AcUX5BAxKyfgAiwMcGi/7elS26CxWv5Z8b1sMyTZfKvWq1B9BLwB3vMrKcjllHLqp
 EZfh8c8YRAB9Zt4UOkH4DmG1ibwbjoracL6ThW4TQgcdJkWh3QtvJ6Ldr9m8qlfV/AfU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEjTS-0001f8-Ge for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCB4F5C54DF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 06:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475DBC4CEED;
 Tue, 13 May 2025 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747119035;
 bh=flc8P5B/Uf9EJkZiuUwECSnwOiL0huGmb8uCi1NsBg8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=K6ZEHFzpKpgmMhHDqK9gfiImn/5VbAwaGKQqF6/+2tqgn4zFOUJro5YDs6s3GSdCB
 DU6f+x850yF5EWG3Nyc8mIsa+rP87o0szCTcvu3zyu02ordJOExEL0n59moBQFje9U
 WGr9EHzLpB9PiFebogU3i/2MxWHmlqzKnEwUXW09UEglKH3w8UHwydVegw8d+HstYI
 nwnMI5W81NmS04tzZShOF+T5aR3h70GB6XpUW4Nmyqo870dY9xzVlg45H1Lso1EiP9
 RKi/dx9Bcv9x9JJF+mvs/6tVnuyNaLz2Q9YIiKORMM2ml/BLuB1B2xtsM2MVsHpuyQ
 Fj/vLocAzD/mA==
Message-ID: <bc9f75cb-bfc0-41d9-8992-b0bf86049b2d@kernel.org>
Date: Tue, 13 May 2025 14:50:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
References: <20250513054825.727898-1-ebiggers@kernel.org>
Content-Language: en-US
In-Reply-To: <20250513054825.727898-1-ebiggers@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/25 13:48, Eric Biggers via Linux-f2fs-devel wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Since __f2fs_crc32() now calls
 crc32() directly, it no longer uses its > sbi argument. Remove [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEjTS-0001f8-Ge
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused sbi argument from
 checksum functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/13/25 13:48, Eric Biggers via Linux-f2fs-devel wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since __f2fs_crc32() now calls crc32() directly, it no longer uses its
> sbi argument.  Remove that, and simplify its callers accordingly.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
