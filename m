Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4CCE8D2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 07:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H59uNiDNBIpQ8DENgp8ZeCSelL30k8UWARkmR05HbYc=; b=Mb6oVtOVANLpmbafb+a7wi/etN
	+eiNtDH6y1tB8Ed65Ywr/kHdAEM4A+rAk6A1aqwAuzJJFYpUqYGvG7b9TjbgbnqzlkUzv9NOuMNlT
	oJPNyp1c/9E0t916+dN+GdLKjViLP9ngD4RyVjasQEKn/eSTs4Drcuh4sGMSPIxApqto=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaTZa-0003aX-Bk;
	Tue, 30 Dec 2025 06:51:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaTZV-0003aN-EO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUN2VXk73Y6i98c4v2AsZB+58DbDELsma/PddOTsA2g=; b=OmdLC+xBrqta8rbrSHQPQME0tx
 xkXJHqxEPYbpw6Rctna8dEqAnK820x47+SrD/M64Yq8nGOPKLPzPL/t4n2VOl0YRZK+NhcgDq3PO0
 ND2TbqAJpfEtEitarTa2CUkjCUAv8mZn7jI3Xs3YHv1R1A0+Z01a03KM7V2ebIyeyXkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PUN2VXk73Y6i98c4v2AsZB+58DbDELsma/PddOTsA2g=; b=cMrzHOt2tcsjbbCq1OhajD41YD
 X6VafAcOlEN9XsZ2cdSm8SOOvPn02HTGRCOZyJj728+QUvNOBaMU5fjUYBHOp/Vnt/o6PAmMBOvUu
 UVQuUa5W/BIOANhf+byjG8eysg6CjjqB0n84RQSAB7d67vvU+CAonDpJSeRy5t7r/xnM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaTZU-0000EH-Rh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31CD76000A;
 Tue, 30 Dec 2025 06:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD89C4CEFB;
 Tue, 30 Dec 2025 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767077457;
 bh=smsF8Mhgds5yGiUmznjT4XvBCIp/w/d7S8e6kStjH1o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TTUbkXwmxzrplr0k7hIxMNYyaC7nb029A/02lXglMkf3cMeO3KHbj30aJLxhuOw2k
 u9eQ2AYhHdbetG0ZLXzKrNfJzsjGdu/HkpmVHDCy9JoDK9QtgxpS7+kOpnu9e66S7m
 tBKV0vat87XaAmEXG3V8K1QV8maxsQGfJ3T9f3AczZNRwtS4Cscdbzb25fjrSb7kSL
 U0lLH74qVg5EeWcBakI3Y6JjA1/LtsddnWbOPHMlrPJDTuojQz6ztDFos4v9d2xWKF
 QvPpB+yR8nvG91idq8tNgKlN4q3oNsDcwfNmtraldzcEdE1NowS7JSsWqTMPOZBMHJ
 L9h6o5YXAvzJw==
Message-ID: <6520fb7b-2806-4bb8-9cf4-7749372064d4@kernel.org>
Date: Tue, 30 Dec 2025 14:50:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251227073430.193054-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251227073430.193054-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 3:34 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During data movement, move_data_block
 acquires file folio without > triggering a file read. Such folio a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaTZU-0000EH-Rh
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: remove non-uptodate folio from
 the page cache in move_data_block
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/27/2025 3:34 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During data movement, move_data_block acquires file folio without
> triggering a file read. Such folio are typically not uptodate, they need
> to be removed from the page cache after gc complete. This patch marks
> folio with the PG_dropbehind flag and uses folio_end_dropbehind to
> remove folio from the page cache.
> 
> Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
