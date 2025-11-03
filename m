Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA27C29DCE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 03:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vh8wli4J+vD5iLkInm9Kdjb+DIPm7GgjAMtfdQk+wAU=; b=UwIp3jfIyg+k/Iv2qP2T/3rSTT
	QOfmJt/KP+xCtyti/7mVK8mUuZRMjSfRZaKqPLiGwqk6GTtCdB2y9RQ2WX3xtxXrVO/nFZ7grwVrl
	YhCf36QHV6adxtnHtAYgisDPkVlPiamUXkT33YlAXmuRmsGIQNqHsU5iir57VGVS1Bcg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFkMc-0002XX-Uj;
	Mon, 03 Nov 2025 02:32:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFkMb-0002XQ-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U8wzth2hYs8orZkp8oXFCmIaOCo/+QQFJi6clGBKgNA=; b=JeF+oM49eVfpDDdN4m3DusztOH
 4uobVKqxrMPBQGaG7Y1EKKDADfLjsGM//vjUtxPvR8rhYi/c8LfZGoQkLXy3IF/l0VsGDL+ekaE1W
 HC5gD/DvDVEOuxrSqQ8hRrwpVLUkQ+24REwFjBzxx+J7//SoECWQrPy4QmQEjhwHIRN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U8wzth2hYs8orZkp8oXFCmIaOCo/+QQFJi6clGBKgNA=; b=TtvL0lrtG2rrR7aGxEyh1hVZjE
 MthaIYbKqzpB3pPLThCs/3SQlA96DoNWx0O6p6h8zZbX1Rb/OEfRRKtEId8yj4VYc1bi8/o+c8yyM
 SKfN7wJF+0/NRFOZEYmKIYEbrJGv29tbV/vXW//AZsPybLkKisBuI6NV/sIViJ42so40=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFkMb-0000Lo-7L for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EC7064436B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Nov 2025 02:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4ACC4CEF7;
 Mon,  3 Nov 2025 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762137118;
 bh=Vtr8xLqE/U8u7psrPpr6WVoJmFLmnRdNWlMXS2Zn6BM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aopg8xA+aBmDFKS9tuPwvbfkEG8QXZU8N4aJlZ9TuR3BhrNwxZ9I9zVLSCRApFcBl
 B/5tjB0Ihh4N0S/03xt+g2U0Y38Zn1nfeSQfyQ4I6uj1uM+55vsmYkc9nhxoa/tZyV
 bJdrOZr7g2RICW79Nm2wnrK8Rys7/f29z07/0TpGO/gUs4jEFWGGvYqUcQfs063G0h
 6gbzdDflATO2oJjvN1rRuEu0VQUV7s7+jFgY9ntvPRiDP31RpGW44qy1NQdLCslXt1
 pWK/eFTMLQFh44C4H6nLEwKKkGkkUbZ3nbjAUMQp7n4Rr/GxM5vA56D2/zpfMvQTGO
 9n9NjG3Iv7gKg==
Message-ID: <d52e6fc9-9285-4e49-addf-9d6b7eb1e6e1@kernel.org>
Date: Mon, 3 Nov 2025 10:31:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251028195444.3181203-1-jaegeuk@kernel.org>
 <aQUrtSAXWtHtLhtm@google.com>
Content-Language: en-US
In-Reply-To: <aQUrtSAXWtHtLhtm@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/1/25 05:35, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This adds a tracepoint in the fadvise call path. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
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
X-Headers-End: 1vFkMb-0000Lo-7L
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add fadvise tracepoint
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

On 11/1/25 05:35, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This adds a tracepoint in the fadvise call path.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
