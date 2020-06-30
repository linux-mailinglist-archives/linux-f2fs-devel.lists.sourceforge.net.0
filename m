Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5F20FD98
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 22:24:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqMna-0002gn-JK; Tue, 30 Jun 2020 20:24:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqMnZ-0002gf-FV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6N+wYIGxnlFz1o+rGrGva/roykQ3/x8/8AfK/NJn09E=; b=ZBaqFs8pjEmE5usz6qn0svLe+3
 SZzeP+mFL0W8vOqJwULczXvFv9KpZWX/iCMaJqSSRiZygS4Lq8tnTb5rN4P2AZ9DncWpKEdRF0uPP
 xOSj2qObpF7z3NWOOqgl8rkYzNG7tsCmKxvwHCwxkNPYNFdBprau+hAiZ6446+J57YQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6N+wYIGxnlFz1o+rGrGva/roykQ3/x8/8AfK/NJn09E=; b=j9JWSuwAC/pxwjLElYlkT6FqZL
 NqykCSnLtPmZNSargmz1bdmP2IJm5jZmqQ8xVtyRK2dlMrEFe98yPFH7oJAonpt4mUPLU2y1lk8xp
 nKXpLXNcdpFw2CU+pqWf7O/7AwU79plBBqo2GGY6UYuvmX4q381Yrfh7Ns8C743C1bnE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqMnT-006Rm0-5I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:24:09 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9B38206B6;
 Tue, 30 Jun 2020 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593548637;
 bh=l9RYQ1V9rC0eV/2Cav74VbY6gmCMxIgckvz1UR0Gs5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=peu3T7LcDbJmZ6m1V77CJRMfLPcFdijYiYlvAS7BjXdj96eVSaImqnQof9UnF1h8k
 deyTLMmDjr0j1U7+Bs5iV/SpK7ZX71d6YqY2/bnENix7jEKj91AP+Akr91Zd6EUe6w
 SG6OXmtF+/q8CZFJFx0PBnSPMVqVki8VJf61/nZw=
Date: Tue, 30 Jun 2020 13:23:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200630202357.GA1396584@google.com>
References: <020937f3-2947-ca41-c18a-026782216711@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <020937f3-2947-ca41-c18a-026782216711@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jqMnT-006Rm0-5I
Subject: Re: [f2fs-dev] [PATCH] f2fs: always expose label 'next_page'
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
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDYvMzAsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4KPiAKPiBGaXggYnVpbGQgZXJyb3Igd2hlbiBGMkZTX0ZTX0NPTVBS
RVNTSU9OIGlzIG5vdCBzZXQvZW5hYmxlZC4KPiBUaGlzIGxhYmVsIGlzIG5lZWRlZCBpbiBlaXRo
ZXIgY2FzZS4KPiAKPiAuLi9mcy9mMmZzL2RhdGEuYzogSW4gZnVuY3Rpb24g4oCYZjJmc19tcGFn
ZV9yZWFkcGFnZXPigJk6Cj4gLi4vZnMvZjJmcy9kYXRhLmM6MjMyNzo1OiBlcnJvcjogbGFiZWwg
4oCYbmV4dF9wYWdl4oCZIHVzZWQgYnV0IG5vdCBkZWZpbmVkCj4gICAgICBnb3RvIG5leHRfcGFn
ZTsKClRoYW5rIHlvdSBmb3IgdGhlIGZpeC4gVGhpcyB3YXMgYWN0dWFsbHkgaW50cm9kdWNlZCBi
eSB0aGUgcmVjZW50IHRlc3RpbmcgcGF0Y2guCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC8/aD1kZXYmaWQ9ZmY5
NjNhZDJiZjU0NDYwNDMxZjUxN2I1Y2FlNDczOTk3YTI5YmYyYQoKSWYgeW91IGRvbid0IG1pbmQs
IHBsZWFzZSBsZXQgbWUgaW50ZWdyYXRlIHRoaXMgaW50byB0aGUgb3JpZ2luYWwgcGF0Y2guCkxl
dCBtZSBrbm93LgoKVGhhbmtzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBDYzogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz4KPiBDYzogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+IENjOiBsaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IC0tLQo+ICBmcy9mMmZzL2RhdGEuYyB8ICAgIDIg
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gLS0tIGxpbnV4LW5leHQt
MjAyMDA2MzAub3JpZy9mcy9mMmZzL2RhdGEuYwo+ICsrKyBsaW51eC1uZXh0LTIwMjAwNjMwL2Zz
L2YyZnMvZGF0YS5jCj4gQEAgLTIzNjYsOSArMjM2Niw3IEBAIHNldF9lcnJvcl9wYWdlOgo+ICAJ
CQl6ZXJvX3VzZXJfc2VnbWVudChwYWdlLCAwLCBQQUdFX1NJWkUpOwo+ICAJCQl1bmxvY2tfcGFn
ZShwYWdlKTsKPiAgCQl9Cj4gLSNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+ICBu
ZXh0X3BhZ2U6Cj4gLSNlbmRpZgo+ICAJCWlmIChyYWMpCj4gIAkJCXB1dF9wYWdlKHBhZ2UpOwo+
ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
