Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1BA07603
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 13:46:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVrvj-0001hV-0D;
	Thu, 09 Jan 2025 12:46:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1tVrvh-0001hM-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 12:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NIP3FUTY9ZGq0morxCjsuTG2O/M/qQXCShWOYYWoTPk=; b=YNI3XHHIshcA8+MIX90QTaMvtR
 v0iPPot/fyVBmaPwY03uX34q/U2jMwgUgtnDWETG1nuu2/dqHGRdRR2spuk2AvKaA36InxBJtnylg
 5Ho0n58MWpSFruZWYBIOC3s6/2K5yKcaHsSV6LvBfw0oP+Gjpbf0+mntPub21FKOKMRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NIP3FUTY9ZGq0morxCjsuTG2O/M/qQXCShWOYYWoTPk=; b=OFGfiDpN6O0a9hHKv5LwZOLk8j
 euBlax81nFmLQ7a7R1uIPZ+tGE4mUMN/Y3DhGd5Q/S3swJlHqcVLSoThrOHs7bIohgHMDBxhsCLtV
 XrsxQdLjZ59/MdxfQm5AMPjZSJDBO/XQEpdA7t1l8mi05ip8CmveJcBZV5pVx/CpeADU=;
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tVrvh-0001wF-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 12:46:30 +0000
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6df83fd01cbso3854106d6.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jan 2025 04:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736426784; x=1737031584; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIP3FUTY9ZGq0morxCjsuTG2O/M/qQXCShWOYYWoTPk=;
 b=Viy8jHHjsT/Fxhd2+PKhFSnB0grMcRFF0HyVklOFhZv+2fi4ovS4bvIVa67VnNWLvi
 onFEBESPARvZsQhWBsa2ckJV3EPM+Kh18yo64iWFdC+Fk7t0bc6nfNAPeOT+hMUWgz8L
 aKclkfvq66IwFpXoh2mePvP49gUfqZWJJXwYkQ4Oui2SZyqBKK+x1X2gqDDveX4j7SHw
 pyqtKjnE9ivDoy7E655/BzfPhOUjv961r9T7uX1pfHxJiECqz3Oukssk1GB0FutGjU9k
 ZcQzVRYsW3JtfBp+RafuDXb2/pauj7LFtBqWdwii+a1j6XVuNOb+FZVAPxnRd3hQpGj8
 gkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426784; x=1737031584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIP3FUTY9ZGq0morxCjsuTG2O/M/qQXCShWOYYWoTPk=;
 b=Zjwj3JQTMsFwvh2fpFkhlQVvL+pU6YeODhcM2oYfM5Ow1zamJ+7sFjFkxEttvoy2eK
 +kRKmMA37DXLNnv0bFmWEakCc+8InTFPqWXE2ejhWLdNoTwfRGBgC4EjDHFMXkFh983a
 RBAs+yM287m1F8Ta/46EZYh2R4pY7QxSuo00XvTDbxXoS85WuYQHcjr8uvP/kNSZ+W4+
 ECGoVe1VYYJ54cvY9UKoCNzh17wAzDuRs5CR1AD55od3mc2D99oH3rLaxrFW38ev+/k2
 Xp6u85xkJLckOOPAmV/GRwcFU7yRlzEWPRPfY2fKDpSSbqzD+jMbh7nUMcAS/LN+aEH0
 R46w==
X-Gm-Message-State: AOJu0YyQRKSc5j3C+XmTAV6XnAKAVDBA8vHckUsB45MKuvw/54lunS7O
 G4bsDme+egf7F/fTpu3213AyrSGBkItS1TimwbUGcVfblFj22IBx/xXAaCoWM42DIIfVq9Of1dX
 sayMghtI6IpT58GFtJVJSvd3IOJoi+GXH
X-Gm-Gg: ASbGncu/rJ4U1EZKv3nTjg6JszfE14QGnDf+/rXfZCvBqyD+lfi9hCKO74wFFd39W7m
 zGtkLfROAZvoVAkdCEoArbn7PNhwqRG4pwGM7OdU=
X-Google-Smtp-Source: AGHT+IGR/UQ5mBrokOOgoCOQzSIKG1gnaGBabBL4S96HiPqSoW0c7gonNvsebfozg0JQ3+6+GPXqihVpF07CCqzXOVM=
X-Received: by 2002:a05:6214:5782:b0:6d4:586:6285 with SMTP id
 6a1803df08f44-6df9b1eeabdmr105716676d6.11.1736426783870; Thu, 09 Jan 2025
 04:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
 <Z37D7TRFCvqMoX5U@google.com>
 <CAEJnjmwVm87QVYminhzfJC5So+QFDoad7yfhQKepwRoR5pLsXw@mail.gmail.com>
 <22b3633b-63af-4678-86c5-2ce2a6636f07@kernel.org>
In-Reply-To: <22b3633b-63af-4678-86c5-2ce2a6636f07@kernel.org>
From: YangYang Zang <zangyangyang66@gmail.com>
Date: Thu, 9 Jan 2025 20:46:12 +0800
X-Gm-Features: AbW1kvbHW0w2DKU8dFBRoJHktOGntdAj5-XpVi8c5IW_cUwmvlDtuRftTSTQwto
Message-ID: <CAEJnjmy=Uq3ZF+C-eMysD3kyEn=zAYFgvJFzY9zhKoC4Mgp-xg@mail.gmail.com>
To: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jan 9, 2025 at 6:19 PM Chao Yu wrote: > > On 1/9/25
    10:23, 臧阳阳 wrote: > > Jaegeuk Kim 于2025年1月9日周四 02:29写道：
    > > > >> > >> On 01/06, zangyangyang wrote: > >>> From [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.43 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.43 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [zangyangyang66[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [zangyangyang66[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tVrvh-0001wF-Qa
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
Cc: zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKYW4gOSwgMjAyNSBhdCA2OjE54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDEvOS8yNSAxMDoyMywg6Ien6Ziz6ZizIHdyb3RlOgo+ID4gSmFlZ2V1
ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4g5LqOMjAyNeW5tDHmnIg55pel5ZGo5ZubIDAyOjI5
5YaZ6YGT77yaCj4gPgo+ID4+Cj4gPj4gT24gMDEvMDYsIHphbmd5YW5neWFuZyB3cm90ZToKPiA+
Pj4gRnJvbTogemFuZ3lhbmd5YW5nMSA8emFuZ3lhbmd5YW5nMUB4aWFvbWkuY29tPgo+ID4+Pgo+
ID4+PiBXaGVuIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSBmYWlscywgZjJmc193cml0ZV9j
YWNoZV9wYWdlcwo+ID4+PiB3aWxsIHVzZSB0aGUgbGFzdCAnc3VibWl0dGVkJyB2YWx1ZSBpbmNv
cnJlY3RseSwgd2hpY2ggd2lsbCBjYXVzZQo+ID4+PiAnbndyaXR0ZW4nIGFuZCAnd2JjLT5ucl90
b193cml0ZScgY2FsY3VsYXRpb24gZXJyb3JzCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IHph
bmd5YW5neWFuZzEgPHphbmd5YW5neWFuZzFAeGlhb21pLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IHYz
OiBObyBsb2dpY2FsIGNoYW5nZXMsIGp1c3QgZm9ybWF0IHBhdGNoCj4gPj4+IHYyOiBJbml0aWFs
aXplICJzdWJtaXR0ZWQiIGluIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSgpCj4gPj4+IC0t
LQo+ID4+PiAgIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gPj4+IGluZGV4IDk0ZjdiMDg0ZjYwMS4uZjc3MmZiYzdmMzMxIDEw
MDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4+PiArKysgYi9mcy9mMmZzL2RhdGEu
Ywo+ID4+PiBAQCAtMjgxNiw2ICsyODE2LDkgQEAgaW50IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFf
cGFnZShzdHJ1Y3QgZm9saW8gKmZvbGlvLCBpbnQgKnN1Ym1pdHRlZCwKPiA+Pj4KPiA+Pj4gICAg
ICAgIHRyYWNlX2YyZnNfd3JpdGVwYWdlKGZvbGlvLCBEQVRBKTsKPiA+Pj4KPiA+Pj4gKyAgICAg
aWYgKHN1Ym1pdHRlZCkKPiA+Pj4gKyAgICAgICAgICAgICAqc3VibWl0dGVkID0gMDsKPiA+Pgo+
ID4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0LCBhcyBjYWxsZXJzIHNob3VsZCBoYW5k
bGUgaXQuCj4gPgo+ID4gSGksIENoYW8sIHdoYXQgZG8geW91IHRoaW5rPwo+Cj4gQm90aCBhcmUg
ZmluZSB0byBtZSwgcHJldmlvdXNseSBJIHN1Z2dlc3QgdG8gaGFuZGxlIGl0IGluCj4gZjJmc193
cml0ZV9zaW5nbGVfZGF0YV9wYWdlKCksIGJlY2F1c2UgSSdtIHdvcnJpZWQgYWJvdXQgd2UgbWF5
IG1pc3MgdG8gaGFuZGxlCj4gaXQgaW4gYW55IHBvc3NpYmxlIGNhbGxlciBpbiBmdXJ0aGVyLgoK
VGhhbmsgeW91IHZlcnkgbXVjaCwgQ2hhby4KCkhpLCBLaW0sIElmIHlvdSBzdGlsbCB0aGluayBj
YWxsZXJzIHNob3VsZCBoYW5kbGUgaXQsIEknbGwgc2VuZCBhIG5ldyBwYXRjaC4KClRoYW5rcywK
Pgo+IFRoYW5rcywKPgo+ID4KPiA+IFRoYW5rcwo+ID4KPiA+Pgo+ID4+PiArCj4gPj4+ICAgICAg
ICAvKiB3ZSBzaG91bGQgYnlwYXNzIGRhdGEgcGFnZXMgdG8gcHJvY2VlZCB0aGUga3dvcmtlciBq
b2JzICovCj4gPj4+ICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkgewo+
ID4+PiAgICAgICAgICAgICAgICBtYXBwaW5nX3NldF9lcnJvcihmb2xpby0+bWFwcGluZywgLUVJ
Tyk7Cj4gPj4+IC0tCj4gPj4+IDIuNDMuMgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
