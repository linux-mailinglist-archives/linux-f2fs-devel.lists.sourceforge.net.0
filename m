Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E99FCFAF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Dec 2024 03:57:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tR0XS-0007fn-Qo;
	Fri, 27 Dec 2024 02:57:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1tR0XR-0007fd-Ho
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 02:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTX4PubuUoYyG4DxeanOHexfb39He4ZgALYQlOhIr94=; b=b5Tjs5wjcqNwt/0VkWFeZI6Q/7
 KRZyUoPHHF3H8AMU6dgNiarBNNhslMZ9A2cnnHUfAGeNkMF6uURnZHLszi68RHig7XhCPBtukBkZa
 TSLvvVvhfx99wczKedufh8iyL1I8GNB1+nM01FfK1/lfbazLAFzNoTbVkBXFpST/ifws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iTX4PubuUoYyG4DxeanOHexfb39He4ZgALYQlOhIr94=; b=fZ8DtpauW4LD/0keSGaErJNsbF
 JPWj9eYik3plz1djYGVRie1QiwfkOaIs3rOUoGV4hzW1tnINtTiXZ6SJBQivwQ276wtZy/bBk/VRM
 64Npbas8ynrVSpC2CDCdSfrpTBIY+JqyODiqA4fk1GFKugpXGC7Tr3MyOLilf/LJPdO4=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tR0XR-0002aO-LN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 02:57:22 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4679eacf2c5so62537331cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2024 18:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735268231; x=1735873031; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTX4PubuUoYyG4DxeanOHexfb39He4ZgALYQlOhIr94=;
 b=eWEY+X5IJCPJEpFS/Z0fwa0iql8qOVCzWGoM/g7IvgqIVUsb0V6Ms35D187UfDnRqF
 +RXWBdJ5k49BQYJeOjIsAZ0sY/wmyYyUufg2G8DDj9iNBqlGvF7XY5D7l0aCwMM0lfd+
 KJilSSbVlXma7Ln0/s2PamG9YG2sHUV2MAoOKlIVZGOEDECk2GgB771Cx0d953uBnWHw
 krxrNR1NwctNZeFxACGCDD+nZRcdYmNFpv0FwBsA+JUgUtOvCjSL/XBbbYyxfTmoQrlq
 m41rvS+VdfmOJp/Bhr90nrDIdGYmtQ5bG5xAC+BX2ewf5y+LnFM9Gi5rCWfOYA57Dpuk
 iKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735268231; x=1735873031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTX4PubuUoYyG4DxeanOHexfb39He4ZgALYQlOhIr94=;
 b=kchnoUKZUryuzfysBFY1kvz8IOvpyQcQEQL8x0UA08qwsoihUL4WrSdVBbOr3KScX7
 yE8Qgdr/ycgE51LHODRepaISt1kMPtYdIrTsyel6K7v0+Fm1pXNWP2sCFh+j701kiFQf
 cprjD0UIHVCfxyGIWe3jTuGsukEHAk3gkW7CogXHxkE1awRCCqjiVwMQVFOf8UyN+GPF
 aqcnXSJsaOMiCkDxyqcZVc3gyeXnfKy8qLl+sxxz339lRIwhuiz+pw9JJm/8JDWWSfOy
 2Ae+HKNhhSwsS2/w+lbP10PdqetcuQy4oTG66wf3cItwjm6HJbBYyNnL/OL/aUIH85/+
 uNPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQmYImy/hPpBG3sk/PPGKn8QNEkAE9XUotuNlrv9sDtT1tjB9FvkAbOdZtgSkFjsoTUNnQRMDPGOIYeZp5eRSD@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyor4R7/ljlOY9C+EHn1bDRgFLMqZmFo+xKq91hn7oPXOkbJ4qx
 aDpHRUbv+Mhd2TxNBpV0SifKoXKAvsVSqqZE0zcRrSdKI4+LOWrO1VZa9NIXNN0dAoefzrhi0t/
 h0iLJqj62muqQJFo0TJ6PHYni3OKJ64+C
X-Gm-Gg: ASbGncs7koYcvs0HrjqtUvzfbE05X0zTQ6ceDvT8oaqrWOpjn0PcafLcZiv2AuaOC39
 GevE498aDzMEHxb0JwalpaQLSsFmF19Ww83yfYJk=
X-Google-Smtp-Source: AGHT+IHX83lrW2Lez+dEfixwMu46pTfNIowVzGSBhIA665JdK2J9/tcqm63q2OYkW/xY7hIfMYneJbF7pViWEHovbLI=
X-Received: by 2002:a05:622a:18a3:b0:466:aad5:2161 with SMTP id
 d75a77b69052e-46a4a9a2b49mr365783731cf.54.1735268230694; Thu, 26 Dec 2024
 18:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20241224114621.1220350-1-zangyangyang1@xiaomi.com>
 <f49a164f-45fc-4c4a-8e71-019922b68968@kernel.org>
In-Reply-To: <f49a164f-45fc-4c4a-8e71-019922b68968@kernel.org>
From: =?UTF-8?B?6Ien6Ziz6Ziz?= <zangyangyang66@gmail.com>
Date: Fri, 27 Dec 2024 10:56:59 +0800
X-Gm-Features: AbW1kvYVEc5XPwLZvM63KBYIGHfg4jH2GZkmvT0X1fCACOEV17bhMop0X35i_Rw
Message-ID: <CAEJnjmwA2yL3f7BcOwhnX1i1DgCHumgFDxMqYk-DK0trriFSZQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2024年12月26日周四 21:32写道：
    > > On 2024/12/24 19:46, zangyangyang1 via Linux-f2fs-devel wrote: > > When
    f2fs_write_single_data_page fails, f2fs_write_cache [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.174 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [zangyangyang66[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.160.174 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.160.174 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [zangyangyang66[at]gmail.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.174 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tR0XR-0002aO-LN
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix using wrong 'submitted' value in
 f2fs_write_cache_pages
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
Cc: jaegeuk@kernel.org, zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjTlubQxMuaciDI25pel5ZGo5ZubIDIxOjMy5YaZ6YGT77yaCj4K
PiBPbiAyMDI0LzEyLzI0IDE5OjQ2LCB6YW5neWFuZ3lhbmcxIHZpYSBMaW51eC1mMmZzLWRldmVs
IHdyb3RlOgo+ID4gV2hlbiBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UgZmFpbHMsIGYyZnNf
d3JpdGVfY2FjaGVfcGFnZXMKPiA+IHdpbGwgdXNlIHRoZSBsYXN0ICdzdWJtaXR0ZWQnIHZhbHVl
IGluY29ycmVjdGx5LCB3aGljaCB3aWxsIGNhdXNlCj4gPiAnbndyaXR0ZW4nIGFuZCAnd2JjLT5u
cl90b193cml0ZScgY2FsY3VsYXRpb24gZXJyb3JzCj4gID4gPiBTaWduZWQtb2ZmLWJ5OiB6YW5n
eWFuZ3lhbmcxIDx6YW5neWFuZ3lhbmcxQHhpYW9taS5jb20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJm
cy9kYXRhLmMgfCAxICsKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4
IDk0ZjdiMDg0ZjYwMS4uMDgzYWNkN2Y1NDIwIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRh
LmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBAQCAtMzE3OSw2ICszMTc5LDcgQEAgc3Rh
dGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBw
aW5nLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAjZW5kaWYKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHN1Ym1pdHRlZCA9IDA7Cj4KPiBIb3cgYWJvdXQgaW5pdGlhbGl6aW5nICJzdWJt
aXR0ZWQiIGluIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSgpCj4gdG8gY292ZXIgYWxsIGNh
c2VzIGluIHdoZXJlIHdlIGNhbGwgZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKCk/CkhpLCBN
eSBmaXJzdCBjaGFuZ2Ugd2FzIGluIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSgpLCBidXQg
dGhhdAphZGRlZCB0d28gbGluZXMgb2YgY29kZSwKc28gSSBwdXQgdGhlIGNoYW5nZSBpbiBmMmZz
X3dyaXRlX2NhY2hlX3BhZ2VzKCksIGJ1dCBJIGZvcmdvdCB0aGF0CmNvbXByZXNzaW9uIGFsc28K
Y2FsbHMgZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKCksIEkgd2lsbCBmaXggaXQuClRoYW5r
cywKPiBUaGFua3MsCj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBmMmZzX3dy
aXRlX3NpbmdsZV9kYXRhX3BhZ2UoZm9saW8sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZzdWJtaXR0ZWQsICZiaW8sICZsYXN0X2Jsb2NrLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3YmMsIGlvX3R5cGUsIDAsIHRydWUp
Owo+ID4gLS0KPiA+IDIuNDMuMgo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
