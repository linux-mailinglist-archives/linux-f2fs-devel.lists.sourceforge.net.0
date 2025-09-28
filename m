Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE4FBA6D9F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 11:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QM4QDJL8Cw5zZcJHpVpHqhhaytT9u0ZL03bNS471qY=; b=T6w8roJ1uRigAWmQYYar+PFsk7
	B0CQzfns482Md8NFfsXNR/PY72vs7Xm+Xsq152JNv4rA9vbntomA25tapSdhgYIlwmVBCwJz/TmC7
	SrYs0S+oW69ALNfBpbDX9x/qEtimrOCt1LUKUHHv+7s9B9jwMhWKwaVztW0FL1mVKTa4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2nk8-00024i-Gz;
	Sun, 28 Sep 2025 09:30:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v2nju-00024R-IT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 09:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jm4lpcGHH6QufM46bZuQqCTq5oZuUOQh3Q+OzEHATwM=; b=bZoh3e/L8XxvJAaQl8p0WqizrV
 YB4gaQX/P/SgPz6hWC2MVy3bY7deSKXtB+shgGwAyoG8qLPnOXNC5xq3l3N/eSKPkdXfqmPBN5qpJ
 5wrXJwMnHQXoff23Q6Vo7LbaI8/+/ZUnBEMxiTibhuSin1CuQq28nHgn+y6x8rnyQBhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jm4lpcGHH6QufM46bZuQqCTq5oZuUOQh3Q+OzEHATwM=; b=agriZuxtSIYgpbOpj7UXe34ZXs
 k8lRmjEgAlZ2G5ff7vdk7PDbf+gxnZvSv2lQ8+vFiPYcBpZDY+8JGiqCNt20Zz3OoK7GdVhieJriK
 /OdX1CIYnTcYDZOJ3fUr1beOBmiSx1rCCP7sEIv7kxusLgJsqmQhGFnRxoSwkGO/3Ojg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2nju-0006Nx-5c for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 09:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 72D586212A;
 Sun, 28 Sep 2025 09:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E74DC116B1;
 Sun, 28 Sep 2025 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759051836;
 bh=Azl5SLDOTEZ7t3KEBMBXasVPE/4KvOxX1+sg5HSVNMU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vC3eo0/pn7J9kdVw/Dcs59pXs6c/8W+0fuS1sKaFu4TFTpX/OW5zI7x4gZ9B3SSIm
 ib4e8hYM3KWl8ow+0K/ZzB1wOF/P61RdvEMSbIN1PjwBEGNAHXPmTHLpV71hJvzrF0
 wxcn1BvZtpBVUVv15/4fSRcA7DCoYmQTF8ORzKQs2JXnm9BzKCAmgj7qWbW0GO1NTK
 2yi/p0dB1NdMYt8/EsbGZeGckcw06RPwefYfPjXsxa8EwqmJCv9y5HMd3kt4uQOkGg
 ZtgI68hnXDTEiox3K29RYxDWv4nx+hfIwn5eUYWFtgppwEWScuvH9Hms7GXJOdIeUD
 USjgVuywpFWZw==
Message-ID: <1a931cfa-0846-488b-ab1a-f3dee33e1d21@kernel.org>
Date: Sun, 28 Sep 2025 17:30:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akiyoshi Kurita <weibu@redadmin.org>, jaegeuk@kernel.org
References: <20250926180134.35329-1-weibu@redadmin.org>
Content-Language: en-US
In-Reply-To: <20250926180134.35329-1-weibu@redadmin.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/27/2025 2:01 AM,
 Akiyoshi Kurita wrote: > Fix two spelling
 mistakes in the f2fs sysfs ABI documentation: > - deivces -> devices > -
 substracting -> subtracting > > Signed-off-by: Akiyoshi Kurita [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2nju-0006Nx-5c
Subject: Re: [f2fs-dev] [PATCH] Documentation: f2fs: Fix typos in
 sysfs-fs-f2fs
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

On 9/27/2025 2:01 AM, Akiyoshi Kurita wrote:
> Fix two spelling mistakes in the f2fs sysfs ABI documentation:
> - deivces -> devices
> - substracting -> subtracting
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
