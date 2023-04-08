Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA76DB866
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Apr 2023 04:57:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkylZ-0005lX-Ln;
	Sat, 08 Apr 2023 02:57:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pkylY-0005lR-VQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Apr 2023 02:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9zzpuh8dRH3+oy8oUASylpQAX482BnmMMJRYkeM1XA=; b=lYXYlNiiRJaigYezSN3tKyB/V4
 8o1JaDjPASPmccBjABD+/HVdVmYbk/dnxmuLQV103De0S7Aviyy5EmM7T5FvcVZxo/9eZg4kcAtNZ
 pdweMq2Ae1EJWTpB92s1WznX6OK5IpTsCsYo6D1UzTf2Ha3o5tYD0G2HeGkcGV1a8S0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q9zzpuh8dRH3+oy8oUASylpQAX482BnmMMJRYkeM1XA=; b=ayzOGhufWaY8P2NlZ905SFvweJ
 DH4GIENVLptUef+KEDmoOFhu81sEWf109uH6NMP7+MsrShCV9QF5YrbzsDGJUkW8B9pyk+GkPX+Xv
 Z5jpv3R4nPXRSqX8MMktF1/ylMjb639gUPal3qN4Q68Pi8UEjso20uHc0DruxieXtUGU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkylW-000pQ1-Ik for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Apr 2023 02:57:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E57A65474
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Apr 2023 02:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAEEC433EF;
 Sat,  8 Apr 2023 02:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680922636;
 bh=Bc+uF/5u234A5wF5Cii6t3vLz3f10HXrREOqC0Ikqog=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=J1za49D7XJW49fUFjtJeh8GC8YVw3hjxuh64UbNqsbA3+rm9M0NHjUy+ewOLgnQ9h
 Iu/6vdR5idnqhzQiR7JMXho5l6UISHhcrMaO7YrdaN4cDhebO0dUf/uJpJr7+wEtVa
 iyDtnDTit5VHbXZTLs8kpWIvRLQYtR4S4IMyojrEGf47IqLqg0kjWuSMmumtuhJO0Z
 8tuF1IeIJhsAe79WC/w2nz+xhQ/gFacFn+h8UIB+4TqLQEqrS4pdhCg8ZFqwB1Fitd
 TyYxOEBg4Rf/P7gBStzdjRSZPJfW3SOyDDT3DU7aY/DzJXopYBR0IkfzTD8Pmx586I
 SHVfNmwYrKpyQ==
Message-ID: <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
Date: Sat, 8 Apr 2023 10:57:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDCEK2OPkhTmRZrq@google.com>
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/8 4:59,
 Jaegeuk Kim wrote: > This breaks generic/009?
 I guess it is as expected? Please check description of fiemap ioctl manual
 from [1]: 
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkylW-000pQ1-Ik
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy80LzggNDo1OSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gVGhpcyBicmVha3MgZ2VuZXJp
Yy8wMDk/CgpJIGd1ZXNzIGl0IGlzIGFzIGV4cGVjdGVkPwoKUGxlYXNlIGNoZWNrIGRlc2NyaXB0
aW9uIG9mIGZpZW1hcCBpb2N0bCBtYW51YWwgZnJvbSBbMV06CgpGSUVNQVBfRVhURU5UX1VOS05P
V04KVGhlIGxvY2F0aW9uIG9mIHRoaXMgZXh0ZW50IGlzIGN1cnJlbnRseSB1bmtub3duLiBUaGlz
IG1heQppbmRpY2F0ZSB0aGUgZGF0YSBpcyBzdG9yZWQgb24gYW4gaW5hY2Nlc3NpYmxlIHZvbHVt
ZSBvciB0aGF0Cm5vIHN0b3JhZ2UgaGFzIGJlZW4gYWxsb2NhdGVkIGZvciB0aGUgZmlsZSB5ZXQu
CgpGSUVNQVBfRVhURU5UX0RFTEFMTE9DClRoaXMgd2lsbCBhbHNvIHNldCBGSUVNQVBfRVhURU5U
X1VOS05PV04uCgpEZWxheWVkIGFsbG9jYXRpb24gLSB3aGlsZSB0aGVyZSBpcyBkYXRhIGZvciB0
aGlzIGV4dGVudCwgaXRzCnBoeXNpY2FsIGxvY2F0aW9uIGhhcyBub3QgYmVlbiBhbGxvY2F0ZWQg
eWV0LgoKRklFTUFQX0VYVEVOVF9VTldSSVRURU4KVW53cml0dGVuIGV4dGVudCAtIHRoZSBleHRl
bnQgaXMgYWxsb2NhdGVkIGJ1dCBpdHMgZGF0YSBoYXMgbm90CmJlZW4gaW5pdGlhbGl6ZWQuIFRo
aXMgaW5kaWNhdGVzIHRoZSBleHRlbnTigJlzIGRhdGEgd2lsbCBiZSBhbGwKemVybyBpZiByZWFk
IHRocm91Z2ggdGhlIGZpbGVzeXN0ZW0gYnV0IHRoZSBjb250ZW50cyBhcmUgdW5kZWZpbmVkCmlm
IHJlYWQgZGlyZWN0bHkgZnJvbSB0aGUgZGV2aWNlLgoKWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2ZpbGVzeXN0ZW1zL2ZpZW1hcC5odG1sCgpBY2NvcmRpbmcgdG8g
aXRzIGRlc2NyaXB0aW9uLCBmMmZzIG9ubHkgc3VwcG9ydApGSUVNQVBfRVhURU5UX3tVTktOT1dO
LCBERUxBTExPQ30sIGJ1dCBub3Qgc3VwcG9ydApGSUVNQVBfRVhURU5UX1VOV1JJVFRFTi4KClNv
IDAwOSwgMDkyLCAwOTQgLi4gd2hpY2ggZXhwZWN0cyB1bndyaXR0ZW4gc3RhdHVzIGZyb20gZXh0
ZW50IHdpbGwKZmFpbC4KCkhvdyBhYm91dCBkaXNhYmxpbmcgdGhvc2UgdGVzdGNhc2U/CgpUaGFu
a3MsCgo+IAo+IE9uIDA0LzA1LCBDaGFvIFl1IHdyb3RlOgo+PiB4ZnN0ZXN0IGdlbmVyaWMvNjE0
IGZhaWxzIHRvIHJ1biBkdWUgYmVsb3cgcmVhc29uOgo+Pgo+PiBnZW5lcmljLzYxNCAxcyAuLi4g
W25vdCBydW5dIHRlc3QgcmVxdWlyZXMgZGVsYXllZCBhbGxvY2F0aW9uIGJ1ZmZlcmVkIHdyaXRl
cwo+Pgo+PiBUaGUgcm9vdCBjYXVzZSBpcyBmMmZzIHRhZ3Mgd3JvbmcgZmllbWFwIGZsYWcgZm9y
IGRlbGF5IGFsbG9jYXRlZAo+PiBleHRlbnQuCj4+Cj4+IFF1b3RlZCBmcm9tIGZpZW1hcC5oOgo+
PiBGSUVNQVBfRVhURU5UX1VOS05PV04JCTB4MDAwMDAwMDIgLyogRGF0YSBsb2NhdGlvbiB1bmtu
b3duLiAqLwo+PiBGSUVNQVBfRVhURU5UX0RFTEFMTE9DCQkweDAwMDAwMDA0IC8qIExvY2F0aW9u
IHN0aWxsIHBlbmRpbmcuCj4+IAkJCQkJCSAgICAqIFNldHMgRVhURU5UX1VOS05PV04uICovCj4+
IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOCQkweDAwMDAwODAwIC8qIFNwYWNlIGFsbG9jYXRlZCwg
YnV0Cj4+IAkJCQkJCSAgICAqIG5vIGRhdGEgKGkuZS4gemVybykuICovCj4+Cj4+IEZJRU1BUF9F
WFRFTlRfVU5XUklUVEVOIG1lYW5zIGJsb2NrIGFkZHJlc3MgaXMgcHJlYWxsb2NhdGVkLCBidXQg
dy9vCj4+IGJlZW4gd3JpdHRlbiBhbnkgZGF0YSwgd2hpY2ggc3RhdHVzIGYyZnMgaXMgbm90IHN1
cHBvcnRlZCBub3csIGZvciBhbGwKPj4gTkVXX0FERFIgYmxvY2sgYWRkcmVzc2VzLCBpdCBtZWFu
cyBkZWxheSBhbGxvY2F0ZWQgYmxvY2tzLCBzbyBsZXQncwo+PiB0YWcgRklFTUFQX0VYVEVOVF9E
RUxBTExPQyBpbnN0ZWFkLgo+Pgo+PiBUZXN0Y2FzZToKPj4geGZzX2lvIC1mIC1jICdwd3JpdGUg
MCA2NGsnIC9tbnQvZjJmcy9maWxlOwo+PiBmaWxlZnJhZyAtdiAvbW50L2YyZnMvZmlsZQo+Pgo+
PiBPdXRwdXQ6Cj4+IC0gQmVmb3JlCj4+IEZpbGVzeXN0ZW0gdHlwZSBpczogZjJmNTIwMTAKPj4g
Rml6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAoMTYgYmxvY2tzIG9mIDQwOTYgYnl0ZXMp
Cj4+ICAgZXh0OiAgICAgbG9naWNhbF9vZmZzZXQ6ICAgICAgICBwaHlzaWNhbF9vZmZzZXQ6IGxl
bmd0aDogICBleHBlY3RlZDogZmxhZ3M6Cj4+ICAgICAwOiAgICAgICAgMC4uICAgICAgMTU6ICAg
ICAgICAgIDAuLiAgICAgICAgMTU6ICAgICAxNjogICAgICAgICAgICAgbGFzdCx1bndyaXR0ZW4s
bWVyZ2VkLGVvZgo+PiAvbW50L2YyZnMvZmlsZTogMSBleHRlbnQgZm91bmQKPj4KPj4gQWZ0ZXI6
Cj4+IEZpbGVzeXN0ZW0gdHlwZSBpczogZjJmNTIwMTAKPj4gRmlsZSBzaXplIG9mIC9tbnQvZjJm
cy9maWxlIGlzIDY1NTM2ICgxNiBibG9ja3Mgb2YgNDA5NiBieXRlcykKPj4gICBleHQ6ICAgICBs
b2dpY2FsX29mZnNldDogICAgICAgIHBoeXNpY2FsX29mZnNldDogbGVuZ3RoOiAgIGV4cGVjdGVk
OiBmbGFnczoKPj4gICAgIDA6ICAgICAgICAwLi4gICAgICAxNTogICAgICAgICAgMC4uICAgICAg
ICAgMDogICAgICAwOiAgICAgICAgICAgICBsYXN0LHVua25vd25fbG9jLGRlbGFsbG9jLGVvZgo+
PiAvbW50L2YyZnMvZmlsZTogMSBleHRlbnQgZm91bmQKPj4KPj4gRml4ZXM6IDdmNjNlYjc3YWY3
YiAoImYyZnM6IHJlcG9ydCB1bndyaXR0ZW4gYXJlYSBpbiBmMmZzX2ZpZW1hcCIpCj4+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgZnMvZjJmcy9k
YXRhLmMgfCA3ICsrKysrLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZz
L2RhdGEuYwo+PiBpbmRleCAzNTlkZTY1MDc3MmUuLjNhZmM5NzY0NzQzZSAxMDA2NDQKPj4gLS0t
IGEvZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTE5OTUsNyAr
MTk5NSwxMCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
ZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPj4gICAJfQo+PiAgIAo+PiAgIAlpZiAoc2l6ZSkg
ewo+PiAtCQlmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPj4gKwkJaWYgKGZsYWdzICYg
RklFTUFQX0VYVEVOVF9ERUxBTExPQykKPj4gKwkJCXBoeXMgPSAwOwo+PiArCQllbHNlCj4+ICsJ
CQlmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPj4gICAJCWlmIChJU19FTkNSWVBURUQo
aW5vZGUpKQo+PiAgIAkJCWZsYWdzIHw9IEZJRU1BUF9FWFRFTlRfREFUQV9FTkNSWVBURUQ7Cj4+
ICAgCj4+IEBAIC0yMDM1LDcgKzIwMzgsNyBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPj4gICAJCQkJc2l6
ZSArPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPj4gICAJCQl9Cj4+ICAgCQl9IGVsc2UgaWYg
KG1hcC5tX2ZsYWdzICYgRjJGU19NQVBfREVMQUxMT0MpIHsKPj4gLQkJCWZsYWdzID0gRklFTUFQ
X0VYVEVOVF9VTldSSVRURU47Cj4+ICsJCQlmbGFncyA9IEZJRU1BUF9FWFRFTlRfREVMQUxMT0M7
Cj4+ICAgCQl9Cj4+ICAgCj4+ICAgCQlzdGFydF9ibGsgKz0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
c2l6ZSk7Cj4+IC0tIAo+PiAyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
