Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BF8B47B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Apr 2024 21:51:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0o4m-0004zM-2A;
	Sat, 27 Apr 2024 19:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1s0o4k-0004z8-JL
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Apr 2024 19:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mx+TZI+AhJhXc5nDbpJ3HSmPLnjW2+afsuYEIVpKobg=; b=mpRcafeGidsFibnpaPOkc6GLeq
 SFGQbdmiDnWtZKbMfvohoczxd/nCkzZhPA5IQTVrWvaW/7DyMrZKbzD/7KdaaDa6iG7cjomdISeYg
 D90EWh6lnxJDxo68wlqGeMtO+xKV2DdoY0Dh04xuSq81sw4M5xob6NZ8WrJUp3Uwo1Y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mx+TZI+AhJhXc5nDbpJ3HSmPLnjW2+afsuYEIVpKobg=; b=KeVIW8O/2hi7LhhhKqbHovJ0YX
 1pXr7UZr7q0l101bN6xVQTTUUhduMQO7VpRfAIQ1btfa4k4uSrbg/bVmAUQQPqgRki7L0AIGo//ZA
 zFGjrdX+GlG6tdaQzJads+T7hzZaufLbpF/LNlm5cZm6cu3B0DjnkdJhFwPmYd2GEwu0=;
Received: from mail-vs1-f48.google.com ([209.85.217.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0o4k-00084h-7q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Apr 2024 19:51:11 +0000
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-479ffac091dso869432137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Apr 2024 12:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714247460; x=1714852260; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mx+TZI+AhJhXc5nDbpJ3HSmPLnjW2+afsuYEIVpKobg=;
 b=QEWjJoG6QVMFlWCHshhicguNI0wrJp42/3MUO8s+ABuIW839PC/dRiIQIUHgbKD9gr
 gboT5MxoUSgKUNIZFDf0NYKZYkX46H6G8amXaI1YikQLVdivlDc5HlZehGN9o2dbgxpR
 qSsLIJW/zDN/31l0w4/sMEQnCX2Led1wEUCGwYwbK91oUFfvuIf1kV1kQSlM7Hx0/Q4W
 rJs5rq1+aUaA0w0D6ENUSiU/YY2C4mQoznJTmPh7DzzZaCcbe8xccVzgh2ByJ/L0ekhU
 nGV9ZcKgzjPMcaxbTMOZIqwOqLsvmpkUL2SHVczksP2I/ZwYx9I2zAmvyVK93K9q4mDz
 S+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714247460; x=1714852260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mx+TZI+AhJhXc5nDbpJ3HSmPLnjW2+afsuYEIVpKobg=;
 b=rt5VgMoJSYNgtjYwv8VMR76J+AmSDFEJLF9Bl1xIQx3lU+3jDmKssRPk0+Ylj7HSx8
 3dRrEbK81UIKKU51AJIzEufRS5Oodx7a3JNqMKfBoWWMCs7KWRu7f3dLliDmK10/5Jna
 PhpLnrLUFSr5YvG0c45hL4/2z00/dKucb3nozjb9qjf5wqsMkmkb8P2//aOGw0ZaVV9P
 9WDARWNZwg5sotDf2faKB1jM4s6yhnIjpTzdcVh6eSJ9ZSNTpZ+OjPdHp/n6bKuAQUTc
 SvZZAJKcBZayuS6Z+pTo/TzlAhbHc98fsE/nDypII0eJ0ItTSJqOw3yFlGzJLLbjuvoI
 xJCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiEoHuVxtvUrpkuE1PLplTpuHEdi0lLe04XTfL+OmeO12gFas33aHHD2sgma814kGIkAeApg2YGBQ61MFl2qg21kSJ+FkBVnBVrOLcxAiXYTSjWT1EAw==
X-Gm-Message-State: AOJu0YxHvZ7jKGzO4udnkeEj33bSh2f9ZvDOcYEUVZ6IDWwjdbbAeI/K
 /v1uWoGGU82j1h1agNLGWuUOM19KBH7qtbXwaynBqnncwou86vn35WLgejNbGNxvMOGIJ5HbEAg
 WHGHKzbVnQmNfEtQ28CZ9fRAXaTho3w==
X-Google-Smtp-Source: AGHT+IFkMsW89n1NQE8ZtjKKjwlrH4uCQQHVEgxNy01+vSTtZrZ2k22q04dE2BBrobvMdnaVsTw+xerI/NTKXm+2ao0=
X-Received: by 2002:a67:e8d1:0:b0:47b:fe0b:a92e with SMTP id
 y17-20020a67e8d1000000b0047bfe0ba92emr6582019vsn.16.1714247459742; Sat, 27
 Apr 2024 12:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240426103528.406063-1-chao@kernel.org>
 <CACOAw_xiC08JTanBSLaBED8_zveCEhoaDWeJ3YVU0h9+dNkQUg@mail.gmail.com>
 <a08a091b-78d1-4fb1-982c-c51d9dff8f06@kernel.org>
In-Reply-To: <a08a091b-78d1-4fb1-982c-c51d9dff8f06@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 27 Apr 2024 12:50:48 -0700
Message-ID: <CACOAw_xuX-J=J5zYwK5kVxPGZWPa+KXBxQA2i-taPwzS2ds-aQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 26, 2024 at 6:49 PM Chao Yu wrote: > > On 2024/4/26
    22:14, Daeho Jeong wrote: > > On Fri, Apr 26, 2024 at 3:35 AM Chao Yu wrote:
    > >> > >> Otherwise, it breaks pinfile's sematics. [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.48 listed in wl.mailspike.net]
X-Headers-End: 1s0o4k-00084h-7q
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgNjo0OeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzQvMjYgMjI6MTQsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMzozNeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBPdGhlcndpc2UsIGl0IGJyZWFrcyBwaW5maWxlJ3Mgc2VtYXRp
Y3MuCj4gPj4KPiA+PiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPgo+ID4+IFNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiAtLS0KPiA+PiAgIGZz
L2YyZnMvZGF0YS5jIHwgMyArKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gPj4gaW5kZXggYmVlMWU0NWY3NmI4Li5lMjkwMDBkODNkNTIgMTAw
NjQ0Cj4gPj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+
ID4+IEBAIC0xNTk2LDcgKzE1OTYsOCBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4gPj4KPiA+
PiAgICAgICAgICAvKiB1c2Ugb3V0LXBsYWNlLXVwZGF0ZSBmb3IgZGlyZWN0IElPIHVuZGVyIExG
UyBtb2RlICovCj4gPj4gICAgICAgICAgaWYgKG1hcC0+bV9tYXlfY3JlYXRlICYmCj4gPj4gLSAg
ICAgICAgICAgKGlzX2hvbGUgfHwgKGYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNf
R0VUX0JMT0NLX0RJTykpKSB7Cj4gPj4gKyAgICAgICAgICAgKGlzX2hvbGUgfHwgKGZsYWcgPT0g
RjJGU19HRVRfQkxPQ0tfRElPICYmIChmMmZzX2xmc19tb2RlKHNiaSkgJiYKPiA+PiArICAgICAg
ICAgICAoIWYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgfHwgIWYyZnNfaXNfcGlubmVkX2ZpbGUo
aW5vZGUpKSkpKSkgewo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGYyZnNfY3Bf
ZXJyb3Ioc2JpKSkpIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTzsK
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBzeW5jX291dDsKPiA+PiAtLQo+ID4+
IDIuNDAuMQo+ID4KPiA+IFNvLCB3ZSBibG9jayBvdmVyd3JpdGUgaW8gZm9yIHRoZSBwaW5maWxl
IGhlcmUuCj4KPiBJIGd1ZXNzIHlvdSBtZWFuIHdlIGJsb2NrZWQgYXBwZW5kIHdyaXRlIGZvciBw
aW5maWxlLCByaWdodD8KPgo+ID4KPiA+IHN0YXRpYyBzc2l6ZV90IGYyZnNfZmlsZV93cml0ZV9p
dGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+ID4KPiA+IHsK
PiA+IC4uLgo+ID4gICAgICAgICAgaWYgKGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpICYmCj4g
PiAgICAgICAgICAgICAgIWYyZnNfb3ZlcndyaXRlX2lvKGlub2RlLCBwb3MsIGNvdW50KSkgewo+
Cj4gSWYgIWYyZnNfb3ZlcndyaXRlX2lvKCkgaXMgdHJ1ZSwgaXQgbWVhbnMgaXQgbWF5IHRyaWdn
ZXIgYXBwZW5kIHdyaXRlIG9uCj4gcGluZmlsZT8KClllcywgSSBtaXNzZWQgaXQuIFRoYW5rc34K
Cj4KPiBUaGFua3MsCj4KPiA+ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTzsKPiA+ICAgICAg
ICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+ID4gICAgICAgICAgfQo+ID4KPiA+Cj4gPj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
