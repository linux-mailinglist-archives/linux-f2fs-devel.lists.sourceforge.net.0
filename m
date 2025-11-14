Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62010C5B42B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Nov 2025 05:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6NSb+KomNI7k1LwQ2107iY3rjC0ExQIo9+7LnpYNBE=; b=kg1nzfiIwgVxXvozFAB9XmTXLa
	2wBFpz9PB3ln3CbuTJTKm3an6PY3dUBDswVf+PN29I7gMUJ0aIzIhgNCYQAgTfzIZH4awjiCurnfJ
	fGH+olNYNaaG7gi+V+0aYmLSFm3kHtbJRDBKq+yW2lIJc1HOS0Sh2hbEVwSBV0DNc3xM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJl15-0002fv-Js;
	Fri, 14 Nov 2025 04:02:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vJl13-0002fp-Uw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 04:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/usiQON3pYCi8ggklaXbmAhXFnX55Fplsby2rUNVYNs=; b=eV0YfzoXl33+Hgg5MwkSBNVGfi
 sl5XNFA1S8/lAP2BniOWROF+qVOatYW6YYzIf8GsaouxfJqdR0EJ9/e7mKf/ohmBdPswzC8Eqwicn
 xslXU79hkoONOeYMX2ap3JjP5OJSzf4gmGsErgA57nqehzltWCOhisrjHLW4GfAbKygM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/usiQON3pYCi8ggklaXbmAhXFnX55Fplsby2rUNVYNs=; b=Q8oODYWAv7ODkTi7tXzkHUmBRl
 1jKbdbGUdxkUSz/31/TghiH0jD3JuNSHFpqd/nRlp68TrLGhAn6P8Rl83fOQKaGuxln8ki39F8b1P
 9SovRY/q/IRvTmQ8uJx5RFNgDbcMnE9dN5GQVy8lFxFu16gMfm1FySvFLis8N+nWLXQk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJl13-0007Xq-Jq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 04:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9482060128;
 Fri, 14 Nov 2025 01:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293F6C113D0;
 Fri, 14 Nov 2025 01:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763084038;
 bh=exd2h08pVhf0aUPP9p+4zI9UBcu8vPVvEmGm5+1BvDM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=U/BYxSr0qJBjIzslnpNC8OzZLZc/dKzCVzlVHejsfPg1qDHBGKaUO8PKqFle1yigh
 G5w8Kbt82z58SfqG4xbBksiKPBkofUXC4C0ScXTyqwo9nfN1uwuZey24JqVggGfKsE
 H+BraAUDtBFqVHhxzU5B4xwdGpU5i+BOArmPeY4Vz/jv3ih2axaHwX1uq7N1ORaMnz
 3a0me02xa7RQZJgjWNJLVai3Qxv91eQh5sOY9DA7GHFeRSRKbfGbTT0y3ihqSpK5wU
 bLM1MqbnHIQ23EOJvnmicTwBYMfz2qMFFaHLiHUd7i3qxHn2iTt6FCbF6Tx05OEZzn
 b3VfDfcxknetw==
Message-ID: <98034c77-5e47-43ea-9c45-335e2cd51b68@kernel.org>
Date: Fri, 14 Nov 2025 09:33:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 Joanne Chang <joannechien@google.com>
References: <20251112135223.3467852-1-joannechien@google.com>
 <20251112135223.3467852-2-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251112135223.3467852-2-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/12/2025 9:52 PM, Joanne Chang wrote: > Add test cases
 to verify f2fs's support for different versions of the >
 "test_dummy_encryption"
 mount option. > > To ensure test robustness, the MKFS_OPTIO [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vJl13-0007Xq-Jq
Subject: Re: [f2fs-dev] [PATCH v1 2/3] f2fs/016: add test cases for
 test_dummy_encryption mount option
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/12/2025 9:52 PM, Joanne Chang wrote:
> Add test cases to verify f2fs's support for different versions of the
> "test_dummy_encryption" mount option.
> 
> To ensure test robustness, the MKFS_OPTIONS and MOUNT_OPTIONS are
> cleared. This prevents additional options from interfereing with the
> test results.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

To Zorro,

The changes look good to me, though, still I want to confirm that whether
it is recommended or not to add new cases in old testcase.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
