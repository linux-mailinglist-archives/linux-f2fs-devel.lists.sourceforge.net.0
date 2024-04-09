Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF489DD08
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 16:42:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruCg1-0000wh-0R;
	Tue, 09 Apr 2024 14:42:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ruCfy-0000wR-Ko
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 14:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IBPxWFHl1AiWVB8UI+LeFpQ0i9dZV3ja6KQ3kYMVIr8=; b=ZiN41K82+rckjyTaP9dmElYOFN
 KCgaRd25yOPyEmMZpyl2O/fwUHiUI5Rw8fXDXw7Kze/JMX08aI8B4IGXdIF31YqFfNgZuAm452keo
 QvSKTmA67xqsi0TPgbVbKj5SpU3LWOC3546VTbxc1zqu5pbd3lDuEwLAuMRu1QGAnwOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IBPxWFHl1AiWVB8UI+LeFpQ0i9dZV3ja6KQ3kYMVIr8=; b=OrdO+MkJsgvVh88qXAiOg+P5ar
 qbdN81FFxRcho73q3PNb0fd44VLacO9r6NwoPjj+LyPFsUE8YdR+oZ1uLc9RNxaCWlOMx11xNRKaJ
 XTBaqHKeBMSQMQj0zJoSPaecx60RwQS0RhmdnsrcCGdOWhz7iiEy+PdlE7ez2qvpydbs=;
Received: from mail-vs1-f50.google.com ([209.85.217.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruCfw-0005FO-Fo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 14:42:19 +0000
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-479ef9db155so1270656137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Apr 2024 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712673720; x=1713278520; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBPxWFHl1AiWVB8UI+LeFpQ0i9dZV3ja6KQ3kYMVIr8=;
 b=VcYiNEuSty1lZEeaQENgh3BOnfP2P7Nwq840btQB3zE0s+BR5lKRDQMhoUUK9Sb/cX
 9FTdlFCxyMVAk/uqlJMB0Utmf9vXGzfjDUH05OcZBIazMPisC8/7vWnhcbgWOqZeANFG
 5+ty7/sIH4gKqlz2vnrdEebhgJFy87a5Ca/N/+cEBNcTYXLU1hcjDLi2FzIB+QoSjokE
 8tMBtsTM+Frtj1qN+1Y9ljVlYyDJfWlax1+Pp1KWWGnwyIJNPGH23UMlRvn8I75JLexp
 nxIoPda7e5eu8rpBP2f19zT74H0qeeNICjnY+T2V2S9lHvcQH7VdCmZ8L0GYeVwWcuX2
 3t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712673720; x=1713278520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBPxWFHl1AiWVB8UI+LeFpQ0i9dZV3ja6KQ3kYMVIr8=;
 b=h+fogC8PhoJmuan6R3+xLih/v+U6/btWmyWrVXgDI39nZFETUtIHJgMpCQOZ4I7uQA
 aJfHvESEsh0S/Ign4PQiOubcDDcr5A/tiv1OSf5NlQBh7Tp46b62Ig9FmZcigX7g1PF3
 1dXt9Se0O8h43+VdkS/mSTEy30v/fq0bAFt2nU2+xrQ3CwglSI3XEOck9SViNo546/g3
 sq14T/NmzbpeBagoFlKCHBWKyRtlij0jq0VOFX81m5L2c7merk1RD+REsxifp/P7+RWv
 8TOsWZDyYoQEY8vYsgKParAqX6zqTWub5s7tyNxGiEPjE+gXP1N2qBzromAwzcysXsWx
 5qlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzrK4pxSVGdPVV5+6EgvlLFN+rONCn0BXRBLu/64WTgKZzq5LWJHQM9mt89ZMVpvvN99WhloYzCegiHz2+fknWC1P9xhNbWkO0JH6TnQd0tXeNU1a5pg==
X-Gm-Message-State: AOJu0Yw/Tn4tYv6gVH33jYT/KpeMCAFWl0jTNyMe5P49I+VuevRr/ORn
 uVp2VDMKA0j8a5Q7PaWFaTB9zFRAkf00YKuAa1/Mg/mmdzDTI4mpeZmaxKlAxwtYahjNlI59UKy
 14yiytQvAnWl2DoSB5cQt5M/Txkk=
X-Google-Smtp-Source: AGHT+IHbyNQhlUoN0P903X2xsmHoLT6gRckaiuzHxU42vZAdz4IEjESKJ3IHBMxz17WuucojBcnvql3hz3d1QoxWFv4=
X-Received: by 2002:a05:6102:6c7:b0:47a:1005:ca15 with SMTP id
 m7-20020a05610206c700b0047a1005ca15mr3911038vsg.16.1712673720180; Tue, 09 Apr
 2024 07:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240404195254.556896-1-jaegeuk@kernel.org>
In-Reply-To: <20240404195254.556896-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 9 Apr 2024 07:41:47 -0700
Message-ID: <CACOAw_zwwPDfnQpWEJ7ej2FAGGBoQW7H8NcdWOutB3fHpOibew@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Apr 4, 2024 at 12:54 PM Jaegeuk Kim wrote: > > Shutdown
    does not check the error of thaw_super due to readonly, which > causes a
   deadlock like below. > > f2fs_ioc_shutdown(F2FS_GOING_DOWN_ [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ruCfw-0005FO-Fo
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set RO when shutting down f2fs
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCAxMjo1NOKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gU2h1dGRvd24gZG9lcyBub3QgY2hlY2sgdGhlIGVycm9yIG9m
IHRoYXdfc3VwZXIgZHVlIHRvIHJlYWRvbmx5LCB3aGljaAo+IGNhdXNlcyBhIGRlYWRsb2NrIGxp
a2UgYmVsb3cuCj4KPiBmMmZzX2lvY19zaHV0ZG93bihGMkZTX0dPSU5HX0RPV05fRlVMTFNZTkMp
ICAgICAgICBpc3N1ZV9kaXNjYXJkX3RocmVhZAo+ICAtIGJkZXZfZnJlZXplCj4gICAtIGZyZWV6
ZV9zdXBlcgo+ICAtIGYyZnNfc3RvcF9jaGVja3BvaW50KCkKPiAgIC0gZjJmc19oYW5kbGVfY3Jp
dGljYWxfZXJyb3IgICAgICAgICAgICAgICAgICAgICAtIHNiX3N0YXJ0X3dyaXRlCj4gICAgIC0g
c2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHdhaXRpbmcK
PiAgLSBiZGV2X3RoYXcKPiAgIC0gdGhhd19zdXBlcl9sb2NrZWQKPiAgICAgLSByZXR1cm4gLUVJ
TlZBTCwgaWYgc2JfcmRvbmx5KCkKPiAgLSBmMmZzX3N0b3BfZGlzY2FyZF90aHJlYWQKPiAgIC0+
IHdhaXQgZm9yIGt0aHJlYWRfc3RvcChkaXNjYXJkX3RocmVhZCk7Cj4KPiBSZXBvcnRlZC1ieTog
IkxpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIiA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZz
L2YyZnMvc3VwZXIuYyB8IDExICsrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5j
IGIvZnMvZjJmcy9zdXBlci5jCj4gaW5kZXggZGY5NzY1YjQxZGFjLi5iYTYyODhlODcwYzUgMTAw
NjQ0Cj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAg
LTQxMzUsOSArNDEzNSwxNiBAQCB2b2lkIGYyZnNfaGFuZGxlX2NyaXRpY2FsX2Vycm9yKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgY2hhciByZWFzb24sCj4gICAgICAgICBpZiAo
c2h1dGRvd24pCj4gICAgICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9JU19TSFVU
RE9XTik7Cj4KPiAtICAgICAgIC8qIGNvbnRpbnVlIGZpbGVzeXN0ZW0gb3BlcmF0b3JzIGlmIGVy
cm9ycz1jb250aW51ZSAqLwo+IC0gICAgICAgaWYgKGNvbnRpbnVlX2ZzIHx8IGYyZnNfcmVhZG9u
bHkoc2IpKQo+ICsgICAgICAgLyoKPiArICAgICAgICAqIENvbnRpbnVlIGZpbGVzeXN0ZW0gb3Bl
cmF0b3JzIGlmIGVycm9ycz1jb250aW51ZS4gU2hvdWxkIG5vdCBzZXQKPiArICAgICAgICAqIFJP
IGJ5IHNodXRkb3duLCBzaW5jZSBSTyBieXBhc3NlcyB0aGF3X3N1cGVyIHdoaWNoIGNhbiBoYW5n
IHRoZQo+ICsgICAgICAgICogc3lzdGVtLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoY29u
dGludWVfZnMgfHwgZjJmc19yZWFkb25seShzYikgfHwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlYXNvbiA9PSBTVE9QX0NQX1JFQVNPTl9TSFVURE9XTikgewoKSSB0aGluayB3
ZSBjYW4gdXNlICJzaHV0ZG93biIgdmFyaWFibGUgaW5zdGVhZCBvZiAicmVhc29uID09ClNUT1Bf
Q1BfUkVBU09OX1NIVVRET1dOIiB0byBiZSBjb25jaXNlLgoKPiArICAgICAgICAgICAgICAgZjJm
c193YXJuKHNiaSwgIlN0b3BwZWQgZmlsZXN5c3RlbSBkdWUgdG8gcmVhZG9uOiAlZCIsIHJlYXNv
bik7CgpyZWFkb24gLT4gcmVhc29uPwoKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAg
ICAgfQo+Cj4gICAgICAgICBmMmZzX3dhcm4oc2JpLCAiUmVtb3VudGluZyBmaWxlc3lzdGVtIHJl
YWQtb25seSIpOwo+ICAgICAgICAgLyoKPiAtLQo+IDIuNDQuMC40NzguZ2Q5MjYzOTllZjktZ29v
Zwo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
