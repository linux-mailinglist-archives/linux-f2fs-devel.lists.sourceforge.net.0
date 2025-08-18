Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA19B29C32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Aug 2025 10:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWp/tBmysKmJq2o3vb/BDDTaTOz3eDMCpDBzyZvqYnc=; b=ikPreoO1VFUcSYjUglCZjja3++
	1XA3rwsgpKdPVnRkkHvp7DmvOmoQRK8VFVCYJIDy0JAo206ijnYlkuRuYGoWNbiWREjwE/awO0o2p
	AGpaHQijVS5cd6gNjfD7SjkKXx+Th0eo2la40iFk6k3mmqZjGKDoHn0PLOwkl0Vtblm4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unvEN-00026f-A1;
	Mon, 18 Aug 2025 08:28:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unvEL-00026Y-Kg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 08:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Or9ok1Sr6rUNuJj4WcUHHvV6v12gvIDrEfnwreqvPRU=; b=j4XasCZkrPqkCOhJ70W9gWXRw5
 L5Yk5FKAin8L5RgcZV2MSRqkuvHxiYK505ZckwUNtpl4leb+0NiRYtvoRBjzQK3x7PtOJxyJdPE8O
 bWQJUt50cNc9fNsrvzCZ7mTZ6lM2ITKlCAKYQYXFr/KZxQCwLDpqv78oMpA2M+lx9q/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Or9ok1Sr6rUNuJj4WcUHHvV6v12gvIDrEfnwreqvPRU=; b=dyKjT9fGR/09K3q6aQKb7GdxMc
 9GeKwDwdkxz4VRJ2Xd4skWBGyIUAq7+k824NE3iLIRutafVZ+QNZy+B/cyUmZ3lLcVq1TwKsQwYYM
 u2kAQPjkL5gokmvMjffSfzjpI6Wi8PamBH81excTXUSmd+f6x6ofw5vXvgEKLHPSd1Fw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unvEL-0006Zp-5H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 08:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2AFD5C5B3F;
 Mon, 18 Aug 2025 08:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35468C4CEEB;
 Mon, 18 Aug 2025 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755505706;
 bh=Icogg28ZLs91H1WXJDPU4qMKH1v2aWHOOdl1Ix8d2I4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eARKmdTcKCTa1s7Bc4eoFK3Y4UKf9bn5vlz8oM6nMwIa7fhi3m1prdiM/3X2/0k0r
 vgvJ9c6VkUmsCOMMnk5YUHl3ccV9E7U845apbUTitYEn81sAbGX7wLWuDV9e16EMiH
 4MkgAap41+2V1cX9P0ewqoZVPdbNJr7KfT/iGPqrmL1LeRkE/4v8TEsTaNmgAga8rK
 zzgpcPijSardkKlCpUXzaSyD2ufYOeheNtX9AYSLEGIFbDqej3MUYtKLWYw+YNyu59
 kVpt1CLJA7VN0waIuwD5LTOi4vBVpiZAg4hV3c9ZdN199W8ik4nwySDTvo0u/214/p
 tlTODkNSDEimw==
Message-ID: <943041c7-5eb2-4ddc-b54e-192b61de4bf7@kernel.org>
Date: Mon, 18 Aug 2025 16:28:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hongbo Li <lihongbo22@huawei.com>, jaegeuk@kernel.org
References: <20250818020939.3529802-1-chao@kernel.org>
 <20250818020939.3529802-2-chao@kernel.org>
 <f503b139-ba90-40ae-8900-db0ba7789525@huawei.com>
Content-Language: en-US
In-Reply-To: <f503b139-ba90-40ae-8900-db0ba7789525@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/18/25 16:06, Hongbo Li wrote: > Hi Chao,
 > > On 2025/8/18
 10:09, Chao Yu wrote: >> The mount behavior changed after commit d18535132523
 ("f2fs: separate the >> options parsing and options checkin [...] 
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
X-Headers-End: 1unvEL-0006Zp-5H
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix to allow removing qf_name
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

T24gOC8xOC8yNSAxNjowNiwgSG9uZ2JvIExpIHdyb3RlOgo+IEhpIENoYW8sCj4gCj4gT24gMjAy
NS84LzE4IDEwOjA5LCBDaGFvIFl1IHdyb3RlOgo+PiBUaGUgbW91bnQgYmVoYXZpb3IgY2hhbmdl
ZCBhZnRlciBjb21taXQgZDE4NTM1MTMyNTIzICgiZjJmczogc2VwYXJhdGUgdGhlCj4+IG9wdGlv
bnMgcGFyc2luZyBhbmQgb3B0aW9ucyBjaGVja2luZyIpLCBsZXQncyBmaXggaXQuCj4+Cj4+IFtT
Y3JpcHRzXQo+PiBta2ZzLmYyZnMgLWYgL2Rldi92ZGIKPj4gbW91bnQgLXQgZjJmcyAtbyB1c3Jx
dW90YSAvZGV2L3ZkYiAvbW50L2YyZnMKPj4gcXVvdGFjaGVjayAtdWMgL21udC9mMmZzCj4+IHVt
b3VudCAvbW50L2YyZnMKPj4gbW91bnQgLXQgZjJmcyAtbyB1c3JqcXVvdGE9YXF1b3RhLnVzZXIs
anFmbXQ9dmZzb2xkIC9kZXYvdmRiIC9tbnQvZjJmcwo+PiBtb3VudHxncmVwIGYyZnMKPj4gbW91
bnQgLXQgZjJmcyAtbyByZW1vdW50LHVzcmpxdW90YT0sanFmbXQ9dmZzb2xkIC9kZXYvdmRiIC9t
bnQvZjJmcwo+PiBtb3VudHxncmVwIGYyZnMKPj4gZG1lc2cKPj4KPj4gW0JlZm9yZSBjb21taXRd
Cj4+IG1vdW50IzE6IC4uLixxdW90YSxqcWZtdD12ZnNvbGQsdXNyanF1b3RhPWFxdW90YS51c2Vy
LC4uLgo+PiBtb3VudCMyOiAuLi4scXVvdGEsanFmbXQ9dmZzb2xkLC4uLgo+PiBrbXNnOiBubyBv
dXRwdXQKPj4KPj4gW0FmdGVyIGNvbW1pdF0KPj4gbW91bnQjMTogLi4uLHF1b3RhLGpxZm10PXZm
c29sZCx1c3JqcXVvdGE9YXF1b3RhLnVzZXIsLi4uCj4+IG1vdW50IzI6IC4uLixxdW90YSxqcWZt
dD12ZnNvbGQsdXNyanF1b3RhPWFxdW90YS51c2VyLC4uLgo+PiBrbXNnOiAidXNlciBxdW90YSBm
aWxlIGFscmVhZHkgc3BlY2lmaWVkIgo+Pgo+PiBbQWZ0ZXIgcGF0Y2hdCj4+IG1vdW50IzE6IC4u
LixxdW90YSxqcWZtdD12ZnNvbGQsdXNyanF1b3RhPWFxdW90YS51c2VyLC4uLgo+PiBtb3VudCMy
OiAuLi4scXVvdGEsanFmbXQ9dmZzb2xkLC4uLgo+PiBrbXNnOiAicmVtb3ZlIHFmX25hbWUgYXF1
b3RhLnVzZXIiCj4+Cj4+IEZpeGVzOiBkMTg1MzUxMzI1MjMgKCJmMmZzOiBzZXBhcmF0ZSB0aGUg
b3B0aW9ucyBwYXJzaW5nIGFuZCBvcHRpb25zIGNoZWNraW5nIikKPj4gQ2M6IEhvbmdibyBMaSA8
bGlob25nYm8yMkBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL3N1cGVyLmMgfCA3ICsrKysrLS0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBpbmRleCA0NjU2
MDRmZGM1ZGQuLjA3ZjZjOGNhYzA3YSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+
ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAtMTIxOSw4ICsxMjE5LDExIEBAIHN0YXRpYyBp
bnQgZjJmc19jaGVja19xdW90YV9jb25zaXN0ZW5jeShzdHJ1Y3QgZnNfY29udGV4dCAqZmMsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfanF1b3RhX2NoYW5n
ZTsKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9sZF9xbmFtZSkgewo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChuZXdfcW5hbWUgJiYKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmNtcChvbGRfcW5hbWUsIG5ld19x
bmFtZSkgPT0gMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghbmV3
X3FuYW1lKSB7Cj4gCj4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLiBEbyB3ZSBhbHNvIG5lZWQg
dGhlIHBhdGNoIDEvMiA/IEl0IHNlZW1zIHRoaXMgcGF0Y2ggYWxzbyBzb2x2ZSB0aGUgc3l6Ym90
IHByb2JsZW1zLgoKSSBwcmVmZXIgdG8gc3BsaXQgaXQsIHNpbmNlIGl0J2QgYmV0dGVyIHRvIHVz
ZSBvbmUgcGF0Y2ggdG8gcmVzb2x2ZSBvbmUKcHJvYmxlbS4gOikKClRoYW5rcywKCj4gCj4gVGhh
bmtzLAo+IEhvbmdibwo+IAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZjJmc19pbmZvKHNiaSwgInJlbW92ZSBxZl9uYW1lICVzIiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZF9xbmFt
ZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKHN0cmNtcChvbGRf
cW5hbWUsIG5ld19xbmFtZSkgPT0gMCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY3R4LT5xbmFtZV9tYXNrICY9IH4oMSA8PCBpKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
