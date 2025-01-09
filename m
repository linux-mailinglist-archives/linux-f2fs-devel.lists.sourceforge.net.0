Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E6A072BA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 11:19:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVpdl-0003mc-Vv;
	Thu, 09 Jan 2025 10:19:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tVpdi-0003mS-Nv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 10:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DnGzGN46ABPUYj13iBK41O9rDvHTh/Nk5/6RWM/5X6I=; b=gA9wR9+iWrv/3MSH9eYwoPJZ2q
 EGvUFvbwhrwWyjF9BUwKUsn8FryoGuyoSv7U9JYccOG0Ayqs+nCVEWprcTRExCTUaTD/lQLnbfbjj
 Q74L+NpvVgP3J17mVZMPKunJgBjYHxCJC4bwKAs3jaeX36+7MdBU1xEN7v8SBxLG5txw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DnGzGN46ABPUYj13iBK41O9rDvHTh/Nk5/6RWM/5X6I=; b=hBeMAEA4VpK/Xdb5fNLX9VJWru
 a+xHKJ8pBoeCgHpxwfKqm5erk2aJOrOyZ215pMMBET9NCyplYg1ruxwgmWNLw4HkofHhoIq0wYv4v
 dGLwGwlfliPVNmJTmFq4pilHozAjV7difK7BXJDb+hoq9iwUQuU39lgKZA8/C00UWZZc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVpdi-00014f-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 10:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CDD2A417BF;
 Thu,  9 Jan 2025 10:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46A2C4CED2;
 Thu,  9 Jan 2025 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736417975;
 bh=/lnpVRbIiNnAMXvuz8l3NCVw6gk1GOjOPRD83aNR0pA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dtg8fgSC+TBewhD0wc0s2bhlkd5irpTcCY+jRmy3FM8GSYQAmnlwAP9yp0HvGiP+1
 9SvGHqlmZeyyph9C+c8LpzZeA7KJfpAXK/uTgg16PjqiPkwyrCNjmL37szBEXMPwkL
 uZDsIEhjro1UoyASgCPz6XbV6kbS98kjdj42wO6N+MLsltZkhz6iXdHfJsZHFRohAE
 JwPV72Hkk4Sz0IQdacVTxhnHAav2YCTkUFKugLRBVukFyCPc2a1gfmEhKzuMscfvUb
 kPZuDavllQAhww8bSxv8ELUJis0UF+ShUa1sIXr8s/5L814nIUNmJU3EaTiAywrGm1
 VNe3H11rpH8nQ==
Message-ID: <22b3633b-63af-4678-86c5-2ce2a6636f07@kernel.org>
Date: Thu, 9 Jan 2025 18:19:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?6Ien6Ziz6Ziz?= <zangyangyang66@gmail.com>
References: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
 <Z37D7TRFCvqMoX5U@google.com>
 <CAEJnjmwVm87QVYminhzfJC5So+QFDoad7yfhQKepwRoR5pLsXw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEJnjmwVm87QVYminhzfJC5So+QFDoad7yfhQKepwRoR5pLsXw@mail.gmail.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 1/9/25 10:23, 臧阳阳 wrote: > Jaegeuk Kim <jaegeuk@kernel.org>
    于2025年1月9日周四 02:29写道： > >> >> On 01/06, zangyangyang wrote:
    >>> From: zangyangyang1 <zangyangyang1@xiaomi.com> >> [...] 
 
 Content analysis details:   (-2.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVpdi-00014f-N7
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix using wrong 'submitted' value
 in f2fs_write_cache_pages
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
Cc: zangyangyang1 <zangyangyang1@xiaomi.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS85LzI1IDEwOjIzLCDoh6fpmLPpmLMgd3JvdGU6Cj4gSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4g5LqOMjAyNeW5tDHmnIg55pel5ZGo5ZubIDAyOjI55YaZ6YGT77yaCj4gCj4+
Cj4+IE9uIDAxLzA2LCB6YW5neWFuZ3lhbmcgd3JvdGU6Cj4+PiBGcm9tOiB6YW5neWFuZ3lhbmcx
IDx6YW5neWFuZ3lhbmcxQHhpYW9taS5jb20+Cj4+Pgo+Pj4gV2hlbiBmMmZzX3dyaXRlX3Npbmds
ZV9kYXRhX3BhZ2UgZmFpbHMsIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMKPj4+IHdpbGwgdXNlIHRo
ZSBsYXN0ICdzdWJtaXR0ZWQnIHZhbHVlIGluY29ycmVjdGx5LCB3aGljaCB3aWxsIGNhdXNlCj4+
PiAnbndyaXR0ZW4nIGFuZCAnd2JjLT5ucl90b193cml0ZScgY2FsY3VsYXRpb24gZXJyb3JzCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogemFuZ3lhbmd5YW5nMSA8emFuZ3lhbmd5YW5nMUB4aWFvbWku
Y29tPgo+Pj4gLS0tCj4+PiB2MzogTm8gbG9naWNhbCBjaGFuZ2VzLCBqdXN0IGZvcm1hdCBwYXRj
aAo+Pj4gdjI6IEluaXRpYWxpemUgInN1Ym1pdHRlZCIgaW4gZjJmc193cml0ZV9zaW5nbGVfZGF0
YV9wYWdlKCkKPj4+IC0tLQo+Pj4gICBmcy9mMmZzL2RhdGEuYyB8IDMgKysrCj4+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gaW5kZXggOTRmN2IwODRmNjAxLi5mNzcyZmJjN2Yz
MzEgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysrIGIvZnMvZjJmcy9kYXRh
LmMKPj4+IEBAIC0yODE2LDYgKzI4MTYsOSBAQCBpbnQgZjJmc193cml0ZV9zaW5nbGVfZGF0YV9w
YWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIGludCAqc3VibWl0dGVkLAo+Pj4KPj4+ICAgICAgICB0
cmFjZV9mMmZzX3dyaXRlcGFnZShmb2xpbywgREFUQSk7Cj4+Pgo+Pj4gKyAgICAgaWYgKHN1Ym1p
dHRlZCkKPj4+ICsgICAgICAgICAgICAgKnN1Ym1pdHRlZCA9IDA7Cj4+Cj4+IEkgZG9uJ3QgdGhp
bmsgdGhpcyBpcyBjb3JyZWN0LCBhcyBjYWxsZXJzIHNob3VsZCBoYW5kbGUgaXQuCj4gCj4gSGks
IENoYW8sIHdoYXQgZG8geW91IHRoaW5rPwoKQm90aCBhcmUgZmluZSB0byBtZSwgcHJldmlvdXNs
eSBJIHN1Z2dlc3QgdG8gaGFuZGxlIGl0IGluIApmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2Uo
KSwgYmVjYXVzZSBJJ20gd29ycmllZCBhYm91dCB3ZSBtYXkgbWlzcyB0byBoYW5kbGUgCml0IGlu
IGFueSBwb3NzaWJsZSBjYWxsZXIgaW4gZnVydGhlci4KClRoYW5rcywKCj4gCj4gVGhhbmtzCj4g
Cj4+Cj4+PiArCj4+PiAgICAgICAgLyogd2Ugc2hvdWxkIGJ5cGFzcyBkYXRhIHBhZ2VzIHRvIHBy
b2NlZWQgdGhlIGt3b3JrZXIgam9icyAqLwo+Pj4gICAgICAgIGlmICh1bmxpa2VseShmMmZzX2Nw
X2Vycm9yKHNiaSkpKSB7Cj4+PiAgICAgICAgICAgICAgICBtYXBwaW5nX3NldF9lcnJvcihmb2xp
by0+bWFwcGluZywgLUVJTyk7Cj4+PiAtLQo+Pj4gMi40My4yCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
