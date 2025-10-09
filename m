Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 232BFBC732C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SjjMOZMnbTpeZ2SKJ/4+QdoyAB9sMkZCZYb9pRjfSU=; b=EgzzRlBsgmtTk9XE1pYLJJVyU1
	MezGBHbwnsw1c0aIInCKRedxiKPmfawgpy1Ey+Mzx2bHEvcvlS2rbo4mmSH8RTgiPCi/h9b+QO4Ei
	zgc+zmjG9SjnGh2jyC8CYLu/F1uErqs4Sol9D7X44lZeI4hg3ORiLD2xz0KooCrjOyck=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gQk-0006Zx-FP;
	Thu, 09 Oct 2025 02:30:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gQj-0006Zq-KT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=; b=ba9JY/fymoJ9oqQQfuFgC3Uc+9
 mSEvlv/mBYsCScEcG7MfZP+6AbL1eWi1oFHd34fvOWjpTLXYZfjphKGJq6A7TQBclQbFA3cbEZ9Ix
 Lw1CXV9z0cV24Mxv6g597RyUbiIyXKfAuYGaYShTj3xB+jdnPyiLxn9MpvjYT9Gmk6sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=; b=kVaGVN4XLXny/lRnwkt0aRyz5P
 VRR//tIJPnWAhOPMqCmpb9xRncSGAhMlt4QjZ7gUbt1rxZVvqdpD6tM8XtW7oUznPqHVr9jsrNULb
 0cnVJIchU4rfIgQz7vtd70fEhM4qk3plrKobM3nNX5o2BwvNjHY2lHjP54qfesC4STZg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gQi-0003jv-UE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 166FC62135
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 02:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F088C4CEF5;
 Thu,  9 Oct 2025 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759977045;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fmH5pYb0JLA3pqOHEl8UPWxtk7//bZ7YK6y4oYEIW4brBeHyFStrULbz6IU7Xzb/k
 O/SqtiEeug7CwFmfhn29rbNHushmJIcY4+9NYtQyztfMFRjcdXJqvA42TpzzFNI/Fe
 kYavfMsh0PWOIozC8vOiBCSwWGWvzrMA3C+XSKX9t7dWNAmhv2FoRVkfl0QTotBdTO
 s1zBzzwrE+O++mQx0gWmjslQshkAShyx/pQY5M99UeIMXLTUaAd3ubp0OOu/S5MBcZ
 sj+FiaRMmH+LRvseSORdn/7BTwNFCLdthLImZYF20Azs76fZ7gWYKxIQWQduGCShKC
 sKhHte1xXi0mA==
Message-ID: <ccdbd2bc-13ea-4a2b-af1e-c2e7cdf90e2f@kernel.org>
Date: Thu, 9 Oct 2025 10:30:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930023704.3019074-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/30/2025 10:37 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6gQi-0003jv-UE
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs_io: measure a fsync latency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/30/2025 10:37 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
