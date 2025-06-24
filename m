Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0091AE681A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 16:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQa5dQbtILTh/HJs7i9my3TNcukXcbCrdekmmUJ3epY=; b=KQupYg7IlVrkzPfuY5DYI21g7d
	aJe2PxMm57mDoebP5LfckmcOz26ITehGQtd0iiYBAY8V622FHh37Q7A/rxiZ+BNg/lUMD3sVKq/+Z
	Vx+TfR9CEg+xmQ0qckrjQyYl/9uLVqf65y96sA5a4ZdZRzLJSj/TOdcsvai4aOp805YE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU4SN-0007TY-LN;
	Tue, 24 Jun 2025 14:17:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uU4SL-0007TK-Uy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqkxz7+MGYMa5Fd9gaTCVqDEP5ueZ93PrOG0jipDNe8=; b=Mfs/SZbH9Owo9Xo83OgWYc46yZ
 f9+5RLmm+I4lPRHaTu52rm+xHCU2gzZZOj1uubvsYNX0RB2AIvAbQcKs5e7/YTdgEaROpuCsKhxS9
 kIw6QM3OMzsCOMJMRsLxv8z5a4mWAfHPWi14n87gS955wtwOfdYlbbvZ+qwT8JTgvyzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tqkxz7+MGYMa5Fd9gaTCVqDEP5ueZ93PrOG0jipDNe8=; b=Yv6IJp7J8Zb2w10QRHCW64HDxi
 MnA46ueYVxMzMtRbo/pJeIUXSLZHGuSyUiEl2KXS4u7mpvjiGh8q7f0JHR8UyCZuFSvqRlaRNA7I5
 cpKjI+YladaDdzcqqve/u6a3tUMsIkV2A7467Bw5NxQFRlDrEX37SN70v0nuZMt4C+BE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU4SL-0004Nc-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E681EA51C22;
 Tue, 24 Jun 2025 14:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D975C4CEE3;
 Tue, 24 Jun 2025 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750774610;
 bh=17L7ponko88riHevvmIv4qyXvYBhLHE4wx7OmbK6EWE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rwZ94aLG2J34d46JgW0UgzuNCLWzIl4Y9DSwUBVeWF1Hv0EeLF7YKKf2IGQ0OfD3y
 VCTTCqu6wSdbLk66Y/kn6YmgTiJp2VQCJ0nEUca78qnlsIRvQasldl8ftDVosrnUmq
 W2CAHMSvdQ8nqiW5XKd6ogdFjeVOqkwZiGHaLjMqMk/ZdmfK8oxko+pqsyZ0U+nUtX
 Aysu1zT5gozraHT8acwjE1A2m4PwEbQEtqb5Lt1W+2Vfi/HO6InMhDNYbXlqDyDLK0
 g5/2k7pZqvZTDAOJ5W+QYnCl+sEncFly2ldAd8c9clIXcayPrF/xaRWVDjCotoj+XW
 kwJaycCf1Z/vg==
Message-ID: <f90d39de-d24b-4006-aa09-71bcce5e4eb4@kernel.org>
Date: Tue, 24 Jun 2025 22:16:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yuanye Ma <yuanye.ma20@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250618225546.104949-1-yuanye.ma20@gmail.com>
Content-Language: en-US
In-Reply-To: <20250618225546.104949-1-yuanye.ma20@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/6/19 06:55, Yuanye Ma wrote: > This patch fixes two
    minor typos in Documentation/filesystems/f2fs.rst: > > - "ramdom" → "random"
    > - "reenable" → "re-enable" > > The changes improve spelli [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uU4SL-0004Nc-Iq
Subject: Re: [f2fs-dev] [PATCH] docs: f2fs: fix typos in f2fs.rst
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS82LzE5IDA2OjU1LCBZdWFueWUgTWEgd3JvdGU6Cj4gVGhpcyBwYXRjaCBmaXhlcyB0
d28gbWlub3IgdHlwb3MgaW4gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdDoKPiAK
PiAtICJyYW1kb20iIOKGkiAicmFuZG9tIgo+IC0gInJlZW5hYmxlIiDihpIgInJlLWVuYWJsZSIK
PiAKPiBUaGUgY2hhbmdlcyBpbXByb3ZlIHNwZWxsaW5nIGFuZCBjb25zaXN0ZW5jeSBpbiB0aGUg
ZG9jdW1lbnRhdGlvbi4KPiAKPiBUaGVzZSBpc3N1ZXMgd2VyZSBpZGVudGlmaWVkIHVzaW5nIHRo
ZSAnY29kZXNwZWxsJyB0b29sIHdpdGggdGhlCj4gZm9sbG93aW5nIGNvbW1hbmQ6Cj4gCj4gICAg
JCBmaW5kIERvY3VtZW50YXRpb24vIC1wYXRoIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zIC1w
cnVuZSAtbyBcCj4gICAgICAtbmFtZSAnKi5yc3QnIC1wcmludCB8IHhhcmdzIGNvZGVzcGVsbAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFl1YW55ZSBNYSA8eXVhbnllLm1hMjBAZ21haWwuY29tPgoKUmV2
aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KClRoYW5rcywKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
