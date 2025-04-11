Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A301A8530B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 07:27:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u36uq-0004Qy-H6;
	Fri, 11 Apr 2025 05:27:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u36un-0004Qp-7F
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 05:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FlTO3BrAl8w0Pd/JiU4SiP1E1qPBO8hiEfe/fMwfV4=; b=T1c4RPj446aUoBsa+knRlqlqOq
 woP8xR1TkUWWlzzfM1TrDsUtnyco7zQ97mjRL3Mq2xsEmtAiFrPhorjyu84QLiff7OWAyP4uKhnAU
 5E5WlN848bQcmWs/GHUhbLJmmYGO+lrQam2/lo8OfmnTVMO3gBNDu6Nvt0EPvtpA7yjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0FlTO3BrAl8w0Pd/JiU4SiP1E1qPBO8hiEfe/fMwfV4=; b=mQ3fmjGR+bqqASaoXgVTQMMTsM
 Qe+twUpzbDCasnD+fdSiVgBURlMWbpZnzkbnDSRiA4ZAgoqIZmG0s8kLqZjhGeRpGNqCCUuq3sNgp
 Ts13kLeYKhxNpMhEVMmfyVh+raM01Knr5MOGs2TQ3z9Vga4rVS5kkAFOBKVl/IshK+KM=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u36uY-00030r-2Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 05:26:57 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so302296466b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 22:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744349195; x=1744953995; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FlTO3BrAl8w0Pd/JiU4SiP1E1qPBO8hiEfe/fMwfV4=;
 b=Ust+fnjJ5dexD3lgTGONpcNxz/8uUAnI9F/Ia13nOw7BpjbCTbG3bi6I7nooSKYlcC
 nczpLJcXJft0d293gG23Vcz5cnBFtpbhhuCzs7nnnDNMadd/+tTlCyI2hMMplxXcXPjV
 JXDZR90vuH/yLsJdLUi3AxU2uf2oDfJkGbIoPqsdtVHgZU4u7l/I+amkgU1BHXg2P3Ra
 XggLuTD3zqEwEqb/cdHGiqXCdgfzsU+HHoG8MqpI9E+Xlw3ylkjtu8FtiQXqkFs8CfzG
 58hOQjo/3qrFm+/6lY0DHWq1Z+Fe63xhLTFcVfTZOtW7UjrEei26puzscx7wJHqxRqwC
 bn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744349195; x=1744953995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FlTO3BrAl8w0Pd/JiU4SiP1E1qPBO8hiEfe/fMwfV4=;
 b=tiutSeqxL5cP5G110rYoDSWnM2ZLrpgIYCZE1JrPsTfFVTPHpl8qmJIzzParmM5g50
 FMUEXdpyTjSbOFC/rjOJplWoVVR4w2NhUMQlRry3cF1I9LFZ5XOTFGImlwsdO9wf/CM6
 41q2ywk3Fkt+J32k/KwKIPuNUB9zcON3+BmM8OW9+/wlI0rsJOq+LFii8rqjd8QNDeuQ
 qhvDLGVV3deDZOfV9Ir4h+WeBf3daI9MrOXWX+d+7g0deCuJW+8hnboj3Zpp6ET0D7vg
 eNdu+B0K92q6WNjzsS92G+SR9lnkRr9jpZr081Stjm9mplfzjkuULr7BO+wk1GeH142P
 D+DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXplrkEjhLyZcwIyxyzPDe0/gqqGn3Udk0SkoDRtU0e+55m1HjLErIw42+MVzICCtXu130/N736an9WiPYVldD6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzG6SV5Yh5/ZlnzOVWWSCoBKEjn/Uc9MdeMrkUiUb6NU87FZb9S
 e2Jpnk7zroLPLhZ58UWCbiQlSmtWXGOaWzrox6TVz76no0cP6ehBno/9z+gebsk6lO0tf9C0hPn
 L+8r6dgjiMVAycYvCyxUJflyUyGA=
X-Gm-Gg: ASbGncsiAcUJUo3V00u1A626aE8Bqxymrtgm00J8EjBUWOg8SAFvUB9yhwMVN9tF+lr
 udE1nNjAGm0hMfYW7cE2ZYlDeXl+CZm0UjRBYMeCTM9L72exU4xmwWDZ8rFAhE8wvPTPfxM8PWf
 qMqI7YFmcPO4/+tsfUYrJzSvY=
X-Google-Smtp-Source: AGHT+IEASdiusp7Y8l3iuDSbz0ccfKbH+mECiBzb/VyVdILO1aY7an3gXbbandpCo3bMp2F4Vw9xnL/aDnBRmOwW3+Q=
X-Received: by 2002:a17:907:7ea5:b0:ac2:b1e2:4b85 with SMTP id
 a640c23a62f3a-acad3456e28mr117030866b.3.1744349195079; Thu, 10 Apr 2025
 22:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
 <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
In-Reply-To: <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Thu, 10 Apr 2025 22:26:23 -0700
X-Gm-Features: ATxdqUEFb7xep7SvPzX8mLIRJbIy4uvB9JzxwgbKb0vFkMGbql45vDPoMHKef_k
Message-ID: <CAD14+f06qKLefutNfLFRC4ZbJ2wcn0r1TL3Qx95B14u-XokyZQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao. Good news! It appears that by some miracle, @uplinkr
 managed to dodge all odds: 1. gparted did not perform shrink as they didn't
 write the fool-proof shrink size calculation code yet 2. The new location
 within t [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.47 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.47 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u36uY-00030r-2Z
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhby4KCkdvb2QgbmV3cyEKCkl0IGFwcGVhcnMgdGhhdCBieSBzb21lIG1pcmFjbGUsIEB1
cGxpbmtyIG1hbmFnZWQgdG8gZG9kZ2UgYWxsIG9kZHM6CjEuIGdwYXJ0ZWQgZGlkIG5vdCBwZXJm
b3JtIHNocmluayBhcyB0aGV5IGRpZG4ndCB3cml0ZSB0aGUgZm9vbC1wcm9vZgpzaHJpbmsgc2l6
ZSBjYWxjdWxhdGlvbiBjb2RlIHlldAoyLiBUaGUgbmV3IGxvY2F0aW9uIHdpdGhpbiB0aGUgcGFy
dGl0aW9uIHRhYmxlIGRpZCBub3Qgb3ZlcmxhcCB3aXRoCnRoZSBvbGQgcGFydGl0aW9uCjMuIFRo
ZSBmYXVsdHkgZnNjayBydW4gZGlkIG5vdCB0b3VjaCB0aGUgb2xkIHBhcnRpdGlvbidzIGFyZWEK
CldlIG1hbmFnZWQgdG8gZ2V0IHRoZSBvbGRlciBwYXJ0aXRpb24ncyBsb2NhdGlvbiB2aWEgdGVz
dGRpc2sgKHdoaWNoCmxvb2tzIGZvciBmMmZzIG1hZ2ljIGNvZGUpIGFuZCByZXN0b3JlIHRoZSBl
bnRpcmUgcGFydGl0aW9uLgoKSSBpbnNpc3RlZCB0aGF0IGhlIHVzZSB0aGlzIG9wcG9ydHVuaXR5
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgaW4gYQpzYWZlIGZhc2hpb24sIGNvbW11bmljYXRlIHdp
dGggdXBzdHJlYW0gYW5kIG1ha2Ugc3VyZSBubyBvbmUgZWxzZSBoYXMKdG8gZ28gdGhyb3VnaCB0
aGUgc2FtZSB0aGluZyAoYWZ0ZXIgYSBmdWxsIGJhY2t1cCwgb2J2aW91c2x5KS4KCkknbGwgd2Fs
ayBoaW0gdGhyb3VnaCBzZXR0aW5nIHVwIGEgZG0tc25hcHNob3QgYW5kIGdhdGhlciB0aGUKaW5p
dGlhbC9wcm9wZXIgcmVzaXplLCBtb3VudCwgZnNjayBsb2cgYWZ0ZXIgdGhlIGJhY2t1cC4KCk9u
ZSB0aGluZyB0byBub3RlIGhlcmUgaXMgdGhhdCBoZSBzYWlkIHRoYXQgdGhlIHV0aWxpemF0aW9u
IHdhcyB2ZXJ5CmZ1bGw6IG9ubHkgOEcgbGVmdC4gTWF5YmUgdGhpcyBpcyB0aGUgY29ybmVyIGNh
c2UgdGhhdCB3ZSBuZWVkIHRvIGxvb2sKb3V0IGZvcj8KClRoYW5rcywKCk9uIFRodSwgQXByIDEw
LCAyMDI1IGF0IDEyOjE34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPgo+
IE9uIDQvMTAvMjUgMTQ6MTksIHVwbGlua3JAYWlybWFpbC5jYyB3cm90ZToKPiA+IE9uIDIwMjUt
MDQtMTAgMDg6NTIsIENoYW8gWXUgd3JvdGU6Cj4gPj4gSSBjaGVja2VkIHRoZSBsb2csIEkgZ3Vl
c3MgaXQgYWN0dWFsbHkgc2VlbXMgcHJldHR5IGJhZC4uLiBJIGd1ZXNzIHdlCj4gPj4gbmVlZCB0
byBmaW5kIG91dCB0aG9zZSBmaWxlIHdoaWNoIGhhcyBub3QgYmVlbiBtaWdyYXRlZCBjb3JyZWN0
bHksIGFuZAo+ID4+IHRyeSB0byBjb3JyZWN0IHRoZW0sIG1heSBiZSB3LyBhIG5ldyB0b29sLgo+
ID4KPiA+IEhlbGxvLAo+ID4KPiA+IFRoZSBpc3N1ZSBpcyB0aGUgY29ycnVwdCBwYXJ0aXRpb24g
aW4gcXVlc3Rpb24gY29udGFpbnMgYSBsb3Qgb2YgdW5iYWNrdXBwZWQsIHZhbHVhYmxlIGRhdGEg
Zm9yIG1lLiBJIHdhc24ndCBhd2FyZSBvciBpbmZvcm1lZCBvZiB0aGUgcG90ZW50aWFsIGlzc3Vl
cyByZXNpemluZyBvbiBGMkZTIGhhcyAodGhlIEFyY2hXaWtpIGxpc3RlZCBub25lKQo+ID4gYW5k
IGFzIHN1Y2ggcmVjb3Zlcnkgb2YgdGhpcyBwYXJ0aXRpb24gaXMgYSBsaWZlbGluZSBmb3IgbWUu
Cj4KPiBTb3JyeSBhYm91dCB0aGlzLCB3ZSBzaG91bGQgZ2l2ZSBhIGV4cGxpY2l0IGNhdXRpb24g
YWJvdXQgcmVzaXplIHRvb2wKPiB1c2UuCj4KPiBCdXQgc3RpbGwgSSBkaWRuJ3QgZ2V0IHdoeSB3
ZSBjYW4gcnVuIGludG8gdGhpcyBzaXR1YXRpb24sIHNpbmNlIGFzIHlvdQo+IHNhaWQsIHJlc2l6
ZSB3ZW50IHRocm91Z2ggc3VjY2Vzc2Z1bGx5LiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgbW9y
ZQo+IGRldGFpbHMgYWJvdXQgcHJvY2VzcyBvZiByZXNpemU/IFBhcmFtZXRlcnMgZm9yIHJlc2l6
ZT8gTG9ncyB5b3Uga2VwdAo+IGR1cmluZyByZXNpemU/IGV0Yy4KPgo+ID4KPiA+IENvdWxkIHlv
dSBwbGVhc2Ugd3JpdGUgdGhpcyB0b29sIG9yIGEgcGF0Y2ggdGhhdCBJIGNhbiB0cnkgaW4gZnNj
az8KPgo+IEkgd2lsbCB0cnkgbXkgYmVzdC4KPgo+ID4KPiA+IFRoYW5rcy4KPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
