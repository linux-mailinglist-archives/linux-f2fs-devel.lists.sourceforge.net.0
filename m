Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17182FB99
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 22:58:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPrSG-0002zw-Mr;
	Tue, 16 Jan 2024 21:58:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rPrSC-0002zp-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 21:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UM17XEtXwoJG5qURPoDZ6ip2BPJ/BbKfK3ArAY10wg4=; b=D2LciipIJ7xpWB8914xCyYM4vt
 Da9MtXu8QZysUMbed6vjfWPBpaV8JJfX+2zafavO0twmej1gT6WStqmOesSUFVzZn/lJR0YGiiRTv
 9PcdvRJpzuNbAaFBzvvlOftgL+p6BDkOpNYi+YAO8rYZphDxUCfAfS8NlKpkY1DphCcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UM17XEtXwoJG5qURPoDZ6ip2BPJ/BbKfK3ArAY10wg4=; b=dUaaPfyDXajWlF3rv/ON4Ar9QG
 TEHSAEIsZSejz5SA3ZZJ6awswx+uJ+KqNrooEyDZnvCyiWGHTqv0y+zzR/K8SifFdgst/yG4nLpLr
 bMXhxs8163MeHFQPyTtXZ/TJWAfsyUoSPTcRrsyEnVg8NxlYdGD5WULDUbJ9QBVX2LGg=;
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPrS6-0000o7-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 21:58:40 +0000
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-49618e09f16so1976538e0c.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705442310; x=1706047110; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UM17XEtXwoJG5qURPoDZ6ip2BPJ/BbKfK3ArAY10wg4=;
 b=P4M7mq540ltHgFn6URY+2GdRw0122/X7e+HUnqLvJcIsrzluk2H1UHJ4iK6cfI7xlD
 Scl/laWYm2mpErKJ/+5S8TJgbbeE+L1VEtmqddNIgCZDG1+gwzrS1m/37MIbLWwa5Nnh
 21vB47r8L8qVRjwtueWgbjIiZgswAomtOt8xFCIInlYyfeoxHrBjI65hht9P10IMFPID
 TwyjqPukwC6ZL5BiaXJzvT/jigZ5QbH0Ep5Qk0ohvAk018DvpvSfYhEfyjDBfkIhnpit
 zVMmvUZIc8L1T5uyX1gGAK2ovKRPyfJKPtD9EmSi08mBCnxsuDuAtrbOJsts2D2uolRp
 5gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705442310; x=1706047110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UM17XEtXwoJG5qURPoDZ6ip2BPJ/BbKfK3ArAY10wg4=;
 b=KaZA8RzzzTPRMM9ahK5z4LGFr67/Tzd1rl5nrcGyyiilOk89yuKM3XcA91tykD+Z7A
 ixTadi44hHNw+pTbEJRIAB6Pq8ycCnsPmZDhCE9nXH9HZQ98H28lPS2W8L1gd12tr8wI
 bXkeiSyGc1LCqDIR83pWVZ4IoL5jskyqbCo6VrQn/NXn9041O6tzobwbB3nS7a8vtUbY
 0aoPo2rbW9GCf0mb3UXpEqQuKysgrrZnXd8HiLsSxcXrb9KCHeMAdC26TxyWHQuSFaBW
 Bi0qo/6kwR+fw6+7Xj3eAeB29xAmL+9vNL/g8KY2S1S8a64n/rbGMpLXBiADSKO+4J/i
 OaEg==
X-Gm-Message-State: AOJu0YyhpHTZWvfEKjUGCZlctfGt/2bUGOkaH4wJyJ03BRZMBjm/njEz
 llT0NA6tVfskg+xVOMepywLHbEpti3S/kxK9ku0=
X-Google-Smtp-Source: AGHT+IHNq7SRiGzII1ZMvV3Nor4XcBcLaLAvx0JhsT11NjNzBhH7AqPeJOWPQwNrJEaYg/ib3lul2W01EuURQx9+MP0=
X-Received: by 2002:ac5:c5d7:0:b0:4b7:45b7:63fc with SMTP id
 g23-20020ac5c5d7000000b004b745b763fcmr3079766vkl.33.1705442310109; Tue, 16
 Jan 2024 13:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20240116141138.1245-1-qwjhust@gmail.com>
In-Reply-To: <20240116141138.1245-1-qwjhust@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 16 Jan 2024 13:58:18 -0800
Message-ID: <CACOAw_yL7fLmjLkK29yEb3hgTqoDO2hntOX5LMHmWjZWWix1ig@mail.gmail.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jan 16, 2024 at 6:13 AM Wenjie Qi wrote: > > BUG:
    kernel NULL pointer dereference, address: 0000000000000014 > RIP: 0010:f2fs_submit_page_write+0x6cf/0x780
    [f2fs] > Call Trace: > <TASK> > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.179 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPrS6-0000o7-W8
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgNjoxM+KAr0FNIFdlbmppZSBRaSA8cXdqaHVzdEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBh
ZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDE0Cj4gUklQOiAwMDEwOmYyZnNfc3VibWl0X3BhZ2Vfd3Jp
dGUrMHg2Y2YvMHg3ODAgW2YyZnNdCj4gQ2FsbCBUcmFjZToKPiA8VEFTSz4KPiA/IHNob3dfcmVn
cysweDZlLzB4ODAKPiA/IF9fZGllKzB4MjkvMHg3MAo+ID8gcGFnZV9mYXVsdF9vb3BzKzB4MTU0
LzB4NGEwCj4gPyBwcmJfcmVhZF92YWxpZCsweDIwLzB4MzAKPiA/IF9faXJxX3dvcmtfcXVldWVf
bG9jYWwrMHgzOS8weGQwCj4gPyBpcnFfd29ya19xdWV1ZSsweDM2LzB4NzAKPiA/IGRvX3VzZXJf
YWRkcl9mYXVsdCsweDMxNC8weDZjMAo+ID8gZXhjX3BhZ2VfZmF1bHQrMHg3ZC8weDE5MAo+ID8g
YXNtX2V4Y19wYWdlX2ZhdWx0KzB4MmIvMHgzMAo+ID8gZjJmc19zdWJtaXRfcGFnZV93cml0ZSsw
eDZjZi8weDc4MCBbZjJmc10KPiA/IGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUrMHg3MzYvMHg3ODAg
W2YyZnNdCj4gZG9fd3JpdGVfcGFnZSsweDUwLzB4MTcwIFtmMmZzXQo+IGYyZnNfb3V0cGxhY2Vf
d3JpdGVfZGF0YSsweDYxLzB4YjAgW2YyZnNdCj4gZjJmc19kb193cml0ZV9kYXRhX3BhZ2UrMHgz
ZjgvMHg2NjAgW2YyZnNdCj4gZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKzB4NWJiLzB4N2Ew
IFtmMmZzXQo+IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHgzZGEvMHhiZTAgW2YyZnNdCj4gLi4u
Cj4gSXQgaXMgcG9zc2libGUgdGhhdCBvdGhlciB0aHJlYWRzIGhhdmUgYWRkZWQgdGhpcyBmaW8g
dG8gaW8tPmJpbwo+IGFuZCBzdWJtaXR0ZWQgdGhlIGlvLT5iaW8gYmVmb3JlIGVudGVyaW5nIGYy
ZnNfc3VibWl0X3BhZ2Vfd3JpdGUoKS4KPiBBdCB0aGlzIHBvaW50IGlvLT5iaW8gPSBOVUxMLgo+
IElmIGlzX2VuZF96b25lX2Jsa2FkZHIoc2JpLCBmaW8tPm5ld19ibGthZGRyKSBvZiB0aGlzIGZp
byBpcyB0cnVlLAo+IHRoZW4gYW4gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGVycm9yIG9jY3Vy
cyBhdCBiaW9fZ2V0KGlvLT5iaW8pLgo+IFRoZSBvcmlnaW5hbCBjb2RlIGZvciBkZXRlcm1pbmlu
ZyB6b25lIGVuZCB3YXMgYWZ0ZXIgIm91dDoiLAo+IHdoaWNoIHdvdWxkIGhhdmUgbWlzc2VkIHNv
bWUgZmlvIHdobyBpcyB6b25lIGVuZC4gSSd2ZSBtb3ZlZAo+ICB0aGlzIGNvZGUgYmVmb3JlICJz
a2lwOiIgdG8gbWFrZSBzdXJlIGl0J3MgZG9uZSBmb3IgZWFjaCBmaW8uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2RhdGEu
YyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5j
Cj4gaW5kZXggZGNlOGRlZmRmNGM3Li40ZjQ0NTkwNmRiOGIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+IEBAIC0xMDgwLDEwICsxMDgwLDYgQEAg
dm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPiAg
ICAgICAgIGlvLT5sYXN0X2Jsb2NrX2luX2JpbyA9IGZpby0+bmV3X2Jsa2FkZHI7Cj4KPiAgICAg
ICAgIHRyYWNlX2YyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoZmlvLT5wYWdlLCBmaW8pOwo+IC1za2lw
Ogo+IC0gICAgICAgaWYgKGZpby0+aW5fbGlzdCkKPiAtICAgICAgICAgICAgICAgZ290byBuZXh0
Owo+IC1vdXQ6Cj4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ICAgICAgICAgaWYgKGYy
ZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgYnR5cGUgPCBNRVRBICYmCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaXNfZW5kX3pvbmVfYmxrYWRkcihzYmksIGZpby0+bmV3X2Jsa2FkZHIpKSB7
Cj4gQEAgLTEwOTYsNiArMTA5MiwxMCBAQCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoc3Ry
dWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ICAgICAgICAgICAgICAgICBfX3N1Ym1pdF9tZXJnZWRf
YmlvKGlvKTsKPiAgICAgICAgIH0KPiAgI2VuZGlmCj4gK3NraXA6Cj4gKyAgICAgICBpZiAoZmlv
LT5pbl9saXN0KQo+ICsgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gK291dDoKCkhvdyBhYm91
dCBtb3Zpbmcgb25seSB0aGUgIm91dCIgbGFiZWwgaW5zdGVhZCBvZiB0aGUgd2hvbGUgYmxvY2sg
ZnJvbQoic2tpcCIgdG8gIm91dCI/Cgo+ICAgICAgICAgaWYgKGlzX3NiaV9mbGFnX3NldChzYmks
IFNCSV9JU19TSFVURE9XTikgfHwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFm
MmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPiAgICAgICAgICAgICAgICAgX19zdWJtaXRf
bWVyZ2VkX2Jpbyhpbyk7Cj4gLS0KPiAyLjM0LjEKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
