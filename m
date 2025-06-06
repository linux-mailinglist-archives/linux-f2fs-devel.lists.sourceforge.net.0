Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FACACFE1D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 10:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dik/IjHpOlFD3ymcOgMXXcJFys56sFsPlxVqfSBPUdk=; b=CstONkdZcS1DuzUAOFYyV2HWiG
	CjphFZWsg0PF9qFgdQMxI6E9oocmjN3fKVz99awPc1hb+Bc3m+mZbZ03SEgLzjA2f2vFoJptvV1bt
	lQ3rvd+qx4r2Aumr2OFfnadph0xo5/O7MHlgR5sDekxMJ4ZIsfBUFESDhuwIfUJGresc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNSIL-0003i1-3Y;
	Fri, 06 Jun 2025 08:19:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uNSIK-0003hq-6E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 08:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVbD5NUQ/XkELIOux8b5MouFc4zPBH1LEjMZxtCE4/c=; b=XNgt+AedmVi3VvZYir3nLg+rAK
 9y7UmBVsNfYTSeWquTc4NpAOL2K8q8p7xljfY8G+mjCNaY9Idc/sx+KTRBIlq2IaAWa/7zov/qGGb
 /FWhJDUr7gWJCWQlb/oOZ8yRpUKds5C7r9ioDkvZhoTiJ9jKXHl624yrZwvuIPR3wuRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oVbD5NUQ/XkELIOux8b5MouFc4zPBH1LEjMZxtCE4/c=; b=euqRtcR9/ErHpRi2rdnMNWpZ6l
 8gdXiKOFa5mx6/Q8bEvb9LSxv+f135Snlp4VZj5vwKZlZySIXPiyrj/ZOI0Yqr9H4gaKhu0X/VAUU
 XuBF+NO3T81z//8fjdT90gsvD78LJ4clj3SiyF1q0YA3e7rjW5cHWVJkEpNrn0y1mcyg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uNSIJ-0004B7-Lx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 08:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EA105C61F9;
 Fri,  6 Jun 2025 08:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F5CC4CEEB;
 Fri,  6 Jun 2025 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749197948;
 bh=js27XaiyfSBuPotFoe62EWmQskDZ2m4TzKJV3gZgDWo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YrpcKgiW2/G2qXzRl8zi5h/hgD/NDThGoWXubr2W71d57uUgCcM3IJuIkx+uxd1jj
 Ck1CGE8+RhlNHboIZsFXk6nWxZhnPek7Zh38p6WwjsNanVvU/sQR9K7yKxdouiQWrL
 ZHHyd41fWWDl94oRkbcsf3eTP5BJuP8cJngLgyiqc29fpGIfL2lxNrioFM/KPUZXCe
 MXE6PWm400UG+s1z4WJV5M0fHoc7dO6N7U8/gnzCPELFwO8VjBrUPPWZlYz5OpBBN2
 e7y+Ksq4KhkYqjy67NfgGqE0IGX7J9SRgT+iVGWtmVON/zS7MgOMgZeFN3lAyd/gMT
 AHUwJbZMWxQlg==
Message-ID: <c59ca0a0-b976-4d94-bd40-4749a038ef79@kernel.org>
Date: Fri, 6 Jun 2025 16:19:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
 <ab8d88cb-bfb8-44eb-9cd8-89cf7216e728@kernel.org>
 <CAHJ8P3LuRQ8AgYYfMic44MmO7WeV0Y+CZ9DtMDMQMbmXzu2FqQ@mail.gmail.com>
 <b018b7b6-3e45-49cd-b146-02288ffedf1a@kernel.org>
 <CAHJ8P3JS4iVmepJuOjNmL2k8JBEU7F_Lv9-XD9cGniKp2U5F1Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JS4iVmepJuOjNmL2k8JBEU7F_Lv9-XD9cGniKp2U5F1Q@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 6/5/25 18:43, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年6月5日周四 17:28写道： >> >> On 4/27/25 09:49, Zhiguo Niu
    wrote: >>> Hi Chao >>> >>> Chao Yu <chao@kernel.org> 于2025� [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uNSIJ-0004B7-Lx
Subject: Re: [f2fs-dev] f2fs node footer data corruption in Android device
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi81LzI1IDE4OjQzLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4g5LqOMjAyNeW5tDbmnIg15pel5ZGo5ZubIDE3OjI45YaZ6YGT77yaCj4+Cj4+IE9uIDQv
MjcvMjUgMDk6NDksIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBIaSBDaGFvCj4+Pgo+Pj4gQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NOaciDI15pel5ZGo5LqUIDEzOjMw5YaZ6YGT
77yaCj4+Pj4KPj4+PiBaaGlndW8sCj4+Pj4KPj4+PiBPbiA0LzI1LzI1IDEzOjExLCBaaGlndW8g
Tml1IHdyb3RlOgo+Pj4+PiBIaSBDaGFvIGFuZCBKYWVnZXVrLAo+Pj4+Pgo+Pj4+PiBJIGVuY291
bnRlcmVkIGEgcHJvYmxlbSB3aXRoIG5vZGUgZm9vdGVyIGRhdGEgYmVpbmcgY29ycnVwdGVkIG9u
IGFuCj4+Pj4+IEFuZHJvaWQgZGV2aWNlLihrZXJuZWwgdmVyc2lvbiA2LjYgYW5kIGFuZHJvaWQg
dmVyc2lvbjoxNSkKPj4+Pj4gYWZ0ZXIgSSBtZXJnZWQgdGhlIGZvbGxvd2luZyBwYXRjaGVzLCB0
aGUgcHJvYmxlbSBzdGlsbCBleGlzdHMuCj4+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQvY29tbWl0Lz9oPWRl
di10ZXN0JmlkPWViYTA4NDE0YzU4NWY5MDc2MGM0MzEyZjU3ZGVhNzhlYTQ1Y2I1Y2IKPj4+Pj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9m
MmZzLmdpdC9jb21taXQvZnMvZjJmcz9oPWRldi10ZXN0JmlkPTE5NDI2YzQ5ODhhYTg1Mjk4YzFi
NGNhZjI4ODlkMzdlYzVjODBmZWEKPj4+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9mMmZzLmdpdC9jb21taXQvZnMvZjJmcz9oPWRldi10
ZXN0JmlkPWMyZWNiYTAyNjU4NmNkYTZjN2RjMGZlOWU2ZTYwZTdlOTM4NmMzYmQKPj4+Pj4gYW5k
IHRoZXJlIGlzIG5vIG5hdF9iaXRzIGluIG1vdW50IG9wdGlvbi4KPj4+Pj4KPj4+Pj4gSSBhbSBz
dGlsbCBkZWJ1Z2dpbmcsIGFuZCB3b3VsZCBsaWtlIHRvIGFzayBkbyB5b3UgaGF2ZSBhbnkgb3Ro
ZXIKPj4+Pj4gaGludHMgb3Igc3VnZ2VzdGlvbnM/Cj4+Pj4+IFRoZSBpc3N1ZSBzZWVtIHRvIGJl
IGNsb3NlbHkgcmVsYXRlZCB0byBhZGIgcmVtb3VudC4KPj4+Pj4KPj4+Pj4gdGVzdCBzdGVwczoK
Pj4+Pj4gcGluZyAxMjcuMC4wLjEgLW4gMjAgPiBudWwKPj4+Pj4gYWRiLmV4ZSAtcyBteWRldmlj
ZSAgd2FpdC1mb3ItZGV2aWNlCj4+Pj4+IGFkYi5leGUgIC1zIG15ZGV2aWNlIHJlYm9vdCBib290
bG9hZGVyCj4+Pj4+IGZhc3Rib290IC1zIG15ZGV2aWNlICBlcmFzZSB1c2VyZGF0YQo+Pj4+PiBm
YXN0Ym9vdCAtcyBteWRldmljZSAgZXJhc2UgY2FjaGUKPj4+Pj4gZmFzdGJvb3QgLXMgbXlkZXZp
Y2UgIHJlYm9vdAo+Pj4+PiBwaW5nIDEyNy4wLjAuMSAtbiAzMCA+IG51bAo+Pj4+PiBhZGIuZXhl
IC1zIG15ZGV2aWNlIHdhaXQtZm9yLWRldmljZQo+Pj4+PiBhZGIuZXhlIC1zIG15ZGV2aWNlIHJv
b3QKPj4+Pj4gYWRiLmV4ZSAtcyBteWRldmljZSByZW1vdW50Cj4+Pj4KPj4+PiBBbnkgY2hhbmdl
IGZvciBtb3VudCBvcHRpb24/IENhbiB5b3UgcHJvdmlkZSBtb3VudCBvcHRpb24gYmVmb3JlL2Fm
dGVyCj4+Pj4gcmVtb3VudD8KPj4+Pgo+Pj4+PiBhZGIuZXhlIC1zIG15ZGV2aWNlIHNoZWxsICAg
cm0gLXJmIC9kYXRhL3NvbWVmaWxlLyoKPj4+Pgo+Pj4+IEhvdyBhYm91dCBlbmFibGluZyBhbGwg
ZjJmcyB0cmFjZXBvaW50cyB0byBjYXRjaCBob3cgdGFyZ2V0IG5vZGUgd2FzCj4+Pj4gdXBkYXRl
ZD8KPj4+IFRoYW5rcyBmb3IgeW91ciBxdWljayBmZWVkYmFjaywgdGhpcyBpcyBhIHVzZWZ1bCBz
dWdnZXN0aW9uLgo+Pj4gVGhhbmtzIGEgbG90Lgo+Pgo+PiBIaSBaaGlndW8sCj4+Cj4+IENhbiB0
aGlzIHRlc3RjYXNlIHJlcHJvZHVjZSB0aGUgYnVnIHN0YWJseT8gYW5kIGFueSBwcm9ncmVzcyBv
biB0aGlzIGlzc3VlPwo+IEhpIENoYW8sCj4gYWZ0ZXIgZGVidWcsIHRoZSByZWFzb24gb2YgdGhl
IHByb2JsZW0gaXMgdGhlICJjYXNlIGl0c2VsZiIKPiBEYXRhIGVuY3J5cHRlZCBpcyBlbmFibGVk
IGluIGFuZHJvaWQgcGxhdGZvcm0sICBzbyB3aGVuIGZ1bGwgZXJhc2UKPiB1c2VyZGF0YSBwYXJ0
aXRpb24gLAo+IHRoZSBtZXRhZGF0IHBhcnRpdGlvbiBpcyBhbHNvIG5lZWRlZCB0byBlcmFzZSwg
IG90aGVyd2lzZSAgdGhlcmUgd2lsbAo+IGJlIHByb2JhYmlsaXN0aWMgIGRhdGEgZGVjcnlwdGlv
biBpc3N1ZS4KPiBjYXVzZSBpbm9kZSBtZXRhZGF0YSBtZXNzZWQgdXAuCj4gdGhpcyBpc3N1ZSB3
aWxsIG5vIHJlcHJvZHVjZSBhZnRlciBhZGQ6Cj4gZmFzdGJvb3QgLXMgbXlkZXZpY2UgIGVyYXNl
IG1ldGFkYXRhCj4gaW4gc2NyaXB0cy4KPiB0aGFua3MgZm9yIHlvdXIgc3VnZ2VudGlvbnMgYW5k
IGZvY3VzIG9uLl5eCgpaaGlndW8sCgpBaCwgZ290IGl0LCB0aGFua3MgZm9yIHlvdXIgZXhwbGFu
YXRpb24uCgo+PiBUaGFua3MsCj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4g
ZG1lc2c6Cj4+Pj4+IGRtLTU5OiB1c2VyZGF0YSBwYXJ0aXRpb24sIGRtLTc6IHNjcmF0Y2ggaW1h
Z2UgcGFydGl0aW9uIGlzIGZvciBhZGIgcmVtb3VudAo+Pj4+PiBbICAgIDMuODkzNjMwXSBGMkZT
LWZzIChkbS01OSk6IFVzaW5nIGVuY29kaW5nIGRlZmluZWQgYnkgc3VwZXJibG9jazoKPj4+Pj4g
dXRmOC0xMi4xLjAgd2l0aCBmbGFncyAweDAKPj4+Pj4gWyAgICAzLjkzMDIxM10gRjJGUy1mcyAo
ZG0tNTkpOiBNb3VudGVkIHdpdGggY2hlY2twb2ludCB2ZXJzaW9uID0gMzg0ODViMmQKPj4+Pj4g
WyAgIDIwLjU4NDE2OV0gRjJGUy1mcyAoZG0tNyk6IE1vdW50ZWQgd2l0aCBjaGVja3BvaW50IHZl
cnNpb24gPSA0MjEzMGVmCj4+Pj4+IFsgICAzOC4wMzkxMjJdIEYyRlMtZnMgKGRtLTU5KTogaW5j
b25zaXN0ZW50IG5vZGUgYmxvY2ssIG5pZDoxNDI2LAo+Pj4+PiBub2RlX2Zvb3RlcltuaWQ6MTI5
NTY1MDIxLGlubzoyNzU2MDYyMjk4LG9mczoyNjc4Mjg0NSxjcHZlcjo2NDIxNzAzMTY1MTc5ODI2
OTEyLGJsa2FkZHI6MzU3Nzg1MTE0N10KPj4+Pj4gWyAgIDM4LjA0ODMxMF0gRjJGUy1mcyAoZG0t
NTkpOiBpbmNvbnNpc3RlbnQgbm9kZSBibG9jaywgbmlkOjE0MjYsCj4+Pj4+IG5vZGVfZm9vdGVy
W25pZDoxMjk1NjUwMjEsaW5vOjI3NTYwNjIyOTgsb2ZzOjI2NzgyODQ1LGNwdmVyOjY0MjE3MDMx
NjUxNzk4MjY5MTIsYmxrYWRkcjozNTc3ODUxMTQ3XQo+Pj4+PiBbICAgMzguMDUxNzI1XSBGMkZT
LWZzIChkbS01OSk6IGluY29uc2lzdGVudCBub2RlIGJsb2NrLCBuaWQ6MTQyNiwKPj4+Pj4gbm9k
ZV9mb290ZXJbbmlkOjEyOTU2NTAyMSxpbm86Mjc1NjA2MjI5OCxvZnM6MjY3ODI4NDUsY3B2ZXI6
NjQyMTcwMzE2NTE3OTgyNjkxMixibGthZGRyOjM1Nzc4NTExNDddCj4+Pj4+IHRoYW5rcwo+Pj4+
Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
