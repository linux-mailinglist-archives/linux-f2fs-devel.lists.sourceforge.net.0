Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F399B7703
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2024 10:03:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6R52-000132-Lr;
	Thu, 31 Oct 2024 09:03:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1t6R4y-000110-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 09:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diCjjIIPfoFiLPd26Ivqm5QC54mYBh2hOIyG4081rTs=; b=MkF87KhMiWUpKUf+386axT8cPU
 1Zg/FIvumFuMUr5jPaGljK/0pxsua6QyPbf1ZAKKfZV5pqvNQLzjtBDpYpupP8bnP2HMlg0Oq6K/j
 X2jywNhPAnG5FCoSVWCHHcRagQY04wLyg7o1dyydJXDxNdYbZCJ4HH9wib+wKoWtwQc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=diCjjIIPfoFiLPd26Ivqm5QC54mYBh2hOIyG4081rTs=; b=MthzHF5+I3E4RaUUBAgPo7cJqJ
 kfRTNMsrLsk/W6nYZj1amctJHYgZVFZOyKyP/VOfkDnT4LMxPbf/mWgFDiCOXZ+GoTHnOw4HDCify
 j4ZUZyL3+l8AKszXKXGIwldCrwghO+uwgXK2zDELIBI1VLilJg/0HJXwoyV8roB53wEk=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t6R4y-0000Fw-OH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 09:02:57 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so711770e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Oct 2024 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730365365; x=1730970165; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diCjjIIPfoFiLPd26Ivqm5QC54mYBh2hOIyG4081rTs=;
 b=buhhhjg5Du5MzcFPZk8gyEjByAiJCQ1rfgevxr5Ul3k17MYw+6oE2Qs283EOGEuqcR
 eUBSBy6AFJ0zrwHFlVUhadrlCjbdZxr38Puu2cXx5Qxgw9F8n5U+sYg3HaQB7ENPMSGL
 v3WYMAAsaceNyd1v474Hdj/l/NH8kNOVN7khqMmKn4AQV5YQp7v3ePDyiSCRQHR0f/Nd
 HeZVMhVEj5oPbC30WRo/KsmD7e6Q/PtJWFWzqziiktwtLwMqTzwZ6cYz7N9DCNA48lM/
 7MyQHKAJwWTXlX/RDPTVL4RfDN9j41a/NLNlyPoYcb9r1mJoMzkkx3mOjIg2SoN/hB4O
 bLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730365365; x=1730970165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diCjjIIPfoFiLPd26Ivqm5QC54mYBh2hOIyG4081rTs=;
 b=ghf7PKJZUMCO3+ah3sMrj3lOD4LtFOxbt8mnjT7jaD8QZNMvub8xzSUUHKhyl/RcBd
 ByvfpLbQIlyXh25yCZyBohRkLqkDkU8nVxmGIsoLgXP2feMHY8RoztO43UJoAaSmTcrX
 1c8aM5gBtQATyqIVTZpf0p00kt7u4FeHqvAAVhU1hbNbo+vxhHSl3SakjGtAQWniVEYJ
 8nohQn7TZKyGVfOEft5Z5uKdCKi/VjsI07IRWLANEMn5Xzww/6+rTL/o7lY01e4fEOv9
 KkFYvOhTLyoDURCkuLY3MIioOjKKqEVyj1SrMBaW9DaGJj9XFvLoTBl/Ledeaqzo7skd
 L3WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+8szK5mQ4/Pi9gpsh0yoxVmmNpTNoz2kShZJ+XrayA/l2LA3kvQxf4AaoL3liWG0Ywj94z3m6LH5ExKsTJxm8@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzw6YE4cNQrWTV33upbRoDmWecb0XrhvMP3ZlCCJQ6RQXEXcIkO
 DY+edRgZEVHb9f4g3yBNkMq5m4+nRLKp5QpQwxp4uO+6ZyzRHWrWId8Pn+PU1r37xN6paZKDqsQ
 2N1fvnD+YmtFR+Thpe9xV7+34AUNLRJLgKn4=
X-Google-Smtp-Source: AGHT+IFQZfON1PaqZk2EwYmBP+wro619qFeGCKNYvjbn6elze4HaRm1SsdtZymT+f05/Why++IhChf3AUyCzbSq0BE4=
X-Received: by 2002:a05:6512:b02:b0:539:adb0:b76 with SMTP id
 2adb3069b0e04-53b348ce5camr9006161e87.15.1730365364803; Thu, 31 Oct 2024
 02:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
 <20241030103136.2874140-3-yi.sun@unisoc.com>
 <036ed265-23c1-4a16-a1bb-452b90e8cf1f@kernel.org>
In-Reply-To: <036ed265-23c1-4a16-a1bb-452b90e8cf1f@kernel.org>
From: yi sun <sunyibuaa@gmail.com>
Date: Thu, 31 Oct 2024 17:02:08 +0800
Message-ID: <CALpufv1JOLN_6iS66thD6KhkY9TAeQd6E5nRoC4uH1kSBWGftA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Oct 31, 2024 at 3:26 PM Chao Yu wrote: > > On 2024/10/30
    18:31, Yi Sun wrote: > > New function f2fs_invalidate_compress_pages_range()
    adds the @len > > parameter. So it can process some co [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t6R4y-0000Fw-OH
Subject: Re: [f2fs-dev] [PATCH v2 2/5] f2fs: expand
 f2fs_invalidate_compress_page() to f2fs_invalidate_compress_pages_range()
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
Cc: ke.wang@unisoc.com, Yi Sun <yi.sun@unisoc.com>,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMzoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEwLzMwIDE4OjMxLCBZaSBTdW4gd3JvdGU6Cj4gPiBOZXcg
ZnVuY3Rpb24gZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzX3JhbmdlKCkgYWRkcyB0aGUg
QGxlbgo+ID4gcGFyYW1ldGVyLiBTbyBpdCBjYW4gcHJvY2VzcyBzb21lIGNvbnNlY3V0aXZlIGJs
b2NrcyBhdCBhIHRpbWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWWkgU3VuIDx5aS5zdW5AdW5p
c29jLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2NvbXByZXNzLmMgfCA3ICsrKystLS0KPiA+
ICAgZnMvZjJmcy9mMmZzLmggICAgIHwgOSArKysrKy0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gaW5kZXggN2YyNjQ0MGU4
NTk1Li5lNjA3YTc4ODViNTcgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPiA+
ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gQEAgLTE5MDMsMTEgKzE5MDMsMTIgQEAgc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKkNPTVBSRVNTX01BUFBJTkcoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQo+ID4gICAgICAgcmV0dXJuIHNiaS0+Y29tcHJlc3NfaW5vZGUtPmlfbWFwcGluZzsKPiA+
ICAgfQo+ID4KPiA+IC12b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRyKQo+ID4gK3ZvaWQgZjJmc19pbnZhbGlk
YXRlX2NvbXByZXNzX3BhZ2VzX3JhbmdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrX3QgYmxrYWRkciwgdW5zaWduZWQgaW50
IGxlbikKPiA+ICAgewo+ID4gLSAgICAgaWYgKCFzYmktPmNvbXByZXNzX2lub2RlKQo+ID4gKyAg
ICAgaWYgKCFzYmktPmNvbXByZXNzX2lub2RlIHx8IGxlbiA9PSAwKQo+Cj4gV2UgY2FuIHJlbW92
ZSBsZW4gPT0gMCBjaGVjayBjb25kaXRpb24/IE9yIGFueSBjYWxsZXIgY2FuIHBhc3MgMCBoZXJl
Pwo+Cj4gVGhhbmtzLAo+CgpZZXMsIGxlbj09MCBjYW4gYmUgcmVtb3ZlZC4KCj4gPiAgICAgICAg
ICAgICAgIHJldHVybjsKPiA+IC0gICAgIGludmFsaWRhdGVfbWFwcGluZ19wYWdlcyhDT01QUkVT
U19NQVBQSU5HKHNiaSksIGJsa2FkZHIsIGJsa2FkZHIpOwo+ID4gKyAgICAgaW52YWxpZGF0ZV9t
YXBwaW5nX3BhZ2VzKENPTVBSRVNTX01BUFBJTkcoc2JpKSwgYmxrYWRkciwgYmxrYWRkciArIGxl
biAtIDEpOwo+ID4gICB9Cj4gPgo+ID4gICB2b2lkIGYyZnNfY2FjaGVfY29tcHJlc3NlZF9wYWdl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5kZXggM2M2ZjNjY2U1
Nzc5Li5kM2ZlNjZhOTNhNTYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gKysr
IGIvZnMvZjJmcy9mMmZzLmgKPiA+IEBAIC00Mzg0LDcgKzQzODQsOCBAQCB2b2lkIGYyZnNfZGVz
dHJveV9wYWdlX2FycmF5X2NhY2hlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAgIGlu
dCBfX2luaXQgZjJmc19pbml0X2NvbXByZXNzX2NhY2hlKHZvaWQpOwo+ID4gICB2b2lkIGYyZnNf
ZGVzdHJveV9jb21wcmVzc19jYWNoZSh2b2lkKTsKPiA+ICAgc3RydWN0IGFkZHJlc3Nfc3BhY2Ug
KkNPTVBSRVNTX01BUFBJTkcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+IC12b2lkIGYy
ZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxv
Y2tfdCBibGthZGRyKTsKPiA+ICt2b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlc19y
YW5nZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJsb2NrX3QgYmxrYWRkciwgdW5zaWduZWQgaW50IGxlbik7Cj4gPiAg
IHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBuaWRfdCBpbm8sIGJsb2NrX3QgYmxrYWRkcik7Cj4gPiAgIGJvb2wgZjJm
c19sb2FkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBw
YWdlICpwYWdlLAo+ID4gQEAgLTQ0MzksOCArNDQ0MCw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IGYy
ZnNfaW5pdF9wYWdlX2FycmF5X2NhY2hlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkgeyByZXR1
cm4KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfZGVzdHJveV9wYWdlX2FycmF5X2NhY2hl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkgeyB9Cj4gPiAgIHN0YXRpYyBpbmxpbmUgaW50IF9f
aW5pdCBmMmZzX2luaXRfY29tcHJlc3NfY2FjaGUodm9pZCkgeyByZXR1cm4gMDsgfQo+ID4gICBz
dGF0aWMgaW5saW5lIHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNzX2NhY2hlKHZvaWQpIHsgfQo+
ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZShzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bG9ja190IGJsa2FkZHIpIHsgfQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2ludmFsaWRh
dGVfY29tcHJlc3NfcGFnZXNfcmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyLCB1bnNpZ25lZCBpbnQg
bGVuKSB7IH0KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfY2FjaGVfY29tcHJlc3NlZF9w
YWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBwYWdlICpwYWdlLCBuaWRfdCBpbm8sIGJsb2NrX3QgYmxrYWRkcikgeyB9
Cj4gPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2xvYWRfY29tcHJlc3NlZF9wYWdlKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+IEBAIC00NzU5LDcgKzQ3NjAsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZjJmc19pbnZhbGlkYXRlX2ludGVybmFsX2NhY2hlKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyKQo+ID4gICB7Cj4gPiAgICAgICBmMmZz
X3RydW5jYXRlX21ldGFfaW5vZGVfcGFnZXMoc2JpLCBibGthZGRyLCAxKTsKPiA+IC0gICAgIGYy
ZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlKHNiaSwgYmxrYWRkcik7Cj4gPiArICAgICBmMmZz
X2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXNfcmFuZ2Uoc2JpLCBibGthZGRyLCAxKTsKPiA+ICAg
fQo+ID4KPiA+ICAgI2RlZmluZSBFRlNCQURDUkMgICBFQkFETVNHICAgICAgICAgLyogQmFkIENS
QyBkZXRlY3RlZCAqLwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
