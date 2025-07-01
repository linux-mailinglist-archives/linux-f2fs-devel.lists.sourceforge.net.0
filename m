Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A06AEECAA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 05:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl39QUwVWczQ/GY8MEvbtlfOiZPdl13/e2RgnfL+GO0=; b=HcQ6oYEMBxEwAcGzib8vFbAy6J
	9sKwYxOVv+zwhmJRicnxorSq2hG+IveHjidtevqeEhRVpiJPdZW0++AAuiBBTQUtWx+wAdblyRqQg
	JSjlfxiRMWIK3WXDpLGNW84fLbjjaeBqzyoUujNYnnRX3BExtiLemMRbhEu8jlnfQIoI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWRGL-0002Vr-8T;
	Tue, 01 Jul 2025 03:02:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWRGJ-0002Vl-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWUERzLIdPUE9mQSzT8K540zJJ4l6McRPGd0u+C8gqg=; b=Ob5KTRkP0C3R0DF5VhxrAuH5gv
 anBkpJFpfPGdnkOo112mnxlX8V4+dINWXztbr03uPaQkH1b0ZCxSP13QMrbDWAkgVmceL7Ay4Srew
 grBc1J0oV6Idy6H9VLOdgj9g64iHLvwRU+s7nrfBZUtfMuAY2jFR61o1AaWEGx8XZy/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWUERzLIdPUE9mQSzT8K540zJJ4l6McRPGd0u+C8gqg=; b=lYYVYUTAEW2aF8kgdjYfzGtMO5
 kF5ynN3/CUOqUDcpHKFfwaoq9gyY4m1pKjdtoEObQMg2lYAESPn+w75rpUwYsPZJwCLf/wN4iPCNB
 tcqUy2O/qxbecLteI6AC/GI4iZSVORYd1Lvut6w6vpCi7SsJr5hfdx4klv0fr1EELIj4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWRGJ-0004FI-FK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F3CF60053
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  1 Jul 2025 03:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34883C4CEE3;
 Tue,  1 Jul 2025 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751338936;
 bh=T73PpAtWjzKiK8i7MFRvCRqFPZUJSNtiaV3RngKA+lc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pnMYzUIsC5fsMLFkQpFiI98eybIxkXXwwklVif26LhcokBMdKQgvgd4FoN1xa8Na0
 0BeahD9lrMb581q0GTnMfWKGRmyk0INU+0jeKa4+Bx3NxA6TwPvo3k+VHM7XxhDbrK
 Q0MkDvshe/HPxlz5G2e1uW0wq0zRHbjFatQBEkaEHmF3QXaWKQHjBeN9jd/4WQcnG/
 EGyX2kwQsIk/UXdWltwmoMjRUX344AU/pguARORE8zMJP+dF179UkL2Iay8IOD4C32
 eD/XPUxcRtOtixfOH51JC1COr5k1LgQ6Gu0gQ2L0teu+HFW4amnjBVcYFFpc6xoJeb
 lfJ5GjC0llMzA==
Message-ID: <75e13ced-d82e-4d42-a9c4-5633e18a410c@kernel.org>
Date: Tue, 1 Jul 2025 11:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250630160839.1142073-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250630160839.1142073-1-jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/1/25 00:08, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 Let's return errors caught by the generic checks. This fixes generic/494
 where > it expects to see EBUSY by setattr_prepare instead of EINVAL [...]
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWRGJ-0004FI-FK
Subject: Re: [f2fs-dev] [PATCH] f2fs: check the generic conditions first
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

On 7/1/25 00:08, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's return errors caught by the generic checks. This fixes generic/494 where
> it expects to see EBUSY by setattr_prepare instead of EINVAL by f2fs for active
> swapfile.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
