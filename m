Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109BCBC361
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 02:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UJ6TktmsalqP/wxOPXKbUOhxF+osI5zMCVTWMKF9To=; b=VbNt8Zb2ymmGxtLw6E5wQ5fwnI
	jLGE+ghwfgV0yvGce44DNG8pdATibX8lLoxAJEr2s7xzyFBkPtI3vfnN2ngdQPrSVXzmiQzqcsUk8
	jIWp7va5L5KTArYA5PkKh9L1tcOtC7OHDHVCtOgWuHSo75qfh4mXVDA5qyWf/vHuqS7M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vUxjX-0007uD-BT;
	Mon, 15 Dec 2025 01:50:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vUxiy-0007tT-Ig
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVnf9fNxWL6ZjPPZ1aHvezt941azAvoeBsf4AbsLPuU=; b=iqWtG/uIABYesUxhc/OGOQx8US
 6m2KwbaKfE81yWlIdWq9miuUOenqKIAlBJQE3EU6rZF8sol4eYOWh+d+cAUSzfegLpAOHXQis/nDh
 AfqcLg3wG6ybIO03kaD9xo9yVqk2twKDetDIR1+WEyHnVoOObJZx242wfhAwFtX/7jxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UVnf9fNxWL6ZjPPZ1aHvezt941azAvoeBsf4AbsLPuU=; b=GrASqS60CjpUYiO0VNCw6ONP/B
 0B4Mp5NgfREW2frx5irLAgfO7+HalYoESPvgMNuLiutBzbV+b+nl2nECHN4U5R6wrDTf8vRg5Moza
 232Hvih5aHafCfXrQ/4HGf4iLASx7dFUwCAssk7Lc7vnJDsp5XLwZcHQh1DF8hWBxmVA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vUxir-0006VD-45 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3EAB40604;
 Mon, 15 Dec 2025 01:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9739BC4CEF1;
 Mon, 15 Dec 2025 01:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765763395;
 bh=7cP/acxYmB/cgIlU1eAt+cqS8ncm6LYZEGysGflX8jU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UPbWZpSG+0Vw1QcxFkE79hzhmOW6sA/4o1sVFVq5pDg4hntjKhknL5owq4DoeCycj
 /FMY8MWQj/JOlZgMeh0VhQ3O2YgDiYWXoNtVbnwaWGu8I+P61ekQlK8LOTOmJQoU/2
 XAK3PerAhdo2Bg3+OR1H2/4aMXOCriCGX5bTrzfEHipl1fY0R/tcVP2WFBqspbE8h5
 vSWQo5PaezcJ/TLKzcx2pQ0jD504ZWYgRKP21A1lFqyB5c5oBogoVObSPxN4Tu81Jc
 T2qNE28HsCEep3zDmB9SsgB089SYtGZJMO3HujQoMRFHLkTOTmUHQYu/bqlXU6WlzQ
 ImNcIyuJ340Mw==
Message-ID: <2a330404-8518-4891-8ec9-dfe18074780a@kernel.org>
Date: Mon, 15 Dec 2025 09:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251212084034.2878836-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251212084034.2878836-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12/25 16:40, Joanne Chang wrote: > The check for enough
 sections in segment.h has the following issues: > > 1.
 has_not_enough_free_secs()
 should return "enough secs" when "free_secs >> = upper_s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vUxir-0006VD-45
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: improve check for enough free
 sections
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTIvMjUgMTY6NDAsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiBUaGUgY2hlY2sgZm9yIGVu
b3VnaCBzZWN0aW9ucyBpbiBzZWdtZW50LmggaGFzIHRoZSBmb2xsb3dpbmcgaXNzdWVzOgo+IAo+
IDEuIGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcygpIHNob3VsZCByZXR1cm4gImVub3VnaCBzZWNz
IiB3aGVuICJmcmVlX3NlY3MKPj4gPSB1cHBlcl9zZWNzIiwgbm90IGp1c3Qgc3RydWN0bHkgZ3Jl
YXRlci4gQ29udmVyc2VseSwgaXQgc2hvdWxkIG9ubHkKPiByZXR1cm4gIm5vdCBlbm91Z2ggc2Vj
cyIgd2hlbiAiZnJlZV9zZWNzIDwgbG93ZXJfc2VjcyIsIG5vdCB3aGVuIHRoZXkgYXJlCj4gZXF1
YWwuIFRoaXMgYWNjb3VudHMgZm9yIHRoZSBwb3NzaWJpbGl0eSB0aGF0IGJsb2NrcyBjYW4gZml0
IHdpdGhpbgo+IGN1cnNlZyB3aXRob3V0IHJlcXVpcmluZyBhbiBhZGRpdGlvbmFsIGZyZWUgc2Vj
dGlvbi4KPiAKPiAyLiBfX2dldF9zZWNzX3JlcXVpcmVkKCkgY3VycmVudGx5IHNlcGFyYXRlcyB0
aGUgbmVlZGVkIHNwYWNlIHRvIHNlY3Rpb24KPiBhbmQgYmxvY2sgcGFydHMsIGNoZWNraW5nIHRo
ZW0gYWdhaW5zdCBmcmVlIHNlY3Rpb25zIGFuZCBjdXJzZWcsCj4gcmVzcGVjdGl2ZWx5LiBUaGlz
IGRvZXMgbm90IGNvbnNpZGVyIHRoZSBjYXNlIHdoZXJlIGN1cnNlZyBjYW5ub3QgaG9sZAo+IHRo
ZSB3aG9sZSBibG9jayBwYXJ0LCBidXQgZXhjZXNzIGZyZWUgc2VjdGlvbnMgYmV5b25kIHRoZSBz
ZWN0aW9uIHBhcnQKPiBjYW4gYWNjb21tb2RhdGUgc29tZSBvZiB0aGUgYmxvY2sgcGFydC4KPiAK
PiAzLiBoYXNfY3Vyc2VnX2Vub3VnaF9zcGFjZSgpIG9ubHkgY2hlY2tzIENVUlNFR19IT1RfREFU
QSBmb3IgZGVudHJ5Cj4gYmxvY2tzLCBidXQgd2hlbiBhY3RpdmVfbG9ncz02LCB0aGV5IG1heSBi
ZSBwbGFjZWQgaW4gV0FSTSBhbmQgQ09MRAo+IHNlY3Rpb25zLiBBbHNvLCB0aGUgY3VycmVudCBs
b2dpYyBkb2VzIG5vdCBjb25zaWRlciB0aGF0IGRlbnRyeSBhbmQgZGF0YQo+IGJsb2NrcyBjYW4g
YmUgcHV0IGluIHRoZSBzYW1lIHNlY3Rpb24gd2hlbiBhY3RpdmVfbG9ncz0yIG9yIDYuCj4gCj4g
VGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgdGhyZWUgZnVuY3Rpb25zIHRvIGFkZHJlc3MgdGhlIGFi
b3ZlIGlzc3VlczoKPiAKPiAxLiBSZW5hbWUgaGFzX2N1cnNlZ19lbm91Z2hfc3BhY2UoKSB0byBn
ZXRfYWRkaXRpb25hbF9ibG9ja3NfcmVxdWlyZWQoKS4KPiBDYWxjdWxhdGUgdGhlIG1pbmltdW0g
bm9kZSwgZGVudHJ5LCBhbmQgZGF0YSBibG9ja3MgY3Vyc2VnIGNhbgo+IGFjY29tbW9kYXRlLiBU
aGVuIHN1YnRyYWN0IHRoZXNlIGZyb20gdGhlIHRvdGFsIHJlcXVpcmVkIGJsb2NrcyBvZgo+IHJl
c3BlY3RpdmUgdHlwZSB0byBkZXRlcm1pbmUgdGhlIHdvcnN0LWNhc2UgbnVtYmVyIG9mIGJsb2Nr
cyB0aGF0IG11c3QKPiBiZSBwbGFjZWQgaW4gZnJlZSBzZWN0aW9ucy4KPiAKPiAyLiBJbiBfX2dl
dF9zZWNzX3JlcXVpcmVkKCksIGdldCB0aGUgbnVtYmVyIG9mIGJsb2NrcyBuZWVkaW5nIG5ldwo+
IHNlY3Rpb25zIGZyb20gdGhlIG5ldyBnZXRfYWRkaXRpb25hbF9ibG9ja3NfcmVxdWlyZWQoKS4g
UmV0dXJuIHRoZSB1cHBlcgo+IGJvdW5kIG9mIG5lY2Vzc2FyeSBmcmVlIHNlY3Rpb25zIGZvciB0
aGVzZSBibG9ja3MuIEZvciBhY3RpdmVfbG9ncz0yIG9yCj4gNiwgZGVudHJ5IGJsb2NrcyBhcmUg
Y29tYmluZWQgd2l0aCBkYXRhIGJsb2Nrcy4KPiAKPiAzLiBJbiBoYXNfbm90X2Vub3VnaF9mcmVl
X3NlY3MoKSwgZ2V0IHRoZSByZXF1aXJlZCBzZWN0aW9ucyBmcm9tCj4gX19nZXRfc2Vjc19yZXF1
aXJlZCgpLCBhbmQgcmV0dXJuIOKAnG5vdCBlbm91Z2ggc2Vjc+KAnSBpZiDigJxmcmVlX3NlY3Mg
PAo+IHJlcXVpcmVkX3NlY3PigJ0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9hbm5lIENoYW5nIDxq
b2FubmVjaGllbkBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
