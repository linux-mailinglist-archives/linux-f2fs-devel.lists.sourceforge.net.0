Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C1A7F351
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Apr 2025 05:49:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1zxW-0007T1-Px;
	Tue, 08 Apr 2025 03:49:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u1zxU-0007Sv-Nw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 03:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6wqvbYRohCGNs9AIaYfv4ZPy+RwC9+P+yCRuERb5wSA=; b=RIP0VPpX/7RCHeRSVX55Dxurxk
 LclC+acFX8AIECkZ2vDYvkKqdkbKj4X3tEbXjzJBcR5JYICsCDLx96ohtQaWJTUN/9Iw57UR0wpiV
 pnNeRaebeRUn6r2gVm9jjTOenWvKJbcYE9Dbn1pTWUHTXSjmMywbCJhVlYVDBTuEdqjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6wqvbYRohCGNs9AIaYfv4ZPy+RwC9+P+yCRuERb5wSA=; b=UsIRTLcqpe5rV6ZlrMZZbFqoTP
 58iu8Yrt2LNth2vPJ2L/AZnALfQ7sZwnHoMYHiuJkmBfLSA9V7Sbw/BctPw8eoJ4WEWR7Pm/AOtSe
 +r0mqAn8x41vLe4yWKoo7eytW6USG0NS7gQw+KikzQ9QqaH1nXRjlpZIZjfl7UgGjHtc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1zxA-0006qk-Ra for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 03:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B0496115B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Apr 2025 03:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4642C4CEE5;
 Tue,  8 Apr 2025 03:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744084117;
 bh=KB4Y/BMeUDgmVjp3gxCOOYO8zP35SnNcs87GAcd58VE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sVekWiWMMsOVnUX4yuMjcz3RXytLcjFZMaN0EyKJCIwfjxVK1qSqgIZpT9WsUV+7c
 D9yAjzIU1Df3VmSxgzQtnixgZkc6HS9UlYBJ4MIcpCDh4HprMfGS7aTzzKflouT7QY
 7bCN1tcjM2o1fltoPh/UcelC8cERxs9LqHyC3GiVEij/TkhidJxdWPQFn7zPm1hvHO
 l1Z5KGnRUT3A0YbWW4LBG+15kqxlugevnsnzMcTAgFgeKQtSEYuLpBzQtlLutRpbZy
 iIunf5TJXTqHmxtVUfUf6jarb7J1aFPBgflC1wmpcXKWNDyxtG66lD/uR5vl1wzbBj
 LWPM0t6xUCTKw==
Message-ID: <dc9cec0a-276b-41b4-b484-adf53c243ae8@kernel.org>
Date: Tue, 8 Apr 2025 11:48:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250404195442.413945-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250404195442.413945-1-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/5/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 No functional change. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u1zxA-0006qk-Ra
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up unnecessary indentation
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

On 4/5/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
