Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DDBA7290B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 04:22:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txdom-0006XX-6C;
	Thu, 27 Mar 2025 03:22:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txdoa-0006X7-NQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 03:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0AxcmTPMQrY1JGJM91YHx8HTa4TXTjni+0ovwsK+ak=; b=XN/AQvuTtrqpGDeb1m51ePwIV9
 R8fwm4kxVkobOFhAuFhc428V9Mdorw8v4kL9Wd06SI/fQ/hQvRKDvE6jxWB+oyWYYNmcRqwhDNMqA
 cxheDdUdaKRQe3tNzMpd5kz8HAsp2AalFkGNMlhXcJibvX6xBGo8XMZmgItxkuBMRSPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0AxcmTPMQrY1JGJM91YHx8HTa4TXTjni+0ovwsK+ak=; b=HYyo8QFI32uO6ImefqPF+q15D+
 IRN9H8I8luay7mIMFQ6nW19FY1wweI34tQY5CoNG0M3VRqzaEcE/va3Egyp9WR7ExkfCJNKt2+Kyk
 jvbH8c2xUU9iMBuhlvrZi9HPor5XSKmLuKpHqWeFycz9Nf5uRiCAKXRWHFiFu/1ylobI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txdoU-0003gF-6m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 03:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9F266115F;
 Thu, 27 Mar 2025 03:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E7DC4CEDD;
 Thu, 27 Mar 2025 03:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743045704;
 bh=J6KDeAk/jxGnYprxAwB9+4tpbqfOnwyrj/fv/yPIZZ4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=E4d6oy9sBdRQeAdizkzREAzRz0DR63YYaLTQhkE2/wlbCu+96wULof4aq2l/r0OsI
 v3Fk5tK67iLf5aVJJ2xFtfp1QZZUqc9dPiTjwcQgkHFUHNkNLM80scKIPr6+YviY+G
 iHG5OllhN7l0v7AFpQVGNs0fpaKYdpZdmYm4TAJKWhUi4Yc7GQweK8d7Xh/FDt7U4r
 J33OSN5iseymwhUfTENEgR1W4XSIJpHQup7yZYICnBlIiaNKF77QIeTDPpGWKqFqeW
 71ksm56Q3kk4dHYlaGTAD76ajNHnCJQ2hk5Sn5F1jAtXbkHTPyn8GxJsgXmDFwlUKj
 W9Ilq1GtA7ISQ==
Message-ID: <e951488b-4000-4e8c-90ef-b3e1cd58007d@kernel.org>
Date: Thu, 27 Mar 2025 11:21:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
 <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
 <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
 <8a72691e-28ef-4b6b-a855-62fd6c2743dc@kernel.org>
 <CACOAw_wX3QPvpaCWW2gfKH_9Zf_=Tku14+RL6CatU9f2d2AiGQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_wX3QPvpaCWW2gfKH_9Zf_=Tku14+RL6CatU9f2d2AiGQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/27/25 02:51, Daeho Jeong wrote: > On Wed, Mar 26, 2025
    at 5:12 AM Chao Yu via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
    wrote: >> >> On 3/26/25 18:51, Zhiguo Niu wrote: >>> Ch [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txdoU-0003gF-6m
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8yNy8yNSAwMjo1MSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMjYsIDIw
MjUgYXQgNToxMuKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwKPiA8bGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+Pgo+PiBPbiAzLzI2LzI1IDE4
OjUxLCBaaGlndW8gTml1IHdyb3RlOgo+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4y
MDI15bm0M+aciDI25pel5ZGo5LiJIDE3OjI25YaZ6YGT77yaCj4+Pj4KPj4+PiBPbiAzLzI2LzI1
IDE2OjQ2LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+PiBDb21taXQgZmNjYWE4MWRlODdlICgiZjJm
czogcHJldmVudCBhdG9taWMgZmlsZSBmcm9tIGJlaW5nIGRpcnRpZWQgYmVmb3JlIGNvbW1pdCIp
Cj4+Pj4+IGFkZHMgdGhlIHByb2Nlc3Npbmcgb2YgRklfQVRPTUlDX0RJUlRJRUQgaW4gdGhlIGZv
bGxvd2luZyB0d28gcG9zaXRpb25zLAo+Pj4+PiBbMV0KPj4+Pj4gZjJmc19jb21taXRfYXRvbWlj
X3dyaXRlCj4+Pj4+ICAtIF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlCj4+Pj4+ICAgLSBzYmkt
PmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4+Pj4+ICAg
LSBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4+Pj4+ICAgLSBp
ZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+Pj4+PiAg
IC0gICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+Pj4+PiAg
IC0gICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+Pj4+PiAgIC0g
fQo+Pj4+PiBbMl0KPj4+Pj4gZjJmc19hYm9ydF9hdG9taWNfd3JpdGUKPj4+Pj4gICAtIGlmIChp
c19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4+Pj4+ICAgLSAg
ICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4+Pj4+ICAgLSAg
ICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+Pj4+ICAgLSB9Cj4+
Pj4+Cj4+Pj4+IGJ1dCBbMV0gc2VlbXMgdG8gYmUgcmVkdW5kYW50Ogo+Pj4+PiBUaGUgYXRvbWlj
IGZpbGUgZmxhZyBGSV9BVE9NSUNfRklMRSBpcyBzdGlsbCBzZXQgaGVyZSwgc28gZjJmc19tYXJr
X2lub2RlX2RpcnR5X3N5bmMKPj4+Pj4gc3RpbGwgZG9lcyBub3Qgc2V0IHRoZSBkaXJ0eSBzdGF0
ZSB0byB2ZnMuIElmIEZJX0FUT01JQ19ESVJUSUVEIHdhcyBvcmlnaW5hbGx5IHNldAo+Pj4+PiB3
aGVuIGF0b21pYyBmaWxlIGlzIGNvbW1pdHRpbmcsIHRoZW4gRklfQVRPTUlDX0RJUlRJRUQgaXMg
anVzdCBjbGVhcmVkIGhlcmUsIGFuZAo+Pj4+PiB0aGVuIGRvIHRoZSByZXBlYXRpbmcgYWN0aW9u
IG9mIHNldHRpbmcgRklfQVRPTUlDX0RJUlRJRUQ/Cj4+Pj4+IFNvIGlzIGl0IGVub3VnaCB0byBk
byB0aGlzIG9ubHkgaW4gWzJdPwo+Pj4+Cj4+Pj4gSGkgWmhpZ3VvLAo+Pj4+Cj4+Pj4gSSBjaGVj
a2VkIHRoZSBjb2RlIGFnYWluLCBmaW5hbGx5LCBJIGdvdCB0aGlzLCBjb3VsZCB5b3UgcGxlYXNl
IHRha2UKPj4+PiBhIGxvb2s/Cj4+Pj4KPj4+PiBQaW5nIERhZWhvIGFzIHdlbGwuCj4+Pj4KPj4+
PiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGZpeCB0byBzZXQgYXRvbWljIHdyaXRlIHN0YXR1cyBt
b3JlIGNsZWFyCj4+Pj4KPj4+PiAxLiBBZnRlciB3ZSBzdGFydCBhdG9taWMgd3JpdGUgaW4gYSBk
YXRhYmFzZSBmaWxlLCBiZWZvcmUgY29tbWl0dGluZwo+Pj4+IGFsbCBkYXRhLCB3ZSdkIGJldHRl
ciBub3Qgc2V0IGlub2RlIHcvIHZmcyBkaXJ0eSBzdGF0dXMgdG8gYXZvaWQKPj4+PiByZWR1bmRh
bnQgdXBkYXRlcywgaW5zdGVhZCwgd2Ugb25seSBzZXQgaW5vZGUgdy8gYXRvbWljIGRpcnR5IHN0
YXR1cy4KPj4+Pgo+Pj4+IDIuIEFmdGVyIHdlIGNvbW1pdCBhbGwgZGF0YSwgYmVmb3JlIGNvbW1p
dHRpbmcgbWV0YWRhdGEsIHdlIG5lZWQgdG8KPj4+PiBjbGVhciBhdG9taWMgZGlydHkgc3RhdHVz
LCBhbmQgc2V0IHZmcyBkaXJ0eSBzdGF0dXMgdG8gYWxsb3cgdmZzIGZsdXNoCj4+Pj4gZGlydHkg
aW5vZGUuCj4+Pj4KPj4+IEhpIENoYW8sCj4+PiB0aGVzZSBsb29rcyBtb3JlIGNsZWFyLgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAg
ZnMvZjJmcy9pbm9kZS5jICAgfCAgNCArKystCj4+Pj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgMTAg
KysrKysrLS0tLQo+Pj4+ICBmcy9mMmZzL3N1cGVyLmMgICB8ICA0ICsrKy0KPj4+PiAgMyBmaWxl
cyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+IGluZGV4IDVj
ODYzNGVhZWY3Yi4uZjU5OTFlODc1MWI5IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUu
Ywo+Pj4+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+IEBAIC0zNCw3ICszNCw5IEBAIHZvaWQg
ZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBzeW5j
KQo+Pj4+ICAgICAgICAgaWYgKGYyZnNfaW5vZGVfZGlydGllZChpbm9kZSwgc3luYykpCj4+Pj4g
ICAgICAgICAgICAgICAgIHJldHVybjsKPj4+Pgo+Pj4+IC0gICAgICAgaWYgKGYyZnNfaXNfYXRv
bWljX2ZpbGUoaW5vZGUpKQo+Pj4+ICsgICAgICAgLyogb25seSBhdG9taWMgZmlsZSB3LyBGSV9B
VE9NSUNfQ09NTUlUVEVEIGNhbiBiZSBzZXQgdmZzIGRpcnR5ICovCj4+Pj4gKyAgICAgICBpZiAo
ZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgJiYKPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAhaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+Pj4+ICAg
ICAgICAgICAgICAgICByZXR1cm47Cj4+Pj4KPj4+PiAgICAgICAgIG1hcmtfaW5vZGVfZGlydHlf
c3luYyhpbm9kZSk7Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJm
cy9zZWdtZW50LmMKPj4+PiBpbmRleCBkYzM2MGI0YjA1NjkuLjI4NjU5YTcxODkxYSAxMDA2NDQK
Pj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4+Pj4gQEAgLTM3NiwxMCArMzc2LDEyIEBAIHN0YXRpYyBpbnQgX19mMmZzX2NvbW1pdF9hdG9t
aWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4+PiAgICAgICAgIH0gZWxzZSB7Cj4+Pj4g
ICAgICAgICAgICAgICAgIHNiaS0+Y29tbWl0dGVkX2F0b21pY19ibG9jayArPSBmaS0+YXRvbWlj
X3dyaXRlX2NudDsKPj4+PiAgICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJ
X0FUT01JQ19DT01NSVRURUQpOwo+Pj4+IC0gICAgICAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxh
Z19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwg
dHJ1ZSk7Cj4+Pj4gLSAgICAgICAgICAgICAgIH0KPj4+PiArCj4+Pj4gKyAgICAgICAgICAgICAg
IGYyZnNfYnVnX29uKHNiaSwgIWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElS
VElFRCkpOwo+Pj4gYnV0IEZJX0FUT01JQ19ESVJUSUVEIG1heSAgbm90IGJlIHNldCB3aGVuIGF0
b21pYyBmaWxlIGlzIGNvbW1pdHRpbmc/Cj4+PiB0aGFua3MhCj4+Cj4+IGluY192YWxpZF9ibG9j
a19jb3VudCgpIHdpbGwgc2V0IEZJX0FUT01JQ19ESVJUSUVEIGZvciBpbm9kZSBhdCBsZWFzdD8K
Pj4KPj4gLSBfX2YyZnNfY29tbWl0X2F0b21pY193cml0ZQo+PiAgLSBfX3JlcGxhY2VfYXRvbWlj
X3dyaXRlX2Jsb2NrCj4+ICAgLSBpbmNfdmFsaWRfYmxvY2tfY291bnQKPj4gICAgLSBmMmZzX2lf
YmxvY2tzX3dyaXRlCj4+ICAgICAtIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jCj4gCj4gTWF5
YmUsIG5vIHdyaXRlIHNjZW5hcmlvPyBvcGVuIC0+IGF0b21pY193cml0ZV9zdGFydCAtPiBubyB3
cml0ZSAtPiBjb21taXQ/CgpPaCwgWW91J3JlIHJpZ2h0LgoKVGhhbmtzLAoKPiAKPj4KPj4gVGhh
bmtzLAo+Pgo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgICAgLyogY2xlYXIgYXRvbWljIGRpcnR5
IHN0YXR1cyBhbmQgc2V0IHZmcyBkaXJ0eSBzdGF0dXMgKi8KPj4+PiArICAgICAgICAgICAgICAg
Y2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+Pj4+ICsgICAgICAg
ICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+Pj4gICAg
ICAgICB9Cj4+Pj4KPj4+PiAgICAgICAgIF9fY29tcGxldGVfcmV2b2tlX2xpc3QoaW5vZGUsICZy
ZXZva2VfbGlzdCwgcmV0ID8gdHJ1ZSA6IGZhbHNlKTsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4gaW5kZXggOWE0MmExMzIzZjQyLi5hNWNj
OWY2ZWUxNmEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4gKysrIGIvZnMv
ZjJmcy9zdXBlci5jCj4+Pj4gQEAgLTE1MzIsNyArMTUzMiw5IEBAIGludCBmMmZzX2lub2RlX2Rp
cnRpZWQoc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBzeW5jKQo+Pj4+ICAgICAgICAgfQo+Pj4+
ICAgICAgICAgc3Bpbl91bmxvY2soJnNiaS0+aW5vZGVfbG9ja1tESVJUWV9NRVRBXSk7Cj4+Pj4K
Pj4+PiAtICAgICAgIGlmICghcmV0ICYmIGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKQo+Pj4+
ICsgICAgICAgLyogaWYgYXRvbWljIHdyaXRlIGlzIG5vdCBjb21taXR0ZWQsIHNldCBpbm9kZSB3
LyBhdG9taWMgZGlydHkgKi8KPj4+PiArICAgICAgIGlmICghcmV0ICYmIGYyZnNfaXNfYXRvbWlj
X2ZpbGUoaW5vZGUpICYmCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIWlzX2lub2RlX2Zs
YWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKSkKPj4+PiAgICAgICAgICAgICAgICAg
c2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4+Pgo+Pj4+ICAgICAg
ICAgcmV0dXJuIHJldDsKPj4+PiAtLQo+Pj4+IDIuNDguMQo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4g
Q2M6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+IEZpeGVzOiBmY2Nh
YTgxZGU4N2UgKCJmMmZzOiBwcmV2ZW50IGF0b21pYyBmaWxlIGZyb20gYmVpbmcgZGlydGllZCBi
ZWZvcmUgY29tbWl0IikKPj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5p
dUB1bmlzb2MuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgNCAtLS0t
Cj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gaW5kZXgg
Mzk2ZWY3MS4uZDRlYTNhZiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+
Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gQEAgLTM3NiwxMCArMzc2LDYgQEAgc3Rh
dGljIGludCBfX2YyZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+
Pj4+PiAgICAgICB9IGVsc2Ugewo+Pj4+PiAgICAgICAgICAgICAgIHNiaS0+Y29tbWl0dGVkX2F0
b21pY19ibG9jayArPSBmaS0+YXRvbWljX3dyaXRlX2NudDsKPj4+Pj4gICAgICAgICAgICAgICBz
ZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4+Pj4+IC0gICAgICAg
ICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsK
Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FU
T01JQ19ESVJUSUVEKTsKPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9k
ZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4+Pj4gLSAgICAgICAgICAgICB9Cj4+Pj4+ICAg
ICAgIH0KPj4+Pj4KPj4+Pj4gICAgICAgX19jb21wbGV0ZV9yZXZva2VfbGlzdChpbm9kZSwgJnJl
dm9rZV9saXN0LCByZXQgPyB0cnVlIDogZmFsc2UpOwo+Pj4+Cj4+Cj4+Cj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
