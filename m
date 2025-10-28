Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D55C129BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 02:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i+eywkxuP3TQXtB8qdSXBjGPFiyYfbSyC44M20TlAA=; b=Xr9UqJFZ8OrFaWuwafv8syPGQF
	ohB7pRVV9NlQdahkBRIWW7EUxvO2Tc5So70LHetcR4eQdN5TIqvhyBJxIkVnQ2pCpM2nzSPMJGNXR
	CCt9ryJTBWF7n4txpTnW9U1Uta70I/sYtF5pM/q/8lKBfDLlYSSY4gzJTog5FwRPuvmM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDYzv-000280-Ur;
	Tue, 28 Oct 2025 01:59:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDYzu-00027t-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 01:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aTheXfKpwSC2maQfLJivkVeOXNGCwg5yb8brUfXt0I=; b=mQecyr40POQRg3AQNxMXLlbBFx
 HOkXVosUXPE5h7Sp4wASXgfcDW4V5HhHc6HGoUK/vHy8M+mREjy8MT1jYwiuZYyqPRB1MQMTzn7GI
 7yXas8iX/kSnjRB4/ubpR5lb7zXh53d5ecY+r757Li7NsBm+x6W/sWzt/s3v959gkDGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3aTheXfKpwSC2maQfLJivkVeOXNGCwg5yb8brUfXt0I=; b=SpUwu65BxQ7VeR3p8akwkAGa7N
 7F8P01LUXRFyEw8ZPUKDKpT59HT0Cv/tvyNnb1w3HOOSMHcfHgrYQgCShgrL95r5fvVqAFCi7lkJ7
 9roJKME2Zp23ykWa7QTwqnaLCziJEb+79oJT6WQj883z4yeweMsqCzGHeMkZR3+qQeWU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDYzu-0007dG-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 01:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F5614016C;
 Tue, 28 Oct 2025 01:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A9EC4CEF1;
 Tue, 28 Oct 2025 01:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761616777;
 bh=Vc9AQ64yWiL97TyVndEKNofGSu7+fEvXlc/ISZ7SGPc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VSdhpUTqihs2yf1uKPqdyG+7FXYJSS04FXh9GL1L7QwdP6tD1F73kSixIo7zTADGr
 NePF/FMgZJP6H3eLrNsUR3AosYN83X9JBslAAgUkV6eepQ8Yb+b4IY5upgTlAsDR0P
 ktWHyWRoEuG04FFV7MBSzoOEb+drjqkE0j1XE9l6gHP8l0sjZw52gWyJeDrawDfdBm
 FH2qkk7zDbxAALld52IU/JFWXzh3As64AEyFelMSLBFsfFkc58fsTldrmfJI+9Klc0
 USRP7RC+q3OedvWoYJyn9VXK4Phg6ike5XwPTx3vHHJ3+CA775qBO64/tXsKAp74Dj
 S0fdSHBeNuPeA==
Message-ID: <f3499ece-d4ac-4329-b0e1-3cf08619c4c6@kernel.org>
Date: Tue, 28 Oct 2025 09:59:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251027185307.3680345-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251027185307.3680345-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/28/25 02:53, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Add a missing "device_alias" feature into the
 feature table to show it > properly in print_sb_state(). > > Fixes: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDYzu-0007dG-Gj
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: add a missing device_alias in
 the feature table
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/28/25 02:53, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a missing "device_alias" feature into the feature table to show it
> properly in print_sb_state().
> 
> Fixes: 8cc4e257ec20 ("mkfs.f2fs: add device aliasing feature")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
