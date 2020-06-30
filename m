Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0120FDE4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 22:44:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqN6n-0003Zf-GZ; Tue, 30 Jun 2020 20:44:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <natechancellor@gmail.com>) id 1jqN6m-0003ZJ-AH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2xmefk2RteGTnbCye5bI/kRpYMG9zcRY+jbKjm732i0=; b=hVyaAzFQq2cSjytjUXASe0DqjW
 cdXHcL3MOZkgym8jAbLqlaFWzXqKUR01OA4/Zb/rx/KCf1xcvJsVJJLxdTTOXh1ShLkqbfUJMt68m
 D+xS4asdwlRQksfbxv7h7fJldEO0PWiZ6GMtM2/LYp2tj/ebz+PcEQWoTxaz+xG6vUbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2xmefk2RteGTnbCye5bI/kRpYMG9zcRY+jbKjm732i0=; b=GSOnAHkpdGfdPnH0GqlrFK/ykZ
 qreBDy0ceopCk7rbiL0crqEhvCoEvArbtFoNWy/HhxO3l9+O52CMR46XQA+NIo9UxfBET2g3JC+1D
 WPKPt2bciJbf9aQITWouZ8Dex4jsq4FlWiqRqK4ejmanAZI4NJEa5RLImy4jmNWeG2Uo=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqN6h-003U50-Tt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:44:00 +0000
Received: by mail-pj1-f67.google.com with SMTP id cm21so668880pjb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2020 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2xmefk2RteGTnbCye5bI/kRpYMG9zcRY+jbKjm732i0=;
 b=oWxbFf0dWEbKgf1ijqpkDLiaARpUgLO8Yms473N+ftU2hDK0S7Sg+q1MAZbJrbqDwl
 jRk2EiiRBLa7Fpj/uVMGQYoaEVbAfTXeZIPTdL/EzyFcaSvbMX1/WphEUbAfY55+YDPH
 wW4P7EuEl7iVQRhv6g3EadgIvwbFLfBY7ChCox/euQHzbuVk3hFGuXFCte+KLZZvZJd3
 hByPirK0qMX9hPHHHtvniYveX8u+MFuE96iCRhrnGQUAqXP8jfUASfvJdIjePM9Uplb4
 sU7nkYBxfpxH20++z8JHxiWwovrmTmEMXjPOZa7ywL45+LN29uFh+jEvjZ8zt54IL30V
 A5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2xmefk2RteGTnbCye5bI/kRpYMG9zcRY+jbKjm732i0=;
 b=T98AdxRYtBDHxKcAfAAe4yzFfcSANl6XxDrMRx3tgbMp8MKBp4CHeKlz3RPN8VZdcP
 Tl/7iiOxXMd/DYZdyf6vkoBCkp9FSS5AGQeslzU6yxYiBH8Oc/159uE5nlPYcg8p/hbl
 ZX5KVBiQ4TFymWHd54hJTtTmPfJ1bJSufTdBdgCXI/UAzT7L0lzdYsaaLE7+j1Iepi+5
 rAzBOdqNFY2wz6w8aRCuA/SskhDfkqFWRKo6ZBHGMueGhGSSsM9Ibhjm3iK51ZW8QXIq
 yonpkXicMoBANimQsVk1BWvAiEFWVfZVy/O/pYPNY1v3T32apOAIqLGuNLC7DtpGzu5Q
 1E1g==
X-Gm-Message-State: AOAM532Q3vtIwFEIvwOIKqrauYzY6YUksVYswBOKWHKDb9qkzXc1KJbX
 qWrn5aGCgt3llTHt2gDiJvw=
X-Google-Smtp-Source: ABdhPJyp+Ru6ZTl+M+JBG/QDbjnICiMjZXWHbVDoVlJcwTyylQKOvHvvsr3TjHrICMJ6rQMGQTc6lQ==
X-Received: by 2002:a17:90a:fd12:: with SMTP id
 cv18mr17159212pjb.66.1593549830267; 
 Tue, 30 Jun 2020 13:43:50 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:1000:7a00::1])
 by smtp.gmail.com with ESMTPSA id ia13sm3047342pjb.42.2020.06.30.13.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:43:49 -0700 (PDT)
Date: Tue, 30 Jun 2020 13:43:48 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com>
 <20200629202720.GA230664@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629202720.GA230664@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (natechancellor[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jqN6h-003U50-Tt
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid readahead race condition
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMDE6Mjc6MjBQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gSWYgdHdvIHJlYWRhaGVhZCB0aHJlYWRzIGhhdmluZyBzYW1lIG9mZnNldCBlbnRlciBp
biByZWFkcGFnZXMsIGV2ZXJ5IHJlYWQKPiBJT3MgYXJlIHNwbGl0IGFuZCBpc3N1ZWQgdG8gdGhl
IGRpc2sgd2hpY2ggZ2l2aW5nIGxvd2VyIGJhbmR3aWR0aC4KPiAKPiBUaGlzIHBhdGNoIHRyaWVz
IHRvIGF2b2lkIHJlZHVuZGFudCByZWFkYWhlYWQgY2FsbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiAtLS0KPiB2MzoKPiAgLSB1c2UgUkVB
RHxXUklURV9PTkNFCj4gdjI6Cj4gICAtIGFkZCBtaXNzaW5nIGNvZGUgdG8gYnlwYXNzIHJlYWQK
PiAgCj4gIGZzL2YyZnMvZGF0YS5jICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICBmcy9mMmZz
L2YyZnMuaCAgfCAgMSArCj4gIGZzL2YyZnMvc3VwZXIuYyB8ICAyICsrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggOTk1Y2Y3OGIyM2M1ZS4uMzYwYjRjOTA4MGQ5NyAxMDA2
NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAgLTIy
OTYsNiArMjI5Niw3IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlu
b2RlICppbm9kZSwKPiAgCXVuc2lnbmVkIG5yX3BhZ2VzID0gcmFjID8gcmVhZGFoZWFkX2NvdW50
KHJhYykgOiAxOwo+ICAJdW5zaWduZWQgbWF4X25yX3BhZ2VzID0gbnJfcGFnZXM7Cj4gIAlpbnQg
cmV0ID0gMDsKPiArCWJvb2wgZHJvcF9yYSA9IGZhbHNlOwo+ICAKPiAgCW1hcC5tX3BibGsgPSAw
Owo+ICAJbWFwLm1fbGJsayA9IDA7Cj4gQEAgLTIzMDYsMTAgKzIzMDcsMjQgQEAgc3RhdGljIGlu
dCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAJbWFwLm1fc2Vn
X3R5cGUgPSBOT19DSEVDS19UWVBFOwo+ICAJbWFwLm1fbWF5X2NyZWF0ZSA9IGZhbHNlOwo+ICAK
PiArCS8qCj4gKwkgKiBUd28gcmVhZGFoZWFkIHRocmVhZHMgZm9yIHNhbWUgYWRkcmVzcyByYW5n
ZSBjYW4gY2F1c2UgcmFjZSBjb25kaXRpb24KPiArCSAqIHdoaWNoIGZyYWdtZW50cyBzZXF1ZW50
aWFsIHJlYWQgSU9zLiBTbyBsZXQncyBhdm9pZCBlYWNoIG90aGVyLgo+ICsJICovCj4gKwlpZiAo
cmFjICYmIHJlYWRhaGVhZF9jb3VudChyYWMpKSB7Cj4gKwkJaWYgKFJFQURfT05DRShGMkZTX0ko
aW5vZGUpLT5yYV9vZmZzZXQpID09IHJlYWRhaGVhZF9pbmRleChyYWMpKQo+ICsJCQlkcm9wX3Jh
ID0gdHJ1ZTsKPiArCQllbHNlCj4gKwkJCVdSSVRFX09OQ0UoRjJGU19JKGlub2RlKS0+cmFfb2Zm
c2V0LAo+ICsJCQkJCQlyZWFkYWhlYWRfaW5kZXgocmFjKSk7Cj4gKwl9Cj4gKwo+ICAJZm9yICg7
IG5yX3BhZ2VzOyBucl9wYWdlcy0tKSB7Cj4gIAkJaWYgKHJhYykgewo+ICAJCQlwYWdlID0gcmVh
ZGFoZWFkX3BhZ2UocmFjKTsKPiAgCQkJcHJlZmV0Y2h3KCZwYWdlLT5mbGFncyk7Cj4gKwkJCWlm
IChkcm9wX3JhKQo+ICsJCQkJZ290byBuZXh0X3BhZ2U7CgpXaGVuIENPTkZJR19GMkZTX0ZTX0NP
TVBSRVNTSU9OIGlzIG5vdCBzZXQgKGkuZS4geDg2XzY0IGRlZmNvbmZpZyArCkNPTkZJR19GMkZT
X0ZTPXkpOgoKJCBtYWtlIC1za2oiJChucHJvYykiIE89b3V0IGRpc3RjbGVhbiBkZWZjb25maWcg
ZnMvZjJmcy9kYXRhLm8KLi4vZnMvZjJmcy9kYXRhLmM6IEluIGZ1bmN0aW9uIOKAmGYyZnNfbXBh
Z2VfcmVhZHBhZ2Vz4oCZOgouLi9mcy9mMmZzL2RhdGEuYzoyMzI3OjU6IGVycm9yOiBsYWJlbCDi
gJhuZXh0X3BhZ2XigJkgdXNlZCBidXQgbm90IGRlZmluZWQKIDIzMjcgfCAgICAgZ290byBuZXh0
X3BhZ2U7CiAgICAgIHwgICAgIF5+fn4KLi4uCgpDaGVlcnMsCk5hdGhhbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
