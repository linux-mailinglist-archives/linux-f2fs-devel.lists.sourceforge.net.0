Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D64DA364823
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Apr 2021 18:23:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYWgA-0005XA-Sc; Mon, 19 Apr 2021 16:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lYWg9-0005Wm-PP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 16:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksnbwH+b/1JvxUauEQ3ELnk6A5izHkkcYYwYcvCZOm8=; b=FtN2w85EGJK0Qwl0Pp9cUodDb8
 fteEyWJmRxSaKrDtZz6tvh9osJWRuOZTlpND4VAI9xBbfWPxQ1gCUSn9uGpfGxELHqDPIrPCVGqL7
 DOudNEwZ+faNx2TKq88pMOhoMyAIw8aTQtZMkBI9YrkollqJv9kPyRdKyTc0GbsEn5C4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ksnbwH+b/1JvxUauEQ3ELnk6A5izHkkcYYwYcvCZOm8=; b=KOj7CUBxWRHxw+4AlNJvOcxdqV
 LrzMSpjnsb/rPyGEfQZACa9/2aMDXZn/EyV3G+UUG2r06vFKj9ryRez30UmaviTR7Y8nbcxl4eEl5
 0YMaiZTivwyY0a/E5v1Mn794Q9wjtxyPCv+hG7kh1apIHepf1qEFzzhvGFPju+fThWvI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYWg1-00FQ3F-99
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 16:23:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DE6961077;
 Mon, 19 Apr 2021 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618849378;
 bh=TJaEbtWAF4xhitySFEEl3LLw8We/pR3PLIdhLwRUsxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5I2tAlCss9GM0fx3+yBuG9LZhKoWaOjxU/puepy4LdWqpENrP3m5kC/JBWyj867T
 i4Jz7fQZxEcHzNQr8SiZjOa9PBvdohbvHjPhFb+PEzq0/f1NMg9UiXN4B372VTQO63
 45AeFhxkySiNCGH96W/bZnh0FadYlm9xrLEBQx6bHKjurTKt6p30iIdsqdEMkHnOgt
 DWifjwENZhCZ8wpTWNVuoBUuDBwfQnIbv26JehbiUkklpY38qEwxKmDOHn4d+ZhIk6
 sd9Jc9z338L44WYo35Te+nFuzcm40GbXfePVmGwEhwxHMs9OLLO6Nf/uI8R8hrS47B
 X8cucDRqFtn2g==
Date: Mon, 19 Apr 2021 09:22:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <fengnanchang@gmail.com>
Message-ID: <YH2uYPmJBvZFqIz+@google.com>
References: <4dc282e0-b41c-caf2-c2ff-a6372e60a906@huawei.com>
 <20210417070251.42979-1-fengnanchang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417070251.42979-1-fengnanchang@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lYWg1-00FQ3F-99
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUkZDIFBBVENIXSBmMmZzOiBhZGQg?=
 =?utf-8?q?no_compress_extensions_support?=
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
Cc: changfengnan@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMTcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4gSW4gdGhpcyBwYXRjaCwgd2UgY2Fubm90
IGhhbmRsZSBmaWxlcyB3aXRob3V0IGV4dGVuc2lvbnMuIEF0IHRoZSBtb21lbnQgdGhlcmUgaXMg
anVzdCBhIHJvdWdoIGlkZWHvvIx0ZXN0IGEgcG9ydGlvbiBvZiB0aGUgZGF0YSB0byBkZWNpZGUg
d2hldGhlciB0byBjb21wcmVzcyBpdCBiZWZvcmUgcGVyZm9ybWluZyBhIGZ1bGwgY29tcHJlc3Np
b24uIEl0IG1heSBuZWVkIG1vcmUgdGVzdC4gIEFueSBvdGhlciBzdWdnZXN0aW9ucz8KPiAKPiBJ
biBteSBjb25zaWRlciwgdGhlIG5vbi1jb21wcmVzcyAgZmxhZyBoYXMgYSBoaWdoZXIgcHJpb3Jp
dHkgdGhhbiB0aGUgY29tcHJlc3NlZCBmbGFnLgo+IDEuIHRoZSBzYW1lIGV4dGVuc2lvbiBuYW1l
IGNhbm5vdCBub3QgYXBwZWFyIGluIGJvdGggY29tcHJlc3MgYW5kIG5vbi1jb21wcmVzcyBleHRl
bnNpb24gYXQgdGhlIHNhbWUgdGltZe+8jCBjaGVjayB0aGlzIGluIG1vdW50IHByb2Nlc3MuCj4g
Mi4gSWYgdGhlIGNvbXByZXNzIGV4dGVuc2lvbiBzcGVjaWZpZXMgYWxsIGZpbGVzLCB0aGUgdHlw
ZXMgc3BlY2lmaWVkIGJ5IHRoZSBub24tY29tcHJlc3MgZXh0ZW5zaW9uIHdpbGwgYmUgdHJlYXRl
ZCBhcyBzcGVjaWFsIGNhc2VzIGFuZCB3aWxsIG5vdCBiZSBjb21wcmVzc2VkLgo+IDMuIElmIHRo
ZSBub24tY29tcHJlc3MgZXh0ZW5zaW9uIHNwZWNpZmllcyBhbGwgZmlsZXMsIHNob3VsZCBub3Qg
c3BlY2lmaWVzIGFueSBjb21wcmVzcyBleHRlbnNpb24sIGNoZWNrIGluIG1vdW50IHByb2Nlc3Mg
dG9vLgoKRG8gd2UgbmVlZCB0byBzdXBwb3J0ICogZm9yIG5vbi1jb21wcmVzcz8KCj4gCj4gQW55
IG90aGVyIHN1Z2dlc3Rpb25zPwoKU28sIHdoYXQgY291bGQgdGhlIHByaW9yaXR5IGZvciBhbGwg
dGhlIGJlbG93IGNvbWJpbmF0aW9ucz8KCkUuZy4sIGNvbXBfZXh0ZW50aW9uLCBub19jb21wX2V4
dGVudGlvbiwgZGlyX2ZsYWcsIGNvbXBfZmlsZV9mbGFnLApub19jb21wX2ZpbGVfZmxhZy4KClRo
YW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
