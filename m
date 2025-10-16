Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD332BE2AFC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 12:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHcJmzHDI3zLKmLA+I7lNhv0OqqpKEGkCWtwI/VaPOg=; b=mzXbN1NXiWJpZmFVPGs7waXn8a
	k9c58mS4aMhkDW2B7lmpMkxztV1qV2YnN2b+UixZiPCWI4VuXqT1uMArap4PY/D26NFqrFAhV3ULn
	42X3NDyJB6zUPRhbcJzZ24hUsHzCsjJgN1Xx/z9JP250V2PnZnvMde4t95pxaCi50IfE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9Kym-0006WA-N8;
	Thu, 16 Oct 2025 10:13:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v9Kyl-0006W1-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 10:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WbY51Rb1J5ACQQn8QUmZrYSxs6T9YHLQka1a9ZtAoD0=; b=MmpoA9+84PP9QaoMR6L9TWEg/M
 fE4nGq3dV0FaKqwRizhEG82UWX6O5Osskzg886VtHVC7J0T6gLyBHRqkiFpyfTinam9v8CIA4nWLG
 XnWnlrGKPBpSp8DFmqSbs3lti2N8Y2Mg9plDDdr1j46J6701FLeBMuAl36au1z4670tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WbY51Rb1J5ACQQn8QUmZrYSxs6T9YHLQka1a9ZtAoD0=; b=E+BlpC16v5gvpZNosQXjZ0HnS1
 Wv2o2/fAUIROt7YxmRKVY1vZSQDCsFMtGP/rNzxu/BAxmTJcNUmG3Ie7qvPh/LQPetJv4L21f9xaN
 3VqJiCrILo4k8xqvdCR0PfFIzg+QWqWIWVypnfuRgBpSw+CfJpSbeaCiTW6ZYIQRzkLM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9Kyk-00060a-T6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 10:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7ED7F432D5;
 Thu, 16 Oct 2025 10:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74F9C4CEF1;
 Thu, 16 Oct 2025 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760609572;
 bh=ep4WvnFaJAInijuwafHJ8Dba++c9UHnZ3qrBY8flBas=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hwQLh13kZZvuUZKDsuIEU8ZcTAkEFJ1miK2LYvy/sN0Q0BIV75752Zj4Z+GOjMiTo
 FKo5K8Sq6HI8KCXGqGNc0kXdQQtp8b+kY+WYmfIfEyt+mFxAxYCiBm9N56xl0L6kK0
 Qt6DELb7cUFUEGhpTrRM/4XG95+F4QfKsJXETCZ1z7YBTvbeaHzfsNM7SQtl2ghwrj
 KWI0lnMNOUGJZ9P8zdZa3E7njr7Ki/5mE08yIUVl0Yoo6v3LJGfJARp0uUh1EyM9Lz
 +hEEVV8nr/XYxAUwv+bYIj6J2AihdA9euJNUKZpPq0vpefAXkuUWMixqtBQ9gsNraZ
 SgRmf5SQXJRyA==
Message-ID: <5257fece-d947-4a33-8f66-4db5e8b73a28@kernel.org>
Date: Thu, 16 Oct 2025 18:12:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeuk Kim <jeuk20.kim@gmail.com>, jaegeuk@kernel.org
References: <20251016051621.7425-1-jeuk20.kim@gmail.com>
Content-Language: en-US
In-Reply-To: <20251016051621.7425-1-jeuk20.kim@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/16/2025 1:16 PM,
 Jeuk Kim wrote: > From: Jeuk Kim <jeuk20.kim@samsung.com>
 > > Inline encryption derives DUN from <inode, file offset>, > so bios from
 different inodes can't merge. With multi-th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9Kyk-00060a-T6
Subject: Re: [f2fs-dev] [PATCH] f2fs: serialize writeback for inline-crypto
 inodes
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
Cc: hyenc.jeong@samsung.com, jieon.seol@samsung.com, gyusun.lee@samsung.com,
 wone.jung@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, d_hyun.kwon@samsung.com,
 jeuk20.kim@samsung.com, jaemyung.lee@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMTYvMjAyNSAxOjE2IFBNLCBKZXVrIEtpbSB3cm90ZToKPiBGcm9tOiBKZXVrIEtpbSA8
amV1azIwLmtpbUBzYW1zdW5nLmNvbT4KPiAKPiBJbmxpbmUgZW5jcnlwdGlvbiBkZXJpdmVzIERV
TiBmcm9tIDxpbm9kZSwgZmlsZSBvZmZzZXQ+LAo+IHNvIGJpb3MgZnJvbSBkaWZmZXJlbnQgaW5v
ZGVzIGNhbid0IG1lcmdlLiBXaXRoIG11bHRpLXRocmVhZGVkCj4gYnVmZmVyZWQgT19TWU5DIHdy
aXRlcyB3aGVyZSBlYWNoIHRocmVhZCB3cml0ZXMgdG8gaXRzIG93biBmaWxlLAo+IDRLaUItcGVy
LXBhZ2UgTEJBIGFsbG9jYXRpb24gaW50ZXJsZWF2ZXMgYWNyb3NzIGlub2RlcyBhbmQKPiBjYXVz
ZXMgYmlvIHNwbGl0LiBTZXJpYWxpemUgd3JpdGViYWNrIGZvciBmc2NyeXB0IGlubGluZS1jcnlw
dG8KPiBpbm9kZXMgdmlhIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbygpIHRvIGtlZXAgZm9yZWdyb3Vu
ZCB3cml0ZWJhY2sKPiBmb2N1c2VkIG9uIG9uZSBpbm9kZSBhbmQgYXZvaWQgc3BsaXQuCj4gCj4g
VGVzdDogZmlvIC0tbmFtZT13Yl9vc3luYyAtLXJ3PXdyaXRlIC0tYnM9MU0gXAo+ICAgICAgICAt
LXRpbWVfYmFzZWQ9MSAtLXJ1bnRpbWU9NjBzIC0tc2l6ZT0yRyBcCj4gICAgICAgIC0taW9lbmdp
bmU9cHN5bmMgLS1kaXJlY3Q9MCAtLXN5bmM9MSBcCj4gICAgICAgIC0tbnVtam9icz04IC0tdGhy
ZWFkPTEgLS1ucmZpbGVzPTEgXAo+ICAgICAgICAtLWZpbGVuYW1lX2Zvcm1hdD0nd2Jfb3N5bmMu
JGpvYm51bScKPiAKPiBkZXZpY2U6IFVGUwo+IAo+IEJlZm9yZSAtCj4gICAgd3JpdGUgdGhyb3Vn
aHB1dDogNjc1TWlCL3MKPiAgICBkZXZpY2UgSS9PIHNpemUgZGlzdHJpYnV0aW9uIChieSBjb3Vu
dCwgdG90YWwgMTAyNzQxNCk6Cj4gICAgICA0IEtpQjogIDkyMzEzOSAoODkuOSUpCj4gICAgICA4
IEtpQjogIDg0Nzk4ICg4LjMlKQo+ICAgICAg4omlNTEyIEtpQjogNDUzICgwLjAlKQo+IAo+IEFm
dGVyIC0KPiAgICB3cml0ZSB0aHJvdWdocHV0OiAxNzYwTWlCL3MKPiAgICBkZXZpY2UgSS9PIHNp
emUgZGlzdHJpYnV0aW9uIChieSBjb3VudCwgdG90YWwgMjMxNzUwKToKPiAgICAgIDQgS2lCOiAg
MTY5MDQgKDcuMyUpCj4gICAgICA4IEtpQjogIDcyMTI4ICgzMS4xJSkKPiAgICAgIOKJpTUxMiBL
aUI6IDExODkwMCAoNTEuMyUpCj4gCj4gU2lnbmVkLW9mZi1ieTogSmV1ayBLaW0gPGpldWsyMC5r
aW1Ac2Ftc3VuZy5jb20+Cj4gLS0tCj4gICBmcy9mMmZzL2RhdGEuYyB8IDIgKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IGVmMzhlNjJjZGE4Zi4uYWU2ZmI0MzVkNTc2IDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAt
MzIxNyw2ICszMjE3LDggQEAgc3RhdGljIGlubGluZSBib29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9p
byhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgCj4gICAJaWYgKGYyZnNfbmVlZF9jb21wcmVzc19k
YXRhKGlub2RlKSkKPiAgIAkJcmV0dXJuIHRydWU7Cj4gKwlpZiAoZnNjcnlwdF9pbm9kZV91c2Vz
X2lubGluZV9jcnlwdG8oaW5vZGUpKQo+ICsJCXJldHVybiB0cnVlOwo+ICAgCWlmICh3YmMtPnN5
bmNfbW9kZSAhPSBXQl9TWU5DX0FMTCkKPiAgIAkJcmV0dXJuIHRydWU7Cj4gICAJaWYgKGdldF9k
aXJ0eV9wYWdlcyhpbm9kZSkgPj0gU01fSShGMkZTX0lfU0IoaW5vZGUpKS0+bWluX3NlcV9ibG9j
a3MpCgpKZXVrLAoKQ2FuIHlvdSBwbGVhc2UgdHJ5IHR1bmluZyAvc3lzL2ZzL2YyZnMvPGRldj4v
bWluX3NlcV9ibG9ja3MgdG8gc2VlIHdoZXRoZXIgaXQKY2FuIGFjaGl2ZSB0aGUgZ29hbD8KClRo
YW5rcywKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
