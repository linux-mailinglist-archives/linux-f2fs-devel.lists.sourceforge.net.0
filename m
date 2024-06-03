Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A28548D7CBB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 09:50:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE2SR-00077i-Pa;
	Mon, 03 Jun 2024 07:50:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sE2SQ-00077S-3Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 07:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcPN4Fd/JREnf51v3UQxOuFpsvXKG7aozlTyO4B1d0g=; b=C2qZD8rfitlhxTR4HXF0hROAi2
 U22zFBcbKTaB4zoJxcMZimDF64ehfkf5kJVGHFRarnLIlVvFxG+Y1HF0b7u6iabYc/QJIn1qTzmvp
 xs4NLgshbVDmRcXpfNpVKqJ38TLMmrfbUnQJ6BU2hMxkboNTyKxBtOfooToPfE3F2LJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JcPN4Fd/JREnf51v3UQxOuFpsvXKG7aozlTyO4B1d0g=; b=bG0cXmfTAU+OdguuRd2WcTpKjr
 ac1UUcRMHY0wyhrgj7iXGfTKJPNgE62ZcMP+V8PIipp4+Tw1ZsOW0XFDe68IFQNPBOc4uuVpia29W
 dFsP6OgJW7U8qLFzDxwhch2dei5SLwawa8SdUw6nZRPhDM60e0YtMY6cr4RRkR6U083A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sE2SQ-0003C8-JO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 07:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77F1760B45;
 Mon,  3 Jun 2024 07:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FF0C2BD10;
 Mon,  3 Jun 2024 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717401007;
 bh=9fEUa8FDwmaLhcJXzAHKhcMaSGB5f5Nva+6gt2SaNrQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dATJn8J7VpQPZCMEgOIQ906FUhnCevaMyL4YtFA2RHURmgdxcuulIQr4uup+CBDfV
 VWSBR1PkzphKv3Dd+9xsbjYYtJPg9SPLHTm4kRuI8zqMnFgBSkgpITcSppXsQ9Ztw6
 a3VqLxzbUrXn1uVrL03O/UaSyFgc34jsCgjRIGHiqQxXJspkX0L2SG7qc3la+lJhqc
 PrGpZRCe7nse4ezR2fT9Dd6VijR3JHzuU8UpDDcONNixidm4N2Ec4JESRIxu7Bixii
 WNhIpQWLqh8WEViuqf+gRXT1fOGpTjF1uD6uz4mJZk1fIaafg6fBa/85D1N8ip0oMX
 o5Jo4TojPOsDQ==
Message-ID: <10f4898f-0b8c-4503-8620-3bb566e9a163@kernel.org>
Date: Mon, 3 Jun 2024 15:50:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1717146645-18829-1-git-send-email-zhiguo.niu@unisoc.com>
 <b0c9f3dc-417a-4891-bdf0-25b849828e3b@kernel.org>
 <CAHJ8P3LFkk0YnF-vnsd7wVMHXyhJN43Gfqtq3EBqjxoqgd88mg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3LFkk0YnF-vnsd7wVMHXyhJN43Gfqtq3EBqjxoqgd88mg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/3 14:52, Zhiguo Niu wrote: > On Mon, Jun 3, 2024
    at 2:39 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/5/31 17:10, Zhiguo
    Niu wrote: >>> Use new Macro IOPRIO_PRIO_LEVEL to get ckpt thr [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sE2SQ-0003C8-JO
Subject: Re: [f2fs-dev] [PATCH] f2fs: use new ioprio Macro to get ckpt
 thread ioprio data
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzMgMTQ6NTIsIFpoaWd1byBOaXUgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMywgMjAy
NCBhdCAyOjM54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24g
MjAyNC81LzMxIDE3OjEwLCBaaGlndW8gTml1IHdyb3RlOgo+Pj4gVXNlIG5ldyBNYWNybyBJT1BS
SU9fUFJJT19MRVZFTCB0byBnZXQgY2twdCB0aHJlYWQgaW9wcmlvIGRhdGEobGV2ZWwpLAo+Pj4g
aXQgaXMgbW9yZSBhY2N1cmF0ZSBhbmQgY29uc2lzdGVuIHdpdGggdGhlIHdheSBzZXR0aW5nIGNr
cHQgdGhyZWFkCj4+PiBpb3ByaW8oSU9QUklPX1BSSU9fVkFMVUUoY2xhc3MsIGRhdGEpKS4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4+
PiAtLS0KPj4+ICAgIGZzL2YyZnMvc3lzZnMuYyB8IDIgKy0KPj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPj4+IGluZGV4IDcyNjc2YzUuLjU1ZDQ2ZGEg
MTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMu
Ywo+Pj4gQEAgLTM0MCw3ICszNDAsNyBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiaV9zaG93KHN0
cnVjdCBmMmZzX2F0dHIgKmEsCj4+PiAgICAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAi
Y2twdF90aHJlYWRfaW9wcmlvIikpIHsKPj4+ICAgICAgICAgICAgICAgIHN0cnVjdCBja3B0X3Jl
cV9jb250cm9sICpjcHJjID0gJnNiaS0+Y3ByY19pbmZvOwo+Pj4gICAgICAgICAgICAgICAgaW50
IGNsYXNzID0gSU9QUklPX1BSSU9fQ0xBU1MoY3ByYy0+Y2twdF90aHJlYWRfaW9wcmlvKTsKPj4+
IC0gICAgICAgICAgICAgaW50IGRhdGEgPSBJT1BSSU9fUFJJT19EQVRBKGNwcmMtPmNrcHRfdGhy
ZWFkX2lvcHJpbyk7Cj4+PiArICAgICAgICAgICAgIGludCBkYXRhID0gSU9QUklPX1BSSU9fTEVW
RUwoY3ByYy0+Y2twdF90aHJlYWRfaW9wcmlvKTsKPj4KPj4gU28sIGNhbiB5b3UgcGxlYXNlIHVz
ZSAnbGV2ZWwnIHRvIGluc3RlYWQgJ2RhdGEnIGluIGYyZnNfc2JpX3Nob3coKSBhbmQKPj4gX19z
Ymlfc3RvcmUoKT8KPiBIaSBDaGFvLAo+IAo+IElPUFJJT19QUklPX0RBVEEgaW4gdGhlIG5ldyBr
ZXJuZWwgdmVyc2lvbiBpbmNsdWRlcyB0d28gcGFydHM6IGxldmVsIGFuZCBoaW50Lgo+IEluIF9f
c2JpX3N0b3JlLCAiIElPUFJJT19QUklPX1ZBTFVFKGNsYXNzLCBkYXRhKSIgIGlzIHVzZWQgdG8g
c2V0IGNrcHQKPiBpb3ByaW9yaXR5LAo+IGFuZCBpdCB3aWxsIHBhc3MgZGVmYXVsdCBoaW50IHZh
bHVlLCB3ZSBqdXN0IG5lZWQgdG8ga2VlcCBjbGFzcyAvbGV2ZWwgcmlnaHQuCgpaaGlndW8sCgpJ
IHRoaW5rIGYyZnMgb25seSBzdXBwb3J0IGNvbmZpZ3VyaW5nIHByaW9sZXZlbCByYXRoZXIgdGhh
biBwcmlvbGV2ZWwgYW5kCnByaW9oaW50IG9mIGNrcHQgdGhyZWFkIHZpYSBja3B0X3RocmVhZF9p
b3ByaW8gc3lzZnMgaW50ZXJmYWNlLCBzbyBpdCB3aWxsCmJlIG1vcmUgcmVhZGFibGUgdG8gdXNl
ICdsZXZlbCcgaW5zdGVhZCBvZiAnZGF0YScgaW4gY29udGV4dCBvZiB0aGUgaW50ZXJmYWNlLAp0
aG91Z2h0cz8KClRoYW5rcywKCj4gCj4gICAjZGVmaW5lIElPUFJJT19QUklPX1ZBTFVFKHByaW9j
bGFzcywgcHJpb2xldmVsKSBcCj4gICAgIGlvcHJpb192YWx1ZShwcmlvY2xhc3MsIHByaW9sZXZl
bCwgSU9QUklPX0hJTlRfTk9ORSkKPiBzbyBpIHRoaW5rIHRoaXMgcGFydCBpcyBub3QgbmVlZGVk
IHRvIG1vZGlmeS4KPiAKPiB0aGFua3MhCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiAgICAgICAg
ICAgICAgICBpZiAoY2xhc3MgIT0gSU9QUklPX0NMQVNTX1JUICYmIGNsYXNzICE9IElPUFJJT19D
TEFTU19CRSkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
