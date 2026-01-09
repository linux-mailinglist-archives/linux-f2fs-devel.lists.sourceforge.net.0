Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F39D070CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 04:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2ohTH/eb0ESgPsU1Bqf4J0GgalhS+aMfFCvyq16YMI=; b=kQQOc97vaGX+1dpnMslnDzXXGy
	EeBR+EofLXXUjpqYDQe8mnkQcNm9fv6kXn+bpU7m+3Ey2GpfFg0VUu0M4tNJHZleAaPNz8OPKQLOX
	XNbgo1VjBaUwnMwO8r+7ji6RIZ+ky59KWqXlQTXMSjIRPp8J1cxwrsTpgfer0HJR0/6M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve3dh-0003Ct-Rq;
	Fri, 09 Jan 2026 03:58:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1ve3dg-0003Cn-N4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUjhmYCj7kXurJ5y6bZtIF4O5NWkEKQnoAxno11cNhA=; b=IVn1LP8Nrawnf1WBn6MIP3fEj2
 wk9Pu3ucI+ANdY29uhp7BZM5vjXqr7squZkgeO43A75lwCaUP3A0h/DkcELbMUyz59I/bq+4N7rQ7
 YONM9PRfBDexAo050xFXvtzqSpyLvebpWy9qhhlY7Ka+HlYFdt4XYPCci5xzEV4zD/Yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUjhmYCj7kXurJ5y6bZtIF4O5NWkEKQnoAxno11cNhA=; b=l1qAsZ7Oy51YQsaSTmu2azPOcX
 Lont5KYHlLrkaMlGAb6lRxrIru/miEAl3opprWCeopmj2l+Z6zjFbuUvG0b1Qr5UQL6eo7w5uN+aH
 Lv6hyHB7m4ZZzTV/pfsaPk5ycwAXrTsbfdncpknr08BXwHDE2tahmB8zdFpt7284S57U=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ve3dg-0001Dm-41 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:58:16 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-8888a1c50e8so46076076d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jan 2026 19:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767931090; x=1768535890; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUjhmYCj7kXurJ5y6bZtIF4O5NWkEKQnoAxno11cNhA=;
 b=MeyPWpps0MwxyikBSp0bxKRBlV1z6sBARI8TnCSHotOVlaffCwSVmecX9+6sq9f4zR
 KlF3e52zxnwHrNEQ3gyH+LC7aj5ugpdpglsBVc6aZeXJErtfiCn00uOvSF7bjKsGdcvQ
 Se6z19kj9CNdbXQmgKkdyWzqKWCsVeKoKpra5nnAdxak0yKMcuAscTAJ+YchOGkaIgzy
 8X6LdoKlwIpwbYFPfsdZ7XVRPEZFARuqWYDoNiEcp/xGvzBcpJ3T6+B062asE0xh5NPD
 EgOLKNo4S85lSfnc/6N0ppsEmBZkJUo75OpgYYvu1PbyB/PYodszo3qnGbDkW241r4Ns
 rJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767931090; x=1768535890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pUjhmYCj7kXurJ5y6bZtIF4O5NWkEKQnoAxno11cNhA=;
 b=tgIsgD/GWLWKOdM/TJhJbY7/qFlCgWL80YkOnpjfmmXyxlgNwKAFOGq1y4ZmycRqSc
 yF+xJiDZdrnZ3yD8AmsChwn6dIZdTSfTd3ZOsYYhxZ+tFGnHeji4213FDEWKnnPmEYe0
 Nv6IeF/ctw+WycplTSfy4qJH0neqgkJNxvqt4H1HmPEnOiL0FjPLcJDqnighU1cpzx3N
 KbpPI7UiD0mkl+/HzN4/w0j1yDFMj9tad/TmrDDfWQAQC42cIjFP5tCe1A5KMknRxQVc
 puO4tYtAa2PRQOvSk+8n+Dj8RInyN+i2HPCxzZYuVGc5pb4Eii2tmqBQ+5ruGfjMqaYY
 3FuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNw9+3t+l6osEn4Wr2w5xmdYig9Nv0uQQ37RsimZ3WDIloZ86eV36XsAlz17QPE+9WQsD8g6VauD51umSoXOWu@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwoqBQRF8eRCa+AzCvTN5D10IIqSOJw/yhdCRYwxocK0lP7Wy8T
 KCMEGO2p0a6tdrD/7LimvLlza4b8PdzpuADye2nw192916lq2+NTm/VbbaIqdompdabuSUg08aR
 rxIPvzjC0CsLXGf+2+t/lyMwvFgFtExU=
X-Gm-Gg: AY/fxX6owOWTDu2d9LmehWV4vZLFhaX6bd9713KPVROhilaLxImzbpaUdAW8HHIEsn/
 dFBt3XT0FuhQXj5l1RSTaxTx4+kJlfnemvTWjb8aiN+VP1qYE1jUtKnkwWD4Up90PuBB8SeiSv+
 /M+M1Qd76Gc5mdElIiEjl/d/hnE4zdo5S1Jp8G8c1qSMe4MIFEcGWtG0d6H16Wp/HZM1P9JhlwM
 bjV/scuU0ettUYO/xbQN5PyxF9j/nZ7XVV9gQHkp6RZJUUaO5Sn8UnDQQKL9c1tKBjJ3g==
X-Google-Smtp-Source: AGHT+IEThEJbcO5wpY3R5x+DzBzmg6q57OYNHfKaiYaJYgC0OtmRyWWgaShqcXZRXehCmDHcnUM25bY2wGCqJBdo87M=
X-Received: by 2002:a05:6214:4613:b0:888:57f3:ac07 with SMTP id
 6a1803df08f44-890842552c3mr125616706d6.54.1767931089980; Thu, 08 Jan 2026
 19:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
 <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
In-Reply-To: <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Jan 2026 16:57:58 +1300
X-Gm-Features: AQt7F2qs0hRoB_8wta5rMApT7xLt4YzJyzMfE5sQBjk5eFnGDlK2omnfIl13J30
Message-ID: <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 9, 2026 at 4:45 PM Chao Yu wrote: > > On 1/9/2026
 11:05 AM, Barry Song wrote: > > On Fri, Jan 9, 2026 at 3:47 PM Chao Yu wrote:
 > >> > >> Below testcase can change large folio supporte [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.54 listed in wl.mailspike.net]
X-Headers-End: 1ve3dg-0001Dm-41
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCA0OjQ14oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDEvOS8yMDI2IDExOjA1IEFNLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4g
T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAzOjQ34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IEJlbG93IHRlc3RjYXNlIGNhbiBjaGFuZ2UgbGFyZ2UgZm9saW8g
c3VwcG9ydGVkIGlub2RlIGZyb20gaW1tdXRhYmxlCj4gPj4gdG8gbXV0YWJsZSwgaXQncyBub3Qg
YXMgZXhwZWN0ZWQsIGxldCdzIGFkZCBhIG5ldyBjaGVjayBjb25kaXRpb24gaW4KPiA+PiBmMmZz
X3NldGZsYWdzX2NvbW1vbigpIHRvIGRldGVjdCBhbmQgcmVqZWN0IGl0Lgo+ID4+Cj4gPj4gLSBk
ZCBpZj0vZGV2L3plcm8gb2Y9L21udC9mMmZzL3Rlc3QgYnM9MzJrIGNvdW50PTQKPiA+PiAtIGYy
ZnNfaW8gc2V0ZmxhZ3MgaW1tdXRhYmxlIC9tbnQvZjJmcy90ZXN0Cj4gPj4gLSBlY2hvIDMgPiAv
cHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKPiA+PiAgIDogdG8gcmVsb2FkIGlub2RlIHdpdGggbGFy
Z2UgZm9saW8KPiA+PiAtIGYyZnNfaW8gcmVhZCAzMiAwIDEgbW1hcCAwIDAgL21udC9mMmZzL3Rl
c3QKPiA+PiAtIGYyZnNfaW8gY2xlYXJmbGFncyBpbW11dGFibGUgL21udC9mMmZzL3Rlc3QKPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiAtLS0K
PiA+PiAgIGZzL2YyZnMvZmlsZS5jIHwgNiArKysrKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2Zz
L2YyZnMvZmlsZS5jCj4gPj4gaW5kZXggY2UyOTFmMTUyYmMzLi5mN2Y5ZGEwYjIxNWYgMTAwNjQ0
Cj4gPj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+
IEBAIC0yMTU1LDYgKzIxNTUsMTIgQEAgc3RhdGljIGludCBmMmZzX3NldGZsYWdzX2NvbW1vbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCB1MzIgaWZsYWdzLCB1MzIgbWFzaykKPiA+PiAgICAgICAgICAg
ICAgICAgIH0KPiA+PiAgICAgICAgICB9Cj4gPj4KPiA+PiArICAgICAgIGlmICgoaWZsYWdzIF4g
bWFza2VkX2ZsYWdzKSAmIEYyRlNfSU1NVVRBQkxFX0ZMKSB7Cj4gPj4gKyAgICAgICAgICAgICAg
IGlmICgobWFza2VkX2ZsYWdzICYgRjJGU19JTU1VVEFCTEVfRkwpICYmCj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbWFwcGluZ19sYXJnZV9mb2xpb19zdXBwb3J0KGlub2RlLT5pX21hcHBp
bmcpKQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPgo+
IEJhcnJ5LAo+Cj4gSSBub3RpY2VkIHRoYXQgd2UgYXJlIGFsbG93ZWQgdG8gY2xlYXIgaW1tdXRh
YmxlIGlmIGxhcmdlIGZvbGlvIGFyZSBzdXBwb3J0ZWQKPiBpbiB0YXJnZXQgaW5vZGUsIHNpbmNl
IHdlIGNhbiBwcmV2ZW50IHRvIG9wZW4gdy8gd3JpdGUgcGVybWlzc2lvbiBpbiAtPm9wZW4gYWZ0
ZXIKPiBpbW11dGFibGUgaXMgY2xlYXJlZCwgc2VlIGRldGFpbHMgaW4gZjJmcyBkb2MgYmVsb3cu
Cj4KPiBTbywgYW55d2F5LCBJIGd1ZXNzIG15IHBhdGNoIHNob3VsZCBiZSBpZ25vcmVkLgo+Cj4g
UGVyLWZpbGUgUmVhZC1Pbmx5IExhcmdlIEZvbGlvIFN1cHBvcnQKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gRjJGUyBpbXBsZW1lbnRzIGxhcmdlIGZvbGlvIHN1
cHBvcnQgb24gdGhlIHJlYWQgcGF0aCB0byBsZXZlcmFnZSBoaWdoLW9yZGVyCj4gcGFnZSBhbGxv
Y2F0aW9uIGZvciBzaWduaWZpY2FudCBwZXJmb3JtYW5jZSBnYWlucy4gVG8gbWluaW1pemUgY29k
ZSBjb21wbGV4aXR5LAo+IHRoaXMgc3VwcG9ydCBpcyBjdXJyZW50bHkgZXhjbHVkZWQgZnJvbSB0
aGUgd3JpdGUgcGF0aCwgd2hpY2ggcmVxdWlyZXMgaGFuZGxpbmcKPiBjb21wbGV4IG9wdGltaXph
dGlvbnMgc3VjaCBhcyBjb21wcmVzc2lvbiBhbmQgYmxvY2sgYWxsb2NhdGlvbiBtb2Rlcy4KPgo+
IFRoaXMgb3B0aW9uYWwgZmVhdHVyZSBpcyB0cmlnZ2VyZWQgb25seSB3aGVuIGEgZmlsZSdzIGlt
bXV0YWJsZSBiaXQgaXMgc2V0Lgo+IENvbnNlcXVlbnRseSwgRjJGUyB3aWxsIHJldHVybiBFT1BO
T1RTVVBQIGlmIGEgdXNlciBhdHRlbXB0cyB0byBvcGVuIGEgY2FjaGVkCj4gZmlsZSB3aXRoIHdy
aXRlIHBlcm1pc3Npb25zLCBldmVuIGltbWVkaWF0ZWx5IGFmdGVyIGNsZWFyaW5nIHRoZSBiaXQu
IFdyaXRlCj4gYWNjZXNzIGlzIG9ubHkgcmVzdG9yZWQgb25jZSB0aGUgY2FjaGVkIGlub2RlIGlz
IGRyb3BwZWQuIFRoZSB1c2FnZSBmbG93IGlzCj4gZGVtb25zdHJhdGVkIGJlbG93Ogo+Cj4gLi4g
Y29kZS1ibG9jazo6Cj4KPiAgICAgIyBmMmZzX2lvIHNldGZsYWdzIGltbXV0YWJsZSAvZGF0YS90
ZXN0ZmlsZV9yZWFkX3NlcQo+Cj4gICAgIC8qIGZsdXNoIGFuZCByZWxvYWQgdGhlIGlub2RlIHRv
IGVuYWJsZSB0aGUgbGFyZ2UgZm9saW8gKi8KPiAgICAgIyBzeW5jICYmIGVjaG8gMyA+IC9wcm9j
L3N5cy92bS9kcm9wX2NhY2hlcwo+Cj4gICAgIC8qIG1tYXAoTUFQX1BPUFVMQVRFKSArIG1sb2Nr
KCkgKi8KPiAgICAgIyBmMmZzX2lvIHJlYWQgMTI4IDAgMTAyNCBtbWFwIDEgMCAvZGF0YS90ZXN0
ZmlsZV9yZWFkX3NlcQo+Cj4gICAgIC8qIG1tYXAoKSArIGZhZHZpc2UoUE9TSVhfRkFEVl9XSUxM
TkVFRCkgKyBtbG9jaygpICovCj4gICAgICMgZjJmc19pbyByZWFkIDEyOCAwIDEwMjQgZmFkdmlz
ZSAxIDAgL2RhdGEvdGVzdGZpbGVfcmVhZF9zZXEKPgo+ICAgICAvKiBtbWFwKCkgKyBtbG9jazIo
TUxPQ0tfT05GQVVMVCkgKyBtYWR2aXNlKE1BRFZfUE9QVUxBVEVfUkVBRCkgKi8KPiAgICAgIyBm
MmZzX2lvIHJlYWQgMTI4IDAgMTAyNCBtYWR2aXNlIDEgMCAvZGF0YS90ZXN0ZmlsZV9yZWFkX3Nl
cQo+Cj4gICAgICMgZjJmc19pbyBjbGVhcmZsYWdzIGltbXV0YWJsZSAvZGF0YS90ZXN0ZmlsZV9y
ZWFkX3NlcQo+Cj4gICAgICMgZjJmc19pbyB3cml0ZSAxIDAgMSB6ZXJvIGJ1ZmZlcmVkIC9kYXRh
L3Rlc3RmaWxlX3JlYWRfc2VxCj4gICAgIEZhaWxlZCB0byBvcGVuIC9tbnQvdGVzdC90ZXN0OiBP
cGVyYXRpb24gbm90IHN1cHBvcnRlZAo+Cj4gICAgIC8qIGZsdXNoIGFuZCByZWxvYWQgdGhlIGlu
b2RlIHRvIGRpc2FibGUgdGhlIGxhcmdlIGZvbGlvICovCj4gICAgICMgc3luYyAmJiBlY2hvIDMg
PiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKClJpZ2h0LCBJIHNlZS4gVGhlIG9ubHkgY29uY2Vy
biBpcyB0aGF0IHRoaXMgd291bGQgcmVxdWlyZSBkcm9wcGluZwp0aGUgcGFnZSBjYWNoZSBmb3Ig
dGhlIGVudGlyZSBzeXN0ZW0sIHJhdGhlciB0aGFuIGZvciBhIHNpbmdsZSBpbm9kZS4KCgo+Cj4g
ICAgICMgZjJmc19pbyB3cml0ZSAxIDAgMSB6ZXJvIGJ1ZmZlcmVkIC9kYXRhL3Rlc3RmaWxlX3Jl
YWRfc2VxCj4gICAgIFdyaXR0ZW4gNDA5NiBieXRlcyB3aXRoIHBhdHRlcm4gPSB6ZXJvLCB0b3Rh
bF90aW1lID0gMjkgdXMsIG1heF9sYXRlbmN5ID0gMjggdXMKPgo+ICAgICAjIHJtIC9kYXRhL3Rl
c3RmaWxlX3JlYWRfc2VxCj4KPiA+IEhpIFl1LCBJIGZpbmQgaXQgYSBiaXQgb2RkIHRvIHByZXZl
bnQgdW5zZXR0aW5nIGltbXV0YWJsZSBzb2xlbHkKPiA+IGJlY2F1c2UgbGFyZ2UgZm9saW9zIGFy
ZSBpbiB1c2UuIElmIHVuc2V0dGluZyBpbW11dGFibGUgaXMgY29uc2lkZXJlZAo+ID4gdW5leHBl
Y3RlZCBiZWhhdmlvciwgaXQgc2hvdWxkIGJlIGRpc2FsbG93ZWQgcmVnYXJkbGVzcyBvZiB3aGV0
aGVyCj4gPiBsYXJnZSBmb2xpb3MgYXJlIHVzZWQsIGFuZCBhcHBseSBlcXVhbGx5IGluIGJvdGgg
Y2FzZXMuCj4KPiBUbyBjb25maXJtLCB5b3UgbWVhbiBpZiBjbGVhcmluZyBpbW11dGFibGUgaXMg
Y29uc2lkZXJlZCB1bmV4cGVjdGVkIGJlaGF2aW9yLAo+IHdlIG5lZWQgdG8gcHJldmVudCBjbGVh
cmluZyBpbW11dGFibGUgZm9yIGlub2RlIHdoaWNoIGRvZXNuJ3QgZW5hYmxlIGxhcmdlIGZvbGlv
PwoKUmlnaHQuIEl0IGZlZWxzIHVuZmFpciB0byBwcmV2ZW50IGNsZWFyaW5nIGltbXV0YWJsZSBz
b2xlbHkgYmVjYXVzZQp0aGUgZmlsZSBoYXBwZW5zIHRvIGhhdmUgbGFyZ2UgZm9saW9zLgoKPgo+
ID4KPiA+IEknbSBub3Qgc3VyZSB3aGV0aGVyIHJldmVydGluZyB0aGUgbGFyZ2UgZm9saW9zIHNl
dHRpbmcgaXMgdGhlCj4gPiBiZXR0ZXIgYXBwcm9hY2g6Cj4gPiB0cnVuY2F0ZV9wYWdlY2FjaGUo
aW5vZGUsIGlub2RlLT5pX3NpemUpOwo+ID4gbWFwcGluZ19zZXRfZm9saW9fb3JkZXJfcmFuZ2Uo
aW5vZGUtPmlfbWFwcGluZywgMCwgMCk7Cj4KPiBJZiB3ZSB3YW50IHRvIHN1cHBvcnQgcmV2ZXJ0
aW5nIHRoZSBsYXJnZSBmb2xpb3Mgc2V0dGluZyBkeW5hbWljYWxseSBhcyB5b3UKPiBwcm9wb3Nl
ZCBhYm92ZSwgaXQgbmVlZCB0byBjb25zaWRlciBtb3JlIHJhY2UgY2FzZSBhbmQgY29ybmVyIGNh
c2UsIHNvLCBhCj4gbGl0dGxlIGJpdCBjb21wbGljYXRlZC4KClJpZ2h0LiBUaGUgaWRlYSBpcyB0
byB0cnVuY2F0ZSB0aGUgcGFnZSBjYWNoZSB2aWEKdHJ1bmNhdGVfcGFnZWNhY2hlKGlub2RlLCAw
KSBhbmQgc2V0IHRoZSBtYXhpbXVtIHBhZ2UtY2FjaGUgb3JkZXIKdG8gMC4gVGhhdCBzYWlkLCB3
ZSBzdGlsbCBuZWVkIHRvIGNvbnNpZGVyIHdoZXRoZXIgYW55IHJlbGF0ZWQKbG9ja3MgYXJlIGhl
bGQuCgpGcm9tIHRoZSBjb21tZW50LCBpdCBzZWVtcyB0aGF0IHdlIG1heSBuZWVkIHRvIGhvbGQg
aV9yd3NlbSBhbmQKaW52YWxpZGF0ZV9sb2NrLgoKLyoqCiAqIHRydW5jYXRlX2lub2RlX3BhZ2Vz
IC0gdHJ1bmNhdGUgKmFsbCogdGhlIHBhZ2VzIGZyb20gYW4gb2Zmc2V0CiAqIEBtYXBwaW5nOiBt
YXBwaW5nIHRvIHRydW5jYXRlCiAqIEBsc3RhcnQ6IG9mZnNldCBmcm9tIHdoaWNoIHRvIHRydW5j
YXRlCiAqCiAqIENhbGxlZCB1bmRlciAoYW5kIHNlcmlhbGlzZWQgYnkpIGlub2RlLT5pX3J3c2Vt
IGFuZAogKiBtYXBwaW5nLT5pbnZhbGlkYXRlX2xvY2suCiAqCiAqIC4uLgogKi8Kdm9pZCB0cnVu
Y2F0ZV9pbm9kZV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgbG9mZl90IGxz
dGFydCkKewogICAgICAgIHRydW5jYXRlX2lub2RlX3BhZ2VzX3JhbmdlKG1hcHBpbmcsIGxzdGFy
dCwgKGxvZmZfdCktMSk7Cn0KRVhQT1JUX1NZTUJPTCh0cnVuY2F0ZV9pbm9kZV9wYWdlcyk7CgoK
SWYgY2xlYXJpbmcgaW1tdXRhYmxlIGlzIGluZGVlZCByYXJlLCB3ZSBtYXkgbGVhdmUgdGhpcyBh
cyBpcywgc2luY2UKd3JpdGVzIGFyZSBub3Qgc3VwcG9ydGVkIHVudGlsIHRoZSBwYWdlIGNhY2hl
IGlzIGZ1bGx5IGRyb3BwZWQuCkV2ZW50dWFsbHksIHdlIHdpbGwgc3VwcG9ydCBsYXJnZSBmb2xp
b3Mgb24gbm9uLWltbXV0YWJsZSBmaWxlcy4KClRoYW5rcwpCYXJyeQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
