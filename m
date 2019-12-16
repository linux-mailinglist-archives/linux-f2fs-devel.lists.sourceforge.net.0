Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43440120727
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 14:28:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igqQT-0001OS-2T; Mon, 16 Dec 2019 13:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1igqQQ-0001OJ-EP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=en62J9Sle+YYjeP96DqQn4yayB6lPx6YOVyC3LY1Kis=; b=c6cVgEMt4mG0yekpffoYlA7prl
 3rLv5YUMlDDIQeHLePxO8nfO0uKPT4XYuTyR9kekbxSCLe7qh8oWtcTMISf3Sj0qT2M/9jP4OuYwh
 HGXC5WyoL5qBLRfVVSxRkQX9dZ/QYSPWks9bT4+1G9IsNE5QnOUO3ZNyS7H+P4M4O81U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=en62J9Sle+YYjeP96DqQn4yayB6lPx6YOVyC3LY1Kis=; b=OW2hKycPH2MSm4YgYeN6ddE6sp
 pJDNK8j0ZKcz++XXsFpDssOi8atmbzloZwkASXV7sBC3nBoTfRyoeQTDpFYfZ3TeOb7ee5E/HuklE
 crcLPC5yPwsx2cn4uHQnbgNRTC34Loy/zmoPKrQJ8KiLbo5AYIAAhOkEvkvj9SuXXbg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1igqQP-006od8-9z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:28:38 +0000
Received: from [192.168.0.114] (unknown [58.212.132.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC3C0206CB;
 Mon, 16 Dec 2019 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576502905;
 bh=en62J9Sle+YYjeP96DqQn4yayB6lPx6YOVyC3LY1Kis=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=dbGzyJj4vH71sNkYyLTdAqtPy1ugCsqngU/6RSks1Og8gfuhSodwPMPwzEwhunxwl
 FIlvIXutM7Pca1Vn7QSzPyR3RrEXn4vBEOCBraj/GbxH2hjDROvOF6VqDVuFDoChqQ
 E4YdEa6hbIMxg6jYKvelWonDkjDPiL7aL4CVpALc=
To: Markus Elfring <Markus.Elfring@web.de>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
From: Chao Yu <chao@kernel.org>
Message-ID: <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
Date: Mon, 16 Dec 2019 21:28:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1igqQP-006od8-9z
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAxOS0xMi0xNiAxOTo1MSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g4oCmCj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4g4oCmCj4+ICsjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJ
T04KPj4gK2Jvb2wgZjJmc19pc19jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+
IOKApgo+Cj4gQ2FuIHRoZSBmb2xsb3dpbmcgYWRqdXN0bWVudCBtYWtlIHNlbnNlPwo+Cj4gK2Jv
b2wgZjJmc19pc19jb21wcmVzc2VkX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Cj4K
PiBXb3VsZCB5b3UgbGlrZSB0byBpbXByb3ZlIGNvbnN0LWNvcnJlY3RuZXNzIGF0IGFueSBtb3Jl
IHNvdXJjZSBjb2RlIHBsYWNlcz8KCkkgY2FuJ3QgZmlndXJlIG91dCBhIGdvb2QgcmVhc29uIHRv
IGRvIHRoYXQgZm9yIGYyZnMgaW50ZXJuYWwgZnVuY3Rpb25zLi4uCgpUaGFua3MsCgo+Cj4gUmVn
YXJkcywKPiBNYXJrdXMKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
