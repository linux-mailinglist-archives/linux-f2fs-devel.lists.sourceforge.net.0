Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74256A34E02
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 19:49:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tieGy-0005BG-6Q;
	Thu, 13 Feb 2025 18:49:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tieGx-0005B4-53
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v7boHwExjmVAJE837TzvXWkShByi/UK+LGMj8HpqhPk=; b=ICifq2Gdg2yEVQu6bqN6JTh8Ce
 8nbDamdGZmu9RXlMv48alHYGtidY/wionNv21/KFfe41vAsDN8UpjwNnWgFCIELoNyZkHD1dpmgBq
 4BO8jjfhBWSvMkD5z1Lbm1750osy0gzQv4WACbBRgwfxF3KwJlVBscinsCyYNUCv3AMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v7boHwExjmVAJE837TzvXWkShByi/UK+LGMj8HpqhPk=; b=BCUR986M3KOXmid22zPZF4Z/06
 cGybJMkd9VoVs40OxMSI8uvaHZ0qv9BBoL3R/6BbaqTs7HfCYunrOUARvIhkOd0PA+1OA8zPsO7e6
 nNO0mY3k3h9iKFfV42ew40dOyq0f9r4T/rSoKGcWEoGER8LoFumLy4cg3r21bhzCz7Ao=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tieGx-0003Sv-72 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:49:15 +0000
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4bbd84003dcso319528137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Feb 2025 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739472544; x=1740077344; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7boHwExjmVAJE837TzvXWkShByi/UK+LGMj8HpqhPk=;
 b=Ax6LgRTsknQ2mVo/7PHHgufc8IUwX/PdLC+SvCaJ5Ez1osyEP7k9v/g+ZaZ9hmCzY5
 NGOg0A8bF8Da5Mou87boHNHlMGA25a4XyKCLHtxmb4mJ5AbMUujS2XCdzCgpaiBWB/1B
 kVpLfXr9VsNhOC6us/b/qwq4WzZZHaK+UQnKhsdP0RO/+B+ggf9n8vwPMoStonIrCrt9
 UZnk+sGMNCrIIaY/neJ/mp7cXxOxIbKjibFJ3k0aqw+EILdqz80AqkNLCyASzwhSGr4u
 9HKlcAZcpClNWo5oAhvuZ7tAGpbDLpELWNcXG+gCo9CCsVUi9StKce2UEs7o3RZ7XVXJ
 q8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739472544; x=1740077344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7boHwExjmVAJE837TzvXWkShByi/UK+LGMj8HpqhPk=;
 b=lUSP8cTOI+ocmpo+lzDYOv3FLeErIMyXB35b7dM4HpWTUdqnwB3kKcot6DaF8TuMOy
 s82kYPSZkRQhLaEF+AQboesRu8mebrVOiT2ZdxZu+iYCKSgRkdeoqgwexN2pM3N0ohsT
 bjW+54zLdSOocsB0c4SttpgglMRvRMKrqic/QM7aqecROr7PNdO2dlN4PD3lfobVkCSD
 ipaIHWrqtBGAIy8qHM28zm7ytS8Rt63m8ZRgMgPpfiBVthqZgddFWG2ILEf2nj1tGcmY
 F3jjOaPC4B2d151UCamNCDbiNrycb1IWBKZt21L5znnGUdPARTry9cSYt1Yza5g/ohzV
 F7Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3NCHqJvf49cjeckz2taDeebHLMg77byZkcoJ6PBseJ2CRrcnb5l87l4/kqZnAlhql0jigf4bIzfEP41RiVj2G@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwiDQU1rLyvimmK/Pd82ssD8uRfzDt+e326ra7JtJ+eiXhJxn2n
 GJXkV22e/O0k/87nFDhdKDekqWRT2xdIyNgw4rs8Rv3MFd7f9x0cIHlZHzDSF6TWHT0b/V8o6Gf
 Q3TlkfmB9iZLrrofdDREi4eXJ7es=
X-Gm-Gg: ASbGncv+Jr1NjvTAyjo+TF912g8S2Hz6Fi+KnuU6TuM98CeZTRoK3wAUfCwkP23CxV9
 ne+oiFRCVZszCNF5gUcGN1oOG/5p/BICY/nf+aJb36g0456Bs1Qu69dkkQ6/ZA06ECEeLPkvmkt
 gq1HUEmWcrnFLOlCUJqzoOhV6+zM8=
X-Google-Smtp-Source: AGHT+IHllIcsi3aUC71hMwNeu2lRyCQ1wpzzesNNV0/+8zMd7QG5KBTum2gcYayGUUMFrUY2gmN2IeXSdsWtezGirbY=
X-Received: by 2002:a05:6102:4427:b0:4bb:ce42:40e3 with SMTP id
 ada2fe7eead31-4bc0374ab00mr4727166137.17.1739472544182; Thu, 13 Feb 2025
 10:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20250208135414.417-1-yohan.joung@sk.com>
In-Reply-To: <20250208135414.417-1-yohan.joung@sk.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 13 Feb 2025 10:48:52 -0800
X-Gm-Features: AWEUYZlxYmvOwQTFXp17eT7krbTyJ3SD0g8BbY2UrGprqoYLvaVBXGruYXqJuEo
Message-ID: <CACOAw_xqi7cy5j5FVNKJk=QLGzda+pzAmq=weHNOpiasG+zeog@mail.gmail.com>
To: Yohan Joung <jyh429@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Feb 8, 2025 at 5:54 AM Yohan Joung wrote: > > currently,
    zone reset only occurs when there is urgent utilization and > when pending
    blocks are reallocated. this causes performance > degrad [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.47 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.47 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tieGx-0003Sv-72
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: separate discard and zone reset
 command from pend list
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

T24gU2F0LCBGZWIgOCwgMjAyNSBhdCA1OjU04oCvQU0gWW9oYW4gSm91bmcgPGp5aDQyOUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gY3VycmVudGx5LCB6b25lIHJlc2V0IG9ubHkgb2NjdXJzIHdoZW4g
dGhlcmUgaXMgdXJnZW50IHV0aWxpemF0aW9uIGFuZAo+IHdoZW4gcGVuZGluZyBibG9ja3MgYXJl
IHJlYWxsb2NhdGVkLiB0aGlzIGNhdXNlcyBwZXJmb3JtYW5jZQo+IGRlZ3JhZGF0aW9uLCBzbyB3
ZSBhcmUgbW9kaWZ5aW5nIGl0IHRvIGFsbG93IHBlbmRpbmcgcmVzZXQgem9uZXMgdG8gYmUKPiBp
c3N1ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29t
Pgo+IC0tLQo+ICBmcy9mMmZzL2YyZnMuaCAgICB8ICAzICsrLQo+ICBmcy9mMmZzL3NlZ21lbnQu
YyB8IDIxICsrKysrKysrKysrKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmgg
Yi9mcy9mMmZzL2YyZnMuaAo+IGluZGV4IDFhZmE3YmUxNmU3ZC4uMDlhN2UxM2MwZDAwIDEwMDY0
NAo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtMzQ5
LDYgKzM0OSw3IEBAIHN0cnVjdCBkaXNjYXJkX2VudHJ5IHsKPgo+ICAvKiBtYXggZGlzY2FyZCBw
ZW5kIGxpc3QgbnVtYmVyICovCj4gICNkZWZpbmUgTUFYX1BMSVNUX05VTSAgICAgICAgICA1MTIK
PiArI2RlZmluZSBaT05FX1BMSVNUX05VTSAgICAgICAgIDEKPiAgI2RlZmluZSBwbGlzdF9pZHgo
YmxrX251bSkgICAgICgoYmxrX251bSkgPj0gTUFYX1BMSVNUX05VTSA/ICAgICAgICAgICBcCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChNQVhfUExJU1RfTlVNIC0g
MSkgOiAoKGJsa19udW0pIC0gMSkpCj4KPiBAQCAtNDEwLDcgKzQxMSw3IEBAIHN0cnVjdCBkaXNj
YXJkX3BvbGljeSB7Cj4gIHN0cnVjdCBkaXNjYXJkX2NtZF9jb250cm9sIHsKPiAgICAgICAgIHN0
cnVjdCB0YXNrX3N0cnVjdCAqZjJmc19pc3N1ZV9kaXNjYXJkOyAvKiBkaXNjYXJkIHRocmVhZCAq
Lwo+ICAgICAgICAgc3RydWN0IGxpc3RfaGVhZCBlbnRyeV9saXN0OyAgICAgICAgICAgIC8qIDRL
QiBkaXNjYXJkIGVudHJ5IGxpc3QgKi8KPiAtICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgcGVuZF9s
aXN0W01BWF9QTElTVF9OVU1dOy8qIHN0b3JlIHBlbmRpbmcgZW50cmllcyAqLwo+ICsgICAgICAg
c3RydWN0IGxpc3RfaGVhZCBwZW5kX2xpc3RbTUFYX1BMSVNUX05VTSArIFpPTkVfUExJU1RfTlVN
XTsvKiBzdG9yZSBwZW5kaW5nIGVudHJpZXMgKi8KPiAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQg
d2FpdF9saXN0OyAgICAgICAgICAgICAvKiBzdG9yZSBvbi1mbHVzaGluZyBlbnRyaWVzICovCj4g
ICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGZzdHJpbV9saXN0OyAgICAgICAgICAgLyogaW4tZmxp
Z2h0IGRpc2NhcmQgZnJvbSBmc3RyaW0gKi8KPiAgICAgICAgIHdhaXRfcXVldWVfaGVhZF90IGRp
c2NhcmRfd2FpdF9xdWV1ZTsgICAvKiB3YWl0aW5nIHF1ZXVlIGZvciB3YWtlLXVwICovCj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBpbmRleCBj
MjgyZThhMGEyZWMuLjFjMzIyNTJkYjUyNSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQu
Ywo+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gQEAgLTk2Miw3ICs5NjIsMTAgQEAgc3RhdGlj
IHN0cnVjdCBkaXNjYXJkX2NtZCAqX19jcmVhdGVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+Cj4gICAgICAgICBmMmZzX2J1Z19vbihzYmksICFsZW4pOwo+Cj4gLSAgICAg
ICBwZW5kX2xpc3QgPSAmZGNjLT5wZW5kX2xpc3RbcGxpc3RfaWR4KGxlbildOwo+ICsgICAgICAg
aWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgYmRldl9pc196b25lZChiZGV2KSkKPiAr
ICAgICAgICAgICAgICAgcGVuZF9saXN0ID0gJmRjYy0+cGVuZF9saXN0W01BWF9QTElTVF9OVU1d
Owo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBwZW5kX2xpc3QgPSAmZGNjLT5wZW5k
X2xpc3RbcGxpc3RfaWR4KGxlbildOwo+Cj4gICAgICAgICBkYyA9IGYyZnNfa21lbV9jYWNoZV9h
bGxvYyhkaXNjYXJkX2NtZF9zbGFiLCBHRlBfTk9GUywgdHJ1ZSwgTlVMTCk7Cj4gICAgICAgICBJ
TklUX0xJU1RfSEVBRCgmZGMtPmxpc3QpOwo+IEBAIC0xNjQ5LDYgKzE2NTIsOCBAQCBzdGF0aWMg
aW50IF9faXNzdWVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ICAgICAg
ICAgc3RydWN0IGRpc2NhcmRfY21kICpkYywgKnRtcDsKPiAgICAgICAgIHN0cnVjdCBibGtfcGx1
ZyBwbHVnOwo+ICAgICAgICAgaW50IGksIGlzc3VlZDsKPiArICAgICAgIGludCBwbGlzdF9udW0g
PSBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpID8KPiArICAgICAgICAgICAgICAgTUFYX1BMSVNU
X05VTSArIFpPTkVfUExJU1RfTlVNIDogTUFYX1BMSVNUX05VTTsKPiAgICAgICAgIGJvb2wgaW9f
aW50ZXJydXB0ZWQgPSBmYWxzZTsKPgo+ICAgICAgICAgaWYgKGRwb2xpY3ktPnRpbWVvdXQpCj4g
QEAgLTE2NTYsMTIgKzE2NjEsMTIgQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPgo+ICByZXRyeToKPiAgICAgICAgIGlzc3VlZCA9IDA7
Cj4gLSAgICAgICBmb3IgKGkgPSBNQVhfUExJU1RfTlVNIC0gMTsgaSA+PSAwOyBpLS0pIHsKPiAr
ICAgICAgIGZvciAoaSA9IHBsaXN0X251bSAtIDE7IGkgPj0gMDsgaS0tKSB7Cj4gICAgICAgICAg
ICAgICAgIGlmIChkcG9saWN5LT50aW1lb3V0ICYmCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmMmZzX3RpbWVfb3ZlcihzYmksIFVNT1VOVF9ESVNDQVJEX1RJTUVPVVQpKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gLSAgICAgICAgICAgICAgIGlmIChpICsg
MSA8IGRwb2xpY3ktPmdyYW51bGFyaXR5KQo+ICsgICAgICAgICAgICAgICBpZiAoaSArIDEgPCBk
cG9saWN5LT5ncmFudWxhcml0eSAmJiBpICsgMSAhPSBwbGlzdF9udW0pCgpUbyBtZSwgdGhpcyBw
YXJ0IGlzIGtpbmQgb2YgYSBoYWNrLCBzaW5jZSBpdCBqdXN0IHNraXBzIGNoZWNraW5nCmdyYW51
bGFyaXR5IGZvciB0aGUgbGFyZ2VzdCBwZW5kaW5nIGxpc3QuCkl0IG1pZ2h0IG5vdCB3b3JrIGZv
ciBjb252ZW50aW9uYWwgZGV2aWNlcy4gVGhlIGZ1bmRhbWVudGFsIHByb2JsZW0gaXMKdGhlIGN1
cnJlbnQgcGVuZF9saXN0IGRvZXNuJ3QKd29yayB3aXRoIHpvbmVkIGRldmljZXMgbm93LiBTbywg
SSB0aGluayB3ZSBuZWVkIGEgbmV3IGRlc2lnbiBjb3ZlcmluZwp6b25lZCBkZXZpY2VzIGZvciBk
aXNjYXJkCnN1Y2ggYXMgdXNpbmcgYW5vdGhlciBkaXNjYXJkIHBlbmRpbmcgbGlzdCBmb3Igem9u
ZWQgZGV2aWNlcyBhbmQKY29udHJvbGxpbmcgaXQgaW4gYSBkaWZmZXJlbnQgd2F5LgpUaGFua3Mg
Zm9yIGxldHRpbmcgbWUga25vdyBhYm91dCB0aGlzIGlzc3VlLiBJIHdpbGwgY29tZSB1cCB3aXRo
IGEgbmV3CmRpc2NhcmQgZGVzaWduIGZvciB6b25lZCBkZXZpY2VzLgoKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPgo+ICAgICAgICAgICAgICAgICBpZiAoaSArIDEgPCBkY2MtPm1h
eF9vcmRlcmVkX2Rpc2NhcmQgJiYgZHBvbGljeS0+b3JkZXJlZCkgewo+IEBAIC0xNzIwLDYgKzE3
MjUsOCBAQCBzdGF0aWMgYm9vbCBfX2Ryb3BfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQo+ICAgICAgICAgc3RydWN0IGxpc3RfaGVhZCAqcGVuZF9saXN0Owo+ICAgICAgICAg
c3RydWN0IGRpc2NhcmRfY21kICpkYywgKnRtcDsKPiAgICAgICAgIGludCBpOwo+ICsgICAgICAg
aW50IHBsaXN0X251bSA9IGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgPwo+ICsgICAgICAgICAg
ICAgICBNQVhfUExJU1RfTlVNICsgWk9ORV9QTElTVF9OVU0gOiBNQVhfUExJU1RfTlVNOwo+ICAg
ICAgICAgYm9vbCBkcm9wcGVkID0gZmFsc2U7Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJmRjYy0+
Y21kX2xvY2spOwo+IEBAIC0yMzA1LDcgKzIzMTIsNyBAQCBpbnQgZjJmc19zdGFydF9kaXNjYXJk
X3RocmVhZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gIHN0YXRpYyBpbnQgY3JlYXRlX2Rp
c2NhcmRfY21kX2NvbnRyb2woc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICB7Cj4gICAgICAg
ICBzdHJ1Y3QgZGlzY2FyZF9jbWRfY29udHJvbCAqZGNjOwo+IC0gICAgICAgaW50IGVyciA9IDAs
IGk7Cj4gKyAgICAgICBpbnQgZXJyID0gMCwgaSwgcGxpc3RfbnVtOwo+Cj4gICAgICAgICBpZiAo
U01fSShzYmkpLT5kY2NfaW5mbykgewo+ICAgICAgICAgICAgICAgICBkY2MgPSBTTV9JKHNiaSkt
PmRjY19pbmZvOwo+IEBAIC0yMzE2LDcgKzIzMjMsOSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9kaXNj
YXJkX2NtZF9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgIGlmICgh
ZGNjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPgo+IC0gICAgICAgZGNjLT5k
aXNjYXJkX2lvX2F3YXJlX2dyYW4gPSBNQVhfUExJU1RfTlVNOwo+ICsgICAgICAgcGxpc3RfbnVt
ID0gZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSA/Cj4gKyAgICAgICAgICAgICAgIE1BWF9QTElT
VF9OVU0gKyBaT05FX1BMSVNUX05VTSA6IE1BWF9QTElTVF9OVU07Cj4gKyAgICAgICBkY2MtPmRp
c2NhcmRfaW9fYXdhcmVfZ3JhbiA9IHBsaXN0X251bTsKPiAgICAgICAgIGRjYy0+ZGlzY2FyZF9n
cmFudWxhcml0eSA9IERFRkFVTFRfRElTQ0FSRF9HUkFOVUxBUklUWTsKPiAgICAgICAgIGRjYy0+
bWF4X29yZGVyZWRfZGlzY2FyZCA9IERFRkFVTFRfTUFYX09SREVSRURfRElTQ0FSRF9HUkFOVUxB
UklUWTsKPiAgICAgICAgIGRjYy0+ZGlzY2FyZF9pb19hd2FyZSA9IERQT0xJQ1lfSU9fQVdBUkVf
RU5BQkxFOwo+IEBAIC0yMzI2LDcgKzIzMzUsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9kaXNjYXJk
X2NtZF9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgICAgICAgICAg
ZGNjLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gQkxLU19QRVJfU0VDKHNiaSk7Cj4KPiAgICAgICAg
IElOSVRfTElTVF9IRUFEKCZkY2MtPmVudHJ5X2xpc3QpOwo+IC0gICAgICAgZm9yIChpID0gMDsg
aSA8IE1BWF9QTElTVF9OVU07IGkrKykKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBwbGlzdF9u
dW07IGkrKykKPiAgICAgICAgICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmRjYy0+cGVuZF9saXN0
W2ldKTsKPiAgICAgICAgIElOSVRfTElTVF9IRUFEKCZkY2MtPndhaXRfbGlzdCk7Cj4gICAgICAg
ICBJTklUX0xJU1RfSEVBRCgmZGNjLT5mc3RyaW1fbGlzdCk7Cj4gLS0KPiAyLjI1LjEKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
