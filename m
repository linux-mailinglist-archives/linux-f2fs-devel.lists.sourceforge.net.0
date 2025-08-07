Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BABB1D20B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 07:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGvQs+k2F48wVKDKWBVZfMzlc7gS61MzNkGNuZDcLwI=; b=SYArU6JspQzMW+zVkTQZYD1dbe
	C1l23eSH5j6WBd++WI7OK/oEVd432MSyu/++IbgKpk4btXVLFfMKeOKoBTrpWRelhz7DCUPepbiDs
	Sb0PpgRX3B5TlNTtHWjVE8oMe1YR9JLJ9CXCfbhNT/IbM0xtcsBqYP9lo0inQqHDIHxU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujtEJ-0000Fk-6K;
	Thu, 07 Aug 2025 05:31:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ujtEH-0000Fe-P3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 05:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=njZCyAMu9kVs+e9nxOAr6y+cEt3JyrSwGOU1aOFwKhw=; b=dEkmSaliFx+El6jdkCHn05qQfB
 hKXPeIjffGRiySulhultUAo/pSh0AxW30j8MWD9feurbLQEwePVczUOxVuFXm1/aQRysByAoXNZMb
 vqRHzACvyRy0mLiXx9V/x977gd4MUw4+cqBFdq2ien8Qh3sUqlsyg+zScmrw416FVs2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=njZCyAMu9kVs+e9nxOAr6y+cEt3JyrSwGOU1aOFwKhw=; b=NvI/kB3M/owabNCdjMgvOLgIDA
 BA9ZGo5Pic3IYkTZVeRwkIg6Kcq3KrvKriGzYE3axGgvJNinAOhSqcZiok0TonqFNxwuJzITQWYbJ
 OfZ66zOUWrshAXimnnPcorfce9rf6buJkkFv+pSqjKsBxv3ikJDTVoF7hmFDwWQoSwHk=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujtEH-0004rR-6T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 05:31:53 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b78ae64756so70809f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Aug 2025 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754544702; x=1755149502; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=njZCyAMu9kVs+e9nxOAr6y+cEt3JyrSwGOU1aOFwKhw=;
 b=eFVOMMsSzySCWgbawSo+z+MnzIOS8i6f64uX6iTxqI+ktDGOa903LQ2m2dvQT54FOB
 NhpBJSxgHAL2kj8Z3pgu3WdrPy4wUFZ/7arAq5uyVa7/Yvip2+CTjRDceNcCFaGFDHP/
 DY4itl6LK5hzgG6zYGdVGz3bPSuKtQvL/Nq7wp/mEFD4UCQftsduItdOxTvSvx2sT5hu
 0UAhbBxs+zQA1aWQv4hYMNwSbshOHn3wszP8xPKVpC7w50YrhQbuB8G8wr3LqSP8bUU2
 uYfquUBYdBlRqJkXiOY8dGStF+Mam5Kls41yWfcoa5yqIZ50wvkSWq2oPqwaJEXSL/LD
 S/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754544702; x=1755149502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=njZCyAMu9kVs+e9nxOAr6y+cEt3JyrSwGOU1aOFwKhw=;
 b=jq3v7uAPcKd593sCZZij/rDFW2KzwlCVBE2PgrRwMhRaL1hvgvsC2gF2Np3pn6SiIR
 G5mG+5x/9udQxktQv+8ZLNJMNDALj3qxjI3oRI8cDA5kVgdgiuV1KGZ9E9Zvn5xM+wxJ
 zr/P0zFYzA22X9ymMiXNRKf56mHb6PLO2NUp3Vj1U3yLCG0AFeQ5ffzOVW1oe2qco+Yr
 iPPXFVIh6JLPrhyFqTe5bbadKi9XrbixtZPiHhbi3769LsyQ3PG9Y8XZIWJX6M7eWB/P
 1OCl3jKUhkX7MFcrOKnwlH6cuQsxBL8dPBt2zUXVFNF3ztYvJ9wnGvdjQxajVOI+gfBI
 p5Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrx0LXAkvJugNI56WyBjMawFGYGF77KD7W6QaDV+hHlJI8oTD78LHpDYCF1RhfFhIr+UUG3eWjtp3vr3yg1iz6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzvMPUWSr2vi2eqK/XS7g0jclMg+P7NpwrBa4K//mjhD37SLzMI
 c6beX3qy2T34jXu4nAeqJ95hx9/OR/5cYcUZmWrjLBDALx8RweNh6INFRKQ8nncOJpsAUdnGUfU
 +hTNF+OfxgUg09X4VLie6GilqkwqwzwVx+EBN
X-Gm-Gg: ASbGnctdrsm64gYe+lxQ34NQ4Qmmab2YNWrjVhhF7X6eIUDTh6XziCSEtEoFHmEDP2b
 xqSbKBeBtECnixzytNkxbdj9GSL0nbfzm/5yLhFvSigIcAPjtfMMFEUnIKy0SlaFNqvvzco0nFi
 cuBhPvod+uw6+lVl8N7914H22dPT6INLG4Mr2nlF/1d/ql35JtNovzq3kyX+x+svt+Xia30Zsam
 fUoC1gM
X-Google-Smtp-Source: AGHT+IFm5LqeXhOW47Zl3FuUL7jTfekl2INwaEKG+Hodxz8s4tdxlmAYh783y41tz/50OledFd6Ggn0PWg/Yt6oNqvA=
X-Received: by 2002:a05:600c:3d95:b0:459:4441:1c13 with SMTP id
 5b1f17b1804b1-459e710369bmr21082195e9.6.1754544701297; Wed, 06 Aug 2025
 22:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250807034838.3829794-1-chao@kernel.org>
In-Reply-To: <20250807034838.3829794-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Aug 2025 13:31:30 +0800
X-Gm-Features: Ac12FXy7DHOlFps8GQ9i084054Llw7QNVpciKeEv5CLYspV6oxEmfwjDo9keYCI
Message-ID: <CAHJ8P3+tT70BLK38ROh_jiZO-OBWGXDSu65Q0w+ppMW0QHSFSA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年8月7日周四 11:50写道：
    > > This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
    > in order to tune performance of f2fs data flush fl [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1ujtEH-0004rR-6T
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ45pyIN+aXpeWRqOWbmyAxMTo1MOWGmemBk++8mgo+Cj4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHN5c2ZzIGVudHJ5IC9zeXMvZnMvZjJmcy88ZGlz
az4vZmx1c2hfcG9saWN5Cj4gaW4gb3JkZXIgdG8gdHVuZSBwZXJmb3JtYW5jZSBvZiBmMmZzIGRh
dGEgZmx1c2ggZmxvdy4KPgo+IEZvciBleGFtcGxlLCBjaGVja3BvaW50IHdpbGwgdXNlIFJFUV9G
VUEgdG8gcGVyc2lzdCBDUCBtZXRhZGF0YSwgaG93ZXZlciwKPiBzb21lIGtpbmQgZGV2aWNlIGhh
cyBiYWQgcGVyZm9ybWFuY2Ugb24gUkVRX0ZVQSBjb21tYW5kLCByZXN1bHQgaW4gdGhhdAo+IGNo
ZWNrcG9pbnQgYmVpbmcgYmxvY2tlZCBmb3IgbG9uZyB0aW1lLCB3LyB0aGlzIHN5c2ZzIGVudHJ5
LCB3ZSBjYW4gZ2l2ZQo+IGFuIG9wdGlvbiB0byB1c2UgUkVRX1BSRUZMVVNIIGNvbW1hbmQgaW5z
dGVhZCBvZiBSRVFfRlVBIGR1cmluZyBjaGVja3BvaW50LAo+IGl0IGNhbiBoZWxwIHRvIG1pdGln
YXRlIGxvbmcgbGF0ZW5jeSBvZiBjaGVja3BvaW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+IHYzOgo+IC0gZXhwb3J0IGYyZnNfc3VibWl0X2Zs
dXNoX3dhaXQoKQpsb29rcyBnb29kIHRvIG1lLgpSZXZpZXdlZC1ieTogWmhpZ3VvIE5pdSA8emhp
Z3VvLm5pdUB1bmlzb2MuY29tPgoKPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1m
cy1mMmZzIHwgIDkgKysrKysrKysrCj4gIGZzL2YyZnMvY2hlY2twb2ludC5jICAgICAgICAgICAg
ICAgICAgICB8IDExICsrKysrKysrKystCj4gIGZzL2YyZnMvZjJmcy5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA5ICsrKysrKysrKwo+ICBmcy9mMmZzL3NlZ21lbnQuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+ICBmcy9mMmZzL3N5c2ZzLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOSArKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJ
L3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
ZnMtZjJmcwo+IGluZGV4IGJjMGU3ZmVmYzM5ZC4uMmZlZGI0NGI3MTNiIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ICsrKyBiL0RvY3VtZW50
YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+IEBAIC04ODMsMyArODgzLDEyIEBAIERh
dGU6ICAgICAgICAgICAgICBKdW5lIDIwMjUKPiAgQ29udGFjdDogICAgICAgIkRhZWhvIEplb25n
IiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ICBEZXNjcmlwdGlvbjogICBDb250cm9sIEdDIGFs
Z29yaXRobSBmb3IgYm9vc3QgR0MuIDA6IGNvc3QgYmVuZWZpdCwgMTogZ3JlZWR5Cj4gICAgICAg
ICAgICAgICAgIERlZmF1bHQ6IDEKPiArCj4gK1doYXQ6ICAgICAgICAgIC9zeXMvZnMvZjJmcy88
ZGlzaz4vZmx1c2hfcG9saWN5Cj4gK0RhdGU6ICAgICAgICAgIEp1bHkgMjAyNQo+ICtDb250YWN0
OiAgICAgICAiQ2hhbyBZdSIgPGNoYW9Aa2VybmVsLm9yZz4KPiArRGVzY3JpcHRpb246ICAgRGV2
aWNlIGhhcyBkaWZmZXJlbnQgcGVyZm9ybWFuY2UgZm9yIHRoZSBzYW1lIGZsdXNoIG1ldGhvZHMs
IHRoaXMgbm9kZQo+ICsgICAgICAgICAgICAgICBjYW4gYmUgdXNlZCB0byB0dW5lIHBlcmZvcm1h
bmNlIGJ5IHNldHRpbmcgZGlmZmVyZW50IGZsdXNoIG1ldGhvZHMuCj4gKwo+ICsgICAgICAgICAg
ICAgICBwb2xpY3kgdmFsdWUgICAgICAgICAgICBkZXNjcmlwdGlvbgo+ICsgICAgICAgICAgICAg
ICAweDAwMDAwMDAxICAgICAgICAgICAgICBVc2UgcHJlZmx1c2ggaW5zdGVhZCBvZiBmdWEgZHVy
aW5nIGNoZWNrcG9pbnQKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9m
MmZzL2NoZWNrcG9pbnQuYwo+IGluZGV4IGRiMzgzMWY3ZjJmNS4uMjQ1MGUzODJmZTZiIDEwMDY0
NAo+IC0tLSBhL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gKysrIGIvZnMvZjJmcy9jaGVja3BvaW50
LmMKPiBAQCAtMTQxOSw3ICsxNDE5LDkgQEAgc3RhdGljIHZvaWQgY29tbWl0X2NoZWNrcG9pbnQo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ICAgICAgICAgZjJmc19mb2xpb19wdXQoZm9saW8s
IGZhbHNlKTsKPgo+ICAgICAgICAgLyogc3VibWl0IGNoZWNrcG9pbnQgKHdpdGggYmFycmllciBp
ZiBOT0JBUlJJRVIgaXMgbm90IHNldCkgKi8KPiAtICAgICAgIGYyZnNfc3VibWl0X21lcmdlZF93
cml0ZShzYmksIE1FVEFfRkxVU0gpOwo+ICsgICAgICAgZjJmc19zdWJtaXRfbWVyZ2VkX3dyaXRl
KHNiaSwKPiArICAgICAgICAgICAgICAgc2JpLT5mbHVzaF9wb2xpY3kgJiBCSVQoRkxVU0hfUE9M
SUNZX0NQX05PX0ZVQSkgPwo+ICsgICAgICAgICAgICAgICBNRVRBIDogTUVUQV9GTFVTSCk7Cj4g
IH0KPgo+ICBzdGF0aWMgaW5saW5lIHU2NCBnZXRfc2VjdG9yc193cml0dGVuKHN0cnVjdCBibG9j
a19kZXZpY2UgKmJkZXYpCj4gQEAgLTE1OTQsNiArMTU5NiwxMyBAQCBzdGF0aWMgaW50IGRvX2No
ZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3Bj
KQo+Cj4gICAgICAgICBfX3NldF9jcF9uZXh0X3BhY2soc2JpKTsKPgo+ICsgICAgICAgLyogZmx1
c2ggZGV2aWNlIGNhY2hlIHRvIG1ha2Ugc3VyZSBsYXN0IGNwIHBhY2sgY2FuIGJlIHBlcnNpc3Rl
ZCAqLwo+ICsgICAgICAgaWYgKHNiaS0+Zmx1c2hfcG9saWN5ICYgQklUKEZMVVNIX1BPTElDWV9D
UF9OT19GVUEpKSB7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IGYyZnNfc3VibWl0X2ZsdXNoX3dh
aXQoc2JpLCBzYmktPnNiLT5zX2JkZXYpOwo+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgLyoKPiAgICAgICAgICAqIHJlZGlydHkgc3VwZXJibG9jayBpZiBtZXRhZGF0YSBsaWtlIG5v
ZGUgcGFnZSBvciBpbm9kZSBjYWNoZSBpcwo+ICAgICAgICAgICogdXBkYXRlZCBkdXJpbmcgd3Jp
dGluZyBjaGVja3BvaW50Lgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4gaW5kZXggNDZiZTc1NjA1NDhjLi5lN2I4NjZhOThjOTIgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC0xNTk0LDYgKzE1OTQs
MTEgQEAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4IHsKPiAgI2RlZmluZSBNQVhfQ09NUFJFU1Nf
TE9HX1NJWkUgICAgICAgICAgOAo+ICAjZGVmaW5lIE1BWF9DT01QUkVTU19XSU5ET1dfU0laRShs
b2dfc2l6ZSkgICAgICgoUEFHRV9TSVpFKSA8PCAobG9nX3NpemUpKQo+Cj4gK2VudW0gZmx1c2hf
cG9saWN5IHsKPiArICAgICAgIEZMVVNIX1BPTElDWV9DUF9OT19GVUEsCj4gKyAgICAgICBGTFVT
SF9QT0xJQ1lfTUFYLAo+ICt9Owo+ICsKPiAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4gICAgICAg
ICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOyAgICAgICAgICAgICAgICAgLyogcG9pbnRlciB0byBW
RlMgc3VwZXIgYmxvY2sgKi8KPiAgICAgICAgIHN0cnVjdCBwcm9jX2Rpcl9lbnRyeSAqc19wcm9j
OyAgICAgICAgICAvKiBwcm9jIGVudHJ5ICovCj4gQEAgLTE4NDUsNiArMTg1MCw4IEBAIHN0cnVj
dCBmMmZzX3NiX2luZm8gewo+ICAgICAgICAgLyogY2FydmUgb3V0IHJlc2VydmVkX2Jsb2NrcyBm
cm9tIHRvdGFsIGJsb2NrcyAqLwo+ICAgICAgICAgYm9vbCBjYXJ2ZV9vdXQ7Cj4KPiArICAgICAg
IHVuc2lnbmVkIGludCBmbHVzaF9wb2xpY3k7ICAgICAgICAgICAgICAvKiBmbHVzaCBwb2xpY3kg
Ki8KPiArCj4gICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+ICAgICAgICAgc3Ry
dWN0IGttZW1fY2FjaGUgKnBhZ2VfYXJyYXlfc2xhYjsgICAgIC8qIHBhZ2UgYXJyYXkgZW50cnkg
Ki8KPiAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX2FycmF5X3NsYWJfc2l6ZTsgICAgICAvKiBk
ZWZhdWx0IHBhZ2UgYXJyYXkgc2xhYiBzaXplICovCj4gQEAgLTM4MjEsNiArMzgyOCw4IEBAIGlu
dCBmMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSk7Cj4gIHZvaWQg
ZjJmc19hYm9ydF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBjbGVhbik7
Cj4gIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBu
ZWVkKTsKPiAgdm9pZCBmMmZzX2JhbGFuY2VfZnNfYmcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBib29sIGZyb21fYmcpOwo+ICtpbnQgZjJmc19zdWJtaXRfZmx1c2hfd2FpdChzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
YmxvY2tfZGV2aWNlICpiZGV2KTsKPiAgaW50IGYyZnNfaXNzdWVfZmx1c2goc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBuaWRfdCBpbm8pOwo+ICBpbnQgZjJmc19jcmVhdGVfZmx1c2hfY21kX2Nv
bnRyb2woc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiAgaW50IGYyZnNfZmx1c2hfZGV2aWNl
X2NhY2hlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBpbmRleCBjYzgyZDQyZWYxNGMuLmQ2OGM5
MDNmMWFkMyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ICsrKyBiL2ZzL2YyZnMv
c2VnbWVudC5jCj4gQEAgLTU0NCw3ICs1NDQsNyBAQCB2b2lkIGYyZnNfYmFsYW5jZV9mc19iZyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZnJvbV9iZykKPiAgICAgICAgIGYyZnNfc3lu
Y19mcyhzYmktPnNiLCAxKTsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQgX19zdWJtaXRfZmx1c2hfd2Fp
dChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gK2ludCBmMmZzX3N1Ym1pdF9mbHVzaF93YWl0
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCj4gIHsKPiAgICAgICAgIGludCByZXQgPSBi
bGtkZXZfaXNzdWVfZmx1c2goYmRldik7Cj4gQEAgLTU2MiwxMiArNTYyLDEyIEBAIHN0YXRpYyBp
bnQgc3VibWl0X2ZsdXNoX3dhaXQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRfdCBpbm8p
Cj4gICAgICAgICBpbnQgaTsKPgo+ICAgICAgICAgaWYgKCFmMmZzX2lzX211bHRpX2RldmljZShz
YmkpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gX19zdWJtaXRfZmx1c2hfd2FpdChzYmksIHNi
aS0+c2ItPnNfYmRldik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmMmZzX3N1Ym1pdF9mbHVz
aF93YWl0KHNiaSwgc2JpLT5zYi0+c19iZGV2KTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8
IHNiaS0+c19uZGV2czsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIGlmICghZjJmc19pc19kaXJ0
eV9kZXZpY2Uoc2JpLCBpbm8sIGksIEZMVVNIX0lOTykpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IF9fc3VibWl0X2ZsdXNoX3dhaXQo
c2JpLCBGREVWKGkpLmJkZXYpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBmMmZzX3N1Ym1pdF9m
bHVzaF93YWl0KHNiaSwgRkRFVihpKS5iZGV2KTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkK
PiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPiBAQCAtNzQ4LDcg
Kzc0OCw3IEBAIGludCBmMmZzX2ZsdXNoX2RldmljZV9jYWNoZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAgICAgICAgICAg
ICAgICAgZG8gewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IF9fc3VibWl0X2ZsdXNo
X3dhaXQoc2JpLCBGREVWKGkpLmJkZXYpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGYyZnNfc3VibWl0X2ZsdXNoX3dhaXQoc2JpLCBGREVWKGkpLmJkZXYpOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
MmZzX2lvX3NjaGVkdWxlX3RpbWVvdXQoREVGQVVMVF9JT19USU1FT1VUKTsKPiAgICAgICAgICAg
ICAgICAgfSB3aGlsZSAocmV0ICYmIC0tY291bnQpOwo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5
c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiBpbmRleCBmNzM2MDUyZGVhNTAuLmI2OTAxNWYxZGM2
NyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiArKysgYi9mcy9mMmZzL3N5c2ZzLmMK
PiBAQCAtODUyLDYgKzg1MiwxMyBAQCBzdGF0aWMgc3NpemVfdCBfX3NiaV9zdG9yZShzdHJ1Y3Qg
ZjJmc19hdHRyICphLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gICAgICAgICB9
Cj4KPiArICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImZsdXNoX3BvbGljeSIpKSB7
Cj4gKyAgICAgICAgICAgICAgIGlmICh0ID49IEJJVChGTFVTSF9QT0xJQ1lfTUFYKSkKPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgKnVp
ID0gKHVuc2lnbmVkIGludCl0Owo+ICsgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gKyAg
ICAgICB9Cj4gKwo+ICAgICAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAiZ2NfYm9vc3Rf
Z2NfbXVsdGlwbGUiKSkgewo+ICAgICAgICAgICAgICAgICBpZiAodCA8IDEgfHwgdCA+IFNFR1Nf
UEVSX1NFQyhzYmkpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
IEBAIC0xMTc1LDYgKzExODIsNyBAQCBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIoYmxrem9uZV9h
bGxvY19wb2xpY3kpOwo+ICAjZW5kaWYKPiAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGNhcnZl
X291dCk7Cj4gIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihyZXNlcnZlZF9waW5fc2VjdGlvbik7
Cj4gK0YyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihmbHVzaF9wb2xpY3kpOwo+Cj4gIC8qIFNUQVRf
SU5GTyBBVFRSICovCj4gICNpZmRlZiBDT05GSUdfRjJGU19TVEFUX0ZTCj4gQEAgLTEzNzEsNiAr
MTM3OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10gPSB7Cj4gICAg
ICAgICBBVFRSX0xJU1QobWF4X3JlYWRfZXh0ZW50X2NvdW50KSwKPiAgICAgICAgIEFUVFJfTElT
VChjYXJ2ZV9vdXQpLAo+ICAgICAgICAgQVRUUl9MSVNUKHJlc2VydmVkX3Bpbl9zZWN0aW9uKSwK
PiArICAgICAgIEFUVFJfTElTVChmbHVzaF9wb2xpY3kpLAo+ICAgICAgICAgTlVMTCwKPiAgfTsK
PiAgQVRUUklCVVRFX0dST1VQUyhmMmZzKTsKPiAtLQo+IDIuNDkuMAo+Cj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
